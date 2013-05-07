from django.contrib.auth.models import User
from django.conf import settings
from django.db.models.base import Model
import ldap

class ActiveDirectoryBackend:

    def authenticate(self, request):
        username = request.POST['username']
        password = request.POST['password']

        #see if the username is in the local db
        try:
            User.objects.get(username=username)
        except Model.DoesNotExist:
            return None

        #check the username password against the AD server
        if not self.is_valid(username, password):
            return None

        return User.objects.get(username=username)

    def get_user(self, user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None

    def is_valid (self, username=None, password=None):
        ## Disallowing null or blank string as password
        if password is None or password == '':
            return False

        #check against the AD
        binddn = "%s@%s" % (username, settings.AD_NT4_DOMAIN)
        try:
            l = ldap.initialize(settings.AD_LDAP_URL)
            l.simple_bind_s(binddn, password)
            l.unbind_s()
            return True
        except ldap.LDAPError:
            return False