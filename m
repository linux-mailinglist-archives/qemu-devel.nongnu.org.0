Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6038DF88
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:06:15 +0200 (CEST)
Received: from localhost ([::1]:38836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0uz-00032p-27
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sV-0008BY-Rm; Sun, 23 May 2021 23:03:40 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37581 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll0sS-0000ZT-1o; Sun, 23 May 2021 23:03:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpMV44y1Mz9sW1; Mon, 24 May 2021 13:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621825404;
 bh=I1uxiPkjh0HOasOhjCA6uo+5YLFY7tJQNcnkQ8FiKAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YDaWvZtYF/j56oQyr0Xu/skp9+l/0sQzsZjDS6e4xhGN9TZe2Mq7tCSrjc+dsbIgW
 FGyGyL/12gzWpGVAq/a+7VkQGhFwZa0jYVvsJTAdVLHS6S7YBWreXNqsbXn6vFvtxy
 lFec+k2i7IRxIWrIWyH/04ngXHP7ZRZuTZv08YZY=
Date: Mon, 24 May 2021 12:41:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 5/9] target/ppc: removed unnecessary inclusion of
 helper-proto.h
Message-ID: <YKsSYfjATZUpCQdt@yekko>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-6-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A0FTXalap14hTmkb"
Content-Disposition: inline
In-Reply-To: <20210521201759.85475-6-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--A0FTXalap14hTmkb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 05:17:55PM -0300, Bruno Larsen (billionai) wrote:
> These files included helper-proto.h, but didn't use or declare any
> helpers, so the #include has been removed
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu_init.c    | 1 -
>  target/ppc/gdbstub.c     | 1 -
>  target/ppc/mmu-hash32.c  | 1 -
>  target/ppc/mmu-radix64.c | 1 -
>  4 files changed, 4 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 3365135896..b696469d1a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -43,7 +43,6 @@
>  #include "fpu/softfloat.h"
>  #include "qapi/qapi-commands-machine-target.h"
> =20
> -#include "exec/helper-proto.h"
>  #include "helper_regs.h"
>  #include "internal.h"
>  #include "spr_tcg.h"
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index c7d866cfcc..09ff1328d4 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -20,7 +20,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
> -#include "exec/helper-proto.h"
>  #include "internal.h"
> =20
>  static int ppc_gdb_register_len_apple(int n)
> diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
> index 32d1f4a954..6a07c345e4 100644
> --- a/target/ppc/mmu-hash32.c
> +++ b/target/ppc/mmu-hash32.c
> @@ -21,7 +21,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
> -#include "exec/helper-proto.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_ppc.h"
>  #include "internal.h"
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index eabfe4e261..cbd404bfa4 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -20,7 +20,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
> -#include "exec/helper-proto.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_ppc.h"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--A0FTXalap14hTmkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrEmEACgkQbDjKyiDZ
s5L2cxAA30MbODa+JF+FymkWqbZZNfvzI7Mc+E/KPpKpTtTejokZ7ckqZnZ8SvDl
QbCWXy8yVxf5r/pMjZ5RmGl1XHbwHZW/dp8LXGPfHDeTwrL+9vmN+NZ7AGifi4gH
nOA7JCBzWocee4wn2aOg+dKQcd7MYVDdUQ2Fesi2PH3lCkPEQwKqBKd5VPVKaO9V
jvMYm/yaYfXuQs+wVLnbm8vQmjeMm/GH+zLuVr/X28NW39qNXzF3sBUgVbj6Mw2n
FD83sl3ayODbqJKWbEO5Da3kR9d1UjzmLoHC+snfiqW1BILpgAsPv/1mto7FMPJG
OLmWbHxhNVRCv7dW9qwdAnvNWY9I+X3Pdei3Dlg053PR0XByGofSq9Tz+MfWqBjJ
Y9zK61tRG5pwUSbqPJA2S4TYNeqmrCXwUJiHe6l2k4tprbZVvIsianEdDmTPqzoQ
X79BQq7XaQWRTbIuzCrYeqUtMw+g8Op8ZJ1hk/B9Z/UPzqazwE7l19++AUJ8yLSy
KIlu4o1JdwsAxjKhzVBIFcf2JEALkl6B3p/LGyhCl5Hbhzt/yEhQ1TlDBHKgKhK4
pwnvtw4uux52+Ly3fOwWlANDnfcT/MjetL3MeW75t+CDMf/vNR3nh8OxBShOXrpV
pNYBJS9eXQOJPibo4KrhdU5LbT6dVZiqJWqOCHUa14+uOG+as0E=
=O5sD
-----END PGP SIGNATURE-----

--A0FTXalap14hTmkb--

