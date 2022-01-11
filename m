Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5E748ADEE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:53:05 +0100 (CET)
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ge8-0007w7-2s
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:53:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7GTj-0003ZZ-G8
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:42:23 -0500
Received: from [2607:f8b0:4864:20::1031] (port=36637
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7GTf-0002LV-9S
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:42:16 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so5082364pja.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ksDE7N6aKbjqVpQYmB3/w5xG/VVT2Dqci28iMt89m44=;
 b=EqfrTwONrmZro6TIzv5eFQJLRi1pRIhrlab3YAyLSF8FBFbxRY/UxFZqIEOU3S4Q43
 uElnDoTICgpY0Vu/QU9fgi41Oln7Pepi0Ec/pnAJZx7XmJ3KXaJPsKnAjESp5OhZwuhV
 hiH7qwl7JaP8+Jh3FKpSFWPeWaJ1qtg63T0wG2+7CHmglwj8vtw2EQbbTZq6JJPAP/Ti
 YcwKsd1rRPJPE7hGJ0UqioezUUlp7Vp7qUoq9cINoxF7JTidTxqCKmCfP21E8RRa5ZkM
 exN+1Xmr3qiaStJYUrlM9mTt6mR+4F5KFP2oT1q32dBCeyv1oIDra2pKQqh0vFvLin3K
 sDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ksDE7N6aKbjqVpQYmB3/w5xG/VVT2Dqci28iMt89m44=;
 b=rN6xMhr3udcnlj2iQFut4FyrJGjXFE80ZS3aO0eoS8784NiEfJ4vrUQMySpzjR1SOI
 9QPitbJxVqAoh5oA9P3I2tqo2gDJB7QGQK2nZdYWQ0dZFPeVWVcm8OBhXjC79cTx/KhS
 cAQ2xDrw0E/Fkc4pX0N11o2dd31qyJQ1stx8VPQZ7bNRYm6LXef68SzwCroP5pGjPG+V
 YlBnuXwd2v58K9/MwseluC1Oj1FcnYW0sfTJi7i4/Z73GLxvUb5wluxX0e2TD4sMNhax
 NgAZ95qcLhE3JERTPNjEgscDiUirbEUJQ6THpcapyVHZqlIdU7N5gWF3Ki6eMXdJwKY2
 S48Q==
X-Gm-Message-State: AOAM533DDNi2dsRQjGXLENj0TzrR6BBp3fJ77fsbkFaqH/IAGDHACV42
 JF9YLFbsMS8WLBba/xn5OOiNqA==
X-Google-Smtp-Source: ABdhPJyU8fSYsDhe81Vz/Xh82sxwnnhTHpo++9bGsNyJfmlG5iNZPMTBSu8TwO2xFnoTkdOm9Mtd+A==
X-Received: by 2002:a05:6a00:1ac7:b0:4bd:183:6b21 with SMTP id
 f7-20020a056a001ac700b004bd01836b21mr4277375pfv.57.1641904933256; 
 Tue, 11 Jan 2022 04:42:13 -0800 (PST)
Received: from [10.76.15.169] ([153.254.110.109])
 by smtp.gmail.com with ESMTPSA id f8sm3492045pfc.184.2022.01.11.04.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 04:42:12 -0800 (PST)
Subject: Re: Re: Re: [PATCH] usb: allow max 8192 bytes for desc
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220111104918.896841-1-pizhenwei@bytedance.com>
 <CAFEAcA9d4X+pobnz2vA_hTwDBuGRBTjjnD_CgKmsKuCAjH-ZNQ@mail.gmail.com>
 <Yd13NAsHpuRCMJRy@redhat.com>
 <b093dca4-f961-9f5b-32ba-0d4a55e71dba@bytedance.com>
 <Yd16OkZB5C+rVnad@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <4b59aa97-a0ae-85ef-c3ad-85d9c1d0b7e5@bytedance.com>
Date: Tue, 11 Jan 2022 20:39:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yd16OkZB5C+rVnad@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 8:38 PM, Daniel P. Berrangé wrote:
> On Tue, Jan 11, 2022 at 08:27:35PM +0800, zhenwei pi wrote:
>>
>>
>> On 1/11/22 8:25 PM, Daniel P. Berrangé wrote:
>>> On Tue, Jan 11, 2022 at 12:21:42PM +0000, Peter Maydell wrote:
>>>> On Tue, 11 Jan 2022 at 10:54, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>>>>
>>>>> A device of USB video class usually uses larger desc structure, so
>>>>> use larger buffer to avoid failure. (dev-video.c is ready)
>>>>>
>>>>> Allocating memory dynamically by g_malloc of the orignal version of
>>>>> this change, Philippe suggested just using the stack. Test the two
>>>>> versions of qemu binary, the size of stack gets no change.
>>>>>
>>>>> CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>>> ---
>>>>>    hw/usb/desc.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
>>>>> index 8b6eaea407..57d2aedba1 100644
>>>>> --- a/hw/usb/desc.c
>>>>> +++ b/hw/usb/desc.c
>>>>> @@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
>>>>>        bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>>>>>        const USBDesc *desc = usb_device_get_usb_desc(dev);
>>>>>        const USBDescDevice *other_dev;
>>>>> -    uint8_t buf[256];
>>>>> +    uint8_t buf[8192];
>>>>>        uint8_t type = value >> 8;
>>>>>        uint8_t index = value & 0xff;
>>>>>        int flags, ret = -1;
>>>>
>>>> I think 8K is too large to be allocating as an array on
>>>> the stack, so if we need this buffer to be larger we should
>>>> switch to some other allocation strategy for it.
>>>
>>> IIUC, querying USB device descriptors is not a hot path, so using
>>> heap allocation feels sufficient.
>>>
>> Yes, I tested this a lot, and found that it's an unlikely code path:
>> 1, during guest startup, guest tries to probe device.
>> 2, run 'lsusb' command in guest(or other similar commands).
>>
>> The original patch and context link:
>> https://patchwork.kernel.org/project/qemu-devel/patch/20211227142734.691900-5-pizhenwei@bytedance.com/
> 
> Yes, the orignal patch is better I think.
> 
> 
> 
> Regards,
> Daniel
> 
By the way, could you please review the v2 version of "camera subsystem"?

https://patchwork.kernel.org/project/qemu-devel/cover/20220106085304.795010-1-pizhenwei@bytedance.com/

-- 
zhenwei pi

