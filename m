Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2534853D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 00:22:35 +0100 (CET)
Received: from localhost ([::1]:59466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCpe-0006yS-G5
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 19:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgl-0000ni-3I
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:13:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgi-0001mt-U3
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616627600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EHhtUtD9EHjVT9BulpqusxzkOZ1tSu2Zg9wEhxfxmXM=;
 b=WlC0wtQJNUzLZ59MBcRzQTqCkV7COLAvQ9L4gwLwvfnZUDDN+Fjl0TwQKft+dBH+12LDan
 oDLxzpwOcX4fDkm0uJ6JRoXM/wc/C0pX27oZhiCpyTLj3fyOyqDTrSz9EWVqhuhyAaXgCx
 /r2Q4roMnnJ3orgR9LMLasumMzMdhIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-aPm1bQwcNMKwKEesQksvwQ-1; Wed, 24 Mar 2021 19:13:17 -0400
X-MC-Unique: aPm1bQwcNMKwKEesQksvwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50E50107B7CC;
 Wed, 24 Mar 2021 23:13:16 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A02319C71;
 Wed, 24 Mar 2021 23:13:06 +0000 (UTC)
Date: Wed, 24 Mar 2021 17:58:31 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH v2 03/10] Python: add utility function for retrieving
 port redirection
Message-ID: <20210324215831.GA3592254@amachine.somewhere>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-4-crosa@redhat.com>
 <CAKJDGDahSxsr7UwCtS=D97de5jDK813qXZ=UUKQyHSEQsCs_FQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKJDGDahSxsr7UwCtS=D97de5jDK813qXZ=UUKQyHSEQsCs_FQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 05:35:07PM -0300, Willian Rampazzo wrote:
> On Tue, Mar 23, 2021 at 7:16 PM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > Slightly different versions for the same utility code are currently
> > present on different locations.  This unifies them all, giving
> > preference to the version from virtiofs_submounts.py, because of the
> > last tweaks added to it.
> >
> > While at it, this adds a "qemu.utils" module to host the utility
> > function and a test.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > ---
> >  python/qemu/utils.py                     | 35 ++++++++++++++++++++++++
> >  tests/acceptance/info_usernet.py         | 29 ++++++++++++++++++++
> >  tests/acceptance/linux_ssh_mips_malta.py | 16 +++++------
> >  tests/acceptance/virtiofs_submounts.py   | 21 ++++----------
> >  tests/vm/basevm.py                       |  7 ++---
> >  5 files changed, 78 insertions(+), 30 deletions(-)
> >  create mode 100644 python/qemu/utils.py
> >  create mode 100644 tests/acceptance/info_usernet.py
> >
> > diff --git a/python/qemu/utils.py b/python/qemu/utils.py
> > new file mode 100644
> > index 0000000000..89a246ab30
> > --- /dev/null
> > +++ b/python/qemu/utils.py
> > @@ -0,0 +1,35 @@
> > +"""
> > +QEMU utility library
> > +
> > +This offers miscellaneous utility functions, which may not be easily
> > +distinguishable or numerous to be in their own module.
> > +"""
> > +
> > +# Copyright (C) 2021 Red Hat Inc.
> > +#
> > +# Authors:
> > +#  Cleber Rosa <crosa@redhat.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2.  Se=
e
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> > +import re
> > +from typing import Optional
> > +
> > +
> > +def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optiona=
l[int]:
> > +    """
> > +    Returns the port given to the hostfwd parameter via info usernet
> > +
> > +    :param info_usernet_output: output generated by hmp command "info =
usernet"
> > +    :param info_usernet_output: str
> > +    :return: the port number allocated by the hostfwd option
> > +    :rtype: int
> > +    """
> > +    for line in info_usernet_output.split('\r\n'):
> > +        regex =3D r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.'
> > +        match =3D re.search(regex, line)
> > +        if match is not None:
> > +            return int(match[1])
> > +    return None
> > diff --git a/tests/acceptance/info_usernet.py b/tests/acceptance/info_u=
sernet.py
> > new file mode 100644
> > index 0000000000..9c1fd903a0
> > --- /dev/null
> > +++ b/tests/acceptance/info_usernet.py
> > @@ -0,0 +1,29 @@
> > +# Test for the hmp command "info usernet"
> > +#
> > +# Copyright (c) 2021 Red Hat, Inc.
> > +#
> > +# Author:
> > +#  Cleber Rosa <crosa@redhat.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2 or
> > +# later.  See the COPYING file in the top-level directory.
> > +
> > +from avocado_qemu import Test
> > +
> > +from qemu.utils import get_info_usernet_hostfwd_port
> > +
> > +
> > +class InfoUsernet(Test):
> > +
> > +    def test_hostfwd(self):
> > +        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0=
.1:0-:22')
> > +        self.vm.launch()
> > +        res =3D self.vm.command('human-monitor-command',
> > +                              command_line=3D'info usernet')
>=20
> This pattern is repeated every time a test needs to call
> get_info_usernet_hostfwd_port. Do you see any downside on moving this
> line inside the function and passing self.vm as an argument? This
> would abstract the need to run info usernet before calling the
> function.
>=20

My original plan was to follow this up with a utility in QEMUMachine
itself (because that is the vm).  It can still be done, but:

 * I don't expect *tests* to be calling this often, rather a base
   class for tests;

 * I'm avoiding changing QEMUMachine too much, given it's a more
   generic class and used by other tests (iotests, vm, etc).

Hopefully when we have a better laid out structure for adding tests to
QEMUMachine itself, it'll be confortable to change it more
drastically.

> > +        port =3D get_info_usernet_hostfwd_port(res)
> > +        self.assertIsNotNone(port,
> > +                             ('"info usernet" output content does not =
seem to '
> > +                              'contain the redirected port'))
> > +        self.assertGreater(port, 0,
> > +                           ('Found a redirected port that is not great=
er than'
> > +                            ' zero'))
> > diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptanc=
e/linux_ssh_mips_malta.py
> > index 6dbd02d49d..052008f02d 100644
> > --- a/tests/acceptance/linux_ssh_mips_malta.py
> > +++ b/tests/acceptance/linux_ssh_mips_malta.py
> > @@ -18,6 +18,8 @@
> >  from avocado.utils import archive
> >  from avocado.utils import ssh
> >
> > +from qemu.utils import get_info_usernet_hostfwd_port
> > +
> >
> >  class LinuxSSH(Test):
> >
> > @@ -70,18 +72,14 @@ def get_kernel_info(self, endianess, wordsize):
> >      def setUp(self):
> >          super(LinuxSSH, self).setUp()
> >
> > -    def get_portfwd(self):
> > +    def ssh_connect(self, username, password):
> > +        self.ssh_logger =3D logging.getLogger('ssh')
> >          res =3D self.vm.command('human-monitor-command',
> >                                command_line=3D'info usernet')
> > -        line =3D res.split('\r\n')[2]
> > -        port =3D re.split(r'.*TCP.HOST_FORWARD.*127\.0\.0\.1 (\d+)\s+1=
0\..*',
> > -                        line)[1]
> > +        port =3D get_info_usernet_hostfwd_port(res)
> > +        if not port:
> > +            self.cancel("Failed to retrieve SSH port")
> >          self.log.debug("sshd listening on port:" + port)
> > -        return port
> > -
> > -    def ssh_connect(self, username, password):
> > -        self.ssh_logger =3D logging.getLogger('ssh')
> > -        port =3D self.get_portfwd()
> >          self.ssh_session =3D ssh.Session(self.VM_IP, port=3Dint(port),
> >                                         user=3Dusername, password=3Dpas=
sword)
> >          for i in range(10):
> > diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/=
virtiofs_submounts.py
> > index ca64b76301..57a7047342 100644
> > --- a/tests/acceptance/virtiofs_submounts.py
> > +++ b/tests/acceptance/virtiofs_submounts.py
> > @@ -9,6 +9,8 @@
> >  from avocado_qemu import wait_for_console_pattern
> >  from avocado.utils import ssh
> >
> > +from qemu.utils import get_info_usernet_hostfwd_port
> > +
> >
> >  def run_cmd(args):
> >      subp =3D subprocess.Popen(args,
> > @@ -73,27 +75,14 @@ class VirtiofsSubmountsTest(LinuxTest):
> >      :avocado: tags=3Daccel:kvm
> >      """
> >
> > -    def get_portfwd(self):
> > -        port =3D None
> > -
> > +    def ssh_connect(self, username, keyfile):
> > +        self.ssh_logger =3D logging.getLogger('ssh')
> >          res =3D self.vm.command('human-monitor-command',
> >                                command_line=3D'info usernet')
> > -        for line in res.split('\r\n'):
> > -            match =3D \
> > -                re.search(r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+1=
0\.',
> > -                          line)
> > -            if match is not None:
> > -                port =3D int(match[1])
> > -                break
> > -
> > +        port =3D get_info_usernet_hostfwd_port(res)
> >          self.assertIsNotNone(port)
> >          self.assertGreater(port, 0)
> >          self.log.debug('sshd listening on port: %d', port)
> > -        return port
> > -
> > -    def ssh_connect(self, username, keyfile):
> > -        self.ssh_logger =3D logging.getLogger('ssh')
> > -        port =3D self.get_portfwd()
> >          self.ssh_session =3D ssh.Session('127.0.0.1', port=3Dport,
> >                                         user=3Dusername, key=3Dkeyfile)
> >          for i in range(10):
> > diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> > index 00f1d5ca8d..75ce07df36 100644
> > --- a/tests/vm/basevm.py
> > +++ b/tests/vm/basevm.py
> > @@ -21,6 +21,7 @@
> >  sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'p=
ython'))
> >  from qemu.accel import kvm_available
> >  from qemu.machine import QEMUMachine
> > +from qemu.utils import get_info_usernet_hostfwd_port
> >  import subprocess
> >  import hashlib
> >  import argparse
> > @@ -306,11 +307,7 @@ def boot(self, img, extra_args=3D[]):
> >          self.console_init()
> >          usernet_info =3D guest.qmp("human-monitor-command",
> >                                   command_line=3D"info usernet")
> > -        self.ssh_port =3D None
> > -        for l in usernet_info["return"].splitlines():
> > -            fields =3D l.split()
> > -            if "TCP[HOST_FORWARD]" in fields and "22" in fields:
> > -                self.ssh_port =3D l.split()[3]
> > +        self.ssh_port =3D get_info_usernet_hostfwd_port(usernet_info)
> >          if not self.ssh_port:
> >              raise Exception("Cannot find ssh port from 'info usernet':=
\n%s" % \
> >                              usernet_info)
> > --
> > 2.25.4
> >
>=20
> Other than maybe a small adjustment to the
> get_info_usernet_hostfwd_port function:
>=20
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>=20

Thanks for the review!
- Cleber.

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBbtgUACgkQZX6NM6Xy
CfNWwxAAwyzLXXze7lp8zEHibd1vzGdvpwdztbbUZrngfOF1h4imFbRrcemrLS/r
3b316/xLvHkzSRVoi48yUDlp0ed2DKqWfzgPWphzDOoPY4cuwXwFi+cPrTHFTKOk
m13x14N2IM+8e/bju7uSF3CCWkwk5of2cVIjpbFnrZuDtT/nmmUstXO2DlqCqS/N
bY5t/NI95iyTvAAJ/vZ01+mhMOtue4Nlt82eOq2GRfW1nLFajVie43Cevi5w8TCq
LG9MBa6eBUBO0ullh+zJkjkEj479SbnysEw5kOFWpewPzSlwq7sxyLHLDE462tDK
ywbKEQd/3tVvdXLL1EzeoRKrPR8YufMR0h+HjQKxmB5lLUMOTeFshSO8PsK5a7Wm
LM9IT/VuH+3PUxLIZnNcezvI51uSZCdEGz8O0GqcplfAUA2dYWLwTHIuLDDAP5er
N6V32oVp+3Jy4Sw5VEoWNx4zyIRACgO2PnnDVVIWzRdnw6Zq7JloQbPLsRNStdSp
2Uj6q9hEOtWYDILEyTZAs7AlCIht/7lz2I1mytdFrmxqEGVYPHB+flQrkhSrDMY4
BksQ4aCUd1CWz3hbkMfd8zEcqjAaCjH/Q21p+ZYsmfhPwTlYO6ZXth9WBlrISXJL
8uQjAPnk7RXasRg/Oidslan65M8nruW731ueo9moP+KoAlVOlgs=
=74cM
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--


