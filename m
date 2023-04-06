Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6E6D96FF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:27:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOgk-0006Hr-Nc; Thu, 06 Apr 2023 08:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOgi-0006Hj-T9
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:26:00 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOge-0000R3-6M
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:25:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-4fa3c1a7a41so1072188a12.2
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680783954; x=1683375954;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8GJX9uvis/fBtbax3ZSylvM9CyUXcUN7rBTejAJ2WyU=;
 b=H+mL0Ga7PGP+nzI+60BkAYgK5/GzYEUiz7L0z4JDs9UiEtlB6VtN8AeKgCXZwYZT78
 PZYIjWTp8ic6rHYPFuC6lV+cGa4Nvz2ATjwOFdBgMs8ilLxAxbfehRAtWp6glucgv+to
 yDw9S1pATFYV+bAIABy/JiFHOUN3XqmkPM6P2wEz5fPebRef48sOMZid5ywH5Gb0Izj8
 vIwf4Re18eTrGh4Kd8Bgirb7HtEljja3PCLiAHnqWMwDZrSAi7F7mYGEh8LfKY/zaXeX
 XF+2O2Vr9euCTVnsoVsfU4yY4a1klW2wxGJe0WChyrYnS7JTCmGRLhjlS1kpg2+1cJ7Z
 F4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680783954; x=1683375954;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GJX9uvis/fBtbax3ZSylvM9CyUXcUN7rBTejAJ2WyU=;
 b=zXPLn/gj+7vKtsMBvVWG7S2vV0HeiQQ8Eg/fMwWm6aVdMBwK9z2xuqPn2IayJVUGt7
 PiEz2mVk9vIc4aVF0uhSInqGK0tOZimh0GNpXO5hdfoFAKb7v7FxNhl99EWzzkPmN9g6
 ZmQLZCPO9kkp3YoLxnLNWcOjIua26Kbj/XRLpwYz75hP18m3cB7VUQDbS+wJvvFrZHdv
 BEEY2ij/mcnJUJBM+WEm/9tkiGsckd2yTIOWBO0HaRFjCyHSlvv/aOLtPMShIrdOi9hO
 2i9x20aLKdTnK5UgEWdSbr9NergQ79ZSPoraNgMsrSxyr4O4Gw5IHg3n0P5xRSuyk7Tw
 ip5A==
X-Gm-Message-State: AAQBX9dyBrXLLktaKRGibcxitxy+dbx+XU+XKlSzNj++2xe9aQbgy5Ka
 Lf7AJF4q6FCZOQ/50tE0ZUmkDHv6aSGEmOQq3lMJtP1/qsc/ESF1fE0=
X-Google-Smtp-Source: AKy350Y4Cu4CWI2cPn6Q1I+wkQZpUQwhVuquml1Bt1Bk7dWt95UowacqSjUAqy8GGu8P9TnFBZXn7MRKRF/iRL75qgY=
X-Received: by 2002:a50:874e:0:b0:4fb:7e7a:ebf1 with SMTP id
 14-20020a50874e000000b004fb7e7aebf1mr2885540edv.6.1680783954009; Thu, 06 Apr
 2023 05:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
 <20221020122146.3177980-6-peter.maydell@linaro.org>
In-Reply-To: <20221020122146.3177980-6-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 13:25:43 +0100
Message-ID: <CAFEAcA9=uXLOpJrOK4jJXTyq=WUDOHOq33m2LeX-1P1zXoZ9sg@mail.gmail.com>
Subject: Re: [PULL 05/24] target/arm: Use probe_access_full for BTI
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Thu, 20 Oct 2022 at 13:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
> In is_guarded_page, use probe_access_full instead of just guessing
> that the tlb entry is still present.  Also handles the FIXME about
> executing from device memory.

Hi, Richard -- Coverity spotted a problem (CID 1507929) with
this addition of 'guarded' to the ARMCacheAttrs struct, and
then looking at the code I noticed another one...

> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 9566364dcae..c3c3920ded2 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1095,6 +1095,7 @@ typedef struct ARMCacheAttrs {
>      unsigned int attrs:8;
>      unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
>      bool is_s2_format:1;
> +    bool guarded:1;              /* guarded bit of the v8-64 PTE */
>  } ARMCacheAttrs;

The one Coverity spots is that combine_cacheattrs() was never
updated to do anything with 'guarded' so the struct value it
returns now has an uninitialized value for that field.
Since the GP bit only exists at stage 1 presumably this should be
   ret.guarded = s1.guarded;
? (If I'm not misreading the code this is an actual bug
because we'll use the field for the case where s1 and s2
are enabled.)

The issue I noticed is that in ptw.c when we set the
'guarded' field we do it like this:

    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
        result->f.guarded = extract64(attrs, 50, 1); /* GP */
    }

The GP bit only exists in stage 1 descriptors but we don't check
that here, so we will set the 'guarded' bit in the result if
the guest (incorrectly) sets the RES0 bit 50 in a stage 2 descriptor.
We should move this check into the else clause of the immediately
following "if (regime_is_stage2(mmu_idx)) ..." I think.

(It looks like this one pre-dates this patch to shift to
using f.guarded.)

thanks
-- PMM

