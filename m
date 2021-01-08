Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF62EF7A2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:46:57 +0100 (CET)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwmm-000636-UL
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kxwl3-0004fI-SN
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:45:09 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kxwku-0006Y6-Qg
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:45:04 -0500
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DCBlg0jKkz67Wj1;
 Sat,  9 Jan 2021 02:41:51 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 8 Jan 2021 19:44:41 +0100
Received: from localhost (10.47.67.93) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 8 Jan 2021
 18:44:41 +0000
Date: Fri, 8 Jan 2021 18:44:04 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v2 00/32] CXL 2.0 Support
Message-ID: <20210108184404.00004b2e@Huawei.com>
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.67.93]
X-ClientProxiedBy: lhreml753-chm.china.huawei.com (10.201.108.203) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Da?= =?ISO-8859-1?Q?ud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Prashant V Agarwal <agpr123@gmail.com>, Dan
 Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Jan 2021 08:52:51 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> Fixes since v1 [1]:
>  * Defer introducing some commands/registers not yet used (Ben)
>  * Add stubbed device_reg_init_common() (Ben)
>  * Improve assertions in DVSEC creation (Jonathan)
>  * Use 'n' for HDM register offsets (Jonathan)
>  * Correct revision ID for extensions (Jonathan)
>  * Minor cleanups and clarifications (Jonathan)
>  * Remove error codes not yet used (Jonathan)
>  * Fix interrupt enable bit width (Jonathan)
>  * Add comment for weird register size (Jonathan)
>  * Break out register alignment checks (Jonathan)
>  * Use the reg alignment helper (Jonathan)
>  * Rename error codes to match spec
>  * Fix cap count mid series (Jonathan)
> 
> New since v1 [1]:
>  * Entirely reworked framework for firmware handling
>  * Implemented more device commands
>  * CEL support
> 
> (There are some new patches that I just named 'v2' for simplicity's sake)
> 
> Introduce emulation of Compute Express Link 2.0
> (https://www.computeexpresslink.org/).

Hi Ben,

In interests of avoid duplication, I thought I'd give a quick update of where
I am. I have what is here working on arm64 (enabling is fairly simple).
I'll have a bit more feedback next week and hopefully have time for an indepth review.

I did run into some issues around alignment for the persistent memory that
(I think) are down to the fact the memory-backend isn't quite tied up to the
device.

Flows wise, I initially started hacking in NFIT building changes in qemu but I'm not
yet sure how the hotplug flows are supposed to work and who is responsible for
setting up a hotplugged device (OS or firmware).

Plans wise, I was thinking I could look at DOE emulation as seems that we'll
be needing that fairly soon to get any useful memory usecases up and running.
Let me know if you already have that underway.  

Jonathan

> 
> The emulation has been critical to get the Linux enabling started [2], it would
> be an ideal place to land regression tests for different topology handling, and
> there may be applications for this emulation as a way for a guest to manipulate
> its address space relative to different performance memories.
> 
> Three of the five CXL component types are emulated with some level of functionality:
> host bridge, root port, and memory device. Upstream ports and downstream ports
> aren't implemented (the two components needed to make up a switch).
> 
> CXL 2.0 is built on top of PCIe (see spec for details). As a result, much of the
> implementation utilizes existing PCI paradigms. To implement the host bridge,
> I've chosen to use PXB (PCI Expander Bridge). It seemed to be the most natural
> fit even though it doesn't directly map to how hardware will work. For
> persistent capacity of the memory device, I utilized the memory subsystem
> (hw/mem).
> 
> We have 3 reasons why this work is valuable:
> 1. OS driver development and testing
> 2. OS driver regression testing
> 3. Possible guest support for HDMs
> 
> As mentioned above there are three benefits to carrying this enabling in
> upstream QEMU:
> 
> 1. Linux driver feature development benefits from emulation both due to
> a lack of initial hardware availability, but also, as is seen with
> NVDIMM/PMEM emulation, there is value in being able to share
> topologies with system-software developers even after hardware is
> available.
> 
> 2. The Linux kernel's unit test suite for NVDIMM/PMEM ended up injecting fake
> resources via custom modules (nfit_test). In retrospect a QEMU emulation of
> nfit_test capabilities would have made the test environment more portable, and
> allowed for easier community contributions of example configurations.
> 
> 3. This is still being fleshed out, but in short it provides a standardized
> mechanism for the guest to provide feedback to the host about size and placement
> needs of the memory. After the host gives the guest a physical window mapping to
> the CXL device, the emulated HDM decoders allow the guest a way to tell the host
> how much it wants and where. There are likely simpler ways to do this, but
> they'd require inventing a new interface and you'd need to have diverging driver
> code in the guest programming of the HDM decoder vs. the host. Since we've
> already done this work, why not use it?
> 
> There is quite a long list of work to do for full spec compliance, but I don't
> believe that any of it precludes merging. Off the top of my head:
> - Main host bridge support (WIP)
> - Interleaving
> - Better Tests
> - Huge swaths of firmware functionality
> - Hot plug support
> - Emulating volatile capacity
> 
> The flow of the patches in general is to define all the data structures and
> registers associated with the various components in a top down manner. Host
> bridge, component, ports, devices. Then, the actual implementation is done in
> the same order.
> 
> The summary is:
> 1-8: Put infrastructure in place for emulation of the components.
> 9-12: Implement device mailboxes
> 13-15: Create the concept of a CXL bus and plumb into PXB
> 16-22: Implement host bridges
> 23: Implement a root port
> 24: Implement a memory device
> 25: Implement HDM decoders
> 26-30: ACPI bits
> 31: Start working on enabling the main host bridge
> 32: Basic test case
> 
> [1]: https://lore.kernel.org/qemu-devel/20201111054724.794888-1-ben.widawsky@intel.com/
> [2]: https://lore.kernel.org/linux-cxl/20201209002418.1976362-1-ben.widawsky@intel.com/
> 
> Ben Widawsky (31):
>   hw/pci/cxl: Add a CXL component type (interface)
>   hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
>   hw/cxl/device: Introduce a CXL device (8.2.8)
>   hw/cxl/device: Implement the CAP array (8.2.8.1-2)
>   hw/cxl/device: Add device status (8.2.8.3)
>   hw/cxl/device: Implement basic mailbox (8.2.8.4)
>   hw/cxl/device: Add memory devices (8.2.8.5)
>   hw/cxl/device: Add cheap EVENTS implementation (8.2.9.1)
>   hw/cxl/device: Placeholder for firmware commands (8.2.9.2)
>   hw/cxl/device: Timestamp implementation (8.2.9.3)
>   hw/cxl/device: Add log commands (8.2.9.4) + CEL
>   hw/pxb: Use a type for realizing expanders
>   hw/pci/cxl: Create a CXL bus type
>   hw/pxb: Allow creation of a CXL PXB (host bridge)
>   qtest: allow DSDT acpi table changes
>   acpi/pci: Consolidate host bridge setup
>   tests/acpi: remove stale allowed tables
>   hw/pci: Plumb _UID through host bridges
>   hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
>   acpi/pxb/cxl: Reserve host bridge MMIO
>   hw/pxb/cxl: Add "windows" for host bridges
>   hw/cxl/rp: Add a root port
>   hw/cxl/device: Add a memory device (8.2.8.5)
>   hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
>   acpi/cxl: Add _OSC implementation (9.14.2)
>   tests/acpi: allow CEDT table addition
>   acpi/cxl: Create the CEDT (9.14.1)
>   Temp: acpi/cxl: Add ACPI0017 (CEDT awareness)
>   tests/acpi: Add new CEDT files
>   WIP: i386/cxl: Initialize a host bridge
>   qtest/cxl: Add very basic sanity tests
> 
> Jonathan Cameron (1):
>   Temp: Add the PCI_EXT_ID_DVSEC definition to the qemu pci_regs.h copy.
> 
>  MAINTAINERS                               |   6 +
>  hw/Kconfig                                |   1 +
>  hw/acpi/Kconfig                           |   5 +
>  hw/acpi/cxl.c                             | 173 ++++++++++
>  hw/acpi/meson.build                       |   1 +
>  hw/arm/virt.c                             |   1 +
>  hw/core/machine.c                         |  26 ++
>  hw/core/numa.c                            |   3 +
>  hw/cxl/Kconfig                            |   3 +
>  hw/cxl/cxl-component-utils.c              | 193 +++++++++++
>  hw/cxl/cxl-device-utils.c                 | 278 ++++++++++++++++
>  hw/cxl/cxl-mailbox-utils.c                | 386 ++++++++++++++++++++++
>  hw/cxl/meson.build                        |   5 +
>  hw/i386/acpi-build.c                      |  87 ++++-
>  hw/i386/microvm.c                         |   1 +
>  hw/i386/pc.c                              |   2 +
>  hw/mem/Kconfig                            |   5 +
>  hw/mem/cxl_type3.c                        | 334 +++++++++++++++++++
>  hw/mem/meson.build                        |   1 +
>  hw/meson.build                            |   1 +
>  hw/pci-bridge/Kconfig                     |   5 +
>  hw/pci-bridge/cxl_root_port.c             | 231 +++++++++++++
>  hw/pci-bridge/meson.build                 |   1 +
>  hw/pci-bridge/pci_expander_bridge.c       | 209 +++++++++++-
>  hw/pci-bridge/pcie_root_port.c            |   6 +-
>  hw/pci/pci.c                              |  32 +-
>  hw/pci/pcie.c                             |  30 ++
>  hw/ppc/spapr.c                            |   2 +
>  include/hw/acpi/cxl.h                     |  27 ++
>  include/hw/boards.h                       |   2 +
>  include/hw/cxl/cxl.h                      |  30 ++
>  include/hw/cxl/cxl_component.h            | 187 +++++++++++
>  include/hw/cxl/cxl_device.h               | 210 ++++++++++++
>  include/hw/cxl/cxl_pci.h                  | 160 +++++++++
>  include/hw/pci/pci.h                      |  15 +
>  include/hw/pci/pci_bridge.h               |  25 ++
>  include/hw/pci/pci_bus.h                  |   8 +
>  include/hw/pci/pci_ids.h                  |   1 +
>  include/standard-headers/linux/pci_regs.h |   1 +
>  monitor/hmp-cmds.c                        |  15 +
>  qapi/machine.json                         |   1 +
>  tests/data/acpi/pc/CEDT                   | Bin 0 -> 36 bytes
>  tests/data/acpi/pc/DSDT                   | Bin 5065 -> 5065 bytes
>  tests/data/acpi/pc/DSDT.acpihmat          | Bin 6390 -> 6390 bytes
>  tests/data/acpi/pc/DSDT.bridge            | Bin 6924 -> 6924 bytes
>  tests/data/acpi/pc/DSDT.cphp              | Bin 5529 -> 5529 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm           | Bin 6719 -> 6719 bytes
>  tests/data/acpi/pc/DSDT.hpbridge          | Bin 5026 -> 5026 bytes
>  tests/data/acpi/pc/DSDT.hpbrroot          | Bin 3084 -> 3084 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs           | Bin 5137 -> 5137 bytes
>  tests/data/acpi/pc/DSDT.memhp             | Bin 6424 -> 6424 bytes
>  tests/data/acpi/pc/DSDT.numamem           | Bin 5071 -> 5071 bytes
>  tests/data/acpi/pc/DSDT.roothp            | Bin 5261 -> 5261 bytes
>  tests/data/acpi/q35/CEDT                  | Bin 0 -> 36 bytes
>  tests/data/acpi/q35/DSDT                  | Bin 7801 -> 7801 bytes
>  tests/data/acpi/q35/DSDT.acpihmat         | Bin 9126 -> 9126 bytes
>  tests/data/acpi/q35/DSDT.bridge           | Bin 7819 -> 7819 bytes
>  tests/data/acpi/q35/DSDT.cphp             | Bin 8265 -> 8265 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm          | Bin 9455 -> 9455 bytes
>  tests/data/acpi/q35/DSDT.ipmibt           | Bin 7876 -> 7876 bytes
>  tests/data/acpi/q35/DSDT.memhp            | Bin 9160 -> 9160 bytes
>  tests/data/acpi/q35/DSDT.mmio64           | Bin 8932 -> 8932 bytes
>  tests/data/acpi/q35/DSDT.numamem          | Bin 7807 -> 7807 bytes
>  tests/qtest/cxl-test.c                    |  93 ++++++
>  tests/qtest/meson.build                   |   4 +
>  65 files changed, 2777 insertions(+), 30 deletions(-)
>  create mode 100644 hw/acpi/cxl.c
>  create mode 100644 hw/cxl/Kconfig
>  create mode 100644 hw/cxl/cxl-component-utils.c
>  create mode 100644 hw/cxl/cxl-device-utils.c
>  create mode 100644 hw/cxl/cxl-mailbox-utils.c
>  create mode 100644 hw/cxl/meson.build
>  create mode 100644 hw/mem/cxl_type3.c
>  create mode 100644 hw/pci-bridge/cxl_root_port.c
>  create mode 100644 include/hw/acpi/cxl.h
>  create mode 100644 include/hw/cxl/cxl.h
>  create mode 100644 include/hw/cxl/cxl_component.h
>  create mode 100644 include/hw/cxl/cxl_device.h
>  create mode 100644 include/hw/cxl/cxl_pci.h
>  create mode 100644 tests/data/acpi/pc/CEDT
>  create mode 100644 tests/data/acpi/q35/CEDT
>  create mode 100644 tests/qtest/cxl-test.c
> 


