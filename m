Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C468C03A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:36:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2ao-0006zz-5r; Mon, 06 Feb 2023 09:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2ah-0006xt-PI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:35:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2aH-0001eJ-2F
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:35:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id i5so3386807wrc.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9+OrO5GoLsKhlfsQy1cIQIsvsK0YfPBSW9aQrTME+G8=;
 b=yj/V+RPPIfVagVr5g3ZAjEOkZVcz7bvWNDUpkACnTOMZrv8p9csBZGvJIIJx2ie4xy
 /TmdMbbAtpUURibbVLF/HAFBh73artYsBABFy2dlX0fjSMy02gapGSK5V5Og44PBo95a
 A7FU7kbhORm0zcXKxd5redyTM6tdy8sGtzq45BWB5kd0gMR99JtFiTsf46mxZjdXRbMx
 rK2IV0cq4/IxPCshMDjLzeNMqA6AoUEQ/ZWZmeLm3J7BfR7aETWfhfeA/oPzMv+JB4yX
 iEC1DHe6MS7oEi4LVFDMtZn2tpUvXZCVnRxnMx3AJYArHcXiMxhPePv401diUw+kyx/D
 NyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+OrO5GoLsKhlfsQy1cIQIsvsK0YfPBSW9aQrTME+G8=;
 b=XnKs2VixZFek1afkQU59ncsWTAeSRJc0/Ioci9328Kpzlupwl824cvt/9nS/23T4N9
 Zi9GhzZinGqr0JNaUT66mrJcU+QrW1vX3g16x1EzYhQtBrdzKMW4WW5iGkaE3dQXjzRb
 w6NIPayF+RLrJIco+id/nI26mCg2FPnA6/OzotigzsPp+QdVDRapxRKZpzD1Dg9etloS
 IJ5fAxdopPXWo4RaU8692ChNWRTiUhJn7hKvSUlVcD0aC9TJu9ipQaodejIVqvOGAnWL
 jypJJYSL8CzuRJKSlPHQneWHeJCgNdhFE5TEepXshRfHFdohS50rrtS0Cd44HdWm1Ahq
 G5rQ==
X-Gm-Message-State: AO0yUKXwDSSEFpudj/FJWe51TXhpblyPquL27yGB/Gu6EIFJyzLojXlj
 nHsImAcwfCBcuv7f2G4+GvhtUY0YYgjl/ABm
X-Google-Smtp-Source: AK7set+lCSq9tMdnK6n7Uwy+BjkKwGnu+0AQuhV+41pObPZQdSgA2iMhqpcweOPkeepBSbTtndPv5Q==
X-Received: by 2002:adf:c713:0:b0:2bf:b8f0:f6c6 with SMTP id
 k19-20020adfc713000000b002bfb8f0f6c6mr20524441wrg.45.1675694102401; 
 Mon, 06 Feb 2023 06:35:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600002c200b002bde537721dsm9275822wry.20.2023.02.06.06.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:35:01 -0800 (PST)
Message-ID: <888ecafb-2ca4-386b-79d5-5ce7322978ba@linaro.org>
Date: Mon, 6 Feb 2023 15:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 9/9] hw/arm/armv7m: Pass CPU/NVIC using
 object_property_add_const_link()
To: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-10-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206121714.85084-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 6/2/23 13:17, Philippe Mathieu-Daudé wrote:
> Avoid having QOM objects poke at each other internals.
> Instead, pass references using QOM link properties.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/arm/armv7m.c       | 4 ++--
>   hw/intc/armv7m_nvic.c | 3 ++-
>   target/arm/cpu.c      | 3 ++-
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 50a9507c0b..edde774da2 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -338,8 +338,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>        * Tell the CPU where the NVIC is; it will fail realize if it doesn't
>        * have one. Similarly, tell the NVIC where its CPU is.
>        */
> -    s->cpu->env.nvic = &s->nvic;
> -    s->nvic.cpu = s->cpu;
> +    object_property_add_const_link(OBJECT(s->cpu), "nvic", OBJECT(&s->nvic));
> +    object_property_add_const_link(OBJECT(&s->nvic), "cpu", OBJECT(s->cpu));

Markus mentioned this converts build time types checks to runtime.
Also harder to debug. And the code becomes harder to read.

>       if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
>           return;
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index d9c7e414bc..e43898a9e0 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2668,7 +2668,8 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>       NVICState *s = NVIC(dev);
>   
>       /* The armv7m container object will have set our CPU pointer */
> -    if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
> +    s->cpu = ARM_CPU(object_property_get_link(OBJECT(dev), "cpu", &error_abort));
> +    if (!arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
>           error_setg(errp, "The NVIC can only be used with a Cortex-M CPU");
>           return;
>       }
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 876ab8f3bf..f081861947 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1573,12 +1573,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>        * error and will result in segfaults if not caught here.
>        */
>       if (arm_feature(env, ARM_FEATURE_M)) {
> +        env->nvic = NVIC(object_property_get_link(OBJECT(dev), "nvic", NULL));
>           if (!env->nvic) {
>               error_setg(errp, "This board cannot be used with Cortex-M CPUs");
>               return;
>           }
>       } else {
> -        if (env->nvic) {
> +        if (object_property_find(OBJECT(dev), "nvic")) {
>               error_setg(errp, "This board can only be used with Cortex-M CPUs");
>               return;
>           }


