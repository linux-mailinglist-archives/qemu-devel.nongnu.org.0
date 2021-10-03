Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DCC420082
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:45:53 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwC0-0005vc-0Y
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9B-00038r-BT
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:57 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw99-0000jA-0h
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:57 -0400
Received: by mail-ed1-x532.google.com with SMTP id b8so17277222edk.2
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QH7GZCKamsV/ssD5bHEGJcr4aqdx7KAkBu+047wndI=;
 b=pZfVT2/Kxk0us50Fzj/rFnMAqZKCeF10p2eAdSez8ZNUzqj9izbmpKxqJCCH/vQeVQ
 qdECsggrYHBg6DX9hRDcqlzyrQcQ2CBR5S20NzNih8+ewHQqEpe4seca34cLxpvfk/fD
 TpT2YkvkYZdcyD4/xt1hjccdhJgEGNx6xFmago1zO4KXRuBRCKr89oRKyCWwI8iDdkw/
 iHd0yoyDroAiZQer3LC8y8cFfwLZbVv01zGDpFNjmyljXTJlcwKrc1mAcr/2hDVfNLXF
 ApwCP1s5inop8t3AqMmM1t5SGhlT+lD6YcyOU3DDajtV61uAsxWoPDrFYB7snKXfCMMg
 R/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4QH7GZCKamsV/ssD5bHEGJcr4aqdx7KAkBu+047wndI=;
 b=p3N9dfeTd/VQrBdtFpwVI9J2LmKUeb4lDMFW1t66kctVCYa0aS5IN5oKrWHsIGPAyT
 CFpD37xwbpMTifbXYBWR1CHHoONRLokv/hNWnhtreHe6LZBGUKfet+RVyS7Umij6HQey
 haO8OPUqnnUD5kOs2RT+dorQRVNx6yPB87PBkdsikDuz25A8Sa3hFbzAa8HRyRhbnrou
 WG4tp/VsV/m18V7SpeZw8rezkxxpmL1njzgE+ATbUBfChRsiiC2QmVLXjiwetrVTk+/g
 n7x0cLe2F49iJY1RLC+c2MiefrsGWcN96c7MlSlFdUGps94sDL4qTvdSirLWgcV2Ggh0
 r7iw==
X-Gm-Message-State: AOAM533eFGGHk42pxHtmfSMbuqzXurOr/+3iLOTJ6fLgiYJS4hJgUSGi
 qUna5lgZeeOO4qdAzEClP5JniIWNQyI=
X-Google-Smtp-Source: ABdhPJzPVFKpBmnKNiEULSjw6Duw82U6el4yX5rBNAxbtXnV7or9yrdk+SSwQfmOQatIcqLdOnJIXg==
X-Received: by 2002:a17:906:3fc9:: with SMTP id
 k9mr9096985ejj.248.1633246972686; 
 Sun, 03 Oct 2021 00:42:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] Misc changes for 2021-10-03
Date: Sun,  3 Oct 2021 09:42:20 +0200
Message-Id: <20211003074250.60869-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bb4aa8f59e18412cff0d69f14aee7abba153161a:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210930' into staging (2021-09-30 21:16:54 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to cb83ba8c1ab856b4327e7e869c410bbfd4152c2c:

  softmmu/memory_mapping: optimize for RamDiscardManager sections (2021-10-02 08:43:22 +0200)

----------------------------------------------------------------
* -smp cleanpus (Yanan)
* Hyper-V enlightenment functionality (Vitaly)
* virtio-mem support in dump, tpm and QMP (David)
* NetBSD GCC 7.4 compiler support (Nia)

----------------------------------------------------------------
David Hildenbrand (7):
      virtio-mem-pci: Fix memory leak when creating MEMORY_DEVICE_SIZE_CHANGE event
      qapi: Include qom-path in MEMORY_DEVICE_SIZE_CHANGE qapi events
      monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi events per device
      tpm: mark correct memory region range dirty when clearing RAM
      softmmu/memory_mapping: never merge ranges accross memory regions
      softmmu/memory_mapping: factor out adding physical memory ranges
      softmmu/memory_mapping: optimize for RamDiscardManager sections

Paolo Bonzini (1):
      machine: Use g_autoptr in machine_set_smp

Vitaly Kuznetsov (6):
      i386: Support KVM_CAP_ENFORCE_PV_FEATURE_CPUID
      i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID
      i386: Move HV_APIC_ACCESS_RECOMMENDED bit setting to hyperv_fill_cpuids()
      i386: Implement pseudo 'hv-avic' ('hv-apicv') enlightenment
      i386: Make Hyper-V version id configurable
      i386: Change the default Hyper-V version to match WS2016

Yanan Wang (15):
      qapi/machine: Fix an incorrect comment of SMPConfiguration
      machine: Deprecate "parameter=0" SMP configurations
      machine: Minor refactor/fix for the smp parsers
      machine: Uniformly use maxcpus to calculate the omitted parameters
      machine: Set the value of cpus to match maxcpus if it's omitted
      machine: Improve the error reporting of smp parsing
      qtest/numa-test: Use detailed -smp CLIs in pc_dynamic_cpu_cfg
      qtest/numa-test: Use detailed -smp CLIs in test_def_cpu_split
      machine: Prefer cores over sockets in smp parsing since 6.2
      machine: Use ms instead of global current_machine in sanity-check
      machine: Tweak the order of topology members in struct CpuTopology
      machine: Make smp_parse generic enough for all arches
      machine: Remove smp_parse callback from MachineClass
      machine: Move smp_prefer_sockets to struct SMPCompatProps
      machine: Put all sanity-check in the generic SMP parser

nia (1):
      configure: Loosen GCC requirement from 7.5.0 to 7.4.0

 configure                      |   6 +-
 docs/about/deprecated.rst      |  15 +++
 docs/hyperv.txt                |  41 +++++++-
 hw/arm/virt.c                  |   1 +
 hw/core/machine.c              | 209 ++++++++++++++++++++++++++++-------------
 hw/i386/pc.c                   |  69 ++------------
 hw/i386/pc_piix.c              |   1 +
 hw/i386/pc_q35.c               |   1 +
 hw/ppc/spapr.c                 |   1 +
 hw/s390x/s390-virtio-ccw.c     |   1 +
 hw/tpm/tpm_ppi.c               |   5 +-
 hw/virtio/virtio-mem-pci.c     |  10 +-
 include/hw/boards.h            |  23 +++--
 monitor/monitor.c              |   9 ++
 qapi/machine.json              |   7 +-
 qemu-options.hx                |  24 +++--
 softmmu/memory_mapping.c       |  64 ++++++++-----
 target/i386/cpu.c              |  22 ++++-
 target/i386/cpu.h              |  12 ++-
 target/i386/kvm/hyperv-proto.h |   1 +
 target/i386/kvm/kvm.c          |  62 +++++++++---
 tests/qtest/numa-test.c        |   6 +-
 22 files changed, 387 insertions(+), 203 deletions(-)
-- 
2.31.1


