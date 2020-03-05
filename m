Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7199179D87
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 02:45:00 +0100 (CET)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9fZL-0002Ms-Ue
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 20:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j9fXz-0000NE-Iw
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 20:43:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j9fXy-0006nw-DX
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 20:43:35 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:56301)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j9fXx-0006k6-Cp; Wed, 04 Mar 2020 20:43:34 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48XtnF3cb8z9sSJ; Thu,  5 Mar 2020 12:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583372609;
 bh=Mpc/hupVpEIkY3C7UyiGMaWr+/4ielmmbo075mwyL+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X5UgwqxOqkKlPhUZfeMFH0tW5bYEvqZBjrTnAjuz6jsMhEi9z6r1YasSNFCPjup4a
 /du8tj3q2420HvZ4c+m888xQ0Z9AOFYqxdiuT6cxJwG24Ip893wPWFQpIJTUSp/1J8
 of72lStA9sM3GiitA8ecDZDVgfIe4Hs0ikPPUXX8=
Date: Thu, 5 Mar 2020 11:40:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/5] hw/scsi/spapr_vscsi: Simplify a bit
Message-ID: <20200305004012.GI593957@umbus.fritz.box>
References: <20200304153311.22959-1-philmd@redhat.com>
 <20200304153311.22959-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+QwZB9vYiNIzNXIj"
Content-Disposition: inline
In-Reply-To: <20200304153311.22959-4-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Fam Zheng <fam@euphon.net>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+QwZB9vYiNIzNXIj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2020 at 04:33:09PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We already have a ui pointer, use it (to simplify the next commit).
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Applied to ppc-for-5.0.

> ---
>  hw/scsi/spapr_vscsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index 7e397ed797..3cb5a38181 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -261,9 +261,9 @@ static int vscsi_send_rsp(VSCSIState *s, vscsi_req *r=
eq,
>      if (status) {
>          iu->srp.rsp.sol_not =3D (sol_not & 0x04) >> 2;
>          if (req->senselen) {
> -            req->iu.srp.rsp.flags |=3D SRP_RSP_FLAG_SNSVALID;
> -            req->iu.srp.rsp.sense_data_len =3D cpu_to_be32(req->senselen=
);
> -            memcpy(req->iu.srp.rsp.data, req->sense, req->senselen);
> +            iu->srp.rsp.flags |=3D SRP_RSP_FLAG_SNSVALID;
> +            iu->srp.rsp.sense_data_len =3D cpu_to_be32(req->senselen);
> +            memcpy(iu->srp.rsp.data, req->sense, req->senselen);
>              total_len +=3D req->senselen;
>          }
>      } else {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+QwZB9vYiNIzNXIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5gSmwACgkQbDjKyiDZ
s5IdbQ/+L+SCW55mztzOoUaxPqSTUQ8jTRkYuLnm97IO+N/f9vIYba7fE34IF+56
TMf8JnAWI9I/V3y8ONhIC0lhMv17epaUOOmeN+XiRtV5KYXI2rEbRSmEmt+wN42P
wn69PLT6kqknjOQ3gL/D4nhRnCL2trnjAJd6J/eGpT7YHI+H9F5HxlrtJJ40ieiw
fG3qmNbgwFppfowhA24KEOWgVrr+c3pJwQDorvvIAfQrXevOcyomLLaVSNVrf9pO
eM/GSfrkv3IGWwsjK+n3ZQovDLFisuvTXGijMrcOlcyM2fXFLRBYRWGKEAlvqLZb
mYZUiNNS/QxSYg9HT6ws3Y6kgeelFyMUpL4cfS1we/EXUN6IVFoJD/oC2YIkB1dU
Yo9ykVrqIfSm4+t7TfzLNmxlNyiFVo6NFlRloGeRVY0UIvbroMPJsoixREbgtKre
YGHGmyfM8SfC+950PdSvv4zZxSXGkhx59wEgTp8cy8atNB3oZJelcOVR45BJZDCD
8SXg0w+bFzPvPTe/h/Iv+25d1qGr/MVjRg1hZY83hx8hYA1C80m8u+jId7MmUDom
UiGI1tQbvIWXFJ9n1GynIzKtKpAodF/TteitsmHcKsLkvguMZiSUIMGazTbnUS1I
doVUVfMXP5QlkIMBvOC/bpMOkbP1Zy2dAv//armHY7Yu30k2VMY=
=k0Ho
-----END PGP SIGNATURE-----

--+QwZB9vYiNIzNXIj--

