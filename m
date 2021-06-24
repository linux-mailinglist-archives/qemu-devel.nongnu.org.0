Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE03B34DC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 19:35:30 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTGD-0001bX-Rz
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 13:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwTAy-0002FU-8f
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:30:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwTAr-00054d-NM
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:30:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so6778806wms.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 10:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NBFWbFr10fE+ahFWIeUb+J6iDWelV7HnMfJXGFmEGJw=;
 b=K0cTtw/bXqHfrev1Xmd4OCOKa1cmHkiTemcAOenQQcWkdgZgCqZVlT01QItJPFQuEG
 6OtAavGW7E5f23KlZGeWxcG2nEKTNdzpVODheT2nuJTpwtlCAbs8uZDo2XnC8WWGl793
 aouLP7gn9Mm8yQqrKIXkdIE7TZmxOlIFQkuGduvdriaJt2TeqGSpjYGa0yB0wuH8sn0v
 NAJaFJmZ4lGDzyVbnTuNC9QiSeL//LNqCdJxYPpt8JOHkqwNMBHAjgHeJPcr49bvRcsq
 1jR7EM1JPdk6pmPoOZiogYy9PrlhkiDEtz9+qnnaRQCDPptyZO3k0sWGQPNl0n/N8dJX
 PTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBFWbFr10fE+ahFWIeUb+J6iDWelV7HnMfJXGFmEGJw=;
 b=crhGrjsOFSq6Jk2Lhpfl7GOYGmj3SGHehtl6pPYGM6ZxgvNYRGmZ3iMO7dH1sal/IQ
 H0ePmZGLW8qmtTTMTpm1mwuT0XiqNsVZxY7xV2VOzsf3Psa4rzS4REvsszg7GpWFpkwQ
 CTuPsq32IIghugOZfU33BtlKKA14ldZdEd486UW51qPNg/oguD32cds1hzhyN9dUPalX
 zvlwS8q+7a5T/sFVZ7ee5POGuNzANT78Mr7T0KKCdEJyyOAYBWuca9dGVfMbEqe/iz2H
 PVpv8mZvCMq6ImT0RBzNdqUZz170PYC8q5Cuae1hAsbVxamXR6U1IfvqRFuariAyniMC
 G8IA==
X-Gm-Message-State: AOAM530nRXlrF41qNbTyTSXn25zwnY10Bou+TIwQlVWGXZ7Gae48aszh
 1DqQdX96QlUkkST8VJtlmJs=
X-Google-Smtp-Source: ABdhPJyJvPYwKYhdhVeSJx51Jo7Wdi8J/uPU+hHFOUFuv5ijYeqKMiXirs/gG7zh6meT5LvieZGu9g==
X-Received: by 2002:a1c:5413:: with SMTP id i19mr5822561wmb.12.1624555796345; 
 Thu, 24 Jun 2021 10:29:56 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c12sm3685198wrw.46.2021.06.24.10.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 10:29:55 -0700 (PDT)
Subject: Re: [PULL 30/43] vt82c686: Fix SMBus IO base and configuration
 registers
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210221143432.2468220-1-f4bug@amsat.org>
 <20210221143432.2468220-31-f4bug@amsat.org>
 <0c52a343-ed4c-92fa-fac0-0f32f37b0df2@amsat.org>
 <8aa3527b-0412-979f-ffb5-80b41004a4b6@amsat.org>
 <282f867e-2395-7fcb-b0df-12bcd99f0787@amsat.org>
 <77140305-bcab-31d8-e369-970ca3d26c27@amsat.org>
 <41499860-3e6d-677b-ae5c-564fc3b4e2f9@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0e7d57aa-ba64-55d6-2496-56e0acd69a00@amsat.org>
Date: Thu, 24 Jun 2021 19:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <41499860-3e6d-677b-ae5c-564fc3b4e2f9@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 7:00 PM, BALATON Zoltan wrote:
> On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
>> On 6/24/21 6:16 PM, Philippe Mathieu-Daudé wrote:
>>> On 6/24/21 6:01 PM, Philippe Mathieu-Daudé wrote:
>>>> On 6/24/21 5:46 PM, Philippe Mathieu-Daudé wrote:
>>>>> Hi Zoltan,
>>>>>
>>>>> On 2/21/21 3:34 PM, Philippe Mathieu-Daudé wrote:
>>>>>> From: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>
>>>>>> The base address of the SMBus io ports and its enabled status is set
>>>>>> by registers in the PCI config space but this was not correctly
>>>>>> emulated. Instead the SMBus registers were mapped on realize to the
>>>>>> base address set by a property to the address expected by fuloong2e
>>>>>> firmware.
>>>>>>
>>>>>> Fix the base and config register handling to more closely model
>>>>>> hardware which allows to remove the property and allows the guest to
>>>>>> control this mapping. Do all this in reset instead of realize so it's
>>>>>> correctly updated on reset.
>>>>>
>>>>> This commit broken running PMON on Fuloong2E:
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html
>>>>> console: PMON2000 MIPS Initializing. Standby...
>>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>>> console: PRID=00006302
>>>>> console: DIMM read
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> console: 000000ff
>>>>> ...
>>>>>
>>>>> From here the console loops displaying this value...
>>>>
>>>> Tracing:

>>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>
>> Offset 93-90 – SMBus I/O Base ....................................... RW
>> 15-4 I/O Base (16-byte I/O space)................ default = 00h
>> pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>
>>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
>>
>> Offset D2 – SMBus Host Configuration ......................... RW
>> SMBus Host Controller Enable
>> 0 Disable SMB controller functions ......... default
>> 1 Enable SMB controller functions
>> pci_cfg_write vt82c686b-pm 05:4 @0xd0 <- 0x1
>>
>> Hmm the datasheet indeed document 0xd2... why is the guest accessing
>> 0xd0 to enable the function? It seems this is the problem, since if
>> I replace d2 -> d0 PMON boots. See below [*].

>>>>> Expected:
>>>>>
>>>>> console: PMON2000 MIPS Initializing. Standby...
>>>>> console: ERRORPC=00000000 CONFIG=00030932
>>>>> console: PRID=00006302
>>>>> console: DIMM read
>>>>> console: 00000080
>>>>> console: read memory type
>>>>> console: read number of rows
>>>>> ...

>>>>>>  static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t
>>>>>> val, int len)
>>>>>>  {
>>>>>> +    VT686PMState *s = VT82C686B_PM(d);
>>>>>> +
>>>>>>      trace_via_pm_write(addr, val, len);
>>>>>>      pci_default_write_config(d, addr, val, len);
>>>>>> +    if (ranges_overlap(addr, len, 0x90, 4)) {
>>>>>> +        uint32_t v = pci_get_long(s->dev.config + 0x90);
>>>>>> +        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
>>>>>> +    }
>>>>>> +    if (range_covers_byte(addr, len, 0xd2)) {
>>>>>> +        s->dev.config[0xd2] &= 0xf;
>>>>>> +        smb_io_space_update(s);
>>
>> [*] So the guest writing at 0xd0, this block is skipped, the
>> I/O region never enabled.
> 
> Could it be it does word or dword i/o to access multiple addresses at
> once. Wasn't there a recent change to memory regions that could break
> this? Is adjusting valid access sizes to the mem region ops needed now
> to have the memory region handle this?

Do you mean it was buggy earlier, so to accept a guest write at 0xd0
the code had to handle the 0xd2 address? 0xd2 is the address in the
datasheet, so I doubt.

