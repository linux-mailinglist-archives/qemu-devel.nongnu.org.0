Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886AF403785
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:07:19 +0200 (CEST)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuUA-0000mi-41
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRe-0006Iy-PC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRa-0002nR-A4
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1108403wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MwdHlFYBtMC81v2eYrOd3YNT9gNsiu844Yvgz7srHLA=;
 b=CoVbFapSXvpoeNssXAAiIcJdl6FwB/IXCre7BXmDCKeVRprmtAe564Hw9BFgJ/HT/y
 +K4hyqjwVlL7J1ck9NSzM5aVQNNXR0ZLCsKP7653c8Oq6v9pG63sfaR4JRQK8OzUIXyp
 TeIe6587YTQzGmtgOf37Xf2GO5IwWXIYUil6TjD3rOf//Ww2eB9Iq5+HOomqPNF8vhae
 2RsuPFbYZOFLmLOyU2I5P0la2LvkCLbRNly/Ln4wn7StXaT8p68Z6HVvN/EfR6aH0Wlu
 pF06G2G9z0MpBItvuFib9BwODUnk/ukfAguus4nWtYpcNgeE/B1u9HVHX1oftCffJtRh
 8vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MwdHlFYBtMC81v2eYrOd3YNT9gNsiu844Yvgz7srHLA=;
 b=gn75o2/QyitIQNKaMovDQ3vOotN/QImJQ+LtWDz7ztDTw4Cm6DD1xllDccjH5X75Pa
 0BZZgmu4EpfoNE0G81cpo1NpfX2cpnn+P+Akn3Tl5rrGhoCMBLwA/Xm7Jni3Y03PbDA5
 ximwfrqY/xvSOuP8PhxoiXkb3cCOaffzXQNZc+Pa6f/og7Ct5V+7pjdK0w8X0EN0liAN
 OWEr7mNPZcSshwbUKPfufe3vjiO/lQ9FpuU6hBs/6eiFqDWhH8F38PBmQG+nsgxP9TjY
 pJZ/nIFD+91bp1+wu0zIWOVvMdMljOwZY678uWQnMu0C9Uzd/Vfba7MyuIEHkl0nrzku
 vKpA==
X-Gm-Message-State: AOAM532poeC55fS7KDQe/1AJxAco9zY84lWLXj1Op71Z59rZpj4GuEWa
 8vFlU6BQV3V23+tXR1Bt4ERUGyfGvPI=
X-Google-Smtp-Source: ABdhPJz1npUEgqonsLYocpA005a/vAfmJCr8X/ZSIQzDC8whLkA+YinxMhLDYafd4XZ3Kcs+wXN/pQ==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr2768442wmg.57.1631095476056; 
 Wed, 08 Sep 2021 03:04:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 00/43] (Mostly) x86 changes for 2021-09-06
Date: Wed,  8 Sep 2021 12:03:43 +0200
Message-Id: <20210908100426.264356-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
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

The following changes since commit f9128631fbeb40a55f7bc145397981c963d40909:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-09-07 13:24:43 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 3b942628231462c56c883a6273cf137d2a382f8f:

  ebpf: only include in system emulators (2021-09-08 08:07:04 +0200)

----------------------------------------------------------------
* SGX support (Sean, Yang)
* vGIF and vVMLOAD/VMSAVE support (Lara)
* Fix LA57 support in TCG (Daniel)
* Avoid pointless warnings for static user-only compilation (Thomas)
* Fix --disable-system compilation if libbpf is found
* target-i386.rst restructuring

----------------------------------------------------------------
v3->v4: added docs changes and build system bugfixes

Daniel P. Berrangé (1):
      target/i386: add missing bits to CR4_RESERVED_MASK

Lara Lazier (7):
      target/i386: VMRUN and VMLOAD canonicalizations
      target/i386: Added VGIF feature
      target/i386: Moved int_ctl into CPUX86State structure
      target/i386: Added VGIF V_IRQ masking capability
      target/i386: Added ignore TPR check in ctl_has_irq
      target/i386: Added changed priority check for VIRQ
      target/i386: Added vVMLOAD and vVMSAVE feature

Paolo Bonzini (6):
      fw_cfg: add etc/msr_feature_control
      docs: standardize book titles to === with overline
      docs: standardize directory index to --- with overline
      docs/system: standardize man page sections to --- with overline
      docs/system: move x86 CPU configuration to a separate document
      ebpf: only include in system emulators

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
      docs/system: Add SGX documentation to the system manual

Thomas Huth (1):
      meson.build: Do not look for VNC-related libraries if have_system is not set

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
 docs/about/index.rst                     |   3 +-
 docs/devel/index.rst                     |   3 +-
 docs/index.rst                           |   1 +
 docs/interop/index.rst                   |   3 +-
 docs/specs/index.rst                     |   3 +-
 docs/system/cpu-models-x86.rst.inc       |   4 +-
 docs/system/i386/cpu.rst                 |   1 +
 docs/system/i386/sgx.rst                 | 165 +++++++++++++++++++
 docs/system/index.rst                    |   3 +-
 docs/system/qemu-block-drivers.rst       |   4 +
 docs/system/qemu-cpu-models.rst          |  10 +-
 docs/system/qemu-manpage.rst             |  10 +-
 docs/system/target-i386.rst              |   9 +-
 docs/tools/index.rst                     |   3 +-
 docs/tools/qemu-img.rst                  |   1 +
 docs/tools/qemu-nbd.rst                  |   1 +
 docs/tools/qemu-pr-helper.rst            |   1 +
 docs/tools/qemu-storage-daemon.rst       |   1 +
 docs/tools/qemu-trace-stap.rst           |   1 +
 docs/user/index.rst                      |   3 +-
 ebpf/meson.build                         |   2 +-
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
 hw/nvram/fw_cfg.c                        |   1 +
 hw/vfio/common.c                         |   1 +
 include/exec/memory.h                    |  15 +-
 include/hw/i386/pc.h                     |   8 +
 include/hw/i386/sgx-epc.h                |  67 ++++++++
 include/hw/i386/x86.h                    |   1 +
 meson.build                              |   2 +-
 monitor/hmp-cmds.c                       |  10 ++
 qapi/machine.json                        |  52 +++++-
 qapi/qom.json                            |  19 +++
 qemu-options.hx                          |  10 +-
 softmmu/memory.c                         |   5 +
 softmmu/physmem.c                        |   3 +-
 target/i386/cpu.c                        | 199 +++++++++++++++++++++--
 target/i386/cpu.h                        |  39 +++++
 target/i386/kvm/kvm.c                    |  75 +++++++++
 target/i386/kvm/kvm_i386.h               |   2 +
 target/i386/machine.c                    |  42 ++++-
 target/i386/svm.h                        |   8 +
 target/i386/tcg/seg_helper.c             |   2 +-
 target/i386/tcg/sysemu/excp_helper.c     |   2 +-
 target/i386/tcg/sysemu/misc_helper.c     |  11 +-
 target/i386/tcg/sysemu/svm_helper.c      | 121 +++++++++-----
 58 files changed, 1418 insertions(+), 81 deletions(-)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 docs/system/i386/cpu.rst
 create mode 100644 docs/system/i386/sgx.rst
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c
 create mode 100644 include/hw/i386/sgx-epc.h
-- 
2.31.1


