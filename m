Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD922628EB3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:52:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijo-0004K3-2Z; Mon, 14 Nov 2022 18:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ouieY-0001o2-PP
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:10 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oudg3-0008Tn-A0
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 12:55:26 -0500
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N9xjl0XJ3z689QP;
 Tue, 15 Nov 2022 01:52:59 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 18:55:17 +0100
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 14 Nov
 2022 17:55:17 +0000
Date: Mon, 14 Nov 2022 17:55:16 +0000
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <gregory.price@memverge.com>, <hchkuo@avery-design.com.tw>,
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [PATCH 2/4] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Message-ID: <20221114175516.0000375d@Huawei.com>
In-Reply-To: <20221026004737.3646-3-gregory.price@memverge.com>
References: <20221026004737.3646-1-gregory.price@memverge.com>
 <20221026004737.3646-3-gregory.price@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 20:47:35 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> Remove usage of magic numbers when accessing capacity fields and replace
> with CXL_CAPACITY_MULTIPLIER, matching the kernel definition.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Makes sense. I'll add it to my local tree.

Depending on how timing works out, I might roll this into a wider series
of cleanups sent to Michael or we might want to keep this as part of your
series.

Jonathan
 
> ---
>  hw/cxl/cxl-mailbox-utils.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 3e23d29e2d..d7543fd5b4 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -15,6 +15,8 @@
>  #include "qemu/log.h"
>  #include "qemu/uuid.h"
>  
> +#define CXL_CAPACITY_MULTIPLIER   0x10000000 /* SZ_256M */
> +
>  /*
>   * How to add a new command, example. The command set FOO, with cmd BAR.
>   *  1. Add the command set and cmd to the enum.
> @@ -267,7 +269,7 @@ static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
>      } QEMU_PACKED *fw_info;
>      QEMU_BUILD_BUG_ON(sizeof(*fw_info) != 0x50);
>  
> -    if (cxl_dstate->pmem_size < (256 << 20)) {
> +    if (cxl_dstate->pmem_size < CXL_CAPACITY_MULTIPLIER) {
>          return CXL_MBOX_INTERNAL_ERROR;
>      }
>  
> @@ -412,7 +414,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
>      CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
>      uint64_t size = cxl_dstate->pmem_size;
>  
> -    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> +    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
>          return CXL_MBOX_INTERNAL_ERROR;
>      }
>  
> @@ -422,8 +424,8 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
>      /* PMEM only */
>      snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
>  
> -    id->total_capacity = size / (256 << 20);
> -    id->persistent_capacity = size / (256 << 20);
> +    id->total_capacity = size / CXL_CAPACITY_MULTIPLIER;
> +    id->persistent_capacity = size / CXL_CAPACITY_MULTIPLIER;
>      id->lsa_size = cvc->get_lsa_size(ct3d);
>      id->poison_list_max_mer[1] = 0x1; /* 256 poison records */
>  
> @@ -444,14 +446,14 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
>      QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
>      uint64_t size = cxl_dstate->pmem_size;
>  
> -    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> +    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
>          return CXL_MBOX_INTERNAL_ERROR;
>      }
>  
>      /* PMEM only */
>      part_info->active_vmem = 0;
>      part_info->next_vmem = 0;
> -    part_info->active_pmem = size / (256 << 20);
> +    part_info->active_pmem = size / CXL_CAPACITY_MULTIPLIER;
>      part_info->next_pmem = 0;
>  
>      *len = sizeof(*part_info);


