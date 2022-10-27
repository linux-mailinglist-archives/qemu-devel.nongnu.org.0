Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4977A60EE22
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:56:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ont1k-0004aY-Po; Wed, 26 Oct 2022 22:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1ont1g-0004Sw-O4
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:53:48 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1ont1d-0003hW-7S
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:53:47 -0400
Received: from loongson.cn (unknown [10.20.42.170])
 by gateway (Coremail) with SMTP id _____8DxOdiu8lljB8MCAA--.8809S3;
 Thu, 27 Oct 2022 10:53:35 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbuCt8lljYo0FAA--.20368S3; 
 Thu, 27 Oct 2022 10:53:34 +0800 (CST)
Message-ID: <21a0d24e-145e-c34c-ed4e-d0f7745331ec@loongson.cn>
Date: Thu, 27 Oct 2022 10:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 1/3] hw/loongarch: Change FDT base addr to 2 MiB
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, f4bug@amsat.org,
 philmd@linaro.org
References: <20221021035419.2632878-1-yangxiaojuan@loongson.cn>
 <20221021035419.2632878-2-yangxiaojuan@loongson.cn>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <20221021035419.2632878-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxbuCt8lljYo0FAA--.20368S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWFykWryrXw1fZw47Gw4fuFg_yoW5Ar4DpF
 9rAFn3Wr40qr97Wrn2qF98uFyDAwn7Ga429r17Cr4FkFnrWr10grW8Aw4qkFy8A395JF4F
 vFyvgFZ3X3W8X3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Xiaojuan,

can you modify the tile like "Load FDT table into dram memory space"
rather than "change base addr to 2MiB" ?

regards
bibo,mao

在 2022/10/21 11:54, Xiaojuan Yang 写道:
> Change FDT base addr to 2 MiB in lowmem region. Since lowmem
> region starts from 0, FDT base address is located at 2 MiB to
> avoid NULL pointer access.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>  hw/loongarch/virt.c         | 18 +++++++++++-------
>  include/hw/loongarch/virt.h |  3 ---
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 29df99727d..fe33e7e3e4 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -159,7 +159,6 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
>                                   1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
>                                   2, base_mmio, 2, size_mmio);
>      g_free(nodename);
> -    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
>  }
>  
>  static void fdt_add_irqchip_node(LoongArchMachineState *lams)
> @@ -689,6 +688,7 @@ static void loongarch_init(MachineState *machine)
>      MemoryRegion *address_space_mem = get_system_memory();
>      LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>      int i;
> +    hwaddr fdt_base;
>  
>      if (!cpu_model) {
>          cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
> @@ -793,12 +793,16 @@ static void loongarch_init(MachineState *machine)
>      lams->machine_done.notify = virt_machine_done;
>      qemu_add_machine_init_done_notifier(&lams->machine_done);
>      fdt_add_pcie_node(lams);
> -
> -    /* load fdt */
> -    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
> -    memory_region_init_rom(fdt_rom, NULL, "fdt", VIRT_FDT_SIZE, &error_fatal);
> -    memory_region_add_subregion(get_system_memory(), VIRT_FDT_BASE, fdt_rom);
> -    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, VIRT_FDT_BASE);
> +    /*
> +     * Since lowmem region starts from 0, FDT base address is located
> +     * at 2 MiB to avoid NULL pointer access.
> +     *
> +     * Put the FDT into the memory map as a ROM image: this will ensure
> +     * the FDT is copied again upon reset, even if addr points into RAM.
> +     */
> +    fdt_base = 2 * MiB;
> +    qemu_fdt_dumpdtb(machine->fdt, lams->fdt_size);
> +    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, fdt_base);
>  }
>  
>  bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 09f1c88ee5..45c383f5a7 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -28,9 +28,6 @@
>  #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
>  #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
>  
> -#define VIRT_FDT_BASE           0x1c400000
> -#define VIRT_FDT_SIZE           0x100000
> -
>  struct LoongArchMachineState {
>      /*< private >*/
>      MachineState parent_obj;


