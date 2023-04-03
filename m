Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E76D40F3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 11:43:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjGiC-0000nV-7e; Mon, 03 Apr 2023 05:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pjGi1-0000nD-5C
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:42:41 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pjGhx-0002CS-HS
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 05:42:40 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PqmBG4DXJz67ZCr
 for <qemu-devel@nongnu.org>; Mon,  3 Apr 2023 17:41:42 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 3 Apr
 2023 10:42:26 +0100
Date: Mon, 3 Apr 2023 10:42:26 +0100
To: Maverickk 78 <maverickk1778@gmail.com>
CC: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: property 'cxl-type3.size' not found
Message-ID: <20230403104226.00001637@Huawei.com>
In-Reply-To: <CALfBBTuGSPYE_HV1ns_9T_Ud3BEAajhN2ivMCJ37f+hC1XOy+w@mail.gmail.com>
References: <CALfBBTuGSPYE_HV1ns_9T_Ud3BEAajhN2ivMCJ37f+hC1XOy+w@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
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

On Mon, 3 Apr 2023 14:34:33 +0530
Maverickk 78 <maverickk1778@gmail.com> wrote:

> Hello,
> 
> I am trying qemu-system-aarch64 & cxl configuration listed in
> 
> https://www.qemu.org/docs/master/system/devices/cxl.html
> 
> qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8
> -cpu max \
> ...
> -object
> memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M
> \
> -object
> memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M
> \
> -object
> memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M
> \
> -object
> memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M
> \
> -object
> memory-backend-file,id=cxl-lsa0,share=on,mem-path=/tmp/lsa0.raw,size=256M \
> -object
> memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa1.raw,size=256M \
> -object
> memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M \
> -object
> memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M \
> -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> -device cxl-rp,port=0,bus=cxl.1,id=root_port0,chassis=0,slot=0 \
> -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
> -device cxl-upstream,bus=root_port0,id=us0 \
> -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
> -device
> cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
> -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
> -device
> cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
> -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
> -device
> cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
> -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
> -device
> cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
> -M
> cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
> 
> 
> 
> I hit this following error
> qemu-system-aarch64: -device
> cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M:
> property 'cxl-type3.size' not found
> 
> 
> Any clue if I am missing something?

Looks like docs have slipped behind current state. Size isn't needed for the memdev
any more as can be established from the memory backend and there isn't a reason
why they'd ever be different (there was in a much earlier version).

There is a known bigger issue with those docs which is that they got cherry picked
from a series that included ARM support but arm support hasn't landed yet
(and will be a while due to need for DT support).

I'll look at fixing both issues up. Or if you want to send a patch Raghu that would
be even better!

Jonathan

> 
> 
> Regards
> 


