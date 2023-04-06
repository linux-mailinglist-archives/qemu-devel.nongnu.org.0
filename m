Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842B76D943F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:37:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMz8-0002H0-40; Thu, 06 Apr 2023 06:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pkMz2-0002FG-Gp
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:36:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pkMz0-00048s-2d
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:36:48 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PsdFP1M4vz687PR
 for <qemu-devel@nongnu.org>; Thu,  6 Apr 2023 18:35:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Apr
 2023 11:36:41 +0100
Date: Thu, 6 Apr 2023 11:36:40 +0100
To: Raghu H <raghuhack78@gmail.com>
CC: <maverickk1778@gmail.com>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH] docs:remove cxl3 device size
Message-ID: <20230406113640.0000277c@Huawei.com>
In-Reply-To: <20230405102738.2062169-1-raghuhack78@gmail.com>
References: <20230405102738.2062169-1-raghuhack78@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

On Wed,  5 Apr 2023 15:57:38 +0530
Raghu H <raghuhack78@gmail.com> wrote:
Hi Raghu,

Thanks for tidying this up! (and reporting it in the first place)
A few minor comments for v2.


A better title might be
docs/cxl: Remove incorrect CXL type 3 size parameter.

> cxl device typ3 size is read from the memory backend device, removing the

cxl-type3 memory size is read directly from the provided memory backed end device.
Remove non existent size option.

> size option specified in cxl sample command.
> 
> Updating sample command to reflect target architecture as x86_64.

There are two changes in here.  Please split it into two patches and
add a minimal cover letter (mostly as it gives a place for people to
respond to both of them with tags etc).

> 
> Signed-off-by: Raghu H <raghuhack78@gmail.com>
> ---
>  docs/system/devices/cxl.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index f25783a4ec..b228146cec 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -302,7 +302,7 @@ Example command lines
>  ---------------------
>  A very simple setup with just one directly attached CXL Type 3 device::
>  
> -  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
> +  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \

Minimize the change (and definitely don't tell people to use kvm as that's broken for
some usecases - instructions in CXL memory).

+ qemu-system-x86_64 -M q35,cxl=on -m 4G,maxmem=8G,slots=8 \
is probably the right combination (I tidied up the g / G mix whilst touching the line.

>    ...
>    -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
>    -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
> @@ -315,7 +315,7 @@ A setup suitable for 4 way interleave. Only one fixed window provided, to enable
>  interleave across 2 CXL host bridges.  Each host bridge has 2 CXL Root Ports, with
>  the CXL Type3 device directly attached (no switches).::
>  
> -  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
> +  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
>    ...
>    -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
>    -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
> @@ -339,7 +339,7 @@ the CXL Type3 device directly attached (no switches).::
>  
>  An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
>  
> -  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
> +  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
>    ...
>    -object memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
>    -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M \
> @@ -354,13 +354,13 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
>    -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
>    -device cxl-upstream,bus=root_port0,id=us0 \
>    -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
> -  -device cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
> +  -device cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0 \
>    -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
> -  -device cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
> +  -device cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1 \
>    -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
> -  -device cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
> +  -device cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2 \
>    -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
> -  -device cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
> +  -device cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3 \
>    -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
>  
>  Kernel Configuration Options


