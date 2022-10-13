Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608025FD6D6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:17:09 +0200 (CEST)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiuKy-0006Jv-F0
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiu2R-0000EO-Sc
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:58:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiu2N-0000cD-Uj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:57:59 -0400
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mp3Hj6dH3z689q0;
 Thu, 13 Oct 2022 16:54:57 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 10:57:50 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 09:57:50 +0100
Date: Thu, 13 Oct 2022 09:57:49 +0100
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <gregory.price@memverge.com>, <mst@redhat.com>, <hchkuo@avery-design.com.tw>, 
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [PATCH v7 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Message-ID: <20221013095749.0000052d@huawei.com>
In-Reply-To: <20221012182120.174142-1-gregory.price@memverge.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
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

On Wed, 12 Oct 2022 14:21:15 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> Included in this response is a recommended patch set on top of this
> patch that resolves a number of issues, including style and a heap
> corruption bug.
> 
> The purpose of this patch set is to refactor the CDAT initialization
> code to support future patch sets that will introduce multi-region
> support in CXL Type3 devices.
> 
> 1) Checkpatch errors in the immediately prior patch
> 2) Flatting of code in cdat initialization
> 3) Changes in allocation and error checking for cleanliness
> 4) Change in the allocation/free strategy of CDAT sub-tables to simplify
>    multi-region allocation in the future.  Also resolves a heap
>    corruption bug
> 5) Refactor of CDAT initialization code into a function that initializes
>    sub-tables per memory-region.
> 
> Gregory Price (5):
>   hw/mem/cxl_type3: fix checkpatch errors
>   hw/mem/cxl_type3: Pull validation checks ahead of functional code
>   hw/mem/cxl_type3: CDAT pre-allocate and check resources prior to work
>   hw/mem/cxl_type3: Change the CDAT allocation/free strategy
>   hw/mem/cxl_type3: Refactor CDAT sub-table entry initialization into a
>     function
> 
>  hw/mem/cxl_type3.c | 240 +++++++++++++++++++++++----------------------
>  1 file changed, 122 insertions(+), 118 deletions(-)
> 

Thanks, I'm going to roll this stuff into the original patch set for v8.
Some of this I already have (like the check patch stuff).
Some I may disagree with in which case  I'll reply to the patches - note
I haven't looked at them in detail yet!

Jonathan

