Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA263625A3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:28:35 +0200 (CEST)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRKc-0001wc-9i
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRIv-0000c5-6I
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRIp-0000Xp-LG
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/gXkf3hWGoMfVhrCPlXQ8k2cVZWEibm2fDPJIKnimos=;
 b=X4vq8hJsIT9Rk4fXPAUQ6pLGxA6KmOx0oslmhmtO5yHSIuECqdHtD1TQsnfTgi+UHtxqf6
 J83V3+uZxDnZtlmc5MPq/J0oqrBAyYinUqWWPkvIJqtOJ6hbfZYN+y/2SYdCNxaKq8e/JC
 XCVFku27rkUVLWyjL6j6/pZIQqXbWjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-GJsBfpLZMlefoR-Ea42FkQ-1; Fri, 16 Apr 2021 12:26:38 -0400
X-MC-Unique: GJsBfpLZMlefoR-Ea42FkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C349F107ACCD;
 Fri, 16 Apr 2021 16:26:36 +0000 (UTC)
Received: from localhost (ovpn-116-207.rdu2.redhat.com [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E12D60BE5;
 Fri, 16 Apr 2021 16:26:26 +0000 (UTC)
Date: Fri, 16 Apr 2021 12:14:14 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 4/8] tests/acceptance/migration.py: cancel test if
 migration is not supported
Message-ID: <20210416161414.GC1914548@amachine.somewhere>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-5-crosa@redhat.com>
 <68f215a3-10cc-d348-0512-8a5cf64b77a5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <68f215a3-10cc-d348-0512-8a5cf64b77a5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--E13BgyNx05feLLmH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 07:11:04AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 4/15/21 11:51 PM, Cleber Rosa wrote:
> > FIXME: check if there's a way to query migration support before
> > actually requesting migration.
> >=20
> > Some targets/machines contain devices that do not support migration.
> > Let's acknowledge that and cancel the test as early as possible.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/migration.py | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration=
.py
> > index 792639cb69..25ee55f36a 100644
> > --- a/tests/acceptance/migration.py
> > +++ b/tests/acceptance/migration.py
> > @@ -53,7 +53,11 @@ def do_migrate(self, dest_uri, src_uri=3DNone):
> >          source_vm =3D self.get_vm()
> >          source_vm.add_args('-nodefaults')
> >          source_vm.launch()
> > -        source_vm.qmp('migrate', uri=3Dsrc_uri)
> > +        response =3D source_vm.qmp('migrate', uri=3Dsrc_uri)
> > +        if 'error' in response:
> > +            if 'desc' in response['error']:
> > +                msg =3D response['error']['desc']
> > +            self.cancel('Migration does not seem to be supported: %s' =
% msg)
> >          self.assert_migration(source_vm, dest_vm)
>=20
> It would be better to have this done as a generic check_requisites()
> method. First because we could reuse it (also at the class level),
> second because we could account the time spent for checking separately
> from the time spent for the actual testing.
>=20

With regards to separating the time, you suggest that we should
perform the check at the setUp(), and I absolutely agree with the
principle.  But, I wonder if any characteristic of the "vm",
configured during the test (and not available earlier), could affect
its migration capabilities.

Right now we are proposing some "require_*()" methods, such as
require_accelerator("kvm"), because they are checks that, to the best
of my knowlege, do not depend on any further configuration for the vm
instance.

But, your second point, about this being in a method for common use,
is very sound.  IMO the place to put something like you suggest would
be QEMUMachine.  Something like:

   try:
      source_vm.require_migrate()
   except RequirementError as e:
      self.cancel(e)

Ideally, though, one instance of the QEMUMachine used for the checks,
would not be re-used during the test.  The ideal implementation of
QEMUMachine.require_*(), would create a fresh QEMUMachine instance
with user defined characteristics and verify the requirement, leaving
the original instance untouched.

IMO we can pursue that discussion further, while handling this error
condition locally for now.

Thanks,
- Cleber.

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmB5t9MACgkQZX6NM6Xy
CfOKChAAtYBZCRlnVS+hjtSkofRGpuTgOtOssYSlfGfN5gcXSPf2ywJD+myXhFd+
eTbxWlKJAr6a1S7C6I9W0zV4S6Ycryb5DakzJeZ+2tpsno52dZaAPx4QA3Sx90FL
wNijr58XUIlG6bHZBfIoLMiMlH6d5okfkqUTrqeCoaue1o7yk96YffW8UoLX7ByH
VSuV4g6y7eoFYyFjCFzogcm30ztw/92Mu86w5AKHcUZNWYUab4fWhcta5Wbb84iY
rYNzpXJG55AlUsHtzeh6SbJvOn/Go78o96D6ZdkNQ6IK7UqC+z+66k/4A6kDlb1Z
36kpgAM3BBu4cCn3IZD26qADkjP8sIg3Co0Sz7Lrzhz6qMMax43LDtVTwPjQE+YS
spvY6EL6VtCYqkqgxhxxkoUXe/uF3D522DOIOm1CFaUOS5P/PJBQjmmx7/bR7qJU
CU63tCpo1t6aTrxM/VLTTwXay5oJDGfds1q78Lrlj2C0OyBldlI/JrDReCXe2ETm
unOJMbayYHcmH5AHSdDBLiDZFpVJuHrWmzQETGEtAbaXm42J1hy1xj7MFIdmpDmG
9nESBChIIQeYPVlcdZVvmeHSEqiPSNs79WMfGeZEp9F1YWOKgRwXAXKptUOiaae6
ccs83DF/mTRIyysmJlskMAK/lk9ZkdmKONWpkiZp9sHwQRcBxcY=
=jqyx
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--


