Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9326A0EA4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:23:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFIr-0005su-JP; Thu, 23 Feb 2023 12:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFIo-0005oz-FE
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:22:42 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFIm-0007Gh-C6
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:22:42 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c1so14067981plg.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 09:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H8MKTFApAT/Q1sRn9j5XRsAqf09x/WAziGPKsVxwhFs=;
 b=uV3oG5BdBS+QfHdGZ+0rw+gtx7r1y31q+C3YFMbx3x2nAnjovo+2vQuMLEFWZ/83s8
 etGNe4I2RN3+Ff6ZDBRu+WOXr0qUSKQTboBwGKox+/XaK7odbjhw/LfOa0lgRNSiZ7/Y
 qFPYC/sBlWvNHsAob2+Uvm+Ul2Fa++YUxBBvMu6w55epG4OAZhrYfavhegIsX8r07qJq
 k5UIoj8JLf9AuLgK999A/SPASVEQLkhdaf+qvcpPsb8K5JuxZipYMKZtueuhCAM7STJn
 iJstuwilu18FMsurt39KkP90T5kKzx34DCp0m7YPnhQTShUPagLn+/xjC6SebngndIWb
 rBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H8MKTFApAT/Q1sRn9j5XRsAqf09x/WAziGPKsVxwhFs=;
 b=1VYbDclT7h7mZzNQixzV/URvoqtaoOAycu6U3q/ojkLI9NwCckI00di68YUi9A1s5c
 Dw30RSBkhfCbWAEe5mR9XC4+IoLenPYZ2g+fhbqj+gVc6qfONemQ+9T8jc7s9Y16gzj7
 lGMYAr3xrGJWbzokHXwI76NfrGK1Kzl5SYJ++/Y3dOFHNEFGNyANk9LHPPovZWAsUP/p
 hK4XyY04A+XX+CofZasXY1OnUkX4t09sajf7hGWAPSP2TYQE2YEOfQSgIWEqsNdHYb6j
 YbcTQkFz4is0xdfy3weyITXqGjC4GVTeL7l4mNxvgUGAcViOIjsYNla7Ggq07Cyd11E1
 ofcw==
X-Gm-Message-State: AO0yUKWTcNemYVvNb5x8kB0orZ70F2h/5tY8k2IuYvENSKU9NSBhXHWS
 fdF0/+nJ6OWQZtwK9BMwzj4Ug5Pm5JNyVf+RrUgalw==
X-Google-Smtp-Source: AK7set9gSuMpzcecUlau/9dxkBV4E3Qv69Zp7tRKY6XWmNOiYW0EfXOKklYknWeKOMaby1Ik71tbYBpr/m59dE+RWYg=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1316094pjb.137.1677172958729; Thu, 23
 Feb 2023 09:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-17-richard.henderson@linaro.org>
 <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
 <835a509d-caa4-9cf7-88f5-d7f3705dd646@linaro.org>
In-Reply-To: <835a509d-caa4-9cf7-88f5-d7f3705dd646@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 17:22:27 +0000
Message-ID: <CAFEAcA-nAdnugbDPgwAknALzSzjN5nhrvVYjuBKuShEqJrZxKw@mail.gmail.com>
Subject: Re: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment
 checks for LSE2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 23 Feb 2023 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/23/23 06:49, Peter Maydell wrote:
> > On Thu, 16 Feb 2023 at 03:09, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> FEAT_LSE2 only requires that atomic operations not cross a
> >> 16-byte boundary.  Ordered operations may be completely
> >> unaligned if SCTLR.nAA is set.
> >>
> >> Because this alignment check is so special, do it by hand.
> >> Make sure not to keep TCG temps live across the branch.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >
> >> +static void check_lse2_align(DisasContext *s, int rn, int imm,
> >> +                             bool is_write, MemOp mop)
> >> +{
> >> +    TCGv_i32 tmp;
> >> +    TCGv_i64 addr;
> >> +    TCGLabel *over_label;
> >> +    MMUAccessType type;
> >> +    int mmu_idx;
> >> +
> >> +    tmp = tcg_temp_new_i32();
> >> +    tcg_gen_extrl_i64_i32(tmp, cpu_reg_sp(s, rn));
> >> +    tcg_gen_addi_i32(tmp, tmp, imm & 15);
> >> +    tcg_gen_andi_i32(tmp, tmp, 15);
> >> +    tcg_gen_addi_i32(tmp, tmp, memop_size(mop));
> >> +
> >> +    over_label = gen_new_label();
> >> +    tcg_gen_brcond_i32(TCG_COND_LEU, tmp, tcg_constant_i32(16), over_label);
> >
> > This brcond ends the basic block and destroys the content
> > of TCG temporaries, which is bad because some of the
> > callsites have set some of those up before calling this
> > function (eg gen_compare_and_swap() has called cpu_reg()
> > which might have created and initialized a temporary
> > for xZR).
>
> xzr uses tcg_constant_i64(), which has no lifetime issues.

Hmm? cpu_reg() calls new_tmp_a64_zero() calls new_tmp_a64()
calls tcg_temp_new_i64(). What am I missing ?

> I've cc'd you on a patch set that fixes all the temporary lifetime stuff.
>
> v1: https://patchew.org/QEMU/20230130205935.1157347-1-richard.henderson@linaro.org/
> v2: https://patchew.org/QEMU/20230222232715.15034-1-richard.henderson@linaro.org/

Cool!

thanks
-- PMM

