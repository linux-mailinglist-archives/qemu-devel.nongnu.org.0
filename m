Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA82E337B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 02:43:10 +0100 (CET)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kthYz-0006D9-9B
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 20:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kthXs-0005mT-9n
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 20:42:00 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:24337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kthXo-0006iq-V4
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 20:41:59 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 57E5D74646C;
 Mon, 28 Dec 2020 02:41:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0C40E74645F; Mon, 28 Dec 2020 02:41:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 06F1A74645B;
 Mon, 28 Dec 2020 02:41:50 +0100 (CET)
Date: Mon, 28 Dec 2020 02:41:49 +0100 (CET)
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 01/12] vt82c686: Add APM and ACPI dependencies for VT82C686
In-Reply-To: <CAAhV-H6YE5-GbK52Pj-Lrr2uCkaXR298umq1vonBCXN5cxQFwg@mail.gmail.com>
Message-ID: <1c298c6b-eee-7c3d-87c9-eab53bc43dc1@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <2157782addb379824c71edd301108f7799302694.1609031406.git.balaton@eik.bme.hu>
 <CAAhV-H6YE5-GbK52Pj-Lrr2uCkaXR298umq1vonBCXN5cxQFwg@mail.gmail.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Hello,

On Mon, 28 Dec 2020, Huacai Chen wrote:
> Hi, BALATON
>
> On Sun, Dec 27, 2020 at 9:21 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> Compiling vt82c686.c fails without APM and ACPI_PM functions. Add
>> dependency on these in Kconfig to fix this.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>> index c7f07854f7..2ca2593ee6 100644
>> --- a/hw/isa/Kconfig
>> +++ b/hw/isa/Kconfig
>> @@ -47,6 +47,8 @@ config VT82C686
>>      select ACPI_SMBUS
>>      select SERIAL_ISA
>>      select FDC
>> +    select APM
>> +    select ACPI_X86
> I feel a bit uncomfortable with ACPI_X86 in the MIPS code, can we just
> select ACPI? And if that is not enough, can we select more options?

This patch is not new, I've tried submitting it before but got rejeceted 
for similar reason:

https://lists.nongnu.org/archive/html/qemu-devel/2019-03/msg03428.html

Then Philippe said he had a better alternative but it's still not fixed in 
master so this patch is needed and you likely already depend on X86 
without knowing as something is pulling these in for MIPS. This can be 
reproduced e,g, by adding this device to PPC as:

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index d235a096c6..90b53d40c2 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -64,6 +64,7 @@ config SAM460EX
      select SMBUS_EEPROM
      select USB_EHCI_SYSBUS
      select USB_OHCI
+    select VT82C686

  config PREP
      bool

then compiling --target-list=ppc-softmmu
Even after:

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index c7f07854f7..75986671b9 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -47,6 +47,8 @@ config VT82C686
      select ACPI_SMBUS
      select SERIAL_ISA
      select FDC
+    select APM
+    select ACPI

  config SMC37C669
      bool

I get:

[] Linking target qemu-system-ppc
FAILED: qemu-system-ppc
ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_pm_realize':
hw/isa/vt82c686.c:378: undefined reference to `acpi_pm_tmr_init'
ld: hw/isa/vt82c686.c:379: undefined reference to `acpi_pm1_evt_init'
ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `pm_update_sci':
hw/isa/vt82c686.c:192: undefined reference to `acpi_pm1_evt_get_sts'
ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_pm_realize':
hw/isa/vt82c686.c:380: undefined reference to `acpi_pm1_cnt_init'
ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `pm_update_sci':
hw/isa/vt82c686.c:200: undefined reference to `acpi_pm_tmr_update'
collect2: error: ld returned 1 exit status

So my patch just makes existing dependencies explicit and allows this to 
build but I'm OK with any other fix you propose that fixes the above case 
as that's how I'll try to use this in the future. (I did look at this when 
first found it and concluded that I could not make a better fix than 
depending on ACPI_X86 here. I forgot the details but it was way more work 
than I want to take up for this so please propose a better fix if you 
can't accept this patch.)

Maybe Philippe remembers some more.

Regards,
BALATON Zoltan

