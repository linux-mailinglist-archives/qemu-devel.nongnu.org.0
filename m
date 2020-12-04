Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63C2CEFAE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:28:33 +0100 (CET)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klC4W-0003XH-SX
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klC3m-00036n-40
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:27:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klC3j-0004rb-U2
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607092062;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gs1SLCtFVgesAF5gmP/dFAubuvQY4e4TiLoiGMqil3Y=;
 b=BRFetrO+DiDi5zH74KAPArIlQIQmlexSF3+zEja2lF15TrAmQUOaJCAtDw/ZjBJ0atwakZ
 f9VnUt7PbznHktYhsW7AXBPKnfV2VAdYjHFg1J9pT6ItOhGtfrllfGBUdjcmOPQVVysH+E
 MipD/Zdz5RySu93bsk8Eh2EwK6WEMoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-7OrMo1GjMGGuKiAgWyhCVA-1; Fri, 04 Dec 2020 09:27:37 -0500
X-MC-Unique: 7OrMo1GjMGGuKiAgWyhCVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB791107ACE3;
 Fri,  4 Dec 2020 14:27:35 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4124F5D9D7;
 Fri,  4 Dec 2020 14:27:29 +0000 (UTC)
Date: Fri, 4 Dec 2020 14:27:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [RFC PATCH 00/25] Introduce CXL 2.0 Emulation
Message-ID: <20201204142726.GM3056135@redhat.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just copying in the two primary QEMU maintainers for the PCI subsystem
to bring it to their attention.

On Tue, Nov 10, 2020 at 09:46:59PM -0800, Ben Widawsky wrote:
> Introduce emulation of Compute Express Link 2.0, which was released
> today at https://www.computeexpresslink.org/.
> 
> I've pushed a branch here: https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0
> 
> The emulation has been critical to get the Linux enabling started
> (https://lore.kernel.org/linux-cxl/), it would be an ideal place to land
> regression tests for different topology handling, and there may be applications
> for this emulation as a way for a guest to manipulate its address space relative
> to different performance memories. I am new to QEMU development, so please
> forgive and point me in the right direction if I severely misinterpreted where a
> piece of infrastructure belongs.
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
> 9-11: Create the concept of a CXL bus and plumb into PXB
> 12-16: Implement host bridges
> 17: Implement a root port
> 18: Implement a memory device
> 19: Implement HDM decoders
> 20-24: ACPI bits
> 25: Start working on enabling the main host bridge
> 
> Ben Widawsky (23):
>   hw/pci/cxl: Add a CXL component type (interface)
>   hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
>   hw/cxl/device: Introduce a CXL device (8.2.8)
>   hw/cxl/device: Implement the CAP array (8.2.8.1-2)
>   hw/cxl/device: Add device status (8.2.8.3)
>   hw/cxl/device: Implement basic mailbox (8.2.8.4)
>   hw/cxl/device: Add memory devices (8.2.8.5)
>   hw/pxb: Use a type for realizing expanders
>   hw/pci/cxl: Create a CXL bus type
>   hw/pxb: Allow creation of a CXL PXB (host bridge)
>   acpi/pci: Consolidate host bridge setup
>   hw/pci: Plumb _UID through host bridges
>   hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
>   acpi/pxb/cxl: Reserve host bridge MMIO
>   hw/pxb/cxl: Add "windows" for host bridges
>   hw/cxl/rp: Add a root port
>   hw/cxl/device: Add a memory device (8.2.8.5)
>   hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
>   acpi/cxl: Add _OSC implementation (9.14.2)
>   acpi/cxl: Create the CEDT (9.14.1)
>   Temp: acpi/cxl: Add ACPI0017 (CEDT awareness)
>   WIP: i386/cxl: Initialize a host bridge
>   qtest/cxl: Add very basic sanity tests
> 
> Jonathan Cameron (1):
>   Temp: Add the PCI_EXT_ID_DVSEC definition to the qemu pci_regs.h copy.
> 
> Vishal Verma (1):
>   acpi/cxl: Introduce a compat-driver UUID for CXL _OSC
> 
>  MAINTAINERS                               |   6 +
>  hw/Kconfig                                |   1 +
>  hw/acpi/Kconfig                           |   5 +
>  hw/acpi/cxl.c                             | 198 +++++++++++++
>  hw/acpi/meson.build                       |   1 +
>  hw/arm/virt.c                             |   1 +
>  hw/core/machine.c                         |  26 ++
>  hw/core/numa.c                            |   3 +
>  hw/cxl/Kconfig                            |   3 +
>  hw/cxl/cxl-component-utils.c              | 192 +++++++++++++
>  hw/cxl/cxl-device-utils.c                 | 293 +++++++++++++++++++
>  hw/cxl/cxl-mailbox-utils.c                | 139 +++++++++
>  hw/cxl/meson.build                        |   5 +
>  hw/i386/acpi-build.c                      |  87 +++++-
>  hw/i386/microvm.c                         |   1 +
>  hw/i386/pc.c                              |   2 +
>  hw/mem/Kconfig                            |   5 +
>  hw/mem/cxl_type3.c                        | 334 ++++++++++++++++++++++
>  hw/mem/meson.build                        |   1 +
>  hw/meson.build                            |   1 +
>  hw/pci-bridge/Kconfig                     |   5 +
>  hw/pci-bridge/cxl_root_port.c             | 231 +++++++++++++++
>  hw/pci-bridge/meson.build                 |   1 +
>  hw/pci-bridge/pci_expander_bridge.c       | 209 +++++++++++++-
>  hw/pci-bridge/pcie_root_port.c            |   6 +-
>  hw/pci/pci.c                              |  32 ++-
>  hw/pci/pcie.c                             |  30 ++
>  hw/ppc/spapr.c                            |   2 +
>  include/hw/acpi/cxl.h                     |  27 ++
>  include/hw/boards.h                       |   2 +
>  include/hw/cxl/cxl.h                      |  30 ++
>  include/hw/cxl/cxl_component.h            | 181 ++++++++++++
>  include/hw/cxl/cxl_device.h               | 199 +++++++++++++
>  include/hw/cxl/cxl_pci.h                  | 155 ++++++++++
>  include/hw/pci/pci.h                      |  15 +
>  include/hw/pci/pci_bridge.h               |  25 ++
>  include/hw/pci/pci_bus.h                  |   8 +
>  include/hw/pci/pci_ids.h                  |   1 +
>  include/standard-headers/linux/pci_regs.h |   1 +
>  monitor/hmp-cmds.c                        |  15 +
>  qapi/machine.json                         |   1 +
>  tests/qtest/cxl-test.c                    |  93 ++++++
>  tests/qtest/meson.build                   |   4 +
>  43 files changed, 2547 insertions(+), 30 deletions(-)
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
>  create mode 100644 tests/qtest/cxl-test.c
> 
> -- 
> 2.29.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


