Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA8D47634A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:28:36 +0100 (CET)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxat9-0006lL-7s
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq1-0003rV-2V
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:21 -0500
Received: from [2a00:1450:4864:20::42e] (port=37740
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxapy-0004CZ-ST
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:20 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t26so3915641wrb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CukGdtqjPNTmISWvV5cIwe1TRooT8DwJbtCTVz1QbSE=;
 b=BXHlpF5NTgUHlCDrlaHPrbjwfTzxIRg6AqYt2UkckgRWZa7a/NBoyTNeB6uskb1Y1y
 FdlknZ9HwF+ipmoQ2oZAbTau2LrYlsCLxyaauW6GcgZFzLapERNOn4miofTAtsDEsdz/
 Ndynwp3hksueSPHwIPsjUdRg902IYl8VkxkIw/4PWtpigM+jHD+fpEJD3WumOSl3gGS3
 nSWDTUdgtYRJzYeX1Y9OBTHVXCCMw/+fAN7mySUFTe9eP3Dj6nIiFkN0WyH8XvhKq5Ux
 vP5MTIbshH6hhXpeNFlnEbc1YuvRK3AflW2EZtYtC2jgZr/T7VKeNk4aebJ1BGk3H84R
 JaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CukGdtqjPNTmISWvV5cIwe1TRooT8DwJbtCTVz1QbSE=;
 b=CSzIn3KdjH7QDyd4Ff+nAGFAkWT+b4j4aNdwAyLcAfT8QwPa4JH30q1LPjJf2tinhf
 f2sAEfX9SOKWJHrNiHgktBg4czfRd6KVxx8yjP+BZczjOFLY7EDu20ITw1126WlyvXzc
 ci6tZkdkNT5d1UWt6/IbC5UnbW/jYUMzbEVmatEHhfCiFgll/z4dn9NoX7Klweu90J/G
 ReqVZgYSkNthFP7nBvkUhiE5Q3rfUuCuOV/I3E0Ezm9U2U4kfPkhpL2nNsVHu0wg7qiW
 mm4UE6pgKJtUHcyB3AAePejopbTqnusmYc7J7xcGcQ9FhgPlKC4H6zfZYf65B7J0eYmS
 Zd3w==
X-Gm-Message-State: AOAM532KpuVv0DGeVAZNtHmdVp0Av+nOSsfdmY3VnigS0+BPsG/QvC8A
 Ghe9oQpj0qVx0wVw4e7fi4URYcdE+uE=
X-Google-Smtp-Source: ABdhPJxkC2LjFX/WFSOYRTaBWOOuHA4SMGH/KR9B8AzTrud/fgKgSYFv+iwna7MIIgHLaelauqr+3w==
X-Received: by 2002:adf:f7c7:: with SMTP id a7mr5897437wrq.701.1639599916785; 
 Wed, 15 Dec 2021 12:25:16 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Misc patches for 2021-12-15
Date: Wed, 15 Dec 2021 21:25:02 +0100
Message-Id: <20211215202515.91586-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 50456a6794fbb8dc94a31eb9534e91c586da7add:

  Merge tag 'pull-ppc-20211129' of https://github.com/legoater/qemu into staging (2021-11-29 21:56:06 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to cbe08c35cfa8f96125512a8aa3e1bf251b1410a5:

  configure: remove dead variables (2021-12-10 09:47:18 +0100)

----------------------------------------------------------------
* improve compatibility for macOS scripts/entitlement.sh (Evan)
* add support for KVM_GUESTDBG_BLOCKIRQ (Maxim)
* update linux-headers to Linux 5.16 (myself)
* configure cleanups (myself)
* lsi53c895a assertion failure fix (Philippe)
* fix incorrect description for die-id (Yanan)
* support for NUMA in SGX enclave memory (Yang Zhong)

----------------------------------------------------------------
Evan Miller (1):
      scripts/entitlement.sh: Use backward-compatible cp flags

Maxim Levitsky (3):
      gdbstub: reject unsupported flags in handle_set_qemu_sstep
      gdbstub, kvm: let KVM report supported singlestep flags
      kvm: add support for KVM_GUESTDBG_BLOCKIRQ

Paolo Bonzini (3):
      virtio-gpu: do not byteswap padding
      linux-headers: update to 5.16-rc1
      configure: remove dead variables

Philippe Mathieu-Daudé (2):
      hw/scsi/lsi53c895a: Do not abort when DMA requested and no data queued
      tests/qtest: Add fuzz-lsi53c895a-test

Yanan Wang (1):
      qapi/machine.json: Fix incorrect description for die-id

Yang Zhong (3):
      numa: Enable numa for SGX EPC sections
      numa: Support SGX numa in the monitor and Libvirt interfaces
      doc: Add the SGX numa description

 MAINTAINERS                                   |   1 +
 accel/kvm/kvm-all.c                           |  29 ++++++
 configure                                     |   5 --
 docs/system/i386/sgx.rst                      |  31 ++++++-
 gdbstub.c                                     |  83 ++++++++++++------
 hw/core/numa.c                                |   5 +-
 hw/i386/acpi-build.c                          |   2 +
 hw/i386/sgx-epc.c                             |   3 +
 hw/i386/sgx-stub.c                            |   4 +
 hw/i386/sgx.c                                 |  95 ++++++++++++++++++--
 hw/scsi/lsi53c895a.c                          |   3 +-
 include/hw/i386/sgx-epc.h                     |   3 +
 include/hw/virtio/virtio-gpu-bswap.h          |   1 -
 include/standard-headers/drm/drm_fourcc.h     | 121 +++++++++++++++++++++++++-
 include/standard-headers/linux/ethtool.h      |  31 +++++++
 include/standard-headers/linux/fuse.h         |  10 ++-
 include/standard-headers/linux/pci_regs.h     |   6 ++
 include/standard-headers/linux/virtio_gpu.h   |  18 +++-
 include/standard-headers/linux/virtio_ids.h   |  24 +++++
 include/standard-headers/linux/virtio_vsock.h |   3 +-
 include/sysemu/kvm.h                          |  15 ++++
 linux-headers/asm-arm64/unistd.h              |   1 +
 linux-headers/asm-generic/unistd.h            |  22 +++--
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |   5 ++
 linux-headers/asm-x86/unistd_32.h             |   3 +
 linux-headers/asm-x86/unistd_64.h             |   3 +
 linux-headers/asm-x86/unistd_x32.h            |   3 +
 linux-headers/linux/kvm.h                     |  40 +++++++--
 monitor/hmp-cmds.c                            |   1 +
 qapi/machine.json                             |  12 ++-
 qapi/misc-target.json                         |  19 +++-
 qemu-options.hx                               |   4 +-
 scripts/entitlement.sh                        |   2 +-
 tests/qtest/fuzz-lsi53c895a-test.c            |  52 +++++++++++
 tests/qtest/meson.build                       |   1 +
 42 files changed, 590 insertions(+), 78 deletions(-)
 create mode 100644 tests/qtest/fuzz-lsi53c895a-test.c
-- 
2.33.1


