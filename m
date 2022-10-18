Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC6A6031A2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:34:07 +0200 (CEST)
Received: from localhost ([::1]:45496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okqTd-0005lw-SV
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1okqFO-0004YH-JC; Tue, 18 Oct 2022 13:19:22 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:57987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1okqFL-0000sy-UV; Tue, 18 Oct 2022 13:19:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 62F3F13373260;
 Tue, 18 Oct 2022 19:19:15 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 18 Oct
 2022 19:19:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003a15a8191-adeb-4c03-849d-a4503237f196,
 E583C31B167A4CECD7AFA5F42DA6B4ED7D5BF57A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4c0087d3-68d2-4799-d36b-f8083a72b882@kaod.org>
Date: Tue, 18 Oct 2022 19:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 3/9] s390x/cpu_topology: resetting the
 Topology-Change-Report
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, <borntraeger@de.ibm.com>, <pasic@linux.ibm.com>, 
 <richard.henderson@linaro.org>, <david@redhat.com>, <thuth@redhat.com>,
 <cohuck@redhat.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, <ehabkost@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <seiden@linux.ibm.com>,
 <nrb@linux.ibm.com>, <frankja@linux.ibm.com>, <berrange@redhat.com>
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-4-pmorel@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221012162107.91734-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1505b62c-522f-4a63-97aa-fee033cd1bc2
X-Ovh-Tracer-Id: 16146249090386856720
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhmohhrvghlsehlihhnuhigrdhisghmrdgtohhmpdhnrhgssehlihhnuhigrdhisghmrdgtohhmpdhsvghiuggvnheslhhinhhugidrihgsmhdrtghomhdprghrmhgsrhhusehrvgguhhgrthdrtghomhdpvggslhgrkhgvsehrvgguhhgrthdrtghomhdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdgvhhgrsghkohhsthesrhgvughhrghtrdgtohhmpdhkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtoh
 hmpdhmshhtsehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrseguvgdrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/22 18:21, Pierre Morel wrote:
> During a subsystem reset the Topology-Change-Report is cleared
> by the machine.
> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>   bit of the SCA in the case of a subsystem reset.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Nico Boehr <nrb@linux.ibm.com>
> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>   target/s390x/cpu.h           |  1 +
>   target/s390x/kvm/kvm_s390x.h |  1 +
>   hw/s390x/cpu-topology.c      | 12 ++++++++++++
>   hw/s390x/s390-virtio-ccw.c   |  1 +
>   target/s390x/cpu-sysemu.c    |  7 +++++++
>   target/s390x/kvm/kvm.c       | 23 +++++++++++++++++++++++
>   6 files changed, 45 insertions(+)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index d604aa9c78..9b35795ac8 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -825,6 +825,7 @@ void s390_enable_css_support(S390CPU *cpu);
>   void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>   int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
>                                   int vq, bool assign);
> +void s390_cpu_topology_reset(void);
>   #ifndef CONFIG_USER_ONLY
>   unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
>   #else
> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
> index aaae8570de..a13c8fb9a3 100644
> --- a/target/s390x/kvm/kvm_s390x.h
> +++ b/target/s390x/kvm/kvm_s390x.h
> @@ -46,5 +46,6 @@ void kvm_s390_crypto_reset(void);
>   void kvm_s390_restart_interrupt(S390CPU *cpu);
>   void kvm_s390_stop_interrupt(S390CPU *cpu);
>   void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
> +int kvm_s390_topology_set_mtcr(uint64_t attr);
>   
>   #endif /* KVM_S390X_H */
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index c73cebfe6f..9f202621d0 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -107,6 +107,17 @@ static void s390_topology_realize(DeviceState *dev, Error **errp)
>       qemu_mutex_init(&topo->topo_mutex);
>   }
>   
> +/**
> + * s390_topology_reset:
> + * @dev: the device
> + *
> + * Calls the sysemu topology reset
> + */
> +static void s390_topology_reset(DeviceState *dev)
> +{
> +    s390_cpu_topology_reset();
> +}
> +
>   /**
>    * topology_class_init:
>    * @oc: Object class
> @@ -120,6 +131,7 @@ static void topology_class_init(ObjectClass *oc, void *data)
>   
>       dc->realize = s390_topology_realize;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->reset = s390_topology_reset;
>   }
>   
>   static const TypeInfo cpu_topology_info = {
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index aa99a62e42..362378454a 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -113,6 +113,7 @@ static const char *const reset_dev_types[] = {
>       "s390-flic",
>       "diag288",
>       TYPE_S390_PCI_HOST_BRIDGE,
> +    TYPE_S390_CPU_TOPOLOGY,
>   };
>   
>   static void subsystem_reset(void)
> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
> index 948e4bd3e0..707c0b658c 100644
> --- a/target/s390x/cpu-sysemu.c
> +++ b/target/s390x/cpu-sysemu.c
> @@ -306,3 +306,10 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
>           kvm_s390_set_diag318(cs, arg.host_ulong);
>       }
>   }
> +
> +void s390_cpu_topology_reset(void)
> +{
> +    if (kvm_enabled()) {
> +        kvm_s390_topology_set_mtcr(0);

I would catch and report the errors here.

> +    }
> +}
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index f96630440b..9c994d27d5 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -2585,3 +2585,26 @@ int kvm_s390_get_zpci_op(void)
>   {
>       return cap_zpci_op;
>   }
> +
> +int kvm_s390_topology_set_mtcr(uint64_t attr)
> +{
> +    struct kvm_device_attr attribute = {
> +        .group = KVM_S390_VM_CPU_TOPOLOGY,
> +        .attr  = attr,
> +    };
> +    int ret;
> +
> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
> +        return -EFAULT;
> +    }
> +    if (!kvm_vm_check_attr(kvm_state, KVM_S390_VM_CPU_TOPOLOGY, attr)) {
> +        return -ENOENT;
> +    }
> +
> +    ret = kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, &attribute);
> +    if (ret) {
> +        error_report("Failed to set cpu topology attribute %lu: %s",
> +                     attr, strerror(-ret));
> +    }
> +    return ret;
> +}


