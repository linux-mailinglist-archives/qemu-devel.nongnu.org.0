Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA02B2FBFE6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:23:08 +0100 (CET)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wap-0005R9-SQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1vPj-0003J5-V3
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:07:36 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1vPi-00063P-5T
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:07:35 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ke15so22136304ejc.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OdKQmtVVjP03vzho+BTMsv4m08yb4tpUnA6YlUcfrJo=;
 b=s1s9L7Q3UI2w/WmIPkPcho9jEdGvEden2c1uqfDYgtzS0qgzA2uvtDAyS6FYzM4JT+
 K/PSllr799JDdgasDkZUsvrarEY1m1RFNthMUIrfR62ps7kjGgx7ae840F5ERtY/G+QQ
 nokdHkgC50AjDMPoMWRZ+JNMkq8+D4kP95RO/qUBa4fBWPfksA6l2AajkyF7pmumcaI3
 Fn3K4e5lOP9unDbYVx3ydJ6BlfysXeRaH4QFKhmj1Bno18n53vmzK90YVCNbSX0zFjPB
 iMaqK8A3EbTSkZhhUH9OYamRrU7fv7lnuXg9e4499n5m2toXYm89EhIl3NROCZmuvocy
 f0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OdKQmtVVjP03vzho+BTMsv4m08yb4tpUnA6YlUcfrJo=;
 b=ERb4C2oB001ITOY54RjC4RWnNyS4xfpjJOf7Afh+LGMQWozK849kDokyAkluVtlEv0
 uPMZs2wSWKGxQPjvaapm8dX4Jfaraj6Q2q9pKHlt3BdmmpSwooFojc3JT6i1R4/+6pnL
 ufc2sP+gKqeMYtj04BHhoxEm+vI8HItWhPrIKpaYnglbh1jIRNKJFN+X8Iky70bRkme9
 qO1n1ZFvH3Kmq1h+otO+2GwUYt06l07n1ZacJqV0Nb7tUou58tY8n+cGBr2bSslcMgik
 EKjsdIhz5M3B0TjU6HALabKUQZTQNiagFgeMtcc6perw2zzs92CBLApdvWQEvJeH4zfo
 snwg==
X-Gm-Message-State: AOAM533rNYIVqdVf+wRrFOLTacly227bLsbAiJR65PiDAn6mgghBH0hk
 037EYElXkeYgz77IFrPZ2bMMtBfzsRsIAEV9kYZyvA==
X-Google-Smtp-Source: ABdhPJygK4Qc28PW4tFiSH6rAVijTAOFnIZva2VaOEl/zVSNrQD5/7UPHCO0QtoksHcuHU/0e842ByVLy+uz1nKLkcA=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3700290ejv.4.1611079652528; 
 Tue, 19 Jan 2021 10:07:32 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-4-richard.henderson@linaro.org>
 <CAFEAcA9pnbrQYihP8NkajM0LHYzciuoO9xNmRmCbBaqB+WV5Qg@mail.gmail.com>
 <0852e1ab-bf36-09cf-81fe-4c6349a2cdfc@linaro.org>
In-Reply-To: <0852e1ab-bf36-09cf-81fe-4c6349a2cdfc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 18:07:21 +0000
Message-ID: <CAFEAcA8kB9oaaZkgB8F0E-UQCJx68dKq6XYo+eHf_wVVr7P7Vg@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] tcg/i386: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/19/21 4:38 AM, Peter Maydell wrote:
> >> -    case 's':
> >> -        /* qemu_st8_i32 data constraint */
> >> -        ct->regs = 0xf;
> >> -#ifdef CONFIG_SOFTMMU
> >> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
> >> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
> >> -#endif
> >> -        break;
> >
> > But in the old code the 's' constraint is 0xf for both
> > x86-64 and i386.
>
> That's perhaps laziness, or simply the lack of names in the old code.  It
> logically should be BYTEL, because that's where byte stores go from.
>
> In the end it doesn't matter, because this constraint is *only* used by i386.
> The opcode INDEX_op_qemu_st8_i32 is not used by x86_64 at all.  See
> TCG_TARGET_HAS_qemu_st8_i32 in tcg-target.h.

OK. Can we keep actual changes in separate commits from
just-refactoring changes, please?

thanks
-- PMM

