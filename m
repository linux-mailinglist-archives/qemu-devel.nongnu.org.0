Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45417702B36
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:15:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWAJ-0008Dg-3R; Mon, 15 May 2023 07:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyWAD-0008Cy-NP; Mon, 15 May 2023 07:14:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyWAA-0000lK-Ui; Mon, 15 May 2023 07:14:48 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6439e6f5a33so7750776b3a.2; 
 Mon, 15 May 2023 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684149285; x=1686741285;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nw8SbkK50gciHLDQqc/ZTYjLs36EYHvlhw+gK7jcIUI=;
 b=gPAhAll77PFpRKAm9D23gMtFbZ7BbKquTO6FLNCFNQqePNnGlsIcmihBcYXaHknImL
 YbwR6GrW4ucADauKkWYUjsW7Zl+VDqM+obpB6A+M6kplh8qkoa+dE0wxOp8wlosWHxKr
 uGbPanjrc8RWg7sDi5ltgYlC1nzW243zmMDGx4PQt6Qr2SY/mfDjV/qMCUqqHNHe3FMW
 1uo5YPXjLE1oCrcv63Et+gHvOswq1l8l3p0djrLCBy1YQnavYiD75SLg2WKpllVIZr6/
 F0BjFuvyaVyOImCO9Yi3rkN9VFVo9lK5sALCeQalo04bbQyt2mb0nFbvGU1BgdeU0zqm
 WRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684149285; x=1686741285;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Nw8SbkK50gciHLDQqc/ZTYjLs36EYHvlhw+gK7jcIUI=;
 b=GJOXs08yxl+VFk4ajmQhcoS2P4pREu9BoL/iin30UiDHVRgzYrZwvq5akdX/fyl+ns
 C3NbLOeNDAB348S6ctoqdX3usKxIL4unsQHT9WvTmRSop50sZfSVRRlOM17b3rXuh3WS
 HU4PerN3I7GNquUzZ/tX+RrI/j6bPycYzRiwh3jGbcyvcHipWRuQE71tMqnuMJAww3XF
 cdvLfc+x+bLtJpOZpYuP4iAwkDklKmgH8t4VomoRGFbKqByHwXZU/WdIrWZRa7hzS9Gl
 fmLhdcpQatXNUI2hAih1VilEW6cEBvVU5Rdvuw/TLc4+Mz3H/l7YH3sRrUy0lmjcxfxh
 sr2A==
X-Gm-Message-State: AC+VfDxshw+SCQVW0oX+BJoQVKxy0f8YYGEshI2rHGh3ovhtIMYdVRRU
 VBJN0wGo3FhRcmOa18hYj/k=
X-Google-Smtp-Source: ACHHUZ7sZb4QnOnrqcktYbZmDDv5rB8Z9KmOnPRcN33HC+lBwzNk9kkNiW2CpDSPgBHJ8L4xDbK0Uw==
X-Received: by 2002:a05:6a20:8412:b0:101:7e8e:445d with SMTP id
 c18-20020a056a20841200b001017e8e445dmr26499009pzd.19.1684149284651; 
 Mon, 15 May 2023 04:14:44 -0700 (PDT)
Received: from localhost ([202.168.30.146]) by smtp.gmail.com with ESMTPSA id
 m14-20020aa7900e000000b006466d70a30esm11929431pfo.91.2023.05.15.04.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 04:14:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 21:14:39 +1000
Message-Id: <CSMT3E487TJC.ZC33PI8GH2DK@wheely>
Cc: <qemu-devel@nongnu.org>, "Daniel Henrique Barboza"
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH v3 1/9] target/ppc: Fix width of some 32-bit SPRs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230515092655.171206-1-npiggin@gmail.com>
 <20230515092655.171206-2-npiggin@gmail.com>
 <c345f589-7fac-8624-06d4-ead03a2ba005@linux.ibm.com>
In-Reply-To: <c345f589-7fac-8624-06d4-ead03a2ba005@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x432.google.com
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

On Mon May 15, 2023 at 8:14 PM AEST, Harsh Prateek Bora wrote:
>
>
> On 5/15/23 14:56, Nicholas Piggin wrote:
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
>
> This change broke linux-user build, could you please check once?

Sorry I did notice you reported that already, must have lost it
along the way somewhere. This incremental patch should work?

Thanks,
Nick

---
diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index 8437eb0340..4c0f2bed77 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -81,6 +81,7 @@ void _spr_register(CPUPPCState *env, int num, const char =
*name,
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
@@ -109,7 +110,6 @@ void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, =
int gprn);
 void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn);
=20
 #ifndef CONFIG_USER_ONLY
-void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
 void spr_write_clear(DisasContext *ctx, int sprn, int gprn);
 void spr_access_nop(DisasContext *ctx, int sprn, int gprn);
 void spr_read_decr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c03a6bdc9a..f5cf1457db 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -411,6 +411,18 @@ void spr_write_generic(DisasContext *ctx, int sprn, in=
t gprn)
     spr_store_dump_spr(sprn);
 }
=20
+void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
+{
+#ifdef TARGET_PPC64
+    TCGv t0 =3D tcg_temp_new();
+    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
+    gen_store_spr(sprn, t0);
+    spr_store_dump_spr(sprn);
+#else
+    spr_write_generic(ctx, sprn, gprn);
+#endif
+}
+
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic32(ctx, sprn, gprn);
@@ -424,18 +436,6 @@ void spr_write_CTRL(DisasContext *ctx, int sprn, int g=
prn)
 }
=20
 #if !defined(CONFIG_USER_ONLY)
-void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
-{
-#ifdef TARGET_PPC64
-    TCGv t0 =3D tcg_temp_new();
-    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
-    gen_store_spr(sprn, t0);
-    spr_store_dump_spr(sprn);
-#else
-    spr_write_generic(ctx, sprn, gprn);
-#endif
-}
-
 void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 =3D tcg_temp_new();

