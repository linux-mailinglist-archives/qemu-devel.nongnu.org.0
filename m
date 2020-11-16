Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37262B40EB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 11:24:29 +0100 (CET)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kebgS-0000Fl-Uv
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 05:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kebfX-00081I-Bi
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:23:31 -0500
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:59839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kebfU-0001FH-QA
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 05:23:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3F216235CB0;
 Mon, 16 Nov 2020 11:23:17 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 16 Nov
 2020 11:23:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0023fd64580-6df5-4ad7-a5eb-b8c93df7a629,
 5DC1A71B4DA47E6A258F2FD66590EA27958A2DF2) smtp.auth=groug@kaod.org
Date: Mon, 16 Nov 2020 11:23:14 +0100
From: Greg Kurz <groug@kaod.org>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 6.0
Message-ID: <20201116112314.3e999cae@bahia.lan>
In-Reply-To: <20201109173928.1001764-1-cohuck@redhat.com>
References: <20201109173928.1001764-1-cohuck@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: dd5b4ae4-a34c-4ee1-81e3-fe2bd1610160
X-Ovh-Tracer-Id: 5986409805647813051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.45.231; envelope-from=groug@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:23:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  9 Nov 2020 18:39:28 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> Add 6.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 27dbeb549ef1..d21dad4491c4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2587,10 +2587,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_6_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
> +
>  static void virt_machine_5_2_options(MachineClass *mc)
>  {
> +    virt_machine_6_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
> +DEFINE_VIRT_MACHINE(5, 2)
>  
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 98b87f76cbbe..c5a6c517bb9d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -28,6 +28,9 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/vmstate.h"
>  
> +GlobalProperty hw_compat_5_2[] = {};

Maybe worth putting the }; on the next line so that the next
change has a prettier diff ?

Apart from that,

Reviewed-by: Greg Kurz <groug@kaod.org>

> +const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> +
>  GlobalProperty hw_compat_5_1[] = {
>      { "vhost-scsi", "num_queues", "1"},
>      { "vhost-user-blk", "num-queues", "1"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 5e6c0023e0c7..d386c5662698 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -97,6 +97,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> +GlobalProperty pc_compat_5_2[] = {};
> +const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
> +
>  GlobalProperty pc_compat_5_1[] = {
>      { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
>  };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 13d1628f13bf..6188c3e97eaf 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +static void pc_i440fx_6_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -435,6 +435,18 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
> +                      pc_i440fx_6_0_machine_options);
> +
> +static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_6_0_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
>                        pc_i440fx_5_2_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a3f4959c4357..0a212443aa84 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -344,7 +344,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_5_2_machine_options(MachineClass *m)
> +static void pc_q35_6_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -352,6 +352,17 @@ static void pc_q35_5_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
> +                   pc_q35_6_0_machine_options);
> +
> +static void pc_q35_5_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_6_0_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
>                     pc_q35_5_2_machine_options);
>  
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 227075103e9a..45e0afbeba49 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4515,15 +4515,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-6.0
> + */
> +static void spapr_machine_6_0_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
> +
>  /*
>   * pseries-5.2
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_6_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
> +DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
>  
>  /*
>   * pseries-5.1
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 22222c4fd5ad..b1229abc3134 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -785,14 +785,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_6_0_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_6_0_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(6_0, "6.0", true);
> +
>  static void ccw_machine_5_2_instance_options(MachineState *machine)
>  {
> +    ccw_machine_6_0_instance_options(machine);
>  }
>  
>  static void ccw_machine_5_2_class_options(MachineClass *mc)
>  {
> +    ccw_machine_6_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_CCW_MACHINE(5_2, "5.2", true);
> +DEFINE_CCW_MACHINE(5_2, "5.2", false);
>  
>  static void ccw_machine_5_1_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index a49e3a6b4481..f94f4ad5d83c 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -310,6 +310,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_5_2[];
> +extern const size_t hw_compat_5_2_len;
> +
>  extern GlobalProperty hw_compat_5_1[];
>  extern const size_t hw_compat_5_1_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 911e4600970c..49dfa667de09 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -191,6 +191,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
>  
> +extern GlobalProperty pc_compat_5_2[];
> +extern const size_t pc_compat_5_2_len;
> +
>  extern GlobalProperty pc_compat_5_1[];
>  extern const size_t pc_compat_5_1_len;
>  


