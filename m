Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FFC629622
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outMG-0000aS-QL; Tue, 15 Nov 2022 05:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1outM9-0000Zt-VO
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:39:56 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1outM7-0003c6-UL
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:39:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3FF2627578;
 Tue, 15 Nov 2022 10:39:43 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 15 Nov
 2022 11:39:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d954870f-ac55-4152-8466-6dd756a65680,
 7295B31BD84C74A7464F90D7FA15D0970FC32DA5) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 15 Nov 2022 11:39:41 +0100
From: Greg Kurz <groug@kaod.org>
To: Cornelia Huck <cohuck@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, "Daniel Henrique
 Barboza" <danielhb413@gmail.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Thomas Huth
 <thuth@redhat.com>, David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
Message-ID: <20221115113941.123db1e8@bahia>
In-Reply-To: <20221111124534.129111-1-cohuck@redhat.com>
References: <20221111124534.129111-1-cohuck@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: f276a909-23c6-45b1-9043-da9b8a369f0b
X-Ovh-Tracer-Id: 7813463880830065049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegkeejtdevgeekieelffdvtedvvdegtdduudeigffhhffgvdfhgeejteekheefkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghohhhutghksehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghvihguse
 hgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhlrghurhgvnhhtsehvihhvihgvrhdrvghupdhmshhtsehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdifrghnghihrghnrghnheehsehhuhgrfigvihdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdptghlgheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 11 Nov 2022 13:45:34 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/m68k/virt.c             |  9 ++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  10 files changed, 79 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b87135085610..2a46660980e7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3096,10 +3096,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_8_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(8, 0)
> +
>  static void virt_machine_7_2_options(MachineClass *mc)
>  {
> +    virt_machine_8_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
> +DEFINE_VIRT_MACHINE(7, 2)
>  
>  static void virt_machine_7_1_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8d34caa31dc8..f264fb53b46c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -40,6 +40,9 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "qom/object_interfaces.h"
>  
> +GlobalProperty hw_compat_7_2[] ={};

Missing space between '=' and '{}'.

Anyway, for ppc parts:

Reviewed-by: Greg Kurz <groug@kaod.org>

> +const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
> +
>  GlobalProperty hw_compat_7_1[] = {
>      { "virtio-device", "queue_reset", "false" },
>  };
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 546b703cb42c..9aeff77e9dca 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -107,6 +107,9 @@
>      { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
>      { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
>  
> +GlobalProperty pc_compat_7_2[] = {};
> +const size_t pc_compat_7_2_len = G_N_ELEMENTS(pc_compat_7_2);
> +
>  GlobalProperty pc_compat_7_1[] = {};
>  const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
>  
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 0ad0ed160387..1c0a7b83b545 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -435,7 +435,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_7_2_machine_options(MachineClass *m)
> +static void pc_i440fx_8_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -444,6 +444,18 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
> +                      pc_i440fx_8_0_machine_options);
> +
> +static void pc_i440fx_7_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_8_0_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
>                        pc_i440fx_7_2_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a496bd6e74f5..10bb49f679b0 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -370,7 +370,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_7_2_machine_options(MachineClass *m)
> +static void pc_q35_8_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -378,6 +378,17 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
> +                   pc_q35_8_0_machine_options);
> +
> +static void pc_q35_7_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_8_0_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_7_2, hw_compat_7_2_len);
> +    compat_props_add(m->compat_props, pc_compat_7_2, pc_compat_7_2_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
>                     pc_q35_7_2_machine_options);
>  
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index da5eafd2756f..4cb5beef1a0c 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -346,10 +346,17 @@ type_init(virt_machine_register_types)
>      } \
>      type_init(machvirt_machine_##major##_##minor##_init);
>  
> +static void virt_machine_8_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(8, 0, true)
> +
>  static void virt_machine_7_2_options(MachineClass *mc)
>  {
> +    virt_machine_8_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>  }
> -DEFINE_VIRT_MACHINE(7, 2, true)
> +DEFINE_VIRT_MACHINE(7, 2, false)
>  
>  static void virt_machine_7_1_options(MachineClass *mc)
>  {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 66b414d2e9ba..da9c84c1198f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4733,15 +4733,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-8.0
> + */
> +static void spapr_machine_8_0_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(8_0, "8.0", true);
> +
>  /*
>   * pseries-7.2
>   */
>  static void spapr_machine_7_2_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_8_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(7_2, "7.2", true);
> +DEFINE_SPAPR_MACHINE(7_2, "7.2", false);
>  
>  /*
>   * pseries-7.1
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 7d80bc183716..9d2f7c309f75 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -823,14 +823,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_8_0_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_8_0_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(8_0, "8.0", true);
> +
>  static void ccw_machine_7_2_instance_options(MachineState *machine)
>  {
> +    ccw_machine_8_0_instance_options(machine);
>  }
>  
>  static void ccw_machine_7_2_class_options(MachineClass *mc)
>  {
> +    ccw_machine_8_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>  }
> -DEFINE_CCW_MACHINE(7_2, "7.2", true);
> +DEFINE_CCW_MACHINE(7_2, "7.2", false);
>  
>  static void ccw_machine_7_1_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 90f1dd3aeb79..d18d6d007335 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -379,6 +379,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_7_2[];
> +extern const size_t hw_compat_7_2_len;
> +
>  extern GlobalProperty hw_compat_7_1[];
>  extern const size_t hw_compat_7_1_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index c95333514ed3..991f905f5d25 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -200,6 +200,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>  /* sgx.c */
>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
>  
> +extern GlobalProperty pc_compat_7_2[];
> +extern const size_t pc_compat_7_2_len;
> +
>  extern GlobalProperty pc_compat_7_1[];
>  extern const size_t pc_compat_7_1_len;
>  


