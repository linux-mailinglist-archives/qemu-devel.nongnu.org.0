Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DC693FE7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRUSG-00051A-Ve; Mon, 13 Feb 2023 03:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRUSE-00050P-Sz
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:44:54 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRUSB-0006kd-IS
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:44:54 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o15so7975651wrc.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LHR5QP1NYHxTvAOBqpXdCYPor003dsgSMCcPpf4h1Gc=;
 b=mJcEkW7yzbdB+9oI2t6tNmhIG/TxwdkFLVx80dxTLreQoY5FdOmjUUSPYjRI52J8bC
 HvaLD0a54e440ZOrjc5VyNMisdgu90NzKJ0zDywaGEMov3M+Ktuodgzhld6iI0U4btAi
 DQNbIuT82Q+tNnQpfEXk8P54b4dUb4BturwVyQUk4VeHs+d0BkbNKysLAoDvzht8odd0
 NmwpQCXwnelUhAQB5MTwOdcdHzPcCpMvihySRS2H/5ujf3BpYM18RwwWjlZvjizeBujC
 OZY23KOgdNUSFyyS7/flS0NfNLBq5SpqASrUworxdipun4PJA/MkfQuBaOoXfcAXFMGW
 nmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LHR5QP1NYHxTvAOBqpXdCYPor003dsgSMCcPpf4h1Gc=;
 b=rJOfLGbXRqXl2vd/Qdkf+Os26MBLz5swNiYod3WpyEEg7X5BIMrJL+a3VSouXzP/yf
 YvjFXMwCZYihLr0kPYI3tVLwBU2PpKq41syepilF96GREvDIFnBqyQxM9wZceGqPuZTT
 mASQ+nN3HR8JqZgoGOkvTIwjT/sD1H9KWD87gBiVjLCHc+xr8g0knhRYwoG+c91l+y9N
 MeGGU8AQeMMbsRqhYzZQ5PgNs1vryEH4Zmoeef6qB+A9MBIyeMzGq1Fs4i5VksNKYM+j
 q5usBmdKMjOGVkxz+GhNvIOqPf3XaTSfp22CF3m4x9quDbuYDsJBioXDpL+u93ocMr2T
 IIcg==
X-Gm-Message-State: AO0yUKV8w/V/pKVtqtkhhhV3FI7LPZPPvl4ko5HT4f8jjqQgctUEdUoI
 3VXMbj+F2cNOa2bvgN1KCbH7zA==
X-Google-Smtp-Source: AK7set+3L4fBVDyzPPBb1qMupOTa+1RKF66+7KxYINJ2gdRoBuJHUNEO1AEiOtY2YlcOjbXekWAEZg==
X-Received: by 2002:adf:d4c9:0:b0:2c5:48af:348 with SMTP id
 w9-20020adfd4c9000000b002c548af0348mr8640664wrk.15.1676277889656; 
 Mon, 13 Feb 2023 00:44:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a1-20020adff7c1000000b002c54a2037d1sm7808637wrq.75.2023.02.13.00.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 00:44:49 -0800 (PST)
Message-ID: <755f5b86-02fe-16b2-7b45-f31935a19d86@linaro.org>
Date: Mon, 13 Feb 2023 09:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC PATCH v2 19/19] hw/usb: Inline usb_bus_from_device()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-20-philmd@linaro.org>
 <265f782c-d3c8-b7d5-d1ea-4d10edd2ad4f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <265f782c-d3c8-b7d5-d1ea-4d10edd2ad4f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 13/2/23 09:11, Thomas Huth wrote:
> On 13/02/2023 08.08, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC Other devices don't use such helper. Maybe it should
>>      be the other way around, introduce more bus_from_device()
>>      helpers?
>> ---
>>   hw/usb/bus.c        | 10 +++++-----
>>   hw/usb/core.c       |  6 +++---
>>   hw/usb/dev-hub.c    |  4 ++--
>>   hw/usb/dev-serial.c | 10 +++++-----
>>   hw/usb/hcd-xhci.c   |  2 +-
>>   include/hw/usb.h    |  5 -----
>>   6 files changed, 16 insertions(+), 21 deletions(-)
>>
>> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
>> index d7c3c71435..4a1b67761c 100644
>> --- a/hw/usb/bus.c
>> +++ b/hw/usb/bus.c
>> @@ -427,7 +427,7 @@ void usb_unregister_port(USBBus *bus, USBPort *port)
>>   void usb_claim_port(USBDevice *dev, Error **errp)
>>   {
>> -    USBBus *bus = usb_bus_from_device(dev);
>> +    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
> 
> You're certainly missing a proper justification in the patch description 
> here. The "other devices don't use such a helper" does not sound like a 
> real justification to me, since the code lines rather get longer this 
> way. Thus this rather looks like unnecessary code churn to me --> rather 
> drop the patch?

The idea is to avoid having 7 different ways of implementing something
with 3 different APIs and 2 unfinished API conversions in flight.

I'm wondering if the QOM DECLARE_xxx() macros could also define some
xxx_BUS_FROM_DEV() or xxx_PARENT_BUS() macros. So here it would become:

     USBBus *bus = USB_PARENT_BUS(dev);

