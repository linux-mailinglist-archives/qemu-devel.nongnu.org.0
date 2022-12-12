Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F784649C42
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4g7o-0005Af-7S; Mon, 12 Dec 2022 05:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p4g7e-00058a-9j
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:33:24 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p4g7c-0006UU-36
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:33:22 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NVyY15MPZz6HJZG;
 Mon, 12 Dec 2022 18:29:25 +0800 (CST)
Received: from localhost (10.195.246.54) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 10:33:02 +0000
Date: Mon, 12 Dec 2022 10:33:01 +0000
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <ben.widawsky@intel.com>, <philmd@linaro.org>
Subject: Re: [PATCH 2/5] include/hw/cxl: Include hw/cxl/*.h where needed
Message-ID: <20221212103301.00005bfa@Huawei.com>
In-Reply-To: <20221209134802.3642942-3-armbru@redhat.com>
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-3-armbru@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.246.54]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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

On Fri,  9 Dec 2022 14:47:59 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> hw/cxl/cxl_component.h needs CDATObject from hw/cxl/cxl_cdat.h.
> 
> hw/cxl/cxl_device.h needs CXLComponentState from
> hw/cxl/cxl_component.h.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks,

> ---
>  include/hw/cxl/cxl_component.h | 1 +
>  include/hw/cxl/cxl_device.h    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
> index 34075cfb72..5dca21e95b 100644
> --- a/include/hw/cxl/cxl_component.h
> +++ b/include/hw/cxl/cxl_component.h
> @@ -18,6 +18,7 @@
>  #include "qemu/compiler.h"
>  #include "qemu/range.h"
>  #include "qemu/typedefs.h"
> +#include "hw/cxl/cxl_cdat.h"
>  #include "hw/register.h"
>  #include "qapi/error.h"
>  
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index fd475b947b..3f91969db0 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -10,6 +10,7 @@
>  #ifndef CXL_DEVICE_H
>  #define CXL_DEVICE_H
>  
> +#include "hw/cxl/cxl_component.h"
>  #include "hw/pci/pci.h"
>  #include "hw/register.h"
>  


