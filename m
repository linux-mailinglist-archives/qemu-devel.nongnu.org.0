Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A1131EB77
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:24:20 +0100 (CET)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lClAB-0002r6-Ga
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCl8r-0002QN-8F
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCl8o-0002R4-Om
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613661773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oKW300fgiDXqSH0LNzsHF56e+kWpLknmKKlM0u8WQq0=;
 b=buT45IyQakZsxhvUkL3keobib3wI6ZghlvAt4L35C3a3eMS4P6tuwLBHBW35imfQM+14Zd
 +vqhwpfQPNtBuGE1whJxWNCvvqS76kafF31FTbEBPPlJqRc0rjRsOH4p2etB4d9y4axxHi
 G5vlr5Zlpidqo6BzcEs+tbkPosGGtEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-iWZITrk4M0qFn9y3Kf7wcA-1; Thu, 18 Feb 2021 10:22:49 -0500
X-MC-Unique: iWZITrk4M0qFn9y3Kf7wcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF131936B66;
 Thu, 18 Feb 2021 15:22:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D3C10016DB;
 Thu, 18 Feb 2021 15:22:43 +0000 (UTC)
Date: Thu, 18 Feb 2021 10:22:41 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 7/7] tests/avocado: add boot_xen tests
Message-ID: <20210218152241.GB433029@localhost.localdomain>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
 <20210217204654.GA353754@localhost.localdomain>
 <2948d7db-2168-7c5e-a73e-969a67496daa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2948d7db-2168-7c5e-a73e-969a67496daa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, xen-devel@lists.xenproject.org,
 stefano.stabellini@xilinx.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 10:43:54AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/17/21 9:46 PM, Cleber Rosa wrote:
> > On Thu, Feb 11, 2021 at 05:19:45PM +0000, Alex Benn=E9e wrote:
> >> These tests make sure we can boot the Xen hypervisor with a Dom0
> >> kernel using the guest-loader. We currently have to use a kernel I
> >> built myself because there are issues using the Debian kernel images.
> >>
> >> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >> ---
> >>  MAINTAINERS                  |   1 +
> >>  tests/acceptance/boot_xen.py | 117 ++++++++++++++++++++++++++++++++++=
+
> >>  2 files changed, 118 insertions(+)
> >>  create mode 100644 tests/acceptance/boot_xen.py
>=20
> >> +class BootXen(BootXenBase):
> >> +
> >> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> >> +    def test_arm64_xen_411_and_dom0(self):
> >> +        """
> >> +        :avocado: tags=3Darch:aarch64
> >> +        :avocado: tags=3Daccel:tcg
> >> +        :avocado: tags=3Dcpu:cortex-a57
> >> +        :avocado: tags=3Dmachine:virt
> >> +        """
> >> +        xen_url =3D ('https://deb.debian.org/debian/'
> >> +                   'pool/main/x/xen/'
> >> +                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1=
_arm64.deb')
> >> +        xen_sha1 =3D '034e634d4416adbad1212d59b62bccdcda63e62a'
> >=20
> > This URL is already giving 404s because of a new pacakge.  I found
> > this to work (but yeah, won't probably last long):
> >=20
> >         xen_url =3D ('http://deb.debian.org/debian/'
> >                    'pool/main/x/xen/'
> >                    'xen-hypervisor-4.11-arm64_4.11.4+57-g41a822c392-2_a=
rm64.deb')
> >         xen_sha1 =3D 'b5a6810fc67fd50fa36afdfdfe88ce3153dd3a55'
>=20
> This is not the same package version... Please understand the developer
> has to download the Debian package sources, check again the set of
> downstream changes between 37 and 57. Each distrib number might contain
> multiple downstream patches. Then the testing has to be done again,
> often enabling tracing or doing single-stepping in gdb. This has a
> cost in productivity. This is why I insist I prefer to use archived
> well tested artifacts, rather than changing package URL randomly.
>

I understand it's not the same version... but from my different and
limited PoV it was the obvious thing to suggest during a review.  Of
course using stable archived versions is much better (I believe Alex
will look into that for these packages).

Best,
- Cleber.

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAuhjkACgkQZX6NM6Xy
CfNVdRAAzlG3dNdeqwCKfa6leo0ZGC4j0XorAhWP9lS8UE1QvS6BFUQaO/esZcm+
BOo5YWsmbAg/e8MGu9Q4eZvCnkAPrjDDWQN9/6RYJ2qrBZfE/WOyV38UhR2SkMLz
RfgvQpQE075ZgQZed+puHfdWEgwELovkBlFklwDfzQbhp1jgCVaQXHA1pbJjMeVw
ryTNfBSRb2hQ7CKkeTL3XKxhzljR4McqaNfWONZJnfxwGGYRX5NJ9FrbsHuyyyZe
wjqylXUATtNEswQlUPG5YLwrn20vt7e6V/Oh6Wz+gaZbBXNO9sqRnKu+Hq8pUTEX
SbWNwy4s8TUMvFNwedvSJE/C6Xyc6VaocP2eCeOtQhnriraRNG720//4b81Zo0Wv
rwd4/va7y+UegpB0W69LdAcw78SQ5Knl1BKr3wGqxa+/ae9TXTs5EnUOzeh2DoYH
3lI6yI+Q4Fk4Sv6M/ailVOMq2jS5zXGnnQkKG55JdCkjp46DIbV/FnNPpI5OdUxL
u3E0SytsouftiOG83nNDlqn7GSqJE/wg7qi0FNLZm/IvE1CBhSooPs12mcp1XBkm
rpHEB00duys35EY131gkKZ9Cr8FUvpetmzWXxvoE3jPFTZfQeO86zDe/t1UxALZA
s9sI2FLvEMO18BsCLOPq/ga6N3gEgUE9ByMmPllTiB75d2UicIs=
=XUNL
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--


