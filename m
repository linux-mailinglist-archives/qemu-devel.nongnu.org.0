Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA4A22C23
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 08:34:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSbsd-0004aa-1k
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 02:34:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSbqe-0003qp-GY
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:32:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSbqd-00006z-EG
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:32:36 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56241 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSbqb-0008Vd-Fr; Mon, 20 May 2019 02:32:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 456pwV39hhz9s9y; Mon, 20 May 2019 16:32:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558333946;
	bh=FBPmBMesoFb4P+TklX5wAjJ13tGtE/uCElvtj7DwCBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I19Ial1fiB5Ecjl9S+054hxsoQaY8nwzSiba1jxYie43C1G3qBvgMsO4uNuJLqrtr
	fVE+vEtKoQEa4QumyJbtSPxTFOqo63pqZNAzNH09RN0nJoao+bp1/5+afc86EyyGTy
	CiZzLwobGW2Vr4edJEsC9YFzbqKDlhYhPprG6cX8=
Date: Mon, 20 May 2019 16:21:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190520062137.GD27407@umbus.fritz.box>
References: <155799221739.527449.14907564571096243745.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline
In-Reply-To: <155799221739.527449.14907564571096243745.stgit@bahia.lan>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH] spapr: Print out extra hints when CAS
 negotiation of interrupt mode fails
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 09:36:57AM +0200, Greg Kurz wrote:
> Let's suggest to the user how the machine should be configured to allow
> the guest to boot successfully.
>=20
> Suggested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied, thanks.

> ---
>  hw/ppc/spapr_hcall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 63a55614b83d..aae9fd2b3e6d 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1646,12 +1646,12 @@ static target_ulong h_client_architecture_support=
(PowerPCCPU *cpu,
>       */
>      if (guest_xive) {
>          if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_LEGACY) {
> -            error_report("Guest requested unavailable interrupt mode (XI=
VE)");
> +            error_report("Guest requested unavailable interrupt mode (XI=
VE), try the ic-mode=3Dxive or ic-mode=3Ddual machine property");
>              exit(EXIT_FAILURE);
>          }
>      } else {
>          if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_EXPLOIT) {
> -            error_report("Guest requested unavailable interrupt mode (XI=
CS)");
> +            error_report("Guest requested unavailable interrupt mode (XI=
CS), either don't set the ic-mode machine property or try ic-mode=3Dxics or=
 ic-mode=3Ddual");
>              exit(EXIT_FAILURE);
>          }
>      }
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlziR3EACgkQbDjKyiDZ
s5L6Cw/9Eh2mNmhCDYVmNN2bkglHGBz9B5p98rBU0ATxuxdYo3NxGdpLdmRGEhNg
HbMn94JXtS48fTnAwu4E+TrlOVHyriB4kb/OFWAecRosn7f0ObE7AgsK/p2Au72x
CcK1q9wGcCWv/Y9EXlDNE/n6+TpUSQM3z1sEgR3WxVoIIEc0IeY6Jvlc+KOToi9E
tZjkmboZAtL9I1RgDHBzz06lO1G1HORCKtxlexqJZuQVCbiHHWINnqAPmZLPkSai
hEODOobtkPKkgZKBNywuPb7kkpnBWK6hnsoaUjtakUL3RZddqzNTFbL6DKJX9nlQ
y7SWGvwv3iEjeXlFDlr7EXiw/1ASFf3L7Ys3cBAAftOhxhL5zBlHyHAnlDwrSEAx
zXl9ILeFXQAc26TsrMOtarNSAxjYRKU6SzjkcqGPMnQKEe/v3VdjYv4jzpfYIDf/
IgKrqcyHxWJonmYw3vV+gxAy2Gfhy3N0gneI9ntBTxTRYArb1+tjwEhx1PUqfdX9
poD+eh5dlaDe21TWJWTTulesrmQv5d/85iP1w9WJh9+NAofj9f39VBog142WfEHp
Gmgq4YmgnF7E31NOhk0xsEbqOWD6UUcZV5uLhzmLovod2OnRdF2+BCrThsICbB++
yVwPlXJjt9ZZfh1WnGTbMMsfzGjwEWxCULi/Eae9XmRhZegc7+4=
=akih
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--

