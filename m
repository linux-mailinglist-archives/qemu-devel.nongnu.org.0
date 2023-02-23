Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4126A0E38
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:51:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEnF-0003il-0b; Thu, 23 Feb 2023 11:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEn8-0003hA-Q1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:49:58 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEn6-0005Nk-SN
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:49:58 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so4323490pjn.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FN4yR6P6JwjbPuePogjYQjwTaGhiPmWqCQYCVzrg4QI=;
 b=nN/f942wZ3WZMU8B3U3L/1mvaOg0uDq7WbDqR4j3nDoPDMU8e7vjdsE2wMKyxu0hXG
 uNYaZkaU2OazX/Bf9oQlsCtMp33J1HVWaMx/RhhoYy5aDzaSe42+dWTlH38urIzeZ3Tv
 R72N+LkP1GdfYeWSNwXAhhZ3VO21+JHMLXeg4NH9ZIfw778yO1KF8yQVHgDpJspZ8Hhb
 giPDs740XUDw3yoRjgxXkt/uTLgY5dcYfiLeAIfH//6YPjseo67WcNuKJLadIoXykujh
 0LwOCcx9SkjSp63wIXz5msyhzlAxrgOBQN7mWKpi1AYn20qtru6Lg+zIIjeZpoQeKLBg
 oFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FN4yR6P6JwjbPuePogjYQjwTaGhiPmWqCQYCVzrg4QI=;
 b=4Zpgm3qSnSsq2QCDj+2nV9Faso3pj9Vm0mg6LHDXJvb0C4Ji7VYBEVob7mPScP1mG+
 VAvew0pHXlFyS0SEt2tctyQu/2tG6vn3FrzPAGPlqvA+ph1ZcH4GYwa2ie2L+HuR+v97
 o8gSgJnFWdI8D1gHSnO7EGPlXqOdNvnPLsKLHy3C8HzeUvO/e+nEgexZIu7pyQA2Nx2r
 X27WAtFoTNZ5Dg7dy/wwiIfTRzDXxJrzf+muS0phbCpZWviddzlp4ajatR8KFP4u6nxq
 Y1fumn83r0Gf5FRqaFdb+w3SS0+e9DpYLri+s/ArhDJ/BdORD7rNoXrpz0zKgLiZmh2o
 2hNQ==
X-Gm-Message-State: AO0yUKWSv1P2ju5tzCfb26nQ5zY3HJJR0JL4JNJIBkfLajwj3f449lJI
 0aWJrr2GPawG476L+pQWl1USG/+uA2/+1wObJgz4PA==
X-Google-Smtp-Source: AK7set9ZBCM6Kzg2Ol5vKqbOH8U5t1XzYo47+3N1lKcHHdiUYULuhMAvdxJJ2mAUw0sPSKzH15utKtwt+2UFycT6yL4=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1285811pjb.137.1677170995026; Thu, 23
 Feb 2023 08:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-17-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:49:43 +0000
Message-ID: <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
Subject: Re: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment
 checks for LSE2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 16 Feb 2023 at 03:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> FEAT_LSE2 only requires that atomic operations not cross a
> 16-byte boundary.  Ordered operations may be completely
> unaligned if SCTLR.nAA is set.
>
> Because this alignment check is so special, do it by hand.
> Make sure not to keep TCG temps live across the branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +static void check_lse2_align(DisasContext *s, int rn, int imm,
> +                             bool is_write, MemOp mop)
> +{
> +    TCGv_i32 tmp;
> +    TCGv_i64 addr;
> +    TCGLabel *over_label;
> +    MMUAccessType type;
> +    int mmu_idx;
> +
> +    tmp = tcg_temp_new_i32();
> +    tcg_gen_extrl_i64_i32(tmp, cpu_reg_sp(s, rn));
> +    tcg_gen_addi_i32(tmp, tmp, imm & 15);
> +    tcg_gen_andi_i32(tmp, tmp, 15);
> +    tcg_gen_addi_i32(tmp, tmp, memop_size(mop));
> +
> +    over_label = gen_new_label();
> +    tcg_gen_brcond_i32(TCG_COND_LEU, tmp, tcg_constant_i32(16), over_label);

This brcond ends the basic block and destroys the content
of TCG temporaries, which is bad because some of the
callsites have set some of those up before calling this
function (eg gen_compare_and_swap() has called cpu_reg()
which might have created and initialized a temporary
for xZR).

Using a brcond anywhere other than directly in a top level
function where you can see it and work around this awkward
property seems rather fragile.

(Ideally there would be a variant of brcond that didn't
trash temporaries, because almost all the time that is
an annoying hazard rather than a useful property.)

> +    tcg_temp_free_i32(tmp);
> +
> +    addr = tcg_temp_new_i64();
> +    tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm);
> +
> +    type = is_write ? MMU_DATA_STORE : MMU_DATA_LOAD,
> +    mmu_idx = get_mem_index(s);
> +    gen_helper_unaligned_access(cpu_env, addr, tcg_constant_i32(type),
> +                                tcg_constant_i32(mmu_idx));
> +    tcg_temp_free_i64(addr);
> +
> +    gen_set_label(over_label);
> +
> +}

thanks
-- PMM

