Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1EB4DD300
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 03:19:56 +0100 (CET)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV2Dc-0006Ji-3K
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 22:19:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nV2BG-0004JI-BB; Thu, 17 Mar 2022 22:17:30 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nV2BD-0001Rw-7g; Thu, 17 Mar 2022 22:17:29 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KKSKW1KDJzfYxq;
 Fri, 18 Mar 2022 10:15:43 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 10:17:11 +0800
Subject: Re: [PATCH for-7.1] hw: Add compat machines for 7.1
To: Cornelia Huck <cohuck@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20220316145521.1224083-1-cohuck@redhat.com>
Message-ID: <f80f1b03-929b-669e-22ba-0754b257770f@huawei.com>
Date: Fri, 18 Mar 2022 10:17:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220316145521.1224083-1-cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>



On 2022/3/16 22:55, Cornelia Huck wrote:
> Add 7.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46a42502bc55..2e6b4aac8c75 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3017,10 +3017,17 @@ static void machvirt_machine_init(void)
>   }
>   type_init(machvirt_machine_init);
>   
> +static void virt_machine_7_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 1)
> +
>   static void virt_machine_7_0_options(MachineClass *mc)
>   {
> +    virt_machine_7_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>   }
> -DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
> +DEFINE_VIRT_MACHINE(7, 0)
>   
>   static void virt_machine_6_2_options(MachineClass *mc)
>   {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4d0..cb9c05a7ded7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-pci.h"
>   
> +GlobalProperty hw_compat_7_0[] = {};
> +const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
> +
>   GlobalProperty hw_compat_6_2[] = {};
>   const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
>   
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index fd55fc725caf..23bba9d82c12 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -95,6 +95,9 @@
>   #include "trace.h"
>   #include CONFIG_DEVICES
>   
> +GlobalProperty pc_compat_7_0[] = {};
> +const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
> +
>   GlobalProperty pc_compat_6_2[] = {
>       { "virtio-mem", "unplugged-inaccessible", "off" },
>   };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b72c03d0a626..4c185c72d014 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -415,7 +415,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>   }
>   
> -static void pc_i440fx_7_0_machine_options(MachineClass *m)
> +static void pc_i440fx_7_1_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_i440fx_machine_options(m);
> @@ -424,6 +424,18 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
> +                      pc_i440fx_7_1_machine_options);
> +
> +static void pc_i440fx_7_0_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_7_1_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> +    compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> +}
> +
>   DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
>                         pc_i440fx_7_0_machine_options);
>   
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 1780f79bc127..302288342a91 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
>       m->max_cpus = 288;
>   }
>   
> -static void pc_q35_7_0_machine_options(MachineClass *m)
> +static void pc_q35_7_1_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_q35_machine_options(m);
> @@ -368,6 +368,17 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
> +                   pc_q35_7_1_machine_options);
> +
> +static void pc_q35_7_0_machine_options(MachineClass *m)
> +{
> +    pc_q35_7_1_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> +    compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> +}
> +
>   DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
>                      pc_q35_7_0_machine_options);
>   
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index bbaf630bbf20..afa52d7e491e 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -316,10 +316,17 @@ type_init(virt_machine_register_types)
>       } \
>       type_init(machvirt_machine_##major##_##minor##_init);
>   
> +static void virt_machine_7_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(7, 1, true)
> +
>   static void virt_machine_7_0_options(MachineClass *mc)
>   {
> +    virt_machine_7_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>   }
> -DEFINE_VIRT_MACHINE(7, 0, true)
> +DEFINE_VIRT_MACHINE(7, 0, false)
>   
>   static void virt_machine_6_2_options(MachineClass *mc)
>   {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 953fc65fa863..3561882d6615 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4703,15 +4703,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>       }                                                                \
>       type_init(spapr_machine_register_##suffix)
>   
> +/*
> + * pseries-7.1
> + */
> +static void spapr_machine_7_1_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(7_1, "7.1", true);
> +
>   /*
>    * pseries-7.0
>    */
>   static void spapr_machine_7_0_class_options(MachineClass *mc)
>   {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_7_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>   }
>   
> -DEFINE_SPAPR_MACHINE(7_0, "7.0", true);
> +DEFINE_SPAPR_MACHINE(7_0, "7.0", false);
>   
>   /*
>    * pseries-6.2
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9bc..c3eab13c60e8 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_7_1_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_1_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_1, "7.1", true);
> +
>   static void ccw_machine_7_0_instance_options(MachineState *machine)
>   {
> +    ccw_machine_7_1_instance_options(machine);
>   }
>   
>   static void ccw_machine_7_0_class_options(MachineClass *mc)
>   {
> +    ccw_machine_7_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>   }
> -DEFINE_CCW_MACHINE(7_0, "7.0", true);
> +DEFINE_CCW_MACHINE(7_0, "7.0", false);
>   
>   static void ccw_machine_6_2_instance_options(MachineState *machine)
>   {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index c92ac8815c85..d64b5481e834 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -380,6 +380,9 @@ struct MachineState {
>       } \
>       type_init(machine_initfn##_register_types)
>   
> +extern GlobalProperty hw_compat_7_0[];
> +extern const size_t hw_compat_7_0_len;
> +
>   extern GlobalProperty hw_compat_6_2[];
>   extern const size_t hw_compat_6_2_len;
>   
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 1a27de9c8b35..637367dc5fae 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -202,6 +202,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>   /* sgx.c */
>   void pc_machine_init_sgx_epc(PCMachineState *pcms);
>   
> +extern GlobalProperty pc_compat_7_0[];
> +extern const size_t pc_compat_7_0_len;
> +
>   extern GlobalProperty pc_compat_6_2[];
>   extern const size_t pc_compat_6_2_len;
>   


