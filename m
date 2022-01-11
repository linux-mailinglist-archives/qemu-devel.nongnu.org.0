Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E648AE53
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:20:48 +0100 (CET)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7H4x-0008SH-5I
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:20:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7GkP-0003Bc-PO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:59:33 -0500
Received: from [2a00:1450:4864:20::332] (port=43928
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7GkN-0005BN-RN
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:59:33 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so1758558wme.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vPUMF++5G8qm04WZkOHg++V3ImrAC0n1XSBVzEz03yk=;
 b=eRxr+vgy0dkmh63CeD3pZIL8KHGzcwsP9L7RX9+DQLuSvX7vZSLV1LHkfQpooCcNgX
 +pyUnjbnsXSvwDcMhkKRFe05jy8NlucOIo7U0vphngKjmn2ZdGYhz1O7ejPRlwt9nwtX
 ccVm7gSPD5mxwN5mXxL6VcI/9ZuRJbDSNh+HRENdxKc+x7yY4p+ouA9ZbsRL9Se2y005
 pIKN/LSSwOflGPXPVqAJhsyMdlr1LBdk+VXfZUma0pogmTHIPFEhh8OOqgeyYMCN9XVF
 OPl+JTY3io7Ad1A6UQbeIn5xZN6u4G9KF5MJ2a87CHVPu/bF+/WJjGkc++WeKcSiJ49+
 bdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vPUMF++5G8qm04WZkOHg++V3ImrAC0n1XSBVzEz03yk=;
 b=g0KqnvmvUmaK63MkMNSd4/3GTV/kBxmnuudd4MB/LUPrDMYcweJFVuw/WWq7h+9EAL
 X/iCb/Cc8IDFqthpOvbPuPIvRYAbiW+zMftze+vhylQvyP6lPvIcIbxgGbPP/W4VLEl8
 sq6t6FL7KCnM/Bt38yfdJG2PcfoL9Mz6Xfi6dDyGyISb9laxA7hO9Wso4XgcuoqB6fIS
 RjMxBuYg+15xojyIn5guhztJrIcVmRpxW7I2kK0wGA7Z1gwlwbiZgDZrDqknaQMZy5Ka
 8L1Nyeo1l/qJqTPmfkr2fbEfl/vjyFehM40FfbWryk/pmgUX80vseeLoG6STR7WY7EwM
 WnPg==
X-Gm-Message-State: AOAM531o89jKVu2mR4dZ2jf1AcayVkIfFyGmIkdMRh5zJkdfbceODxdz
 yYD0sVlqkKcIsvKWexs91gw=
X-Google-Smtp-Source: ABdhPJzz1Uvd2LSm6/Pak7mXox5bM4pZdulJukqxCK0a9Uiqr0u/9GGfQssgsGIdKQmqNDwvirFv7Q==
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr2412268wmp.14.1641905970544; 
 Tue, 11 Jan 2022 04:59:30 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id r13sm1834341wmq.28.2022.01.11.04.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 04:59:30 -0800 (PST)
Message-ID: <d0af40b2-992d-244c-0d87-9fb549cd01de@amsat.org>
Date: Tue, 11 Jan 2022 13:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] usb: allow max 8192 bytes for desc
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220111104918.896841-1-pizhenwei@bytedance.com>
 <CAFEAcA9d4X+pobnz2vA_hTwDBuGRBTjjnD_CgKmsKuCAjH-ZNQ@mail.gmail.com>
 <Yd13NAsHpuRCMJRy@redhat.com>
 <b093dca4-f961-9f5b-32ba-0d4a55e71dba@bytedance.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <b093dca4-f961-9f5b-32ba-0d4a55e71dba@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 13:27, zhenwei pi wrote:
> On 1/11/22 8:25 PM, Daniel P. Berrangé wrote:
>> On Tue, Jan 11, 2022 at 12:21:42PM +0000, Peter Maydell wrote:
>>> On Tue, 11 Jan 2022 at 10:54, zhenwei pi <pizhenwei@bytedance.com>
>>> wrote:
>>>>
>>>> A device of USB video class usually uses larger desc structure, so
>>>> use larger buffer to avoid failure. (dev-video.c is ready)
>>>>
>>>> Allocating memory dynamically by g_malloc of the orignal version of
>>>> this change, Philippe suggested just using the stack. Test the two
>>>> versions of qemu binary, the size of stack gets no change.
>>>>
>>>> CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>> ---
>>>>   hw/usb/desc.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
>>>> index 8b6eaea407..57d2aedba1 100644
>>>> --- a/hw/usb/desc.c
>>>> +++ b/hw/usb/desc.c
>>>> @@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev,
>>>> USBPacket *p,
>>>>       bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>>>>       const USBDesc *desc = usb_device_get_usb_desc(dev);
>>>>       const USBDescDevice *other_dev;
>>>> -    uint8_t buf[256];
>>>> +    uint8_t buf[8192];
>>>>       uint8_t type = value >> 8;
>>>>       uint8_t index = value & 0xff;
>>>>       int flags, ret = -1;
>>>
>>> I think 8K is too large to be allocating as an array on
>>> the stack, so if we need this buffer to be larger we should
>>> switch to some other allocation strategy for it.
>>
>> IIUC, querying USB device descriptors is not a hot path, so using
>> heap allocation feels sufficient.
>>
> Yes, I tested this a lot, and found that it's an unlikely code path:
> 1, during guest startup, guest tries to probe device.
> 2, run 'lsusb' command in guest(or other similar commands).

Sorry, I thought this was a hot path without looking at the code.

> The original patch and context link:
> https://patchwork.kernel.org/project/qemu-devel/patch/20211227142734.691900-5-pizhenwei@bytedance.com/
> 
>>
>> Regards,
>> Daniel
>>
> 

