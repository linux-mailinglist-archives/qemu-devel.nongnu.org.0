Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D85FB9D2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 19:40:34 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiJF3-00010f-Mr
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 13:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiJ3z-0002nt-Q1
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 13:29:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiJ3w-0004Ph-Tz
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 13:29:07 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mn2m004pbz6893p;
 Wed, 12 Oct 2022 01:27:28 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 19:29:01 +0200
Received: from localhost (10.81.205.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 18:29:00 +0100
Date: Tue, 11 Oct 2022 18:28:58 +0100
To: Gregory Price <gregory.price@memverge.com>
CC: Davidlohr Bueso <dave@stgolabs.net>, Gregory Price
 <gourry.memverge@gmail.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, Alison Schofield <alison.schofield@intel.com>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>, Ben Widawsky
 <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221011182858.00005215@huawei.com>
In-Reply-To: <Y0WmYNcVHhVHeyH+@memverge.com>
References: <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com> <Yz8QlQ9yLFrWxWsN@fedora>
 <CAD3UvdT1ZHJDaqj05C+n7t4rM7yhjZyM6fooXAfG12rAYnBqmw@mail.gmail.com>
 <20221010161809.00006f8e@huawei.com>
 <Y0Q5a2Wx3qFB2eKI@memverge.com> <Y0TFg6198AHKjfux@memverge.com>
 <20221011171438.fwlgobgaegns3p7t@offworld>
 <Y0WmYNcVHhVHeyH+@memverge.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.205.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
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

On Tue, 11 Oct 2022 13:22:40 -0400
Gregory Price <gregory.price@memverge.com> wrote:

> I'll push the patches to qemu-cxl and linux-cxl today or tomorrow, I
> wanted to get them into a state on gitlab for Jonathan to rebase and
> merge into his work.  He'll likely end up pushing the entire series at
> the end of the day.
> 
> Will update the tests/docs accordingly.
> 
> re: changelog - i'm new to mailing list contributions, where would these
> go exactly?

Two places - in the cover letter, and under the ---
in the individual patches.  

At this stage I'm not super fussed by tests because there won't be
anything visible beyond 'does it crash'.  Don't think we will be affecting
the ACPI table test results for example.  Good to change to the proposed
new command line for persistent memdev though.

Definitely good to get some testing in place for this longer term but
our whole strategy for that is a bit adhoc for now because tooling isn't
yet commonly available in distros etc (and I for one haven't looked
at what is is necessary yet!)

Was pointed out to me last week that the docs currently give arm64 examples
and we don't have upstream arm64 support yet :( 

The wonders of partial pickup of patch sets!

Thanks,

Jonathan

> 
> 
> On Tue, Oct 11, 2022 at 10:14:38AM -0700, Davidlohr Bueso wrote:
> > On Mon, 10 Oct 2022, Gregory Price wrote:
> >   
> > > I've pushed 5 new commits to this branch here (@Jonathan I've also made
> > > a merge request to pull them into your branch).
> > > 
> > > https://gitlab.com/gourry.memverge/qemu/-/commits/cxl-2022-10-09  
> > 
> > This series could perhaps be posted as a reply to the CDAT extensions
> > cover letter. But regardless, at some point it should be in linux-cxl@.
> >   
> > > 
> > > They're built on top of Jonathan's extensions for the CDAT since the
> > > CDAT has memory region relevant entries and trying to do this separate
> > > would be unwise.
> > > 
> > > 1/5: PCI_CLASS_MEMORY_CXL patch
> > > 2/5: CXL_CAPACITY_MULTIPLIER pullout patch (@Davidlohr request)  
> > 
> > Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> > 
> > However this needs a changelog; for however redundant it may be.
> >   
> > > 3/5: Generalizes CDATDsmas intialization ahead of multi-region  
> >   
> > > 4/5: Multi-region support w/ backward compatibility
> > >     * Requires extra eyes for CDAT and Read/Write Change Validation*  
> > 
> > I'm still eyeballing this but it certainly looks much more complete now -
> > at least with the minimal support I was hoping for.
> >   
> > > 5/5: Test and documentation update  
> > 
> > I think that there should two examples here with volatile and LSA usage.
> > The first is without as it is quite unintuitive otherwise, then a
> > second example with specifying the lba. Also in these cases you want
> > id=cxl-vmem0. And the documentation should be updated to mention that
> > memdev is deprecated and {persistent/volatile}-memdev should be used.
> > 
> > Thanks,
> > Davidlohr  


