Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9693401C20
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:13:15 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNER0-0003FN-NE
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEOx-0000S9-GT
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEOv-0007Fl-PQ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id v10so9796010wrd.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3TUCBY75XAtC7dZUWgyxvoa7nrvw4xfeBBRuc2cv7yM=;
 b=jjjmecIJwC42lWxGcZo5CGPa/BrVd0qnIwEQBQkcYTx/XXldqMdIYOk8WjvBRi4UIT
 Tu6wd3z/I+2MP31q5D0cyMAG/uDyFKpUU+1B6/Ywd7gF1j1yfRoq9PuPZZL3LSrHk0MK
 Jys8ZtCnVSEb/6Hu/ERjAclG+XtEW6f0FycOU21p/rBuR80kTlsFiBc8D/yMImlgacDo
 WMZe0oCmSRkcbiGjTef9S6HGUwzawjXxTh/9gwQzHsnDEuuSHbvUwfv3jN522JPZ4rxd
 EUPs9+CBYjWU8BxOfd7YvXKMRjKK8TMpOoJ5GaIncy1FscAALo8cuuBsJwq9sOHFyBqM
 JL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3TUCBY75XAtC7dZUWgyxvoa7nrvw4xfeBBRuc2cv7yM=;
 b=QxMazACBsg4aJ3ti/+mOm3Q/i3Y+YMUWIgBYjg3B1BurUt4mblo86r3DXuHgQcD/j+
 rOzVJikBZ4h8gwE4TcfnhvdAikPHWK3X7txjGPU1nDOEVnf04RC+ykqgDGmxsvjFHuN1
 a7fwalMNZlbvKqhZE8cXOJ6xDfcjHRdDRh1dYz77e59x3v+Bt+ADH3YMRUtEdnRr0biU
 JTgrrjBxaa5MyWxrE9NjzrhzzbKVMh9ny2CdkrxJNde/6V+/IFygC1LjBdqbtoMIlc7U
 4nvb75edjXnNa2IPhphvzRSRhZ+m0modiAbL9y86tnL+0m+Km6l1HGy/xjwJHMs7M2zB
 3EWA==
X-Gm-Message-State: AOAM531KOXDeI1+xOzZrIWmeIit7/cWIq1K8MXDXnJwWcSJE/+FmH5is
 AaptAO2iBngL9PX2WbaDNlS57Yv1c7o=
X-Google-Smtp-Source: ABdhPJzLihgSJzr6G3agZjtpIbRWHezZSy3LJ29GmbvS0R91onU8BM4YRI2CsJyTVZLahekmdsHraw==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr13040364wru.80.1630933863197; 
 Mon, 06 Sep 2021 06:11:03 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.02 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/36] (Mostly) x86 changes for 2021-09-06
Date: Mon,  6 Sep 2021 15:10:23 +0200
Message-Id: <20210906131059.55234-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

The following changes since commit 31ebff513fad11f315377f6b07447169be8d9f86:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-03' into staging (2021-09-04 19:21:19 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 4e3cdb6ce6048bb28d70a438081252a29563b757:

  doc: Add the SGX doc (2021-09-06 04:10:24 -0400)

----------------------------------------------------------------
* SGX support (Sean, Yang)
* vGIF and vVMLOAD/VMSAVE support (Lara)
* Move GBM handling to Meson (Thomas)

----------------------------------------------------------------
Lara Lazier (7):
      target/i386: VMRUN and VMLOAD canonicalizations
      target/i386: Added VGIF feature
      target/i386: Moved int_ctl into CPUX86State structure
      target/i386: Added VGIF V_IRQ masking capability
      target/i386: Added ignore TPR check in ctl_has_irq
      target/i386: Added changed priority check for VIRQ
      target/i386: Added vVMLOAD and vVMSAVE feature

Sean Christopherson (21):
      memory: Add RAM_PROTECTED flag to skip IOMMU mappings
      hostmem: Add hostmem-epc as a backend for SGX EPC
      i386: Add 'sgx-epc' device to expose EPC sections to guest
      vl: Add sgx compound properties to expose SGX EPC sections to guest
      i386: Add primary SGX CPUID and MSR defines
      i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
      i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
      i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
      i386: Add get/set/migrate support for SGX_LEPUBKEYHASH MSRs
      i386: Add feature control MSR dependency when SGX is enabled
      i386: Update SGX CPUID info according to hardware/KVM/user input
      i386: kvm: Add support for exposing PROVISIONKEY to guest
      i386: Propagate SGX CPUID sub-leafs to KVM
      Adjust min CPUID level to 0x12 when SGX is enabled
      hw/i386/fw_cfg: Set SGX bits in feature control fw_cfg accordingly
      hw/i386/pc: Account for SGX EPC sections when calculating device memory
      i386/pc: Add e820 entry for SGX EPC section(s)
      i386: acpi: Add SGX EPC entry to ACPI tables
      q35: Add support for SGX EPC
      i440fx: Add support for SGX EPC
      doc: Add the SGX doc

Thomas Huth (1):
      configure / meson: Move the GBM handling to meson.build

Yang Zhong (7):
      qom: Add memory-backend-epc ObjectOptions support
      hostmem-epc: Add the reset interface for EPC backend reset
      sgx-epc: Add the reset interface for sgx-epc virt device
      sgx-epc: Avoid bios reset during sgx epc initialization
      hostmem-epc: Make prealloc consistent with qemu cmdline during reset
      Kconfig: Add CONFIG_SGX support
      sgx-epc: Add the fill_device_info() callback support

 backends/hostmem-epc.c                   | 118 ++++++++++++++
 backends/meson.build                     |   1 +
 configs/devices/i386-softmmu/default.mak |   1 +
 configure                                |  14 --
 contrib/vhost-user-gpu/meson.build       |   5 +-
 docs/intel-sgx.txt                       | 167 +++++++++++++++++++
 hw/i386/Kconfig                          |   5 +
 hw/i386/acpi-build.c                     |  22 +++
 hw/i386/fw_cfg.c                         |  10 +-
 hw/i386/meson.build                      |   2 +
 hw/i386/pc.c                             |  15 +-
 hw/i386/pc_piix.c                        |   4 +
 hw/i386/pc_q35.c                         |   3 +
 hw/i386/sgx-epc.c                        | 265 +++++++++++++++++++++++++++++++
 hw/i386/sgx-stub.c                       |  13 ++
 hw/i386/sgx.c                            |  84 ++++++++++
 hw/i386/x86.c                            |  29 ++++
 hw/vfio/common.c                         |   1 +
 include/exec/memory.h                    |  15 +-
 include/hw/i386/pc.h                     |   8 +
 include/hw/i386/sgx-epc.h                |  67 ++++++++
 include/hw/i386/x86.h                    |   1 +
 meson.build                              |  14 +-
 monitor/hmp-cmds.c                       |  10 ++
 qapi/machine.json                        |  52 +++++-
 qapi/qom.json                            |  19 +++
 qemu-options.hx                          |  10 +-
 slirp                                    |   2 +-
 softmmu/memory.c                         |   5 +
 softmmu/physmem.c                        |   3 +-
 target/i386/cpu.c                        | 199 +++++++++++++++++++++--
 target/i386/cpu.h                        |  38 +++++
 target/i386/kvm/kvm.c                    |  75 +++++++++
 target/i386/kvm/kvm_i386.h               |   2 +
 target/i386/machine.c                    |  42 ++++-
 target/i386/svm.h                        |   8 +
 target/i386/tcg/seg_helper.c             |   2 +-
 target/i386/tcg/sysemu/excp_helper.c     |   2 +-
 target/i386/tcg/sysemu/misc_helper.c     |  11 +-
 target/i386/tcg/sysemu/svm_helper.c      | 121 +++++++++-----
 40 files changed, 1377 insertions(+), 88 deletions(-)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 docs/intel-sgx.txt
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c
 create mode 100644 include/hw/i386/sgx-epc.h
-- 
2.31.1


