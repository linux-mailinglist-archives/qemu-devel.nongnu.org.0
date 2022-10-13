Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8B5FDCDD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:10:41 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oizr6-0002dt-P0
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oizpg-0008Qf-K4
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:09:12 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oizpc-0000Tl-DO
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:09:12 -0400
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MpCYX4Jvsz68735;
 Thu, 13 Oct 2022 23:07:28 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 17:09:04 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 16:09:03 +0100
Date: Thu, 13 Oct 2022 16:09:02 +0100
To: Viacheslav A.Dubeyko <viacheslav.dubeyko@bytedance.com>
CC: Adam Manzanares <a.manzanares@samsung.com>, Cong Wang
 <cong.wang@bytedance.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>
Subject: Re: CXL emulation in QEMU contribution
Message-ID: <20221013160902.00001c32@huawei.com>
In-Reply-To: <31569DD4-6502-4188-8962-08E0A15B08FF@bytedance.com>
References: <20221011095228.00001546@huawei.com>
 <31569DD4-6502-4188-8962-08E0A15B08FF@bytedance.com>
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

On Wed, 12 Oct 2022 15:43:35 -0700
"Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com> wrote:

> Hi Jonathan,

Hi Slava,

Thanks for sending this.
> 
> As we agreed, I am moving our discussion into public mailing list.
> 

> So, I would like to contribute to QEMU emulation of CXL memory
> support. And I would like to see a TODO list. I hope this list could
> be useful not only for me. As far as I can see, we can summarize:

Absolutely agree on need for a TODO now there are multiple groups involved.
https://gitlab.com/jic23/qemu/-/wikis/TODO-list
is my starting point on this on basis a wiki is a cheap and cheerful way
to track this.

> 

> 1) Moving towards emulation of everything we need for Dynamic Capacity.
>   a) Switch CCI - have a PoC but not yet doing tunneling to Type 3 EPs.

See below. Initial support pushed out to gitlab. Doesn't do much yet beyond
walk some basic info for a static switch.

>   b) Userspace tool to fake enough FM role that we can drive dynamics 

Currently I'm using the IOCTL path used by the cxl tool in ndctl.
I would definitely not describe my test program as 'good userspace code'
though :)

>   c) Also need to do CXL 2.0 style HP of LDs on MLD devices (some demand
>   for this to driver virtualization migration usecases)
>   d) DCD implementation etc on the type 3 device.

May want to do this on multiport devices first. 

> 2) Lots of smaller features from CXL 3.0 such as setting up BI.
> 3) Enough to test P2P UIO flows - probably need to invent an accelerator
>   with appropriate support to test that - DMA engine or similar.
> 4) Bunch of small features:
>   a) Multiple HDM decoders.

This is a fairly urgent feature to test mixed volatile / non volatile stuff
using Gregory Price's emulation of volatile for the type 3 device.

>   b) Poisoning.  Right now we have prototype, but it's not wired up
> to actually report poison on reads.

The command handling stuff is on the tree below, but this needs exploring
on qemu side. I'm not even sure what 'poison' would look like.

>   c) CXL non-function map DVSEC. Given QEMU lets you add any function
> to a given device by just setting  the bus to be the same as another,
> this is a bit fiddly because we need to updated it late in the QEMU
> bring up, or possibly easier to do it at read time (that may well be
> easier).

This one should be a fairly small task for anyone interested.  Not super
high priority though as kernel driver doesn't care yet ;)

>   d) Most useful of all, but most boring perhaps is review of what's
> already waiting for upstreaming.

For this one I've pushed out what I currently have queued up.
https://gitlab.com/jic23/qemu/-/commits/cxl-2022-10-13

I'll also add that stuff to the todo list
I'm aware of two other series that have been posted.

> 
> Please, correct me if I miss something. I believe we need to have a
> TODO list to collaborate efficiently. Any ideas what else can be added into TODO list?

More error injection to support David Jiang's patch set testing.
Also, rather tangential to the rest but can wire up UEFI CPER record
reporting as well to test Smita Koralahalli's series.  I have old code
for doing that on aRM 64.

Also fairly high on what matters to me is arm64 support via DT to hopefully
help us get the arm-virt support upstream.  That's my daily test
platform so I'd rather not maintain it out of tree forever!

If anyone wants access to edit the page, DM me a registered gitlab ID and
I'll you to the project.

Jonathan

> 
> Thanks,
> Slava. 
> 

