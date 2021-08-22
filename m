Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343E3F3F44
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 14:35:33 +0200 (CEST)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHmhH-0006JQ-T2
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 08:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHmfX-0005Zu-Nm
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 08:33:43 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHmfS-0001NL-9c
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 08:33:39 -0400
Received: by mail-ed1-x52a.google.com with SMTP id cq23so21588288edb.12
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wyCI6arNFbDQOL1dxmnG6iqp4DXhSAkXgNkCuE4MJMI=;
 b=aVXpRqBZfJIqig/ZHlzB3yNNKwcKAvZ13KfRk0Elre8K8IypYaJYrfCEf5Q4poZQ+7
 ba/8X10cfYZibV8WVEh/mof+WZIBNWdX4EprJ73S0/X25xORiuPR72+PAWzqXS/Y4Hqe
 +hR+mdZzju1n41q0/uI9lrrytm9bQ4cr5Gar1Jon8yZIU15csuwLZzewKcSM3BOgzO1/
 ISe6cUHnKUDWjgAUfPHN9SzItqxugMAiFheomdg69ekQTAlQzaI8J7os8FCTZKJf6FIV
 jFYEE4WipalrNA8uAlzZ4rpGfo7YJXQithYAkItGvUbmoKvGGdxmmykOJhAxtF0MhYMs
 fSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wyCI6arNFbDQOL1dxmnG6iqp4DXhSAkXgNkCuE4MJMI=;
 b=NA3AFICnHdY/uywV8+jCYBykwOYqf7ivIBJE+NVzMzutW7uc67UE3Q+Rl4RS2daj79
 Nn/prgPcSCKTreYlJQzHbvZ3jERbuzZSY7deRla/Y7eSDDxreFVxxSEQPMMS9V6ChZU/
 P+3qulQdTjDoELg8loCbLfRlZDishReXzzGvLB1Gd0H3p/dUnSb7KWTzo4nSpGSihsha
 VvMiaDU486SilPGerl8ArI590sqqSxMXwnB7bypf2Voj78MThGEcjyNwK8zuhw4yrUng
 iDntp3ao1TD1uh0Zwc3bjhUf1tcsxhTVGwIVpvxfC5JPLNuwH4hoRQX8kSm1dFtVWBsl
 PdXg==
X-Gm-Message-State: AOAM532iRvUL0dZGtHaWeFj6lTLF64A6rRic1d7htRpri4jkLSpxp6Qi
 wpkhSJcH6uhtvnOOAkvnG2bWnpovcVGTEyCpNCOxRA==
X-Google-Smtp-Source: ABdhPJyJTOWVzsiruBnZCd4aPswWdp7Y9Zpsf6ZIoSnTM89xySB+TSPYpCBA++LAbPI9Zn4b/0h9j6vyZj9ig5+MOiU=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr31931797edb.52.1629635616724; 
 Sun, 22 Aug 2021 05:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-64-richard.henderson@linaro.org>
 <CAFEAcA9Ze3zzQ_O1rRJKaP-681RDJf288uQJx83GEduHetAegQ@mail.gmail.com>
 <490decb4-1cb1-b1b4-8d4b-a72de60d51b7@linaro.org>
In-Reply-To: <490decb4-1cb1-b1b4-8d4b-a72de60d51b7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Aug 2021 13:32:50 +0100
Message-ID: <CAFEAcA8x5XpNVgcPQ9rEhAvZz+7h34tmt32aM8MYC_oRRNVA6g@mail.gmail.com>
Subject: Re: [PATCH v3 63/66] tcg/tci: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Sun, 22 Aug 2021 at 08:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/20/21 3:14 AM, Peter Maydell wrote:
> >> @@ -377,11 +381,11 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
> >>   static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
> >>                           MemOpIdx oi, const void *tb_ptr)
> >>   {
> >> -    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
> >> +    MemOp mop = get_memop(oi);
> >>       uintptr_t ra = (uintptr_t)tb_ptr;
> >
> > Don't you need this bit in tci_qemu_st() as well ?
>
> Which bit isn't present in st as well?
> There's missing hunks in your reply, but afaics they're the same.

https://patchew.org/QEMU/20210818191920.390759-1-richard.henderson@linaro.org/20210818191920.390759-64-richard.henderson@linaro.org/

I had the function name wrong, but only the tci_qemu_st() change
has this bit:

-    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+    MemOp mop = get_memop(oi);

-- PMM

