Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB364D7C9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 09:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5jdy-000841-PQ; Thu, 15 Dec 2022 03:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1p5jds-00083c-If
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 03:31:00 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1p5jdk-0006bM-Lc
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 03:30:57 -0500
Received: from loongson.cn (unknown [10.20.42.62])
 by gateway (Coremail) with SMTP id _____8Axaeoy25pjhMYFAA--.9867S3;
 Thu, 15 Dec 2022 16:30:42 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxQuUx25pjSEQAAA--.1902S3; 
 Thu, 15 Dec 2022 16:30:41 +0800 (CST)
Subject: Re: [PATCH v1 1/2] hw/intc/loongarch_pch_msi: add irq number property
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221215065011.2133471-1-zhaotianrui@loongson.cn>
 <20221215065011.2133471-2-zhaotianrui@loongson.cn>
 <7d5663c2-4925-2e36-a842-ff39f2755db7@linaro.org>
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <dd9c6d92-2264-b879-a946-428a52273c76@loongson.cn>
Date: Thu, 15 Dec 2022 16:30:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <7d5663c2-4925-2e36-a842-ff39f2755db7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxQuUx25pjSEQAAA--.1902S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZr48XF15Cr1kGF47tFykuFg_yoWrtF47pF
 ZxuFW5tF48X3yUuan29w17ur98JF4xKFyIvF43Kry7Cr4DAr9YqF18GrW7WFWUC3ykCw4q
 v3y8Ga9rua1DCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
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



在 2022年12月15日 15:40, Philippe Mathieu-Daudé 写道:
> On 15/12/22 07:50, Tianrui Zhao wrote:
>> This patch adds irq number property for loongarch msi interrupt
>> controller, and remove hard coding irq number macro.
>>
>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   hw/intc/loongarch_pch_msi.c         | 22 +++++++++++++++++++---
>>   hw/loongarch/virt.c                 | 11 +++++++----
>>   include/hw/intc/loongarch_pch_msi.h |  3 ++-
>>   include/hw/pci-host/ls7a.h          |  1 -
>>   4 files changed, 28 insertions(+), 9 deletions(-)
>
>
>> @@ -49,6 +49,22 @@ static void pch_msi_irq_handler(void *opaque, int 
>> irq, int level)
>>       qemu_set_irq(s->pch_msi_irq[irq], level);
>>   }
>>   +static void loongarch_pch_msi_realize(DeviceState *dev, Error **errp)
>> +{
>> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(dev);
>> +
>> +    assert(s->irq_num > 0);
>
>        if (!s->irq_num || s->irq_num  > PCH_MSI_IRQ_NUM) {
>            error_setg(errp, "Invalid 'msi_irq_num'");
>            return;
>        }
>
>> +    s->pch_msi_irq = g_malloc(sizeof(qemu_irq) * s->irq_num);
>
>        s->pch_msi_irq = g_new(qemu_irq, s->irq_num);
>
>> +    if (!s->pch_msi_irq) {
>> +        error_report("loongarch_pch_msi: fail to alloc memory");
>> +        exit(1);
>> +    }
>> +
>> +    qdev_init_gpio_out(dev, s->pch_msi_irq, s->irq_num);
>> +    qdev_init_gpio_in(dev, pch_msi_irq_handler, s->irq_num);
>> +}
>
> Missing g_free(s->pch_msi_irq) in loongarch_pch_msi_unrealize().
>
>>   static void loongarch_pch_msi_init(Object *obj)
>>   {
>>       LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(obj);
>> @@ -59,12 +75,11 @@ static void loongarch_pch_msi_init(Object *obj)
>>       sysbus_init_mmio(sbd, &s->msi_mmio);
>>       msi_nonbroken = true;
>>   -    qdev_init_gpio_out(DEVICE(obj), s->pch_msi_irq, PCH_MSI_IRQ_NUM);
>> -    qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, 
>> PCH_MSI_IRQ_NUM);
>>   }
>>     static Property loongarch_msi_properties[] = {
>>       DEFINE_PROP_UINT32("msi_irq_base", LoongArchPCHMSI, irq_base, 0),
>> +    DEFINE_PROP_UINT32("msi_irq_num",  LoongArchPCHMSI, irq_num, 0),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   @@ -72,6 +87,7 @@ static void 
>> loongarch_pch_msi_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>>   +    dc->realize = loongarch_pch_msi_realize;
>
>        dc->unrealize = loongarch_pch_msi_unrealize;
>
>>       device_class_set_props(dc, loongarch_msi_properties);
>>   }
>>   diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
>> index 958be74fa1..3547d5f711 100644
>> --- a/hw/loongarch/virt.c
>> +++ b/hw/loongarch/virt.c
>> @@ -496,7 +496,7 @@ static void 
>> loongarch_irq_init(LoongArchMachineState *lams)
>>       LoongArchCPU *lacpu;
>>       CPULoongArchState *env;
>>       CPUState *cpu_state;
>> -    int cpu, pin, i;
>> +    int cpu, pin, i, start, num;
>>         ipi = qdev_new(TYPE_LOONGARCH_IPI);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
>> @@ -576,14 +576,17 @@ static void 
>> loongarch_irq_init(LoongArchMachineState *lams)
>>       }
>>         pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
>> -    qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
>> +    start   =  PCH_PIC_IRQ_NUM;
>> +    num = 256 - start;
>
> This part is confuse. So you don't need PCH_MSI_IRQ_START anymore?
> What is this magic '256' value?
On loongarch platform, both PCH_pic and PCH_MSI intc are connected to upper
extioi controller, PCH_pic is triggered by irq line and PCH_MSI is 
trigger by message method.

No, PCH_MSI_IRQ_START is not necessary any more. 256 is total supported 
irq number with extioi controller,
we will replace it with macro EXTIOI_IRQS. We can adjust irq number 
between PCH_pic and PCH_MSI, only if
the total number is no larger than EXTIOI_IRQS. In general there are 
lots of msi vectors requirements
since there may be many virtio devices; there is no much requirements 
for PCH_pic intc, since gpex pcie
irq number is 4 and there is fewer legacy non-pci devices(such as 
rtc/uart/acpi ged).

I want to adjust number PCH_pic intc with smaller value, and increase 
irq number of PCH_MSI intc in future.
>
>
>> +    qdev_prop_set_uint32(pch_msi, "msi_irq_base", start);
>> +    qdev_prop_set_uint32(pch_msi, "msi_irq_num", num);
>>       d = SYS_BUS_DEVICE(pch_msi);
>>       sysbus_realize_and_unref(d, &error_fatal);
>>       sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
>> -    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
>> +    for (i = 0; i < num; i++) {
>>           /* Connect 192 pch_msi irqs to extioi */
>>           qdev_connect_gpio_out(DEVICE(d), i,
>> -                              qdev_get_gpio_in(extioi, i + 
>> PCH_MSI_IRQ_START));
>> +                              qdev_get_gpio_in(extioi, i + start));
>>       }
>


