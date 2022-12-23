Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918F654E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 10:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8e9O-0007x6-HL; Fri, 23 Dec 2022 04:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1p8e9J-0007we-Ua
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 04:15:29 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1p8e9H-00076Q-6R
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 04:15:29 -0500
Received: from loongson.cn (unknown [10.20.42.170])
 by gateway (Coremail) with SMTP id _____8CxI_CmcaVjXA4IAA--.18505S3;
 Fri, 23 Dec 2022 17:15:18 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxHuSkcaVj2kQJAA--.32621S3; 
 Fri, 23 Dec 2022 17:15:17 +0800 (CST)
Message-ID: <2da5501d-3c2d-e189-f26d-339c83ba0c1e@loongson.cn>
Date: Fri, 23 Dec 2022 17:15:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] hw/intc/loongarch_pch_msi: add irq number property
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, philmd@linaro.org
References: <20221223080835.4067281-1-zhaotianrui@loongson.cn>
 <20221223080835.4067281-2-zhaotianrui@loongson.cn>
Content-Language: en-US
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <20221223080835.4067281-2-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxHuSkcaVj2kQJAA--.32621S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JF17Jr4DWrW5Xr1xZr1rtFb_yoW7AF1DpF
 WDuFW5tr48Gw4UWFsagw17ur98JF1xGFyIvF13KryxCr4UAr90g3W8J39rWFWUK3y8Cr1q
 v34kCanrW3WUCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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


Tianrui,

  We should solve all the issues in the previous mailing list,
and send the next version. 
  https://patchwork.kernel.org/project/qemu-devel/patch/20221215065011.2133471-2-zhaotianrui@loongson.cn/

  We should not be in such hurry:)

regards
bibo,mao

在 2022/12/23 16:08, Tianrui Zhao 写道:
> This patch adds irq number property for loongarch msi interrupt
> controller, and remove hard coding irq number macro.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>  hw/intc/loongarch_pch_msi.c         | 30 ++++++++++++++++++++++++++---
>  hw/loongarch/virt.c                 | 11 +++++++----
>  include/hw/intc/loongarch_pch_msi.h |  3 ++-
>  include/hw/pci-host/ls7a.h          |  1 -
>  4 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
> index b36d6d76e4..5b8de43d42 100644
> --- a/hw/intc/loongarch_pch_msi.c
> +++ b/hw/intc/loongarch_pch_msi.c
> @@ -32,7 +32,7 @@ static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
>       */
>      irq_num = (val & 0xff) - s->irq_base;
>      trace_loongarch_msi_set_irq(irq_num);
> -    assert(irq_num < PCH_MSI_IRQ_NUM);
> +    assert(irq_num < s->irq_num);
>      qemu_set_irq(s->pch_msi_irq[irq_num], 1);
>  }
>  
> @@ -49,6 +49,29 @@ static void pch_msi_irq_handler(void *opaque, int irq, int level)
>      qemu_set_irq(s->pch_msi_irq[irq], level);
>  }
>  
> +static void loongarch_pch_msi_realize(DeviceState *dev, Error **errp)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(dev);
> +
> +    assert(s->irq_num > 0);
> +
> +    s->pch_msi_irq = g_malloc(sizeof(qemu_irq) * s->irq_num);
> +    if (!s->pch_msi_irq) {
> +        error_report("loongarch_pch_msi: fail to alloc memory");
> +        exit(1);
> +    }
> +
> +    qdev_init_gpio_out(dev, s->pch_msi_irq, s->irq_num);
> +    qdev_init_gpio_in(dev, pch_msi_irq_handler, s->irq_num);
> +}
> +
> +static void loongarch_pch_msi_unrealize(DeviceState *dev)
> +{
> +    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(dev);
> +
> +    g_free(s->pch_msi_irq);
> +}
> +
>  static void loongarch_pch_msi_init(Object *obj)
>  {
>      LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(obj);
> @@ -59,12 +82,11 @@ static void loongarch_pch_msi_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->msi_mmio);
>      msi_nonbroken = true;
>  
> -    qdev_init_gpio_out(DEVICE(obj), s->pch_msi_irq, PCH_MSI_IRQ_NUM);
> -    qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
>  }
>  
>  static Property loongarch_msi_properties[] = {
>      DEFINE_PROP_UINT32("msi_irq_base", LoongArchPCHMSI, irq_base, 0),
> +    DEFINE_PROP_UINT32("msi_irq_num",  LoongArchPCHMSI, irq_num, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -72,6 +94,8 @@ static void loongarch_pch_msi_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> +    dc->realize = loongarch_pch_msi_realize;
> +    dc->unrealize = loongarch_pch_msi_unrealize;
>      device_class_set_props(dc, loongarch_msi_properties);
>  }
>  
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 958be74fa1..3547d5f711 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -496,7 +496,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>      LoongArchCPU *lacpu;
>      CPULoongArchState *env;
>      CPUState *cpu_state;
> -    int cpu, pin, i;
> +    int cpu, pin, i, start, num;
>  
>      ipi = qdev_new(TYPE_LOONGARCH_IPI);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
> @@ -576,14 +576,17 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>      }
>  
>      pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
> -    qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
> +    start   =  PCH_PIC_IRQ_NUM;
> +    num = 256 - start;
> +    qdev_prop_set_uint32(pch_msi, "msi_irq_base", start);
> +    qdev_prop_set_uint32(pch_msi, "msi_irq_num", num);
>      d = SYS_BUS_DEVICE(pch_msi);
>      sysbus_realize_and_unref(d, &error_fatal);
>      sysbus_mmio_map(d, 0, VIRT_PCH_MSI_ADDR_LOW);
> -    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
> +    for (i = 0; i < num; i++) {
>          /* Connect 192 pch_msi irqs to extioi */
>          qdev_connect_gpio_out(DEVICE(d), i,
> -                              qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
> +                              qdev_get_gpio_in(extioi, i + start));
>      }
>  
>      loongarch_devices_init(pch_pic, lams);
> diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
> index 6d67560dea..c5a52bc327 100644
> --- a/include/hw/intc/loongarch_pch_msi.h
> +++ b/include/hw/intc/loongarch_pch_msi.h
> @@ -15,8 +15,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
>  
>  struct LoongArchPCHMSI {
>      SysBusDevice parent_obj;
> -    qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
> +    qemu_irq *pch_msi_irq;
>      MemoryRegion msi_mmio;
>      /* irq base passed to upper extioi intc */
>      unsigned int irq_base;
> +    unsigned int irq_num;
>  };
> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> index df7fa55a30..6443327bd7 100644
> --- a/include/hw/pci-host/ls7a.h
> +++ b/include/hw/pci-host/ls7a.h
> @@ -34,7 +34,6 @@
>   */
>  #define PCH_PIC_IRQ_OFFSET       64
>  #define VIRT_DEVICE_IRQS         16
> -#define VIRT_PCI_IRQS            48
>  #define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
>  #define VIRT_UART_BASE           0x1fe001e0
>  #define VIRT_UART_SIZE           0X100


