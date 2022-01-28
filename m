Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9A49FF9A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:34:50 +0100 (CET)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDV96-0001po-Vz
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDV4T-0006a7-Tg
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:30:02 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDV4P-0007tt-77
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:29:59 -0500
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Jlkrn6SWfz67ydC;
 Sat, 29 Jan 2022 01:26:17 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 28 Jan 2022 18:29:52 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 17:29:51 +0000
Date: Fri, 28 Jan 2022 17:29:50 +0000
To: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali Kolothum
 Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe =?ISO-8859-1?Q?Mat?=
 =?ISO-8859-1?Q?hieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 27/42] hw/cxl/device: Implement get/set Label Storage
 Area (LSA)
Message-ID: <20220128172950.00004ddc@huawei.com>
In-Reply-To: <20220124171705.10432-28-Jonathan.Cameron@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-28-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 24 Jan 2022 17:16:50 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> From: Ben Widawsky <ben.widawsky@intel.com>
> 
> Implement get and set handlers for the Label Storage Area
> used to hold data describing persistent memory configuration
> so that it can be ensured it is seen in the same configuration
> after reboot.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c  | 54 +++++++++++++++++++++++++++++++++++
>  hw/mem/cxl_type3.c          | 56 ++++++++++++++++++++++++++++++++++++-
>  include/hw/cxl/cxl_device.h |  5 ++++
>  3 files changed, 114 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 4009152b7e..0df2a8492a 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -55,6 +55,8 @@ enum {
>          #define MEMORY_DEVICE 0x0
>      CCLS        = 0x41,
>          #define GET_PARTITION_INFO     0x0
> +        #define GET_LSA       0x2
> +        #define SET_LSA       0x3
>  };
>  
>  /* 8.2.8.4.5.1 Command Return Codes */
> @@ -136,8 +138,11 @@ declare_mailbox_handler(LOGS_GET_SUPPORTED);
>  declare_mailbox_handler(LOGS_GET_LOG);
>  declare_mailbox_handler(IDENTIFY_MEMORY_DEVICE);
>  declare_mailbox_handler(CCLS_GET_PARTITION_INFO);
> +declare_mailbox_handler(CCLS_GET_LSA);
> +declare_mailbox_handler(CCLS_SET_LSA);
>  
>  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> +#define IMMEDIATE_DATA_CHANGE (1 << 1)
Notice whilst reworking this code to drop the macro compexity.
This should be (1 << 2) I think as it is bit 2 in the CEL.

>  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
>  #define IMMEDIATE_LOG_CHANGE (1 << 4)
>  

