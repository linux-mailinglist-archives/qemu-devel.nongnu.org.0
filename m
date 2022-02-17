Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BFC4B95CB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 03:03:42 +0100 (CET)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKW8y-0006hI-8m
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 21:03:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVeE-0002eO-Mh; Wed, 16 Feb 2022 20:31:54 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:46175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKVeB-0002SQ-Su; Wed, 16 Feb 2022 20:31:54 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jzck42szqz4xv7; Thu, 17 Feb 2022 12:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645061500;
 bh=BPv/OVQuVUXjDSXQyRHMSoyjZG/Fz3ph/5KgfupL6DY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O4LmQlyxCiFqS0sMvvBuArvwLV1mVj8xIoFpKtHl497YoDObhZFTdo1sXchAOxYUQ
 ds2dGSRe437IptfLBq6kafGMoTh9mRShKlWIlYVJQXIFg+JvFqQ+y6eXMN7wdQsLZx
 p+os8VBkNWsc6/9eR+1RcStUJ7hM6GcWGXKtQ7jc=
Date: Thu, 17 Feb 2022 11:19:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/3] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to
 determine cap-ail-mode-3 support
Message-ID: <Yg2UnVAb9u42pt50@yekko>
References: <20220216063903.1782281-1-npiggin@gmail.com>
 <20220216063903.1782281-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jrwg8S3CaWPEdVdO"
Content-Disposition: inline
In-Reply-To: <20220216063903.1782281-3-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jrwg8S3CaWPEdVdO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 04:39:03PM +1000, Nicholas Piggin wrote:
> Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for KVM
> guests. Keep the fallback heuristic for KVM hosts that pre-date this
> CAP.
>=20
> This is only proposed the KVM CAP has not yet been allocated. I will
> ask to merge the new KVM cap when there are no objections on the QEMU
> side.
>=20
> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

LGTM, once the kernel side work is done.

> ---
> Since v1:=20
> - Remove incorrect test for unsupported cap query. Add comment instead.
>=20
>  linux-headers/linux/kvm.h |  1 +
>  target/ppc/kvm.c          | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 02c5e7b7bb..d91f578200 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_BINARY_STATS_FD 203
>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>  #define KVM_CAP_ARM_MTE 205
> +#define KVM_CAP_PPC_AIL_MODE_3 210

You may be aware of this already, but once the cap is allocated on the
kernel side, you should do a full update of the kernel headers as a
separate patch.  A direct hack to the headers copy is fine for a
preliminary posting, though.

> =20
>  #ifdef KVM_CAP_IRQ_ROUTING
> =20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 1338c41f8f..7f71f78253 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
>  static int cap_fwnmi;
>  static int cap_rpt_invalidate;
> +static int cap_ail_mode_3;
> =20
>  static uint32_t debug_inst_opcode;
> =20
> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      }
> =20
>      cap_rpt_invalidate =3D kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INV=
ALIDATE);
> +    cap_ail_mode_3 =3D kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
>      kvm_ppc_register_host_cpu_type();
> =20
>      return 0;
> @@ -2567,6 +2569,17 @@ bool kvmppc_supports_ail_3(void)
>  {
>      PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
> =20
> +    if (cap_ail_mode_3) {
> +        return 1;
> +    }
> +
> +    /*
> +     * cap-ail-mode-3 is disabled, but it may be because the KVM host pr=
e-dates
> +     * the cap. Special-case the test because the performance cost for
> +     * disabling the feature unconditionally is prohibitive until updated
> +     * KVM is widely in use.
> +     */
> +
>      /*
>       * KVM PR only supports AIL-0
>       */
> @@ -2589,6 +2602,11 @@ bool kvmppc_supports_ail_3(void)
>          return 0;
>      }
> =20
> +    /*
> +     * Beyond ISA v3.1 (POWER10), this could return 0, because all KVM
> +     * implementations for such hosts would support the cap.
> +     */
> +
>      return 1;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jrwg8S3CaWPEdVdO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmINlJYACgkQgypY4gEw
YSJDhQ/5ATi7BaovqbgGPtI61cQ+Rie17u13akc4pJWCto9ARJxyOulhJOy03MCm
MZtz8MgkJZaHsz65mElGn/Ikes5FeabTS2XmDfSq3yIa35ElTH5Grq8XKDtG4Mjy
r6S/FIYuwysqKC2YCDjj/iFVfFeSnluog70LrOnTTYz1AqG1op5e/weTJi/tPsEm
4wvoVODi0uHU4mwS91e1ruXeAW8E6E9MekNHSbzOXlvsiyI9o6FK+iCU+v5aLdwf
ZC5mZSk3knbYDFlHwpUcaS9xzfAth7IH4dAg/9Z1nk7X4qTji46HuRaE9K2vMKCi
YH8hc932xGJ1bCxzbuCS1X2n2ciXjK/+/sFzaYX4zLvY0i1wwQzXMEYWyEt8M14f
tikDq9EsYDbZJDvy2TB5FOOI9VEcmJ0mTy4Q/A1+af6iePaAQ6tO/CqjK1TdTH/k
autQUIJyQVBdKZzUbSYlF5macHCng8zPxQiFs9nUja57KsCytX1mRyooQzjDgWQV
PdA4mce3VFyxBm/qM09ybt8DdYn0PcAoBe7CnVrXA0M4xHZuU9IyDdWQintcBeac
4jJeattlnpvqzLbRNUbKWxt4YC5r+8FHFLUxxKPiKgu711e+Cx4CDq4nbdSMbthb
pGILFE17ie3VfGGIzXh9HW5uhukWP603QWKc7iC7zehxeFTd9xI=
=dhOO
-----END PGP SIGNATURE-----

--jrwg8S3CaWPEdVdO--

