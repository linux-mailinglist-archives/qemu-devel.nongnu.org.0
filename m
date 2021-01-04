Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7372E8F3C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 02:42:23 +0100 (CET)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwEt4-0007DV-ID
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 20:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwEqe-0006c5-Gy; Sun, 03 Jan 2021 20:39:52 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:23686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwEqT-0003QI-G4; Sun, 03 Jan 2021 20:39:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 01206747601;
 Mon,  4 Jan 2021 02:39:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BCB9F74645F; Mon,  4 Jan 2021 02:39:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BAD2974645B;
 Mon,  4 Jan 2021 02:39:38 +0100 (CET)
Date: Mon, 4 Jan 2021 02:39:38 +0100 (CET)
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 1/5] ppc4xx: Move common dependency on serial to common
 option
In-Reply-To: <2f801d9c-abe9-95c7-9b6a-ec1d66f83286@redhat.com>
Message-ID: <a394197c-7ce7-bc6d-afa5-68f21d08f22@eik.bme.hu>
References: <cover.1609636173.git.balaton@eik.bme.hu>
 <94f1eb7cfb7f315bd883d825f3ce7e0cfc2f2b69.1609636173.git.balaton@eik.bme.hu>
 <2f801d9c-abe9-95c7-9b6a-ec1d66f83286@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, qemu-ppc@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sun, 3 Jan 2021, Thomas Huth wrote:
> On 03/01/2021 02.09, BALATON Zoltan via wrote:
>> All machines that select SERIAL also select PPC4XX so we can just add
>> this common dependency there once.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/Kconfig | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>> 
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index dd86e664d2..8548f42b0d 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -37,7 +37,6 @@ config PPC405
>>       select M48T59
>>       select PFLASH_CFI02
>>       select PPC4XX
>> -    select SERIAL
>>     config PPC440
>>       bool
>> @@ -46,13 +45,13 @@ config PPC440
>>       imply E1000_PCI
>>       select PCI_EXPRESS
>>       select PPC4XX
>> -    select SERIAL
>>       select FDT_PPC
>>     config PPC4XX
>>       bool
>>       select BITBANG_I2C
>>       select PCI
>> +    select SERIAL
>
> Not sure whether this is really the right way to go... serial_hd() and 
> serial_mm_init() are only used in ppc405_uc.c
> and ppc440_bamboo.c, so IMHO it does make sense to keep the SERIAL setting 
> with PPC405 and PPC440.
>
>
>>   config SAM460EX
>>       bool
>> @@ -61,7 +60,6 @@ config SAM460EX
>>       select IDE_SII3112
>>       select M41T80
>>       select PPC440
>> -    select SERIAL
>
> But this hunk here should be fine, I think, since PPC440 already includes the 
> SERIAL switch.

If it's OK in this case why doesn't the same argument apply in case of 
PPC440 including PPC4XX which then includes SERIAL. All these boards use 
serial_mm_init but they also all include PPC4XX either directly or 
indirectly via an intermeriate option such as PPC440 or PPC405.

Regards,
BALATON Zoltan

> Thomas
>
>
>>       select SM501
>>       select SMBUS_EEPROM
>>       select USB_EHCI_SYSBUS
>> @@ -123,7 +121,6 @@ config VIRTEX
>>       bool
>>       select PPC4XX
>>       select PFLASH_CFI01
>> -    select SERIAL
>>       select XILINX
>>       select XILINX_ETHLITE
>>       select FDT_PPC
>> 
>
>

