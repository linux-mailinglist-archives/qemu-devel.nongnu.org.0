Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D2702E2C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:33:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXp1-00024x-Tz; Mon, 15 May 2023 09:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyXoq-0001xu-W5
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:00:53 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pyXom-0000XZ-PY
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:00:52 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QKfWd5sLTz6J6vH;
 Mon, 15 May 2023 20:56:29 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 14:00:37 +0100
Date: Mon, 15 May 2023 14:00:36 +0100
To: Fan Ni <fan.ni@samsung.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, 
 Adam Manzanares <a.manzanares@samsung.com>, "dave@stgolabs.net"
 <dave@stgolabs.net>, "nmtadam.samsung@gmail.com" <nmtadam.samsung@gmail.com>, 
 "nifan@outlook.com" <nifan@outlook.com>, <navneet.singh@intel.com>
Subject: Re: [Qemu RFC 0/7] Early enabling of DCD emulation in Qemu
Message-ID: <20230515140036.00003301@Huawei.com>
In-Reply-To: <20230511175609.2091136-1-fan.ni@samsung.com>
References: <CGME20230511175641uscas1p2b1877f9179709b69e293acdd7e57104c@uscas1p2.samsung.com>
 <20230511175609.2091136-1-fan.ni@samsung.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01,
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

> Since the early draft of DCD support in kernel is out
> (https://lore.kernel.org/linux-cxl/20230417164126.GA1904906@bgt-140510-bm03/T/#t),
> this patch series provide dcd emulation in qemu so people who are interested
> can have an early try. It is noted that the patch series may need to be updated
> accordingly if the kernel side implementation changes.
> 
> To support DCD emulation, the patch series add DCD related mailbox command
> support (CXL Spec 3.0: 8.2.9.8.9), and extend the cxl type3 memory device
> with dynamic capacity extent and region representative.
> To support read/write to the dynamic capacity of the device, a host backend
> is provided and necessary check mechnism is added to ensure the dynamic
> capacity accessed is backed with active dc extents.
> Currently FM related mailbox commands (cxl spec 3.0: 7.6.7.6) is not supported
> , but we add two qmp interfaces for adding/releasing dynamic capacity extents.
> Also, the support for multiple hosts sharing the same DCD case is missing.
> 
> Things we can try with the patch series together with kernel dcd code:
> 1. Create DC regions to cover the address range of the dynamic capacity
> regions.
> 2. Add/release dynamic capacity extents to the device and notify the
> kernel.
> 3. Test kernel side code to accept added dc extents and create dax devices,
> and release dc extents and notify the device
> 4. Online the memory range backed with dc extents and let application use
> them.
> 
> The patch series is based on Jonathan's local qemu branch:
> https://gitlab.com/jic23/qemu/-/tree/cxl-2023-02-28
> 
> Simple tests peformed with the patch series:
> 1 Install cxl modules:
> 
> modprobe -a cxl_acpi cxl_core cxl_pci cxl_port cxl_mem
> 
> 2 Create dc regions:
> 
> region=$(cat /sys/bus/cxl/devices/decoder0.0/create_dc_region)
> echo $region> /sys/bus/cxl/devices/decoder0.0/create_dc_region
> echo 256 > /sys/bus/cxl/devices/$region/interleave_granularity
> echo 1 > /sys/bus/cxl/devices/$region/interleave_ways
> echo "dc" >/sys/bus/cxl/devices/decoder2.0/mode
> echo 0x10000000 >/sys/bus/cxl/devices/decoder2.0/dpa_size
> echo 0x10000000 > /sys/bus/cxl/devices/$region/size
> echo  "decoder2.0" > /sys/bus/cxl/devices/$region/target0
> echo 1 > /sys/bus/cxl/devices/$region/commit
> echo $region > /sys/bus/cxl/drivers/cxl_region/bind
> 
> /home/fan/cxl/tools-and-scripts# cxl list
> [
>   {
>     "memdevs":[
>       {
>         "memdev":"mem0",
>         "pmem_size":536870912,
>         "ram_size":0,
>         "serial":0,
>         "host":"0000:0d:00.0"
>       }
>     ]
>   },
>   {
>     "regions":[
>       {
>         "region":"region0",
>         "resource":45365592064,
>         "size":268435456,
>         "interleave_ways":1,
>         "interleave_granularity":256,
>         "decode_state":"commit"
>       }
>     ]
>   }
> ]
> 
> 3 Add two dc extents (128MB each) through qmp interface
> 
> { "execute": "qmp_capabilities" }
> 
> { "execute": "cxl-add-dynamic-capacity-event",
> 	"arguments": {
> 		 "path": "/machine/peripheral/cxl-pmem0",
> 		"region-id" : 0,
> 		 "num-extent": 2,
> 		"dpa":0,
> 		"extent-len": 128
> 	}
> }
> 
> /home/fan/cxl/tools-and-scripts# lsmem
> RANGE                                  SIZE   STATE REMOVABLE   BLOCK
> 0x0000000000000000-0x000000007fffffff    2G  online       yes    0-15
> 0x0000000100000000-0x000000027fffffff    6G  online       yes   32-79
> 0x0000000a90000000-0x0000000a9fffffff  256M offline           338-339
> 
> Memory block size:       128M
> Total online memory:       8G
> Total offline memory:    256M
> 
> 
> 4.Online the momory with 'daxctl online-memory dax0.0' to online the memory
> 
> /home/fan/cxl/ndctl# ./build/daxctl/daxctl online-memory dax0.0
> [  230.730553] Fallback order for Node 0: 0 1
> [  230.730825] Fallback order for Node 1: 1 0
> [  230.730953] Built 2 zonelists, mobility grouping on.  Total pages: 2042541
> [  230.731110] Policy zone: Normal
> onlined memory for 1 device
> 
> root@bgt-140510-bm03:/home/fan/cxl/ndctl# lsmem
> RANGE                                  SIZE   STATE REMOVABLE BLOCK
> 0x0000000000000000-0x000000007fffffff    2G  online       yes  0-15
> 0x0000000100000000-0x000000027fffffff    6G  online       yes 32-79
> 0x0000000a90000000-0x0000000a97ffffff  128M  online       yes   338
> 0x0000000a98000000-0x0000000a9fffffff  128M offline             339
> 
> Memory block size:       128M
> Total online memory:     8.1G
> Total offline memory:    128M
> 
> 5 using dc extents as regular memory
> 
> /home/fan/cxl/ndctl# numactl --membind=1 ls
> CONTRIBUTING.md  README.md  clean_config.sh  cscope.out   git-version-gen
> ndctl	       scripts	test.h      version.h.in COPYING		 acpi.h
> config.h.meson   cxl	  make-git-snapshot.sh	ndctl.spec.in  sles	tools
> Documentation	 build	    contrib	     daxctl	  meson.build		rhel
> tags	topology.png LICENSES	 ccan	    cscope.files
> git-version  meson_options.txt	rpmbuild.sh    test	util
> 
> 
> QEMU command line cxl configuration:
> 
> RP1="-object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=512M \
> -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=512M \
> -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=512M \
> -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,dc-memdev=cxl-mem2,id=cxl-pmem0,num-dc-regions=1\
> -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=8k"
> 
> 
> Kernel DCD support used to test the changes
> 
> The code is tested with the posted kernel dcd support:
> https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/log/?h=for-6.5/dcd-preview
> 

Very nice!  +CC Navneet who may want to comment on the below (and the
emulation as well)

I've not had a chance to look at the code on the kernel side yet.


> commit: f425bc34c600e2a3721d6560202962ec41622815
> 
> To make the test work, we have made the following changes to the above kernel commit:
> 
> diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> index 5f04bbc18af5..5f421d3c5cef 100644
> --- a/drivers/cxl/core/mbox.c
> +++ b/drivers/cxl/core/mbox.c
> @@ -68,6 +68,7 @@ static struct cxl_mem_command cxl_mem_commands[CXL_MEM_COMMAND_ID_MAX] = {
>  	CXL_CMD(SCAN_MEDIA, 0x11, 0, 0),
>  	CXL_CMD(GET_SCAN_MEDIA, 0, CXL_VARIABLE_PAYLOAD, 0),
>  	CXL_CMD(GET_DC_EXTENT_LIST, 0x8, CXL_VARIABLE_PAYLOAD, 0),
> +	CXL_CMD(GET_DC_CONFIG, 0x2, CXL_VARIABLE_PAYLOAD, 0),
>  };
>  
>  /*
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index 291c716abd49..ae10e3cf43a1 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -194,7 +194,7 @@ static int cxl_region_manage_dc(struct cxl_region *cxlr)
>  		}
>  		cxlds->dc_list_gen_num = extent_gen_num;
>  		dev_dbg(cxlds->dev, "No of preallocated extents :%d\n", rc);
> -		enable_irq(cxlds->cxl_irq[CXL_EVENT_TYPE_DCD]);
> +		/*enable_irq(cxlds->cxl_irq[CXL_EVENT_TYPE_DCD]);*/

Some race condition that means we need to enable the DCD event earlier?

>  	}
>  	return 0;
>  err:
> @@ -2810,7 +2810,8 @@ int cxl_add_dc_extent(struct cxl_dev_state *cxlds, struct resource *alloc_dpa_re
>  				dev_dax->align, memremap_compat_align()))) {
>  		rc = alloc_dev_dax_range(dev_dax, hpa,
>  					resource_size(alloc_dpa_res));
> -		return rc;
> +		if (rc)
> +			return rc;

No idea on this one as it's in the code I haven't looked at yet!

>  	}
>  
>  	rc = xa_insert(&cxlr_dc->dax_dev_list, hpa, dev_dax, GFP_KERNEL);
> diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> index 9e45b1056022..653bec203838 100644
> --- a/drivers/cxl/pci.c
> +++ b/drivers/cxl/pci.c
> @@ -659,7 +659,7 @@ static int cxl_event_irqsetup(struct cxl_dev_state *cxlds)
>  
>  	/* Driver enables DCD interrupt after creating the dc cxl_region */
>  	rc = cxl_event_req_irq(cxlds, policy.dyncap_settings, CXL_EVENT_TYPE_DCD,
> -					IRQF_SHARED | IRQF_ONESHOT | IRQF_NO_AUTOEN);
> +					IRQF_SHARED | IRQF_ONESHOT);

This will be otherside of the removal of the enable above.

>  	if (rc) {
>  		dev_err(cxlds->dev, "Failed to get interrupt for event dc log\n");
>  		return rc;
> diff --git a/include/uapi/linux/cxl_mem.h b/include/uapi/linux/cxl_mem.h
> index 6ca85861750c..910a48259239 100644
> --- a/include/uapi/linux/cxl_mem.h
> +++ b/include/uapi/linux/cxl_mem.h
> @@ -47,6 +47,7 @@
>  	___C(SCAN_MEDIA, "Scan Media"),                                   \
>  	___C(GET_SCAN_MEDIA, "Get Scan Media Results"),                   \
>  	___C(GET_DC_EXTENT_LIST, "Get dynamic capacity extents"),         \
> +	___C(GET_DC_CONFIG, "Get dynamic capacity configuration"),         \
>  	___C(MAX, "invalid / last command")
>  
>  #define ___C(a, b) CXL_MEM_COMMAND_ID_##a
> 
> 
> 
> Fan Ni (7):
>   hw/cxl/cxl-mailbox-utils: Add dc_event_log_size field to output
>     payload of identify memory device command
>   hw/cxl/cxl-mailbox-utils: Add dynamic capacity region representative
>     and mailbox command support
>   hw/mem/cxl_type3: Add a parameter to pass number of DC regions the
>     device supports in qemu command line
>   hw/mem/cxl_type3: Add DC extent representative to cxl type3 device
>   hw/cxl/cxl-mailbox-utils: Add mailbox commands to support add/release
>     dynamic capacity response
>   Add qmp interfaces to add/release dynamic capacity extents
>   hw/mem/cxl_type3: add read/write support to dynamic capacity
> 
>  hw/cxl/cxl-mailbox-utils.c  | 389 +++++++++++++++++++++++++++-
>  hw/mem/cxl_type3.c          | 492 +++++++++++++++++++++++++++++++-----
>  include/hw/cxl/cxl_device.h |  50 +++-
>  include/hw/cxl/cxl_events.h |  16 ++
>  qapi/cxl.json               |  44 ++++
>  5 files changed, 924 insertions(+), 67 deletions(-)
> 


