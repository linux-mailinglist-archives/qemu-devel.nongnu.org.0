Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4074FBD14
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 15:29:35 +0200 (CEST)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndu6n-000342-M6
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 09:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu5P-0002AE-Gk
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 09:28:07 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu5N-0008TP-Os
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 09:28:07 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id x200so3749229ybe.13
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Epo2ERKbOm4RHSL9/kKh/72aj5Dko3zjQ6Gy9qpXIos=;
 b=l2eumJSSqfSGOOGVJOCu5Nw2Fvq/yhr1I/QsLL46qP/+Gm6FI7luW/IYEZ5jUkydLw
 tWk3kewbPsbxoCvJX9ZsreuIvaoWBHAIjQlqyLDYaRN/F80pfhYJH1t4QqTqpUHT9onz
 K1X4apg6YHd0YbkWZwmATkhcC2zGE1R1w3JixS0EH1Anz3QTtc2n0y/BpBcFnfxHZ8Zs
 m39dzd1RKH1dGsEub6lfGnTOc+2oL4+cZHJga+BT3aR9dkxU06jYeRESBbkjaB3OwYS+
 MgxwRhv4jI9c7AYuDOyIkyKHpVSw88w+g7azSdQlhm1JMI7E2JMO8Ys/Vllm98MNRakS
 qX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Epo2ERKbOm4RHSL9/kKh/72aj5Dko3zjQ6Gy9qpXIos=;
 b=uRx3GsDr50IGAd9WCpvOsKWn/cmWTeT1MWDvpbLk8JF9wVzx0IIRxTtEBL85aVYjWO
 JPxJOstU4YFH9G232kqhIN+1py1w8HRLmNto2SfccYiNhYNThuU1/4rYjemqwVLU1pG9
 8NdrGuLX7+cBj3HXeRDunReQoypFS7QEAYHsDs/80NA/9igmA88QMqr8t86AkY+eCk2z
 JyPzSeI6Pi25ImZCmD9xgA5GylZR67QDw7qZu9R4pOyeBH8tHqpM0lUf1E2BDP+IJqSy
 PyLRS8my5uCAb7oPCfudyKeYyG5nyAD3/d9DE3MQZKJk6apYZkWOJEHv+K4xTISe2zuI
 1Blg==
X-Gm-Message-State: AOAM5325sVOLcCgxXfPZHKN2rMRyjJ9iCpsPQooXlogHac/UaddpgLxW
 /hCGRnYrOx5sKqgWT4ezN3l40c0iERmdaOvhX2KI8BRw+sc=
X-Google-Smtp-Source: ABdhPJz0a7AZ+P4d1jUXRj6rL/HWLAGvHBGHFccKMac1aA8O7V6PuYjnV8nX7HEYeUBOgXKsQt1yNzVuYOIpvazA3LM=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr21934635ybu.140.1649683684632; Mon, 11
 Apr 2022 06:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-10-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 14:27:53 +0100
Message-ID: <CAFEAcA93NoE8F2DaRvNXUB2Oa_4RgWkY8mdYZLNMqxZU79rUHA@mail.gmail.com>
Subject: Re: [PATCH 09/16] target/arm: Enable FEAT_Debugv8p4 for -cpu max
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns changes to the External Debug interface,
> with Secure and Non-secure access to the debug registers, and all
> of it is outside the scope of QEMU.  Indicating support for this
> is mandatory with FEAT_SEL2, which we do implement.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 2 +-
>  target/arm/cpu_tcg.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 6b6422070d..f20fb6d9e1 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -854,7 +854,7 @@ static void aarch64_max_initfn(Object *obj)
>      cpu->isar.id_aa64zfr0 = t;
>
>      t = cpu->isar.id_aa64dfr0;
> -    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
> +    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
>      t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
>      cpu->isar.id_aa64dfr0 = t;
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index ac91bbea9b..a443e8c48a 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -79,8 +79,8 @@ void arm32_max_features(ARMCPU *cpu)
>      cpu->isar.id_pfr2 = t;
>
>      t = cpu->isar.id_dfr0;
> -    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
> -    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
> +    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
> +    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
>      t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
>      cpu->isar.id_dfr0 = t;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

