Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F394B2E6FE5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 12:18:35 +0100 (CET)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuD1O-0007WH-Lo
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 06:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuD0E-00076I-21
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:17:22 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:27789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuD0B-0001IR-3A
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 06:17:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AB6587470E0;
 Tue, 29 Dec 2020 12:17:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7BDE17470DF; Tue, 29 Dec 2020 12:17:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7A11F7470DB;
 Tue, 29 Dec 2020 12:17:15 +0100 (CET)
Date: Tue, 29 Dec 2020 12:17:15 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Bug in Bonito? (mips/fuloong2e)
In-Reply-To: <511225e2-f074-4318-4fb0-f695ca6befe0@amsat.org>
Message-ID: <9b268b-bea2-247e-74da-c1a658efb92d@eik.bme.hu>
References: <771a6cd4-90a7-662e-5a5b-e8a9395a875@eik.bme.hu>
 <c655a692-991e-b633-456a-6fb149520a37@flygoat.com>
 <511225e2-f074-4318-4fb0-f695ca6befe0@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-402807188-1609240635=:96981"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-402807188-1609240635=:96981
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 29 Dec 2020, Philippe Mathieu-Daudé wrote:
> On 12/29/20 6:26 AM, Jiaxun Yang wrote:
>> 在 2020/12/29 上午11:26, BALATON Zoltan 写道:
>>> Hello,
>>>
>>> While continuing with part two of my vt82c686b clean ups I've tried to
>>> implement SMBus IO base configuration in the vt82c686b-pm part that
>>> I've already done for vt8231 for pegasos2 and it should be the same
>>> for 686B. (In short, writing address to pm config 0x90 sets base
>>> address of smbus regs and bit 0 of 0xd2 enables/disables it.) This is
>>> what the firmware does first and it would allow removing hard coded
>>> 0xeee1 value and the property to set it and then I could reuse the
>>> same PM part in VT8231.
>>>
>> [...]
>>>
>>> Any idea what this is trying to do and how to fix it?
>>
>> It's trying to translate Bonito style PCI config space r/w to standard PCI
>> config space R/W.
>>
>> A quick galance told me change BONITO_PCICONF_REG_MASK to 0xff
>> may help.

With Jiaxun's change it works better:

bonito_spciconf_write: bonito_spciconf_write 0000000000000490 size 4 val eee1
bonito_sbridge_pciaddr: cfgaddr 10490 pciaddr 2c90 busno 0 devno 5 funno 4 regno 144
pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
via_pm_write addr 0x90 val 0xeee1 len 0x4

bonito_writel: bonito_writel 0000000000000018 val 1 saddr 6
bonito_readl: bonito_readl 0000000000000018

bonito_spciconf_write: bonito_spciconf_write 00000000000004d2 size 2 val 1
bonito_sbridge_pciaddr: cfgaddr 104d2 pciaddr 2cd2 busno 0 devno 5 funno 4 regno 210
pci_cfg_write vt82c686b-pm 05:4 @0xd2 <- 0x1
via_pm_write addr 0xd2 val 0x1 len 0x2
*** Should update smbus io base to eee1, enable

(last line is my debug message). Not sure if this breaks anyhing else but 
PMON still seems to work (tested with pmon_2e.bin).

> Per the datasheet section "5.7.5. Accessing PCI configuration space"
> 0xfc is the correct value, but the register number starts at the 2nd
> bit. So this is not a write access to register 0xd2 but 0x34?
>
> If you can test, this is the snippet I plan to send later:
>
> -- >8 --
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index a99eced0657..65953766dd0 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -189,3 +189,3 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
> #define BONITO_PCICONF_REG_MASK        0xFC
> -#define BONITO_PCICONF_REG_OFFSET      0
> +#define BONITO_PCICONF_REG_OFFSET      2
> ---

This does not seem to work, I get all mixed up regs:

bonito_spciconf_write: bonito_spciconf_write 0000000000000490 size 4 val eee1
bonito_sbridge_pciaddr: cfgaddr 10490 pciaddr 2c24 busno 0 devno 5 funno 4 regno 36
pci_cfg_write vt82c686b-pm 05:4 @0x24 <- 0xeee1
via_pm_write addr 0x24 val 0xeee1 len 0x4

bonito_writel: bonito_writel 0000000000000018 val 1 saddr 6
bonito_readl: bonito_readl 0000000000000018

bonito_spciconf_write: bonito_spciconf_write 00000000000004d2 size 2 val 1
bonito_sbridge_pciaddr: cfgaddr 104d2 pciaddr 2c34 busno 0 devno 5 funno 4 regno 52
pci_cfg_write vt82c686b-pm 05:4 @0x34 <- 0x1
via_pm_write addr 0x34 val 0x1 len 0x2

So I'll use the first one for now, that allows me to continue with vt82c686b.

Regards,
BALATON Zoltan
--3866299591-402807188-1609240635=:96981--

