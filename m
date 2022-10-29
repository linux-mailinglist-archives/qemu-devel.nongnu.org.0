Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD62761207E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 07:20:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooeEJ-0007d0-87; Sat, 29 Oct 2022 01:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ood8N-0003IW-GJ
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 00:07:47 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oocqd-0002Ef-3L
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 23:49:29 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8AxDdm+olxjCDgDAA--.12100S3;
 Sat, 29 Oct 2022 11:49:18 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXuC9olxj97cGAA--.22927S3; 
 Sat, 29 Oct 2022 11:49:17 +0800 (CST)
Subject: Re: [PATCH v2 3/3] hw/loongarch: Add TPM device for LoongArch virt
 machine
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, philmd@linaro.org
References: <20221028014007.2718352-1-yangxiaojuan@loongson.cn>
 <20221028014007.2718352-4-yangxiaojuan@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <68ac861b-595f-e5bd-2e76-ffb8dc585623@loongson.cn>
Date: Sat, 29 Oct 2022 11:49:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221028014007.2718352-4-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxXuC9olxj97cGAA--.22927S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWFWDKw4DKw4UJr4xCw1xXwb_yoWrWw15pa
 y7ZFZayrWfWr17W3sxJwn0gFn8Jr1kC342vF1I9rn2kF9Fgr1kXr18K39FyFy7AayktF4U
 uryqg3yxuF48JrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU
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
> Add TPM device for LoongArch virt machine, including
> establish TPM acpi info and add TYPE_TPM_TIS_SYSBUS
> to dynamic_sysbus_devices list.
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/acpi-build.c | 50 +++++++++++++++++++++++++++++++++++++--
>   hw/loongarch/virt.c       |  4 ++++
>   2 files changed, 52 insertions(+), 2 deletions(-)
>
> diff --git a/hw/loongarch/acpi-build.c b/hw/loonga
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> rch/acpi-build.c
> index 378a6d9d38..1d0e562435 100644
> --- a/hw/loongarch/acpi-build.c
> +++ b/hw/loongarch/acpi-build.c
> @@ -31,6 +31,9 @@
>   
>   #include "hw/acpi/generic_event_device.h"
>   #include "hw/pci-host/gpex.h"
> +#include "sysemu/tpm.h"
> +#include "hw/platform-bus.h"
> +#include "hw/acpi/aml-build.h"
>   
>   #define ACPI_BUILD_ALIGN_SIZE             0x1000
>   #define ACPI_BUILD_TABLE_SIZE             0x20000
> @@ -275,6 +278,41 @@ static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
>       acpi_dsdt_add_gpex(scope, &cfg);
>   }
>   
> +#ifdef CONFIG_TPM
> +static void acpi_dsdt_add_tpm(Aml *scope, LoongArchMachineState *vms)
> +{
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    hwaddr pbus_base = VIRT_PLATFORM_BUS_BASEADDRESS;
> +    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpm_find());
> +    MemoryRegion *sbdev_mr;
> +    hwaddr tpm_base;
> +
> +    if (!sbdev) {
> +        return;
> +    }
> +
> +    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    assert(tpm_base != -1);
> +
> +    tpm_base += pbus_base;
> +
> +    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
> +
> +    Aml *dev = aml_device("TPM0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs,
> +               aml_memory32_fixed(tpm_base,
> +                                  (uint32_t)memory_region_size(sbdev_mr),
> +                                  AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +#endif
> +
>   /* build DSDT */
>   static void
>   build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
> @@ -289,7 +327,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       build_uart_device_aml(dsdt);
>       build_pci_device_aml(dsdt, lams);
>       build_la_ged_aml(dsdt, machine);
> -
> +#ifdef CONFIG_TPM
> +    acpi_dsdt_add_tpm(dsdt, lams);
> +#endif
>       /* System State Package */
>       scope = aml_scope("\\");
>       pkg = aml_package(4);
> @@ -358,7 +398,13 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>           build_mcfg(tables_blob, tables->linker, &mcfg, lams->oem_id,
>                      lams->oem_table_id);
>       }
> -
> +    /* TPM info */
> +    if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_tpm2(tables_blob, tables->linker,
> +                   tables->tcpalog, lams->oem_id,
> +                   lams->oem_table_id);
> +    }
>       /* Add tables supplied by user (if any) */
>       for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
>           unsigned len = acpi_table_len(u);
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index eed9d591e7..c1612d5e05 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -41,6 +41,7 @@
>   #include "hw/platform-bus.h"
>   #include "hw/display/ramfb.h"
>   #include "hw/mem/pc-dimm.h"
> +#include "sysemu/tpm.h"
>   
>   static void fdt_add_rtc_node(LoongArchMachineState *lams)
>   {
> @@ -993,6 +994,9 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
>       object_class_property_set_description(oc, "acpi",
>           "Enable ACPI");
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +#ifdef CONFIG_TPM
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +#endif
>   }
>   
>   static const TypeInfo loongarch_machine_types[] = {


