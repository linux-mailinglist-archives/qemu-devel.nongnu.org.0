Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D23438CB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:52:18 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lODU9-0000SQ-Bx
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lODSb-0008FU-RN; Mon, 22 Mar 2021 01:50:42 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60987 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lODSY-0007qr-0T; Mon, 22 Mar 2021 01:50:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3kB158mVz9sVt; Mon, 22 Mar 2021 16:50:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616392233;
 bh=kZdzMea68P6ZO1z5SNiSqcU5/gN5dxQRmrWXjCLsN4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LoYM2lcosPBp4Qca26JM77xWEdp7Y0iYlg/reoeq2EQgtBqmZFAIiBVPvE8GfCrxX
 i4fRSfBnRMy5iJU6FRQ0DBLtJLl7Qd3S2TMsS3ZUM7NCSrBZvoKGDpSTubK2Of3GkD
 OFQ0Vq9BFAVAJMyCLyG3jY/vk610KCq5A+/gDwuU=
Date: Mon, 22 Mar 2021 16:44:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: Fix typo in the patb_entry comment
Message-ID: <YFgu2NpQ7Wr75GOX@yekko.fritz.box>
References: <20210225032335.64245-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i4ZAoasI+iFyuucP"
Content-Disposition: inline
In-Reply-To: <20210225032335.64245-1-aik@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--i4ZAoasI+iFyuucP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 02:23:35PM +1100, Alexey Kardashevskiy wrote:
> There is no H_REGISTER_PROCESS_TABLE, it is H_REGISTER_PROC_TBL handler
> for which is still called h_register_process_table() though.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to ppc-for-6.0.

In future, best to CC me directly, since I only occasionally peruse
the lists.

> ---
>  include/hw/ppc/spapr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ccbeeca1de84..8dceace4b442 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -168,7 +168,7 @@ struct SpaprMachineState {
>      SpaprResizeHpt resize_hpt;
>      void *htab;
>      uint32_t htab_shift;
> -    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROCESS_T=
ABLE */
> +    uint64_t patb_entry; /* Process tbl registed in H_REGISTER_PROC_TBL =
*/
>      SpaprPendingHpt *pending_hpt; /* in-progress resize */
> =20
>      hwaddr rma_size;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--i4ZAoasI+iFyuucP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYLtYACgkQbDjKyiDZ
s5Kq0RAAtLmFjpiksMG1WNoNlBGQy8N7DGaw9Dv6AZoUw6TafHq3FViYeXULa4Jg
94TQ3u0vXIyg1j5Zr+yXnpUz6C/76Kh3rjzFtrQUpOhG6X/S/aXPrFL9Fy5fUgbN
iTCC5iPGOm4uQ/xlMiRKST/CktMQgVe5E7lILPX0T/ldTwtKcaHrpByguFFNcWno
pLjcKTQLhWAMCw5VK35Y4Cmg4vJwp+bomHHzYkyfSk8g4rcZaq2wrvDYc3HVFntu
USIo2Ov4gJLbRMvSI5/j7nuprzo58BkYDCNWyeBc78ExyslGTdkQ+VEaGauZbiBw
Ywclq+hEvkc7SG5yajdYMBixg0DkFlSBeuiamaZWT3O0m95BZN5ErtW6rtYR+lbt
v8Qs9m51XLU95T8j2tVE0ugSJZnT3fizI4qkMT5UtTiShNnmD1yAlAtmniPyPVnw
E2YHTQ9R8C1pj7BqpwZGa3xLl9CbuGfmwu2R+XvUWv2ZcF5bRBv1l0rCvU8aNiGa
YybYYuNX9bTPzjUW8HVuFFRDl4M0GCf6xBTykDpLC2kO0QnXGLD7eZB/K+1II+OS
mAoYzf51Kp2LZWUrCI3u/kBpvrEx9X0XiVt85YrDo8nbEsj/2DZJlHvnOs6/DGME
klL1mo0jtPJ2VYbMGwG/7agvU4k+T6d2yPZEL6+kOGw7qem8zjs=
=F6M4
-----END PGP SIGNATURE-----

--i4ZAoasI+iFyuucP--

