Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27463A6D7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 12:13:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozc36-00028b-Ri; Mon, 28 Nov 2022 06:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozc34-00028D-BX
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:11:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozc32-00056B-ML
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:11:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso8100940wmo.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93GsaQH7tPTA5jVU9AjOAxwSOo7mqmLJYcOM/TCmnGM=;
 b=w9J2l2YL0llftixMpl2GK4pN5zVJPWY6lWqa5MfRWZhpl7r5BQMoop5WwY6unEeTTB
 c1XXhZ8yfF3nsSuHqKTIouOQlxRvzOWKqirUCZk0moE9P+EpvCG2zLGLMeU9HPE/QovV
 SdAHLxjNBNjtzqqlY63u40Ue8GFU/4zKDqEME5br+mevCAkCkIxyPG0jXI/aEvxDIq83
 7IVNFfm3A9J7yQzuWwM/v8xWgTp7MG952ZtRw8Qglj7BmO+whGkXe2BxtvJJtXqtHeQJ
 XQFWKVSo1108l3hnhIOi/5OZhHtpOpfrJ4WDVC43VdoIz7N7llGe3zjAheg2Z6IWvbN4
 RB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93GsaQH7tPTA5jVU9AjOAxwSOo7mqmLJYcOM/TCmnGM=;
 b=aG7w3mohkvh5ZeaqC1pXB9AtQhzNvWtwnnGN6ORsYoPEvBGWxTAHJXGjvlCIQzRIym
 KDwztVHsnRls0+OSrneYoP2dJecAIrHagQKghB3cxRSIreqhWhY0nOpLOI8sew6dBwEm
 Sp/Pv2UH6lYL+p5HF2czCRlu6yY3xpZVGbNFAa+/nrwVxretC4Z0qFuRWlSruJSZrPqI
 8+JtW2ExFintiJtH2kf6r5+4bJn+0bij3XeyjSnMokIEEq0Fyf8tFDbCD6bVKO50R3hY
 RKvmMesNfV6k4u91qIhGjFEqow8Vp3zZPIirVFp4icxS7de+2EIqtYMBN1EZPruUzL/R
 Uyww==
X-Gm-Message-State: ANoB5pmM/sQ17Z450XJoT0gxYhG/HXqHwbL2al1IbYR7AfNItXisfWBY
 E84qKKTnLj0NrdLFNGMl879vZg==
X-Google-Smtp-Source: AA0mqf7vlmd/NX25MyewxveDz1lonhVcgAfp64uArV3m4Z1ubtFlZ6ndXOE1d0/Yembg01Oljedg5Q==
X-Received: by 2002:a05:600c:5014:b0:3cf:72d9:10b0 with SMTP id
 n20-20020a05600c501400b003cf72d910b0mr23215717wmr.26.1669633899182; 
 Mon, 28 Nov 2022 03:11:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003cfd0bd8c0asm16108671wms.30.2022.11.28.03.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 03:11:38 -0800 (PST)
Message-ID: <d1e0fe99-01ba-c532-4746-7b8d725028b7@linaro.org>
Date: Mon, 28 Nov 2022 12:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 3/4] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221125154030.42108-1-philmd@linaro.org>
 <20221125173119.46665-1-philmd@linaro.org>
 <CAJ+F1C+k+_4SuvO9J4cZGutEqATjbP0oh7StKjT2=hHt6v96Vw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1C+k+_4SuvO9J4cZGutEqATjbP0oh7StKjT2=hHt6v96Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 28/11/22 09:22, Marc-André Lureau wrote:
> On Fri, Nov 25, 2022 at 9:35 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Currently qxl_phys2virt() doesn't check for buffer overrun.
>> In order to do so in the next commit, pass the buffer size
>> as argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 
> 
>> ---
>> RFC: Please double-check qxl_render_update_area_unlocked()
>> ---
>>   hw/display/qxl-logger.c | 11 ++++++++---
>>   hw/display/qxl-render.c | 11 +++++++----
>>   hw/display/qxl.c        | 14 +++++++++-----
>>   hw/display/qxl.h        |  4 +++-
>>   4 files changed, 27 insertions(+), 13 deletions(-)


>> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
>> index ca217004bf..1b0a50c1aa 100644
>> --- a/hw/display/qxl-render.c
>> +++ b/hw/display/qxl-render.c
>> @@ -107,7 +107,8 @@ static void qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
>>           qxl->guest_primary.resized = 0;
>>           qxl->guest_primary.data = qxl_phys2virt(qxl,
>>                                                   qxl->guest_primary.surface.mem,
>> -                                                MEMSLOT_GROUP_GUEST);
>> +                                                MEMSLOT_GROUP_GUEST,
>> +                                                sizeof(uint32_t) * width * height);
> 
> It looks wrong, I think it should be:
> 
> qxl->guest_primary.abs_stride * height * qxl->guest_primary.bytes_pp

Isn't "bytes_pp" included in "abs_stride"?

If so, then "qxl->guest_primary.abs_stride * height" is enough..


