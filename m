Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A5734851D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 00:14:48 +0100 (CET)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCi6-0000wz-U6
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 19:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgA-0000Ua-VN
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCg5-0001XV-FR
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616627559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=knitkD8hlMVH/jgi4TNRHqHJNhE8z6yWOwPpfnw/u4E=;
 b=e8llJ0wVtq/vi4ame1UQCDXjMgDRLydfJ61EP2DfnDdmBYf7H0Vsq4ilzsHcUjFdTHFy2S
 HX1rWdhPk9x/2pj4BOnVVEaiEwzFLPFNjskwvo/eoZE6gAPLZIMOQAczF99mbdQY+cINAs
 DV1CnsoxpJSc+TzcOzAyXgtLVc31fpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ObpmfKuINx6IYjEG0whHCA-1; Wed, 24 Mar 2021 19:12:37 -0400
X-MC-Unique: ObpmfKuINx6IYjEG0whHCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC5D21084D68;
 Wed, 24 Mar 2021 23:12:35 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7CA10023B0;
 Wed, 24 Mar 2021 23:12:22 +0000 (UTC)
Date: Wed, 24 Mar 2021 18:45:29 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 07/10] Acceptance Tests: set up SSH connection by
 default after boot for LinuxTest
Message-ID: <20210324224529.GF3592254@amachine.somewhere>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-8-crosa@redhat.com>
 <887f1c44-898f-3a50-047e-7752a58c9887@redhat.com>
MIME-Version: 1.0
In-Reply-To: <887f1c44-898f-3a50-047e-7752a58c9887@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
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

--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 10:22:47AM +0100, Auger Eric wrote:
> Hi Cleber,
>=20
> On 3/23/21 11:15 PM, Cleber Rosa wrote:
> > The LinuxTest specifically targets users that need to interact with Lin=
ux
> > guests.  So, it makes sense to give a connection by default, and avoid
> > requiring it as boiler-plate code.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/avocado_qemu/__init__.py | 5 ++++-
> >  tests/acceptance/virtiofs_submounts.py    | 1 -
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
> > index 535f63a48d..4960142bcc 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -390,7 +390,7 @@ def set_up_cloudinit(self, ssh_pubkey=3DNone):
> >          cloudinit_iso =3D self.prepare_cloudinit(ssh_pubkey)
> >          self.vm.add_args('-drive', 'file=3D%s,format=3Draw' % cloudini=
t_iso)
> > =20
> > -    def launch_and_wait(self):
> > +    def launch_and_wait(self, set_up_ssh_connection=3DTrue):
> >          self.vm.set_console()
> >          self.vm.launch()
> >          console_drainer =3D datadrainer.LineLogger(self.vm.console_soc=
ket.fileno(),
> > @@ -398,3 +398,6 @@ def launch_and_wait(self):
> >          console_drainer.start()
> >          self.log.info('VM launched, waiting for boot confirmation from=
 guest')
> >          cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port=
), self.name)
> > +        if set_up_ssh_connection:
> > +            self.log.info('Setting up the SSH connection')
> > +            self.ssh_connect(self.username, self.ssh_key)
> > diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/=
virtiofs_submounts.py
> > index e10a935ac4..e019d3b896 100644
> > --- a/tests/acceptance/virtiofs_submounts.py
> > +++ b/tests/acceptance/virtiofs_submounts.py
> > @@ -136,7 +136,6 @@ def set_up_virtiofs(self):
> > =20
> >      def launch_vm(self):
> >          self.launch_and_wait()
> > -        self.ssh_connect('root', self.ssh_key)
> > =20
> >      def set_up_nested_mounts(self):
> >          scratch_dir =3D os.path.join(self.shared_dir, 'scratch')
> >=20
> what about launch_and_wait calls in boot_linux.py. Don't you want to
> force ssh connection off there?
>

Good point.  I guess one could argue that it doesn't hurt those tests,
and even that it "tests more".  But, I'd argue that less is more here
indeed.

I'll change those launch_and_wait() to include set_up_ssh_connection=3DFals=
e
for those tests.

> Thanks
>=20
> Eric

Thanks a lot!
- Cleber.

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBbwQkACgkQZX6NM6Xy
CfNgIg/8CRuQMCNs55ri8ctnG/UbxdjYmtcStwgxum0EdCFO+f047HapLxGE5JvC
dCDvCz0e6myDOFRdqgq2tGctPXX7cwwTfxIY6OCKT9hCAUt9T2soNAZguthJR73L
ZTYk9WHE8ry9Qhd3mQyF6T1x3ECmaSPhs4L52Crw53tj8V/FD7GWwHBp4J1zYFFX
cmdXGlOAPci6AV8/wM0+5DVONXfQBsb9H8v5XxjTm2sizUveWClsbb32uhQCF/5A
/DkRjeEyUqOcVEUxe7RQYn7Wlvn3yqnY1/UnOu04JvtIWxVTVT1rnUxgYqSwUhwX
DBYdCU3ieTNizLlK0y2oisalK7jAKdZVDbVji7WbCLq65ifA5WP6pn4ke6nU83bP
n3Ni1aIqIeNV+xGWDvcKIEs9ZlFqCdkrK9LPUIhpE5dHxMpJSlzEcQ6UrkwwbRmR
Rmg/wSwLXNSfwiW73iOHesho+HIv0LZuta8V6Rw5IAGFkxteeWy6yLzVp5iLlRS2
4mAs/cAo0AnQ0k6OsruI8qiqf21ZuR/LqHzWX4ZJwQkzQf5RHlmPct1x77dd/lKk
/zYXeuyrJ0iJwb7Eb+I7I7AzwoG6APd29mavGsxtq2atIXwxzk7J9++RLdUJ+B7h
R8JKaSS9zaLwtJaF9qTyc3ebyMpLyIhy75Er1KE3yEiixBoZjBU=
=SVuL
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--


