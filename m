Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D484B95A4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 02:49:37 +0100 (CET)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKVvL-0001qt-3l
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 20:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVeB-0002cE-9l; Wed, 16 Feb 2022 20:31:52 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:41203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVe6-0002QK-38; Wed, 16 Feb 2022 20:31:49 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jzck42PLJz4xsk; Thu, 17 Feb 2022 12:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645061500;
 bh=zPAahDLPEKVgz0PwoIrKIKBEfCBvef5Fpd5ldDpuJP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bMcGNkjsI2jcx51BdS5bkIyYNpAa0gH5BkKm4IFn2bS8iNZPNM0TKgHIsGHIzZ+H9
 rq86xFXtGA+nG9C1hxIcbVPe3rD3LeeaLGrkLjYEWKfLwWbc1FPgUSQe5nQCzc0hRP
 JeecG3ezghH0UkejBvPBbbs7k6PAo2RkkE772lr0=
Date: Thu, 17 Feb 2022 10:34:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 23/27] target/ppc: Rename spr_tcg.h to spr_common.h
Message-ID: <Yg2J/2fhqOq/aL0Z@yekko>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
 <20220216162426.1885923-24-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Sp0/oT3wr4gflqZv"
Content-Disposition: inline
In-Reply-To: <20220216162426.1885923-24-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Sp0/oT3wr4gflqZv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 01:24:22PM -0300, Fabiano Rosas wrote:
> Initial intent for the spr_tcg header was to expose the spr_read|write
> callbacks that are only used by TCG code. However, although these
> routines are TCG-specific, the KVM code needs access to env->sprs
> which creation is currently coupled to the callback registration.
>=20
> We are probably not going to decouple SPR creation and TCG callback
> registration any time soon, so let's rename the header to spr_common
> to accomodate the register_*_sprs functions that will be moved out of
> cpu_init.c in the following patches.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c                  | 2 +-
>  target/ppc/{spr_tcg.h =3D> spr_common.h} | 4 ++--
>  target/ppc/translate.c                 | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename target/ppc/{spr_tcg.h =3D> spr_common.h} (99%)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index adb23019ef..17f12aceb6 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -44,7 +44,7 @@
> =20
>  #include "helper_regs.h"
>  #include "internal.h"
> -#include "spr_tcg.h"
> +#include "spr_common.h"
>  #include "power8-pmu.h"
> =20
>  /* #define PPC_DEBUG_SPR */
> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_common.h
> similarity index 99%
> rename from target/ppc/spr_tcg.h
> rename to target/ppc/spr_common.h
> index df2abacc64..5aec76ade4 100644
> --- a/target/ppc/spr_tcg.h
> +++ b/target/ppc/spr_common.h
> @@ -16,8 +16,8 @@
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
> -#ifndef SPR_TCG_H
> -#define SPR_TCG_H
> +#ifndef SPR_COMMON_H
> +#define SPR_COMMON_H
> =20
>  #define SPR_NOACCESS (&spr_noaccess)
> =20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 2eaffd432a..ecc5a104e0 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -35,7 +35,7 @@
>  #include "exec/translator.h"
>  #include "exec/log.h"
>  #include "qemu/atomic128.h"
> -#include "spr_tcg.h"
> +#include "spr_common.h"
> =20
>  #include "qemu/qemu-print.h"
>  #include "qapi/error.h"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Sp0/oT3wr4gflqZv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmINifgACgkQgypY4gEw
YSKXmRAAt5M0klskUmZpJISxCVLzoEJCBIRBpieRePunia+BQY4P+kHxOTkYEz9P
Tc3aepDT+9yR/OyIIaR9famP2jwKCpUP5qNdMVHzyBcyjalc4zK4cKZxTaA3MCWd
LAKDKdUFaR+slOafPMLfeUeGjqRTlqDaIqREPs0Ix8QYzOvoOHdEDIi2WeRPS9FV
41In3CEz1bIuoQBC+27203hlW2VtjdRRVUpRJDcW6SX3VqXZVj6zpbQsVC2dHTrv
ZixueN88PrNYLBrD3ZM3F77ssruDrD7o1LFZl7zNyQ9Y3jDZoIz7NzXMSFcfvAyK
nSn/cPMnOtupcM90lqxa/8WvAfkwgMPtx2baFbRrgdtQnCt3xGVXhd8D/BGTVGho
eQ7lFNSJC0CfRNhC/EjwC9wnKDBdR47dcYACHhN1Fc1FqiIuVbko9uokDlbWnOlF
+S853asoWoRO6AokI7xbPHnNvPbTUYXBiQgToNYH+/ATJ/ySog6rPyKT06+vUDbq
GuJtISrWCuWGyZBoK7rfERONYHga+cuqxy4Fop6c/+PKQNgeHmVV3Kly2xaeSK4i
BxAutrjUqONn45/jW2zIUrCaIKIGlApB38mRPR11ZmftScOs10xaJv0cJ9pnsrSC
47Gu1Gn90Pfx/IgyzMn8eIfrugm3rMXmZu9tm3dSaKzzcjGymGY=
=94ha
-----END PGP SIGNATURE-----

--Sp0/oT3wr4gflqZv--

