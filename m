Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48158C87A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:41:22 +0200 (CEST)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL24P-0005hj-J3
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL1n3-0004cu-4J; Mon, 08 Aug 2022 08:23:26 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:13745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL1n0-0004Nr-VJ; Mon, 08 Aug 2022 08:23:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0C5E0747F1C;
 Mon,  8 Aug 2022 14:23:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CF9B1747F1B; Mon,  8 Aug 2022 14:23:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CE09B747F19;
 Mon,  8 Aug 2022 14:23:20 +0200 (CEST)
Date: Mon, 8 Aug 2022 14:23:20 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 03/22] ppc/ppc405: Move devices under the ref405ep
 machine
In-Reply-To: <20220808102734.133084-4-clg@kaod.org>
Message-ID: <ea6b59ff-e4ac-8e1b-63fb-4aac388f695e@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-523838865-1659961400=:47322"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-523838865-1659961400=:47322
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/ppc405_boards.c | 31 +++++++++++++++++++------------
> 1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 96700be74d08..f4794ba40ce6 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -230,13 +230,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>     env->load_info = &boot_info;
> }
>
> -static void ref405ep_init(MachineState *machine)
> +static void ppc405_init(MachineState *machine)
> {
>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>     const char *kernel_filename = machine->kernel_filename;
>     PowerPCCPU *cpu;
> -    DeviceState *dev;
> -    SysBusDevice *s;
>     MemoryRegion *sram = g_new(MemoryRegion, 1);
>     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>     hwaddr ram_bases[2], ram_sizes[2];
> @@ -294,15 +292,6 @@ static void ref405ep_init(MachineState *machine)
>         memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
>     }
>
> -    /* Register FPGA */
> -    ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
> -    /* Register NVRAM */
> -    dev = qdev_new("sysbus-m48t08");
> -    qdev_prop_set_int32(dev, "base-year", 1968);
> -    s = SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
> -
>     /* Load kernel and initrd using U-Boot images */
>     if (kernel_filename && machine->firmware) {
>         target_ulong kernel_base, initrd_base;
> @@ -335,6 +324,23 @@ static void ref405ep_init(MachineState *machine)
>     }
> }
>
> +static void ref405ep_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +    SysBusDevice *s;
> +
> +    ppc405_init(machine);
> +
> +    /* Register FPGA */
> +    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
> +    /* Register NVRAM */
> +    dev = qdev_new("sysbus-m48t08");
> +    qdev_prop_set_int32(dev, "base-year", 1968);
> +    s = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
> +}
> +
> static void ref405ep_class_init(ObjectClass *oc, void *data)
> {
>     MachineClass *mc = MACHINE_CLASS(oc);
> @@ -354,6 +360,7 @@ static void ppc405_machine_class_init(ObjectClass *oc, void *data)
>     MachineClass *mc = MACHINE_CLASS(oc);
>
>     mc->desc = "PPC405 generic machine";
> +    mc->init = ppc405_init;
>     mc->default_ram_size = 128 * MiB;
>     mc->default_ram_id = "ppc405.ram";
> }
>
--3866299591-523838865-1659961400=:47322--

