Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2F65C5E1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCloz-0007iR-RR; Tue, 03 Jan 2023 13:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pClox-0007fV-N6
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:15:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pClov-0004je-PV
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:15:31 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Nmgl91x61z686w8;
 Wed,  4 Jan 2023 02:10:45 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 18:15:25 +0000
Date: Tue, 3 Jan 2023 18:15:24 +0000
To: Gregory Price <gourry.memverge@gmail.com>
CC: Gregory Price <gregory.price@memverge.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, <a.manzanares@samsung.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <hchkuo@avery-design.com.tw>,
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20230103181524.00003e14@huawei.com>
In-Reply-To: <CAD3UvdQ7nZab7Y+tbc1Ox-zqzse4C16dwv6qtOAgfe4dA6_crQ@mail.gmail.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
 <20221219124211.000032b7@Huawei.com>
 <Y6CNcuIzUVmKL0SM@memverge.com>
 <20221219172502.00001338@Huawei.com>
 <Y6CloIiuruB/h7qp@memverge.com>
 <20221220153453.00000436@Huawei.com>
 <Y6IMoxKZOc7eUPCg@memverge.com>
 <20230103155629.00007466@Huawei.com>
 <CAD3UvdQ7nZab7Y+tbc1Ox-zqzse4C16dwv6qtOAgfe4dA6_crQ@mail.gmail.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 3 Jan 2023 11:02:31 -0500
Gregory Price <gourry.memverge@gmail.com> wrote:

> The fine grained control would be a precursor to an emulated pooling
> device.  If you can demonstrate it with a singleton attached device, you
> could just implement an exclusivity table in a shared file, and set the
> shared memory to a file backend as well.  Boom, shared memory pool across
> qemu instances.

For Dynamic capacity based pooling I agree, but a lot of work is needed to make that
function correctly.  The partitioning support is a much nearer term target and
there is no real need for them to look similar - on kernel side of things I'm
not yet convinced it's even a sensible route to make them look similar as DCD
is far less constrained than partitioning and expected usecases are probably
entirely different.

Hotplug based pooling (CXL 2.0 approach) is much simpler in OS because in that
case we always get full blown hotplug events.

Whilst I agree that pooling is interesting to emulate, my preference for initial
case would be moving between virtual PCIe heirarchies attached to different
root ports / host bridges on a single host.  That may be simpler to get going / test
than multiple hosts.

Right now I'd just like a static device with mixture of pmem / volatile plus 2+
HDM decoders and kernel support for that.

Jonathan

> 
> On Tue, Jan 3, 2023, 10:56 AM Jonathan Cameron <Jonathan.Cameron@huawei.com>
> wrote:
> 
> > On Tue, 20 Dec 2022 14:27:31 -0500
> > Gregory Price <gregory.price@memverge.com> wrote:
> >  
> > > On Tue, Dec 20, 2022 at 03:34:53PM +0000, Jonathan Cameron wrote:  
> > > > > However I don't think this is successful in creating the dax devices,
> > > > > and therefore the reconfiguring into ram.  
> > > >
> > > > Sure. I only bothered testing the it in some dax modes rather than via  
> > kmem.  
> > > > It 'should' work but more testing needed there.
> > > >
> > > > However as you've noted, that only applies to the pmem regions at the  
> > moment.  
> > > > I wondered if you'd scripted the HDM decoder setup etc for test  
> > purposes  
> > > > (so what the driver will do). Alternative to that would be enabling  
> > the driver  
> > > > support. Not sure if anyone is looking at that yet. Final alternative  
> > would  
> > > > be to port the existing EDK2 based support to work on QEMU.  All non  
> > trivial  
> > > > jobs so may take a while,
> > > >
> > > > Jonathan  
> > >
> > > Also, I'm relatively new to this corner of the kernel (mm, regions, dax,
> > > etc), so i need to spend a week or two with uninterrupted tinkering with
> > > how adding new memory regions from these devices is actually "supposed
> > > to work" in a dynamic-capacity world.
> > >
> > > At least in theory, the partitioning of persistent and volatile memory
> > > regions on one of these type-3 devices should end up looking a bit like
> > > dynamic capacity when doing runtime reconfiguring.
> > >
> > > For example, considering
> > >
> > > Device(512mb PMEM, 512 VMEM), I'd want, at least i think
> > >
> > > CMFW-Volatile:    max window size(1024mb) - Numa 2
> > > CMFW-Persistent:  max window size(512mb)  - Numa 3
> > >
> > > Then we'd need the kernel support for
> > >
> > > 1) Online 2x256mb volatile regions in Numa 2
> > > 2) Online 2x256mb persistent regions in Numa 3
> > > 3) Offline persistent region (256mb:512mb)
> > > 4) Reconfigure device to 256Pmem/768Volatile
> > >    a) change decoders in device accordingly
> > > 5) Online 1x256mb volatile region in Numa 2
> > >
> > > The question is whether you can do this without offlining the other
> > > adjacent regions.  I just don't know enough about the region subsystem
> > > to say what is "correct" behavior here.  
> >
> > Whilst you probably 'can' do fine grained offline / online (to some
> > degree anyway) I'm not sure if people consider it an important
> > usecase. If decoder reprogramming is involved things will get very fiddly
> > so at least in first instance I'd advocate just ripping it all down and
> > building up again.  Or in the simple case, just block attempts to
> > reconfigure
> > at the partitioning if either side is in use.
> >  
> > >
> > > On the device side, I need to go look at the mailbox commands to go
> > > about implementing the reconfiguration / decoder reprogramming.
> > >
> > > I guess the "decoder" reprogramming is essentially changing the
> > > read/write commands to adjust based on v/pmem_active vs v/pmem_size?  
> >
> > Yup.  We also need multiple decoder support in general in QEMU.
> > It's not that high on my list as my main focus this cycle is going
> > to be on reducing the out of tree patch set by upstreaming stuff.
> >  
> > >
> > > I suppose I can look at this chunk next.  
> >
> > Great.
> >
> > Jonathan
> >
> >
> >  
> 


