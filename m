Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8324DE31E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:59:26 +0100 (CET)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJgz-0001RM-28
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:59:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alison.schofield@intel.com>)
 id 1nVFrv-0003AE-7Z
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:54:27 -0400
Received: from mga11.intel.com ([192.55.52.93]:61100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alison.schofield@intel.com>)
 id 1nVFrs-0004Eg-Lq
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647622464; x=1679158464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zYAJa5HkG7GrDnP4R6bnn+zO0ZSqQjs9KIygYP5gJfE=;
 b=gms8Mv8NtnAFyVoitAv9Lz7yjNgWv1I/cHmpNbcKM2pUThat+tDGhQ6C
 8dbQ4I/4q9QdD6UFMQ5fC7tvy0OEv9t1TlZgAQD/7QlL08+pVS18Bqesa
 pdTzjud9M41stFga2+SDzuJc4iWOIzsxkAAZjIfbLRJ3m8M6N5w2kvY5Y
 1FMhCZgxR184TBpjAvX62j/IsQWBBYmztcG+iwHawj5juBL16/+eYam8P
 yf4HoHV/HrVuxvC5QJBgfbgjJ3LMYe1P8k9a+4jn4mYuTQJlBxzdlfilA
 mJAFdqKPCTGOycJcv7D/ShLliuSG5LWJEzMBEe8Cf5TIoay2BxKRo1CKn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="254739007"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="254739007"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 09:53:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558535450"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 09:53:33 -0700
Date: Fri, 18 Mar 2022 09:56:22 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v8 19/46] hw/cxl/device: Add some trivial commands
Message-ID: <20220318165622.GA1119244@alison-desk>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-20-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318150635.24600-20-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=alison.schofield@intel.com; helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Mar 2022 16:57:06 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Browy <cbrowy@avery-design.com>, linuxarm@huawei.com,
 linux-cxl@vger.kernel.org, qemu-devel@nongnu.org,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Peter Xu <peterx@redhat.com>,
 Saransh Gupta1 <saransh@ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 03:06:08PM +0000, Jonathan Cameron wrote:
> From: Ben Widawsky <ben.widawsky@intel.com>
> 
> GET_FW_INFO and GET_PARTITION_INFO, for this emulation, is equivalent to
> info already returned in the IDENTIFY command. To have a more robust
> implementation, add those.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c | 69 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 

snip

>  
> +static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
> +                                           CXLDeviceState *cxl_dstate,
> +                                           uint16_t *len)
> +{
> +    struct {
> +        uint64_t active_vmem;
> +        uint64_t active_pmem;
> +        uint64_t next_vmem;
> +        uint64_t next_pmem;
> +    } QEMU_PACKED *part_info = (void *)cmd->payload;
> +    QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
> +    uint64_t size = cxl_dstate->pmem_size;
> +
> +    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> +        return CXL_MBOX_INTERNAL_ERROR;
> +    }
> +
> +    /* PMEM only */
> +    part_info->active_vmem = 0;
> +    part_info->next_vmem = 0;
> +    part_info->active_pmem = size / (256 << 20);
> +    part_info->next_pmem = part_info->active_pmem;

Setting next like this is logical, but it's not per the CXL spec:

8.2.9.5.2.1
"Next Persistent Capacity: If non-zero, this value shall become the
Active Persistent Capacity on the next cold reset. If both this field and the
Next Volatile Capacity field are zero, there is no pending change to the
partitioning."

next_(vmem|pmem) should start as zero and only change as the result
of a successful set_partition_info command.

From your cover letter:
* Volatile memory devices (easy but it's more code so left for now).
Wondering if this is something I could do, and follow that with
set_partition support. Does that sound reasonable? 

Alison

> +
> +    *len = sizeof(*part_info);
> +    return CXL_MBOX_SUCCESS;
> +}
> +

snip


