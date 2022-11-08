Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F16211E8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOFa-0001qL-Ae; Tue, 08 Nov 2022 08:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1osOFN-0001id-R1
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:02:33 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1osOFH-0002xC-Li
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:02:32 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8DxTLZeU2pjZlEFAA--.5493S3;
 Tue, 08 Nov 2022 21:02:22 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxmFddU2pjqvkOAA--.23482S3; 
 Tue, 08 Nov 2022 21:02:22 +0800 (CST)
Subject: Re: [PULL v3 3/7] hw/loongarch: Load FDT table into dram memory space
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: stefanha@gmail.com, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20221105032857.3789472-1-gaosong@loongson.cn>
 <20221105032857.3789472-4-gaosong@loongson.cn>
 <ab34973e-c045-7e5c-164a-9992ca078307@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <bd6cf6c0-abc4-fa29-f78c-581368a33249@loongson.cn>
Date: Tue, 8 Nov 2022 21:02:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ab34973e-c045-7e5c-164a-9992ca078307@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxmFddU2pjqvkOAA--.23482S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGryUWrWxtw43Kr4UCw17Wrg_yoWruF15pF
 93AFy5WrW8tr1kGr1xXryUXFyUArn2ka47Xr42vF40kF4DWr1jqrWUXw1q9FyUA3y8Jr10
 qFykXr9Fv3W5Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/11/8 下午6:41, Richard Henderson 写道:
> On 11/5/22 14:28, Song Gao wrote:
>> From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>
>> Load FDT table into dram memory space, and the addr is 2 MiB.
>> Since lowmem region starts from 0, FDT base address is located
>> at 2 MiB to avoid NULL pointer access.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Acked-by: Song Gao <gaosong@loongson.cn>
>> Message-Id: <20221028014007.2718352-2-yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/loongarch/virt.c         | 18 +++++++++++-------
>>   include/hw/loongarch/virt.h |  3 ---
>>   2 files changed, 11 insertions(+), 10 deletions(-)
>
> This breaks make check-tcg:
>
>   TEST    hello on loongarch64
> qemu-system-loongarch64: Some ROM regions are overlapping
> These ROM regions might have been loaded by direct user request or by 
> default.
> They could be BIOS/firmware images, a guest kernel, initrd or some 
> other file loaded into guest memory.
> Check whether you intended to load all this guest code, and whether it 
> has been built to load to the correct addresses.
>
> The following two regions overlap (in the memory address space):
>   hello ELF program header segment 0 (addresses 0x0000000000200000 - 
> 0x0000000000242000)
>   fdt (addresses 0x0000000000200000 - 0x0000000000300000)
> make[1]: *** [Makefile:177: run-hello] Error 1
>
>
Thank you,  I had send a patch to fix this.

Thanks.
Song Gao
>
>>
>> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
>> index 4b595a9ea4..50e9829a94 100644
>> --- a/hw/loongarch/virt.c
>> +++ b/hw/loongarch/virt.c
>> @@ -159,7 +159,6 @@ static void fdt_add_pcie_node(const 
>> LoongArchMachineState *lams)
>>                                    1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
>>                                    2, base_mmio, 2, size_mmio);
>>       g_free(nodename);
>> -    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
>>   }
>>     static void fdt_add_irqchip_node(LoongArchMachineState *lams)
>> @@ -656,6 +655,7 @@ static void loongarch_init(MachineState *machine)
>>       MemoryRegion *address_space_mem = get_system_memory();
>>       LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>>       int i;
>> +    hwaddr fdt_base;
>>         if (!cpu_model) {
>>           cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
>> @@ -760,12 +760,16 @@ static void loongarch_init(MachineState *machine)
>>       lams->machine_done.notify = virt_machine_done;
>> qemu_add_machine_init_done_notifier(&lams->machine_done);
>>       fdt_add_pcie_node(lams);
>> -
>> -    /* load fdt */
>> -    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
>> -    memory_region_init_rom(fdt_rom, NULL, "fdt", VIRT_FDT_SIZE, 
>> &error_fatal);
>> -    memory_region_add_subregion(get_system_memory(), VIRT_FDT_BASE, 
>> fdt_rom);
>> -    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, 
>> VIRT_FDT_BASE);
>> +    /*
>> +     * Since lowmem region starts from 0, FDT base address is located
>> +     * at 2 MiB to avoid NULL pointer access.
>> +     *
>> +     * Put the FDT into the memory map as a ROM image: this will ensure
>> +     * the FDT is copied again upon reset, even if addr points into 
>> RAM.
>> +     */
>> +    fdt_base = 2 * MiB;
>> +    qemu_fdt_dumpdtb(machine->fdt, lams->fdt_size);
>> +    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, fdt_base);
>>   }
>>     bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
>> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
>> index 09f1c88ee5..45c383f5a7 100644
>> --- a/include/hw/loongarch/virt.h
>> +++ b/include/hw/loongarch/virt.h
>> @@ -28,9 +28,6 @@
>>   #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + 
>> ACPI_GED_EVT_SEL_LEN)
>>   #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + 
>> MEMORY_HOTPLUG_IO_LEN)
>>   -#define VIRT_FDT_BASE           0x1c400000
>> -#define VIRT_FDT_SIZE           0x100000
>> -
>>   struct LoongArchMachineState {
>>       /*< private >*/
>>       MachineState parent_obj;
>


