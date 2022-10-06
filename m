Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D655F6D08
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:34:12 +0200 (CEST)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUl9-0004VX-9U
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ogTx5-0003jv-Dd
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:42:29 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ogTx1-0002Pk-GT
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:42:27 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MjxxG5ZSYz67ZwS;
 Fri,  7 Oct 2022 00:39:46 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 18:42:18 +0200
Received: from localhost (10.81.206.0) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 6 Oct
 2022 17:42:17 +0100
Date: Thu, 6 Oct 2022 17:42:14 +0100
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, Alison Schofield
 <alison.schofield@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>, Ben Widawsky
 <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <20221006174214.000059c7@huawei.com>
In-Reply-To: <Yz75ppPOwYCvNamy@fedora>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.206.0]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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

On Thu, 6 Oct 2022 11:52:06 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> On Thu, Oct 06, 2022 at 09:50:07AM +0100, Jonathan Cameron wrote:
> > On Thu, 6 Oct 2022 09:45:57 +0100
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> >   
> > > Great to see this.
> > > 
> > > Missing Signed-off by so we can't apply this (no developer certificate of
> > > origin)  Probably want your from address to match that and I've no idea
> > > if your fully name is Gourry (apologies if it is!)
> > > 
> > > +CC linux-cxl as most folks who will be interested in this hang out there
> > > and are more likely to noticed it than burried on qemu-devel.
> > > Also +CC some others who will be interested in this discussion.
> > > 
> > > Please also cc the listed CXL QEMU maintainers (myself and Ben W) - see
> > > MAINTAINERS
> > >   
> 
> 
> Sorry about that, this is my literal first patch submission to the
> kernel devlists ever, I'm still getting my environment set up (just
> learning mutt as I type this).

No problem and welcome!
> 
> Gourry is a nickname I go by, but I see pseudonyms are not particularly
> welcome on the lists, so no worries.

Fine to use nicknames on the list, but they make the laywers get nervous
when it comes to tracking where code came from etc!

> 
> 
> In addition, I'm relatively new to the QEMU, CXL, and PCIe ecosystem, so
> please excuse some of my ignorance of the overall state of things -
> doing my best to pickup as quickly as possible.
> 
> 
> > I forgot to ask.  How are you testing this?
> > 
> > One of the blockers for volatile support was that we had no means to poke
> > it properly as the kernel doesn't yet support volatile capacity and
> > no one has done the relevant work in EDK2 or similar to do it before the kernel boots.
> > There has been some work on EDK2 support for ARM N2 FVPs from 
> > Saanta Pattanayak, but not upstream eyt.
> > https://lpc.events/event/16/contributions/1254/ 
> > 
> > Thanks,
> > 
> > Jonathan
> >  
> 
> Presently this is untested for exactly the reasons you described. I had
> originally intended to shoot off a cover letter with this patch
> discussing the issue, but I managed to much that up... so lets just plop
> that in here:
> 
> 
> [PATCH RFC] hw/cxl: Volatile Type-3 CXL Devices
> 
> The idea behind this patch is simple: Not all type-3 devices are
> persistent memory devices, so add a simple boolean (is_pmem) to the
> attributes of type-3 devices and have the mailbox-utility report memory
> accordingly (persistent_capacity if is_pmem, else volatile_capacity).
> 
> In an emulated system, there isn't really a difference between the
> devices except for the backing storage (file vs ram), but having an
> emulation mode for each is useful for the sake of testing fabric
> manager/orchestrator corner cases.

I'm not sure there is even a different wrt to the backing store.
We can happily back volatile memory with a file and non volatile
with ram.   Obviously doesn't make a lot of sense, but it will 'work' :)
Ah you note this below...

> 
> At the moment this can be tested with `cxl list` and it will show
> the ram capacity as requested, instead of pmem capacity.
> 
> 
> There are a few issues with this patch set that i'm not able to discern
> the right answer to just yet, and was hoping for some input:
> 
> 1) The PCI device type is set prior to realize/attributes, and is
> currently still set to PCI_CLASS_STORAGE_EXPRESS.  Should this instead
> be PCI_CLASS_MEMORY_CXL when presenting as a simple memory expander?

We override this later in realize but indeed a bit odd that we first set
it to the wrong thing. I guess that is really old code.  Nice thing to clean up.
I just tried it and setting it right in the first place + dropping where we
change it later works fine.

> 
> 1a) If so, that means we'll probably need to make type-3 into an abstract
> class of devices and explicitly create devices that represents vmem and
> pmem devices separately.  That could probably be done within cxl_type3.c
> since most of the code will be shared anyway.
> 
> But this is confusing, because a pmem device can be made to operate in
> volatile mode... so should it ALSO be assigned as PCI_CLASS_MEMORY_CXL,
> and a volatile device simply be a pmem device with persistence turned
> off? Many design questions here.

We definitely don't want to have separate device types. Whether they
have volatile or non volatile or both should just be a configuration option.

> 
> 
> 1b) If not, does this have an appreciable affect on system-setup from
> the perspective of the EFI/Bios? It should be possible, (see #2) to have
> the EFI/bios setup memory expanders and just present them to the kernel
> as additional, available memory as if more ram is simply present.

Absolutely - that's both what I understand the ARM EDK2 patches do
and what is suggested in the software guide that intel folk wrote (note
we treat that as guidance only rather than a spec, but it is useful).
Linked to from this page:
https://www.intel.co.uk/content/www/uk/en/io/pci-express/pci-express-architecture-devnet-resources.html


> 
> 
> 
> 2) EDK2 sets the memory area as a reserved, and the memory is not
> configured by the system as ram.  I'm fairly sure edk2 just doesn't
> support this yet, but there's a chicken/egg problem.  If the device
> isn't there, there's nothing to test against... if there's nothing to
> test against, no one will write the support.  So I figure we should kick
> start the process (probably by getting it wrong on the first go around!)

Yup, if the bios left it alone, OS drivers need to treat it the same as
they would deal with hotplugged memory.  Note my strong suspicion is there
will be host vendors who won't ever handle volatile CXL memory in firmware.
They will just let the OS bring it up after boot. As long as you have DDR
as well on the system that will be fine.  Means there is one code path
to verify rather than two.  Not everyone will care about legacy OS support.


> 
> 3) Upstream linux drivers haven't touched ram configurations yet.  I
> just configured this with Dan Williams yesterday on IRC.  My
> understanding is that it's been worked on but nothing has been
> upstreamed, in part because there are only a very small set of devices
> available to developers at the moment.

There was an offer of similar volatile memory QEMU emulation in the
session on QEMU CXL at Linux Plumbers.  That will look something like you have
here and maybe reflects that someone has hardware as well...

> 
> 
> 4) Should (is_pmem) be defaulted to 'true' (or invert and make the flag
> (is_vmem)), and should pmem devices also present their memory as
> volatile capacity?  I think they should, because all pmem devices should
> be capable of running in a volatile mode.

Disagree.  Running in volatile mode implies a bunch of security guarantees
(no retention over reboots for starters).
The OS must be able to use them as volatile mode, but that's an OS decision.
For now, we bring them up as DAX and then you can rebind them with the kmem
driver to treat them as volatile.

It's definitely not a spec requirement for a non volatile device to
be configured to present as volatile (though it is an option via the partition
commands).

> 
> 
> > > 
> > > Would it be possible to introduce this support in a fashion that allowed
> > > us to transition to devices presenting both without needing a change of
> > > interface?  With hindsight the memdev naming of the existing parameter is
> > > less than helpful, but one path to doing this would be to allow for
> > > an alternative memdev-volatile= parameter.  For now we can keep the patch
> > > small by only supporting either memdev or memdev-volatile  
> 
> My understanding of the current design is the the memdev backing itself
> is irrelevant.  You can totally have file-memdevs backing a volatile
> reagion and a ram-memdev backing a persistent region.

True, but a definite 'usecase' would be to back persistent memory with persistent
backend and volatile with volatile.

> 
> By adding more/alternative flags that can conflict with each other, we
> will also create a boondoggle on intialization.
> 
> I had first considered making Type3Dev into an abstract device and
> instantiating separate explicit pmem and vmem devices, but ultimatly
> that just looked like 2 empty structures wrapping Type3Dev and setting
> the internal is_pmem boolean... lol.

Definitely don't do that.  A single device needs to support a mixture as
that's what the spec allows and people will probably build.

> 
> > > 
> > > That way when we want to come along and add mixed devices later, we simply
> > > enable supporting the specification of two different memory backends.
> > > 
> > > The tricky bit then would be to support variable capacity (devices can
> > > support a region of memory which may be persistent or non persistent
> > > depending on settings - see Set Partition Info).
> > > 
> > > So my gut feeling is we may eventually allow all of:
> > > 
> > > 1) single memory backend for persistent or volatile.
> > > 2) two memory backends, covering a persistent region and a volatile region
> > >   (likely you may want actual non volatile backend for the persistent
> > >    region but not the volatile one).
> > > 3) single memory backend in which we can allow for the Set Partition Info stuff
> > >    to work.
> > >  
> 
> Seems a little odd to use two memory backends.  Of what use is it to the
> software developers, it should be completely transparent to them, right?
> 
> The only thing I can think of is maybe reset mechanics for volatile
> regions being set differently than persistent regions, but even then it
> seems simple enough to just emulate the behavior and use a single
> backing device.

It's a very convenient path as lets us define sizes and things from the
actual memdev rather than duplicating all the configuration in multiple
devices.  If it weren't for the ability to change the allocations at runtime
I'd definitely say this was the best path.  That corner makes it complex
but I'd still like the simplicity of you throw a backend at the device
and we set up all the description on basis that backend is what we want
to use.

> 
> > > As we move beyond just one backend that is presented as persistent we need
> > > to define the interface...
> > > 
> > > I can think of far too many options!  Let me lay out a few for comment.
> > > 
> > > A) Array of memory backends, separate control of configurable size
> > >    + starting persistent size, starting volatile size.
> > >    Default of one memory backend gives you current non-volatile only.
> > >    To get volatile only you provide one memory backend and set
> > >    persistent size to 0 and volatile size to size of memory backend.
> > > 
> > > B) Two memory backends, (later add some trickery around presented size)
> > >    memdev as defined is persistent memory (maybe we deprecate that interface
> > >    and make it memdev-persistent) memdev-volatile as volatile.  
> 
> I had considered this, but - at least in my head - you're describing a
> multi-logical device.  The device we're looking at right now is a basic
> Single-Logical Device which can be either persistent or volatile.

Not the same as an MLD.  This is just representing a normal
SLD with a mixture of volatile and non volatile capacity.
MLDs are a whole lot more complex - on the todo list...

> 
> This goes back to my question:  Should we be designing this SLD as a
> component which can slot into an MLD, or are there special features of
> a MLD sub-device that aren't present on an SLD?

Different things
SLD with a mixture of memory types is fine and can be really dumb.
Imagine a controller with multi purpose slots similar to some of the ones
on the Intel systems that take either NVDIMMS or normal DIMMS.  Depending
on what is plugged in, the amount of each memory type available changes.

MLDs from host look just like an SLD as well. They become interesting only
once we have emulation of the FM-API etc and can start moving memory around.
That's something I'm working on but a lot of parts are needed to make that
work fully.

> 
> Basically I just don't see the need for multiple backends, as opposed to
> multiple devices which are separately manageable.

Depends on what you want to do.  Aim here is to emulate devices that 'might'
exist. A combined device is allowed by the spec, so we need a path to
emulate that. No need to do it for now, but the interface defined needs to
extend to that case. Obviously a lot of code paths can be tested without that
using a patch similar to yours. Just not all of them.
A single flag is not sufficiently extensible.  My aim here was to describe
possible paths that are. Note however we only need to emulate some of it
today - just with an interface that allows other stuff to work later!


> 
> If I'm misunderstanding something, please let me know.
> 
> > > 
> > >    Steps to add functionality.
> > >    1. Add your code to enable volatile but use 'which memdev is supplied' to
> > >       act as the flag.  For now supply both is an error.
> > >    2. Enable static volatile + non-volatile devices (both memdevs supplied).
> > >    3. (hackish) Add a control for amount of partionable capacity.  Cheat
> > >       and remove that capacity from both memdevs.  Changing partition just
> > >       messes without how much of each memdev is used.  We'd need to be a little
> > >       careful to ensure we wipe data etc.
> > > 
> > > You code mostly looks good to me so I think discussion here is going to be
> > > all about the interface and how we build one more suitable for the future!
> > > 
> > > Jonathan
> > > 
> > > 
> > > 
> > >   
> 
> Feels like I'm 
?

> 
> 
> 
> > > >  Example command lines
> > > >  ---------------------
> > > > -A very simple setup with just one directly attached CXL Type 3 device::
> > > > +A very simple setup with just one directly attached CXL Type 3 Persistent Memory device::
> > > >  
> > > >    qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
> > > >    ...
> > > > @@ -308,7 +308,18 @@ A very simple setup with just one directly attached CXL Type 3 device::
> > > >    -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
> > > >    -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> > > >    -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> > > > -  -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
> > > > +  -device cxl-type3,bus=root_port13,pmem=true,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
> > > > +  -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G    
> > > 
> > > Can't do this as it breaks any existing setup.  If a flag makes sense (I don't think
> > > it is flexible enough) then would need to be volatile so it not being present
> > > will correspond to false and current situation.
> > >   
> 
> this would be another reason to simply default the pmem flag to true.
> It would allow existing setups to continue as-is.
> 
> I can make this swap, but i think the above discussions were more
> important to get started (and why this is an RFC).
> 
Agreed.  I'm in process of rebasing all the other stuff we have out of tree.
Once that's done (next week probably) I can carry this on top and that will
give us something to iterate on + develop the Linux / EDK2 side against.


Jonathan

