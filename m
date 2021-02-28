Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D797327146
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 07:42:58 +0100 (CET)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGFn6-0000cI-Qm
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 01:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGFj8-0008Nd-5s; Sun, 28 Feb 2021 01:38:50 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60689 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGFj4-0001xo-62; Sun, 28 Feb 2021 01:38:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DpDHT08Hyz9sRR; Sun, 28 Feb 2021 17:38:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614494309;
 bh=viSRNRaNoXSRqdoQ8KhIgdXeXq+QDoG3BQKwV1R5P/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLyvGOVEollcn0WYehWwkXEEjDvtRcNA6XZeKYjNelEQPQDACDE1BpK3cefA7m4Uc
 yTlABPvv7eezFQzDjEjCWz5sr1TPNS0zGEUi5RHNoFMJvFT+YMz1Hf3N/uuGwh80cL
 P8Uz3x7pxLTezxV5tJEzhXwivl6envjcfLGLqfI0=
Date: Sun, 28 Feb 2021 17:32:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
Message-ID: <YDs5GfDG1cVcLMbY@yekko.fritz.box>
References: <20210228050431.24647-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sDBESoCCPAYBHj2T"
Content-Disposition: inline
In-Reply-To: <20210228050431.24647-1-bmeng.cn@gmail.com>
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sDBESoCCPAYBHj2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2021 at 01:04:31PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>=20
> "qemu-common.h" should be included to provide the forward declaration
> of qemu_hexdump() when HEX_DUMP is on.

Applied to ppc-for-6.0, thanks.

>=20
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>=20
>  hw/net/fsl_etsec/etsec.c | 1 +
>  hw/net/fsl_etsec/rings.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index 93886bba60..bd9d62b559 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -27,6 +27,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu-common.h"
>  #include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/ptimer.h"
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index fe055d3381..d6be0d7d18 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -22,6 +22,7 @@
>   * THE SOFTWARE.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu-common.h"
>  #include "net/checksum.h"
>  #include "qemu/log.h"
>  #include "etsec.h"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sDBESoCCPAYBHj2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA7ORQACgkQbDjKyiDZ
s5I7txAA0RARy03+gmrU4JARILJAcu8hE0FOFWg9lITdH3pkU49vUlvRuunMk7cn
Quy3mnaETmDbHh0/sfmdvYW3u5kMcFjlieMjcuAiY5MUZcZ/C+C9LVEVgBOSxYji
W+ur6cruOjHJ7TZ5yvBVGeyVAKd5gBL19gbHJ5I2o20YQz7Mu6H1/Z3bB9KSABI+
CZ7vZtqgA6xeuZMCfwND6GwRFb6qUafqUTOVllyacoWWRMaeCXbzhkrKV21mqazo
4xE24vg31yp4JY2MR0wW/tV4mjdxk7b8KLkFm3ruz2AifBXGpKJFXxWChgVSuAt4
z4yW3cWA5p3l0ACj/sn92wuvuJGa48l5XoE7QetKz+Cv73PBuR8Fk2t1dwF5ltW/
cqjJpEVpxh8RYjKMpGlLxzC8sRKhs9KTiKBCJIjfceSs2EdaWhwWM0aIz5bRuc/5
I/WCiLrmqLzAm8msAwcU3ZNNSPx/NfcXkbytZ1UKAR9m3h9DoUxMHDvxsgqYoo/4
/jd27VwyN/N29FSU0/zJIhVVy1y2QiwK6bRP7GGhGmihT0egV1orCacj99quWu/M
1b+wfxvmYQu8t9sOX5Mh+h4TKCRsRMZztbGRZeWKNRnJ4GSo5htmxS3fl4+pEHsR
VEQ4nzyu/AaUVo279RoFY5VJvJjvF4qAfjQ3ghYc9S5LTfaFe50=
=tnss
-----END PGP SIGNATURE-----

--sDBESoCCPAYBHj2T--

