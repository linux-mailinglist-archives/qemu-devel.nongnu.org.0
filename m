Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A17612080
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 07:20:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooeEE-0007XY-W7; Sat, 29 Oct 2022 01:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ood8M-0003IW-P4
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 00:07:47 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oocqd-0002Ed-B3
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 23:49:29 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxGdjColxjCTgDAA--.10354S3;
 Sat, 29 Oct 2022 11:49:22 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxNlfBolxj+bcGAA--.4962S3; 
 Sat, 29 Oct 2022 11:49:22 +0800 (CST)
Subject: Re: [PATCH v2 2/3] hw/loongarch: Improve fdt for LoongArch virt
 machine
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, philmd@linaro.org
References: <20221028014007.2718352-1-yangxiaojuan@loongson.cn>
 <20221028014007.2718352-3-yangxiaojuan@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <32f2069b-5574-cc9a-3cae-0cd0413c8926@loongson.cn>
Date: Sat, 29 Oct 2022 11:49:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221028014007.2718352-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxNlfBolxj+bcGAA--.4962S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGry5Jr1kuF1UJr13ur47twb_yoW5CFyxpF
 Z8CFn5WFWxXF17WrWSva45Zr1fJrs7GF12qr4fWrW8CFyDWw1DXr40k39xtFy8Xws5JF1Y
 vFs5Kr97K3WkKrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7MmhUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 39
X-Spam_score: 3.9
X-Spam_bar: +++
X-Spam_report: (3.9 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


ÔÚ 2022/10/28 ÉÏÎç9:40, Xiaojuan Yang Ð´µÀ:
> Add new items into LoongArch FDT, including rtc and uart info.
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/virt.c        | 31 +++++++++++++++++++++++++++++++
>   include/hw/pci-host/ls7a.h |  1 +
>   2 files changed, 32 insertions(+)
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index fe33e7e3e4..eed9d591e7 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -42,6 +42,35 @@
>   #include "hw/display/ramfb.h"
>   #include "hw/mem/pc-dimm.h"
>   
> +static void fdt_add_rtc_node(LoongArchMachineState *lams)
> +{
> +    char *nodename;
> +    hwaddr base = VIRT_RTC_REG_BASE;
> +    hwaddr size = VIRT_RTC_LEN;
> +    MachineState *ms = MACHINE(lams);
> +
> +    nodename = g_strdup_printf("/rtc@%" PRIx64, base);
> +    qemu_fdt_add_subnode(ms->fdt, nodename);
> +    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "loongson,ls7a-rtc");
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 0x0, base, size);
> +    g_free(nodename);
> +}
> +
> +static void fdt_add_uart_node(LoongArchMachineState *lams)
> +{
> +    char *nodename;
> +    hwaddr base = VIRT_UART_BASE;
> +    hwaddr size = VIRT_UART_SIZE;
> +    MachineState *ms = MACHINE(lams);
> +
> +    nodename = g_strdup_printf("/serial@%" PRIx64, base);
> +    qemu_fdt_add_subnode(ms->fdt, nodename);
> +    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "ns16550a");
> +    qemu_fdt_setprop_cells(ms->fdt, nodename, "reg", 0x0, base, 0x0, size);
> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "clock-frequency", 100000000);
> +    g_free(nodename);
> +}
> +
>   static void create_fdt(LoongArchMachineState *lams)
>   {
>       MachineState *ms = MACHINE(lams);
> @@ -422,6 +451,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
>                      qdev_get_gpio_in(pch_pic,
>                                       VIRT_UART_IRQ - PCH_PIC_IRQ_OFFSET),
>                      115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    fdt_add_uart_node(lams);
>   
>       /* Network init */
>       for (i = 0; i < nb_nics; i++) {
> @@ -442,6 +472,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
>       sysbus_create_simple("ls7a_rtc", VIRT_RTC_REG_BASE,
>                            qdev_get_gpio_in(pch_pic,
>                            VIRT_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
> +    fdt_add_rtc_node(lams);
>   
>       pm_mem = g_new(MemoryRegion, 1);
>       memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> index 9bd875ca8b..df7fa55a30 100644
> --- a/include/hw/pci-host/ls7a.h
> +++ b/include/hw/pci-host/ls7a.h
> @@ -37,6 +37,7 @@
>   #define VIRT_PCI_IRQS            48
>   #define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
>   #define VIRT_UART_BASE           0x1fe001e0
> +#define VIRT_UART_SIZE           0X100
>   #define VIRT_RTC_IRQ             (PCH_PIC_IRQ_OFFSET + 3)
>   #define VIRT_MISC_REG_BASE       (VIRT_PCH_REG_BASE + 0x00080000)
>   #define VIRT_RTC_REG_BASE        (VIRT_MISC_REG_BASE + 0x00050100)


