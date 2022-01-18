Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20562492423
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:51:56 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9m5j-00027t-5e
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:51:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9m0u-00087X-JG; Tue, 18 Jan 2022 05:46:56 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9m0r-0002Uj-LF; Tue, 18 Jan 2022 05:46:56 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JdQSS4V5Tz4y3s; Tue, 18 Jan 2022 21:46:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642502808;
 bh=QTlU9PtZQ3bcE/SYjqhnq0gAnuT9PWCoIJuacYwLdL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W13CezaR4t2kvJk0s8Bn562kD8/0Z9hFGkvp7xhbjgjULM9/2+gZD5bR9f6EdTL5S
 obyvL3wDvavy0Stl6uu6nY5bNjKco3vXbETnya8YbbND8/5o1lDf8p28FhWvgOD5Wo
 8klfKZH5ESRSrbJCs1g5AFLQPzTV928RikXC8tvs=
Date: Tue, 18 Jan 2022 21:46:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 1/2] target/ppc: Remove last user of .load_state_old
Message-ID: <YeaajF8ZU6ASVZzC@yekko>
References: <20220118104150.1899661-1-clg@kaod.org>
 <20220118104150.1899661-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xyouzo2HPLfW9gOa"
Content-Disposition: inline
In-Reply-To: <20220118104150.1899661-2-clg@kaod.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xyouzo2HPLfW9gOa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 11:41:49AM +0100, C=E9dric le Goater wrote:
> This breaks migration compatibility from (very) old versions of
> QEMU. This should not be a problem for the pseries machine for which
> migration is only supported on recent QEMUs ( > 2.x). There is no
> clear status on what is supported or not for the other machines. Let's
> move forward and remove the .load_state_old handler.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/machine.c | 112 -------------------------------------------
>  1 file changed, 112 deletions(-)
>=20
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 756d8de5d8dd..df547385ff1e 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -23,117 +23,6 @@ static void post_load_update_msr(CPUPPCState *env)
>      pmu_update_summaries(env);
>  }
> =20
> -static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
> -{
> -    PowerPCCPU *cpu =3D opaque;
> -    CPUPPCState *env =3D &cpu->env;
> -    unsigned int i, j;
> -    target_ulong sdr1;
> -    uint32_t fpscr, vscr;
> -#if defined(TARGET_PPC64)
> -    int32_t slb_nr;
> -#endif
> -    target_ulong xer;
> -
> -    for (i =3D 0; i < 32; i++) {
> -        qemu_get_betls(f, &env->gpr[i]);
> -    }
> -#if !defined(TARGET_PPC64)
> -    for (i =3D 0; i < 32; i++) {
> -        qemu_get_betls(f, &env->gprh[i]);
> -    }
> -#endif
> -    qemu_get_betls(f, &env->lr);
> -    qemu_get_betls(f, &env->ctr);
> -    for (i =3D 0; i < 8; i++) {
> -        qemu_get_be32s(f, &env->crf[i]);
> -    }
> -    qemu_get_betls(f, &xer);
> -    cpu_write_xer(env, xer);
> -    qemu_get_betls(f, &env->reserve_addr);
> -    qemu_get_betls(f, &env->msr);
> -    for (i =3D 0; i < 4; i++) {
> -        qemu_get_betls(f, &env->tgpr[i]);
> -    }
> -    for (i =3D 0; i < 32; i++) {
> -        union {
> -            float64 d;
> -            uint64_t l;
> -        } u;
> -        u.l =3D qemu_get_be64(f);
> -        *cpu_fpr_ptr(env, i) =3D u.d;
> -    }
> -    qemu_get_be32s(f, &fpscr);
> -    env->fpscr =3D fpscr;
> -    qemu_get_sbe32s(f, &env->access_type);
> -#if defined(TARGET_PPC64)
> -    qemu_get_betls(f, &env->spr[SPR_ASR]);
> -    qemu_get_sbe32s(f, &slb_nr);
> -#endif
> -    qemu_get_betls(f, &sdr1);
> -    for (i =3D 0; i < 32; i++) {
> -        qemu_get_betls(f, &env->sr[i]);
> -    }
> -    for (i =3D 0; i < 2; i++) {
> -        for (j =3D 0; j < 8; j++) {
> -            qemu_get_betls(f, &env->DBAT[i][j]);
> -        }
> -    }
> -    for (i =3D 0; i < 2; i++) {
> -        for (j =3D 0; j < 8; j++) {
> -            qemu_get_betls(f, &env->IBAT[i][j]);
> -        }
> -    }
> -    qemu_get_sbe32s(f, &env->nb_tlb);
> -    qemu_get_sbe32s(f, &env->tlb_per_way);
> -    qemu_get_sbe32s(f, &env->nb_ways);
> -    qemu_get_sbe32s(f, &env->last_way);
> -    qemu_get_sbe32s(f, &env->id_tlbs);
> -    qemu_get_sbe32s(f, &env->nb_pids);
> -    if (env->tlb.tlb6) {
> -        /* XXX assumes 6xx */
> -        for (i =3D 0; i < env->nb_tlb; i++) {
> -            qemu_get_betls(f, &env->tlb.tlb6[i].pte0);
> -            qemu_get_betls(f, &env->tlb.tlb6[i].pte1);
> -            qemu_get_betls(f, &env->tlb.tlb6[i].EPN);
> -        }
> -    }
> -    for (i =3D 0; i < 4; i++) {
> -        qemu_get_betls(f, &env->pb[i]);
> -    }
> -    for (i =3D 0; i < 1024; i++) {
> -        qemu_get_betls(f, &env->spr[i]);
> -    }
> -    if (!cpu->vhyp) {
> -        ppc_store_sdr1(env, sdr1);
> -    }
> -    qemu_get_be32s(f, &vscr);
> -    ppc_store_vscr(env, vscr);
> -    qemu_get_be64s(f, &env->spe_acc);
> -    qemu_get_be32s(f, &env->spe_fscr);
> -    qemu_get_betls(f, &env->msr_mask);
> -    qemu_get_be32s(f, &env->flags);
> -    qemu_get_sbe32s(f, &env->error_code);
> -    qemu_get_be32s(f, &env->pending_interrupts);
> -    qemu_get_be32s(f, &env->irq_input_state);
> -    for (i =3D 0; i < POWERPC_EXCP_NB; i++) {
> -        qemu_get_betls(f, &env->excp_vectors[i]);
> -    }
> -    qemu_get_betls(f, &env->excp_prefix);
> -    qemu_get_betls(f, &env->ivor_mask);
> -    qemu_get_betls(f, &env->ivpr_mask);
> -    qemu_get_betls(f, &env->hreset_vector);
> -    qemu_get_betls(f, &env->nip);
> -    qemu_get_sbetl(f); /* Discard unused hflags */
> -    qemu_get_sbetl(f); /* Discard unused hflags_nmsr */
> -    qemu_get_sbe32(f); /* Discard unused mmu_idx */
> -    qemu_get_sbe32(f); /* Discard unused power_mode */
> -
> -    post_load_update_msr(env);
> -
> -    return 0;
> -}
> -
>  static int get_avr(QEMUFile *f, void *pv, size_t size,
>                     const VMStateField *field)
>  {
> @@ -808,7 +697,6 @@ const VMStateDescription vmstate_ppc_cpu =3D {
>      .version_id =3D 5,
>      .minimum_version_id =3D 5,
>      .minimum_version_id_old =3D 4,
> -    .load_state_old =3D cpu_load_old,
>      .pre_save =3D cpu_pre_save,
>      .post_load =3D cpu_post_load,
>      .fields =3D (VMStateField[]) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xyouzo2HPLfW9gOa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHmmoIACgkQgypY4gEw
YSK0pQ/+PU+P32L61Ns7sovbYXT0DfLv654hoWWHhZ4irAUxgJ33IJGTxENpsndz
jof1BRdUCifH/R2lkPDJczWoB0gRnb9BdPEyHaxSZ39cFRZWbPDKXVKdZm4igNDk
S96tExs9flnFwu2fd8XS+JR1V7dvfRdh5LV8a2++6b4+nN+w1tZfiLs2PwmoDQFR
mJzGTWGfDVX4VUPFGA8tfeO4gKlk1f2WQAvUQmHmAM7AyhRzKEHVhq1PrrF5UklO
jG+2baCTGiRwyMykagciyoZYilrFq+nzXf8tWx3MAXwwLKquPP2ez6SPmXJDDPpl
3yV3GeqkkSIlPAQ7tyiLng1c+Rw4X3Tae3JAlx658ZJ8oAYI/clntTygrqiMWw/9
8kBeXnU0EVrQLuR4W6/jTbtQBDdHYRTDgU2//ANBD9tkO0q+rM7RQLCb192JJa4r
piL3Z64eCGKQgk75e7Hj4HDjMFNcjUlkuuZFsN+rzWpwF2NmpYOFBbjnmDy5kQMV
2BQJ6ED7/yY7vjWFpoYtuHgXQ21CPcH/O5A2rB3mpAkJkfTsWKEPvfQlaE0kkVGM
tP4Eb5aHg6JJyJM8YQ6nf0jGaNWINHmqdVcYlVMM9pa1doTMP465k2AdPJGB2Zac
TxleFhMPg6tUs2wyVUSBCTBt7MLrlWpzkFQgmwB1nHG4YVU1f3U=
=wAlj
-----END PGP SIGNATURE-----

--xyouzo2HPLfW9gOa--

