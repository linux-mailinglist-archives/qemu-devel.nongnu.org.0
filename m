Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C14194A3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 14:52:08 +0200 (CEST)
Received: from localhost ([::1]:55166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUq74-0006nB-S3
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 08:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUq2l-0003aG-0A; Mon, 27 Sep 2021 08:47:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUq2i-00078G-V6; Mon, 27 Sep 2021 08:47:38 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 136-20020a1c048e000000b0030d05169e9bso447922wme.4; 
 Mon, 27 Sep 2021 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DdQdvNLVHDc2coO8ZFRHEfwkDc1D0a9H2gWyDAoXUeY=;
 b=FQI/XAbi/wzC33TwQBc7T/s/x/BW/DtaFkpi7oVQi93u1DJpEfjaY9UKjLKJg/7Ibl
 QRZJfQQoh4uwRk2DEcsGM39xKcFhmpk76fyoZDMddYGXWjWnnWKiuFERn+Eo7dsWLnCR
 dembhCmxPLsHRgMzyQXe3QTncfhgWD4JW4eDMYgoZfoeN6kTxw4UKP1QTxBdb2+DwfaW
 Aj3nUVqWRNq913zBOLBGr7wr9ezNSALYTTiOqrMrUEAedI2F1Ue9ki0e/WWi6BhayvbQ
 ZvOjLr3ovf56VXwVHR7Fz3LB0dQmVwKxaAGRaWhZs9crB/iWn5X88w8+wilE1SW2OZYX
 swBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DdQdvNLVHDc2coO8ZFRHEfwkDc1D0a9H2gWyDAoXUeY=;
 b=QD2tJFEzuh6FSL/531tqUBemmxC/aAdpSLiCmgXEIKov67xM7dTCsG0ONz1guJaE6Q
 o17Y1BMT2IyuQUNtqPC3CmIBv2AvE4BuUMjSrLEIelxfYDut1sIQtto7R4m5ikAqFfp2
 QbbJ8tENWXfDMe+3lcPGqNvlvZaSdI72VpnfXHVio+MuOe33PFZ/36CFA+jYJxJozf4b
 TCgxI3LyihKhceRvhWCWa1uDrGcORu2bDrjXvJyAozotqyi8Tbmf5MqFxWXvrWRGAOOo
 CivQBlNY0krTLgY+2cfyuoIuCWhqSl79s7G1NRg5vS+XymoGOKpshETXhgW5nqmJ8R7y
 iWRQ==
X-Gm-Message-State: AOAM532ngRjXgqvFdCpLEYGP3gGUxVOWnLT0LxcfAlwrT23MRsm+pTLI
 +SPbghPqg+VsloEq2i/xRyM=
X-Google-Smtp-Source: ABdhPJxve82P/Q8A1bYoWzI99dXQKrPRKMHdTU0JXxI5OMQqPB1HPgfVeal0kYANhzNsqe7AJCQi+g==
X-Received: by 2002:a7b:c923:: with SMTP id h3mr15839057wml.28.1632746854550; 
 Mon, 27 Sep 2021 05:47:34 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g21sm1136181wmk.10.2021.09.27.05.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 05:47:34 -0700 (PDT)
Message-ID: <d25c8d0b-f5d1-0ac1-fc8f-3fad56820f42@amsat.org>
Date: Mon, 27 Sep 2021 14:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw: Add a 'Sensor devices' qdev category
Content-Language: en-US
To: minyard@acm.org, Thomas Huth <thuth@redhat.com>
References: <20210926221518.1726267-1-f4bug@amsat.org>
 <20210927113349.GH5381@minyard.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210927113349.GH5381@minyard.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Titus Rwantare <titusr@google.com>, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Wang <wangzhiqiang.bj@bytedance.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 13:33, Corey Minyard wrote:
> On Mon, Sep 27, 2021 at 12:15:18AM +0200, Philippe Mathieu-Daudé wrote:
>> Sensors models are listed in the 'Misc devices' category.
>> Move them to their own category.
>>
>> For the devices in the hw/sensor/ directory, the category
>> is obvious.
>>
>> hw/arm/z2.c models the AER915 model which is described
>> on [*] as:
>>
>>   The 14-pin chip marked AER915 just below the expansion
>>   port is a 80C51-type microcontroller, similar to Philips
>>   P89LPC915. It has an 8-bit A/D which is used to determine
>>   which of six buttons are pressed on the resistor-network
>>   wired remote.  It communicates with the main cpu via I2C.
>>
>> It was introduced in commit 3bf11207c06 ("Add support for
>> Zipit Z2 machine") with this comment:
>>
>>   248 static uint8_t aer915_recv(I2CSlave *slave)
>>   249 {
>>   ...
>>   253     switch (s->buf[0]) {
>>   254     /* Return hardcoded battery voltage,
>>   255      * 0xf0 means ~4.1V
>>   256      */
>>   257     case 0x02:
>>   258         retval = 0xf0;
>>   259         break;
>>
>> For QEMU the AER915 is a very simple sensor model.
>>
>> [*] https://www.bealecorner.org/best/measure/z2/index.html
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> This makes sense to me.  I'd like to hear from others on this.

Devices on a bus (in particular I2C) are usually user-creatable
by default. The AER915 is more a band aid for the z2 machine,
but is not really a device. IMO it would be better to hide it
as non-user-creatable qdev.

>> ---
>>  include/hw/qdev-core.h | 1 +
>>  hw/arm/z2.c            | 1 +
>>  hw/sensor/adm1272.c    | 1 +
>>  hw/sensor/dps310.c     | 1 +
>>  hw/sensor/emc141x.c    | 1 +
>>  hw/sensor/max34451.c   | 2 ++
>>  hw/sensor/tmp105.c     | 1 +
>>  hw/sensor/tmp421.c     | 1 +
>>  softmmu/qdev-monitor.c | 1 +
>>  9 files changed, 10 insertions(+)

>> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
>> index 9c1e876207b..62db9741106 100644
>> --- a/hw/arm/z2.c
>> +++ b/hw/arm/z2.c
>> @@ -288,6 +288,7 @@ static void aer915_class_init(ObjectClass *klass, void *data)
>>      k->recv = aer915_recv;
>>      k->send = aer915_send;
>>      dc->vmsd = &vmstate_aer915_state;
>> +    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>>  }

