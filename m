Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4245469AB0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 16:06:51 +0100 (CET)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFZq-0006vn-Bu
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 10:06:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1muFYY-000602-UT; Mon, 06 Dec 2021 10:05:30 -0500
Received: from [2001:738:2001:2001::2001] (port=17099 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1muFYV-0000eA-Q6; Mon, 06 Dec 2021 10:05:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E6FA3755F74;
 Mon,  6 Dec 2021 16:05:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C237B748F5A; Mon,  6 Dec 2021 16:05:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C076E748F56;
 Mon,  6 Dec 2021 16:05:20 +0100 (CET)
Date: Mon, 6 Dec 2021 16:05:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 07/15] ppc/ppc405: Add some address space definitions
In-Reply-To: <20211206103712.1866296-8-clg@kaod.org>
Message-ID: <e3178117-dfbc-c778-b48b-587bb3ce5167@eik.bme.hu>
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-8-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-957355465-1638803120=:25898"
X-Spam-Probability: 11%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-957355465-1638803120=:25898
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 6 Dec 2021, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405.h        |  7 +++++++
> hw/ppc/ppc405_boards.c | 16 +++++++---------
> 2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index ad5f4026b5db..ea48c3626908 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -27,6 +27,13 @@
>
> #include "hw/ppc/ppc4xx.h"
>
> +#define PPC405EP_SDRAM_BASE 0x00000000
> +#define PPC405EP_NVRAM_BASE 0xF0000000
> +#define PPC405EP_FPGA_BASE  0xF0300000
> +#define PPC405EP_SRAM_BASE  0xFFF00000
> +#define PPC405EP_SRAM_SIZE  (512 * KiB)
> +#define PPC405EP_FLASH_BASE 0xFFF80000

Are these specific to the 405EP SoC itself or the board? Maybe it's better 
to put these in the board .c file and get rid of the ppc405.h later if 
there are no 405 specific parts needed. It's currently included also by 
440 machines because it has some functions re-used by them but those may 
be gone when QOM-ifying these eventually or could be moved to a ppc4xx.h 
instead. I've tried to make a distinction between 405, 440 and 4xx parts 
(the latter common to both) when adding sam460ex but did not finish this 
clean up completely.

Regards,
BALATON Zoltan

> +
> /* Bootinfo as set-up by u-boot */
> typedef struct ppc4xx_bd_info_t ppc4xx_bd_info_t;
> struct ppc4xx_bd_info_t {
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index fcdb6d4cf8a0..60dc81fa4880 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -154,7 +154,6 @@ static void ref405ep_init(MachineState *machine)
>     ram_addr_t bdloc;
>     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>     hwaddr ram_bases[2], ram_sizes[2];
> -    target_ulong sram_size;
>     long bios_size;
>     //int phy_addr = 0;
>     //static int phy_addr = 1;
> @@ -187,10 +186,9 @@ static void ref405ep_init(MachineState *machine)
>     env = &cpu->env;
>
>     /* allocate SRAM */
> -    sram_size = 512 * KiB;
> -    memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size,
> +    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
>                            &error_fatal);
> -    memory_region_add_subregion(sysmem, 0xFFF00000, sram);
> +    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
>     /* allocate and load BIOS */
> #ifdef USE_FLASH_BIOS
>     dinfo = drive_get(IF_PFLASH, 0, 0);
> @@ -230,24 +228,24 @@ static void ref405ep_init(MachineState *machine)
>         }
>     }
>     /* Register FPGA */
> -    ref405ep_fpga_init(sysmem, 0xF0300000);
> +    ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
>     /* Register NVRAM */
>     dev = qdev_new("sysbus-m48t08");
>     qdev_prop_set_int32(dev, "base-year", 1968);
>     s = SYS_BUS_DEVICE(dev);
>     sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_mmio_map(s, 0, 0xF0000000);
> +    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
>     /* Load kernel */
>     linux_boot = (kernel_filename != NULL);
>     if (linux_boot) {
>         memset(&bd, 0, sizeof(bd));
> -        bd.bi_memstart = 0x00000000;
> +        bd.bi_memstart = PPC405EP_SDRAM_BASE;
>         bd.bi_memsize = machine->ram_size;
>         bd.bi_flashstart = -bios_size;
>         bd.bi_flashsize = -bios_size;
>         bd.bi_flashoffset = 0;
> -        bd.bi_sramstart = 0xFFF00000;
> -        bd.bi_sramsize = sram_size;
> +        bd.bi_sramstart = PPC405EP_SRAM_BASE;
> +        bd.bi_sramsize = PPC405EP_SRAM_SIZE;
>         bd.bi_bootflags = 0;
>         bd.bi_intfreq = 133333333;
>         bd.bi_busfreq = 33333333;
>
--3866299591-957355465-1638803120=:25898--

