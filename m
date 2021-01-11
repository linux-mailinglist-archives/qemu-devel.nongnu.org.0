Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0C2F1DF3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:24:54 +0100 (CET)
Received: from localhost ([::1]:57674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1s5-0003Ux-A9
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kz1qJ-0002Zo-MB; Mon, 11 Jan 2021 13:23:03 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35994
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kz1qH-0001Fx-I4; Mon, 11 Jan 2021 13:23:03 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kz1qG-0002Yz-00; Mon, 11 Jan 2021 18:23:05 +0000
To: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <natechancellor@gmail.com>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-5-peter.maydell@linaro.org>
 <20210111010028.GA3499905@ubuntu-m3-large-x86>
 <CAFEAcA9EFdDq+cLY=Z_R=w-u+N1pCZ-Mnq+ckFQ-z2_1jQckuA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c1dc84cc-20ca-b324-6427-57d30c4e3601@ilande.co.uk>
Date: Mon, 11 Jan 2021 18:22:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9EFdDq+cLY=Z_R=w-u+N1pCZ-Mnq+ckFQ-z2_1jQckuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 4/8] hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2021 17:14, Peter Maydell wrote:

>> On Sat, Dec 12, 2020 at 12:15:33AM +0000, Peter Maydell wrote:
>>> Switch the bamboo board to directly creating and configuring the UIC,
>>> rather than doing it via the old ppcuic_init() helper function.
> 
>> Hopefully reporting this here is okay, I find Launchpad hard to use but
>> I can file it there if need be.
> 
> Email reports are fine, thanks.
> 
>> This patch causes a panic while trying to boot a ppc44x_defconfig Linux
>> kernel:
> 
> Sorry, yes, this is a bug in this commit of mine. I didn't notice
> in the conversion that Bamboo has a non-standard DCR base register
> value. I'll just send a patch for this in a second.
> 
> Thanks for the repro case.
> 
> NB: with the fix for the the kernel proceeds on to the PCI
> related assert that it hit in 5.2.

FWIW the assert() seems to be the same problem that Guenter reported at 
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05847.html.

According to Linux's bamboo.dts the PCI slots look this:

     /* Bamboo has all 4 IRQ pins tied together per slot */
     interrupt-map-mask = <0xf800 0x0 0x0 0x0>;
     interrupt-map = <
         /* IDSEL 1 */
         0x800 0x0 0x0 0x0 &UIC0 0x1c 0x8

         /* IDSEL 2 */
         0x1000 0x0 0x0 0x0 &UIC0 0x1b 0x8

         /* IDSEL 3 */
         0x1800 0x0 0x0 0x0 &UIC0 0x1a 0x8

         /* IDSEL 4 */
         0x2000 0x0 0x0 0x0 &UIC0 0x19 0x8
     >;

But the assert() is suggesting that we are getting an PCI IRQ of -1 which can only 
come from slot 0 which isn't physically possible:

/* On Bamboo, all pins from each slot are tied to a single board IRQ. This
  * may need further refactoring for other boards. */
static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
{
     int slot = PCI_SLOT(pci_dev->devfn);

     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);

     return slot - 1;
}

And indeed the backtrace shows that the PCI host bridge itself is generating this IRQ:

(gdb) bt
#0  ppc4xx_pci_map_irq (pci_dev=0x555556c0efe0, irq_num=0) at ../hw/ppc/ppc4xx_pci.c:250
#1  0x00005555559420d9 in pci_change_irq_level (pci_dev=0x555556c0efe0, irq_num=0, 
change=0) at ../hw/pci/pci.c:266
#2  0x0000555555944d56 in pci_update_irq_disabled (d=0x555556c0efe0, 
was_irq_disabled=0) at ../hw/pci/pci.c:1386
#3  0x0000555555945086 in pci_default_write_config (d=0x555556c0efe0, addr=4, 
val_in=1030, l=2) at ../hw/pci/pci.c:1426
#4  0x0000555555aa5b7e in pci_host_config_write_common (pci_dev=0x555556c0efe0, 
addr=4, limit=256, val=1030, len=2) at ../hw/pci/pci_host.c:83
#5  0x0000555555aa5ce2 in pci_data_write (s=0x555556c0e400, addr=2147483652, 
val=1030, len=2) at ../hw/pci/pci_host.c:120
#6  0x0000555555aa5e08 in pci_host_data_write (opaque=0x555556c0ce70, addr=0, 
val=1030, len=2) at ../hw/pci/pci_host.c:167
#7  0x0000555555cb4797 in memory_region_write_accessor (mr=0x555556c0d280, addr=0, 
value=0x7fffe60234a8, size=2, shift=0, mask=65535, attrs=...)
     at ../softmmu/memory.c:491

The assert() is correct since it correctly identifies an underflow of the PCI IRQ 
array but what is the best solution? I guess the possibilities are to either i) map 
the PCI host bridge IRQ to PCI IRQ 0 so at least it doesn't fail or ii) add an extra 
PCI IRQ 0 for the PCI host bridge and leave it unconnected.


ATB,

Mark.

