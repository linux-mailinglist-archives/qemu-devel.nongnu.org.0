Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213546D9CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:33:42 +0100 (CET)
Received: from localhost ([::1]:56542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0p3-0004av-JP
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mv0o2-0003Y2-IC
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:32:38 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:34183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mv0ny-00016Z-EZ
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 12:32:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.55])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3C0C320986;
 Wed,  8 Dec 2021 17:32:31 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 8 Dec
 2021 18:32:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ae66b403-e897-417f-8be9-b2f57a824b86,
 8F2F55344B714E1E8EB9F2B8AB3A843E42DFE4C2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0dfc7dec-54fa-3b3a-0eb5-fe2e404adf5b@kaod.org>
Date: Wed, 8 Dec 2021 18:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>, David Hildenbrand <david@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>
References: <20211208170241.110551-1-cohuck@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 28b3b951-87a4-490f-9279-849b3e7a8dba
X-Ovh-Tracer-Id: 17018821518107183885
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 18:02, Cornelia Huck wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Acked-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 30da05dfe040..ddcfab426436 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2857,10 +2857,17 @@ static void machvirt_machine_init(void)
>   }
>   type_init(machvirt_machine_init);
>   
> +static void virt_machine_7_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
> +
>   static void virt_machine_6_2_options(MachineClass *mc)
>   {
> +    virt_machine_7_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>   }
> -DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
> +DEFINE_VIRT_MACHINE(6, 2)
>   
>   static void virt_machine_6_1_options(MachineClass *mc)
>   {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 53a99abc5605..a9c15479fe1d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-pci.h"
>   
> +GlobalProperty hw_compat_6_2[] = {};
> +const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
> +
>   GlobalProperty hw_compat_6_1[] = {
>       { "vhost-user-vsock-device", "seqpacket", "off" },
>       { "nvme-ns", "shared", "off" },
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc24..fccde2ef39f6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,9 @@
>   #include "trace.h"
>   #include CONFIG_DEVICES
>   
> +GlobalProperty pc_compat_6_2[] = {};
> +const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
> +
>   GlobalProperty pc_compat_6_1[] = {
>       { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
>       { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 223dd3e05d15..b03026bf0648 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>   }
>   
> -static void pc_i440fx_6_2_machine_options(MachineClass *m)
> +static void pc_i440fx_7_0_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_i440fx_machine_options(m);
> @@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
> +                      pc_i440fx_7_0_machine_options);
> +
> +static void pc_i440fx_6_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> +}
> +
>   DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
>                         pc_i440fx_6_2_machine_options);
>   
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index e1e100316d93..6b66eb16bb64 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
>       m->max_cpus = 288;
>   }
>   
> -static void pc_q35_6_2_machine_options(MachineClass *m)
> +static void pc_q35_7_0_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_q35_machine_options(m);
> @@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
> +                   pc_q35_7_0_machine_options);
> +
> +static void pc_q35_6_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> +}
> +
>   DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
>                      pc_q35_6_2_machine_options);
>   
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 3b5fd749be89..837342932586 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4665,15 +4665,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>       }                                                                \
>       type_init(spapr_machine_register_##suffix)
>   
> +/*
> + * pseries-7.0
> + */
> +static void spapr_machine_7_0_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(7_0, "7.0", true);
> +
>   /*
>    * pseries-6.2
>    */
>   static void spapr_machine_6_2_class_options(MachineClass *mc)
>   {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_7_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>   }
>   
> -DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
> +DEFINE_SPAPR_MACHINE(6_2, "6.2", false);
>   
>   /*
>    * pseries-6.1
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 653587ea62f4..84e3e63c430d 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_7_0_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_0_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_0, "7.0", true);
> +
>   static void ccw_machine_6_2_instance_options(MachineState *machine)
>   {
> +    ccw_machine_7_0_instance_options(machine);
>   }
>   
>   static void ccw_machine_6_2_class_options(MachineClass *mc)
>   {
> +    ccw_machine_7_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>   }
> -DEFINE_CCW_MACHINE(6_2, "6.2", true);
> +DEFINE_CCW_MACHINE(6_2, "6.2", false);
>   
>   static void ccw_machine_6_1_instance_options(MachineState *machine)
>   {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 9c1c1901046c..b7b68471ffc1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -375,6 +375,9 @@ struct MachineState {
>       } \
>       type_init(machine_initfn##_register_types)
>   
> +extern GlobalProperty hw_compat_6_2[];
> +extern const size_t hw_compat_6_2_len;
> +
>   extern GlobalProperty hw_compat_6_1[];
>   extern const size_t hw_compat_6_1_len;
>   
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 9ab39e428f80..b38947c224cd 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -196,6 +196,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>   /* sgx.c */
>   void pc_machine_init_sgx_epc(PCMachineState *pcms);
>   
> +extern GlobalProperty pc_compat_6_2[];
> +extern const size_t pc_compat_6_2_len;
> +
>   extern GlobalProperty pc_compat_6_1[];
>   extern const size_t pc_compat_6_1_len;
>   
> 


