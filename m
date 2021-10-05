Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A55422FE0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:22:33 +0200 (CEST)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXp5E-0007zl-Dh
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXo8V-0006bo-Li
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:21:52 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXo8R-0003OF-Gf
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:21:51 -0400
Received: by mail-pg1-x532.google.com with SMTP id s75so1503pgs.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xpUufvbUGp25ShUQMv94S4AxIL5BY1Jqtzhw0mC7eRM=;
 b=eOfsAKZ19irBr6Q1LySvvWr9Jjs+OdLLskAbBRimPnH2W8Sr9C3rvfQDCdUmhm14dr
 FMFia+o8fSrO3lKgX4N+oSHl6elrkvPvcDboOJrQvUZzb1IrVRIruzVYwkLFQzE1zJW4
 h7njkpmyw2owpHQgRXWfSuMJPuZIfAe4J1RtypSM+ahM9cLJzYJM2K2WHXOl9/ouk8tu
 GlxEdXeoBB6c0C9uebrOqQTSIiuLZeurEgq1BVdtMRxKWPmZl0GDaWmBiRMXXOIQtIJv
 pHso6jDI/e/CFybMwwe5+oUEL6galqOUVnEJjl7FomIY2jIxbzcR8Y4znD4Z2WnvQ0WN
 XQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xpUufvbUGp25ShUQMv94S4AxIL5BY1Jqtzhw0mC7eRM=;
 b=Vpc1S1JrYCtD/pSO/lm5HsOGm1FIfGyULfM3JA1Gq5hv/5nIzxG+LV4/kOtAIHNncE
 07RR+2562BIvMuhTZWo4stKNSSN2D3Qzk5Jv0gitKUgEloBjdSBGYcqsk5Yn6WNk2QHW
 iN+fOGlLq79s7dpOpN9agF2BWNLAi6k0687u0+MH557/DnIkTp5460ATIvsOpvNV0jho
 eQRSeClv3RHFBCwFSOGMorJ85gpozYMxVffussGuJ/+DlacldAMkuiuyPuxRmYQQI7Sc
 xlgSqNtqdMxY26GU+cQzQuPSrLOpuLuuP2aJByLkWWeyp8/amPZdcKDwGM8iM1KWiFTO
 InTA==
X-Gm-Message-State: AOAM531eYRESeSzx+9hhrtIrhnNpe4zA1I+0WPpoFqOEKJzaf7hTm6OX
 rP9Ubx8jXV/QWqTCCb4XPJGRVg==
X-Google-Smtp-Source: ABdhPJxXBf5ZrRzacvko/pnhLcqO8bofM1oE5wszWE52qzgd7hqL647B9R/HPxlUkWnyTYG0aB6UYw==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr16554632pgi.401.1633454505637; 
 Tue, 05 Oct 2021 10:21:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n202sm1001680pfd.160.2021.10.05.10.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 10:21:45 -0700 (PDT)
Subject: Re: [PULL 00/57] pc,pci,virtio: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211005155946.513818-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20fc357d-586f-5178-6d2d-d44769f0a233@linaro.org>
Date: Tue, 5 Oct 2021 10:21:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 9:00 AM, Michael S. Tsirkin wrote:
> The following changes since commit 9618c5badaa8eed25259cf095ff880efb939fbe7:
> 
>    Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-04 16:27:35 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to c7d2f59cf940b8c8c52c29d5fa25613fe662f7b6:
> 
>    hw/i386/amd_iommu: Add description/category to TYPE_AMD_IOMMU_PCI (2021-10-05 11:46:45 -0400)
> 
> ----------------------------------------------------------------
> pc,pci,virtio: features, fixes
> 
> VDPA multiqueue support.
> A huge acpi refactoring.
> Fixes, cleanups all over the place.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Ani Sinha (3):
>        bios-tables-test: allow changes in DSDT ACPI tables for q35
>        hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug in q35
>        bios-tables-test: Update ACPI DSDT table golden blobs for q35
> 
> Dr. David Alan Gilbert (1):
>        virtio-balloon: Fix page-poison subsection name
> 
> Igor Mammedov (35):
>        acpi: add helper routines to initialize ACPI tables
>        acpi: build_rsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_xsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_slit: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_tpm2: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: acpi_build_hest: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_mcfg: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_hmat: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: nvdimm_build_nfit: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: nvdimm_build_ssdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: vmgenid_build_acpi: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: x86: build_dsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_hpet: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_tpm_tcpa: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: arm/x86: build_srat: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: use build_append_int_noprefix() API to compose SRAT table
>        acpi: build_dmar_q35: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_waet: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_amd_iommu: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: madt: arm/x86: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: x86: remove dead code
>        acpi: x86: set enabled when composing _MAT entries
>        acpi: x86: madt: use build_append_int_noprefix() API to compose MADT table
>        acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table
>        acpi: build_dsdt_microvm: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: arm: virt: build_dsdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: arm: virt: build_iort: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: arm/virt: convert build_iort() to endian agnostic build_append_FOO() API
>        acpi: arm/virt: build_spcr: fix invalid cast
>        acpi: arm/virt: build_spcr: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()
>        acpi: build_facs: use build_append_int_noprefix() API to compose table
>        acpi: remove no longer used build_header()
>        acpi: AcpiGenericAddress no longer used to map/access fields of MMIO, drop packed attribute
> 
> Jason Wang (10):
>        vhost-vdpa: open device fd in net_init_vhost_vdpa()
>        vhost-vdpa: classify one time request
>        vhost-vdpa: prepare for the multiqueue support
>        vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
>        net: introduce control client
>        vhost-net: control virtqueue support
>        virtio-net: use "queue_pairs" instead of "queues" when possible
>        vhost: record the last virtqueue index for the virtio device
>        virtio-net: vhost control virtqueue support
>        vhost-vdpa: multiqueue support
> 
> Li Zhijian (1):
>        nvdimm: release the correct device list
> 
> Philippe Mathieu-Daudé (5):
>        hw/virtio: Acquire RCU read lock in virtqueue_packed_drop_all()
>        hw/virtio: Have virtqueue_get_avail_bytes() pass caches arg to callees
>        hw/i386/amd_iommu: Rename amdviPCI TypeInfo
>        hw/i386/amd_iommu: Rename SysBus specific functions as amdvi_sysbus_X()
>        hw/i386/amd_iommu: Add description/category to TYPE_AMD_IOMMU_PCI
> 
> Stefano Garzarella (2):
>        vhost-vsock: fix migration issue when seqpacket is supported
>        vhost-vsock: handle common features in vhost-vsock-common
> 
>   include/hw/acpi/acpi-defs.h            | 528 +------------------------------
>   include/hw/acpi/acpi_dev_interface.h   |   3 +-
>   include/hw/acpi/aml-build.h            |  37 ++-
>   include/hw/acpi/ich9.h                 |   2 +-
>   include/hw/i386/pc.h                   |   6 +-
>   include/hw/virtio/vhost-vdpa.h         |   1 +
>   include/hw/virtio/vhost-vsock-common.h |   5 +
>   include/hw/virtio/vhost.h              |   2 +
>   include/hw/virtio/virtio-net.h         |   5 +-
>   include/net/net.h                      |   5 +
>   include/net/vhost_net.h                |   6 +-
>   hw/acpi/acpi-x86-stub.c                |   3 +-
>   hw/acpi/aml-build.c                    | 193 +++++++-----
>   hw/acpi/cpu.c                          |  17 +-
>   hw/acpi/ghes.c                         |  10 +-
>   hw/acpi/hmat.c                         |  14 +-
>   hw/acpi/nvdimm.c                       |  76 ++---
>   hw/acpi/pci.c                          |  18 +-
>   hw/acpi/vmgenid.c                      |  13 +-
>   hw/arm/virt-acpi-build.c               | 553 +++++++++++++++++++--------------
>   hw/core/machine.c                      |   5 +-
>   hw/i386/acpi-build.c                   | 292 +++++++++--------
>   hw/i386/acpi-common.c                  | 160 +++++-----
>   hw/i386/acpi-microvm.c                 |  13 +-
>   hw/i386/amd_iommu.c                    |  41 ++-
>   hw/net/vhost_net.c                     |  55 +++-
>   hw/net/virtio-net.c                    | 165 +++++-----
>   hw/virtio/vhost-user-vsock.c           |   4 +-
>   hw/virtio/vhost-vdpa.c                 |  56 +++-
>   hw/virtio/vhost-vsock-common.c         |  31 ++
>   hw/virtio/vhost-vsock.c                |  11 +-
>   hw/virtio/virtio-balloon.c             |   2 +-
>   hw/virtio/virtio.c                     |  31 +-
>   net/net.c                              |  24 +-
>   net/vhost-vdpa.c                       | 127 +++++++-
>   tests/data/acpi/q35/DSDT               | Bin 8289 -> 8289 bytes
>   tests/data/acpi/q35/DSDT.acpihmat      | Bin 9614 -> 9614 bytes
>   tests/data/acpi/q35/DSDT.bridge        | Bin 11003 -> 11003 bytes
>   tests/data/acpi/q35/DSDT.cphp          | Bin 8753 -> 8753 bytes
>   tests/data/acpi/q35/DSDT.dimmpxm       | Bin 9943 -> 9943 bytes
>   tests/data/acpi/q35/DSDT.ipmibt        | Bin 8364 -> 8364 bytes
>   tests/data/acpi/q35/DSDT.memhp         | Bin 9648 -> 9648 bytes
>   tests/data/acpi/q35/DSDT.mmio64        | Bin 9419 -> 9419 bytes
>   tests/data/acpi/q35/DSDT.nohpet        | Bin 8147 -> 8147 bytes
>   tests/data/acpi/q35/DSDT.numamem       | Bin 8295 -> 8295 bytes
>   tests/data/acpi/q35/DSDT.tis.tpm12     | Bin 8894 -> 8894 bytes
>   tests/data/acpi/q35/DSDT.tis.tpm2      | Bin 8894 -> 8894 bytes
>   47 files changed, 1202 insertions(+), 1312 deletions(-)

You missed updating the stub version of these functions:

../src/hw/net/vhost_net-stub.c:34:5: error: conflicting types for ‘vhost_net_start’
    34 | int vhost_net_start(VirtIODevice *dev,
       |     ^~~~~~~~~~~~~~~
In file included from ../src/hw/net/vhost_net-stub.c:19:
/home/rth/qemu-publish/src/include/net/vhost_net.h:24:5: note: previous declaration of 
‘vhost_net_start’ was here
    24 | int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
       |     ^~~~~~~~~~~~~~~
../src/hw/net/vhost_net-stub.c:40:6: error: conflicting types for ‘vhost_net_stop’
    40 | void vhost_net_stop(VirtIODevice *dev,
       |      ^~~~~~~~~~~~~~
In file included from ../src/hw/net/vhost_net-stub.c:19:
/home/rth/qemu-publish/src/include/net/vhost_net.h:26:6: note: previous declaration of 
‘vhost_net_stop’ was here
    26 | void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
       |      ^~~~~~~~~~~~~~


r~

