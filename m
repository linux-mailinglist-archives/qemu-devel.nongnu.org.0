Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8652A30EBAE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 06:01:05 +0100 (CET)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7WlJ-0004BB-Ir
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 00:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l7WjJ-0002us-KK; Wed, 03 Feb 2021 23:58:57 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:46841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l7WjE-0000Bx-6R; Wed, 03 Feb 2021 23:58:55 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DWRCP40m2z9sj0; Thu,  4 Feb 2021 15:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612414721;
 bh=zUU5WI9+bI3X+bAp+nMFOM3COen9DWRLjgO5y7qQRmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VUjEvb1Rx1KMfqB1oIGYlUgcmdt1mA0LNj8sCz8Q2KHyafzWZjhY53O+uth/Dk7Qy
 3NKkPZbzZD5Wr/I/6O1O8LPjFhgok+jj2f958kQA3A2FCBAOgWMclL0BD5zY7HAkbA
 QgYTXq8NcTCXG/dinDuW5+xWYIl2Tv8h5RUI/Xes=
Date: Thu, 4 Feb 2021 13:59:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ppc: e500: Fill in correct <clock-frequency>
 for the serial nodes
Message-ID: <20210204025953.GE4729@yekko.fritz.box>
References: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
 <1612362288-22216-2-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline
In-Reply-To: <1612362288-22216-2-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 10:24:48PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> At present the <clock-frequency> property of the serial node is
> populated with value zero. U-Boot's ns16550 driver is not happy
> about this, so let's fill in a meaningful value.

Are you sure this is correct - that is that the serial clock is really
the same as the overall system clock?  Quite often there's some kind
of divider in between.

>=20
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> ---
>=20
> (no changes since v1)
>=20
>  hw/ppc/e500.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index c795276..01517a6 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -126,7 +126,7 @@ static void dt_serial_create(void *fdt, unsigned long=
 long offset,
>      qemu_fdt_setprop_string(fdt, ser, "compatible", "ns16550");
>      qemu_fdt_setprop_cells(fdt, ser, "reg", offset, 0x100);
>      qemu_fdt_setprop_cell(fdt, ser, "cell-index", idx);
> -    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", 0);
> +    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", PLATFORM_CLK_FREQ=
_HZ);
>      qemu_fdt_setprop_cells(fdt, ser, "interrupts", 42, 2);
>      qemu_fdt_setprop_phandle(fdt, ser, "interrupt-parent", mpic);
>      qemu_fdt_setprop_string(fdt, "/aliases", alias, ser);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAbYykACgkQbDjKyiDZ
s5L8NxAApakiRlB1vq6G0RNsY3aqXc/Ww4A7y2P9htyYdsA46PwZpirG7Uao4jdO
xNho+GVLjY9gL9n8tUuf2DIeJ2qMp+RsQNoxq0gRwecyuERMBmLSGHfFavFWfSPU
I8nIfDcmuCX4ohZ1aPJlavfWLKQzHYvTEtjvkQIYmEYEO+x+dgVR2BMrxkyMCYgE
TH64btBG3dLv+S6NyPk460AYv01ecdmybtX1smL2lWFB/kicIRMJNTlWEm9bTW5i
B5qsn/yxQFO7aacjzuAEqQ74XwHN94JIV+AmXKLt17PuLlJOCsATIBgo+mv7t4dV
G4ILvaHqdK/qxUPZh8jsVh5Erma73pSOmlX+veAe7bjLK3FVg01y7RL/QxbUuI52
FSHx6VL7G85c7+ulq8jW2J7/Rd5v3H5mIGQQrAMNJu8PzvgvTmzNK80N4g5FC49+
QyVH+2z2AAAtJ1/oj64XB6lrtVyyMgolYac59xx+bywwJzMX6hSiOgD6sUANiTfe
gyjisKG6sRJ6hHUeJ8BxT83gZpO4DkRDyLolQNqHVXqrvBx/cyufqfj02JjQXh8n
P8kgY8aFJ8rb8Hlru/5nGGitILVbYJFxRpUoKajMoRLC7CpcP13jgReLTUf4Djox
ZrcI/UJJkNIAAHxVGLXPLyBICO7ThzIkWqUa90LrjvNyRqTb/zk=
=gc8b
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--

