Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188954DB7AF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 19:00:30 +0100 (CET)
Received: from localhost ([::1]:39266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUXwi-0006CS-LQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 14:00:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nUXvD-0004rH-SE
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:58:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nUXvA-0000sz-Ez
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:58:55 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KJdJr2s2mz67y8P;
 Thu, 17 Mar 2022 01:57:16 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 16 Mar 2022 18:58:49 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 16 Mar
 2022 17:58:48 +0000
Date: Wed, 16 Mar 2022 17:58:46 +0000
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Samarth Saxena <samarths@cadence.com>, 
 Chris Browy <cbrowy@avery-design.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 David Hildenbrand <david@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 00/46] CXl 2.0 emulation Support
Message-ID: <20220316175846.00007463@Huawei.com>
In-Reply-To: <1efbfeeb-2598-57c5-2e2d-4f5fa2538aa7@ilande.co.uk>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
 <20220306163119-mutt-send-email-mst@kernel.org>
 <20220307093918.00002f20@Huawei.com> <YihiHNxVjDFI0Z8r@xz-m1.local>
 <20220309112827.00002c73@Huawei.com> <Yimwjtd8SsVLOU5e@xz-m1.local>
 <20220316165034.000037e7@Huawei.com>
 <1efbfeeb-2598-57c5-2e2d-4f5fa2538aa7@ilande.co.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Wed, 16 Mar 2022 17:16:55 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:

> On 16/03/2022 16:50, Jonathan Cameron via wrote:
>=20
> > On Thu, 10 Mar 2022 16:02:22 +0800
> > Peter Xu <peterx@redhat.com> wrote:
> >  =20
> >> On Wed, Mar 09, 2022 at 11:28:27AM +0000, Jonathan Cameron wrote: =20
> >>> Hi Peter, =20
> >>
> >> Hi, Jonathan,
> >> =20
> >>>     =20
> >>>>
> >>>> https://lore.kernel.org/qemu-devel/20220306174137.5707-35-Jonathan.C=
ameron@huawei.com/
> >>>>
> >>>> Having mr->ops set but with memory_access_is_direct() returning true=
 sounds
> >>>> weird to me.
> >>>>
> >>>> Sorry to have no understanding of the whole picture, but.. could you=
 share
> >>>> more on what's the interleaving requirement on the proxying, and why=
 it
> >>>> can't be done with adding some IO memory regions as sub-regions upon=
 the
> >>>> file one? =20
> >>>
> >>> The proxying requirement is simply a means to read/write to a compute=
d address
> >>> within a memory region. There may well be a better way to do that.
> >>>
> >>> If I understand your suggestion correctly you would need a very high
> >>> number of IO memory regions to be created dynamically when particular=
 sets of
> >>> registers across multiple devices in the topology are all programmed.
> >>>
> >>> The interleave can be 256 bytes across up to 16x, many terabyte, devi=
ces.
> >>> So assuming a simple set of 16 1TB devices I think you'd need about 4=
x10^9
> >>> IO regions.  Even for a minimal useful test case of largest interleave
> >>> set of 16x 256MB devices (256MB is minimum size the specification all=
ows per
> >>> decoded region at the device) and 16 way interleave we'd need 10^6 IO=
 regions.
> >>> Any idea if that approach would scale sensibly to this number of regi=
ons?
> >>>
> >>> There are also complexities to getting all the information in one pla=
ce to
> >>> work out which IO memory regions maps where in PA space. Current solu=
tion is
> >>> to do that mapping in the same way the hardware does which is hierarc=
hical,
> >>> so we walk the path to the device, picking directions based on each i=
nterleave
> >>> decoder that we meet.
> >>> Obviously this is a bit slow but I only really care about correctness=
 at the
> >>> moment.  I can think of various approaches to speeding it up but I'm =
not sure
> >>> if we will ever care about performance.
> >>>
> >>> https://gitlab.com/jic23/qemu/-/blob/cxl-v7-draft-2-for-test/hw/cxl/c=
xl-host.c#L131
> >>> has the logic for that and as you can see it's fairly simple because =
we are always
> >>> going down the topology following the decoders.
> >>>
> >>> Below I have mapped out an algorithm I think would work for doing it =
with
> >>> IO memory regions as subregions.
> >>>
> >>> We could fake the whole thing by limiting ourselves to small host
> >>> memory windows which are always directly backed, but then I wouldn't
> >>> achieve the main aim of this which is to provide a test base for the =
OS code.
> >>> To do that I need real interleave so I can seed the files with test p=
atterns
> >>> and verify the accesses hit the correct locations. Emulating what the=
 hardware
> >>> is actually doing on a device by device basis is the easiest way I ha=
ve
> >>> come up with to do that.
> >>>
> >>> Let me try to provide some more background so you hopefully don't have
> >>> to have read the specs to follow what is going on!
> >>> There are an example for directly connected (no switches) topology in=
 the
> >>> docs
> >>>
> >>> https://gitlab.com/jic23/qemu/-/blob/cxl-v7-draft-2-for-test/docs/sys=
tem/devices/cxl.rst
> >>>
> >>> The overall picture is we have a large number of CXL Type 3 memory de=
vices,
> >>> which at runtime (by OS at boot/on hotplug) are configured into vario=
us
> >>> interleaving sets with hierarchical decoding at the host + host bridge
> >>> + switch levels. For test setups I probably need to go to around 32 d=
evices
> >>> so I can hit various configurations simultaneously.
> >>> No individual device has visibility of the full interleave setup - he=
nce
> >>> the walk in the existing code through the various decoders to find the
> >>> final Device Physical address.
> >>>
> >>> At the host level the host provides a set of Physical Address windows=
 with
> >>> a fixed interleave decoding across the different host bridges in the =
system
> >>> (CXL Fixed Memory windows, CFMWs)
> >>> On a real system these have to be large enough to allow for any memory
> >>> devices that might be hotplugged and all possible configurations (so
> >>> with 2 host bridges you need at least 3 windows in the many TB range,
> >>> much worse as the number of host bridges goes up). It'll be worse than
> >>> this when we have QoS groups, but the current Qemu code just puts all
> >>> the windows in group 0.  Hence my first thought of just putting memory
> >>> behind those doesn't scale (a similar approach to this was in the
> >>> earliest versions of this patch set - though the full access path
> >>> wasn't wired up).
> >>>
> >>> The granularity can be in powers of 2 from 256 bytes to 16 kbytes
> >>>
> >>> Next each host bridge has programmable address decoders which take the
> >>> incoming (often already interleaved) memory access and direct them to
> >>> appropriate root ports.  The root ports can be connected to a switch
> >>> which has additional address decoders in the upstream port to decide
> >>> which downstream port to route to.  Note we currently only support 1 =
level
> >>> of switches but it's easy to make this algorithm recursive to support
> >>> multiple switch levels (currently the kernel proposals only support 1=
 level)
> >>>
> >>> Finally the End Point with the actual memory receives the interleaved=
 request and
> >>> takes the full address and (for power of 2 decoding - we don't yet su=
pport
> >>> 3,6 and 12 way which is more complex and there is no kernel support y=
et)
> >>> it drops a few address bits and adds an offset for the decoder used to
> >>> calculate it's own device physical address.  Note device will support
> >>> multiple interleave sets for different parts of it's file once we add
> >>> multiple decoder support (on the todo list).
> >>>
> >>> So the current solution is straight forward (with the exception of th=
at
> >>> proxying) because it follows the same decoding as used in real hardwa=
re
> >>> to route the memory accesses. As a result we get a read/write to a
> >>> device physical address and hence proxy that.  If any of the decoders
> >>> along the path are not configured then we error out at that stage.
> >>>
> >>> To create the equivalent as IO subregions I think we'd have to do the
> >>> following from (this might be mediated by some central entity that
> >>> doesn't currently exist, or done on demand from which ever CXL device
> >>> happens to have it's decoder set up last)
> >>>
> >>> 1) Wait for a decoder commit (enable) on any component. Goto 2.
> >>> 2) Walk the topology (up to host decoder, down to memory device)
> >>> If a complete interleaving path has been configured -
> >>>     i.e. we have committed decoders all the way to the memory
> >>>     device goto step 3, otherwise return to step 1 to wait for
> >>>     more decoders to be committed.
> >>> 3) For the memory region being supplied by the memory device,
> >>>     add subregions to map the device physical address (address
> >>>     in the file) for each interleave stride to the appropriate
> >>>     host Physical Address.
> >>> 4) Return to step 1 to wait for more decoders to commit.
> >>>
> >>> So summary is we can do it with IO regions, but there are a lot of th=
em
> >>> and the setup is somewhat complex as we don't have one single point in
> >>> time where we know all the necessary information is available to comp=
ute
> >>> the right addresses.
> >>>
> >>> Looking forward to your suggestions if I haven't caused more confusio=
n! =20
> >=20
> > Hi Peter,
> >  =20
> >>
> >> Thanks for the write up - I must confess they're a lot! :)
> >>
> >> I merely only learned what is CXL today, and I'm not very experienced =
on
> >> device modeling either, so please bare with me with stupid questions..
> >>
> >> IIUC so far CXL traps these memory accesses using CXLFixedWindow.mr.
> >> That's a normal IO region, which looks very reasonable.
> >>
> >> However I'm confused why patch "RFC: softmmu/memory: Add ops to
> >> memory_region_ram_init_from_file" helped.
> >>
> >> Per my knowledge, all the memory accesses upon this CFMW window trapped
> >> using this IO region already.  There can be multiple memory file objec=
ts
> >> underneath, and when read/write happens the object will be decoded from
> >> cxl_cfmws_find_device() as you referenced. =20
> >=20
> > Yes.
> >  =20
> >>
> >> However I see nowhere that these memory objects got mapped as sub-regi=
ons
> >> into parent (CXLFixedWindow.mr).  Then I don't understand why they can=
not
> >> be trapped. =20
> >=20
> > AS you note they aren't mapped into the parent mr, hence we are trappin=
g.
> > The parent mem_ops are responsible for decoding the 'which device' +
> > 'what address in device memory space'. Once we've gotten that info
> > the question is how do I actually do the access?
> >=20
> > Mapping as subregions seems unwise due to the huge number required.
> >  =20
> >>
> >> To ask in another way: what will happen if you simply revert this RFC
> >> patch?  What will go wrong? =20
> >=20
> > The call to memory_region_dispatch_read()
> > https://gitlab.com/jic23/qemu/-/blob/cxl-v7-draft-2-for-test/hw/mem/cxl=
_type3.c#L556
> >=20
> > would call memory_region_access_valid() that calls
> > mr->ops->valid.accepts() which is set to
> > unassigned_mem_accepts() and hence...
> > you get back a MEMTX_DECODE_ERROR back and an exception in the
> > guest.
> >=20
> > That wouldn't happen with a non proxied access to the ram as
> > those paths never uses the ops as memory_access_is_direct() is called
> > and simply memcpy used without any involvement of the ops.
> >=20
> > Is a better way to proxy those writes to the backing files?
> >=20
> > I was fishing a bit in the dark here and saw the existing ops defined
> > for a different purpose for VFIO
> >=20
> > 4a2e242bbb ("memory Don't use memcpy for ram_device regions")
> >=20
> > and those allowed the use of memory_region_dispatch_write() to work.
> >=20
> > Hence the RFC marking on that patch :) =20
>=20
> FWIW I had a similar issue implementing manual aliasing in one of my q800=
 patches=20
> where I found that dispatching a read to a non-IO memory region didn't wo=
rk with=20
> memory_region_dispatch_read(). The solution in my case was to switch to u=
sing the=20
> address space API instead, which whilst requiring an absolute address for=
 the target=20
> address space, handles the dispatch correctly across all different memory=
 region types.
>=20
> Have a look at=20
> https://gitlab.com/mcayland/qemu/-/commit/318e12579c7570196187652da13542d=
b86b8c722 to=20
> see how I did this in macio_alias_read().
>=20
> IIRC from my experiments in this area, my conclusion was that=20
> memory_region_dispatch_read() can only work correctly if mapping directly=
 between 2=20
> IO memory regions, and for anything else you need to use the address spac=
e API.

Hi Mark,

I'd wondered about the address space API as an alternative approach.

=46rom that reference looks like you have the memory mapped into the system a=
ddress
space and are providing an alias to that.  That's something I'd ideally lik=
e to
avoid doing as there is no meaningful way to do it so I'd just be hiding th=
e memory
somewhere up high.  The memory should only be accessible through the one
route.

I think I could spin a separate address space for this purpose (one per CXL=
 type 3
device probably) but that seems like another nasty hack to make. I'll try a=
 quick
prototype of this tomorrow.

What do people think is the least horrible way to do this?

Thanks for the suggestion and I'm glad I'm not the only one trying to get t=
his
sort of thing to work ;)

Jonathan

>=20
>=20
> ATB,
>=20
> Mark.
>=20


