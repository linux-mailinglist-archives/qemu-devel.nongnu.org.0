Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A66ADC2D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:43:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUlx-0002iK-3N; Tue, 07 Mar 2023 05:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZUlv-0002hM-3b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:42:19 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZUlt-0006gX-EY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:42:18 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so16072435pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678185736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BNM3mhw9pYMau25OY111bTw6mvdu0NhrvJ3EjpaCsoo=;
 b=l/gwVkZeyExVEFvgcsuqOEaTeUd03h4gYSJFHT9eHZdc7O0KNJ9687EY7+wyWyTGfS
 /hCJd3RCUrFjrc8bvo/qC/sXKdTS2oLIIJvKzbSSe9Tc9NUeBJXluTpowiBmXDLtQJVt
 Gy6x1BrOQGEiFDfda1kYRKyen8eePiBAym3evvly8D67pq26na8EZbs8VwzfkR9aQR6Y
 Kazj2RCet5sRX8qsGj9/+iTXiySL01tbBKRPwQS342QzbXpB2JlMaAx2Gk34qIkvTBtO
 7RKFLF0Dr6GCZFMeEPruabdzUkFUL50BAsj45o9RuNpqJYHACqPV1tWY4oQaoc90ukSm
 nbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678185736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BNM3mhw9pYMau25OY111bTw6mvdu0NhrvJ3EjpaCsoo=;
 b=sFGU6jwKFRBGCvC8TFzyAG0s55sxEAct2XNN3V3WkJXZHtCE6tG5z9SMTMEZRWPU8m
 VLHzSrG9672v1JydLFcZhjP75WXGNkd3Fn0Eu8+ItU6WRON9J6IyQDOKgTrjFhakXHdk
 sBANVkzTMee+IVxtCnMx1as+lkTTzITe5UCQVJcxeRKFeQ6o1VscdHtTRtRfx+8Ym43h
 z/rQmBiPRTjAYlnR+MZfUAQcPLrsA73TT9pWB50sLqfjOj+o4KplrtFO047qehvtJosq
 Mh/H2z/fy6ZWCw7NR3aUCRkd7KE+OV8KgJ4c7ighclExzxV+xZVRYLyJBuOEAnotbVkL
 7QXA==
X-Gm-Message-State: AO0yUKV8sKoF3x/nI1vn78Z21pi92xAWhlmaUZJG25ESr9NaH18d9Q0D
 tWzXOpxxoE8buXA+BGvOqp0/4HJuwPpH2dcVkqOIrQ==
X-Google-Smtp-Source: AK7set8e53Yrhp0jCE4bIrCDDPByDT45sxzWR4SJucJ4OTrwIwnwdbNVPMwt4OwnGrFS17E4rgF+Vj0inGT6kyrhgCw=
X-Received: by 2002:a17:902:7e09:b0:199:6fd:ecf6 with SMTP id
 b9-20020a1709027e0900b0019906fdecf6mr5382115plm.9.1678185735872; Tue, 07 Mar
 2023 02:42:15 -0800 (PST)
MIME-Version: 1.0
References: <CAKbPEtZ5DiSb-avGpBX_+C6vk8dacBnEpTEtiPFV1WZ4Xk7Oqg@mail.gmail.com>
In-Reply-To: <CAKbPEtZ5DiSb-avGpBX_+C6vk8dacBnEpTEtiPFV1WZ4Xk7Oqg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 10:42:04 +0000
Message-ID: <CAFEAcA-_XJqtsjr=cdPCCEQrvnnvOvcqJ6uNeVqHWXEtHOSCTQ@mail.gmail.com>
Subject: Re: Adding Implementation Defined ARM cpu registers
To: Roque Arcudia Hernandez <roqueh@google.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Tue, 7 Mar 2023 at 01:41, Roque Arcudia Hernandez <roqueh@google.com> wrote:
>
> Hello,
>
> I'm dealing with a problem in which I need to add support for some neoverse-v2 registers defined as implementation defined in the TRM of the core.
>
> In file helper.c I can see the decision of whether or not a register is implemented is based mainly in function calls arm_feature(env, ARM_FEATURE_*) or cpu_isar_feature(<feature>, cpu).
>
> The main feature I'm interested in is actually protected by a call to cpu_isar_feature but the neoverse-v2 needs extra IMP_ registers for extra configuration of the feature.
>
> I cannot find any example of a set of registers that depend on a particular cpu. What I'm currently doing is defining a function to know if it is that particular core and add more registers for the feature:
>
>     if (cpu_isar_feature(<feature>, cpu)) {
>         define_arm_cp_regs(cpu, <feature>_reginfo);
>         if (is_neoverse_v2_core(cpu)) {
>             /* Add extra registers */
>         }
>     }
>
> Where my helper function is defined as:
>
> static bool is_neoverse_v2_core(ARMCPU *cpu)
> {
>     /* Looking for Neoverse-V2 Part Num 0b110101001111 */
>     const uint64_t neoverse_v2_partnum = 0xd4f;
>     uint64_t partnum = FIELD_EX64(cpu->midr, MIDR_EL1, PARTNUM);
>     return (partnum == neoverse_v2_partnum);
> }
>
> Is this ok? Otherwise what is your recommendation?

What's the feature that you need to add extra registers for?

thanks
-- PMM

