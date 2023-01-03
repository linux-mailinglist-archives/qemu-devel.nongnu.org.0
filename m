Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743C65C7AE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 20:46:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCnDy-0000tl-Hq; Tue, 03 Jan 2023 14:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCnDt-0000tW-Ny
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:45:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCnDr-0003b5-TG
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:45:21 -0500
Received: by mail-ed1-x530.google.com with SMTP id u18so43998799eda.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 11:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y8HxQ2er6pkr/de4KjvIlPdiqbD2TL8isRe8oF3qhAk=;
 b=P2KBUypRDbdDKMQQwucypeYQrif+jwklMyhOSAKQ1+6fIHlrZuWtRXeNbR4cwWS4QF
 sUnAiGpt12BAh+7BBMNcJ4wadUiLZ6Eudzds3DQlB0XXwCnWeY3WHJXUnhWPU/R6vRhW
 YM+UdGC7wFhY0P3ycg9xChxXGwrfAG1Gfajo0qcnPN6ubHo6kFbTE7V5WBmHPI/zupFl
 ETfF7aUbz7euVgOjAdC8C4RynKrCiyOlpth9t6sLCrtl7L0NwoiisRm0RYYMuFUnug8Z
 4rYONEP0vQn60QHsf6whp2ECRIWXHUZtDLXAnrQli7yEmMTomYUg4Rt4NFzndeS8zOQt
 3x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8HxQ2er6pkr/de4KjvIlPdiqbD2TL8isRe8oF3qhAk=;
 b=drUobWIZ+1B1dxvjaNJegNaVe+z18hES1A0TJaowWei87rD42erYjUfkAO4OdAnNXT
 RyaycGh8AKB7kwR/aL/skoXPfEu6/MS5uGoqfPkMxfBWfc/G+Iw0bCtC5iWGmQZn3+J7
 hNDLCkFAi27/+B8wzL0au+b4LUJrUxqHdUxEvqgSbKrs8YPpNx1gapsXpKWYPsD5bpWy
 Ql0EkvCB6PSrdqf5+HT6EMXur/hwBt/f2qf8Zl0pTm1IIgjBDXwin6O6VoHbnAddspcp
 bY3999KZNekYv281SpcDBRTXgPc90GJmuNo8JTLC/7SBto3LLuq3xpwnTxcu3+mVWQ/q
 QYQw==
X-Gm-Message-State: AFqh2krh0mCWZ1MsZA0U3Z9D6MkwyGu3tT103jl3wm4ZCXymIn4aLNLN
 RcovSwDwybDLZM1DAfzp0c48qQ==
X-Google-Smtp-Source: AMrXdXvxymfwmPCXk/WIr/wkYAa/ljaTxRoHQ042vVgd4NObsxTayj7Imc1a9RvUhastK+DYyE0AJg==
X-Received: by 2002:a05:6402:2296:b0:479:400a:d940 with SMTP id
 cw22-20020a056402229600b00479400ad940mr37987579edb.17.1672775118164; 
 Tue, 03 Jan 2023 11:45:18 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709063d2900b0084cc121f49esm3389904ejf.83.2023.01.03.11.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 11:45:17 -0800 (PST)
Message-ID: <3d9d574b-7682-d06d-c8ad-27c6ec2cf6c4@linaro.org>
Date: Tue, 3 Jan 2023 20:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/pci: Display correct size for unmapped BARs in HMP
 'info pci'
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230103164825.95329-1-philmd@linaro.org>
 <6bb76a1c-475e-1fe4-a7b6-8317a4388afd@eik.bme.hu>
 <59dd266e-3884-e3b5-f003-9bc55a33b7f8@linaro.org>
In-Reply-To: <59dd266e-3884-e3b5-f003-9bc55a33b7f8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 3/1/23 20:39, Philippe Mathieu-Daudé wrote:
> On 3/1/23 18:39, BALATON Zoltan wrote:
>> On Tue, 3 Jan 2023, Philippe Mathieu-Daudé wrote:
>>> When a BAR is not mapped, the displayed size is shifted by 1 byte:
>>>
>>>  (qemu) info pci
>>>    ...
>>>    Bus  0, device  11, function 0:
>>>      Ethernet controller: PCI device 1022:2000
>>>        PCI subsystem 0000:0000
>>>        IRQ 10, pin A
>>>        BAR0: I/O at 0xffffffffffffffff [0x001e].
>>>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001e].   <===
>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].   <===
>>>        id ""
>>>    Bus  0, device  18, function 0:
>>>      VGA controller: PCI device 1013:00b8
>>>        PCI subsystem 1af4:1100
>>>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
>>>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].   <===
>>>        id ""
>>>
>>> Only substract this byte when the BAR is mapped to display
>>> the correct size:
>>>
>>>  (qemu) info pci
>>>    ...
>>>    Bus  0, device  11, function 0:
>>>      Ethernet controller: PCI device 1022:2000
>>>        PCI subsystem 0000:0000
>>>        IRQ 10, pin A
>>>        BAR0: I/O at 0xffffffffffffffff [0x001f].
>>>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001f].   <===
>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003ffff].   <===
>>>        id ""
>>>    Bus  0, device  18, function 0:
>>>      VGA controller: PCI device 1013:00b8
>>>        PCI subsystem 1af4:1100
>>>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].

Hmm actually here 0x11ffffff isn't the size but the higher address,

>>>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000ffff].   <===

while here this is the size. Confusing. Wouldn't it be simpler to only
display the size?

>>>        id ""
>>>
>>> Fixes: 0ac32c8375 ("PCI interrupt support - 'info pci' monitor command")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> hw/pci/pci-hmp-cmds.c | 6 ++++--
>>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
>>> index fb7591d6ab..8cfa5f9cd1 100644
>>> --- a/hw/pci/pci-hmp-cmds.c
>>> +++ b/hw/pci/pci-hmp-cmds.c
>>> @@ -75,22 +75,24 @@ static void hmp_info_pci_device(Monitor *mon, 
>>> const PciDeviceInfo *dev)
>>>
>>>     for (region = dev->regions; region; region = region->next) {
>>>         uint64_t addr, size;
>>> +        bool mapped;
>>>
>>>         addr = region->value->address;
>>>         size = region->value->size;
>>
>> As size is not used for anything else, you could adjust the value here 
>> once either as
>>
>> size = region->value->size - (addr != -1 ? 1 : 0);
>>
>> or in an if then you don't need the bool and tweak the value when 
>> printing. This looks simpler to me.
> 
> Good idea, thanks!


