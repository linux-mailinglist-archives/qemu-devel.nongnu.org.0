Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D5231CE4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 12:47:39 +0200 (CEST)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0jcZ-0003PZ-1p
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 06:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0jbX-0002tm-IG
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 06:46:35 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:47658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0jbW-0004pF-44
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 06:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596019593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpCp6UIXOIwIxQRj2iFCzYrfH19l42VNQoNGajAAV/8=;
 b=ENNryXqUOc42WN+V94rkgN6WdTopvwom+s9mxDAeoGdhOOG9rDeutP/HtzBLjMn08K8BK3
 dEuUmkoZJeioIWuNnV0bpgcb3IGkF0w4rhJdd8ta6Y8jGVMe51/YXXXMvGLaJ9hcXwn+ht
 D7D60wU7O+8kNz/qE5umuhh/FdXx4fQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-5DG0P2o7PSOU_vJXL3HnjQ-1; Wed, 29 Jul 2020 06:46:29 -0400
X-MC-Unique: 5DG0P2o7PSOU_vJXL3HnjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F98D1902EA0;
 Wed, 29 Jul 2020 10:46:28 +0000 (UTC)
Received: from starship (unknown [10.35.206.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2BAF6932B;
 Wed, 29 Jul 2020 10:46:25 +0000 (UTC)
Message-ID: <976c83eedb86ec6d43cbc37774a0bc5947badcc6.camel@redhat.com>
Subject: Re: [PATCH v3 09/18] hw/block/nvme: move NvmeFeatureVal into
 hw/block/nvme.h
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
Date: Wed, 29 Jul 2020 13:46:24 +0300
In-Reply-To: <20200706061303.246057-10-its@irrelevant.dk>
References: <20200706061303.246057-1-its@irrelevant.dk>
 <20200706061303.246057-10-its@irrelevant.dk>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.74; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 01:09:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-07-06 at 08:12 +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The NvmeFeatureVal does not belong with the spec-related data structures
> in include/block/nvme.h that is shared between the block-level nvme
> driver and the emulated nvme device.
> 
> Move it into the nvme device specific header file as it is the only
> user of the structure. Also, remove the unused members.

Agree.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.h      |  8 ++++++++
>  include/block/nvme.h | 17 -----------------
>  2 files changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 1837233617bb..b93067c9e4a1 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -79,6 +79,14 @@ static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
>  #define NVME(obj) \
>          OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
>  
> +typedef struct NvmeFeatureVal {
> +    struct {
> +        uint16_t temp_thresh_hi;
> +        uint16_t temp_thresh_low;
> +    };
> +    uint32_t    async_config;
> +} NvmeFeatureVal;
> +
>  typedef struct NvmeCtrl {
>      PCIDevice    parent_obj;
>      MemoryRegion iomem;
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 2101292ed5e8..0dce15af6bcf 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -865,23 +865,6 @@ enum NvmeIdCtrlLpa {
>  #define NVME_CTRL_SGLS_MPTR_SGL            (0x1 << 19)
>  #define NVME_CTRL_SGLS_ADDR_OFFSET         (0x1 << 20)
>  
> -typedef struct NvmeFeatureVal {
> -    uint32_t    arbitration;
> -    uint32_t    power_mgmt;
> -    struct {
> -        uint16_t temp_thresh_hi;
> -        uint16_t temp_thresh_low;
> -    };
> -    uint32_t    err_rec;
> -    uint32_t    volatile_wc;
> -    uint32_t    num_queues;
> -    uint32_t    int_coalescing;
> -    uint32_t    *int_vector_config;
> -    uint32_t    write_atomicity;
> -    uint32_t    async_config;
> -    uint32_t    sw_prog_marker;
> -} NvmeFeatureVal;
> -
>  #define NVME_ARB_AB(arb)    (arb & 0x7)
>  #define NVME_ARB_LPW(arb)   ((arb >> 8) & 0xff)
>  #define NVME_ARB_MPW(arb)   ((arb >> 16) & 0xff)



