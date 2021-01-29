Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D10308C4C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 19:24:43 +0100 (CET)
Received: from localhost ([::1]:44166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5YRl-0001sD-Uf
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 13:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5YR0-0001T7-7y
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 13:23:54 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5YQy-0003VI-E3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 13:23:54 -0500
Received: by mail-wr1-x431.google.com with SMTP id m13so9789023wro.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MbiOT1NP/lR5jJAfYU5usJsxafD5y+8fq1q5o76e37c=;
 b=lHFIONFXR4Srzt6fhj20q6HxJcl2WV0WlVcCpsaLzSbwfVCBmIsIs35/wKEB0ijA44
 e0tuf3vomQk+F/2himJUbSqli/udfdNDBzIDLFZbqmoMo/rRbzRS1bXfCRtpe2+KLZhG
 xtTTlokAMBqVHJdJaPqje0qEYtFPLAfVHcNcVwZQ5nOT4rcGYmKMeJMPOJhMajx+lmvP
 XBCSpdHJIX+0CGrVJgs1wJfOCT5KDZ5DNxQ240lOoSeGAzRej7BPlMuN2FpEqy/TsiD+
 GTTZpAGqs1WfLPjsu6N1FMMcM48POjlaZGYBx0yH2bkcGuQTkoeFnG4tUhLB+3Z5PZWn
 O0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MbiOT1NP/lR5jJAfYU5usJsxafD5y+8fq1q5o76e37c=;
 b=eqdFv8sz1fORRsN/Xe6PLKjO+KptRNFeNf0trg26v1u4JqY9nJXlM7gB9uOZqQYLFH
 rOvJ4f09P/yoWdj2EQwiu/CuY8hJc+QGgZmKcEoaJKSFTJTy1is2uY/zgdF5UTLQYIvT
 AVO8KAgb89S3ibZCcB74U8XVFqIICegPOSJI+LsSkgu5Y/wzU0k1uIm1SbdayDxkXWNb
 CHUF7/rg8A5mEwshruW+QLdlQdvGWUzw+BW/NI3R5lBxcAkfZSkdNK07g5lyVykdJR5O
 gUiuyy7z1o6wuc1x1/g7QLLGPTi9mgawBjpS35kbWjhkqPRKyZpXak6kEcHUXnGPC1ns
 tBDA==
X-Gm-Message-State: AOAM530FOrSA7oOiyVsHO0ZqajXSM91px+fO1vWHEdZsGNI0pZeEBwWl
 y8Tq079af9UYee8h/dS+RW4=
X-Google-Smtp-Source: ABdhPJzoFCsFQdAM/5gFztGizpTlSqflo+3Wz20AiCcsWef7SZIgUvk84KCSgqINpR2nCS7vzJqKvg==
X-Received: by 2002:a05:6000:254:: with SMTP id
 m20mr6077899wrz.300.1611944630926; 
 Fri, 29 Jan 2021 10:23:50 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l5sm13192380wrv.44.2021.01.29.10.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 10:23:50 -0800 (PST)
Subject: Re: [PULL 17/21] hw/adc: Add an ADC module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-18-peter.maydell@linaro.org>
 <461061a0-e516-9e98-308e-a8f270487d5c@amsat.org>
 <CAGcCb10p1Q2vxjfOshYx101206jqrQ9L-KkONqOuAwZpdL77SQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c319a7d5-59d7-d75b-d857-71951ecc2fdb@amsat.org>
Date: Fri, 29 Jan 2021 19:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAGcCb10p1Q2vxjfOshYx101206jqrQ9L-KkONqOuAwZpdL77SQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 6:15 PM, wuhaotsh--- via wrote:
> On Fri, Jan 29, 2021 at 6:41 AM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     Hi Hao Wu,
> 
>     On 1/12/21 5:57 PM, Peter Maydell wrote:
>     > From: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>     >
>     > The ADC is part of NPCM7XX Module. Its behavior is controled by the
>     > ADC_CON register. It converts one of the eight analog inputs into a
>     > digital input and stores it in the ADC_DATA register when enabled.
>     >
>     > Users can alter input value by using qom-set QMP command.
>     >
>     > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com
>     <mailto:hskinnemoen@google.com>>
>     > Reviewed-by: Tyrone Ting <kfting@nuvoton.com
>     <mailto:kfting@nuvoton.com>>
>     > Signed-off-by: Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>>
>     > Message-id: 20210108190945.949196-4-wuhaotsh@google.com
>     <mailto:20210108190945.949196-4-wuhaotsh@google.com>
>     > [PMM: Added missing hw/adc/trace.h file]
>     > Reviewed-by: Peter Maydell <peter.maydell@linaro.org
>     <mailto:peter.maydell@linaro.org>>
>     > Signed-off-by: Peter Maydell <peter.maydell@linaro.org
>     <mailto:peter.maydell@linaro.org>>
>     > ---
>     >  docs/system/arm/nuvoton.rst    |   2 +-
>     >  meson.build                    |   1 +
>     >  hw/adc/trace.h                 |   1 +
>     >  include/hw/adc/npcm7xx_adc.h   |  69 ++++++
>     >  include/hw/arm/npcm7xx.h       |   2 +
>     >  hw/adc/npcm7xx_adc.c           | 301 ++++++++++++++++++++++++++
>     >  hw/arm/npcm7xx.c               |  24 ++-
>     >  tests/qtest/npcm7xx_adc-test.c | 377
>     +++++++++++++++++++++++++++++++++
>     >  hw/adc/meson.build             |   1 +
>     >  hw/adc/trace-events            |   5 +
>     >  tests/qtest/meson.build        |   3 +-
>     >  11 files changed, 783 insertions(+), 3 deletions(-)
>     >  create mode 100644 hw/adc/trace.h
>     >  create mode 100644 include/hw/adc/npcm7xx_adc.h
>     >  create mode 100644 hw/adc/npcm7xx_adc.c
>     >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
>     >  create mode 100644 hw/adc/trace-events
>     ...

>     > +
>     > +REG32(NPCM7XX_ADC_CON, 0x0)
>     > +REG32(NPCM7XX_ADC_DATA, 0x4)
>     > +
>     > +/* Register field definitions. */
>     > +#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)
>     > +#define NPCM7XX_ADC_CON_INT_EN  BIT(21)
>     > +#define NPCM7XX_ADC_CON_REFSEL  BIT(19)
>     > +#define NPCM7XX_ADC_CON_INT     BIT(18)
>     > +#define NPCM7XX_ADC_CON_EN      BIT(17)
>     > +#define NPCM7XX_ADC_CON_RST     BIT(16)
>     > +#define NPCM7XX_ADC_CON_CONV    BIT(14)
>     > +#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
>     > +
>     > +#define NPCM7XX_ADC_MAX_RESULT      1023
>     > +#define NPCM7XX_ADC_DEFAULT_IREF    2000000
>     > +#define NPCM7XX_ADC_CONV_CYCLES     20
>     > +#define NPCM7XX_ADC_RESET_CYCLES    10
>     > +#define NPCM7XX_ADC_R0_INPUT        500000
>     > +#define NPCM7XX_ADC_R1_INPUT        1500000
>     > +
>     > +static void npcm7xx_adc_reset(NPCM7xxADCState *s)
>     > +{
>     > +    timer_del(&s->conv_timer);
>     > +    s->con = 0x000c0001;
> 
>     This initialize CON to:
> 
>     NPCM7XX_ADC_CON_REFSEL | NPCM7XX_ADC_CON_INT | BIT(0)
> 
>     What is bit 0?
> 
> This reset value is from h/w spec. The bit is reserved and not used
> currently.

OK thanks. Since the datasheet is not public, better document
the reserved/unused bits to avoid further questioning later ;)

Thanks,

Phil.

