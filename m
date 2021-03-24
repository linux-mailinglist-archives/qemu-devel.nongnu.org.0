Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C55348521
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 00:15:33 +0100 (CET)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCiq-0001oJ-9M
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 19:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCh0-0000wG-Vw
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:13:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgx-0001sA-Vc
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616627615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lZ9enhZ6wKAf7Xjb0fpAmVanmZNsplpAds92U0dLDq8=;
 b=UPWpMCtZj2Goso+jBKBIsTXjL8v5frTBklonBc85YYGmTYK5jixRwhLhJL2ufgnsjeBFeb
 E5v+hMnBQx7gkPBbBZb8EXIIvnnX4U0DGAlp9b+jMlmYgozIRZfrx7qpC6Do82VwrKwORX
 drrLuDWUo9DnBmu3xOeT07mdVMJm578=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-9xctrJbVPwuXilVHtPcTtg-1; Wed, 24 Mar 2021 19:13:31 -0400
X-MC-Unique: 9xctrJbVPwuXilVHtPcTtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5ED107ACCA;
 Wed, 24 Mar 2021 23:13:29 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9DC6E6F5;
 Wed, 24 Mar 2021 23:13:16 +0000 (UTC)
Date: Wed, 24 Mar 2021 18:23:32 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 04/10] Acceptance Tests: move useful ssh methods to
 base class
Message-ID: <20210324222332.GB3592254@amachine.somewhere>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-5-crosa@redhat.com>
 <41f58f57-8cc5-f375-943e-0b2d298b8fbd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <41f58f57-8cc5-f375-943e-0b2d298b8fbd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eauger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 10:07:31AM +0100, Auger Eric wrote:
> Hi Cleber,
>=20
> On 3/23/21 11:15 PM, Cleber Rosa wrote:
> > Both the virtiofs submounts and the linux ssh mips malta tests
> > contains useful methods related to ssh that deserve to be made
> > available to other tests.  Let's move them to the base LinuxTest
> nit: strictly speaking they are moved to another class which is
> inherited by LinuxTest, right?
> > class.
> >=20
> > The method that helps with setting up an ssh connection will now
> > support both key and password based authentication, defaulting to key
> > based.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  tests/acceptance/avocado_qemu/__init__.py | 48 ++++++++++++++++++++++-
> >  tests/acceptance/linux_ssh_mips_malta.py  | 38 ++----------------
> >  tests/acceptance/virtiofs_submounts.py    | 37 -----------------
> >  3 files changed, 50 insertions(+), 73 deletions(-)
> >=20
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
> > index 83b1741ec8..67f75f66e5 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -20,6 +20,7 @@
> >  from avocado.utils import cloudinit
> >  from avocado.utils import datadrainer
> >  from avocado.utils import network
> > +from avocado.utils import ssh
> >  from avocado.utils import vmimage
> >  from avocado.utils.path import find_command
> > =20
> > @@ -43,6 +44,8 @@
> >  from qemu.accel import kvm_available
> >  from qemu.accel import tcg_available
> >  from qemu.machine import QEMUMachine
> > +from qemu.utils import get_info_usernet_hostfwd_port
> > +
> > =20
> >  def is_readable_executable_file(path):
> >      return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
> > @@ -253,7 +256,50 @@ def fetch_asset(self, name,
> >                          cancel_on_missing=3Dcancel_on_missing)
> > =20
> > =20
> > -class LinuxTest(Test):
> > +class LinuxSSHMixIn:
> > +    """Contains utility methods for interacting with a guest via SSH."=
""
> > +
> > +    def ssh_connect(self, username, credential, credential_is_key=3DTr=
ue):
> > +        self.ssh_logger =3D logging.getLogger('ssh')
> > +        res =3D self.vm.command('human-monitor-command',
> > +                              command_line=3D'info usernet')
> > +        port =3D get_info_usernet_hostfwd_port(res)
> > +        self.assertIsNotNone(port)
> > +        self.assertGreater(port, 0)
> > +        self.log.debug('sshd listening on port: %d', port)
> > +        if credential_is_key:
> > +            self.ssh_session =3D ssh.Session('127.0.0.1', port=3Dport,
> > +                                           user=3Dusername, key=3Dcred=
ential)
> > +        else:
> > +            self.ssh_session =3D ssh.Session('127.0.0.1', port=3Dport,
> > +                                           user=3Dusername, password=
=3Dcredential)
> > +        for i in range(10):
> > +            try:
> > +                self.ssh_session.connect()
> > +                return
> > +            except:
> > +                time.sleep(4)
> > +                pass
> > +        self.fail('ssh connection timeout')
> > +
> > +    def ssh_command(self, command):
> > +        self.ssh_logger.info(command)
> > +        result =3D self.ssh_session.cmd(command)
> > +        stdout_lines =3D [line.rstrip() for line
> > +                        in result.stdout_text.splitlines()]
> > +        for line in stdout_lines:
> > +            self.ssh_logger.info(line)
> > +        stderr_lines =3D [line.rstrip() for line
> > +                        in result.stderr_text.splitlines()]
> > +        for line in stderr_lines:
> > +            self.ssh_logger.warning(line)
> > +
> > +        self.assertEqual(result.exit_status, 0,
> > +                         f'Guest command failed: {command}')
> > +        return stdout_lines, stderr_lines
> > +
> > +
> > +class LinuxTest(Test, LinuxSSHMixIn):
> >      """Facilitates having a cloud-image Linux based available.
> > =20
> >      For tests that indend to interact with guests, this is a better ch=
oice
> > diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptanc=
e/linux_ssh_mips_malta.py
> > index 052008f02d..3f590a081f 100644
> > --- a/tests/acceptance/linux_ssh_mips_malta.py
> > +++ b/tests/acceptance/linux_ssh_mips_malta.py
> > @@ -12,7 +12,7 @@
> >  import time
> > =20
> >  from avocado import skipUnless
> > -from avocado_qemu import Test
> > +from avocado_qemu import Test, LinuxSSHMixIn
> >  from avocado_qemu import wait_for_console_pattern
> >  from avocado.utils import process
> >  from avocado.utils import archive
> > @@ -21,7 +21,7 @@
> >  from qemu.utils import get_info_usernet_hostfwd_port
> Can't you remove this now?
> > =20
> > =20

Yes, good catch!

> > -class LinuxSSH(Test):
> > +class LinuxSSH(Test, LinuxSSHMixIn):
> out of curiosity why can't it be migrated to a LinuxTest?

LinuxTest (currently) assumes that it'll boot via an image obtained
with avocado.utils.vmimage, and configured with
avocado.utils.cloudinit.  Those are not the case for this test.  I
believe there are still some opportunities for advancing them towards
each other, but LinuxTest needs to become more versatile.

> > =20
> >      timeout =3D 150 # Not for 'configure --enable-debug --enable-debug=
-tcg'
> > =20
> > @@ -72,41 +72,9 @@ def get_kernel_info(self, endianess, wordsize):
> >      def setUp(self):
> >          super(LinuxSSH, self).setUp()
> > =20
> > -    def ssh_connect(self, username, password):
> > -        self.ssh_logger =3D logging.getLogger('ssh')
> > -        res =3D self.vm.command('human-monitor-command',
> > -                              command_line=3D'info usernet')
> > -        port =3D get_info_usernet_hostfwd_port(res)
> > -        if not port:
> > -            self.cancel("Failed to retrieve SSH port")
> > -        self.log.debug("sshd listening on port:" + port)
> > -        self.ssh_session =3D ssh.Session(self.VM_IP, port=3Dint(port),
> > -                                       user=3Dusername, password=3Dpas=
sword)
> > -        for i in range(10):
> > -            try:
> > -                self.ssh_session.connect()
> > -                return
> > -            except:
> > -                time.sleep(4)
> > -                pass
> > -        self.fail("ssh connection timeout")
> > -
> >      def ssh_disconnect_vm(self):
> >          self.ssh_session.quit()
> > =20
> > -    def ssh_command(self, command, is_root=3DTrue):
> > -        self.ssh_logger.info(command)
> > -        result =3D self.ssh_session.cmd(command)
> > -        stdout_lines =3D [line.rstrip() for line
> > -                        in result.stdout_text.splitlines()]
> > -        for line in stdout_lines:
> > -            self.ssh_logger.info(line)
> > -        stderr_lines =3D [line.rstrip() for line
> > -                        in result.stderr_text.splitlines()]
> > -        for line in stderr_lines:
> > -            self.ssh_logger.warning(line)
> > -        return stdout_lines, stderr_lines
> > -
> >      def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel=
_path):
> >          image_url, image_hash =3D self.get_image_info(endianess)
> >          image_path =3D self.fetch_asset(image_url, asset_hash=3Dimage_=
hash)
> > @@ -127,7 +95,7 @@ def boot_debian_wheezy_image_and_ssh_login(self, end=
ianess, kernel_path):
> >          wait_for_console_pattern(self, console_pattern, 'Oops')
> >          self.log.info('sshd ready')
> > =20
> > -        self.ssh_connect('root', 'root')
> > +        self.ssh_connect('root', 'root', False)
> > =20
> >      def shutdown_via_ssh(self):
> >          self.ssh_command('poweroff')
> > diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/=
virtiofs_submounts.py
> > index 57a7047342..bed8ce44df 100644
> > --- a/tests/acceptance/virtiofs_submounts.py
> > +++ b/tests/acceptance/virtiofs_submounts.py
> > @@ -9,8 +9,6 @@
> >  from avocado_qemu import wait_for_console_pattern
> >  from avocado.utils import ssh
> > =20
> > -from qemu.utils import get_info_usernet_hostfwd_port
> > -
> > =20
> >  def run_cmd(args):
> >      subp =3D subprocess.Popen(args,
> > @@ -75,41 +73,6 @@ class VirtiofsSubmountsTest(LinuxTest):
> >      :avocado: tags=3Daccel:kvm
> >      """
> > =20
> > -    def ssh_connect(self, username, keyfile):
> > -        self.ssh_logger =3D logging.getLogger('ssh')
> > -        res =3D self.vm.command('human-monitor-command',
> > -                              command_line=3D'info usernet')
> > -        port =3D get_info_usernet_hostfwd_port(res)
> > -        self.assertIsNotNone(port)
> > -        self.assertGreater(port, 0)
> > -        self.log.debug('sshd listening on port: %d', port)
> > -        self.ssh_session =3D ssh.Session('127.0.0.1', port=3Dport,
> > -                                       user=3Dusername, key=3Dkeyfile)
> > -        for i in range(10):
> > -            try:
> > -                self.ssh_session.connect()
> > -                return
> > -            except:
> > -                time.sleep(4)
> > -                pass
> > -        self.fail('ssh connection timeout')
> > -
> > -    def ssh_command(self, command):
> > -        self.ssh_logger.info(command)
> > -        result =3D self.ssh_session.cmd(command)
> > -        stdout_lines =3D [line.rstrip() for line
> > -                        in result.stdout_text.splitlines()]
> > -        for line in stdout_lines:
> > -            self.ssh_logger.info(line)
> > -        stderr_lines =3D [line.rstrip() for line
> > -                        in result.stderr_text.splitlines()]
> > -        for line in stderr_lines:
> > -            self.ssh_logger.warning(line)
> > -
> > -        self.assertEqual(result.exit_status, 0,
> > -                         f'Guest command failed: {command}')
> > -        return stdout_lines, stderr_lines
> > -
> >      def run(self, args, ignore_error=3DFalse):
> >          stdout, stderr, ret =3D run_cmd(args)
> > =20
> >=20
>=20
> Besides,
>=20
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>=20
> Thanks
>=20
> Eric

Thanks for the review!

- Cleber.

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBbu+EACgkQZX6NM6Xy
CfN3XxAAqulFg/Ovlu+DLCjujftML3Aeimfzv+KmtW5cxpo4noYTjATz/zoQMFp6
srWzkwJoYixGviRXsCvmqEt+eTN5Roif0i55Q3ydY5/IeYvcNzZq77PAh2lpD/Op
cgsUBVp9O6nBvCauSEXV66xLQkc9z5ZpyF8K/CJ1M9JV202HUgR++h5yt2skG7Y2
mCt4Ny2K2dCCPGQfBB4QrOm7Dkh5yxGoSKb1nLxjJ6FGtGQlfgOhSO0bNWUo62lS
hNbP1uIcTu0IUvJwnk0dZsyiCwR4Dv34fiiz3w9vhyRf3/Xykrcxjzb6OEaX70+F
fqyjsWk86GBQ+LNOXTedvJ5JhEE0LY0UUPNtS2I8iO1jRutI2MlLrWPufY/LQmXy
eX2CZuapNKxBoLfSOc3s36D9omOk8uvQk6sVZTZKd7ftHB/oQ9RjNLurPuaZ//da
nHICT2fU9cQwzuWCBK9K0AD9J3WCNDtaEWk0t99hahTNP9urDiB3i5vIe3m3l0LP
EGK76SPFwu12HKGuyXrxfOtaTn4Ge5NvwskIRXF5MX/StVGvRhDqx1J+BKWXgztq
4YZxwg21UIZsvzpP6EGw3qsEDYl9dUiULRZW+aZI3mXVjP8sfM66UUl5u1DtUfc2
mWEjsd0H3BK48Dpyo0nv/yAOxtmd7Ezp26YpSmTMHZQaN/MyXLU=
=b0td
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--


