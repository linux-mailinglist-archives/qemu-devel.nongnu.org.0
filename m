Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9760353853F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:47:59 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhcc-0003rt-5S
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvhaZ-00023m-D6; Mon, 30 May 2022 11:45:52 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvhaX-0003l9-9Q; Mon, 30 May 2022 11:45:50 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a63so4276349pge.12;
 Mon, 30 May 2022 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9oCr9pstjxODTn35PtKBbG9xZujwAQvv8auV4KOmykk=;
 b=ZAT1/DyL6xm+ovo5paYLFnEF6gc54R8Y2VbLWRBQKTcjeyFrREIsSjXY125QXasaXC
 HRmRiD5HmpmQoetJ4IN3huYahA40hnM3bHlqeSkqMANM4ZTH7i/428rWAv/z9XSd2YaK
 ywhzYLN2HfVEDhKs+TErSf0LkL7ZvfwItQT/mpgA1x1K+69gq1nrDtjHEi1FcQnnEZde
 2XvgJ7Ce0DuhbZyXN32oAYdILufMkiwJrnjIHUq7IVe/l1yuLqt0ypp64U03vxvJmj2/
 O8DbDfoWJ9f41r47/ZucV6oEoyuGkD8jEhl7IxuAWkpDfinKJmwrbwA1RN3NCO4bm61u
 wv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9oCr9pstjxODTn35PtKBbG9xZujwAQvv8auV4KOmykk=;
 b=dDdK8YVe4/YfBz8piSSN5kI6IulozEYDHKufmwYLwKQHn2zI0LA8yDGXKS4wT3mWod
 4JBy/jIifguKqgvw8Y+q6EyIvXjTQ+yphjNS6Cz1L9z7MG9n1sOLGlMBOCBgxY87sA8C
 xIq4VDV1aJKZZdmlSLZCvd7C5wcU/PrFU2KMdoAB4jRrV/gHknQVbCyIyL+VDJuKVse8
 h9CrXl6/NwtH/XGd7QI6BilM5SKU3AeOYe1YgXQxz7HvJYg81Y2a35C5V2oAQYQOhiEc
 Nm0OtaOfT+aZf3wJS5Q3HaLaVdoNMy/gFTGKiFIZFMTNj5xKoz6PcdJ8ckziTsUFdpDt
 Rcsw==
X-Gm-Message-State: AOAM533hqgDyiqOmOdlTZQbkChGaWBk48UhSAK40wL2EzCtStwnR9ACL
 ND1ZPKRFxueL+NH9/Br4ymo=
X-Google-Smtp-Source: ABdhPJw8QuvetJ3oI4SVwOj1B8qRiYtF9xdOWR4OPQTH5kalt6GHCkheW1hu4+QsLnGyQ582FZE56w==
X-Received: by 2002:a63:1661:0:b0:3fa:5855:989a with SMTP id
 33-20020a631661000000b003fa5855989amr33381545pgw.451.1653925547150; 
 Mon, 30 May 2022 08:45:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w63-20020a627b42000000b0050dc76281ccsm8923705pfc.166.2022.05.30.08.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 08:45:46 -0700 (PDT)
Message-ID: <da48e613-18a3-4fa6-a9ce-ebcfc2c4d79e@amsat.org>
Date: Mon, 30 May 2022 17:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior SD
 spec v3.01
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
References: <20220509141320.98374-1-philippe.mathieu.daude@gmail.com>
 <CAEUhbmVfREvoi57nexHtPY59ieP3=Tk-73TG81pX7PXGwb0OeQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVfREvoi57nexHtPY59ieP3=Tk-73TG81pX7PXGwb0OeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/5/22 16:29, Bin Meng wrote:
> On Mon, May 9, 2022 at 10:13 PM Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> CMD19 (SEND_TUNING_BLOCK) and CMD23 (SET_BLOCK_COUNT) were
>> added in the Physical SD spec v3.01. When earlier spec version
> 
> nits: it should be spec v3.00, despite the fact that in QEMU we have
> been using a name v3.01 to indicate v3.00.

Only the "Physical Layer Simplified Specification"s are public:
https://www.sdcard.org/downloads/pls/archives/

I'll rename to "Physical Layer Simplified Specification v3.01"
so it is clearer.

> 
>> is requested, we should return ILLEGAL.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/sd/sd.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index 8e6fa09151..7e3bb12b1a 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -1263,7 +1263,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>
>>       case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
>>           if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
>> -            break;
>> +            goto bad_cmd;
>>           }
>>           if (sd->state == sd_transfer_state) {
>>               sd->state = sd_sendingdata_state;
>> @@ -1274,7 +1274,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>
>>       case 23:    /* CMD23: SET_BLOCK_COUNT */
>>           if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
>> -            break;
>> +            goto bad_cmd;
>>           }
>>           switch (sd->state) {
>>           case sd_transfer_state:
>> --
> 
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks! Queued.

