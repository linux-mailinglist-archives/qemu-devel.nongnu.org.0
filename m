Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318B50A8DE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:15:45 +0200 (CEST)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcHI-0005Kc-Bo
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcAa-0003Ru-Ti
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:08:49 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcAY-00024Q-P0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:08:48 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id b26so4810477ybj.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7GXejyT0h4UksFxHnb4Z5L4Ve+Mgt1/oZACuTAXAXpc=;
 b=ewaGdL6b/+cQw8o4IpFM5wJKkFb4IknCM0lm6vDs8HuRTJXnt4pESYSffoQysuHHvT
 uilQ594RDcgGUzszrxIxu43rzDUSs6wVqdAg1FAAJy9bP8SCzE7i8Nz+SPd27TIQWzub
 5bsPlIghjkAvQ6hS51JVNQKtfwdhxrwNX7Az4adT3AJBQInqv8vUjvmKffhpph6UgQSK
 PhPemRyvtCxi+BLBYnKM2IiPWyVthC6huikMNPm8eeWhF9NmrGdLM+xEIvoPStLHLThg
 UO3ByAtVlmidunhS7sHz0NUMfL/YcZBFEdfYW5Yc5g0sJH1wOw5+OuG6zdFcjHCsyH1l
 rURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GXejyT0h4UksFxHnb4Z5L4Ve+Mgt1/oZACuTAXAXpc=;
 b=dW53cvFWyH+UpM7MXUw2MmsTNQezoQhplimQHJN1SlF/LJxxHJqxO2Xf+f3OJzK3NO
 s0jwhWqvFyVODnInNPVHK50P8OHn2IicCdiy4kmRHFajILKZSq1imU0nNPI11xa0rt4e
 lXm9jhZxIuAiST1aPikXdoSfihE8oWAQRTdEBKeL+3rDw2omx3U5xiY/vrrIVNATnB1Z
 gJapFw2oEh7rptUxIHrV5TMFM/McEAmPY1c2n+cPIRoLcD9VF/0yzpv7E5bRRPH4Zech
 drD1Y7pQ3btXL6fOjk3xfwFM8E8Zj9SP1vR6CZ5QdnHIYFH7X6xtJFz5jawnkl35OVIO
 6Y0g==
X-Gm-Message-State: AOAM5324ctDowfiqZ+5oxuTIw23HVQJ9t/8tzgeAKF/rtokv0+s5xW6N
 yLOEwNlYV7mM75tkQA1CX9+oIYjHVLMG7pwzeiCIDw==
X-Google-Smtp-Source: ABdhPJxDK80vwVW10buQvnDHvzn9+neESbCJpMP1pnOx3dfR3bh1JIIw7htgm1q9s4o6ju6OzgPAToiZAcPRXb5Tocc=
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr1174841ybi.479.1650568125846; Thu, 21
 Apr 2022 12:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-22-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:08:34 +0100
Message-ID: <CAFEAcA-84gFANHDa-3WOD0BT50Vg+ivCM_vpHp_ZmSrxNZvJfg@mail.gmail.com>
Subject: Re: [PATCH v3 21/60] target/arm: Use tcg_constant in translate-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Sun, 17 Apr 2022 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64} as appropriate throughout.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 198 +++++++++++++------------------------
>  1 file changed, 68 insertions(+), 130 deletions(-)
>

Too big, again.

thanks
-- PMM

