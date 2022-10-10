Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9605FA204
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 18:32:31 +0200 (CEST)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohvhb-0002hS-Ss
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 12:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohvbd-0004mN-QB
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 12:26:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohvbb-0000wu-MC
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 12:26:17 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MmPQ12wdgz67H19;
 Tue, 11 Oct 2022 00:24:41 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 18:26:12 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 17:26:12 +0100
Date: Mon, 10 Oct 2022 17:26:11 +0100
To: Gregory Price <gregory.price@memverge.com>
CC: Gregory Price <gourry.memverge@gmail.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, "a.manzanares@samsung.com"
 <a.manzanares@samsung.com>, Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221010172611.00007f61@huawei.com>
In-Reply-To: <Y0Q4JWa6hddtHIcO@memverge.com>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com> <Yz8QlQ9yLFrWxWsN@fedora>
 <20221010154343.00007afd@huawei.com>
 <Y0Q4JWa6hddtHIcO@memverge.com>
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

On Mon, 10 Oct 2022 11:20:05 -0400
Gregory Price <gregory.price@memverge.com> wrote:

> > > 
> > > Maybe we should consider 2 new options:
> > > --persistent-memdevs=pm1 pm2 pm3
> > > --volatile-memdevs=vm1 vm2 vm3
> > > 
> > > etc, and deprecate --memdev, and go with your array of memdevs idea.
> > > 
> > > I think I could probably whip that up in a day or two.  Thoughts?  
> > 
> > I wonder if we care to emulate beyond 1 volatile and 1 persistent.
> > Sure devices might exist, but if we can exercise all the code paths
> > with a simpler configuration, perhaps we don't need to handle the
> > more complex ones?
> > 
> > The sticky corner here is Set Partition Info 
> > CXL r3.0 8.2.9.8.2.1
> > 
> > Separation between volatile and non volatile is configurable at runtime.
> >   
> 
> Set Partition Info (Opcode 4101h)
> ... snip ... Paritionable capacity is equal to
> (total capacity - (volatile-only) - (persistent-only))
> 
> By definition, volatile backed memory can only contain volatile regions.
> That's simple.

I guess that's a reasonable model for the QEMU command line.

> 
> For persistent-backed memory, capacity can be chopped up (iif Identify
> Memory Device reports Paritition Alignment to be non-zero).
> 
> --persistent-memdev=pmem-backing
> --volatile-memdev=vmem-backing
> 
> By default, maybe we should make the entire size of persistent regions
> to be persistent-only for the initial prototype. 

Agreed.  Partitioning wasn't high on my todo list though maybe it is
for others...


> This would let us
> merge without support for Set Partition Info.  Then add an additional
> argument to enable additional argument to set the partition alignment.
> 
> --partitionable-pmem=
>   : Defaults to 0. If non-zero, up to N XBytes of PMem may be
>     used as vmem by the operating system at runtime.
> 
> On the CXL tool side we should then see the following output for these
> settings:
> 
> --persistent-memdev=pmem0     1GB
> --volatile-memdev=vmem0       1GB
> --partitionable-pmem=512M
> 
> Capacities:
> ----------------
> Total Capacity: 2GB
> Volatile Capacity: 1GB
> Persistent Capacity: 1GB
> Partitionable Capacity: 512MB
> Partitioned Memory: 0MB
> 
> Available Memory:
> -----------------
> Volatile Memory: 1GB
> Persistent Memory: 1GB
> 
> 
> Then Run something along the lines of:
> `cxl partition-pmem 512MB`   (or whatever args are needed)
> 
> 
> Capacities:
> ----------------
> Total Capacity: 2GB
> Volatile Capacity: 1GB
> Persistent Capacity: 1GB
> Partitionable Capacity: 512MB
> Partitioned Memory: 512MB
> 
> Available Memory:
> -----------------
> Volatile Memory: 1.5GB
> Persistent Memory: 512MB
> 
> 
> Thoughts?

Looks good to me.  Alison, I think you were looking at the partitioning stuff...
What do you think of this?

Jonathan



