Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C565C7A6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 20:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCn8k-0008Jl-Rp; Tue, 03 Jan 2023 14:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCn8j-0008Jc-0i
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:40:01 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCn8h-0002Us-3e
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:40:00 -0500
Received: by mail-ej1-x632.google.com with SMTP id jo4so76601884ejb.7
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 11:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w9jRCAQFEugTUSExuKwLwoRTrE1PMI1E4Y8aOvmqFW0=;
 b=JGxI+S+0sopMd4A8Yf8bCvSyMfI5fTFolA3qF25hStzdpBAJ7H+1a9JNMTgYU46CyA
 EWqJRj6kyyAki1YnLKuqILQ25RMoLb6OCYxaMubrogcp76EgS/M1r8DwAGD9FyKn28P6
 cMYiTMGlkMVe1sRPFrWoVJhypqnnGxddDLRzY87+55vqIVNoe53PaqnKfhDCMVbI3S/Y
 bSVa+ophe1ccHNqYDH/HZdjoeetWoRTDIMejBro9HE3CDRqpWyBnv3l9px5RfD0a09KN
 5Ybm1s7xfrXACZ6BEI7nmtsT24guzVguxZ1Si253YidQFcj1JDeuv9mDYknkjCPO5f3R
 7JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w9jRCAQFEugTUSExuKwLwoRTrE1PMI1E4Y8aOvmqFW0=;
 b=ak/u8eyonsxaGnDYXy2lCgvc7wJxETFu1z2QrLBFp43xyst4KrSQbSe2MYmluEoFbI
 ZXc23Nq/gSyPgesj6rpYuXDb3Csm+5adLi9AqWPuO429/xKEywRl44BHVq8TGoLY9A6n
 ciWycwRg55/o8V5eSx/vW56qKsyih3HMcGXRg64ezHgGtSVQMxsgTF/i9l31oS4/2RP6
 /VDa8CeQJ8wsqALgPRAtXShmov8JBaW6/tquSW/RrkQ2J9I7txgmCMFONlIEwnm5S9aS
 5sJib/pNY3tKH46DBIzoKkXHkEOaqaDoVIpkmA0pGJixBUKvYMfWBkSkVSiKj5S9Tir2
 B7qw==
X-Gm-Message-State: AFqh2kpBydZJJC5vf8P0/uY8PkhZuLC1Iyj65r/v3LMdBHOWwrTy/nDg
 e2XwnmzwfYRx3MPGP43Sfzt9Qw==
X-Google-Smtp-Source: AMrXdXu5zTwJ7VmmTFhF5k7//Rf+xN6uwvJywHDHAk+OwyZWa3KHdw2UAzINmPqW5+IXh7QrjDpK4w==
X-Received: by 2002:a17:906:c092:b0:7ff:7876:9c5b with SMTP id
 f18-20020a170906c09200b007ff78769c5bmr35882939ejz.70.1672774797150; 
 Tue, 03 Jan 2023 11:39:57 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170906829500b00782e3cf7277sm14163096ejx.120.2023.01.03.11.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 11:39:56 -0800 (PST)
Message-ID: <59dd266e-3884-e3b5-f003-9bc55a33b7f8@linaro.org>
Date: Tue, 3 Jan 2023 20:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/pci: Display correct size for unmapped BARs in HMP
 'info pci'
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230103164825.95329-1-philmd@linaro.org>
 <6bb76a1c-475e-1fe4-a7b6-8317a4388afd@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6bb76a1c-475e-1fe4-a7b6-8317a4388afd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

On 3/1/23 18:39, BALATON Zoltan wrote:
> On Tue, 3 Jan 2023, Philippe Mathieu-Daudé wrote:
>> When a BAR is not mapped, the displayed size is shifted by 1 byte:
>>
>>  (qemu) info pci
>>    ...
>>    Bus  0, device  11, function 0:
>>      Ethernet controller: PCI device 1022:2000
>>        PCI subsystem 0000:0000
>>        IRQ 10, pin A
>>        BAR0: I/O at 0xffffffffffffffff [0x001e].
>>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001e].   <===
>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].   <===
>>        id ""
>>    Bus  0, device  18, function 0:
>>      VGA controller: PCI device 1013:00b8
>>        PCI subsystem 1af4:1100
>>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
>>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].   <===
>>        id ""
>>
>> Only substract this byte when the BAR is mapped to display
>> the correct size:
>>
>>  (qemu) info pci
>>    ...
>>    Bus  0, device  11, function 0:
>>      Ethernet controller: PCI device 1022:2000
>>        PCI subsystem 0000:0000
>>        IRQ 10, pin A
>>        BAR0: I/O at 0xffffffffffffffff [0x001f].
>>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001f].   <===
>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003ffff].   <===
>>        id ""
>>    Bus  0, device  18, function 0:
>>      VGA controller: PCI device 1013:00b8
>>        PCI subsystem 1af4:1100
>>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
>>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000ffff].   <===
>>        id ""
>>
>> Fixes: 0ac32c8375 ("PCI interrupt support - 'info pci' monitor command")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/pci/pci-hmp-cmds.c | 6 ++++--
>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
>> index fb7591d6ab..8cfa5f9cd1 100644
>> --- a/hw/pci/pci-hmp-cmds.c
>> +++ b/hw/pci/pci-hmp-cmds.c
>> @@ -75,22 +75,24 @@ static void hmp_info_pci_device(Monitor *mon, 
>> const PciDeviceInfo *dev)
>>
>>     for (region = dev->regions; region; region = region->next) {
>>         uint64_t addr, size;
>> +        bool mapped;
>>
>>         addr = region->value->address;
>>         size = region->value->size;
> 
> As size is not used for anything else, you could adjust the value here 
> once either as
> 
> size = region->value->size - (addr != -1 ? 1 : 0);
> 
> or in an if then you don't need the bool and tweak the value when 
> printing. This looks simpler to me.

Good idea, thanks!

