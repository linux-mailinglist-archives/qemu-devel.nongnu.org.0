Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038783CC7FB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 08:42:52 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m50Vn-0003M8-AN
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 02:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m50SF-0001wb-7Z; Sun, 18 Jul 2021 02:39:11 -0400
Received: from ozlabs.org ([203.11.71.1]:35255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m50SC-0006xR-Ns; Sun, 18 Jul 2021 02:39:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GSFgR2rFfz9sW8; Sun, 18 Jul 2021 16:38:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626590339;
 bh=aECc5KNRVEVSzpe6mST2Ev9xnwC1DNHIlG73euO/B8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nS2/3KZNMnUL9shmY9cZpJEHgr88mmekCvLdWtG0yZf1VyEOv/vVet7gcBqPc8CeE
 X0rhJw79TabOA9jQJIXbQHRwi338qUCyr31smBtuYtLVAXpCbLv/9YCC4r1yholSk8
 giNS54MomxGZ3haB7sjNYWmHmTqalSqKXAdm/dEs=
Date: Sun, 18 Jul 2021 16:24:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/2] ppc/pegasos2: Fix spurious warning with -bios
Message-ID: <YPPJHEqQcqA4qfNB@yekko>
References: <cover.1626367844.git.balaton@eik.bme.hu>
 <483ac599a1407b766179aaea2794aed60cc09f53.1626367844.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dKK++Xggv2KLmmCB"
Content-Disposition: inline
In-Reply-To: <483ac599a1407b766179aaea2794aed60cc09f53.1626367844.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dKK++Xggv2KLmmCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2021 at 06:50:44PM +0200, BALATON Zoltan wrote:
> The -append option is currently not compatible with -bios (as we don't
> yet emulate nvram so we can only put it in the environment with VOF).
> Therefore a warning is printed if -append is used with -bios but
> because the default value of kernel_cmdline seems to be an empty
> string instead of NULL this warning was printed even without -append
> when -bios is used. Only print warning if -append is given.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied to ppc-for-6.1.

> ---
>  hw/ppc/pegasos2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 9fad1854b1..b8ce859f1a 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -191,7 +191,7 @@ static void pegasos2_init(MachineState *machine)
>              warn_report("Option -kernel may be ineffective with -bios.");
>          }
>      }
> -    if (machine->kernel_cmdline && !pm->vof) {
> +    if (!pm->vof && machine->kernel_cmdline && machine->kernel_cmdline[0=
]) {
>          warn_report("Option -append may be ineffective with -bios.");
>      }
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dKK++Xggv2KLmmCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDzyRoACgkQbDjKyiDZ
s5LexA/+PtuNb3wbMIRhMH46A9YebP1Kkw/gmXPRF7brC8VL8qKD+GdqknEFvnZb
RxxnZhZcvVaNUCNibVLChNR57saBEjaytev2PrA8pIcCgzTBqVSwJNfExQSfLrw0
KKepQswMXqOApOeuLlxTYiHxqvrBu045pv7KTYuN+MNr2iGjVKYgwprCRogjr7iz
0z80H35Br+Sdljf8xF7wWO5XqQkP89P0ebM8EY1Pdf2O4et07xOna2zhd0M5IXPl
dQavwTRZ4l+lDG24cfMAusgDd8OocXNLKSuc9htY4KEPAhbxAjnG+UZgZrm/u7O4
ETfDSYOF3BF/fofF0o/7ZR8BkNMuCZeV8sgiPRrLW9VBZhk28S7x3IqWY3N+ZxQd
s1c6b9XfxLSxiueJpbPbXeGAaPELhMy+b8/g2R/MnuzRzy76tOxE3d4XFXExtx9c
emBxrCjmo0ilOWSVWYs3otp4jvxbonJXrcD25upIKHCDwnzvSHzWRgzIkKlG5hjm
ekhN/LD9+Nwu9ds4DIKz7IujNWPJqCXQ0S/oyvgYqdR9O5wZV0Q6U6C9kp+dM2gy
36MCuCP1ZP91cSh2f+Mo4YqB2G6ZQagilRlps+gkT6rBDVeGkmFqrxoD0BeOqHcw
AaHajz9TjFmQA6lm3JhMtYXfoaji5Iw34aH/DLjGd5Zzl7ez0Wg=
=nhMd
-----END PGP SIGNATURE-----

--dKK++Xggv2KLmmCB--

