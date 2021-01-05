Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894902EA6B8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 09:46:16 +0100 (CET)
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwhyp-0000aw-4E
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 03:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwhxC-0008Uq-6X
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:44:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwhxA-0000WM-G1
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:44:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y17so35322070wrr.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 00:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Tswf3TH82hATRFy+FTwWYyR0SPAnw6oOW8YWEy/TbU=;
 b=lk0RGpP20X/T3UKiw/YxPI82VJdfuIbK/UEwjK9z7V5OcH2+8Nj4cwHVnSUvRQVhql
 B+7WFk28j5YfPGlKFAX6SGvMPDBxwy/GKJuejshuK4GLFYfZjywE4jCdKb75T5+zjZrU
 66CBG6a/pzAVHKOsMWKuR6WHJiDNAD9JGP5eg6U6nXSo7ufo18GvJh9wjnGqSVzS5umG
 Oxo5A8+JbSAFySiyKe/kxGxfTCgLJ/5yRHllnu/KsvWjtz3VYxmyq2i4/Gq6GFOqu6jg
 sOjZK98lyElg6CU+VtTIvHPnNERHeEbZq+qX+vbEFlpxa8tMsvlaz+ghyty1xwrRX+j3
 pJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Tswf3TH82hATRFy+FTwWYyR0SPAnw6oOW8YWEy/TbU=;
 b=XFsaFC2gaifHGvjrYPriqWCCu0WqmpGem3GGwGSfCUiHvF93UuEsHTRQPvWotAARr3
 1kZ6NBr/y/PfOgWvXw2v6BlctHvMaWxlMTb1amzn+ABmVWCr+04tcjG0lZeuQXwmLWUn
 cz6EvMgxImJvHrLbVpulplv8MeHL21j3xRkJkF8YeHbszao/m+TSEaW5iaYWCb/mqt2F
 LEe6hd3Ci1mgZaH3P/zaLBLCn0uWN2/2GwFy+K2JNBLI4riQQgI2AVa1Q/gDK4PG3UNi
 coPoHZj6fcbc1i1LokjBYtYyX9tAIIC1ZW9sgxl4dAz3baYirFzpVr2PpSq9ZkyalhIK
 XGCA==
X-Gm-Message-State: AOAM532puHuBp6TMjT5+QsApiYr4DU068sREt9Uu9ugvRq+nVSdW0yKd
 Y43CoSWhQ5gPlr5gMdkBWvE=
X-Google-Smtp-Source: ABdhPJxA707vr53YVssbsx932o7K8VazR1tCvzEaMbpqhitOIGhXFEY6+MAglmbtoGyTSIXQUGpYFw==
X-Received: by 2002:adf:e547:: with SMTP id z7mr81185886wrm.283.1609836271008; 
 Tue, 05 Jan 2021 00:44:31 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id b10sm3153680wmj.5.2021.01.05.00.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 00:44:29 -0800 (PST)
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: Huacai Chen <chenhuacai@kernel.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
 <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
 <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
 <1b7c8f3c-f124-ad59-6eb0-ce29803b1327@amsat.org>
 <61fb784c-0e96-b1ad-31c1-4ada4e849864@amsat.org>
 <CAAhV-H53bDKK0ndOsNZbOtJ-NBNhdvG186GfRv8tSq9XsU3Y+w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <836021af-b496-75f9-d232-5d00675408e1@amsat.org>
Date: Tue, 5 Jan 2021 09:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H53bDKK0ndOsNZbOtJ-NBNhdvG186GfRv8tSq9XsU3Y+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 2:53 AM, Huacai Chen wrote:
> Hi, Philippe and Peter,
> 
> On Tue, Jan 5, 2021 at 2:30 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 1/4/21 7:24 PM, Philippe Mathieu-Daudé wrote:
>>> On 1/4/21 6:39 PM, Philippe Mathieu-Daudé wrote:
>>>> On 1/4/21 4:01 PM, Peter Maydell wrote:
>>>>> On Mon, 4 Jan 2021 at 13:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>>> I don't have access to OSX host. I'll see to install an aarch32 chroot and
>>>>>> keep testing (not sure what can differ from an i386 guest).
>>>>>> If I can't find anything I'll resend the same series without the Loongson-3
>>>>>> machine, which is the single part adding QOM objects.
>>>
>>> OK I guess I found the problem, we have:
>>>
>>> struct LoongsonMachineState {
>>>     MachineState parent_obj;
>>>     MemoryRegion *pio_alias;
>>>     MemoryRegion *mmio_alias;
>>>     MemoryRegion *ecam_alias;
>>> };
>>>
>>> Then:
>>>
>>> static inline void loongson3_virt_devices_init(MachineState *machine,
>>>                                                DeviceState *pic)
>>> {
>>>     int i;
>>>     qemu_irq irq;
>>>     PCIBus *pci_bus;
>>>     DeviceState *dev;
>>>     MemoryRegion *mmio_reg, *ecam_reg;
>>>     LoongsonMachineState *s = LOONGSON_MACHINE(machine);
>>>
>>> LoongsonMachineState is never allocated... Accessing its MR lead
>>> to BOF.
>>
>> I'm going to respin with this (pass 32-bit tests):
>>
>> -- >8 --
>> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
>> index e3723d3dd0f..d4a82fa5367 100644
>> --- a/hw/mips/loongson3_virt.c
>> +++ b/hw/mips/loongson3_virt.c
>> @@ -612,8 +612,10 @@ static void mips_loongson3_virt_init(MachineState
>> *machine)
>>      loongson3_virt_devices_init(machine, liointc);
>>  }
>>
>> -static void mips_loongson3_virt_machine_init(MachineClass *mc)
>> +static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
>>  {
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>>      mc->desc = "Loongson-3 Virtualization Platform";
>>      mc->init = mips_loongson3_virt_init;
>>      mc->block_default_type = IF_IDE;
>> @@ -624,4 +626,13 @@ static void
>> mips_loongson3_virt_machine_init(MachineClass *mc)
>>      mc->minimum_page_bits = 14;
>>  }
>>
>> -DEFINE_MACHINE("loongson3-virt", mips_loongson3_virt_machine_init)
>> +static const TypeInfo loongson3_machine_types[] = {
>> +    {
>> +        .name           = TYPE_LOONGSON_MACHINE,
>> +        .parent         = TYPE_MACHINE,
>> +        .instance_size  = sizeof(LoongsonMachineState),
>> +        .class_init     = loongson3v_machine_class_init,
>> +    }
>> +};
>> +
>> +DEFINE_TYPES(loongson3_machine_types)
>> ---
>>
>> Thanks Peter for catching this (we really need a 32-bit host runner
>> on GitLab...).
>>
> Should I send a new version?

No, I'll squash that in and resend (preparing MIPS pull requests
involve some manual testing, I couldn't automate all the steps
yet, so it takes me some time).

Regards,

Phil.

