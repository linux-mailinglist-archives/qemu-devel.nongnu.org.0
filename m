Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F147424B64
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 02:52:56 +0200 (CEST)
Received: from localhost ([::1]:56026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYHeY-0008Hl-PY
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 20:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHao-0006K7-0i; Wed, 06 Oct 2021 20:49:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHal-0005LG-Fs; Wed, 06 Oct 2021 20:49:01 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HPt3x07GZz4xbG; Thu,  7 Oct 2021 11:48:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633567725;
 bh=cOzmjXvnUC27qCcrtMEh7WXcCbTK1D9zOmttGSBubag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGjAF0dU44LwtQWVRsBnnvR+Wl3HVIewyTXm8ZyhjXmD1rrbTAaeOAb9BKbF0SdoA
 a52bvcH09uLqWU+Fc7cTjY1UBTyzilC7kH++NsA5vfRExM7IxymkIgWw3t3eV/ZTW8
 qswXi8Ur+/UHBIxv7ZBsbtN5/6xqD27Yj4Aq+PkM=
Date: Thu, 7 Oct 2021 11:46:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/ppc/spapr_softmmu: Reduce include list
Message-ID: <YV5DfyHw8FMTtpBv@yekko>
References: <20211006170801.178023-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="52gsmy8EKimSv6pt"
Content-Disposition: inline
In-Reply-To: <20211006170801.178023-1-philmd@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--52gsmy8EKimSv6pt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 07:08:01PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Commit 962104f0448 ("hw/ppc: moved hcalls that depend on softmmu")
> introduced a lot of unnecessary #include directives. Remove them.

Applied to ppc-for-6.2, thanks.

>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/ppc/spapr_softmmu.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
> index 6c6b86dd3c6..f8924270eff 100644
> --- a/hw/ppc/spapr_softmmu.c
> +++ b/hw/ppc/spapr_softmmu.c
> @@ -1,25 +1,10 @@
>  #include "qemu/osdep.h"
>  #include "qemu/cutils.h"
> -#include "qapi/error.h"
> -#include "sysemu/hw_accel.h"
> -#include "sysemu/runstate.h"
> -#include "qemu/log.h"
> -#include "qemu/main-loop.h"
> -#include "qemu/module.h"
> -#include "qemu/error-report.h"
>  #include "cpu.h"
> -#include "exec/exec-all.h"
>  #include "helper_regs.h"
>  #include "hw/ppc/spapr.h"
> -#include "hw/ppc/spapr_cpu_core.h"
>  #include "mmu-hash64.h"
> -#include "cpu-models.h"
> -#include "trace.h"
> -#include "kvm_ppc.h"
> -#include "hw/ppc/fdt.h"
> -#include "hw/ppc/spapr_ovec.h"
>  #include "mmu-book3s-v3.h"
> -#include "hw/mem/memory-device.h"
> =20
>  static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--52gsmy8EKimSv6pt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFeQ30ACgkQbDjKyiDZ
s5LANBAA3938bioAcOFAhjUo1uYBerXX6/cdBUp3YWGJ90zoUkdkoEz77svMjLCj
Mx/PpKA3RxsCthAs1GifhN2HNr2NgNNUYPP/B8tOLN7a4nR14kosdQdxAHEQrCBm
X0PcQHcvzL3SojjusZlSE2T1UUmfeSA79GVSVIZ8IAp9TUfKb6b0HW7BfE4/qKrc
Mjp8BwNGbGYbMwKGBeEuvSSaG//iNn3TEf1rFS41C43XzIKCtj3zQRbc42TBWMbK
aaPbHZTwKv0WwLvI2i8AuDCBMmVlucTDXe8K2A5feq083YOuA3/8d/m0p65IVf9c
HlXggDKHHnomGIFen94S7k0hvvy2X5k2/aKIQixqCgaCX+/7LZj/6mciQgeV4+/K
I93uGuYiPintm4rZQhjQm0jnXVzLKv+eE8I58k4LGHcgyuZriYbWwSQp/T5NaCas
4o/c0qezuOzs7xqPxsMoFVKOG90o6tk08hwSE5UjXI/edGcApDcKmAABwJu49eSA
BA2y92VdmNzCN4lwybkkOOdVD7q/kE2qzCAzHnXK3cB9V8pqSsMtKhwTpIRTZsHk
FaX5dD75JKdr+wFtDYNefRyg/+RZHdA6LW7As4NitOmkjbAEhCh62LBdxMdnAvV5
/GxraFfemYk19p/Hy0938bI2/gQuCGl9sYQTXPegJlgtN2Im5Cw=
=1lOk
-----END PGP SIGNATURE-----

--52gsmy8EKimSv6pt--

