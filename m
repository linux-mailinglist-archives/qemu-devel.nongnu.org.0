Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0095B591417
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 18:41:47 +0200 (CEST)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMXjG-0000eR-3F
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 12:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oMXJg-0007MP-G0; Fri, 12 Aug 2022 12:15:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oMXJc-00069f-QI; Fri, 12 Aug 2022 12:15:19 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M48083hzWz682NF;
 Sat, 13 Aug 2022 00:15:04 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 18:15:11 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 12 Aug
 2022 17:15:10 +0100
Date: Fri, 12 Aug 2022 17:15:09 +0100
To: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron via <qemu-devel@nongnu.org>, Bobo WL
 <lmw.bobo@gmail.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <20220812171509.00006034@huawei.com>
In-Reply-To: <62f679b67828f_992102942@dwillia2-xfh.jf.intel.com.notmuch>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <20220808133727.00001171@huawei.com>
 <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
 <20220809170825.00001b61@huawei.com>
 <20220811180857.00005e67@huawei.com>
 <20220812164403.00001654@huawei.com>
 <62f679b67828f_992102942@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri, 12 Aug 2022 09:03:02 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> Jonathan Cameron wrote:
> > On Thu, 11 Aug 2022 18:08:57 +0100
> > Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> >   
> > > On Tue, 9 Aug 2022 17:08:25 +0100
> > > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> > >   
> > > > On Tue, 9 Aug 2022 21:07:06 +0800
> > > > Bobo WL <lmw.bobo@gmail.com> wrote:
> > > >     
> > > > > Hi Jonathan
> > > > > 
> > > > > Thanks for your reply!
> > > > > 
> > > > > On Mon, Aug 8, 2022 at 8:37 PM Jonathan Cameron
> > > > > <Jonathan.Cameron@huawei.com> wrote:      
> > > > > >
> > > > > > Probably not related to your problem, but there is a disconnect in QEMU /
> > > > > > kernel assumptionsaround the presence of an HDM decoder when a HB only
> > > > > > has a single root port. Spec allows it to be provided or not as an implementation choice.
> > > > > > Kernel assumes it isn't provide. Qemu assumes it is.
> > > > > >
> > > > > > The temporary solution is to throw in a second root port on the HB and not
> > > > > > connect anything to it.  Longer term I may special case this so that the particular
> > > > > > decoder defaults to pass through settings in QEMU if there is only one root port.
> > > > > >        
> > > > > 
> > > > > You are right! After adding an extra HB in qemu, I can create a x1
> > > > > region successfully.
> > > > > But have some errors in Nvdimm:
> > > > > 
> > > > > [   74.925838] Unknown online node for memory at 0x10000000000, assuming node 0
> > > > > [   74.925846] Unknown target node for memory at 0x10000000000, assuming node 0
> > > > > [   74.927470] nd_region region0: nmem0: is disabled, failing probe      
> > > > 
> > > > Ah. I've seen this one, but not chased it down yet.  Was on my todo list to chase
> > > > down. Once I reach this state I can verify the HDM Decode is correct which is what
> > > > I've been using to test (Which wasn't true until earlier this week). 
> > > > I'm currently testing via devmem, more for historical reasons than because it makes
> > > > that much sense anymore.      
> > > 
> > > *embarassed cough*.  We haven't fully hooked the LSA up in qemu yet.
> > > I'd forgotten that was still on the todo list. I don't think it will
> > > be particularly hard to do and will take a look in next few days.
> > > 
> > > Very very indirectly this error is causing a driver probe fail that means that
> > > we hit a code path that has a rather odd looking check on NDD_LABELING.
> > > Should not have gotten near that path though - hence the problem is actually
> > > when we call cxl_pmem_get_config_data() and it returns an error because
> > > we haven't fully connected up the command in QEMU.  
> > 
> > So a least one bug in QEMU. We were not supporting variable length payloads on mailbox
> > inputs (but were on outputs).  That hasn't mattered until we get to LSA writes.
> > We just need to relax condition on the supplied length.
> > 
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index c352a935c4..fdda9529fe 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -510,7 +510,7 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> >      cxl_cmd = &cxl_cmd_set[set][cmd];
> >      h = cxl_cmd->handler;
> >      if (h) {
> > -        if (len == cxl_cmd->in) {
> > +        if (len == cxl_cmd->in || !cxl_cmd->in) {
> >              cxl_cmd->payload = cxl_dstate->mbox_reg_state +
> >                  A_CXL_DEV_CMD_PAYLOAD;
> >              ret = (*h)(cxl_cmd, cxl_dstate, &len);
> > 
> > 
> > This lets the nvdimm/region probe fine, but I'm getting some issues with
> > namespace capacity so I'll look at what is causing that next.
> > Unfortunately I'm not that familiar with the driver/nvdimm side of things
> > so it's take a while to figure out what kicks off what!  
> 
> The whirlwind tour is that 'struct nd_region' instances that represent a
> persitent memory address range are composed of one more mappings of
> 'struct nvdimm' objects. The nvdimm object is driven by the dimm driver
> in drivers/nvdimm/dimm.c. That driver is mainly charged with unlocking
> the dimm (if locked) and interrogating the label area to look for
> namespace labels.
> 
> The label command calls are routed to the '->ndctl()' callback that was
> registered when the CXL nvdimm_bus_descriptor was created. That callback
> handles both 'bus' scope calls, currently none for CXL, and per nvdimm
> calls. cxl_pmem_nvdimm_ctl() translates those generic LIBNVDIMM commands
> to CXL commands.
> 
> The 'struct nvdimm' objects that the CXL side registers have the
> NDD_LABELING flag set which means that namespaces need to be explicitly
> created / provisioned from region capacity. Otherwise, if
> drivers/nvdimm/dimm.c does not find a namespace-label-index block then
> the region reverts to label-less mode and a default namespace equal to
> the size of the region is instantiated.
> 
> If you are seeing small mismatches in namespace capacity then it may
> just be the fact that by default 'ndctl create-namespace' results in an
> 'fsdax' mode namespace which just means that it is a block device where
> 1.5% of the capacity is reserved for 'struct page' metadata. You should
> be able to see namespace capacity == region capacity by doing "ndctl
> create-namespace -m raw", and disable DAX operation.

Currently ndctl create-namespace crashes qemu ;)
Which isn't ideal!

> 
> Hope that helps.
Got me looking at the right code. Thanks!

Jonathan



