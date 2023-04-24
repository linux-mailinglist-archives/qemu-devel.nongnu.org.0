Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5CA6ED70B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 23:58:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr4B3-0005p2-TD; Mon, 24 Apr 2023 17:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pr4Ay-0005oY-22; Mon, 24 Apr 2023 17:56:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pr4Au-00029U-JL; Mon, 24 Apr 2023 17:56:47 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q4zSx3Z53z67xLp;
 Tue, 25 Apr 2023 05:55:13 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 24 Apr
 2023 22:56:29 +0100
Date: Mon, 24 Apr 2023 22:56:26 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 <qemu-arm@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI
 eXpander Bridges
Message-ID: <20230424225626.00001219@huawei.com>
In-Reply-To: <CAFEAcA_2JP=cM-SCGVhnhnP_6zYr748=A=G=Sh+BH+gkFmwnZA@mail.gmail.com>
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
 <20230424164058.00000a3d@Huawei.com>
 <CAFEAcA_2JP=cM-SCGVhnhnP_6zYr748=A=G=Sh+BH+gkFmwnZA@mail.gmail.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Apr 2023 16:45:48 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 24 Apr 2023 at 16:41, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Mon, 24 Apr 2023 10:28:30 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > So, not knowing anything about CXL, my naive question is:
> > > this is PCI, why can't we handle it the way we handle everything
> > > else PCI, i.e. present the PCI controller in the DTB and it's
> > > the guest kernel's job to probe, enumerate, etc whatever it wants ?  
> >
> > Absolutely the kernel will still do the enumeration.  But there's a problem
> > - it won't always work, unless there is 'enough room'.
> >
> > If the aim is to do it in a similar fashion to how PCI Expander Bridges (PXB)
> > are handled today with ACPI (we could look at doing something different of course)
> >
> > We have one set of memory windows for assigning PCI bars into etc. In the model
> > used for PXB, that set of resources is shared between different host bridges
> > including the main one (each one has separate DT description).
> >
> > So for virt, VIRT_PCIE_MMIO, VIRT_PCIE_IO, VIRT_PCIE_ECAM, VIRT_HIGH_PCIE_ECAM
> > and VIRT_HIGH_PCIE_MMIO are split up between the host bridges.
> > Each host bridge has it's own DT description.
> >
> > For ACPI, how to split up available memory windows up depends on the requirements
> > of the PCIe devices below the host bridges.  For ACPI we 'know' the answer
> > as to what is required at the point of creating the description because EDK2
> > did the work for us.  For DT we currently don't.  What to do about that is the
> > question this RFC tries to address.
> >
> > In theory we could change the kernel to support enumerating PXB instances, but
> > that's a very different model from today where they are just 'standard'
> > host bridges, using the generic bindings for ACPI (and after this patch for DT).  
> 
> On the other hand, having QEMU enumerate PCI devices is *also* a
> very different model from today, where we assume that the guest
> code is the one that is going to deal with enumerating PCI devices.
> To my mind one of the major advantages of PCI is exactly that it
> is entirely probeable and discoverable, so that there is no need
> for the dtb to include a lot of information that the kernel can
> find out for itself by directly asking the hardware...

I absolutely agree that QEMU enumerating PCI seem silly level of complexity
to introduce. So easy route is to just use the bus numbers to partition
resources. We have those available without any complexity. It's not the
same as how it's done with ACPI, but then the alternatives are either
(though maybe they are closer).  Note current proposed algorithm may be
too simplistic (perhaps some alignment forcing should adjust the division
of the resources to start on round number addresses)

More complex route will be to push the whole problem to the kernel.
I doubt we'll get any agreement to add this to the generic host
bridge DT bindings given it's just to support QEMU specific host bridges
which the kernel has previously had no knowledge of beyond as generic
PCIe Host bridges. So we'd need QEMU to detect the presence of PXB
instances then use a new DT compatible for the main host bridge
and kick off a new type of host bridge discovery.
Probably also need to modify EDK2 to recognize this, which will give
us compatibility problems with existing ACPI usage (EDK2 is reading
the DT bindings so kick off it's PCIe enumeration so this gets fiddly)
May also have problems with the kernel having to do late discovery of
host bridges (not tried it but sounds 'interesting'.)

Anyhow, I promised some illustrative examples.

For reference, here's one of my test configurations
(slightly pathological as it exercises some of the heuristics in enumeration)

-+-[0000:00]-+-00.0  Red Hat, Inc. QEMU PCIe Host bridge
 |           +-01.0-[01]--
 |           +-02.0  Red Hat, Inc. Virtio block device
 |           +-03.0  Red Hat, Inc. Virtio network device
 |           +-04.0  Red Hat, Inc. QEMU PCIe Expander bridge
 |           \-05.0  Red Hat, Inc. QEMU PCIe Expander bridge
 +-[0000:0c]---00.0-[0d-0f]--+-00.0-[0e-0f]----00.0-[0f]----00.0  Red Hat, Inc. Virtio RNG
 |                           \-00.1  Red Hat, Inc. Virtio RNG
 \-[0000:30]---00.0-[31]----00.0  Red Hat, Inc. Virtio RNG

It's somewhat easier to see the current ACPI results vs what this
patch proposed for DT by looking at /proc/iomem than looking at the
firmware descriptions themselves. /proc/iomem includes
the firmware described host bridge windows and the PCI buses and devices
enumerated below them (EDK2 enumerated for ACPI, Linux kernel for DT)
There are some other subtle differences of how the memory is mapped, but
hopefully you can see the relationship between what happens with ACPI
(requiring enumeration) and the proposal in this RFC for DT which doesn't.

Relevant chunks of /proc/iomem for ACPI for 32 bit region (64 bit one similar.)
//FW described main HB
10000000-103fffff : PCI Bus 0000:00
  //Everything indented discovered by enumeration of PCI bus.
  10000000-101fffff : PCI Bus 0000:01
  10200000-1023ffff : 0000:00:03.0
  10240000-10240fff : 0000:00:01.0
  10241000-10241fff : 0000:00:02.0
  10242000-10242fff : 0000:00:03.0
//FW described. 1st PXB on bus 0xc
//Key is start is defined as previous enumerated device end + some heuristic driven padding.
10400000-10700fff : PCI Bus 0000:0c
  10400000-105fffff : PCI Bus 0000:0d
    10400000-10400fff : PCI Bus 0000:0e
      10400000-10400fff : PCI Bus 0000:0f
        10400000-10400fff : 0000:0f:00.0
    10401000-10401fff : 0000:0d:00.1
  10600000-10600fff : 0000:0c:00.0
//FW described spare bit assigned to main HB
10701000-107fffff : PCI Bus 0000:00
//FW described. 2nd PXB on bus 0x30
//Key is start is defined as previous enumerated device end + some heuristic driven padding.
10800000-10a00fff : PCI Bus 0000:30
  10800000-108fffff : PCI Bus 0000:31
    10800000-10800fff : 0000:31:00.0
  10900000-10900fff : 0000:30:00.0
10a01000-3efeffff : PCI Bus 0000:00

DT version of equivalent from this patch.  Mem split up based only bus numbers.
//FW described.
10000000-1233f3ff : pcie@10000000
  //Everything indented is enumerated by the linux kernel
  10000000-101fffff : PCI Bus 0000:01
  10200000-1023ffff : 0000:00:03.0
  10240000-10240fff : 0000:00:01.0
  10241000-10241fff : 0000:00:02.0
  10242000-10242fff : 0000:00:03.0
//lots of space here

//FW described 1st PXB - note way above end of previous enumerated region.
1233f400-18cfcfff : pcie@1233f400
  12340000-12340fff : 0001:0c:00.0
  12400000-126fffff : PCI Bus 0001:0d
    12400000-125fffff : PCI Bus 0001:0e
      12400000-125fffff : PCI Bus 0001:0f
        12400000-12400fff : 0001:0f:00.0
  12600000-12600fff : 0001:0d:00.1
//lots of space here..

//FW described 2nd PXB - note way above en of previous enumerated region.
18cfd000-3efeffff : pcie@18cfd000
  18cfd000-18cfdfff : 0002:30:00.0
  18d00000-18efffff : PCI Bus 0002:31
    18d00000-18d00fff : 0002:31:00.0
//lots of space here.


Note the main bridge CRS and hence /proc/iomem entries have entries after
the PXBs because QEMU provides the left over bits
of the window, even though there is no easy way to use them. For the DT
scheme they end up in the space for which ever PXB has the highest bus
number.

In this case we have masses of room in the DT scheme as all the devices
have small bars. I have test cases that fail to have enough room
but those are even worse to read and require hacks to the PCI test device
driver.

I'm not great at reading DT binary from sysfs so some dt version of this
ripped from /proc/iomem above rather than directly

//Only first entry of each _CRS type is actually useful.
//In DT node: pcie@10000000
Device (PCI0)
{
    Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
    Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
    Name (_SEG, Zero)  // _SEG: PCI Segment
    Name (_BBN, Zero)  // _BBN: BIOS Bus Number
...
    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
//Bus numbers 0 to B :
// DT bus-range = [0, b]
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0000,             // Range Minimum
            0x000B,             // Range Maximum
            0x0000,             // Translation Offset
            0x000C,             // Length
            ,, )
//First part to cover devices enumeratd + space from heuristics (bit of padding)
// DT ranges first entry 10000000-1233f3ff : pcie@10000000
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0x10000000,         // Range Minimum
            0x103FFFFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x00400000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
//A hole from enumeration of the PXBs.  Doesn't exist in DT form...
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0x10701000,         // Range Minimum
            0x107FFFFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x000FF000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
//Left over above PXBs. Doesn't exist in DT form where we assign 'the rest' to
//the PXB with the highest bus number.
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0x10A01000,         // Range Minimum
            0x3EFEFFFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x2E5EF000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
//First part to cover devices enumerated (+ space from heuristics)
//I left whole range for IO on DT version.  Don't really care about this being available
//for modern PCIe devices below PXBs anyway.
        DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
            0x00000000,         // Granularity
            0x00000000,         // Range Minimum
            0x00000FFF,         // Range Maximum
            0x3EFF0000,         // Translation Offset
            0x00001000,         // Length
            ,, , TypeStatic, DenseTranslation)
//Left over of original window - no used by anything
        DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
            0x00000000,         // Granularity
            0x00003000,         // Range Minimum
            0x0000FFFF,         // Range Maximum
            0x3EFF0000,         // Translation Offset
            0x0000D000,         // Length
            ,, , TypeStatic, DenseTranslation)
//First part to cover the devices enumerated.
// DT proportional version: 8000000000-85ffffffff : pcie@10000000
// Note that in this example all the devices have small BARs so with enumeration
// they don't need as much space as I gave with DT version.
        QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x0000000000000000, // Granularity
            0x0000008000000000, // Range Minimum
            0x00000080000FFFFF, // Range Maximum
            0x0000000000000000, // Translation Offset
            0x0000000000100000, // Length
            ,, , AddressRangeMemory, TypeStatic)
//Left over of original window - not used by anything.
        QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x0000000000000000, // Granularity
            0x0000008000400000, // Range Minimum
            0x000000FFFFFFFFFF, // Range Maximum
            0x0000000000000000, // Translation Offset
            0x0000007FFFC00000, // Length
            ,, , AddressRangeMemory, TypeStatic)
    })
...

Device (PC0C)
{
    Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
    Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
    Name (_BBN, 0x0C)  // _BBN: BIOS Bus Number
    Name (_UID, 0x0C)  // _UID: Unique ID
... 
    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
// IO space big enough for enumerated devices on first PXB
// For DT I gave no IO space to PXBs for now.
        DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
            0x00000000,         // Granularity
            0x00001000,         // Range Minimum
            0x00001FFF,         // Range Maximum
            0x3EFF0000,         // Translation Offset
            0x00001000,         // Length
            ,, , TypeStatic, DenseTranslation)
//Lower mem region for enumerated devices on first PXB
//DT : 1233f400-18cfcfff : pcie@1233f400
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0x10400000,         // Range Minimum
            0x10700FFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x00301000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
//High mem region for enumerated devices on first PXB
//DT: 8600000000-97ffffffff : pcie@1233f400
        QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x0000000000000000, // Granularity
            0x0000008000100000, // Range Minimum
            0x00000080002FFFFF, // Range Maximum
            0x0000000000000000, // Translation Offset
            0x0000000000200000, // Length
            ,, , AddressRangeMemory, TypeStatic)
//PXB covers bus numbers 0xc to 0xf
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x000C,             // Range Minimum
            0x000F,             // Range Maximum
            0x0000,             // Translation Offset
            0x0004,             // Length
            ,, )
    })
Device (PC30)
{
    Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
    Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
    Name (_BBN, 0x30)  // _BBN: BIOS Bus Number
    Name (_UID, 0x30)  // _UID: Unique ID
    Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
    Name (_CCA, One)  // _CCA: Cache Coherency Attribute
    Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
//IO space for 2nd PXB - punched out of the main bus space.
//DT: Again no IO space.
        DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
            0x00000000,         // Granularity
            0x00002000,         // Range Minimum
            0x00002FFF,         // Range Maximum
            0x3EFF0000,         // Translation Offset
            0x00001000,         // Length
            ,, , TypeStatic, DenseTranslation)
//low mem space for 2nd PXB punched out of main host bridge space.
// DT: 18cfd000-3efeffff : pcie@18cfd000
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0x10800000,         // Range Minimum
            0x10A00FFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x00201000,         // Length
            ,, , AddressRangeMemory, TypeStatic)#
//high mem space for 2nd PXB punched out main host bridge space.
// DT: 9800000000-ffffffffff : pcie@18cfd000
        QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x0000000000000000, // Granularity
            0x0000008000300000, // Range Minimum
            0x00000080003FFFFF, // Range Maximum
            0x0000000000000000, // Translation Offset
            0x0000000000100000, // Length
            ,, , AddressRangeMemory, TypeStatic)
// Just 2 bus numbers (directly connected device)
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0030,             // Range Minimum
            0x0031,             // Range Maximum
            0x0000,             // Translation Offset
            0x0002,             // Length
            ,, )
        })

Maybe this mess will help illustrate the issues and approaches.

I personally think the rough approach of this patch is most sensible.
Don't enumerate the bus at all for DT case, just do partitioning based
on bus numbers.  In corner cases that will mean the kernel enumeration
fails when things would have worked with current ACPI / EDK2 dance
to allow enumeration before the ACPI tables the kernel uses are written.

Jonathan

> 
> thanks
> -- PMM


