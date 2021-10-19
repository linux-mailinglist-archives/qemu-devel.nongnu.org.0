Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3A433EA7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 20:40:58 +0200 (CEST)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcu2h-00054n-Qm
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 14:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcu06-0004MA-Sz
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:38:16 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcu04-0007Oy-Lc
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 14:38:14 -0400
Received: by mail-pl1-x634.google.com with SMTP id y4so14348354plb.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8fD+A6DzJ8NnKoknUG9vBzOou4rrRx/EJ2BCzm9s/5w=;
 b=ptN+WXQBq4ck9kQKvDefrhMQbpmbbkqJ8xApcCbqubg6S58ViDxTtG6Vs+jGOcVxCP
 qxCAs5TFb3wnec5zfCi5HZBVYhldLQRP66uUbZR/oFihdRE0hIKhTDbQcaNET/4rVmTh
 ziiVxivsqGunBW5Htr+4AcxwEVj5w/LQ232FwwuyQ97UAn/DLoJAbCYoxOZmXRX1Bsy+
 AXrVnlLx4MqWIRmoSPbmK0Lh7RgWuxAqK15SA3yUDTwKoqzIBj9+7Up1yjBSTkzDVkN4
 8n/ZhCQyc3CIE1l/kFuVC2xOTURhNPFOQpEzR2touBFUw9AHsaQOl4pC9ADZzUaaoWBA
 MEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fD+A6DzJ8NnKoknUG9vBzOou4rrRx/EJ2BCzm9s/5w=;
 b=Rt983phJ5crJfvBCd5VAlHqvZ7vwMd1FAUABzjOpM/5tWGRtQ+wP847Ujf4+0iV8FQ
 ydrMVg7/LbnUnY7bSeoGfX8eD2Glo9Qfhf0WtCGsVZW+J69MACRwfBfTOXp1BEPkFkiu
 PiX+nO+rCFIT7Ms+drOSReF2OQ7VqPVwd11s8I54XUuC6WWNM+gXYUfwTHjszXYAI+gf
 T3dlXmPZ84niQdPNObeB52k+zOoOIItbpM5zz+mC5/61FeB98gO+DdtNZkG0CtvYIZqc
 OYjTVaXH1fywnhyQuZRGbk0Pn0irZPaG9UFRM80LQ1QRkc8w4RTvQbgkZ65EEFC+V6eP
 Js4A==
X-Gm-Message-State: AOAM532sOiLklS6b0yIDcJItdXnSJipTXhDue+5gvLNOis5sN1APFhnN
 fwnkghX3rV5dZNsyUTqefLLNlw==
X-Google-Smtp-Source: ABdhPJyTgqQtnTZ5P+ruXS3L0e4dGaQMw911u8RQeefze7mqJo/Rh3bLNUs8af0Fbju3Yhd6ipukfQ==
X-Received: by 2002:a17:902:6902:b0:13f:c1cd:88f1 with SMTP id
 j2-20020a170902690200b0013fc1cd88f1mr11924805plk.36.1634668690698; 
 Tue, 19 Oct 2021 11:38:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b18sm9507395pfl.24.2021.10.19.11.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 11:38:10 -0700 (PDT)
Subject: Re: [PULL 00/29] pc,pci,virtio: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211019111923.679826-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cc1b92e-a3f0-bab9-6e71-112ef3fb13a1@linaro.org>
Date: Tue, 19 Oct 2021 11:38:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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

On 10/19/21 4:19 AM, Michael S. Tsirkin wrote:
> The following changes since commit 9c050b661d3a43dfe2fd44106e559b39706d1296:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/mips-20211018' into staging (2021-10-18 09:16:51 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to bf2dd99b7d536cdba157fd6687810ce7b8340ccc:
> 
>    failover: fix a regression introduced by JSON'ification of -device (2021-10-19 07:15:34 -0400)
> 
> ----------------------------------------------------------------
> pc,pci,virtio: features, fixes
> 
> vhost user rng
> Fixes, cleanups all over the place.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Ani Sinha (3):
>        tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
>        tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
>        tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test
> 
> David Hildenbrand (1):
>        libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr
> 
> Eric Auger (2):
>        virtio-iommu: Remove the non transitional name
>        virtio-iommu: Drop base_name and change generic_name
> 
> Eugenio Pérez (3):
>        vdpa: Skip protected ram IOMMU mappings
>        vdpa: Add vhost_vdpa_section_end
>        vdpa: Check for iova range at mappings changes
> 
> Igor Mammedov (15):
>        tests: acpi: dump table with failed checksum
>        tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
>        tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
>        tests: acpi: q35: test for x2APIC entries in SRAT
>        tests: acpi: update expected tables blobs
>        tests: acpi: whitelist new expected table tests/data/acpi/q35/DMAR.dmar
>        tests: acpi: add testcase for intel_iommu (DMAR table)
>        tests: acpi: add expected blob for DMAR table
>        tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
>        tests: acpi: add testcase for amd-iommu (IVRS table)
>        tests: acpi: update expected blobs
>        tests: acpi: arm/virt: drop redundant test_acpi_one() in test_acpi_virt_tcg()
>        tests: arm-cpu-features: use qtest_has_kvm() API
>        tests: migration-test: use qtest_has_accel() API
>        tests: bios-tables-test: use qtest_has_accel() API to register TCG only tests
> 
> Laurent Vivier (1):
>        failover: fix a regression introduced by JSON'ification of -device
> 
> Mathieu Poirier (3):
>        vhost-user-rng: Add vhost-user-rng implementation
>        vhost-user-rng-pci: Add vhost-user-rng-pci implementation
>        docs: Add documentation for vhost based RNG implementation
> 
> Xueming Li (1):
>        vhost-user: fix duplicated notifier MR init
> 
>   include/hw/virtio/vhost-user-rng.h        |  33 ++++
>   include/hw/virtio/vhost-vdpa.h            |   2 +
>   include/hw/virtio/virtio-iommu.h          |   2 +-
>   tests/qtest/libqos/libqtest.h             |   8 +
>   hw/net/virtio-net.c                       |  24 ++-
>   hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
>   hw/virtio/vhost-user-rng.c                | 289 ++++++++++++++++++++++++++++++
>   hw/virtio/vhost-user.c                    |   5 +-
>   hw/virtio/vhost-vdpa.c                    |  81 ++++++---
>   hw/virtio/virtio-iommu-pci.c              |   4 +-
>   subprojects/libvhost-user/libvhost-user.c |   1 +
>   tests/qtest/acpi-utils.c                  |  14 ++
>   tests/qtest/arm-cpu-features.c            |  29 +--
>   tests/qtest/bios-tables-test.c            |  90 ++++++++--
>   tests/qtest/libqtest.c                    |  27 +++
>   tests/qtest/migration-test.c              |  15 +-
>   docs/system/device-emulation.rst          |   1 +
>   docs/system/devices/vhost-user-rng.rst    |  39 ++++
>   hw/virtio/Kconfig                         |   5 +
>   hw/virtio/meson.build                     |   2 +
>   hw/virtio/trace-events                    |   1 +
>   meson.build                               |   6 +
>   tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 bytes
>   tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
>   tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 bytes
>   tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
>   tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 bytes
>   tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
>   tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
>   tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 bytes
>   30 files changed, 672 insertions(+), 85 deletions(-)
>   create mode 100644 include/hw/virtio/vhost-user-rng.h
>   create mode 100644 hw/virtio/vhost-user-rng-pci.c
>   create mode 100644 hw/virtio/vhost-user-rng.c
>   create mode 100644 docs/system/devices/vhost-user-rng.rst
>   create mode 100644 tests/data/acpi/q35/APIC.xapic
>   create mode 100644 tests/data/acpi/q35/DMAR.dmar
>   create mode 100644 tests/data/acpi/q35/DSDT.ivrs
>   create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
>   create mode 100644 tests/data/acpi/q35/DSDT.xapic
>   create mode 100644 tests/data/acpi/q35/FACP.xapic
>   create mode 100644 tests/data/acpi/q35/IVRS.ivrs
>   create mode 100644 tests/data/acpi/q35/SRAT.xapic

32-bit printf errors:

../hw/virtio/vhost-vdpa.c: In function 'vhost_vdpa_listener_skipped_section':
../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects argument of type 'long 
unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'} 
[-Werror=format=]
          error_report("RAM section out of device range (min=%lu, addr=%lu)",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       iova_min, section->offset_within_address_space);
                       ~~~~~~~~
../hw/virtio/vhost-vdpa.c:55:22: error: format '%lu' expects argument of type 'long 
unsigned int', but argument 3 has type 'hwaddr' {aka 'long long unsigned int'} 
[-Werror=format=]
../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects argument of type 'long 
unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'} 
[-Werror=format=]
          error_report("RAM section out of device range (max=%lu, end addr=%lu)",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       iova_max, int128_get64(llend));
                       ~~~~~~~~
../hw/virtio/vhost-vdpa.c:62:22: error: format '%lu' expects argument of type 'long 
unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'} 
[-Werror=format=]
cc1: all warnings being treated as errors


Also fails s390x host testing:


ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion failed (signature == 
SIGNATURE): (0x00000000 == 0x0000dead)
ERROR qtest-i386/bios-tables-test - Bail out! 
ERROR:../tests/qtest/boot-sector.c:170:boot_sector_test: assertion failed (signature == 
SIGNATURE): (0x00000000 == 0x0000dead)
Makefile.mtest:368: recipe for target 'run-test-44' failed


r~

