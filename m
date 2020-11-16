Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A062B4ED7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:09:16 +0100 (CET)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keiwF-0001C2-9Y
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1keith-0000Rt-2m
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:06:37 -0500
Received: from mga18.intel.com ([134.134.136.126]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1keitd-0006Rb-Ha
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:06:36 -0500
IronPort-SDR: PWBwtCxYx4z0/QqLYEbRD3ZnDaG1MaqdUlVAOKavHIntwKFWcWOBQRmkT2O3wc/kOqnBS2XCbE
 fzDF5kurs2ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="158564622"
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="158564622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 10:06:28 -0800
IronPort-SDR: Ok0gZTSXbtYeoh/BynT3PwKaCn8/QAzlabuBKSmUEAu3+JN0p9MmAdib+72pbAjYAIMMp5ZzGf
 8B81/UC0ofOw==
X-IronPort-AV: E=Sophos;i="5.77,483,1596524400"; d="scan'208";a="324874923"
Received: from vbenjes-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.134.15])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 10:06:28 -0800
Date: Mon, 16 Nov 2020 10:06:26 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 00/25] Introduce CXL 2.0 Emulation
Message-ID: <20201116180626.g7swvwu5jhgzwc6o@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201116172107.00005ad9@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116172107.00005ad9@Huawei.com>
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:06:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-16 17:21:07, Jonathan Cameron wrote:
> On Tue, 10 Nov 2020 21:46:59 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > Introduce emulation of Compute Express Link 2.0, which was released
> > today at https://www.computeexpresslink.org/.
> > 
> > I've pushed a branch here: https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0
> > 
> > The emulation has been critical to get the Linux enabling started
> > (https://lore.kernel.org/linux-cxl/), it would be an ideal place to land
> > regression tests for different topology handling, and there may be applications
> > for this emulation as a way for a guest to manipulate its address space relative
> > to different performance memories. I am new to QEMU development, so please
> > forgive and point me in the right direction if I severely misinterpreted where a
> > piece of infrastructure belongs.
> > 
> > Three of the five CXL component types are emulated with some level of functionality:
> > host bridge, root port, and memory device. Upstream ports and downstream ports
> > aren't implemented (the two components needed to make up a switch).
> > 
> > CXL 2.0 is built on top of PCIe (see spec for details). As a result, much of the
> > implementation utilizes existing PCI paradigms. To implement the host bridge,
> > I've chosen to use PXB (PCI Expander Bridge). It seemed to be the most natural
> > fit even though it doesn't directly map to how hardware will work. For
> > persistent capacity of the memory device, I utilized the memory subsystem
> > (hw/mem).
> > 
> > We have 3 reasons why this work is valuable:
> > 1. OS driver development and testing
> > 2. OS driver regression testing
> > 3. Possible guest support for HDMs
> > 
> > As mentioned above there are three benefits to carrying this enabling in
> > upstream QEMU:
> > 
> > 1. Linux driver feature development benefits from emulation both due to
> > a lack of initial hardware availability, but also, as is seen with
> > NVDIMM/PMEM emulation, there is value in being able to share
> > topologies with system-software developers even after hardware is
> > available.
> > 
> > 2. The Linux kernel's unit test suite for NVDIMM/PMEM ended up injecting fake
> > resources via custom modules (nfit_test). In retrospect a QEMU emulation of
> > nfit_test capabilities would have made the test environment more portable, and
> > allowed for easier community contributions of example configurations.
> > 
> > 3. This is still being fleshed out, but in short it provides a standardized
> > mechanism for the guest to provide feedback to the host about size and placement
> > needs of the memory. After the host gives the guest a physical window mapping to
> > the CXL device, the emulated HDM decoders allow the guest a way to tell the host
> > how much it wants and where. There are likely simpler ways to do this, but
> > they'd require inventing a new interface and you'd need to have diverging driver
> > code in the guest programming of the HDM decoder vs. the host. Since we've
> > already done this work, why not use it?
> > 
> > There is quite a long list of work to do for full spec compliance, but I don't
> > believe that any of it precludes merging. Off the top of my head:
> > - Main host bridge support (WIP)
> > - Interleaving
> > - Better Tests
> > - Huge swaths of firmware functionality
> > - Hot plug support
> > - Emulating volatile capacity
> > 
> > The flow of the patches in general is to define all the data structures and
> > registers associated with the various components in a top down manner. Host
> > bridge, component, ports, devices. Then, the actual implementation is done in
> > the same order.
> > 
> > The summary is:
> > 1-8: Put infrastructure in place for emulation of the components.
> > 9-11: Create the concept of a CXL bus and plumb into PXB
> > 12-16: Implement host bridges
> > 17: Implement a root port
> > 18: Implement a memory device
> > 19: Implement HDM decoders
> > 20-24: ACPI bits
> > 25: Start working on enabling the main host bridge
> 
> Hi Ben,
> 
> I've take a look at the whole series and offered a few comments in things that
> stood out.  Unfortunately I'm playing catchup on CXL 2.0 and my qemu knowledge
> is not what I'd like it to be.
> 
> Having said that, this feels like a good start to me.  Please clean up
> the few patch handling issues before a v2.  Code that appears, disappears and
> reappears is a bit distracting :)
> 
> Next up, the kernel side.
> 
> Thanks,
> 
> Jonathan

Thanks very much for taking the time Jonathan. I saw your CCIX series early on
and it was definitely helpful to me, so thanks for that as well. As you can
probably tell, this series has been rebased to hell and back and you caught some
of that in the code churn. I'll work on fixing those. I foolishly did a pretty
major refactor just before submission.

I wanted to discuss the 'dump all the defines in a patch and use them later'
style I went for. In general, I don't do this and I leave feedback on patches
that do this. I had two reasons for doing it here:
1. I wanted to separate a, 'go read the spec review' from actual functionality.
   I hope some of the issues you spotted were because of that.
2. Since I decided to make all the helper libraries first, many defines are
   needed for that.

For v2, I'll make sure there are no #define only patches, but I would still like
to introduce the helper libraries first which will leave some unused functions
and defines for a few patches.

Ben

> 
> > 
> > Ben Widawsky (23):
> >   hw/pci/cxl: Add a CXL component type (interface)
> >   hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
> >   hw/cxl/device: Introduce a CXL device (8.2.8)
> >   hw/cxl/device: Implement the CAP array (8.2.8.1-2)
> >   hw/cxl/device: Add device status (8.2.8.3)
> >   hw/cxl/device: Implement basic mailbox (8.2.8.4)
> >   hw/cxl/device: Add memory devices (8.2.8.5)
> >   hw/pxb: Use a type for realizing expanders
> >   hw/pci/cxl: Create a CXL bus type
> >   hw/pxb: Allow creation of a CXL PXB (host bridge)
> >   acpi/pci: Consolidate host bridge setup
> >   hw/pci: Plumb _UID through host bridges
> >   hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
> >   acpi/pxb/cxl: Reserve host bridge MMIO
> >   hw/pxb/cxl: Add "windows" for host bridges
> >   hw/cxl/rp: Add a root port
> >   hw/cxl/device: Add a memory device (8.2.8.5)
> >   hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
> >   acpi/cxl: Add _OSC implementation (9.14.2)
> >   acpi/cxl: Create the CEDT (9.14.1)
> >   Temp: acpi/cxl: Add ACPI0017 (CEDT awareness)
> >   WIP: i386/cxl: Initialize a host bridge
> >   qtest/cxl: Add very basic sanity tests
> > 
> > Jonathan Cameron (1):
> >   Temp: Add the PCI_EXT_ID_DVSEC definition to the qemu pci_regs.h copy.
> > 
> > Vishal Verma (1):
> >   acpi/cxl: Introduce a compat-driver UUID for CXL _OSC
> > 
> >  MAINTAINERS                               |   6 +
> >  hw/Kconfig                                |   1 +
> >  hw/acpi/Kconfig                           |   5 +
> >  hw/acpi/cxl.c                             | 198 +++++++++++++
> >  hw/acpi/meson.build                       |   1 +
> >  hw/arm/virt.c                             |   1 +
> >  hw/core/machine.c                         |  26 ++
> >  hw/core/numa.c                            |   3 +
> >  hw/cxl/Kconfig                            |   3 +
> >  hw/cxl/cxl-component-utils.c              | 192 +++++++++++++
> >  hw/cxl/cxl-device-utils.c                 | 293 +++++++++++++++++++
> >  hw/cxl/cxl-mailbox-utils.c                | 139 +++++++++
> >  hw/cxl/meson.build                        |   5 +
> >  hw/i386/acpi-build.c                      |  87 +++++-
> >  hw/i386/microvm.c                         |   1 +
> >  hw/i386/pc.c                              |   2 +
> >  hw/mem/Kconfig                            |   5 +
> >  hw/mem/cxl_type3.c                        | 334 ++++++++++++++++++++++
> >  hw/mem/meson.build                        |   1 +
> >  hw/meson.build                            |   1 +
> >  hw/pci-bridge/Kconfig                     |   5 +
> >  hw/pci-bridge/cxl_root_port.c             | 231 +++++++++++++++
> >  hw/pci-bridge/meson.build                 |   1 +
> >  hw/pci-bridge/pci_expander_bridge.c       | 209 +++++++++++++-
> >  hw/pci-bridge/pcie_root_port.c            |   6 +-
> >  hw/pci/pci.c                              |  32 ++-
> >  hw/pci/pcie.c                             |  30 ++
> >  hw/ppc/spapr.c                            |   2 +
> >  include/hw/acpi/cxl.h                     |  27 ++
> >  include/hw/boards.h                       |   2 +
> >  include/hw/cxl/cxl.h                      |  30 ++
> >  include/hw/cxl/cxl_component.h            | 181 ++++++++++++
> >  include/hw/cxl/cxl_device.h               | 199 +++++++++++++
> >  include/hw/cxl/cxl_pci.h                  | 155 ++++++++++
> >  include/hw/pci/pci.h                      |  15 +
> >  include/hw/pci/pci_bridge.h               |  25 ++
> >  include/hw/pci/pci_bus.h                  |   8 +
> >  include/hw/pci/pci_ids.h                  |   1 +
> >  include/standard-headers/linux/pci_regs.h |   1 +
> >  monitor/hmp-cmds.c                        |  15 +
> >  qapi/machine.json                         |   1 +
> >  tests/qtest/cxl-test.c                    |  93 ++++++
> >  tests/qtest/meson.build                   |   4 +
> >  43 files changed, 2547 insertions(+), 30 deletions(-)
> >  create mode 100644 hw/acpi/cxl.c
> >  create mode 100644 hw/cxl/Kconfig
> >  create mode 100644 hw/cxl/cxl-component-utils.c
> >  create mode 100644 hw/cxl/cxl-device-utils.c
> >  create mode 100644 hw/cxl/cxl-mailbox-utils.c
> >  create mode 100644 hw/cxl/meson.build
> >  create mode 100644 hw/mem/cxl_type3.c
> >  create mode 100644 hw/pci-bridge/cxl_root_port.c
> >  create mode 100644 include/hw/acpi/cxl.h
> >  create mode 100644 include/hw/cxl/cxl.h
> >  create mode 100644 include/hw/cxl/cxl_component.h
> >  create mode 100644 include/hw/cxl/cxl_device.h
> >  create mode 100644 include/hw/cxl/cxl_pci.h
> >  create mode 100644 tests/qtest/cxl-test.c
> > 
> 

