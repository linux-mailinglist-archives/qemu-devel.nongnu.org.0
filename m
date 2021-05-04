Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F1372DD1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:14:45 +0200 (CEST)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxh6-0005CM-Fd
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ldxeT-0002pK-48
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:12:01 -0400
Received: from 10.mo51.mail-out.ovh.net ([46.105.77.235]:59986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ldxeO-0004M9-Vk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:12:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.107])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 087F3298BF2;
 Tue,  4 May 2021 18:11:52 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 4 May 2021
 18:11:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006dd1c6483-bda8-448c-a210-1caf189ab7ac,
 233BADB9E061AA125F593C9F78707CF28220F307) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 4 May 2021 18:11:51 +0200
From: Greg Kurz <groug@kaod.org>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] vfio/pci: Revert nvlink removal uAPI breakage
Message-ID: <20210504181151.62b14551@bahia.lan>
In-Reply-To: <162014341432.3807030.11054087109120670135.stgit@omen>
References: <162014341432.3807030.11054087109120670135.stgit@omen>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3e61a315-22a8-4afd-86cb-fce400e0fcce
X-Ovh-Tracer-Id: 8234831918973819314
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefiedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=groug@kaod.org;
 helo=10.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 daniel@ffwll.ch, linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 04 May 2021 09:52:02 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> Revert the uAPI changes from the below commit with notice that these
> regions and capabilities are no longer provided.
> 
> Fixes: b392a1989170 ("vfio/pci: remove vfio_pci_nvlink2")
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
> 
> Greg (Kurz), please double check this resolves the issue.  Thanks!
> 

It does. Feel free to add:

Reviewed-by: Greg Kurz <groug@kaod.org>

and

Tested-by: Greg Kurz <groug@kaod.org>

Thanks for the quick fix.

Cheers,

--
Greg

>  include/uapi/linux/vfio.h |   46 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 34b1f53a3901..ef33ea002b0b 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -333,10 +333,21 @@ struct vfio_region_info_cap_type {
>  #define VFIO_REGION_SUBTYPE_INTEL_IGD_LPC_CFG	(3)
>  
>  /* 10de vendor PCI sub-types */
> -/* subtype 1 was VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM, don't use */
> +/*
> + * NVIDIA GPU NVlink2 RAM is coherent RAM mapped onto the host address space.
> + *
> + * Deprecated, region no longer provided
> + */
> +#define VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM	(1)
>  
>  /* 1014 vendor PCI sub-types */
> -/* subtype 1 was VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD, don't use */
> +/*
> + * IBM NPU NVlink2 ATSD (Address Translation Shootdown) register of NPU
> + * to do TLB invalidation on a GPU.
> + *
> + * Deprecated, region no longer provided
> + */
> +#define VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD	(1)
>  
>  /* sub-types for VFIO_REGION_TYPE_GFX */
>  #define VFIO_REGION_SUBTYPE_GFX_EDID            (1)
> @@ -630,9 +641,36 @@ struct vfio_device_migration_info {
>   */
>  #define VFIO_REGION_INFO_CAP_MSIX_MAPPABLE	3
>  
> -/* subtype 4 was VFIO_REGION_INFO_CAP_NVLINK2_SSATGT, don't use */
> +/*
> + * Capability with compressed real address (aka SSA - small system address)
> + * where GPU RAM is mapped on a system bus. Used by a GPU for DMA routing
> + * and by the userspace to associate a NVLink bridge with a GPU.
> + *
> + * Deprecated, capability no longer provided
> + */
> +#define VFIO_REGION_INFO_CAP_NVLINK2_SSATGT	4
> +
> +struct vfio_region_info_cap_nvlink2_ssatgt {
> +	struct vfio_info_cap_header header;
> +	__u64 tgt;
> +};
>  
> -/* subtype 5 was VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD, don't use */
> +/*
> + * Capability with an NVLink link speed. The value is read by
> + * the NVlink2 bridge driver from the bridge's "ibm,nvlink-speed"
> + * property in the device tree. The value is fixed in the hardware
> + * and failing to provide the correct value results in the link
> + * not working with no indication from the driver why.
> + *
> + * Deprecated, capability no longer provided
> + */
> +#define VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD	5
> +
> +struct vfio_region_info_cap_nvlink2_lnkspd {
> +	struct vfio_info_cap_header header;
> +	__u32 link_speed;
> +	__u32 __pad;
> +};
>  
>  /**
>   * VFIO_DEVICE_GET_IRQ_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 9,
> 
> 


