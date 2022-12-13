Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627964B30A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 11:16:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p52KN-0005bh-CP; Tue, 13 Dec 2022 05:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p52KE-0005a9-HY
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:15:51 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p52KC-0006jw-K1
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:15:50 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so7490047wma.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 02:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pQlAVAF5PbtrFBJk3BJyuuCkRN5PQVlozDlopv9cp0U=;
 b=Wn94YVvN6xFeszcUYkIo1SPZvoE1KV3gFYCtgn2JtzXrAlzCwhXE2exqhmHuILRN6+
 4Rp/q6bRdAG98OI1j9raOHRbjCoUDDI+edepNRBTW4zkliv+LWK7YGwow9xbNHxmO6L7
 5WDDJofJ9avR+VcQHjiW3JrEfpp0B1e2RmHE8U8wLI/Ym308X6bsIcyHScdYfsBlQKDV
 kahAlgcdINl+w9B7w976p4qUJDJdQUH7fw3vwoOYR5GZFNfUfWCOSi0euA2nvSFn4DUv
 i0s4VPeHW/pgwp5DKIA1pCAUIlhsi3yC4+hd/uDAw1e64jghuBsTp4LYn/ySlqDb0oRH
 8ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQlAVAF5PbtrFBJk3BJyuuCkRN5PQVlozDlopv9cp0U=;
 b=SU/aZdxiRBa8VBr+Vt3cA2YHVUwz+xInYzoHj1I/B/apO+wRZh+hGvXoVlfsl2uwxm
 H5i406Lei82khQfLxAsMEnPIud37ZmRRecFXjx05bmQgO/DTnLIHsn6I6jcp6eX61GlT
 mbVizAgVZUKQSlCAj8khZluGQuwYbW+PSOgGSsv1p07U571IPQU0BfZ+SBXKgOjT6kEO
 JsfjPujMo7b/Z7yZBilOYhkFFy9IEychO46VgN1XTM2pZEruq6XrBvodnWnYbEy3kngu
 rhJx3sDxl0lgf2l0xcXnWg2E1WWcx6mogjP1Am6HggNwRcWJC1J2PLPxnGe5QxRlIz0Y
 Gb1g==
X-Gm-Message-State: ANoB5pkhAStRVvJeVAiPIFpE94bKozM+LbOC3i6Vg8M3AlHmt4oZtQ0b
 Y7rUTrzrGQNnXWzHMmePuJC5FA==
X-Google-Smtp-Source: AA0mqf6htrPxsgTYnBAUKVTfZ7ne8BI5sMXdwnwo8YMR082J0BsCgPvXXw+aRFclAsCb49seR07tFw==
X-Received: by 2002:a05:600c:3584:b0:3d1:bf7c:391c with SMTP id
 p4-20020a05600c358400b003d1bf7c391cmr14360997wmq.4.1670926546421; 
 Tue, 13 Dec 2022 02:15:46 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b003b4868eb71bsm13245350wmq.25.2022.12.13.02.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 02:15:46 -0800 (PST)
Message-ID: <a62baba0-7d69-1477-4a78-29a4e16ecd78@linaro.org>
Date: Tue, 13 Dec 2022 11:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] hw: Include the VMWare devices only in the x86 targets
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221213095144.42355-1-thuth@redhat.com>
 <59a252ed-6cea-1966-97be-85e13a6e582f@linaro.org>
 <ccaea070-db7f-c25d-96ec-6a2471536a32@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ccaea070-db7f-c25d-96ec-6a2471536a32@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 13/12/22 11:13, Thomas Huth wrote:
> On 13/12/2022 11.01, Philippe Mathieu-Daudé wrote:
>> On 13/12/22 10:51, Thomas Huth wrote:
>>> It seems a little bit weird that the para-virtualized x86 VMWare
>>> devices "vmware-svga" and "vmxnet3" also show up in non-x86 targets.
>>> They are likely pretty useless there (since the guest OSes likely
>>> do not have any drivers for those enabled), so let's change this and
>>> only enable those devices by default for the classical x86 targets.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   ...ate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} | 0
>>>   rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => 
>>> vnc-ledstate-pseudo-encoding.rst} (100%)
>>>
>>> diff --git a/docs/interop/vnc-ledstate-Pseudo-encoding.txt 
>>> b/docs/interop/vnc-ledstate-pseudo-encoding.rst
>>> similarity index 100%
>>> rename from docs/interop/vnc-ledstate-Pseudo-encoding.txt
>>> rename to docs/interop/vnc-ledstate-pseudo-encoding.rst
>>
>> Unrelated change ;)
> 
> Yeah, sorry, just noticed it after sending the patch ... please ignore 
> that part.
> 
>>> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
>>> index a1b159becd..7b3da68d1c 100644
>>> --- a/hw/display/Kconfig
>>> +++ b/hw/display/Kconfig
>>> @@ -55,7 +55,7 @@ config VGA_MMIO
>>>   config VMWARE_VGA
>>>       bool
>>> -    default y if PCI_DEVICES
>>> +    default y if PCI_DEVICES && PC_PCI
>>>       depends on PCI
>>>       select VGA
>>> diff --git a/hw/net/Kconfig b/hw/net/Kconfig
>>> index 6d795ec752..1cc1c5775e 100644
>>> --- a/hw/net/Kconfig
>>> +++ b/hw/net/Kconfig
>>> @@ -51,7 +51,7 @@ config RTL8139_PCI
>>>   config VMXNET3_PCI
>>>       bool
>>> -    default y if PCI_DEVICES
>>> +    default y if PCI_DEVICES && PC_PCI
>>>       depends on PCI
>>
>> I'm not sure what PC_PCI is for, it seems inherited from the
>> first Makefile conversion.
>>
>> Are you sure you want to build this by default if the PC
>> machine is selected? An user could select it an non-X86 arch.
>>
>> Maybe we want:
>>
>> -       depends on PCI
>> +       depends on PCI && (I386 || X86_64)
>>
>> ?
> 
> It does not seem to be a hard dependency - apparently the devices 
> compile fine for non-x86 and I can also run:
> 
>   qemu-system-ppc64 -device vmware-vga -device vmxnet3
> 
> and the guest sees these two PCI devices - it just can't use them since 
> it has no drivers.
> 
> So for the unlikely case that someone still wants to use these devices 
> on non-x86 machines, I think it's better to add the test to the "default 
> y" line instead of the "depends on" line, so that users still have a 
> chance to enable it in their config file before compiling.

OK then,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



