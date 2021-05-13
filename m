Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D94437FC62
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:19:06 +0200 (CEST)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEzJ-00043T-9R
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhEuT-0007ka-3v; Thu, 13 May 2021 13:14:05 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhEuN-0003cF-BS; Thu, 13 May 2021 13:14:04 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mc02T-1l58n428tj-00dTzK; Thu, 13 May 2021 19:13:09 +0200
Subject: Re: [PATCH] hw/avr/atmega.c: use the avr51 cpu for atmega1280
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Fred Konrad
 <konrad@adacore.com>, qemu-devel@nongnu.org
References: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
 <7970a6ec-f5ac-bcc9-9184-d8450b64b116@amsat.org>
 <27cc1bc5-ee71-abf6-fd8f-58ec44e1767f@xcancerberox.com.ar>
 <d8b05f93-ef5f-1697-439b-8961cb446cdf@adacore.com>
 <b61dabc3-e5e6-5bab-503c-53dd32a11aff@xcancerberox.com.ar>
 <4f22587c-1eb1-deab-fdb6-c53e36537e36@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fe24f3e3-9a51-b87b-fef0-78b0e7658e2f@vivier.eu>
Date: Thu, 13 May 2021 19:13:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4f22587c-1eb1-deab-fdb6-c53e36537e36@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P9BAOIWngQhgHJC2iGO5yEELhaQQZEodgUlJAxOvycetvZRKeQz
 mFy7Kq3ZDxb7/kI+AC0n+fOML0BlPflYyUvIEsdv2jyYV1uk8De8CXQzLoHsTPmY8QXvsK1
 U4U9c9gFFTxE/XmqrUrONw71QkK/MqsIpEno5T0rdxAdpfvSW9WicPzjYpnVwcKfypXTFVd
 q7ybUvQgUQn+Dq6YwbkCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0iys/8OhKAw=:Vy5r0RS2C9XqR4vYhj2L16
 w8MebqRCXmYMuOlgGPGjx2+5Q95sQGMcv45iL0EADdBVpvt3RFUBIUVjjBEh9Z2iMREDb2KME
 inV1nYhFbB2yRjL5xaNBRnKZWiy4M1dzNQvPJ8urF1g50dn1z1e0M5IIouZe0zhkyoVCofNNV
 eA7nJDPXlO2KqzEJOpouaqa/Iw+KnS30oBXcdD7FtLWKW+/XfhBU7mblUdogGSxCCQNwTjmLf
 Gw7EEPFR0Znz4nl0KPd9VjQOT9IDVwZW/7gZ+COOTnIlAHUhvym3lbrabRkuKLBNxux2ep5Nn
 yzt3gj8buOeW1UK72qdj8lXjnA0Jzba7W8kbOLDapaaQycQdFebA7x1kcTl6xzh+RZpCZghHH
 sPErvkB7Eyp0e+/suDegmv9GQ6lcIXxJwYeWlnz3NsdjB5RCjH9o7/lX2nPIKr20hxGYRSY4+
 7VruxCVyTpYorbOKmGrK1aWf8M6iDzGMSmVq6woRxNRjSNZudwENlfLrYw3xsDNh+YakH972g
 klq5SjHehL2cFa9Njd+qoY=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/05/2021 à 19:04, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial@

Applied to my trivial-patches branch.

Thanks,
Laurent

> On 5/5/21 4:00 PM, Joaquin de Andres wrote:
>> On 5/5/21 3:33 PM, Fred Konrad wrote:
>>>
>>>
>>> Le 4/30/21 à 12:27 PM, Joaquin de Andres a écrit :
>>>> On 4/28/21 9:17 PM, Philippe Mathieu-Daudé wrote:
>>>>> Cc'ing Joaquín.
>>>>>
>>>>> On 4/28/21 9:15 PM, Frederic Konrad wrote:
>>>>>> According to the as documentation:
>>>>>>   (https://sourceware.org/binutils/docs-2.36/as/AVR-Options.html)
>>>>>>
>>>>>> "Instruction set avr51 is for the enhanced AVR core with exactly 128K
>>>>>>   program memory space (MCU types: atmega128, atmega128a, atmega1280,
>>>>>>   atmega1281, atmega1284, atmega1284p, atmega128rfa1, atmega128rfr2,
>>>>>>   atmega1284rfr2, at90can128, at90usb1286, at90usb1287, m3000)."
>>>>>>
>>>>>> But when compiling a program for atmega1280 or avr51 and trying to
>>>>>> execute
>>>>>> it:
>>>>>>
>>>>>> $ cat > test.S << EOF
>>>>>>> loop:
>>>>>>>      rjmp loop
>>>>>>> EOF
>>>>>> $ avr-gcc -nostdlib -nostartfiles -mmcu=atmega1280 test.S -o test.elf
>>>>>> $ qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
>>>>>>                    -bios test.elf
>>>>>> qemu-system-avr: Current machine: Arduino Mega (ATmega1280) with
>>>>>> 'avr6' CPU
>>>>>> qemu-system-avr: ELF image 'test.elf' is for 'avr51' CPU
>>>>>>
>>>>>> So this fixes the atmega1280 class to use an avr51 CPU.
>>>>>>
>>>>>> Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
>>>>>> ---
>>>>>>   hw/avr/atmega.c | 2 +-
>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
>>>>>> index 44c6afebbb..e3ea5702f5 100644
>>>>>> --- a/hw/avr/atmega.c
>>>>>> +++ b/hw/avr/atmega.c
>>>>>> @@ -402,7 +402,7 @@ static void atmega1280_class_init(ObjectClass
>>>>>> *oc, void *data)
>>>>>>   {
>>>>>>       AtmegaMcuClass *amc = ATMEGA_MCU_CLASS(oc);
>>>>>>   -    amc->cpu_type = AVR_CPU_TYPE_NAME("avr6");
>>>>>> +    amc->cpu_type = AVR_CPU_TYPE_NAME("avr51");
>>>>>>       amc->flash_size = 128 * KiB;
>>>>>>       amc->eeprom_size = 4 * KiB;
>>>>>>       amc->sram_size = 8 * KiB;
>>>>>>
>>>>>
>>>> Good catch!
>>>>
>>>
>>> Thanks, does that count as a reviewed-by :)?
>>>
>>>
>> Yes! sorry.
>>
>>
>> Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>
>>
> 



