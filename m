Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C342F2E45
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:47:33 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI95-0008MG-VB
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzI0q-0006eK-Nx
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:39:00 -0500
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:58143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzI0l-0004bF-Fo
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:38:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 14947229F36;
 Tue, 12 Jan 2021 12:38:52 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 12 Jan
 2021 12:38:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c54286dc-714a-4a87-890d-fa0bbe94897a,
 D7A3512486C53AB1907B5452A8D2CB06296403FA) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 12 Jan 2021 12:38:49 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 12/13] confidential guest support: Alter virtio
 default properties for protected guests
Message-ID: <20210112123849.062e4a02@bahia.lan>
In-Reply-To: <20210112044508.427338-13-david@gibson.dropbear.id.au>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-13-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 83069bb5-bfb5-4ee7-9213-b0c0d59cd6e2
X-Ovh-Tracer-Id: 9965058603335129439
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehjuhhnrdhnrghkrghjihhmrgesihhnthgvlhdrtghomh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, andi.kleen@intel.com,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, qemu-s390x@nongnu.org,
 jun.nakajima@intel.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 15:45:07 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> The default behaviour for virtio devices is not to use the platforms normal
> DMA paths, but instead to use the fact that it's running in a hypervisor
> to directly access guest memory.  That doesn't work if the guest's memory
> is protected from hypervisor access, such as with AMD's SEV or POWER's PEF.
> 
> So, if a confidential guest mechanism is enabled, then apply the
> iommu_platform=on option so it will go through normal DMA mechanisms.
> Those will presumably have some way of marking memory as shared with
> the hypervisor or hardware so that DMA will work.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/core/machine.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 5a7433332b..61ae363559 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -33,6 +33,8 @@
>  #include "migration/global_state.h"
>  #include "migration/vmstate.h"
>  #include "exec/confidential-guest-support.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/virtio-pci.h"
>  
>  GlobalProperty hw_compat_5_2[] = {};
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> @@ -1204,6 +1206,17 @@ void machine_run_board_init(MachineState *machine)
>           * areas.
>           */
>          machine_set_mem_merge(OBJECT(machine), false, &error_abort);
> +
> +        /*
> +         * Virtio devices can't count on directly accessing guest
> +         * memory, so they need iommu_platform=on to use normal DMA
> +         * mechanisms.  That requires also disabling legacy virtio
> +         * support for those virtio pci devices which allow it.
> +         */
> +        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable-legacy",
> +                                   "on", true);
> +        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iommu_platform",
> +                                   "on", false);
>      }
>  
>      machine_class->init(machine);


