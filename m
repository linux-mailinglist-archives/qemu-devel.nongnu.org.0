Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4632CF7E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:19:28 +0100 (CET)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHk8l-0007wh-2a
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lHk81-0007P4-DT; Thu, 04 Mar 2021 04:18:41 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lHk7y-0000R5-7z; Thu, 04 Mar 2021 04:18:40 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Drlbp4SLgz5Rhx;
 Thu,  4 Mar 2021 17:16:22 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 4 Mar 2021 17:18:31 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 4 Mar 2021 17:18:31 +0800
Subject: Re: [RFC v8 03/28] header update against 5.11-rc2 and IOMMU/VFIO
 nested stage APIs
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <mst@redhat.com>, <alex.williamson@redhat.com>,
 <jacob.jun.pan@linux.intel.com>, <yi.l.liu@intel.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
 <20210225105233.650545-4-eric.auger@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <86012513-a748-1d1f-a6f7-a2faafc3119e@huawei.com>
Date: Thu, 4 Mar 2021 17:18:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210225105233.650545-4-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 Keqian Zhu <zhukeqian1@huawei.com>, zhangfei.gao@foxmail.com,
 peterx@redhat.com, shameerali.kolothum.thodi@huawei.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, zhangfei.gao@linaro.org,
 will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/2/25 18:52, Eric Auger wrote:
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
>   linux-headers/linux/iommu.h                   | 395 ++++++++++++++++++
>   linux-headers/linux/vfio.h                    | 141 ++++++-
>   3 files changed, 542 insertions(+), 8 deletions(-)
>   create mode 100644 linux-headers/linux/iommu.h
>
> diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> index 7b4062a1a1..acd4c8346d 100644
> --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> +++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
>   
>   static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
>   {
> -	const unsigned int idx = qatomic_read(var);
> +	const unsigned int idx = atomic_read(var);
>   
>   	if (pvrdma_idx_valid(idx, max_elems))
>   		return idx & (max_elems - 1);
> @@ -77,17 +77,17 @@ static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
>   
>   static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)
>   {
> -	uint32_t idx = qatomic_read(var) + 1;	/* Increment. */
> +	uint32_t idx = atomic_read(var) + 1;	/* Increment. */
>   
>   	idx &= (max_elems << 1) - 1;		/* Modulo size, flip gen. */
> -	qatomic_set(var, idx);
> +	atomic_set(var, idx);
>   }
>   
>   static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
>   					      uint32_t max_elems, uint32_t *out_tail)
>   {
> -	const uint32_t tail = qatomic_read(&r->prod_tail);
> -	const uint32_t head = qatomic_read(&r->cons_head);
> +	const uint32_t tail = atomic_read(&r->prod_tail);
> +	const uint32_t head = atomic_read(&r->cons_head);
>   
>   	if (pvrdma_idx_valid(tail, max_elems) &&
>   	    pvrdma_idx_valid(head, max_elems)) {
> @@ -100,8 +100,8 @@ static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
>   static inline int32_t pvrdma_idx_ring_has_data(const struct pvrdma_ring *r,
>   					     uint32_t max_elems, uint32_t *out_head)
>   {
> -	const uint32_t tail = qatomic_read(&r->prod_tail);
> -	const uint32_t head = qatomic_read(&r->cons_head);
> +	const uint32_t tail = atomic_read(&r->prod_tail);
> +	const uint32_t head = atomic_read(&r->cons_head);
>   
>   	if (pvrdma_idx_valid(tail, max_elems) &&
>   	    pvrdma_idx_valid(head, max_elems)) {
The atomic_ has been renamed to qatomic_ in the patch d73415a3154.
It seems that the pvrdma_ring.h doesn't need to be updated.

Best Regards.

Kunkun Jiang

> diff --git a/linux-headers/linux/iommu.h b/linux-headers/linux/iommu.h
> new file mode 100644
> index 0000000000..0a6326bd36
> --- /dev/null
> +++ b/linux-headers/linux/iommu.h
[...]
>   /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
>   
>   /*



