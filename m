Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40049C6CA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:48:06 +0100 (CET)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeuL-0000ay-Ug
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nCest-0007NA-Oa
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:46:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nCesq-0003pw-9G
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:46:35 -0500
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JkJfB58w7z67hRB;
 Wed, 26 Jan 2022 17:42:10 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Wed, 26 Jan 2022 10:46:29 +0100
Received: from localhost (10.47.68.156) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 26 Jan
 2022 09:46:28 +0000
Date: Wed, 26 Jan 2022 09:46:23 +0000
To: Ben Widawsky <ben.widawsky@intel.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 <linuxarm@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Saransh Gupta1 <saransh@ibm.com>,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 00/42] CXl 2.0 emulation Support
Message-ID: <20220126094623.000005c4@Huawei.com>
In-Reply-To: <20220125235503.crqfbyjtpikj3cjn@intel.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220125191806.ifbv2fuj2bik44zw@intel.com>
 <20220125235503.crqfbyjtpikj3cjn@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.68.156]
X-ClientProxiedBy: lhreml728-chm.china.huawei.com (10.201.108.79) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 25 Jan 2022 15:55:03 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> On 22-01-25 11:18:08, Ben Widawsky wrote:
> > Really awesome work Jonathan. Dan and I are wrapping up some of the ker=
nel bits,
> > so all I'll do for now is try to run this, but I hope to be able to rev=
iew the
> > parts I'm familiar with at least.
> >=20
> > On 22-01-24 17:16:23, Jonathan Cameron wrote: =20
> > > Previous version was RFC v3: CXL 2.0 Support.
> > > No longer an RFC as I would consider the vast majority of this
> > > to be ready for detailed review. There are still questions called
> > > out in some patches however.
> > >=20
> > > Looking in particular for:
> > > * Review of the PCI interactions
> > > * x86 and ARM machine interactions (particularly the memory maps)
> > > * Review of the interleaving approach - is the basic idea
> > >   acceptable?
> > > * Review of the command line interface.
> > > * CXL related review welcome but much of that got reviewed
> > >   in earlier versions and hasn't changed substantially.
> > >=20
> > > Main changes:
> > > * The CXL fixed memory windows are now instantiated via a
> > >   -cxl-fixed-memory-window command line option.  As they are host lev=
el
> > >   entities, not associated with a particular hardware entity a top
> > >   level parameter seems the most natural way to describe them.
> > >   This is also much closer to how it works on a real host than the
> > >   previous assignment of a physical address window to all components
> > >   along the CXL path. =20
> >=20
> > Excellent.
> >  =20
> > > * Dynamic host memory physical address space allocation both for
> > >   the CXL host bridge MMIO space and the CFMWS windows. =20
> >=20
> > I thought I had done the host bridge MMIO, but perhaps I was mistaken. =
Either
> > way, this is an important step to support all platforms more generally.

That is comment probably more general that it needs to be ;)  I can't remem=
ber how
much of this was done using fixed addresses but it all got rewritten
anyway.  As you've probably noticed I got lazy on change logs because lots
of changes had minor influence on a large set of patches making them fiddly
to document.

> >  =20
> > > * Interleaving support (based loosely on Philippe Mathieu-Daud=E9's
> > >   earlier work on an interleaved memory device).  Note this is rudime=
ntary
> > >   and low performance but it may be sufficient for test purposes. =20
> >=20
> > I'll have to look at this further. I had some thoughts about how we mig=
ht make
> > this fast, but it would be more of fake interleaving. How low is "low"?

The question becomes what is the purpose.  We aren't doing this emulation
to provide a realistic system, but rather to just have something we can
test kernel etc tooling against.

I'm not yet in a position to do perf tests, but given it's walking the
decoders ever time it is never going to be great.  We could look at
caching the walks, but then a bunch of locking comes into play.
Mind you right now I suspect we'll have all sorts of nasty issues
if devices are hot removed whilst transactions are in flight.
Tidying that up was one of the TODOs I forgot to list.

> >  =20
> > > * Additional PCI and memory related utility functions needed for the
> > >   interleaving.
> > > * Various minor cleanup and increase in scope of tests.
> > > * For now dropped the support for presenting CXL type 3 devices
> > >   as memory devices in various QEMU interfaces. =20
> >=20
> > What are the downsides to this? I only used the memory interface origin=
ally
> > because it seemed like a natural fit, but looking back I'm not sure we =
gain
> > much (though my memory is very lossy).

Main downside is simply that people might expect to see all their memory
devices in some of the info commands and right now the CXL ones don't show
up at all.  That doesn't necessarily mean we need to use the existing
framework, but it might make sense to extend the tools a little to include
the CXL attached memories.

> >  =20
> > > * Dropped the patch letting UID be different from bus_nr.  Whilst
> > >   it may be a useful thing to have, we don't need it for this series
> > >   and so should be handled separately.
> > >=20
> > > I've called out patches with major changes by marking them as
> > > co-developed or introducing them as new patches. The original
> > > memory window code has been dropped
> > >=20
> > > After discussions at plumbers and more recently on the mailing list
> > > it was clear that there was interest in getting emulation for CXL 2.0
> > > upstream in QEMU.  This version resolves many of the outstanding issu=
es
> > > and enables the following features:
> > >=20
> > > * Support on both x86/pc and ARM/virt with relevant ACPI tables
> > >   generated in QEMU.
> > > * Host bridge based on the existing PCI Expander Bridge PXB.
> > > * CXL fixed memory windows, allowing host to describe interleaving
> > >   across multiple CXL host bridges.
> > > * pxb-cxl CXL host bridge support including MMIO region for control
> > >   and HDM (Host manage device memory - basically interleaving / routi=
ng)
> > >   decoder configuration.
> > > * Basic CXL Root port support.
> > > * CXL Type 3 device support with persistent memory regions (backed by
> > >   hostmem backend).
> > > * Pulled MAINTAINERS entry out to a separate patch and add myself as
> > >   a co-maintainer at Ben's suggestion.
> > >=20
> > > Big TODOs:
> > >=20
> > > * Volatile memory devices (easy but it's more code so left for now).
> > > * Switch support.
> > > * Hotplug?  May not need much but it's not tested yet!
> > > * More tests and tighter verification that values written to hardware
> > >   are actually valid - stuff that real hardware would check.
> > > * Main host bridge support (not a priority for me...) =20
> >=20
> > I originally cared about this for the sake of making a system more real=
istic. I
> > now believe we should drop this entirely.
Cool. That avoids some mess around the type of a CXL host bridge that
I hadn't figured a clean way around (short of checking against all
implemented possibilities)

> >  =20
> > > * Testing, testing and more testing.  I have been running a basic
> > >   set of ARM and x86 tests on this, but there is always room for
> > >   more tests and greater automation.
> > >=20
> > > Why do we want QEMU emulation of CXL?
> > >=20
> > > As Ben stated in V3, QEMU support has been critical to getting OS
> > > software written given lack of availability of hardware supporting the
> > > latest CXL features (coupled with very high demand for support being
> > > ready in a timely fashion). What has become clear since Ben's v3
> > > is that situation is a continuous one.  Whilst we can't talk about
> > > them yet, CXL 3.0 features and OS support have been prototyped on
> > > top of this support and a lot of the ongoing kernel work is being
> > > tested against these patches.
> > >=20
> > > Other features on the qemu-list that build on these include PCI-DOE
> > > /CDAT support from the Avery Design team further showing how this
> > > code is useful.  Whilst not directly related this is also the test
> > > platform for work on PCI IDE/CMA + related DMTF SPDM as CXL both
> > > utilizes and extends those technologies and is likely to be an early
> > > adopter.
> > > Refs:
> > > CMA Kernel: https://lore.kernel.org/all/20210804161839.3492053-1-Jona=
than.Cameron@huawei.com/
> > > CMA Qemu: https://lore.kernel.org/qemu-devel/1624665723-5169-1-git-se=
nd-email-cbrowy@avery-design.com/
> > > DOE Qemu: https://lore.kernel.org/qemu-devel/1623329999-15662-1-git-s=
end-email-cbrowy@avery-design.com/
> > >=20
> > >=20
> > > As can be seen there is non trivial interaction with other areas of
> > > Qemu, particularly PCI and keeping this set up to date is proving
> > > a burden we'd rather do without :)
> > >=20
> > > Ben mentioned a few other good reasons in v3:
> > > https://lore.kernel.org/qemu-devel/20210202005948.241655-1-ben.widaws=
ky@intel.com/
> > >=20
> > > The evolution of this series perhaps leave it in a less than
> > > entirely obvious order and that may get tidied up in future postings.
> > > I'm also open to this being considered in bite sized chunks.  What
> > > we have here is about what you need for it to be useful for testing
> > > currently kernel code.
> > >=20
> > > All comments welcome.
> > >=20
> > > Ben - I lifted one patch from your git tree that didn't have a
> > > Sign-off.   hw/cxl/component Add a dumb HDM decoder handler
> > > Could you confirm you are happy for one to be added? =20
> >=20
> > Sure.

Cool. I'll put that in for v5.

> >  =20
> > >=20
> > > Example of new command line (with virt ITS patches ;)
> > >=20
> > > qemu-system-aarch64 -M virt,gic-version=3D3,cxl=3Don \
> > >  -m 4g,maxmem=3D8G,slots=3D8 \
> > >  ...
> > >  -object memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp=
/cxltest.raw,size=3D256M,align=3D256M \
> > >  -object memory-backend-file,id=3Dcxl-mem2,share=3Don,mem-path=3D/tmp=
/cxltest2.raw,size=3D256M,align=3D256M \
> > >  -object memory-backend-file,id=3Dcxl-mem3,share=3Don,mem-path=3D/tmp=
/cxltest3.raw,size=3D256M,align=3D256M \
> > >  -object memory-backend-file,id=3Dcxl-mem4,share=3Don,mem-path=3D/tmp=
/cxltest4.raw,size=3D256M,align=3D256M \
> > >  -object memory-backend-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D/tmp=
/lsa.raw,size=3D256M,align=3D256M \
> > >  -object memory-backend-file,id=3Dcxl-lsa2,share=3Don,mem-path=3D/tmp=
/lsa2.raw,size=3D256M,align=3D256M \
> > >  -object memory-backend-file,id=3Dcxl-lsa3,share=3Don,mem-path=3D/tmp=
/lsa3.raw,size=3D256M,align=3D256M \
> > >  -object memory-backend-file,id=3Dcxl-lsa4,share=3Don,mem-path=3D/tmp=
/lsa4.raw,size=3D256M,align=3D256M \ =20
> >=20
> > Is align actually necessary here?

Err.  That's been in my config a long time.  IIRC I ran into problems with =
your earlier
versions when I didn't provide it, but might not be necessary any more. Goo=
d spot.

> >  =20
> > >  -object memory-backend-file,id=3Dtt,share=3Don,mem-path=3D/tmp/tt.ra=
w,size=3D1g \ =20
> >=20
> > Did you mean to put this in there? Is it somehow used internally?

Oops. Nope - that is bad editing on my part - was part of a nvdimm test I w=
as running
to make sure I didn't accidentally break anything in the normal file backed
hostmem paths.

> >  =20
> > >  -device pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1 \
> > >  -device pxb-cxl,bus_nr=3D222,bus=3Dpcie.0,id=3Dcxl.2 \
> > >  -device cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port13,chassis=3D0,slo=
t=3D2 \
> > >  -device cxl-type3,bus=3Droot_port13,memdev=3Dcxl-mem1,lsa=3Dcxl-lsa1=
,id=3Dcxl-pmem0,size=3D256M \
> > >  -device cxl-rp,port=3D1,bus=3Dcxl.1,id=3Droot_port14,chassis=3D0,slo=
t=3D3 \
> > >  -device cxl-type3,bus=3Droot_port14,memdev=3Dcxl-mem2,lsa=3Dcxl-lsa2=
,id=3Dcxl-pmem1,size=3D256M \
> > >  -device cxl-rp,port=3D0,bus=3Dcxl.2,id=3Droot_port15,chassis=3D0,slo=
t=3D5 \
> > >  -device cxl-type3,bus=3Droot_port15,memdev=3Dcxl-mem3,lsa=3Dcxl-lsa3=
,id=3Dcxl-pmem2,size=3D256M \
> > >  -device cxl-rp,port=3D1,bus=3Dcxl.2,id=3Droot_port16,chassis=3D0,slo=
t=3D6 \
> > >  -device cxl-type3,bus=3Droot_port16,memdev=3Dcxl-mem4,lsa=3Dcxl-lsa4=
,id=3Dcxl-pmem3,size=3D256M \
> > >  -cxl-fixed-memory-window targets=3Dcxl.1,size=3D4G,interleave-granul=
arity=3D8k \
> > >  -cxl-fixed-memory-window targets=3Dcxl.1,targets=3Dcxl.2,size=3D4G,i=
nterleave-granularity=3D8k =20
> >=20
> > I assume interleave-ways is based on the number of targets. For testing=
 purposes
> > it might be nice to add the flags as well (perhaps it's there).

Good point, though not implemented yet.  Easy thing to add as a later step.

> >  =20
>=20
> This requires cxl=3Don machine arg now btw.

Absolutely.  Though I wonder if that is worth bothering with.   We could ju=
st always
reserve the memory for the host bridge MMIO and run through building empty =
CEDT
(or add sanity checks in the CEDT build code on no HB and no CFMWS =3D=3D n=
o CEDT).

I'd be interested on what various machine maintainers think on this.

Longer term it would be nice to generally cleanup the machine PA space
code to use some sort of allocator because we just added another layer
of if/else to some already deep trees based on all the optional parts.

For ARM there is one suitable for the MMIO regions (given the hack to just
allocated space for 16) but the CFMWs / device memory etc are just as
nasty to deal with as on i386/pc

>=20
> > >=20
> > > First CFMWS suitable for 2 way interleave, the second for 4 way (2 way
> > > at host level and 2 way at the host bridge).
> > > targets=3D<range of pxb-cxl uids> , multiple entries if range is disj=
oint.
> > >=20
> > > With Ben's CXL region patches (v3 shortly) plus fixes as discussed on=
 list,
> > > Linux commands to bring up a 4 way interleave is:
> > >=20
> > >  cd /sys/bus/cxl/devices/
> > >  region=3D$(cat decoder0.1/create_region)
> > >  echo $region  > decoder0.1/create_region
> > >  ls -lh
> > > =20
> > >  //Note the order of devices and adjust the following to make sure th=
ey
> > >  //are in order across the 4 root ports.  Easy to do in a tool, but
> > >  //not easy to paste in a cover letter.
> > >=20
> > >  cd region0.1\:0
> > >  echo 4 > interleave_ways
> > >  echo mem2 > target0
> > >  echo mem3 > target1
> > >  echo mem0 > target2
> > >  echo mem1 > target3
> > >  echo $((1024<<20)) > size
> > >  echo 4096 > interleave_granularity
> > >  echo region0.1:0 > /sys/bus/cxl/drivers/cxl_region/bind
> > >=20
> > > Tested with devmem2 and files with known content.
> > > Kernel tree was based on previous version of the region patches
> > > from Ben with various fixes. As Dan just posted an updated version
> > > next job on my list is to test that.
> > >=20
> > > Thanks to Shameer for his help with reviewing the new stuff before
> > > posting.
> > >=20
> > > I'll post a git tree shortly for any who prefer that to lots
> > > of emails ;)
> > >=20
> > > Thanks,
> > >=20
> > > Jonathan =20
> >=20
> > Thanks again!
> > Ben
You are welcome.

Been an interesting learning curve as all my past QEMU work
was rather more superficial than this.

Jonathan

> >=20
> > [snip]
> >=20
> >  =20


