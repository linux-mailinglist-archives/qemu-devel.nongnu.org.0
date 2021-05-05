Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BFD373CFC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:04:40 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leI8l-00063p-C9
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@xcancerberox.com.ar>)
 id 1leI59-0004dL-6c
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:00:55 -0400
Received: from cloud.estebanecheverria.gob.ar ([67.227.157.153]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@xcancerberox.com.ar>)
 id 1leI56-0006SE-4e
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xcancerberox.com.ar; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ysCNK3+ZLH3k1cR3l3gFBXynWsjChYnnstbz/Gwv2Q0=; b=TQyR/P5KDb1AkjMDd6dKM8bSzq
 gL8EG4IkLvfHBSpsw8Lu+IrZyGwc0a2OOUccrPnZBmWCLO3l8D+RuvNROreuNlUnXLoZbLjehLcQT
 FuwDogV+fPsUxKyizQ7rSouF7//vqSVfPfvB1+DLz8dJn22TMsCW0TZsnLT5/Ii70JEyfdtg1MmBf
 7ipfTF1FOCBbJg3jfOciIACMfCfbnA8/V6alH9SIszePhYzgE1xO+CoeKTRxvZlfHPdIYprygwyTn
 0S4KQZXniOJY+3INoka5PEBhDR9a+EtN5zR3ne8WPASNlmloq45er2XAR6/vKQNw1T0knhV8ySTe0
 38vUnvaA==;
Received: from 120.net-94.228.4.isbl.embou.net ([94.228.4.120]:44320
 helo=[192.168.2.151])
 by cloud.estebanecheverria.gob.ar with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <me@xcancerberox.com.ar>)
 id 1leI4O-0008Bz-RC; Wed, 05 May 2021 11:00:07 -0300
Subject: Re: [PATCH] hw/avr/atmega.c: use the avr51 cpu for atmega1280
To: Fred Konrad <konrad@adacore.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
 <7970a6ec-f5ac-bcc9-9184-d8450b64b116@amsat.org>
 <27cc1bc5-ee71-abf6-fd8f-58ec44e1767f@xcancerberox.com.ar>
 <d8b05f93-ef5f-1697-439b-8961cb446cdf@adacore.com>
From: Joaquin de Andres <me@xcancerberox.com.ar>
Message-ID: <b61dabc3-e5e6-5bab-503c-53dd32a11aff@xcancerberox.com.ar>
Date: Wed, 5 May 2021 16:00:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d8b05f93-ef5f-1697-439b-8961cb446cdf@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cloud.estebanecheverria.gob.ar
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - xcancerberox.com.ar
X-Get-Message-Sender-Via: cloud.estebanecheverria.gob.ar: authenticated_id:
 me@xcancerberox.com.ar
X-Authenticated-Sender: cloud.estebanecheverria.gob.ar: me@xcancerberox.com.ar
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=67.227.157.153;
 envelope-from=me@xcancerberox.com.ar; helo=cloud.estebanecheverria.gob.ar
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 3:33 PM, Fred Konrad wrote:
>
>
> Le 4/30/21 à 12:27 PM, Joaquin de Andres a écrit :
>> On 4/28/21 9:17 PM, Philippe Mathieu-Daudé wrote:
>>> Cc'ing Joaquín.
>>>
>>> On 4/28/21 9:15 PM, Frederic Konrad wrote:
>>>> According to the as documentation:
>>>>   (https://sourceware.org/binutils/docs-2.36/as/AVR-Options.html)
>>>>
>>>> "Instruction set avr51 is for the enhanced AVR core with exactly 128K
>>>>   program memory space (MCU types: atmega128, atmega128a, atmega1280,
>>>>   atmega1281, atmega1284, atmega1284p, atmega128rfa1, atmega128rfr2,
>>>>   atmega1284rfr2, at90can128, at90usb1286, at90usb1287, m3000)."
>>>>
>>>> But when compiling a program for atmega1280 or avr51 and trying to
>>>> execute
>>>> it:
>>>>
>>>> $ cat > test.S << EOF
>>>>> loop:
>>>>>      rjmp loop
>>>>> EOF
>>>> $ avr-gcc -nostdlib -nostartfiles -mmcu=atmega1280 test.S -o test.elf
>>>> $ qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
>>>>                    -bios test.elf
>>>> qemu-system-avr: Current machine: Arduino Mega (ATmega1280) with
>>>> 'avr6' CPU
>>>> qemu-system-avr: ELF image 'test.elf' is for 'avr51' CPU
>>>>
>>>> So this fixes the atmega1280 class to use an avr51 CPU.
>>>>
>>>> Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
>>>> ---
>>>>   hw/avr/atmega.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
>>>> index 44c6afebbb..e3ea5702f5 100644
>>>> --- a/hw/avr/atmega.c
>>>> +++ b/hw/avr/atmega.c
>>>> @@ -402,7 +402,7 @@ static void atmega1280_class_init(ObjectClass
>>>> *oc, void *data)
>>>>   {
>>>>       AtmegaMcuClass *amc = ATMEGA_MCU_CLASS(oc);
>>>>   -    amc->cpu_type = AVR_CPU_TYPE_NAME("avr6");
>>>> +    amc->cpu_type = AVR_CPU_TYPE_NAME("avr51");
>>>>       amc->flash_size = 128 * KiB;
>>>>       amc->eeprom_size = 4 * KiB;
>>>>       amc->sram_size = 8 * KiB;
>>>>
>>>
>> Good catch!
>>
>
> Thanks, does that count as a reviewed-by :)?
>
>
Yes! sorry.


Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>

