Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFC52E8F2F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 02:28:19 +0100 (CET)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwEfS-0004Gc-Br
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 20:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwEdK-0003im-4Y; Sun, 03 Jan 2021 20:26:07 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwEdG-0007bf-Nz; Sun, 03 Jan 2021 20:26:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 89B1D747608;
 Mon,  4 Jan 2021 02:25:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5D165747602; Mon,  4 Jan 2021 02:25:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5B2A6747601;
 Mon,  4 Jan 2021 02:25:55 +0100 (CET)
Date: Mon, 4 Jan 2021 02:25:55 +0100 (CET)
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 1/3] ppc4xx: Move common dependency on serial to common
 option
In-Reply-To: <20210104003147.GA1915@yekko.fritz.box>
Message-ID: <eaedeb61-e193-d02c-6dce-7a6d7e51dced@eik.bme.hu>
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <9c0b7267edf1dc4624702a29101154a8910682f2.1609413115.git.balaton@eik.bme.hu>
 <20210104003147.GA1915@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Mon, 4 Jan 2021, David Gibson wrote:
> On Thu, Dec 31, 2020 at 12:11:55PM +0100, BALATON Zoltan via wrote:
>> All machines that select SERIAL also select PPC4XX so we can just add
>> this common dependency there once.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> Applied to ppc-for-6.0.

Not yet please, I'll send another version with changes suggested by 
Thomas. and also noticed another patch in this series needs update so I'll 
wait until tomorrow to see if anybody else has anything to say then will 
send and updated series.

Regards,
BALATON Zoltan.

>> ---
>>  hw/ppc/Kconfig | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>> index dd86e664d2..8548f42b0d 100644
>> --- a/hw/ppc/Kconfig
>> +++ b/hw/ppc/Kconfig
>> @@ -37,7 +37,6 @@ config PPC405
>>      select M48T59
>>      select PFLASH_CFI02
>>      select PPC4XX
>> -    select SERIAL
>>
>>  config PPC440
>>      bool
>> @@ -46,13 +45,13 @@ config PPC440
>>      imply E1000_PCI
>>      select PCI_EXPRESS
>>      select PPC4XX
>> -    select SERIAL
>>      select FDT_PPC
>>
>>  config PPC4XX
>>      bool
>>      select BITBANG_I2C
>>      select PCI
>> +    select SERIAL
>>
>>  config SAM460EX
>>      bool
>> @@ -61,7 +60,6 @@ config SAM460EX
>>      select IDE_SII3112
>>      select M41T80
>>      select PPC440
>> -    select SERIAL
>>      select SM501
>>      select SMBUS_EEPROM
>>      select USB_EHCI_SYSBUS
>> @@ -123,7 +121,6 @@ config VIRTEX
>>      bool
>>      select PPC4XX
>>      select PFLASH_CFI01
>> -    select SERIAL
>>      select XILINX
>>      select XILINX_ETHLITE
>>      select FDT_PPC
>
>

