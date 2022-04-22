Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9554F50B64C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:42:57 +0200 (CEST)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrge-00007F-Mf
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqhc-0002IE-LZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:39:52 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqha-00084D-VL
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:39:52 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id b95so13751383ybi.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VhExIIqkJcCYMMl2HOEXhODyOT4ugxLj90w+PMdB02I=;
 b=ZqleoEO3Y0OHUu0qFEBx7h2sIgJsvPbmqpCsXa/OVMEysRXig8gc/KDJz2zZabomPp
 N2DiepJteTTRUtUpSUoKumEdNZENjQJvTeKV6aFXE/HHK4l2zQ6EfwO2sCHH6MPVB1sg
 pltqmF/Swcn2k8yIS7tYtQOKxVfkILJpPNUgePyMrG59UjLXMN1Kfn+sl/Gv6NeefJpE
 E5LzHpi2nKOdvzci64ZUM3ke1ZuXanHgrj7ssVHRgWDdqyD/oi6ZnGEOfbKWw2xOAEcM
 Uv4VIWJYFdZkiQm5WdL04CJGph+7FpIEIdPR4J+zzt7JuvdJE7Xa59nvdJHTzLMWRJc+
 JwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VhExIIqkJcCYMMl2HOEXhODyOT4ugxLj90w+PMdB02I=;
 b=a/FV6rtN1uYl9LMICO+GEubYeuQUybhfMrL6PTMqB3VvFiLB+7lLhvAgUdOXptLrQY
 3I3cDN43ga3hHBNUevtU9cHwCi+Zuy2stOzSicTdtiufsU+ryy8H/svyRikoWFC9ZnmS
 3X/tE8HQaU8suSL6Mtqrl6HTW75rbPc7TY6anIfrhry/vje9tQ4v1By0qZ9zaHtWkZ9i
 Z1KCUvCYt6BqMnQ62JhVa0vFP6BXx0mWt0b5htVGldXjZALfiJwkLOEFpnqodYlDtBTD
 1dGO7sUG/XxzbCV8BYbGXW6lb9vsrgXA2Elw2CSJaVKjBo3rm8BJddIr44hJTSlmMj+7
 +hhw==
X-Gm-Message-State: AOAM531tqf6xkT+lQXJE+M8xISKOUbw3gK1Ocgi7RN8x0yPZhIt2d/58
 +1nZIIXBsB+R9CM0KUOgncimzqaardZ0gcO52OatOg==
X-Google-Smtp-Source: ABdhPJz/W17mg4dmfekOgiZdmUAhacDEm7pKfUpoS9RFyFSEVL8CzbRUNW5vdns4RhUEAGEE7k7vFGwAAYBTEkNRfo4=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3710764ybs.85.1650623989833; Fri, 22
 Apr 2022 03:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-33-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 11:39:38 +0100
Message-ID: <CAFEAcA8ZFuyKO0jsMHX=Pg6grvmzWCgCpnt7EBWtRjTKne=tnw@mail.gmail.com>
Subject: Re: [PATCH v3 32/60] target/arm: Update sysreg fields when
 redirecting for E2H
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The new_key is always non-zero during redirection,
> so remove the if.  Update opc0 et al from the new key.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7c569a569a..aee195400b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5915,7 +5915,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>
>      for (i = 0; i < ARRAY_SIZE(aliases); i++) {
>          const struct E2HAlias *a = &aliases[i];
> -        ARMCPRegInfo *src_reg, *dst_reg;
> +        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
> +        uint32_t *new_key;
> +        bool ok;
>
>          if (a->feature && !a->feature(&cpu->isar)) {
>              continue;
> @@ -5934,19 +5936,28 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
>          g_assert(src_reg->opaque == NULL);
>
>          /* Create alias before redirection so we dup the right data. */
> -        if (a->new_key) {
> -            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
> -            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
> -            bool ok;
> +        new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
> +        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
>
> -            new_reg->name = a->new_name;
> -            new_reg->type |= ARM_CP_ALIAS;
> -            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
> -            new_reg->access &= PL2_RW | PL3_RW;
> +        new_reg->name = a->new_name;
> +        new_reg->type |= ARM_CP_ALIAS;
> +        /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
> +        new_reg->access &= PL2_RW;
>
> -            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
> -            g_assert(ok);
> -        }
> +#define E(X, N) \
> +    ((X & CP_REG_ARM64_SYSREG_##N##_MASK) >> CP_REG_ARM64_SYSREG_##N##_SHIFT)
> +
> +        /* Update the sysreg fields */
> +        new_reg->opc0 = E(a->new_key, OP0);
> +        new_reg->opc1 = E(a->new_key, OP1);
> +        new_reg->crn = E(a->new_key, CRN);
> +        new_reg->crm = E(a->new_key, CRM);
> +        new_reg->opc2 = E(a->new_key, OP2);
> +
> +#undef E
> +
> +        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
> +        g_assert(ok);

So is setting the new_reg opc etc fields here fixing a bug
(or otherwise changing behaviour)?

The effect is that read/write callbacks now get an ARMCPRegInfo*
that has the opc &c for the alias, rather than for the thing being
aliased. That's good if the read/write callbacks have a need to
distinguish the alias access from a normal one (do they anywhere?).
On the other hand it's bad if we have existing code that thinks it
can distinguish FOO_EL1 from FOO_EL2 by looking at the opc &c
values and now might get confused.

Overall, unless we have a definite reason why we want the
callback functions to be able to tell the alias from the normal
access, I'm inclined to say we should just comment that we
deliberately leave the sysreg fields alone. (Put another way,
I don't really want to have to work through all the aliased
registers here checking whether they have read/write functions
that look at the opc fields and whether any of them would
end up doing the wrong thing when handed the alias reginfo.)

The "remove the if()" part is fine if you wanted to do that
as its own patch.

thanks
-- PMM

