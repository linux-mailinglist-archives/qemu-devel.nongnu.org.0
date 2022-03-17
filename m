Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C84DCB68
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:28:27 +0100 (CET)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUszB-00087K-Sv
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:28:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUswR-0006iH-84
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:25:35 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=36780
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUswM-0003zo-6i
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:25:32 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id f38so11212241ybi.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/1oh9zs/EKABTbVT/sL1101c/OQmJq6KooNBWajgnbY=;
 b=Fo08BvOc7nCygAXUrFFaulfi/I/QlGydZOUXnM+afRTL+8r1uLl4WDwvXyxN2JE9f6
 qrzSG48eyJXXrb/arZ8PJOQA5IZpWjUrKuMkcb6tlcXUGuH3m6jaOe0xjBMKhFpX3lQg
 SPr7adkmKyK4kQm3nBAwEg+71ylBsGU9kihzL8tqWhe7fIA36m8W9sn4LdolYTpi393f
 +33HFVcixNapVR9Elgmgf07FmJjEvD3UZc2aOLQLqRUl+S2d5cXBA8KreJOP8DzW+uYR
 8/albY6yid2ruqwV1itsKlGAJRqN2Mmnxu3EXd9ojn0X5lzMyMPtzJqG4WAoFj/bEO2/
 MUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1oh9zs/EKABTbVT/sL1101c/OQmJq6KooNBWajgnbY=;
 b=1c1Xo/Pyan/KJyzU/jVl0uxUKR9bsqx7pNtTuHbHtobf0AqM8olsIQel7/dU7qJ6zU
 bCRIXQF+Q2FhBMWTRpg2jd2UBR5FVKUiirDaI1YeJm8q2zUiv70A8pWDMRAcN4DqNUIJ
 Sbnc25+/QCpQy7VKOWk4ch0HznIzV+yeOizqE9SwVAKOISeSWaG/FN9sg/2UdS6lAjin
 JJ6a2vr3J1qLbZ1ekCaEkdPUQp6ewt6HKFfi9SNXdH8IYyVUq7LdBRjGDZXo1KjdF/+W
 bxFgyqyVeaeK7lXtLcFBdtbqpzbyZroVhttZg6CDnPB4jRRtzNCg7uGW0g+ugmj2lV8M
 A9Ig==
X-Gm-Message-State: AOAM533ag8jxJeb/bxqtGhrSQNpJ8z23Pz+mPSQih66nW0wQDwJ9RQgc
 xzopJBPizcGoVM1RXurEjuRnJ3QN/rlXMD095E2e9Q==
X-Google-Smtp-Source: ABdhPJxhoemH/xeQBFpWGfEdIquJOAuUT5IbgU9kOgu0/Vzqa7rx3+P5gJgUvtgbJuUIEHpnGHblT8ZHeZ0wpjOV6k0=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr5854961ybf.288.1647534327496; Thu, 17
 Mar 2022 09:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-37-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 16:25:15 +0000
Message-ID: <CAFEAcA_hck2+FEREwKWFY-WmndUUvHByJD_0CRFfCm=qmFrkyA@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 36/51] target/nios2: Hoist set of is_jmp into
 gen_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rather than force all callers to set this, do it
> within the subroutine.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

