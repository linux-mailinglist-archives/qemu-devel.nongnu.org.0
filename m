Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008F44CEC9D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 18:43:14 +0100 (CET)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQuuX-0003Ce-Jk
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 12:43:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQutA-0001rr-D8
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 12:41:49 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQut6-0001uR-Ry
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 12:41:48 -0500
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KBTPd49pYz67MfC;
 Mon,  7 Mar 2022 01:40:05 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 6 Mar 2022 18:41:27 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sun, 6 Mar 2022 17:41:26 +0000
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v7 00/46] CXl 2.0 emulation Support
Date: Sun, 6 Mar 2022 17:40:51 +0000
Message-ID: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Ideally I'd love it if we could start picking up the earlier
sections of this series as I think those have been reasonably
well reviewed and should not be particularly controversial.
(perhaps up to patch 15 inline with what Michael Tsirkin suggested
on v5).

There is one core memory handling related patch (34) marked as RFC.
Whilst it's impact seems small to me, I'm not sure it is the best way
to meet our requirements wrt interleaving.

Changes since v7:

Thanks to all who have taken a look.
Small amount of reordering was necessary due to LSA fix in patch 17.
Test moved forwards to patch 22 and so all intermediate patches
move -1 in the series.

(New stuff)
- Switch support.  Needed to support more interesting topologies.
(Ben Widawsky)
- Patch 17: Fix reversed condition on presence of LSA that meant these never
  got properly initialized. Related change needed to ensure test for cxl_type3
  always needs an LSA. We can relax this later when adding volatile memory
  support.
(Markus Armbuster)
- Patch 27: Change -cxl-fixed-memory-window option handling to use
  qobject_input_visitor_new_str().  This changed the required handling of
  targets parameter to require an array index and hence test and docs updates.
  e.g. targets.1=cxl_hb0,targets.2=cxl_hb1
  (Patches 38,40,42,43)
- Missing structure element docs and version number (optimisitic :)
(Alex Bennée)
- Added Reviewed-by tags.  Thanks!.
- Series wise: Switch to compiler.h QEMU_BUILD_BUG_ON/MSG QEMU_PACKED
  and QEMU_ALIGNED as Alex suggested in patch 20.
- Patch 6: Dropped documentation for a non-existent lock.
           Added error code suitable for unimplemented commands.
	   Reordered code for better readability.
- Patch 9: Reorder as suggested to avoid a goto.
- Patch 16: Add LOG_UNIMP message where feature not yet implemented.
            Drop "Explain" comment that doesn't explain anything.
- Patch 18: Drop pointless void * cast.
            Add assertion as suggested (without divide)
- Patch 19: Use pstrcpy rather than snprintf for a fixed string.
            The compiler.h comment was in this patch but affects a
	    number of other patches as well.
- Patch 20: Move structure CXLType3Dev to header when originally
            introduced so changes are more obvious in this patch.
- Patch 21: Substantial refactor to resolve unclear use of sizeof
            on the LSA command header. Now uses a variable length
	    last element so we can use offsetof()
- Patch 22: Use g_autoptr() to avoid need for explicit free in tests
  	    Similar in later patches.
- Patch 29: Minor reorganziation as suggested.
	    
(Tidy up from me)
- Trivial stuff like moving header includes to patch where first used.
- Patch 17: Drop ifndef protections from TYPE_CXL_TYPE3_DEV as there
            doesn't seem to be a reason.

Series organized to allow it to be taken in stages if the maintainers
prefer that approach. Most sets end with the addition of appropriate
tests (TBD for final set)

Patches 0-15 - CXL PXB
Patches 16-22 - Type 3 Device, Root Port
Patches 23-40 - ACPI, board elements and interleave decoding to enable x86 hosts
Patches 41-42 - arm64 support on virt.
Patch 43 - Initial documentation
Patches 44-46 - Switch support.

Gitlab CI is proving challenging to get a completely clean bill of health
as there seem to be some intermittent failures in common with the
main QEMU gitlab. In particular an ASAN leak error that appears in some
upstream CI runs and build-oss-fuzz timeouts.
Results at http://gitlab.com/jic23/qemu cxl-v7-draft-2-for-test
which also includes the DOE/CDAT patches serial number support which
will form part of a future series.

Updated background info:

Looking in particular for:
* Review of the PCI interactions
* x86 and ARM machine interactions (particularly the memory maps)
* Review of the interleaving approach - is the basic idea
  acceptable?
* Review of the command line interface.
* CXL related review welcome but much of that got reviewed
  in earlier versions and hasn't changed substantially.

Big TODOs:

* Volatile memory devices (easy but it's more code so left for now).
* Hotplug?  May not need much but it's not tested yet!
* More tests and tighter verification that values written to hardware
  are actually valid - stuff that real hardware would check.
* Testing, testing and more testing.  I have been running a basic
  set of ARM and x86 tests on this, but there is always room for
  more tests and greater automation.
* CFMWS flags as requested by Ben.

Why do we want QEMU emulation of CXL?

As Ben stated in V3, QEMU support has been critical to getting OS
software written given lack of availability of hardware supporting the
latest CXL features (coupled with very high demand for support being
ready in a timely fashion). What has become clear since Ben's v3
is that situation is a continuous one. Whilst we can't talk about
them yet, CXL 3.0 features and OS support have been prototyped on
top of this support and a lot of the ongoing kernel work is being
tested against these patches. The kernel CXL mocking code allows
some forms of testing, but QEMU provides a more versatile and
exensible platform.

Other features on the qemu-list that build on these include PCI-DOE
/CDAT support from the Avery Design team further showing how this
code is useful. Whilst not directly related this is also the test
platform for work on PCI IDE/CMA + related DMTF SPDM as CXL both
utilizes and extends those technologies and is likely to be an early
adopter.
Refs:
CMA Kernel: https://lore.kernel.org/all/20210804161839.3492053-1-Jonathan.Cameron@huawei.com/
CMA Qemu: https://lore.kernel.org/qemu-devel/1624665723-5169-1-git-send-email-cbrowy@avery-design.com/
DOE Qemu: https://lore.kernel.org/qemu-devel/1623329999-15662-1-git-send-email-cbrowy@avery-design.com/

As can be seen there is non trivial interaction with other areas of
Qemu, particularly PCI and keeping this set up to date is proving
a burden we'd rather do without :)

Ben mentioned a few other good reasons in v3:
https://lore.kernel.org/qemu-devel/20210202005948.241655-1-ben.widawsky@intel.com/

What we have here is about what you need for it to be useful for testing
currently kernel code.  Note the kernel code is moving fast so
since v4, some features have been introduced we don't yet support in
QEMU (e.g. use of the PCIe serial number extended capability).

All comments welcome.

Additional info that was here in v5 is now in the documentation patch.

Thanks,

Jonathan

Ben Widawsky (24):
  hw/pci/cxl: Add a CXL component type (interface)
  hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
  hw/cxl/device: Introduce a CXL device (8.2.8)
  hw/cxl/device: Implement the CAP array (8.2.8.1-2)
  hw/cxl/device: Implement basic mailbox (8.2.8.4)
  hw/cxl/device: Add memory device utilities
  hw/cxl/device: Add cheap EVENTS implementation (8.2.9.1)
  hw/cxl/device: Timestamp implementation (8.2.9.3)
  hw/cxl/device: Add log commands (8.2.9.4) + CEL
  hw/pxb: Use a type for realizing expanders
  hw/pci/cxl: Create a CXL bus type
  hw/pxb: Allow creation of a CXL PXB (host bridge)
  hw/cxl/rp: Add a root port
  hw/cxl/device: Add a memory device (8.2.8.5)
  hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
  hw/cxl/device: Add some trivial commands
  hw/cxl/device: Plumb real Label Storage Area (LSA) sizing
  hw/cxl/device: Implement get/set Label Storage Area (LSA)
  hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
  acpi/cxl: Add _OSC implementation (9.14.2)
  acpi/cxl: Create the CEDT (9.14.1)
  acpi/cxl: Introduce CFMWS structures in CEDT
  hw/cxl/component Add a dumb HDM decoder handler
  qtest/cxl: Add more complex test cases with CFMWs

Jonathan Cameron (22):
  MAINTAINERS: Add entry for Compute Express Link Emulation
  cxl: Machine level control on whether CXL support is enabled
  qtest/cxl: Introduce initial test for pxb-cxl only.
  qtests/cxl: Add initial root port and CXL type3 tests
  hw/cxl/component: Add utils for interleave parameter encoding/decoding
  hw/cxl/host: Add support for CXL Fixed Memory Windows.
  hw/pci-host/gpex-acpi: Add support for dsdt construction for pxb-cxl
  pci/pcie_port: Add pci_find_port_by_pn()
  CXL/cxl_component: Add cxl_get_hb_cstate()
  mem/cxl_type3: Add read and write functions for associated hostmem.
  cxl/cxl-host: Add memops for CFMWS region.
  RFC: softmmu/memory: Add ops to memory_region_ram_init_from_file
  i386/pc: Enable CXL fixed memory windows
  tests/acpi: q35: Allow addition of a CXL test.
  qtests/bios-tables-test: Add a test for CXL emulation.
  tests/acpi: Add tables for CXL emulation.
  hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances
    pxb-cxl
  qtest/cxl: Add aarch64 virt test for CXL
  docs/cxl: Add initial Compute eXpress Link (CXL) documentation.
  pci-bridge/cxl_upstream: Add a CXL switch upstream port
  pci-bridge/cxl_downstream: Add a CXL switch downstream port
  cxl/cxl-host: Support interleave decoding with one level of switches.

 MAINTAINERS                         |   7 +
 docs/system/device-emulation.rst    |   1 +
 docs/system/devices/cxl.rst         | 302 +++++++++++++++++
 hw/Kconfig                          |   1 +
 hw/acpi/Kconfig                     |   5 +
 hw/acpi/cxl-stub.c                  |  12 +
 hw/acpi/cxl.c                       | 231 +++++++++++++
 hw/acpi/meson.build                 |   4 +-
 hw/arm/Kconfig                      |   1 +
 hw/arm/virt-acpi-build.c            |  33 ++
 hw/arm/virt.c                       |  40 ++-
 hw/core/machine.c                   |  28 ++
 hw/cxl/Kconfig                      |   3 +
 hw/cxl/cxl-component-utils.c        | 284 ++++++++++++++++
 hw/cxl/cxl-device-utils.c           | 265 +++++++++++++++
 hw/cxl/cxl-host-stubs.c             |  16 +
 hw/cxl/cxl-host.c                   | 262 +++++++++++++++
 hw/cxl/cxl-mailbox-utils.c          | 485 ++++++++++++++++++++++++++++
 hw/cxl/meson.build                  |  12 +
 hw/i386/acpi-build.c                |  57 +++-
 hw/i386/pc.c                        |  57 +++-
 hw/mem/Kconfig                      |   5 +
 hw/mem/cxl_type3.c                  | 352 ++++++++++++++++++++
 hw/mem/meson.build                  |   1 +
 hw/meson.build                      |   1 +
 hw/pci-bridge/Kconfig               |   5 +
 hw/pci-bridge/cxl_downstream.c      | 229 +++++++++++++
 hw/pci-bridge/cxl_root_port.c       | 231 +++++++++++++
 hw/pci-bridge/cxl_upstream.c        | 206 ++++++++++++
 hw/pci-bridge/meson.build           |   1 +
 hw/pci-bridge/pci_expander_bridge.c | 172 +++++++++-
 hw/pci-bridge/pcie_root_port.c      |   6 +-
 hw/pci-host/gpex-acpi.c             |  20 +-
 hw/pci/pci.c                        |  21 +-
 hw/pci/pcie_port.c                  |  25 ++
 include/hw/acpi/cxl.h               |  28 ++
 include/hw/arm/virt.h               |   1 +
 include/hw/boards.h                 |   2 +
 include/hw/cxl/cxl.h                |  54 ++++
 include/hw/cxl/cxl_component.h      | 207 ++++++++++++
 include/hw/cxl/cxl_device.h         | 270 ++++++++++++++++
 include/hw/cxl/cxl_pci.h            | 156 +++++++++
 include/hw/pci/pci.h                |  14 +
 include/hw/pci/pci_bridge.h         |  20 ++
 include/hw/pci/pci_bus.h            |   7 +
 include/hw/pci/pci_ids.h            |   1 +
 include/hw/pci/pcie_port.h          |   2 +
 qapi/machine.json                   |  18 ++
 qemu-options.hx                     |  38 +++
 scripts/device-crash-test           |   1 +
 softmmu/memory.c                    |   9 +
 softmmu/vl.c                        |  42 +++
 tests/data/acpi/q35/CEDT.cxl        | Bin 0 -> 184 bytes
 tests/data/acpi/q35/DSDT.cxl        | Bin 0 -> 9627 bytes
 tests/qtest/bios-tables-test.c      |  44 +++
 tests/qtest/cxl-test.c              | 181 +++++++++++
 tests/qtest/meson.build             |   5 +
 57 files changed, 4456 insertions(+), 25 deletions(-)
 create mode 100644 docs/system/devices/cxl.rst
 create mode 100644 hw/acpi/cxl-stub.c
 create mode 100644 hw/acpi/cxl.c
 create mode 100644 hw/cxl/Kconfig
 create mode 100644 hw/cxl/cxl-component-utils.c
 create mode 100644 hw/cxl/cxl-device-utils.c
 create mode 100644 hw/cxl/cxl-host-stubs.c
 create mode 100644 hw/cxl/cxl-host.c
 create mode 100644 hw/cxl/cxl-mailbox-utils.c
 create mode 100644 hw/cxl/meson.build
 create mode 100644 hw/mem/cxl_type3.c
 create mode 100644 hw/pci-bridge/cxl_downstream.c
 create mode 100644 hw/pci-bridge/cxl_root_port.c
 create mode 100644 hw/pci-bridge/cxl_upstream.c
 create mode 100644 include/hw/acpi/cxl.h
 create mode 100644 include/hw/cxl/cxl.h
 create mode 100644 include/hw/cxl/cxl_component.h
 create mode 100644 include/hw/cxl/cxl_device.h
 create mode 100644 include/hw/cxl/cxl_pci.h
 create mode 100644 tests/data/acpi/q35/CEDT.cxl
 create mode 100644 tests/data/acpi/q35/DSDT.cxl
 create mode 100644 tests/qtest/cxl-test.c

-- 
2.32.0


