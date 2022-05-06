Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A956351D69D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 13:26:02 +0200 (CEST)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmw5x-0003rX-BS
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 07:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmw2g-0002T3-L6
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:22:38 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmw2e-00044N-WB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:22:38 -0400
Received: by mail-yb1-xb29.google.com with SMTP id g28so12273005ybj.10
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7gsctiBwIuEVoCpDZmSg2ZOi0YNIRQ0f2vdtuaDP88=;
 b=gU27V/gxHSoAWRhENKT6OY9P79f+NM9Iphf5dBAckk0Cu/vKmnmbdGu11GHnwu9UKz
 RivlADUPzNn2bb0NvpJvJlL16/or9c4UIObfpch8yJpLtK/nvaibpwL61xvTTV2eW1uk
 RZmFP6skL188jjABoE2uQUbPwlJ8N2RTbxJuh33WQ3n9GKEY+4l4ma+ESV+gA2mBaXdj
 /ayvE7Mvm/SHUMAqrvJGQJGZk2v6k5etCfAsocz85NixIibT3Dox9wg+GAE6DVyzQFX/
 g/6X32vE5J9ZxIaQGuyZvYzuE924IHLEdxUeN+Movl7cX0+HkphevVaonICRVWkh/h+f
 aZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7gsctiBwIuEVoCpDZmSg2ZOi0YNIRQ0f2vdtuaDP88=;
 b=Sd6bjOfKkIyNbPEre+5RFtxvj4F5bnzj/Hdx/hTi0iPfLrw1IIWTzPB5quPQdOYdJ4
 PslFD2Dc/lkexEfvyddQc+w2qT4oLykQchj0gDQEY1VQtHoWWC1aMh27c2D3YW8Zl81N
 MWRwlRy6SSqVLQBS7Pn5mNw+cKvHu4HXheT+k69rvlagwvdI3xz66RtRE8ui+x8r6ilG
 15ZcEjSv9AImDgVxSF28Hzvj7h/uUnlB2huEp4Zp/aRcl2vhLIOQvq9UyhCXQNKduVYO
 FU4pgWUmBIOVOJGpnG00I4JM1vGgVrqtuxSwohnb/iC1so1pQEWt45rYzJ32A2shQVik
 1Ybg==
X-Gm-Message-State: AOAM531v411+xxB+p0//d6/a/erZMa2gq8nkDzszWFU7nnC5ROunisFN
 pidQxDwDhH1DR8BxZ26KeKQgVwC9u82FbkexQMS+4g==
X-Google-Smtp-Source: ABdhPJwZesRxrRxgmGWGV5GpwnkGyB9glqwD3KFb2eiTV/OOAJd8JyQuRjzUmNcAL4kZWYhJJXkg+jmuTuVM7SC0p0M=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1945433ybq.67.1651836155929; Fri, 06 May
 2022 04:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220505185006.200555-1-richard.henderson@linaro.org>
 <20220505185006.200555-2-richard.henderson@linaro.org>
In-Reply-To: <20220505185006.200555-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 12:22:24 +0100
Message-ID: <CAFEAcA_zyq=7nDWrvK=6tcLk14AAkc2T-pwGtoAZqpjvUEBx+Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/24] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 May 2022 at 20:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> More gracefully handle cpregs when EL2 and/or EL3 are missing.
> If the reg is entirely inaccessible, do not register it at all.
> If the reg is for EL2, and EL3 is present but EL2 is not,
> either discard, squash to res0, const, or keep unchanged.
>
> Per rule RJFFP, mark the 4 aarch32 hypervisor access registers
> with ARM_CP_EL3_NO_EL2_KEEP, and mark all of the EL2 address
> translation and tlb invalidation "regs" ARM_CP_EL3_NO_EL2_UNDEF.
> Mark the 2 virtualization processor id regs ARM_CP_EL3_NO_EL2_C_NZ.
>
> This will simplify cpreg registration for conditional arm features.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +    /*
> +     * Eliminate registers that are not present because the EL is missing.
> +     * Doing this here makes it easier to put all registers for a given
> +     * feature into the same ARMCPRegInfo array and define them all at once.
> +     */
> +    make_const = false;
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        /*
> +         * An EL2 register without EL2 but with EL3 is (usually) RES0.
> +         * See rule RJFFP in section D1.1.3 of DDI0487H.a.
> +         */
> +        int min_el = ctz32(r->access) / 2;
> +        if (min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2)) {
> +            if (r->type & ARM_CP_EL3_NO_EL2_UNDEF) {
> +                return;
> +            }
> +            make_const = !(r->type & ARM_CP_EL3_NO_EL2_KEEP);
> +        }
> +    } else {
> +        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
> +                                 ? PL2_RW : PL1_RW);
> +        if ((r->access & max_el) == 0) {
> +            return;
> +        }

I did wonder if we had any cases where an EL1-accessible register
is marked with CP_ALIAS and we are relying on an EL3 register
(not-guest-accessible but still kept in the hashtable CPReg)
to do the migration and reset for it.  But I had a quick look
through and I don't think we do. (We definitely do have cases
where we have an AArch32 CP_ALIAS register that relies on the
AArch64 cpreginfo being in the hash table even when the CPU
doesn't implement AArch64.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

