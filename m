Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F03669420C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:56:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVSn-00084q-Q3; Mon, 13 Feb 2023 04:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVSe-0007wk-9h
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:49:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVSZ-0004aC-3E
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:49:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id r18so8253278wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 01:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8zwbfmEHH/8n6PPAlfK4mSdcxiA3ygKKYeZZO7PkqAc=;
 b=d4dwlmeGTvsBgJXOnVGsTbg7oe/0KazOr4DVSz0DM4JJDpv3E0uZu6gJ6y3qmJ/zEP
 byEiGwASPEiiaEuG2WeRJFAbDW+QLJAIbnM5sY49aGJjYRcFugIwUzrBS/zu2vhcZWR4
 DbTsErnZ4Iye5ldj4/HQmuFj8cxutzG+enD/EXeF9b7wf2hq35klqVjNyehHqeRO+v2t
 YlKfZXTLS+3KBMwbO9dZ4wQZwkI38MLN2wZ+cGx+ZBzPSrsg7g/u09MC19b2PidRlsf9
 UF99ariHF0L/bdqBJR3Q8smQGF3EKZiSA/7yu4PDZESJSCmrEEK6wWKNqtzM8KdAP8u0
 Vz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8zwbfmEHH/8n6PPAlfK4mSdcxiA3ygKKYeZZO7PkqAc=;
 b=zjdCeYPO+UCKLpKDHkHs8+u0wK3oxj7bIkOIKMfLiDfx95IDqYArqXgjUcN16CtqnW
 BrJQer85dRcM/mWc5wwXERSvqec3PLHMfUXNmvg1ggIqiuyb0SR8Z4yPgcHlaNqI2tKx
 0wxPVrrRQ5b4/+LCkqEZX45ivZ+Bc7FXQKrVnQ4Q2q+OygXqKW3Gyz0Fmn6FBHfYnCHH
 RGW3xiDelqgtcrraMbKntAYwnvrUPO7PQzt8VjhIu33XSApcPUDx9lfvlcfG+MTIvxbc
 ppHl1ZzKryj3J02/6Ijj4Dr8v1KVnrQrIcIDwOnvoTfr3UFKa9+AMiPBz8XZ0QviyOzE
 5s6A==
X-Gm-Message-State: AO0yUKXxZLopvPPNH0j3zH6wTIm7g3B6jDNUVDXa0tUOwGSnACZPRbK2
 aBfZclm2w9EzsiYDCoLn1MJXOA==
X-Google-Smtp-Source: AK7set/QD84ABSRmkh7ziXZCHJeby0bArPXoNyiAsQXJk5qqbRWe5SIi1gkwPDcsZOzd4YeGuoid/g==
X-Received: by 2002:a05:600c:210d:b0:3df:eedf:f378 with SMTP id
 u13-20020a05600c210d00b003dfeedff378mr17857842wml.24.1676281756487; 
 Mon, 13 Feb 2023 01:49:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003ddc781b1d4sm14287448wmq.33.2023.02.13.01.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:49:16 -0800 (PST)
Message-ID: <1eb67f58-686e-f5fd-4a27-457ca13853b0@linaro.org>
Date: Mon, 13 Feb 2023 10:49:14 +0100
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
 <755f5b86-02fe-16b2-7b45-f31935a19d86@linaro.org>
 <ad356f64-dca0-8117-d22a-a530e620ddb0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ad356f64-dca0-8117-d22a-a530e620ddb0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/2/23 10:11, Thomas Huth wrote:
> On 13/02/2023 09.44, Philippe Mathieu-Daudé wrote:
>> On 13/2/23 09:11, Thomas Huth wrote:
>>> On 13/02/2023 08.08, Philippe Mathieu-Daudé wrote:
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> RFC Other devices don't use such helper. Maybe it should
>>>>      be the other way around, introduce more bus_from_device()
>>>>      helpers?
>>>> ---
>>>>   hw/usb/bus.c        | 10 +++++-----
>>>>   hw/usb/core.c       |  6 +++---
>>>>   hw/usb/dev-hub.c    |  4 ++--
>>>>   hw/usb/dev-serial.c | 10 +++++-----
>>>>   hw/usb/hcd-xhci.c   |  2 +-
>>>>   include/hw/usb.h    |  5 -----
>>>>   6 files changed, 16 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
>>>> index d7c3c71435..4a1b67761c 100644
>>>> --- a/hw/usb/bus.c
>>>> +++ b/hw/usb/bus.c
>>>> @@ -427,7 +427,7 @@ void usb_unregister_port(USBBus *bus, USBPort 
>>>> *port)
>>>>   void usb_claim_port(USBDevice *dev, Error **errp)
>>>>   {
>>>> -    USBBus *bus = usb_bus_from_device(dev);
>>>> +    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
>>>
>>> You're certainly missing a proper justification in the patch 
>>> description here. The "other devices don't use such a helper" does 
>>> not sound like a real justification to me, since the code lines 
>>> rather get longer this way. Thus this rather looks like unnecessary 
>>> code churn to me --> rather drop the patch?
>>
>> The idea is to avoid having 7 different ways of implementing something
>> with 3 different APIs and 2 unfinished API conversions in flight.
> 
> Ok, then please add such information to the patch description.
> 
>> I'm wondering if the QOM DECLARE_xxx() macros could also define some
>> xxx_BUS_FROM_DEV() or xxx_PARENT_BUS() macros. So here it would become:
>>
>>      USBBus *bus = USB_PARENT_BUS(dev);
> 
> Sounds more readable at a first glance, but when looking at the output of:
> 
>    grep -r '(qdev_get_parent_bus' hw/
> 
> it seems like there aren't that many other places using this pattern 
> (many places rather use BUS() instead), so it's maybe hard to justify 
> such a change.

There is another helper, scsi_bus_from_device(), but is only used
twice. The previous patch "hw/scsi/scsi-bus: Inline two uses of
scsi_bus_from_device()" remove it.

 > Thus I think your patch here is likely the better
 > solution right now (when you add a proper patch description).

OK, thanks!


