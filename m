Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B05FA11F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:29:54 +0200 (CEST)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuj4-00045v-05
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohuXo-0006ng-NS
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:18:18 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohuXm-0004zC-F9
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:18:16 -0400
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MmMt65Lshz67Xf1;
 Mon, 10 Oct 2022 23:15:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 17:18:10 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 16:18:10 +0100
Date: Mon, 10 Oct 2022 16:18:09 +0100
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, Alison Schofield
 <alison.schofield@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>, Ben Widawsky
 <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221010161809.00006f8e@huawei.com>
In-Reply-To: <CAD3UvdT1ZHJDaqj05C+n7t4rM7yhjZyM6fooXAfG12rAYnBqmw@mail.gmail.com>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com> <Yz8QlQ9yLFrWxWsN@fedora>
 <CAD3UvdT1ZHJDaqj05C+n7t4rM7yhjZyM6fooXAfG12rAYnBqmw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri, 7 Oct 2022 10:50:12 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> Now that i've had some time to look at the spec, the DVSEC CXL Capability
> register (8.1.3.1 in 3.0 spec)
> only supports enabling two HDM ranges at the moment, which to me means we
> should implement
> 
> memdev0=..., memdev1=...

That needs to work (for backwards compatibility)
but doesn't need to be the most optimal mapping.  So you could have
two HDM ranges defined, but if your software is clever enough to
use the CXL 2.0 infrastructure you can have more (Linux is).

> 
> Yesterday I pushed a patch proposal that separated the regions into
> persistent and volatile, but
> i had discovered that there isn't a good way (presently) to determine of a
> MemoryBacking object
> is both file File-type AND has pmem=true, meaning we'd have to either
> expose that interface
> (this seems dubious to me) or do the following:
Whilst there are good usecases for using actual volatile and non volatile
for the backends, I don't think we want to enforce that as it should
'work' with whatever backends are used.
> 
> memdev0=mem0,memdev0-pmem=true,memdev1=mem0,memdev0-pmem=false
> 
> and then simply store a bit for each hostmem region accordingly to report
> pmem/volatile.
> This would allow the flexibility for the backing device to be whatever the
> user wants while
> still being able to mark the behavior of the type-3 device as pmem or
> volatile.  Alternatively
> we could make `memdev0-type=` and allow for new types in the future I
> suppose.
> 
That was why I had one suggestion of just supporting two memdevs.

memdev-volatile and memdev-nonvolatile but then messing with whether the
whole memdev was presented depending on the set partition.  I'm increasingly
thinking that is the least ugly solution.  + until we implement set partition
along with a control on maximum size of partitionable region, we can
just use a pair of memdevs to provide all the information needed to emulate
the devices.

> The one thing I'm a bit confused on - the Media_type and Memory_Class
> fields in the DVSEC
> CXL Range registers (8.1.3.8.2).  Right now they're set to "010b" = Memory
> Characteristics
> are communicated via CDAT".  Do the devices presently emulate this? I'm
> finding it hard to pick
> apart the code to identify it.

Not upstream yet.

Patches on list + can be found at

https://gitlab.com/jic23/qemu/-/commits/cxl-2022-10-09
There are a few messy corners in that tree but it should work. I'll be
pushing out a new version in a few days.

I updated that in latest version to build the tables based on the
memdev provided.  We'll want to add the volatile support to that alongside
your patch.

Jonathan


