Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316612CDB99
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:53:25 +0100 (CET)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrrA-00023L-76
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kkroh-00010A-AW
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kkroe-0008K0-Dh
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607014246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJqtu/mIyzNyqye8SzGyoTydnssvEMk0xmIpEsIzW0E=;
 b=WC70H+8OP4oJGo9WeZ+T+QbPjuV7tpnMD0zt42J9DqLji/4T2fysKs5MNGO76gdXXn+mGO
 8Xe/Ecu/z4nYC4srm3l7zkjHsduqbrFWX/dp4zJBlYOABTn843jT0fVJhalRjTTw80IidF
 kSdsVk1Dwicw+jn25zEB8XEM9qpvLhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-a_HK2GaQP5egakMx51HnlQ-1; Thu, 03 Dec 2020 11:50:40 -0500
X-MC-Unique: a_HK2GaQP5egakMx51HnlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDCF8107ACE3;
 Thu,  3 Dec 2020 16:50:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-183.rdu2.redhat.com
 [10.10.118.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 078E95C1B4;
 Thu,  3 Dec 2020 16:50:34 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:50:33 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
Message-ID: <20201203165033.GB2787993@localhost.localdomain>
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
 <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 10:37:01AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 12/2/20 10:57 PM, Cleber Rosa wrote:
> > Currently in use Fedora 31 has been moved out of the standard download
> > locations that are supported by the functionality provided by
> > avocado.utils.vmimage.  So right now, the boot_linux.py tests will get
> > canceled by not being able to find those specific images.
> >=20
> > Ideally, this would be bumped to version 33.  But, I've found issues
> > with the aarch64 images, with various systemd services failing to
> > start.  So to keep all archs consistent, I've settled on 32.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/boot_linux.py | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_lin=
ux.py
> > index 1da4a53d6a..0824de008e 100644
> > --- a/tests/acceptance/boot_linux.py
> > +++ b/tests/acceptance/boot_linux.py
> > @@ -42,13 +42,13 @@ class BootLinuxBase(Test):
> >          vmimage.QEMU_IMG =3D qemu_img
> > =20
> >          self.log.info('Downloading/preparing boot image')
> > -        # Fedora 31 only provides ppc64le images
> > +        # Fedora 32 only provides ppc64le images
> >          image_arch =3D self.arch
> >          if image_arch =3D=3D 'ppc64':
> >              image_arch =3D 'ppc64le'
> >          try:
> >              boot =3D vmimage.get(
> > -                'fedora', arch=3Dimage_arch, version=3D'31',
> > +                'fedora', arch=3Dimage_arch, version=3D'32',
>=20
> I already expressed my view on this (latest QEMU should be
> able to use at least f31 - which was tested - and eventually
> f33 - which is coverage extension). I'm not going to vouch
> this change. If other maintainers are happy with it, I don't
> mind this gets merged.
>=20
> BTW I don't see why this is urgent for 5.2.
>=20
> Phil.
>=20

Hi Phil,

Are you implying that, in your opinion, QEMU (say 5.2) should somehow
provide compatibility with Fedora 31 because it was used during the
entire cycle?  I sympathize with that, but, QEMU is not really
advertising compatibility support with specific Linux Distros, is it?

And, assuming that the issues I found on the Fedora 33 aarch64 image
can not be worked around, would you suggest not moving to 32?  I mean,
I don't see a reason why QEMU shouldn't be able to use at least Fedora
32, which is a currently *active* version (different from 31).

Thanks,
- Cleber.

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl/JF1YACgkQZX6NM6Xy
CfOfWBAAkitJzx1S5CqzWjsSwppiTn/mF8y1sOv2RfGGVlRWx7mbmr8ZveP1izMU
lU/uG9xwRNUYGn0J2KBzD+BPYivund2NKsXIJHTW5l3jG4fpWp+CfEbBDu4kr9Qz
9nwLXQwf8/SDmCkx30XSFgpeP20FFujChMJ/qllyS0mBS1/wdxeWzI3Pxzz1p6HC
w0TSxB8gCNwxyae1S2wTjaPQYJIq/Me+mb/V55Qq/1Sft4ZzL6N9FiUMZrKfefo7
yk8aAjSTaJRhlJI5eBLzVQsJJDO0BOdAIbsb5n9d4zM1tRFVtFrv+pb1iNg0QE8n
148wAZqerF1/WIY3XSWt5RiDSBcUTI4MelzCNQRRZU8GeRdjrgeT4rNOzcaKGZUq
Cx255WK2A785QeflFLHZ+aRkk9cNH7sP5IgoXcfjkrG3tnFFX2AQfZSL59B4OVW4
Qkvso+ZHugBu+z09wW6Qr/Ku+KgKyrX03ijHkynvEAbolubzwfZTUslLl/Jupf3T
YWINc9sCszoQ1oEu9LTRIzdiv7UatYLsr6SVVr63lkRPImRM8LlEqgz4Md+WE604
I+yKxk/3/9y4MkG7bqOgfiIZqMwG9LUEdBhlwUIXViCCpDgCnRpiP7esChSpeeQg
5Fl9s+SO/wT0eyYtnWAG6f2kU4z6Ao+bnz0h1HcqmNYsKiChhO8=
=7ZeM
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--


