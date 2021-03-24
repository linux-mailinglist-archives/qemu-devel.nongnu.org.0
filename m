Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669E348523
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 00:16:19 +0100 (CET)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCja-0002lb-C0
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 19:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgD-0000Up-Mr
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgC-0001bG-1W
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616627567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q3MlC07NEHG840Bpp+xkIdg8NOr1Ux/kclAmBRMEvLE=;
 b=gS/x0yt6Up2cSqtMnoW66JZXcWW3LqLFz0Mf0RvA1J9K3eUCakhDZ4gjA7qIodfT4luLE2
 LMVQu3FhMB6ym0xC+yMdudwCt5myxlNn7lJVDUtUh5gfVyL2Lca9jk+moF9knKiGZKAVHC
 WpZdxt09VFGZwVhikyPaeXCIre5zUJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-GXsT7DssOXmtbqzoPi-4PA-1; Wed, 24 Mar 2021 19:12:43 -0400
X-MC-Unique: GXsT7DssOXmtbqzoPi-4PA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2258618C89E4;
 Wed, 24 Mar 2021 23:12:42 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4677E5C257;
 Wed, 24 Mar 2021 23:12:36 +0000 (UTC)
Date: Wed, 24 Mar 2021 18:28:14 -0400
From: Cleber Rosa <crosa@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh
 by default
Message-ID: <20210324222814.GD3592254@amachine.somewhere>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-6-crosa@redhat.com>
 <CAJ+F1C+ODGnkhEmtM7=aKCW4WLjhkw4jU73sTZVWKa6hOkCXCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+ODGnkhEmtM7=aKCW4WLjhkw4jU73sTZVWKa6hOkCXCw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 12:30:18PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Mar 24, 2021 at 2:23 AM Cleber Rosa <crosa@redhat.com> wrote:
>=20
> > For users of the LinuxTest class, let's set up the VM with the port
> > redirection for SSH, instead of requiring each test to set the same
> > arguments.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/avocado_qemu/__init__.py | 4 +++-
> >  tests/acceptance/virtiofs_submounts.py    | 4 ----
> >  2 files changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py
> > b/tests/acceptance/avocado_qemu/__init__.py
> > index 67f75f66e5..e75b002c70 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -309,10 +309,12 @@ class LinuxTest(Test, LinuxSSHMixIn):
> >      timeout =3D 900
> >      chksum =3D None
> >
> > -    def setUp(self, ssh_pubkey=3DNone):
> > +    def setUp(self, ssh_pubkey=3DNone, network_device_type=3D'virtio-n=
et'):
> >          super(LinuxTest, self).setUp()
> >          self.vm.add_args('-smp', '2')
> >          self.vm.add_args('-m', '1024')
> > +        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0=
.1:0
> > -:22',
> > +                         '-device', '%s,netdev=3Dvnet' %
> > network_device_type)
> >          self.set_up_boot()
> >          if ssh_pubkey is None:
> >              ssh_pubkey, self.ssh_key =3D self.set_up_existing_ssh_keys=
()
> > diff --git a/tests/acceptance/virtiofs_submounts.py
> > b/tests/acceptance/virtiofs_submounts.py
> > index bed8ce44df..e10a935ac4 100644
> > --- a/tests/acceptance/virtiofs_submounts.py
> > +++ b/tests/acceptance/virtiofs_submounts.py
> > @@ -207,10 +207,6 @@ def setUp(self):
> >              self.vm.add_args('-kernel', vmlinuz,
> >                               '-append', 'console=3DttyS0 root=3D/dev/s=
da1')
> >
> > -        # Allow us to connect to SSH
> > -        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.0=
.1:0
> > -:22',
> > -                         '-device', 'virtio-net,netdev=3Dvnet')
> > -
> >          self.require_accelerator("kvm")
> >          self.vm.add_args('-accel', 'kvm')
> >
> > --
> > 2.25.4
> >
> >
> Looks fine, I suppose it could eventually be in LinuxSSHMixIn too for oth=
er
> users.
>

That's a good point, should be possible.  I'll look into that.

> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
>=20
> --=20
> Marc-Andr=E9 Lureau

Thanks,
- Cleber.

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBbvP4ACgkQZX6NM6Xy
CfNUOg//evRJ+tHnDQn37l7joeXCR4BXziFa5rN0w8JIVmyyAZH0wf3kA+zTDfY6
WPXmyTKjOKftWM90KYlY4rhq3Spqa3/wwt5lkWxDod24off/ueaWJjXFsChAEw53
0fRQ3Ut9r1/MwrEA2stEodLDnliRcWK7g9+mxzFohZxguP/CBEJFE+kX8vxCqnBa
n5ZSL5Xvo2K7DutnxuxWBRUPanTW9gnzYliJwTdXQwZxF5vCdrNhek6cDJ+ozNyq
fjAn0UnbIoNhpJV987pVtYu4HdRKl19SVXxEckyKSmrH4FhCnPAqO2PBAxDawCfc
6OH6l770jmOYYSAk4PPqawhFxBcvBkyesqM3+bT1OgHh6vQE4JrKvOKGGS2HZHED
FkjoKFA2v3XYT/KSMW9MurKlhvGSkakp+w/BKQ0dF/HeCcwUAzolRE7+scz+my6v
ViEYkehVs+cU8V0P/IIaj+Ht851hY+h+8K1rP0MQpb8QaHFJdhstl14Rr8k6xcXA
ucFFfiWpX6w287V2WksVB/tkNIDl+FzpzMw/CM1yGDL7y4iA6ttfUjCiLp17dHnQ
JUU3t3P6dHW7cJ/iCxo7h9UPqC6y9xmu979I2Kmh9t+do3K8B8Ecm0GHChjqOP1/
RS2pDmihepFf9w5eFtKEdtcPZSY2K9oY3d5vA1FWFt3+hZxid08=
=CsFM
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--


