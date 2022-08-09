Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40358DC9A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:57:43 +0200 (CEST)
Received: from localhost ([::1]:48718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSY2-0005sF-FW
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLSUK-0001W8-R0; Tue, 09 Aug 2022 12:53:52 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLSUI-0008Sl-6E; Tue, 09 Aug 2022 12:53:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C5F5D7462D3;
 Tue,  9 Aug 2022 18:53:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 217BA7461AE; Tue,  9 Aug 2022 18:53:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1F863745702;
 Tue,  9 Aug 2022 18:53:44 +0200 (CEST)
Date: Tue, 9 Aug 2022 18:53:44 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 04/24] ppc/ppc405: Move SRAM under the ref405ep machine
In-Reply-To: <20220809153904.485018-5-clg@kaod.org>
Message-ID: <9d3ac97d-342-1152-f01c-eb8b192dccaf@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1009652837-1660064024=:57026"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1009652837-1660064024=:57026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Aug 2022, Cédric Le Goater wrote:
> It doesn't belong to the generic machine nor the SoC. Fix a typo in
> the name while we are at it.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405_boards.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index f4794ba40ce6..381f39aa94cb 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -235,7 +235,6 @@ static void ppc405_init(MachineState *machine)
>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>     const char *kernel_filename = machine->kernel_filename;
>     PowerPCCPU *cpu;
> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
>     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>     hwaddr ram_bases[2], ram_sizes[2];
>     MemoryRegion *sysmem = get_system_memory();
> @@ -260,11 +259,6 @@ static void ppc405_init(MachineState *machine)
>     cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
>                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>
> -    /* allocate SRAM */
> -    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
> -                           &error_fatal);

Do you need to set an owner while at it? Anyway,

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Regards,
BALATON Zoltan

> -    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
> -
>     /* allocate and load BIOS */
>     if (machine->firmware) {
>         MemoryRegion *bios = g_new(MemoryRegion, 1);
> @@ -328,9 +322,15 @@ static void ref405ep_init(MachineState *machine)
> {
>     DeviceState *dev;
>     SysBusDevice *s;
> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
>
>     ppc405_init(machine);
>
> +    /* allocate SRAM */
> +    memory_region_init_ram(sram, NULL, "ref405ep.sram", PPC405EP_SRAM_SIZE,
> +                           &error_fatal);
> +    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE, sram);
> +
>     /* Register FPGA */
>     ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
>     /* Register NVRAM */
>
--3866299591-1009652837-1660064024=:57026--

