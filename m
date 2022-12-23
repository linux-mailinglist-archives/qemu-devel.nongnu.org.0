Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15134654EF2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 11:06:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ewE-0004Db-R7; Fri, 23 Dec 2022 05:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8ewC-0004CT-AQ
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:06:00 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8ewA-0003Y0-Fv
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 05:06:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h7so4130360wrs.6
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 02:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wu3dEu9mtbBgOEkrgwgGDOOg+hg2gHYmpx6kh1UQbUI=;
 b=dbefDrCczY9FWOtKKExjUMjC5e+mm7RGvkRxZemZPk1YZsFwZYXfkSf4r9FwLl43gV
 F/5cWPR/XP6BFPVWry5Q8s6l96eVJo8N9HMMC7kbBemZpsXT6uv/UqHMC5o5IfEmwuyA
 bXh5BCl3crXJNP9n73deLhDl5Q209+RWh52Jbyo+85RsEaYEPMifnrKvfAODYmTYHMze
 +Gtn/gtw02x6sNo8l1JT9JwuczDXfmG8zjMXjClpJsuJcrnlSwgooTaWfnscn/saNf7d
 rk9o0BMjM9424UZPjZENuA5gNNoeQbCxSlEWrzCAl3EwiJQmzv8qgytwPuP7xN0a/a9g
 JfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wu3dEu9mtbBgOEkrgwgGDOOg+hg2gHYmpx6kh1UQbUI=;
 b=a7yLEZ0KRZpKoZotxS+KnVtjzWj+NPR41yXmr6WYj9ctfFNaTFeleW4+/6RqBOxSms
 f3RXEvIKTk9UtjJR+xsTdKCAAVvNiCT5b2/PdW2m3T0gItbizB3H+nKi5zo7t4Bp/KbA
 +41m5C0nQe+I63m46b/qFSK9pYsZ2ZIisD3GGPaFmpCWWqgVZrCskIOVvTS6mNyRER9o
 dkuWy5a5CcxX3Y5RHckLNknYM/ussPLRNAAo1Z3cZEHbaTxcY1C4vbAvhsY63JFPQRJm
 lCLTHhjtnztyd8I8KvlGu9ds9ogXpd6Jke6Ej5tpDdoMGkO7VAuMwfGLyz5NLCpP74z3
 0QSw==
X-Gm-Message-State: AFqh2ko5EXOzidRqXQqRi8dvsrBRQcjs19r80XzxeChLj9Yaft6+CAj+
 lla5+470ghcLE5k29jBUk2Nxrg==
X-Google-Smtp-Source: AMrXdXtopcrKaH7irlPqXNDOni1hFSVXED9Y4QlredQiXscOvZwBBt3/hF8EzAwZUJFJY861vr2hBg==
X-Received: by 2002:a5d:488b:0:b0:242:5563:c3b with SMTP id
 g11-20020a5d488b000000b0024255630c3bmr5240628wrq.59.1671789956922; 
 Fri, 23 Dec 2022 02:05:56 -0800 (PST)
Received: from [192.168.27.175] (160.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.160]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b00275970a85f4sm239131wrq.74.2022.12.23.02.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:05:56 -0800 (PST)
Message-ID: <d5be1eea-34e8-69e1-aaaf-8fc0d7b61005@linaro.org>
Date: Fri, 23 Dec 2022 11:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 5/6] hw/arm/xilinx_zynq: Remove tswap32() calls and
 constify smpboot[]
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-6-philmd@linaro.org> <Y6UmfCkKwD463kqQ@toto>
 <53afcdf7-8bb6-0544-7a98-3dd6dabf7e8d@linaro.org>
In-Reply-To: <53afcdf7-8bb6-0544-7a98-3dd6dabf7e8d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 23/12/22 11:01, Philippe Mathieu-Daudé wrote:
> On 23/12/22 04:54, Edgar E. Iglesias wrote:
>> On Thu, Dec 22, 2022 at 10:55:48PM +0100, Philippe Mathieu-Daudé wrote:
>>> ARM CPUs fetch instructions in little-endian.
>>>
>>> smpboot[] encoded instructions are written in little-endian.
>>>
>>> We call tswap32() on the array. tswap32 function swap a 32-bit
>>> value if the target endianness doesn't match the host one.
>>> Otherwise it is a NOP.
>>>
>>> * On a little-endian host, the array is stored as it. tswap32()
>>>    is a NOP, and the vCPU fetches the instructions as it, in
>>>    little-endian.
>>>
>>> * On a big-endian host, the array is stored as it. tswap32()
>>>    swap the instructions to little-endian, and the vCPU fetches
>>>    the instructions as it, in little-endian.
>>>
>>> Using tswap() on system emulation is a bit odd: while the target
>>> particularities might change the system emulation, the host ones
>>> (such its endianness) shouldn't interfere.
>>>
>>> We can simplify by using const_le32() to always store the
>>> instructions in the array in little-endian, removing the need
>>> for the dubious tswap().
>>
>>
>> Hi Philippe,
>>
>>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/arm/xilinx_zynq.c | 27 ++++++++++++---------------
>>>   1 file changed, 12 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>>> index 3190cc0b8d..4316143b71 100644
>>> --- a/hw/arm/xilinx_zynq.c
>>> +++ b/hw/arm/xilinx_zynq.c
>>> @@ -71,6 +71,11 @@ static const int dma_irqs[8] = {
>>>   #define ZYNQ_SDHCI_CAPABILITIES 0x69ec0080  /* Datasheet: UG585 
>>> (v1.12.1) */
>>> +struct ZynqMachineState {
>>> +    MachineState parent;
>>> +    Clock *ps_clk;
>>> +};
>>> +
>>>   #define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
>>>                           extract32((x), 12,  4) << 16)
>>> @@ -79,29 +84,21 @@ static const int dma_irqs[8] = {
>>>    */
>>>   #define SLCR_WRITE(addr, val) \
>>> -    0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16)), /* movw r1 
>>> ... */ \
>>> -    0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 
>>> ... */ \
>>> -    0xe5801000 + (addr)
>>> -
>>> -struct ZynqMachineState {
>>> -    MachineState parent;
>>> -    Clock *ps_clk;
>>> -};
>>> +    cpu_to_le32(0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16))), 
>>> /* movw r1 ... */ \
>>> +    cpu_to_le32(0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16))), 
>>> /* movt r1 ... */ \
>>
>> Looks like the callers all pass in constants, perhaps const_le32 
>> should be used everywhere or am I missing something?
> 
> extract32() is a function. I agree we can rewrite this macro to remove
> it, I was simply lazy ;) I'll do for v2 so the array will be const.

Well it is already runtime const, I meant 'static const' so it becomes
build-time const.

