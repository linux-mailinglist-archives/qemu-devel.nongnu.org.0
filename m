Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61B6B9D2F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8Zd-00083d-1G; Tue, 14 Mar 2023 13:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pc8Zb-00081T-7C; Tue, 14 Mar 2023 13:36:31 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pc8ZZ-0002NY-5X; Tue, 14 Mar 2023 13:36:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 19C4B208C5;
 Tue, 14 Mar 2023 17:36:15 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 14 Mar
 2023 18:36:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0029051faf2-e37e-4819-9be6-aed727a0ff51,
 BE9B9C72B5668688B8F45BC97132BF8BBFD962E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <543cd299-5ebb-2db3-39d4-2af3c6dae4de@kaod.org>
Date: Tue, 14 Mar 2023 18:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1] hw: Add compat machines for 8.1
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>
References: <20230314173009.152667-1-cohuck@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230314173009.152667-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6f3afe29-4e33-4948-a6ca-19a877597b12
X-Ovh-Tracer-Id: 12722106000449375129
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddviedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghohhhutghksehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpihhiiheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhqvg
 hmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhlrghurhgvnhhtsehvihhvihgvrhdrvghupdhmshhtsehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdifrghnghihrghnrghnheehsehhuhgrfigvihdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/14/23 18:30, Cornelia Huck wrote:
> Add 8.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

For ppc,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 16 +++++++++++++---
>   hw/i386/pc_q35.c           | 14 ++++++++++++--
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ac626b3bef74..267fe56fae76 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3232,10 +3232,17 @@ static void machvirt_machine_init(void)
>   }
>   type_init(machvirt_machine_init);
>   
> +static void virt_machine_8_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(8, 1)
> +
>   static void virt_machine_8_0_options(MachineClass *mc)
>   {
> +    virt_machine_8_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
>   }
> -DEFINE_VIRT_MACHINE_AS_LATEST(8, 0)
> +DEFINE_VIRT_MACHINE(8, 0)
>   
>   static void virt_machine_7_2_options(MachineClass *mc)
>   {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 45e3d24fdc89..5bda87fc7d91 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,9 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-pci.h"
>   
> +GlobalProperty hw_compat_8_0[] = {};
> +const size_t hw_compat_8_0_len = G_N_ELEMENTS(hw_compat_8_0);
> +
>   GlobalProperty hw_compat_7_2[] = {
>       { "e1000e", "migrate-timadj", "off" },
>       { "virtio-mem", "x-early-migration", "false" },
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 1489abf010a6..615e1d3d06ad 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -116,6 +116,9 @@
>       { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
>       { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
>   
> +GlobalProperty pc_compat_8_0[] = {};
> +const size_t pc_compat_8_0_len = G_N_ELEMENTS(pc_compat_8_0);
> +
>   GlobalProperty pc_compat_7_2[] = {
>       { "ICH9-LPC", "noreboot", "true" },
>   };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 30eedd62a3a0..21591dad8d92 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -454,21 +454,31 @@ static void pc_i440fx_machine_options(MachineClass *m)
>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>   }
>   
> -static void pc_i440fx_8_0_machine_options(MachineClass *m)
> +static void pc_i440fx_8_1_machine_options(MachineClass *m)
>   {
>       pc_i440fx_machine_options(m);
>       m->alias = "pc";
>       m->is_default = true;
>   }
>   
> +DEFINE_I440FX_MACHINE(v8_1, "pc-i440fx-8.1", NULL,
> +                      pc_i440fx_8_1_machine_options);
> +
> +static void pc_i440fx_8_0_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_8_1_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
> +    compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
> +}
> +
>   DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
>                         pc_i440fx_8_0_machine_options);
>   
>   static void pc_i440fx_7_2_machine_options(MachineClass *m)
>   {
>       pc_i440fx_8_0_machine_options(m);
> -    m->alias = NULL;
> -    m->is_default = false;
>       compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>       compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
>   }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 797ba347fd05..f02919d92c46 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -373,19 +373,29 @@ static void pc_q35_machine_options(MachineClass *m)
>       m->max_cpus = 288;
>   }
>   
> -static void pc_q35_8_0_machine_options(MachineClass *m)
> +static void pc_q35_8_1_machine_options(MachineClass *m)
>   {
>       pc_q35_machine_options(m);
>       m->alias = "q35";
>   }
>   
> +DEFINE_Q35_MACHINE(v8_1, "pc-q35-8.1", NULL,
> +                   pc_q35_8_1_machine_options);
> +
> +static void pc_q35_8_0_machine_options(MachineClass *m)
> +{
> +    pc_q35_8_1_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_8_0, hw_compat_8_0_len);
> +    compat_props_add(m->compat_props, pc_compat_8_0, pc_compat_8_0_len);
> +}
> +
>   DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
>                      pc_q35_8_0_machine_options);
>   
>   static void pc_q35_7_2_machine_options(MachineClass *m)
>   {
>       pc_q35_8_0_machine_options(m);
> -    m->alias = NULL;
>       compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>       compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
>   }
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 4cb5beef1a0c..f5ca2ca9054c 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -346,10 +346,17 @@ type_init(virt_machine_register_types)
>       } \
>       type_init(machvirt_machine_##major##_##minor##_init);
>   
> +static void virt_machine_8_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(8, 1, true)
> +
>   static void virt_machine_8_0_options(MachineClass *mc)
>   {
> +    virt_machine_8_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
>   }
> -DEFINE_VIRT_MACHINE(8, 0, true)
> +DEFINE_VIRT_MACHINE(8, 0, false)
>   
>   static void virt_machine_7_2_options(MachineClass *mc)
>   {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4921198b9d6f..ddc9c7b1a1e2 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4734,15 +4734,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>       }                                                                \
>       type_init(spapr_machine_register_##suffix)
>   
> +/*
> + * pseries-8.1
> + */
> +static void spapr_machine_8_1_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(8_1, "8.1", true);
> +
>   /*
>    * pseries-8.0
>    */
>   static void spapr_machine_8_0_class_options(MachineClass *mc)
>   {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_8_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
>   }
>   
> -DEFINE_SPAPR_MACHINE(8_0, "8.0", true);
> +DEFINE_SPAPR_MACHINE(8_0, "8.0", false);
>   
>   /*
>    * pseries-7.2
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 503f212a3131..e6f2c626254c 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -826,14 +826,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_8_1_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_8_1_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(8_1, "8.1", true);
> +
>   static void ccw_machine_8_0_instance_options(MachineState *machine)
>   {
> +    ccw_machine_8_1_instance_options(machine);
>   }
>   
>   static void ccw_machine_8_0_class_options(MachineClass *mc)
>   {
> +    ccw_machine_8_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
>   }
> -DEFINE_CCW_MACHINE(8_0, "8.0", true);
> +DEFINE_CCW_MACHINE(8_0, "8.0", false);
>   
>   static void ccw_machine_7_2_instance_options(MachineState *machine)
>   {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 6fbbfd56c808..bf5fc9e3e759 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -381,6 +381,9 @@ struct MachineState {
>       } \
>       type_init(machine_initfn##_register_types)
>   
> +extern GlobalProperty hw_compat_8_0[];
> +extern const size_t hw_compat_8_0_len;
> +
>   extern GlobalProperty hw_compat_7_2[];
>   extern const size_t hw_compat_7_2_len;
>   
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 8206d5405a20..eb668e90344d 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -195,6 +195,9 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>   /* sgx.c */
>   void pc_machine_init_sgx_epc(PCMachineState *pcms);
>   
> +extern GlobalProperty pc_compat_8_0[];
> +extern const size_t pc_compat_8_0_len;
> +
>   extern GlobalProperty pc_compat_7_2[];
>   extern const size_t pc_compat_7_2_len;
>   


