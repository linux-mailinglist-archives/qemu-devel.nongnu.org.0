Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4AB52979F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 05:03:57 +0200 (CEST)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqnV5-0004uw-Sf
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 23:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqnSa-0003aF-VT
 for qemu-devel@nongnu.org; Mon, 16 May 2022 23:01:23 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqnSY-0007Ql-H1
 for qemu-devel@nongnu.org; Mon, 16 May 2022 23:01:20 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 202so15784542pgc.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 20:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XJQEAIk1FjeaIi4I076udG90euhYAteh0pj8zQK7Aa0=;
 b=jHWW86mFsPyY9YR8ypbvZlGt9TvFSlfnchQY1WUpFL+sWwjmISpNdaC99TR2PNFYBM
 cNP8vGShnAWTjKMHE/r+MwIOw6nHBhIxAynpkCJBe9kA5X/dvdGynGDj8J8OE2jxWUov
 nqp3FTbJDIUuWawC5d80TdI5siDJeADRATEPMnHGlXMxV844si2KrovivaIYX+uaEv50
 FmPv6ohdNBum7GtFthigMeSQXxgpzt2Nn2hNC6b9qwuDnppiyxj6S2jPmLtY09PZ0AG7
 u8mzwsPkRlzApq8GKLGI8KBUY+1F0F5fIGQ2lviSXpLkvdXd+IliYTEnGyvrc2gfHBCC
 pKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XJQEAIk1FjeaIi4I076udG90euhYAteh0pj8zQK7Aa0=;
 b=yEAXTVkFVkqp0SLDyLC5P9o74mObjNgqi/B/aGeOx5BFHGUUU94YeYSPinCGd0Ygor
 rJEXTyDtn1Dcpvc5IZ1el8HUjNgIghU3xeX1Lfn9s27SuzhgvfV3r7L8VpdODVh9wO91
 2lnzvYRPf10BrV8gsLuxYyzkTluoyDOP8nZP1zRJAAYXPjT68Ov2yIch9cR83WBtAQof
 /5Lmqdb7RuFym0WN8FqSxTAgbSS60+cVYnF7eqjKuxz9NuQP48uu8ERUjePdT3uO8/YC
 v1zmb2Atp+ME5F5M7490W38avXH4IGU5BR4O4qt2w89/7fxXsrh4CCIO0906zjIA1ckp
 ZYDA==
X-Gm-Message-State: AOAM530F4obyb0VtPfMfLBdPvtP9HSnz0ZAG9BjTC4P07eXv+ztI1/29
 ZLRSIGlfdAp3nwXB+fsc/G4bXg==
X-Google-Smtp-Source: ABdhPJx5AMiyPlynpIqpjZdJC/APUa2jDSyqYDBxO9AZLPw3LIUkaNgBdqQF9b2TekLja541xfsEpw==
X-Received: by 2002:a05:6a00:1907:b0:4f7:945:14cf with SMTP id
 y7-20020a056a00190700b004f7094514cfmr20568654pfi.47.1652756476823; 
 Mon, 16 May 2022 20:01:16 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a17090264d600b001616b8bad48sm3668373pli.303.2022.05.16.20.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 20:01:16 -0700 (PDT)
Message-ID: <48407d68-a7fb-9702-ed0c-d63ce9cda1e5@linaro.org>
Date: Mon, 16 May 2022 20:01:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 00/86] virtio,pc,pci: fixes,cleanups,features
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220516204913.542894-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/16/22 13:49, Michael S. Tsirkin wrote:
> 
> Changes from pull v1:
>      dropped introspection patches from the pull
> 
> The following changes since commit 9de5f2b40860c5f8295e73fea9922df6f0b8d89a:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-12 10:52:15 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 6852c21db229c4bf4c1db772444bdfbbd027e5b8:
> 
>    vhost-user-scsi: avoid unlink(NULL) with fd passing (2022-05-16 16:48:35 -0400)
> 
> ----------------------------------------------------------------
> virtio,pc,pci: fixes,cleanups,features
> 
> most of CXL support
> fixes, cleanups all over the place
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Bennée (9):
>        hw/virtio: move virtio-pci.h into shared include space
>        virtio-pci: add notification trace points
>        hw/virtio: add vhost_user_[read|write] trace points
>        vhost-user.rst: add clarifying language about protocol negotiation
>        libvhost-user: expose vu_request_to_string
>        docs/devel: start documenting writing VirtIO devices
>        include/hw: start documenting the vhost API
>        hw/virtio/vhost-user: don't suppress F_CONFIG when supported
>        virtio/vhost-user: dynamically assign VhostUserHostNotifiers
> 
> Ben Widawsky (24):
>        hw/pci/cxl: Add a CXL component type (interface)
>        hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
>        hw/cxl/device: Introduce a CXL device (8.2.8)
>        hw/cxl/device: Implement the CAP array (8.2.8.1-2)
>        hw/cxl/device: Implement basic mailbox (8.2.8.4)
>        hw/cxl/device: Add memory device utilities
>        hw/cxl/device: Add cheap EVENTS implementation (8.2.9.1)
>        hw/cxl/device: Timestamp implementation (8.2.9.3)
>        hw/cxl/device: Add log commands (8.2.9.4) + CEL
>        hw/pxb: Use a type for realizing expanders
>        hw/pci/cxl: Create a CXL bus type
>        hw/pxb: Allow creation of a CXL PXB (host bridge)
>        hw/cxl/rp: Add a root port
>        hw/cxl/device: Add a memory device (8.2.8.5)
>        hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
>        hw/cxl/device: Add some trivial commands
>        hw/cxl/device: Plumb real Label Storage Area (LSA) sizing
>        hw/cxl/device: Implement get/set Label Storage Area (LSA)
>        hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
>        acpi/cxl: Add _OSC implementation (9.14.2)
>        acpi/cxl: Create the CEDT (9.14.1)
>        acpi/cxl: Introduce CFMWS structures in CEDT
>        hw/cxl/component Add a dumb HDM decoder handler
>        qtest/cxl: Add more complex test cases with CFMWs
> 
> David Woodhouse (4):
>        target/i386: Fix sanity check on max APIC ID / X2APIC enablement
>        intel_iommu: Support IR-only mode without DMA translation
>        intel_iommu: Only allow interrupt remapping to be enabled if it's supported
>        intel_iommu: Fix irqchip / X2APIC configuration checks
> 
> Eugenio Pérez (5):
>        vhost: Track descriptor chain in private at SVQ
>        vhost: Fix device's used descriptor dequeue
>        vdpa: Fix bad index calculus at vhost_vdpa_get_vring_base
>        vdpa: Fix index calculus at vhost_vdpa_svqs_start
>        vhost: Fix element in vhost_svq_add failure
> 
> Francisco Iglesias (2):
>        include/hw/pci/pcie_host: Correct PCIE_MMCFG_BUS_MASK
>        include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX
> 
> Halil Pasic (1):
>        virtio: fix feature negotiation for ACCESS_PLATFORM
> 
> Ilya Maximets (1):
>        vhost_net: Print feature masks in hex
> 
> Jason Wang (5):
>        intel-iommu: correct the value used for error_setg_errno()
>        intel-iommu: remove VTD_FR_RESERVED_ERR
>        intel-iommu: block output address in interrupt address range
>        intel-iommu: update root_scalable before switching as during post_load
>        intel-iommu: update iq_dw during post load
> 
> Jonah Palmer (2):
>        virtio: drop name parameter for virtio_init()
>        virtio: add vhost support for virtio devices
> 
> Jonathan Cameron (16):
>        MAINTAINERS: Add entry for Compute Express Link Emulation
>        cxl: Machine level control on whether CXL support is enabled
>        qtest/cxl: Introduce initial test for pxb-cxl only.
>        qtests/cxl: Add initial root port and CXL type3 tests
>        hw/cxl/component: Add utils for interleave parameter encoding/decoding
>        hw/cxl/host: Add support for CXL Fixed Memory Windows.
>        hw/pci-host/gpex-acpi: Add support for dsdt construction for pxb-cxl
>        pci/pcie_port: Add pci_find_port_by_pn()
>        CXL/cxl_component: Add cxl_get_hb_cstate()
>        mem/cxl_type3: Add read and write functions for associated hostmem.
>        cxl/cxl-host: Add memops for CFMWS region.
>        i386/pc: Enable CXL fixed memory windows
>        tests/acpi: q35: Allow addition of a CXL test.
>        qtests/bios-tables-test: Add a test for CXL emulation.
>        tests/acpi: Add tables for CXL emulation.
>        docs/cxl: Add initial Compute eXpress Link (CXL) documentation.
> 
> Kevin Wolf (1):
>        docs/vhost-user: Clarifications for VHOST_USER_ADD/REM_MEM_REG
> 
> Michael S. Tsirkin (1):
>        vhost-user: more master/slave things
> 
> Paolo Bonzini (3):
>        docs: vhost-user: clean up request/reply description
>        docs: vhost-user: rewrite section on ring state machine
>        docs: vhost-user: replace master/slave with front-end/back-end
> 
> Philippe Mathieu-Daudé (1):
>        hw/virtio: Replace g_memdup() by g_memdup2()
> 
> Si-Wei Liu (7):
>        virtio-net: setup vhost_dev and notifiers for cvq only when feature is negotiated
>        virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
>        vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
>        vhost-net: fix improper cleanup in vhost_net_start
>        vhost-vdpa: backend feature should set only once
>        vhost-vdpa: change name and polarity for vhost_vdpa_one_time_request()
>        virtio-net: don't handle mq request in userspace handler for vhost-vdpa
> 
> Stefan Hajnoczi (1):
>        vhost-user-scsi: avoid unlink(NULL) with fd passing
> 
> Wei Huang (1):
>        hw/i386/amd_iommu: Fix IOMMU event log encoding errors
> 
> Xiaoyao Li (2):
>        hw/i386: Make pit a property of common x86 base machine type
>        hw/i386: Make pic a property of common x86 base machine type
> 
>   qapi/machine.json                         |  21 ++
>   hw/i386/intel_iommu_internal.h            |   9 +-
>   hw/virtio/vhost-shadow-virtqueue.h        |   6 +
>   include/hw/acpi/cxl.h                     |  28 ++
>   include/hw/boards.h                       |   2 +
>   include/hw/cxl/cxl.h                      |  61 ++++
>   include/hw/cxl/cxl_component.h            | 223 ++++++++++++
>   include/hw/cxl/cxl_device.h               | 268 ++++++++++++++
>   include/hw/cxl/cxl_pci.h                  | 167 +++++++++
>   include/hw/i386/intel_iommu.h             |   1 +
>   include/hw/i386/microvm.h                 |   4 -
>   include/hw/i386/pc.h                      |   2 -
>   include/hw/i386/x86.h                     |   4 +
>   include/hw/pci/pci.h                      |  14 +
>   include/hw/pci/pci_bridge.h               |  20 ++
>   include/hw/pci/pci_bus.h                  |   7 +
>   include/hw/pci/pci_ids.h                  |   1 +
>   include/hw/pci/pcie_host.h                |   6 +-
>   include/hw/pci/pcie_port.h                |   2 +
>   include/hw/virtio/vhost-user.h            |  43 ++-
>   include/hw/virtio/vhost-vsock-common.h    |   2 +-
>   include/hw/virtio/vhost.h                 | 132 ++++++-
>   include/hw/virtio/virtio-gpu.h            |   3 +-
>   {hw => include/hw}/virtio/virtio-pci.h    |   0
>   include/hw/virtio/virtio.h                |   7 +-
>   subprojects/libvhost-user/libvhost-user.h |   9 +
>   contrib/vhost-user-scsi/vhost-user-scsi.c |   5 +-
>   hw/9pfs/virtio-9p-device.c                |   2 +-
>   hw/acpi/cxl-stub.c                        |  12 +
>   hw/acpi/cxl.c                             | 257 +++++++++++++
>   hw/block/vhost-user-blk.c                 |   9 +-
>   hw/block/virtio-blk.c                     |   2 +-
>   hw/char/virtio-serial-bus.c               |   3 +-
>   hw/core/machine.c                         |  28 ++
>   hw/cxl/cxl-component-utils.c              | 396 ++++++++++++++++++++
>   hw/cxl/cxl-device-utils.c                 | 265 ++++++++++++++
>   hw/cxl/cxl-host-stubs.c                   |  16 +
>   hw/cxl/cxl-host.c                         | 222 ++++++++++++
>   hw/cxl/cxl-mailbox-utils.c                | 478 ++++++++++++++++++++++++
>   hw/display/vhost-user-gpu.c               |   7 +
>   hw/display/virtio-gpu-base.c              |   2 +-
>   hw/i386/acpi-build.c                      |  57 ++-
>   hw/i386/amd_iommu.c                       |  24 +-
>   hw/i386/intel_iommu.c                     |  95 +++--
>   hw/i386/microvm.c                         |  54 +--
>   hw/i386/pc.c                              |  89 +++--
>   hw/i386/pc_piix.c                         |   4 +-
>   hw/i386/pc_q35.c                          |   4 +-
>   hw/i386/x86.c                             |  66 ++++
>   hw/input/vhost-user-input.c               |   7 +
>   hw/input/virtio-input.c                   |   3 +-
>   hw/mem/cxl_type3.c                        | 371 +++++++++++++++++++
>   hw/net/vhost_net.c                        |   8 +-
>   hw/net/virtio-net.c                       |  63 +++-
>   hw/pci-bridge/cxl_root_port.c             | 236 ++++++++++++
>   hw/pci-bridge/pci_expander_bridge.c       | 168 ++++++++-
>   hw/pci-bridge/pcie_root_port.c            |   6 +-
>   hw/pci-host/gpex-acpi.c                   |  20 +-
>   hw/pci/pci.c                              |  21 +-
>   hw/pci/pcie_port.c                        |  25 ++
>   hw/scsi/vhost-scsi.c                      |   8 +
>   hw/scsi/vhost-user-scsi.c                 |   1 +
>   hw/scsi/virtio-scsi.c                     |   3 +-
>   hw/virtio/vhost-scsi-pci.c                |   2 +-
>   hw/virtio/vhost-shadow-virtqueue.c        |  35 +-
>   hw/virtio/vhost-user-blk-pci.c            |   2 +-
>   hw/virtio/vhost-user-fs-pci.c             |   2 +-
>   hw/virtio/vhost-user-fs.c                 |  10 +-
>   hw/virtio/vhost-user-i2c-pci.c            |   2 +-
>   hw/virtio/vhost-user-i2c.c                |   7 +-
>   hw/virtio/vhost-user-input-pci.c          |   2 +-
>   hw/virtio/vhost-user-rng-pci.c            |   2 +-
>   hw/virtio/vhost-user-rng.c                |   9 +-
>   hw/virtio/vhost-user-scsi-pci.c           |   2 +-
>   hw/virtio/vhost-user-vsock-pci.c          |   2 +-
>   hw/virtio/vhost-user-vsock.c              |   2 +-
>   hw/virtio/vhost-user.c                    | 131 +++++--
>   hw/virtio/vhost-vdpa.c                    |  29 +-
>   hw/virtio/vhost-vsock-common.c            |  12 +-
>   hw/virtio/vhost-vsock-pci.c               |   2 +-
>   hw/virtio/vhost-vsock.c                   |   2 +-
>   hw/virtio/vhost.c                         |   4 +-
>   hw/virtio/virtio-9p-pci.c                 |   2 +-
>   hw/virtio/virtio-balloon-pci.c            |   2 +-
>   hw/virtio/virtio-balloon.c                |   3 +-
>   hw/virtio/virtio-blk-pci.c                |   2 +-
>   hw/virtio/virtio-bus.c                    |  22 +-
>   hw/virtio/virtio-crypto.c                 |  18 +-
>   hw/virtio/virtio-input-host-pci.c         |   2 +-
>   hw/virtio/virtio-input-pci.c              |   2 +-
>   hw/virtio/virtio-iommu-pci.c              |   2 +-
>   hw/virtio/virtio-iommu.c                  |   3 +-
>   hw/virtio/virtio-mem.c                    |   3 +-
>   hw/virtio/virtio-net-pci.c                |   2 +-
>   hw/virtio/virtio-pci.c                    |   5 +-
>   hw/virtio/virtio-pmem.c                   |   3 +-
>   hw/virtio/virtio-rng-pci.c                |   2 +-
>   hw/virtio/virtio-rng.c                    |   2 +-
>   hw/virtio/virtio-scsi-pci.c               |   2 +-
>   hw/virtio/virtio-serial-pci.c             |   2 +-
>   hw/virtio/virtio.c                        |  56 ++-
>   net/vhost-vdpa.c                          |   4 +-
>   softmmu/vl.c                              |  47 +++
>   subprojects/libvhost-user/libvhost-user.c |   2 +-
>   target/i386/kvm/kvm-cpu.c                 |   2 +-
>   tests/qtest/bios-tables-test.c            |  44 +++
>   tests/qtest/cxl-test.c                    | 151 ++++++++
>   MAINTAINERS                               |   7 +
>   docs/devel/index-internals.rst            |   1 +
>   docs/devel/virtio-backends.rst            | 214 +++++++++++
>   docs/interop/vhost-user-gpu.rst           |  10 +-
>   docs/interop/vhost-user.rst               | 579 ++++++++++++++++--------------
>   docs/system/device-emulation.rst          |   1 +
>   docs/system/devices/cxl.rst               | 302 ++++++++++++++++
>   hw/Kconfig                                |   1 +
>   hw/acpi/Kconfig                           |   5 +
>   hw/acpi/meson.build                       |   4 +-
>   hw/arm/Kconfig                            |   1 +
>   hw/cxl/Kconfig                            |   3 +
>   hw/cxl/meson.build                        |  12 +
>   hw/mem/Kconfig                            |   5 +
>   hw/mem/meson.build                        |   1 +
>   hw/meson.build                            |   1 +
>   hw/pci-bridge/Kconfig                     |   5 +
>   hw/pci-bridge/meson.build                 |   1 +
>   hw/virtio/trace-events                    |  10 +-
>   qemu-options.hx                           |  38 ++
>   scripts/device-crash-test                 |   1 +
>   tests/data/acpi/q35/CEDT.cxl              | Bin 0 -> 184 bytes
>   tests/data/acpi/q35/DSDT.cxl              | Bin 0 -> 9615 bytes
>   tests/qtest/meson.build                   |   4 +
>   131 files changed, 5352 insertions(+), 577 deletions(-)
>   create mode 100644 include/hw/acpi/cxl.h
>   create mode 100644 include/hw/cxl/cxl.h
>   create mode 100644 include/hw/cxl/cxl_component.h
>   create mode 100644 include/hw/cxl/cxl_device.h
>   create mode 100644 include/hw/cxl/cxl_pci.h
>   rename {hw => include/hw}/virtio/virtio-pci.h (100%)
>   create mode 100644 hw/acpi/cxl-stub.c
>   create mode 100644 hw/acpi/cxl.c
>   create mode 100644 hw/cxl/cxl-component-utils.c
>   create mode 100644 hw/cxl/cxl-device-utils.c
>   create mode 100644 hw/cxl/cxl-host-stubs.c
>   create mode 100644 hw/cxl/cxl-host.c
>   create mode 100644 hw/cxl/cxl-mailbox-utils.c
>   create mode 100644 hw/mem/cxl_type3.c
>   create mode 100644 hw/pci-bridge/cxl_root_port.c
>   create mode 100644 tests/qtest/cxl-test.c
>   create mode 100644 docs/devel/virtio-backends.rst
>   create mode 100644 docs/system/devices/cxl.rst
>   create mode 100644 hw/cxl/Kconfig
>   create mode 100644 hw/cxl/meson.build
>   create mode 100644 tests/data/acpi/q35/CEDT.cxl
>   create mode 100644 tests/data/acpi/q35/DSDT.cxl
> 
> 


