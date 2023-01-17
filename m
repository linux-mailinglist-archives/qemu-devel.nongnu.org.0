Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F1A66E342
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoe7-0002z3-Vs; Tue, 17 Jan 2023 11:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHody-0002xT-SQ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:17:08 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHodw-0004UF-95
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:17:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4969667wms.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FQyfz7GFXFp/yRvoE9XY5c+G01h5EjYf0zpXppNFrVA=;
 b=VGiB7E/ZO1oxzYMfbf5cmQV4AxekiWJlP01Lv0DuiXDVHvC58QbYZ7iE0fOJAsOMpM
 WHgYMiVKSo4vuqynBfpSKcvOdh6hRQiT14+5MKVVetTD7LqriC/VorW0pGNsgPdRrScc
 7743mGLO+auZtTEO+KXzNTGwXHNRSMn2U3tBMMqDGpaTuHJ0frTdkP+QyJF0tIgusYxf
 fx8XfHphjQJKgm1d2/QXABpbIXzzWJCxIYwUKO5s4fG0/AIJX4emu18ICKHvfqmqf6m/
 xTb9VAM5Xmej/umeJ8QiURsAHwOGO5ntfttz1b69fj13UF8qtaW+mjvaPK4piSQcDT4g
 mv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FQyfz7GFXFp/yRvoE9XY5c+G01h5EjYf0zpXppNFrVA=;
 b=pEGaW+pkHDQFYo21xIVgp/DrpUKtFl3Ibnuxql0TEfy2wkei2aFQX/3Tt3oA39Z4Xu
 Bcw1JazbELhKLmyEwBEcNO9bdxyFdCmge6SR8TzPinwiAWK3nTax+QHN8ZoHEufIkqfJ
 ByHd8KRA2YjlYoji+Dr/Urdf9zThAQiwmZq8tLtJarBMdPyDfI1ErRUW5aRebR3M5M3K
 12jH7egrLeI/IQweSgbIk7q+CMAlX6Bi7exLqd6u2K4HaWvt3YAgbCXYLx25Uvk2d2jX
 eyPQTVuEWV55syPEKGV7ZFLMqb1PSoxGgPItrWtM4DFqjqzx2zS2Mu0dx14Vp33dR5Br
 ln8A==
X-Gm-Message-State: AFqh2ko5OmK0SI2gU4pBZcuGyhJGmBUWiWgWIGAWtQvMkG8EJESokRTH
 OfGNAK2+CFYNesUOFYV7U8g0Pg==
X-Google-Smtp-Source: AMrXdXv4cU/eqbSxCGkK4YaozkQNRAEYyqDcwuqNKagGw81rYGRE5AI5rj6Z57QDBbOyZ4Ag3fXIRg==
X-Received: by 2002:a05:600c:181a:b0:3d2:2043:9cbf with SMTP id
 n26-20020a05600c181a00b003d220439cbfmr3662010wmp.10.1673972218799; 
 Tue, 17 Jan 2023 08:16:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b003db07420d14sm2359370wmo.39.2023.01.17.08.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:16:58 -0800 (PST)
Message-ID: <ebe782e3-c73c-5311-451f-8d36ea391e7e@linaro.org>
Date: Tue, 17 Jan 2023 17:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 06/28] target/arm: Move cpregs code into cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-7-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 13/1/23 15:03, Fabiano Rosas wrote:
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.c     | 9087 +++++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c     | 9063 --------------------------------------

Nice diffstat...

>   target/arm/meson.build  |    1 +
>   target/arm/trace-events |    2 +-
>   4 files changed, 9089 insertions(+), 9064 deletions(-)
>   create mode 100644 target/arm/cpregs.c

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index aa94db9917..0c3e72a266 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -31,5614 +31,9 @@

Can we remove the '#include "trace.h"' from helper.c?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   #endif
>   #include "cpregs.h"
>   
> -#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
>   
>   static void switch_mode(CPUARMState *env, int mode);


> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 2a0ba7bffc..04a480443e 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -1,6 +1,6 @@
>   # See docs/devel/tracing.rst for syntax documentation.
>   
> -# helper.c
> +# cpregs.c
>   arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
>   arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
>   arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value 0x%" PRIx64


