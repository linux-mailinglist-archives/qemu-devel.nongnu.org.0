Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471906FF176
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:23:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5K5-0000oZ-Eq; Thu, 11 May 2023 08:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1px5K3-0000oN-On
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:23:03 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1px5Jz-0005qY-MC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:23:03 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8BxRPAh3lxkA78HAA--.13132S3;
 Thu, 11 May 2023 20:22:57 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxGLYd3lxkFMtVAA--.21588S3; 
 Thu, 11 May 2023 20:22:54 +0800 (CST)
Subject: Re: [PATCH 3/3] hw/loongarch/virt: Set max 256 cpus support on
 loongarch virt machine
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
 <20230406100052.3355632-3-gaosong@loongson.cn>
 <0d391c88-6749-b1c3-466b-e90d91ada360@loongson.cn>
 <b9152ff5-b17f-11b0-6aa0-e7a002885ccf@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <26c14c7d-5ce0-5f6e-cc8a-5ad06afdafb2@loongson.cn>
Date: Thu, 11 May 2023 20:22:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b9152ff5-b17f-11b0-6aa0-e7a002885ccf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxGLYd3lxkFMtVAA--.21588S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtF1rKFykXryxGrW7GF13CFg_yoW3Cw1kpr
 1kAFy5GrWUJrn7Jr1UW34UXryUJr1xWw1UWr12qFy8Jr47Ar1jgr4UXr1qgr1UCw4kJr1j
 qr1rJw17ZFn8Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UWHqcUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.124,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,  Richard

在 2023/5/10 下午6:12, Richard Henderson 写道:
> On 4/26/23 02:37, Song Gao wrote:
>> ping~
>>
>> 在 2023/4/6 下午6:00, Song Gao 写道:
>>> Add separate macro EXTIOI_CPUS for extioi interrupt controller, extioi
>>> only supports 4 cpu. And set macro LOONGARCH_MAX_CPUS as 256 so that
>>> loongarch virt machine supports more cpus.
>>>
>>> Interrupts from external devices can only be routed cpu 0-3 because
>>> of extioi limits, cpu internal interrupt such as timer/ipi can be
>>> triggered on all cpus.
>>>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>   hw/intc/loongarch_extioi.c         |  4 ++--
>>>   hw/loongarch/virt.c                | 21 ++++++++++++++-------
>>>   include/hw/intc/loongarch_extioi.h | 10 ++++++----
>>>   include/hw/loongarch/virt.h        |  2 +-
>>>   4 files changed, 23 insertions(+), 14 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
Thanks for you review.

Could you also review the other 2 patches?

Thanks.
Song Gao

> r~
>
>>>
>>> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
>>> index 4b8ec3f28a..0e7a3e32f3 100644
>>> --- a/hw/intc/loongarch_extioi.c
>>> +++ b/hw/intc/loongarch_extioi.c
>>> @@ -254,7 +254,7 @@ static const VMStateDescription 
>>> vmstate_loongarch_extioi = {
>>>       .minimum_version_id = 1,
>>>       .fields = (VMStateField[]) {
>>>           VMSTATE_UINT32_ARRAY(bounce, LoongArchExtIOI, 
>>> EXTIOI_IRQS_GROUP_COUNT),
>>> -        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, 
>>> LOONGARCH_MAX_VCPUS,
>>> +        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, EXTIOI_CPUS,
>>>                                  EXTIOI_IRQS_GROUP_COUNT),
>>>           VMSTATE_UINT32_ARRAY(nodetype, LoongArchExtIOI,
>>>                                EXTIOI_IRQS_NODETYPE_COUNT / 2),
>>> @@ -281,7 +281,7 @@ static void 
>>> loongarch_extioi_instance_init(Object *obj)
>>>       qdev_init_gpio_in(DEVICE(obj), extioi_setirq, EXTIOI_IRQS);
>>> -    for (cpu = 0; cpu < LOONGARCH_MAX_VCPUS; cpu++) {
>>> +    for (cpu = 0; cpu < EXTIOI_CPUS; cpu++) {
>>> memory_region_init_io(&s->extioi_iocsr_mem[cpu], OBJECT(s), 
>>> &extioi_ops,
>>>                                 s, "extioi_iocsr", 0x900);
>>>           sysbus_init_mmio(SYS_BUS_DEVICE(dev), 
>>> &s->extioi_iocsr_mem[cpu]);
>>> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
>>> index c8a01b1fb6..28bb35d614 100644
>>> --- a/hw/loongarch/virt.c
>>> +++ b/hw/loongarch/virt.c
>>> @@ -607,8 +607,13 @@ static void 
>>> loongarch_irq_init(LoongArchMachineState *lams)
>>> memory_region_add_subregion(&env->system_iocsr, MAIL_SEND_ADDR,
>>> sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
>>>                                       1));
>>> -        /* extioi iocsr memory region */
>>> - memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
>>> +        /*
>>> +     * extioi iocsr memory region
>>> +     * only one extioi is added on loongarch virt machine
>>> +     * external device interrupt can only be routed to cpu 0-3
>>> +     */
>>> +    if (cpu < EXTIOI_CPUS)
>>> + memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
>>> sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
>>>                                   cpu));
>>>       }
>>> @@ -618,10 +623,12 @@ static void 
>>> loongarch_irq_init(LoongArchMachineState *lams)
>>>        * cpu_pin[9:2] <= intc_pin[7:0]
>>>        */
>>>       for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>>> -        cpudev = DEVICE(qemu_get_cpu(cpu));
>>> -        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
>>> -            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
>>> -                                  qdev_get_gpio_in(cpudev, pin + 2));
>>> +        if (cpu < EXTIOI_CPUS) {
>>> +            cpudev = DEVICE(qemu_get_cpu(cpu));
>>> +            for (pin = 0; pin < LS3A_INTC_IP; pin++) {
>>> +                qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
>>> + qdev_get_gpio_in(cpudev, pin + 2));
>>> +        }
>>>           }
>>>       }
>>> @@ -1026,7 +1033,7 @@ static void loongarch_class_init(ObjectClass 
>>> *oc, void *data)
>>>       mc->default_ram_size = 1 * GiB;
>>>       mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("la464");
>>>       mc->default_ram_id = "loongarch.ram";
>>> -    mc->max_cpus = LOONGARCH_MAX_VCPUS;
>>> +    mc->max_cpus = LOONGARCH_MAX_CPUS;
>>>       mc->is_default = 1;
>>>       mc->default_kernel_irqchip_split = false;
>>>       mc->block_default_type = IF_VIRTIO;
>>> diff --git a/include/hw/intc/loongarch_extioi.h 
>>> b/include/hw/intc/loongarch_extioi.h
>>> index 15b8c999f6..fbdef9a7b3 100644
>>> --- a/include/hw/intc/loongarch_extioi.h
>>> +++ b/include/hw/intc/loongarch_extioi.h
>>> @@ -14,6 +14,8 @@
>>>   #define LS3A_INTC_IP               8
>>>   #define EXTIOI_IRQS                (256)
>>>   #define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
>>> +/* irq from EXTIOI is routed to no more than 4 cpus */
>>> +#define EXTIOI_CPUS                (4)
>>>   /* map to ipnum per 32 irqs */
>>>   #define EXTIOI_IRQS_IPMAP_SIZE     (256 / 32)
>>>   #define EXTIOI_IRQS_COREMAP_SIZE   256
>>> @@ -46,17 +48,17 @@ struct LoongArchExtIOI {
>>>       uint32_t nodetype[EXTIOI_IRQS_NODETYPE_COUNT / 2];
>>>       uint32_t bounce[EXTIOI_IRQS_GROUP_COUNT];
>>>       uint32_t isr[EXTIOI_IRQS / 32];
>>> -    uint32_t coreisr[LOONGARCH_MAX_VCPUS][EXTIOI_IRQS_GROUP_COUNT];
>>> +    uint32_t coreisr[EXTIOI_CPUS][EXTIOI_IRQS_GROUP_COUNT];
>>>       uint32_t enable[EXTIOI_IRQS / 32];
>>>       uint32_t ipmap[EXTIOI_IRQS_IPMAP_SIZE / 4];
>>>       uint32_t coremap[EXTIOI_IRQS / 4];
>>>       uint32_t sw_pending[EXTIOI_IRQS / 32];
>>> -    DECLARE_BITMAP(sw_isr[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP], 
>>> EXTIOI_IRQS);
>>> +    DECLARE_BITMAP(sw_isr[EXTIOI_CPUS][LS3A_INTC_IP], EXTIOI_IRQS);
>>>       uint8_t  sw_ipmap[EXTIOI_IRQS_IPMAP_SIZE];
>>>       uint8_t  sw_coremap[EXTIOI_IRQS];
>>> -    qemu_irq parent_irq[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP];
>>> +    qemu_irq parent_irq[EXTIOI_CPUS][LS3A_INTC_IP];
>>>       qemu_irq irq[EXTIOI_IRQS];
>>> -    MemoryRegion extioi_iocsr_mem[LOONGARCH_MAX_VCPUS];
>>> +    MemoryRegion extioi_iocsr_mem[EXTIOI_CPUS];
>>>       MemoryRegion extioi_system_mem;
>>>   };
>>>   #endif /* LOONGARCH_EXTIOI_H */
>>> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
>>> index 54a9f595bb..f1659655c6 100644
>>> --- a/include/hw/loongarch/virt.h
>>> +++ b/include/hw/loongarch/virt.h
>>> @@ -14,7 +14,7 @@
>>>   #include "hw/intc/loongarch_ipi.h"
>>>   #include "hw/block/flash.h"
>>> -#define LOONGARCH_MAX_VCPUS     4
>>> +#define LOONGARCH_MAX_CPUS      256
>>>   #define VIRT_ISA_IO_BASE        0x18000000UL
>>>   #define VIRT_ISA_IO_SIZE        0x0004000
>>


