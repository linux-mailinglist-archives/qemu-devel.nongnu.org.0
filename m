Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4039564845F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3eo3-0005Ge-CX; Fri, 09 Dec 2022 09:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p3eo2-0005GV-9l
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:56:54 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p3eo0-0003jw-BH
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:56:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3D64921BA7;
 Fri,  9 Dec 2022 14:56:49 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 9 Dec
 2022 15:56:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00345b35db4-6999-463f-8c72-f4693cd35f2e,
 703C8C4CBBC51929D19CEDB14A3E71E172461769) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <69575e36-224a-c611-d446-fc7133586505@kaod.org>
Date: Fri, 9 Dec 2022 15:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 4/7] s390x/cpu_topology: CPU topology migration
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, <borntraeger@de.ibm.com>, <pasic@linux.ibm.com>, 
 <richard.henderson@linaro.org>, <david@redhat.com>, <thuth@redhat.com>,
 <cohuck@redhat.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, <ehabkost@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <seiden@linux.ibm.com>,
 <nrb@linux.ibm.com>, <scgl@linux.ibm.com>, <frankja@linux.ibm.com>,
 <berrange@redhat.com>
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <20221208094432.9732-5-pmorel@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221208094432.9732-5-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6ba7bfcb-4647-4c66-8c00-c49c44c87041
X-Ovh-Tracer-Id: 5526198219551116243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhmohhrvghlsehlihhnuhigrdhisghmrdgtohhmpdhstghglheslhhinhhugidrihgsmhdrtghomhdpnhhrsgeslhhinhhugidrihgsmhdrtghomhdpshgvihguvghnsehlihhnuhigrdhisghmrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpvghhrggskhhoshhtsehrvgguhhgrthdrtghomhdpkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpfh
 hrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrseguvgdrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpmhhsthesrhgvughhrghtrdgtohhmpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/8/22 10:44, Pierre Morel wrote:
> The migration can only take place if both source and destination
> of the migration both use or both do not use the CPU topology
> facility.
> 
> We indicate a change in topology during migration postload for the
> case the topology changed between source and destination.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   target/s390x/cpu.h        |  1 +
>   hw/s390x/cpu-topology.c   | 49 +++++++++++++++++++++++++++++++++++++++
>   target/s390x/cpu-sysemu.c |  8 +++++++
>   3 files changed, 58 insertions(+)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index bc1a7de932..284c708a6c 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -854,6 +854,7 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>   int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
>                                   int vq, bool assign);
>   void s390_cpu_topology_reset(void);
> +int s390_cpu_topology_mtcr_set(void);
>   #ifndef CONFIG_USER_ONLY
>   unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
>   #else
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index f54afcf550..8a2fe041d4 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -18,6 +18,7 @@
>   #include "target/s390x/cpu.h"
>   #include "hw/s390x/s390-virtio-ccw.h"
>   #include "hw/s390x/cpu-topology.h"
> +#include "migration/vmstate.h"
>   
>   /**
>    * s390_has_topology
> @@ -129,6 +130,53 @@ static void s390_topology_reset(DeviceState *dev)
>       s390_cpu_topology_reset();
>   }
>   
> +/**
> + * cpu_topology_postload
> + * @opaque: a pointer to the S390Topology
> + * @version_id: version identifier
> + *
> + * We check that the topology is used or is not used
> + * on both side identically.
> + *
> + * If the topology is in use we set the Modified Topology Change Report
> + * on the destination host.
> + */
> +static int cpu_topology_postload(void *opaque, int version_id)
> +{
> +    int ret;
> +
> +    /* We do not support CPU Topology, all is good */
> +    if (!s390_has_topology()) {
> +        return 0;
> +    }
> +
> +    /* We support CPU Topology, set the MTCR unconditionally */
> +    ret = s390_cpu_topology_mtcr_set();
> +    if (ret) {
> +        error_report("Failed to set MTCR: %s", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +/**
> + * cpu_topology_needed:
> + * @opaque: The pointer to the S390Topology
> + *
> + * We always need to know if source and destination use the topology.
> + */
> +static bool cpu_topology_needed(void *opaque)
> +{
> +    return s390_has_topology();
> +}
> +
> +const VMStateDescription vmstate_cpu_topology = {
> +    .name = "cpu_topology",
> +    .version_id = 1,
> +    .post_load = cpu_topology_postload,

Please use 'cpu_topology_post_load', it is easier to catch with a grep.

Thanks,

C.

> +    .minimum_version_id = 1,
> +    .needed = cpu_topology_needed,
> +};
> +
>   /**
>    * topology_class_init:
>    * @oc: Object class
> @@ -145,6 +193,7 @@ static void topology_class_init(ObjectClass *oc, void *data)
>       device_class_set_props(dc, s390_topology_properties);
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>       dc->reset = s390_topology_reset;
> +    dc->vmsd = &vmstate_cpu_topology;
>   }
>   
>   static const TypeInfo cpu_topology_info = {
> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
> index e27864c5f5..a8e3e6219d 100644
> --- a/target/s390x/cpu-sysemu.c
> +++ b/target/s390x/cpu-sysemu.c
> @@ -319,3 +319,11 @@ void s390_cpu_topology_reset(void)
>           }
>       }
>   }
> +
> +int s390_cpu_topology_mtcr_set(void)
> +{
> +    if (kvm_enabled()) {
> +        return kvm_s390_topology_set_mtcr(1);
> +    }
> +    return -ENOENT;
> +}


