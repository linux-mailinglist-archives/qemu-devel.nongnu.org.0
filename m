Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4E06EAA6A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:36:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppzX-0003lF-GV; Fri, 21 Apr 2023 08:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppzV-0003l0-1a
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:35:53 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppzT-0002ru-Cp
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:35:52 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2v9S3gRRz67m0K
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 20:34:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 13:35:46 +0100
Date: Fri, 21 Apr 2023 13:35:46 +0100
To: RAGHU H <raghuhack78@gmail.com>
CC: <qemu-devel@nongnu.org>
Subject: Re: Error : "cxl_pci 0000:0d:00.0: Failed to get interrupt for
 event Info log"
Message-ID: <20230421133546.000073e3@Huawei.com>
In-Reply-To: <CAGWUp4oHxtj69B=gCtUAS_Fp0p6=wBjK_gViYKRqwkVBteCdeQ@mail.gmail.com>
References: <CAGWUp4oHxtj69B=gCtUAS_Fp0p6=wBjK_gViYKRqwkVBteCdeQ@mail.gmail.com>
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

On Thu, 20 Apr 2023 18:07:40 +0530
RAGHU H <raghuhack78@gmail.com> wrote:

> Hello,
> 
> I am using qemu config listed in CXL documentation to emulate CXL device
> 
> 
> -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M
> \
> -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M
> \
> -object memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M
> \
> -object memory-backend-file,id=cxl-mem4,share=on,mem-path=/tmp/cxltest4.raw,size=256M
> \
> -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M
> \
> -object memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M
> \
> -object memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M
> \
> -object memory-backend-file,id=cxl-lsa4,share=on,mem-path=/tmp/lsa4.raw,size=256M
> \
> -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> -device pxb-cxl,bus_nr=222,bus=pcie.0,id=cxl.2 \
> -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
> -device cxl-rp,port=1,bus=cxl.1,id=root_port14,chassis=0,slot=3 \
> -device cxl-type3,bus=root_port14,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem1 \
> -device cxl-rp,port=0,bus=cxl.2,id=root_port15,chassis=0,slot=5 \
> -device cxl-type3,bus=root_port15,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem2 \
> -device cxl-rp,port=1,bus=cxl.2,id=root_port16,chassis=0,slot=6 \
> -device cxl-type3,bus=root_port16,memdev=cxl-mem4,lsa=cxl-lsa4,id=cxl-pmem3 \
> -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.targets.1=cxl.2,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=8k
> 
> Kernel logs show cxl_pci module error while setting up irq
> (cxl_event_irqsetup in drivers/cxl/pci.c)
> 
> cxl_pci 0000:0d:00.0: Failed to get interrupt for event Info log
> [    3.984800] cxl_pci 0000:e0:00.0: Failed to get interrupt for event Info log
> [    3.984841] cxl_pci 0000:df:00.0: Failed to get interrupt for event Info log
> 
> 
> Is this expected in an emulated environment?

Upstream QEMU? Or a version of my staging tree?

Upstream doesn't support events logs yet, so this may the outcome of that.
It missed the 8.0 cycle due to some problems with other series that I'd
based it on top of.  Hopefully will start to get those resolved shortly
and get as far as events support this cycle.

Thanks,

Jonathan

> 
> Regards
> Raghu


