Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E73E702D1A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:52:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXg0-0003qF-Nw; Mon, 15 May 2023 08:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyXfw-0003pB-UB; Mon, 15 May 2023 08:51:41 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyXfu-0006ls-Ts; Mon, 15 May 2023 08:51:40 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-643b7b8f8ceso7235184b3a.1; 
 Mon, 15 May 2023 05:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684155097; x=1686747097;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dJvlKPgfzQjHUrYJPjOgqkfytetscxPnVXaPnEPFsM=;
 b=oqvpCSwwwCadCpNibSq8Lfg8dj6qU2arnGcZKnn4LWtfG3gur4ydHdZVPyaInAb8uh
 83ChuTmSfxHUspY9iwd0GYJdRHRooUl8wyB4jZSZC4bA2xZvY5OEKNEACRkhD8M9CkVw
 E8RtAwXvO3TBLq+oghckNCxrkJ43yLRzI04uTm3ESoFTEoxQzlUIhVu3ZbG+HYXJCfrT
 C+ZD5lgpxuapycqtnsRiVJZUH82wNyc8sfYKpFSox0esZf3S4drQLsFK8mtMEEKX5Mob
 KxiyGQSQQp+7x3DTAQQDBwA2t5m5dULVGOZKsj9eBQDKXrndIeT8erXY9CvOx3FdST/2
 NuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684155097; x=1686747097;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4dJvlKPgfzQjHUrYJPjOgqkfytetscxPnVXaPnEPFsM=;
 b=E5CKs6OaY/tY3teDGIf5i8j6PgcIWO/nbMQomen6jNdCvArE1Sjj7g7kGAft6ti4VP
 kkFnUO10rQqDtJQ1TImJg8GheouMbHvhtZwsADx0tycGKqRuECC656c+XHp2v2SEeDXa
 2zOEJNI+7Ofa5q1zV2S9107L3bF3sk1leSPDleUGnSiNKROXWosOlNyBOjQT0fxrcONj
 Eb1hdY/rZTrRgaTs9TpSvlPRlf5okHt1ojXSMGTGBN0ONBFLgchgO74/2GqXEi6nYy69
 ko9P5nVHeihHLMzN9NgJpTYnFiPRX42XXufrMcoBItRqme1cr6lJ1v5D/YELR/6MLmBm
 l2Nw==
X-Gm-Message-State: AC+VfDyq8QaOYMXbVfRFj23Kc4MJvIdmf7IuOWTrV0PhYabT8fi9pNwI
 UqBTXd/d3pXr3mAWECbPHrzHIzkMRjo=
X-Google-Smtp-Source: ACHHUZ5XyvEohLgQ1F2m6w2saIsJ0tgaDRtUeD7cvr28FP8FjlSYdy/N6YpRN+Zf80+6LmAZjL5DKw==
X-Received: by 2002:a05:6a00:248c:b0:647:e6d9:88c2 with SMTP id
 c12-20020a056a00248c00b00647e6d988c2mr28742712pfv.0.1684155097021; 
 Mon, 15 May 2023 05:51:37 -0700 (PDT)
Received: from localhost ([202.168.30.146]) by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0064cb464e08fsm837441pfo.15.2023.05.15.05.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 05:51:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 22:51:31 +1000
Message-Id: <CSMV5K680ACK.176PL0NI6UC3V@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Mark Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, <qemu-ppc@nongnu.org>
Cc: <qemu-devel@nongnu.org>, "Daniel Henrique Barboza"
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH v3 1/9] target/ppc: Fix width of some 32-bit SPRs
X-Mailer: aerc 0.14.0
References: <20230515092655.171206-1-npiggin@gmail.com>
 <20230515092655.171206-2-npiggin@gmail.com>
 <4cefbbd6-6ab2-cd55-4468-4066b464c99c@ilande.co.uk>
In-Reply-To: <4cefbbd6-6ab2-cd55-4468-4066b464c99c@ilande.co.uk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon May 15, 2023 at 10:03 PM AEST, Mark Cave-Ayland wrote:
> On 15/05/2023 10:26, Nicholas Piggin wrote:
>
> > Some 32-bit SPRs are incorrectly implemented as 64-bits on 64-bit
> > targets.
> >=20
> > This changes VRSAVE, DSISR, HDSISR, DAWRX0, PIDR, LPIDR, DEXCR,
> > HDEXCR, CTRL, TSCR, MMCRH, and PMC[1-6] from to be 32-bit registers.
> >=20
> > This only goes by the 32/64 classification in the architecture, it
> > does not try to implement finer details of SPR implementation (e.g.,
> > not all bits implemented as simple read/write storage).
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> > Since v2: no change.
> >=20
> >   target/ppc/cpu_init.c    | 18 +++++++++---------
> >   target/ppc/helper_regs.c |  2 +-
> >   target/ppc/misc_helper.c |  4 ++--
> >   target/ppc/power8-pmu.c  |  2 +-
> >   target/ppc/translate.c   |  2 +-
> >   5 files changed, 14 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > index 0ce2e3c91d..5aa0b3f0f1 100644
> > --- a/target/ppc/cpu_init.c
> > +++ b/target/ppc/cpu_init.c
> > @@ -5085,8 +5085,8 @@ static void register_book3s_altivec_sprs(CPUPPCSt=
ate *env)
> >       }
> >  =20
> >       spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
> > -                     &spr_read_generic, &spr_write_generic,
> > -                     &spr_read_generic, &spr_write_generic,
> > +                     &spr_read_generic, &spr_write_generic32,
> > +                     &spr_read_generic, &spr_write_generic32,
> >                        KVM_REG_PPC_VRSAVE, 0x00000000);
> >  =20
> >   }
> > @@ -5120,7 +5120,7 @@ static void register_book3s_207_dbg_sprs(CPUPPCSt=
ate *env)
> >       spr_register_kvm_hv(env, SPR_DAWRX0, "DAWRX0",
> >                           SPR_NOACCESS, SPR_NOACCESS,
> >                           SPR_NOACCESS, SPR_NOACCESS,
> > -                        &spr_read_generic, &spr_write_generic,
> > +                        &spr_read_generic, &spr_write_generic32,
> >                           KVM_REG_PPC_DAWRX, 0x00000000);
> >       spr_register_kvm_hv(env, SPR_CIABR, "CIABR",
> >                           SPR_NOACCESS, SPR_NOACCESS,
> > @@ -5376,7 +5376,7 @@ static void register_book3s_ids_sprs(CPUPPCState =
*env)
> >       spr_register_hv(env, SPR_TSCR, "TSCR",
> >                    SPR_NOACCESS, SPR_NOACCESS,
> >                    SPR_NOACCESS, SPR_NOACCESS,
> > -                 &spr_read_generic, &spr_write_generic,
> > +                 &spr_read_generic, &spr_write_generic32,
> >                    0x00000000);
> >       spr_register_hv(env, SPR_HMER, "HMER",
> >                    SPR_NOACCESS, SPR_NOACCESS,
> > @@ -5406,7 +5406,7 @@ static void register_book3s_ids_sprs(CPUPPCState =
*env)
> >       spr_register_hv(env, SPR_MMCRC, "MMCRC",
> >                    SPR_NOACCESS, SPR_NOACCESS,
> >                    SPR_NOACCESS, SPR_NOACCESS,
> > -                 &spr_read_generic, &spr_write_generic,
> > +                 &spr_read_generic, &spr_write_generic32,
> >                    0x00000000);
> >       spr_register_hv(env, SPR_MMCRH, "MMCRH",
> >                    SPR_NOACCESS, SPR_NOACCESS,
> > @@ -5441,7 +5441,7 @@ static void register_book3s_ids_sprs(CPUPPCState =
*env)
> >       spr_register_hv(env, SPR_HDSISR, "HDSISR",
> >                    SPR_NOACCESS, SPR_NOACCESS,
> >                    SPR_NOACCESS, SPR_NOACCESS,
> > -                 &spr_read_generic, &spr_write_generic,
> > +                 &spr_read_generic, &spr_write_generic32,
> >                    0x00000000);
> >       spr_register_hv(env, SPR_HRMOR, "HRMOR",
> >                    SPR_NOACCESS, SPR_NOACCESS,
> > @@ -5665,7 +5665,7 @@ static void register_power7_book4_sprs(CPUPPCStat=
e *env)
> >                        KVM_REG_PPC_ACOP, 0);
> >       spr_register_kvm(env, SPR_BOOKS_PID, "PID",
> >                        SPR_NOACCESS, SPR_NOACCESS,
> > -                     &spr_read_generic, &spr_write_generic,
> > +                     &spr_read_generic, &spr_write_generic32,
> >                        KVM_REG_PPC_PID, 0);
> >   #endif
> >   }
> > @@ -5730,7 +5730,7 @@ static void register_power10_dexcr_sprs(CPUPPCSta=
te *env)
> >   {
> >       spr_register(env, SPR_DEXCR, "DEXCR",
> >               SPR_NOACCESS, SPR_NOACCESS,
> > -            &spr_read_generic, &spr_write_generic,
> > +            &spr_read_generic, &spr_write_generic32,
> >               0);
> >  =20
> >       spr_register(env, SPR_UDEXCR, "DEXCR",
> > @@ -5741,7 +5741,7 @@ static void register_power10_dexcr_sprs(CPUPPCSta=
te *env)
> >       spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
> >               SPR_NOACCESS, SPR_NOACCESS,
> >               SPR_NOACCESS, SPR_NOACCESS,
> > -            &spr_read_generic, &spr_write_generic,
> > +            &spr_read_generic, &spr_write_generic32,
> >               0);
> >  =20
> >       spr_register(env, SPR_UHDEXCR, "HDEXCR",
> > diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> > index 779e7db513..fb351c303f 100644
> > --- a/target/ppc/helper_regs.c
> > +++ b/target/ppc/helper_regs.c
> > @@ -448,7 +448,7 @@ void register_non_embedded_sprs(CPUPPCState *env)
> >       /* Exception processing */
> >       spr_register_kvm(env, SPR_DSISR, "DSISR",
> >                        SPR_NOACCESS, SPR_NOACCESS,
> > -                     &spr_read_generic, &spr_write_generic,
> > +                     &spr_read_generic, &spr_write_generic32,
> >                        KVM_REG_PPC_DSISR, 0x00000000);
> >       spr_register_kvm(env, SPR_DAR, "DAR",
> >                        SPR_NOACCESS, SPR_NOACCESS,
> > diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> > index a9bc1522e2..40ddc5c08c 100644
> > --- a/target/ppc/misc_helper.c
> > +++ b/target/ppc/misc_helper.c
> > @@ -190,13 +190,13 @@ void helper_store_dpdes(CPUPPCState *env, target_=
ulong val)
> >  =20
> >   void helper_store_pidr(CPUPPCState *env, target_ulong val)
> >   {
> > -    env->spr[SPR_BOOKS_PID] =3D val;
> > +    env->spr[SPR_BOOKS_PID] =3D (uint32_t)val;
> >       tlb_flush(env_cpu(env));
> >   }
> >  =20
> >   void helper_store_lpidr(CPUPPCState *env, target_ulong val)
> >   {
> > -    env->spr[SPR_LPIDR] =3D val;
> > +    env->spr[SPR_LPIDR] =3D (uint32_t)val;
> >  =20
> >       /*
> >        * We need to flush the TLB on LPID changes as we only tag HV vs
> > diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> > index 1381072b9e..64a64865d7 100644
> > --- a/target/ppc/power8-pmu.c
> > +++ b/target/ppc/power8-pmu.c
> > @@ -272,7 +272,7 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sp=
rn, uint64_t value)
> >   {
> >       pmu_update_cycles(env);
> >  =20
> > -    env->spr[sprn] =3D value;
> > +    env->spr[sprn] =3D (uint32_t)value;
> >  =20
> >       pmc_update_overflow_timer(env, sprn);
> >   }
> > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > index f603f1a939..c03a6bdc9a 100644
> > --- a/target/ppc/translate.c
> > +++ b/target/ppc/translate.c
> > @@ -413,7 +413,7 @@ void spr_write_generic(DisasContext *ctx, int sprn,=
 int gprn)
> >  =20
> >   void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
> >   {
> > -    spr_write_generic(ctx, sprn, gprn);
> > +    spr_write_generic32(ctx, sprn, gprn);
> >  =20
> >       /*
> >        * SPR_CTRL writes must force a new translation block,
>
> Just out of curiosity, is this the same as the problem described at [1] f=
or DECAR?
>
>
> ATB,
>
> Mark.
>
> [1] https://lists.nongnu.org/archive/html/qemu-ppc/2023-03/msg00451.html

Hmm, good thinking. But I'm not sure. DECAR is 32-bits so it should
probably use spr_write_generic32 (I didn't convert any BookE specific
regs). But the test sets 32-bit value for DECAR so I'm not sure if
that would be the issue. That said I don't see where the value is
getting sign extended.

Thanks,
Nick

