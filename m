Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B866B3B384B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 23:04:30 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwWWT-00027E-1i
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 17:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwWUm-0001R2-26
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 17:02:44 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwWUi-0007HB-Ho
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 17:02:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 694A974570E;
 Thu, 24 Jun 2021 23:02:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 387B57456E3; Thu, 24 Jun 2021 23:02:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 36DE47456B4;
 Thu, 24 Jun 2021 23:02:36 +0200 (CEST)
Date: Thu, 24 Jun 2021 23:02:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/5] hw/isa/vt82c686: Replace magic numbers by definitions
In-Reply-To: <20210624202747.1433023-2-f4bug@amsat.org>
Message-ID: <13a8596d-dea5-7e83-34aa-fec3a86a166e@eik.bme.hu>
References: <20210624202747.1433023-1-f4bug@amsat.org>
 <20210624202747.1433023-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1379392943-1624568556=:94935"
X-Spam-Probability: 9%
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1379392943-1624568556=:94935
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
> Replace magic values of the Power Management / SMBus function (#4)
> by definitions from the datasheet. The result is less compact, and
> we can follow what the code does without having to recur to the
> datasheet.

I'm not sure this is an improvement. With the values it's clear what is 
done but I can't follow how these magic constants are defined or what they 
do so no idea if this is still correct. I think if you want to review a 
device model then you should be familiar with the device or consult the 
data sheet. Otherwise you can't spot problems in the definition of these 
constants either. I'm not a fan of hiding things behind cryptic macros 
when you could just write it in a straightforward way that could be 
understood more clearly.

Regards,
BALATON Zoltan

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/isa/vt82c686.c | 50 +++++++++++++++++++++++++++++++----------------
> 1 file changed, 33 insertions(+), 17 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index f57f3e70679..4ddcf2d398c 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -14,6 +14,7 @@
>  */
>
> #include "qemu/osdep.h"
> +#include "hw/registerfields.h"
> #include "hw/isa/vt82c686.h"
> #include "hw/pci/pci.h"
> #include "hw/qdev-properties.h"
> @@ -38,6 +39,16 @@
> #define TYPE_VIA_PM "via-pm"
> OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
>
> +REG8(PM_GEN_CFG0,                   0x40)
> +REG8(PM_GEN_CFG1,                   0x41)
> +FIELD(PM_GEN_CFG1, ACPI_IO_ENABLE,  7, 1)
> +REG32(PM_IO_BASE,                   0x48)
> +FIELD(PM_IO_BASE, ADDR,             7, 9)
> +REG32(SMBUS_IO_BASE,                0x90)
> +FIELD(SMBUS_IO_BASE, ADDR,          4, 12)
> +REG8(SMBUS_HOST_CONFIG,             0xd2)
> +FIELD(SMBUS_HOST_CONFIG, ENABLE,    0, 1)
> +
> struct ViaPMState {
>     PCIDevice dev;
>     MemoryRegion io;
> @@ -48,21 +59,24 @@ struct ViaPMState {
>
> static void pm_io_space_update(ViaPMState *s)
> {
> -    uint32_t pmbase = pci_get_long(s->dev.config + 0x48) & 0xff80UL;
> +    uint32_t pmbase = pci_get_long(s->dev.config + A_PM_IO_BASE);
>
>     memory_region_transaction_begin();
> -    memory_region_set_address(&s->io, pmbase);
> -    memory_region_set_enabled(&s->io, s->dev.config[0x41] & BIT(7));
> +    memory_region_set_address(&s->io, pmbase & R_PM_IO_BASE_ADDR_MASK);
> +    memory_region_set_enabled(&s->io, FIELD_EX32(s->dev.config[A_PM_GEN_CFG1],
> +                                      PM_GEN_CFG1, ACPI_IO_ENABLE));
>     memory_region_transaction_commit();
> }
>
> static void smb_io_space_update(ViaPMState *s)
> {
> -    uint32_t smbase = pci_get_long(s->dev.config + 0x90) & 0xfff0UL;
> +    uint32_t smbase = pci_get_long(s->dev.config + A_SMBUS_IO_BASE);
>
>     memory_region_transaction_begin();
> -    memory_region_set_address(&s->smb.io, smbase);
> -    memory_region_set_enabled(&s->smb.io, s->dev.config[0xd2] & BIT(0));
> +    memory_region_set_address(&s->smb.io, smbase & R_SMBUS_IO_BASE_ADDR_MASK);
> +    memory_region_set_enabled(&s->smb.io,
> +                              FIELD_EX32(s->dev.config[A_SMBUS_HOST_CONFIG],
> +                                         SMBUS_HOST_CONFIG, ENABLE));
>     memory_region_transaction_commit();
> }
>
> @@ -98,19 +112,21 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
>
>     trace_via_pm_write(addr, val, len);
>     pci_default_write_config(d, addr, val, len);
> -    if (ranges_overlap(addr, len, 0x48, 4)) {
> -        uint32_t v = pci_get_long(s->dev.config + 0x48);
> -        pci_set_long(s->dev.config + 0x48, (v & 0xff80UL) | 1);
> +    if (ranges_overlap(addr, len, A_PM_IO_BASE, 4)) {
> +        uint32_t v = pci_get_long(s->dev.config + A_PM_IO_BASE);
> +        pci_set_long(s->dev.config + A_PM_IO_BASE,
> +                     (v & R_PM_IO_BASE_ADDR_MASK) | 1);
>     }
> -    if (range_covers_byte(addr, len, 0x41)) {
> +    if (range_covers_byte(addr, len, A_PM_GEN_CFG1)) {
>         pm_io_space_update(s);
>     }
> -    if (ranges_overlap(addr, len, 0x90, 4)) {
> -        uint32_t v = pci_get_long(s->dev.config + 0x90);
> -        pci_set_long(s->dev.config + 0x90, (v & 0xfff0UL) | 1);
> +    if (ranges_overlap(addr, len, A_SMBUS_IO_BASE, 4)) {
> +        uint32_t v = pci_get_long(s->dev.config + A_SMBUS_IO_BASE);
> +        pci_set_long(s->dev.config + A_SMBUS_IO_BASE,
> +                     (v & R_SMBUS_IO_BASE_ADDR_MASK) | 1);
>     }
> -    if (range_covers_byte(addr, len, 0xd2)) {
> -        s->dev.config[0xd2] &= 0xf;
> +    if (range_covers_byte(addr, len, A_SMBUS_HOST_CONFIG)) {
> +        s->dev.config[A_SMBUS_HOST_CONFIG] &= 0xf;
>         smb_io_space_update(s);
>     }
> }
> @@ -176,9 +192,9 @@ static void via_pm_reset(DeviceState *d)
>     memset(s->dev.config + PCI_CONFIG_HEADER_SIZE, 0,
>            PCI_CONFIG_SPACE_SIZE - PCI_CONFIG_HEADER_SIZE);
>     /* Power Management IO base */
> -    pci_set_long(s->dev.config + 0x48, 1);
> +    pci_set_long(s->dev.config + A_PM_IO_BASE, 1);
>     /* SMBus IO base */
> -    pci_set_long(s->dev.config + 0x90, 1);
> +    pci_set_long(s->dev.config + A_SMBUS_IO_BASE, 1);
>
>     acpi_pm1_evt_reset(&s->ar);
>     acpi_pm1_cnt_reset(&s->ar);
>
--3866299591-1379392943-1624568556=:94935--

