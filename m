Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416252D0C3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:44:05 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrddK-0007Sf-30
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdZt-0006Po-2W
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:40:21 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrdZr-00029g-BR
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:40:20 -0400
Received: by mail-yb1-xb36.google.com with SMTP id o80so8335866ybg.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cJ8Ex0+C3Lr7cRyuU8W6NwXhV58rCbzT1V3iJbj5774=;
 b=CDmNgFn7Tc0OJ5HjMklFGmAh97JPcGS/rSH4ZTHV3a77YXTQaHW2mmcS2THTmPEWAQ
 35Mi0pvKqvZMZ7DMojPuS0ZgLwkcFWvG6RV0V47BF8UfHfL5Fx6Tkc7PIKfCX7xBlMhm
 NLNAQPOqFGFbpLk8Q1IeiU/IYh2dSCQI7ffn3XfsAeVzB5JeRIf/PkDIgcdFMoqHEiyI
 f49RnTf6bYUaRrarEJqzib8G42XRFxa8StwqwwEVXMHQbPLrKb9ICNftykKOpUSeX4Cc
 hr8CvdrLWXYlTdX1XL2l5suOwAAEieCkQr8aUYlCPIIqjAeg/DVYsrxqsl4tXbgfPPZj
 SmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cJ8Ex0+C3Lr7cRyuU8W6NwXhV58rCbzT1V3iJbj5774=;
 b=iCXXz25YblzUHbnr/PgqNK61oRUdySqWJ73asXrUtsNBZR6RViAjYA46FU0L+7P8L1
 TwMC5jDEoPtGXtsRxyDkTagAfYeA7yXN36eFaRx/GMHEWCrzLuG7Zq0FvTRDbuTSJbN0
 ngsUQIjeoAGdS6HZkUZy1YIaYKfTlRRvNfeh5JE2GHexf1wMCAPW8XNOb8+pw8thJI4K
 nF9726aWqGk9Oo1bcjYhrD5lSkYgfEp70KmbWzOXUo34qZmwSaP3EpqF3onwSks2+A6D
 uMQ/9fWverg4nutFB917BJxiGEbX+Q11iGoqlQMxPCcVTJpo8VK066hscoJtkjGeyK2r
 9Hng==
X-Gm-Message-State: AOAM533/LFThsj0h1+c/FuB50Up2D6v5XhFTr3SFeSSV+9Qd8fD4yEAg
 sAcnZdDHrVln16Y9EX4M4ZKpkmFeM8XYqhuH+dB4Ew==
X-Google-Smtp-Source: ABdhPJw43KJEU6bkXPUPPDXUVUyjPfK+Vq/YEwrRHvgzWiD49K8NyS3FDNsLUDLAZIHKH3Kg9invPi+pcDFy9MNLzn0=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr3595842ybu.140.1652956818018; Thu, 19
 May 2022 03:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-4-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 11:40:07 +0100
Message-ID: <CAFEAcA9SU0vXtzw76HkN4wrSgsMyBNwA_bHGa7x0u0rtNe4LQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Tue, 17 May 2022 at 07:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need to constrain the value set in zcr_el[1],
> because it will be done by sve_zcr_len_for_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d2bd74c2ed..0621944167 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
>                                           CPACR_EL1, ZEN, 3);
>          /* with reasonable vector length */
>          if (cpu_isar_feature(aa64_sve, cpu)) {
> -            env->vfp.zcr_el[1] =
> -                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
> +            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
>          }

Not all the code that looks at the sve vector length
goes through sve_zcr_len_for_el(), though. In particular,
this is setting up ZCR_EL1 for usermode, and all
the code under linux-user/ that wants to know the vector
length does it with "env->vfp.zcr_el[1] & 0xf".

More generally, it seems to me less confusing for debug
purposes if we set zcr_el[1] on reset to a valid value,
not to some invalid value that we're relying on being
coerced to something else at point of use.

Incidentally, do_prctl_set_vl() also sets zcr_el[1] and
it doesn't call aarch64_sve_zcr_get_valid_len(). Should it,
or is it doing an equivalent check anyway?

-- PMM

