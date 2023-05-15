Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411D702F2D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:04:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYnc-0000of-4g; Mon, 15 May 2023 10:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyYnZ-0000mh-Ib
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:03:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyYnX-0007SG-Lp
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:03:37 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QKgwD0Ltyz6J6nV;
 Mon, 15 May 2023 21:59:24 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 15:03:31 +0100
Date: Mon, 15 May 2023 15:03:30 +0100
To: Fan Ni <fan.ni@samsung.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, 
 Adam Manzanares <a.manzanares@samsung.com>, "dave@stgolabs.net"
 <dave@stgolabs.net>, "nmtadam.samsung@gmail.com" <nmtadam.samsung@gmail.com>, 
 "nifan@outlook.com" <nifan@outlook.com>
Subject: Re: [RFC 3/7] hw/mem/cxl_type3: Add a parameter to pass number of
 DC regions the device supports in qemu command line
Message-ID: <20230515150330.000033d8@Huawei.com>
In-Reply-To: <20230511175609.2091136-4-fan.ni@samsung.com>
References: <20230511175609.2091136-1-fan.ni@samsung.com>
 <CGME20230511175641uscas1p13ee26532e3a1de36f6081f970190eeed@uscas1p1.samsung.com>
 <20230511175609.2091136-4-fan.ni@samsung.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 11 May 2023 17:56:40 +0000
Fan Ni <fan.ni@samsung.com> wrote:

> From: Fan Ni <nifan@outlook.com>
> 
> Add a property 'num-dc-regions' to ct3_props to allow users to create DC
> regions.
> With the change, users can control the number of DC regions the device
> supports.
> To make it easier, other parameters of the region like region base, length,
> and block size are hard coded. If desired, these parameters
> can be added easily.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>

Ok. This is fine for initial testing, but we need to figure out how to actually
handle DCD regions and how to back them with memory.
Probably a 3rd memory backend to cover all the DCD regions?
Default perhaps to an even spread of a few regions (no real point in doing
more than 2 for initial support, fall back to 1 region if size is too small).
We will want to be able to mess with regions from the FM-API but lots more to
do there before that matters and we can still have default config for any
regions we define now.

Jonathan

> ---
>  hw/mem/cxl_type3.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 2b483d3d8e..b9c375d9b4 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -684,6 +684,34 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
>      }
>  }
>  
> +/*
> + * Create a dc region to test "Get Dynamic Capacity Configuration" command.
> + */
> +static int cxl_create_toy_regions(CXLType3Dev *ct3d)
> +{
> +	int i;
> +	uint64_t region_base = ct3d->hostvmem?ct3d->hostvmem->size
> +		+ ct3d->hostpmem->size:ct3d->hostpmem->size;
> +	uint64_t region_len = 1024*1024*1024;
> +	uint64_t decode_len = 4; /* 4*256MB */
> +	uint64_t blk_size = 2*1024*1024;
> +	struct CXLDCD_Region *region;
> +
> +	for (i = 0; i < ct3d->dc.num_regions; i++) {
> +		region = &ct3d->dc.regions[i];
> +		region->base = region_base;
> +		region->decode_len = decode_len;
> +		region->len = region_len;
> +		region->block_size = blk_size;
> +		/* dsmad_handle is set when creating cdat table entries */
> +		region->flags = 0;
> +
> +		region_base += region->len;
> +	}
> +
> +	return 0;
> +}
> +
>  static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
>  {
>      DeviceState *ds = DEVICE(ct3d);
> @@ -752,6 +780,9 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
>          g_free(p_name);
>      }
>  
> +	if (cxl_create_toy_regions(ct3d))
> +		return false;
> +
>      return true;
>  }
>  
> @@ -1036,6 +1067,7 @@ static Property ct3_props[] = {
>      DEFINE_PROP_UINT64("sn", CXLType3Dev, sn, UI64_NULL),
>      DEFINE_PROP_STRING("cdat", CXLType3Dev, cxl_cstate.cdat.filename),
>      DEFINE_PROP_UINT16("spdm", CXLType3Dev, spdm_port, 0),
> +	DEFINE_PROP_UINT8("num-dc-regions", CXLType3Dev, dc.num_regions, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  


