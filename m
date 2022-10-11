Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0095FAF5F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 11:31:30 +0200 (CEST)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiBbl-0003IZ-Cd
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 05:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiBKI-0007ZR-Dd
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:13:27 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiBKF-0005g9-TN
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:13:25 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mmqkc3rgbz67jy7;
 Tue, 11 Oct 2022 17:10:32 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 11:13:18 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 10:13:18 +0100
Date: Tue, 11 Oct 2022 10:13:17 +0100
To: <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [RFC PATCH 2/6] qemu/uuid: Add UUID static initializer
Message-ID: <20221011101317.000079a1@huawei.com>
In-Reply-To: <20221010222944.3923556-3-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-3-ira.weiny@intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 10 Oct 2022 15:29:40 -0700
ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> UUID's are defined as network byte order fields.  No static initializer
> was available for UUID's in their standard big endian format.
> 
> Define a big endian initializer for UUIDs.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Seems sensible.  Would allow a cleanup in the existing cel_uuid handling
in the CXL code where we use a static for this and end up filling it
with the same value multiple times which is less than ideal...
A quick grep and for qemu_uuid_parse() suggests there are other cases
where it's passed a constant string.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/qemu/uuid.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
> index 9925febfa54d..dc40ee1fc998 100644
> --- a/include/qemu/uuid.h
> +++ b/include/qemu/uuid.h
> @@ -61,6 +61,18 @@ typedef struct {
>      (clock_seq_hi_and_reserved), (clock_seq_low), (node0), (node1), (node2),\
>      (node3), (node4), (node5) }
>  
> +/* Normal (network byte order) UUID */
> +#define UUID(time_low, time_mid, time_hi_and_version,                    \
> +  clock_seq_hi_and_reserved, clock_seq_low, node0, node1, node2,         \
> +  node3, node4, node5)                                                   \
> +  { ((time_low) >> 24) & 0xff, ((time_low) >> 16) & 0xff,                \
> +    ((time_low) >> 8) & 0xff, (time_low) & 0xff,                         \
> +    ((time_mid) >> 8) & 0xff, (time_mid) & 0xff,                         \
> +    ((time_hi_and_version) >> 8) & 0xff, (time_hi_and_version) & 0xff,   \
> +    (clock_seq_hi_and_reserved), (clock_seq_low),                        \
> +    (node0), (node1), (node2), (node3), (node4), (node5)                 \
> +  }
> +
>  #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
>                   "%02hhx%02hhx-%02hhx%02hhx-" \
>                   "%02hhx%02hhx-" \


