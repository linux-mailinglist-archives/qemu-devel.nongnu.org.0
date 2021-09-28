Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F041AF9C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:04:05 +0200 (CEST)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCmC-0003Fs-Q9
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa1-0006NL-Hc
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:29 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCZw-0001KS-1H
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:25 -0400
Received: by mail-ed1-x532.google.com with SMTP id v10so78448651edj.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYpQMqW6dCHm3d6TURtQD9k2qyHHt0kJtDbX+3qegZg=;
 b=NSFy30VvAH/yYQn2JBiBkJyDvrfoA0U0woAjx3SAoByRkplQWuwqOwPHPJ62HeN6ab
 q9KRegrOi4s55K/f16MaSu2lHARgX3Jz4rthVuYAwgUGXzxEOgoV3G9u7YdlNIXqFeq9
 KtcyjTqi5cxjnYXzMjtpgNXjYcdrvWS21u73KT/u9POIZLWLg2sFsuxKx7m4N8hMhqUV
 +0EzDYbRyycG6B6fz0YJSFMHw1qmUiGDefWEGjpGHedw90agLADOJUTRDMwJpnWOZ8Pb
 AKxg/nfCTR0Fz1YxPOjT9AjnVbwKKrAx3LZEfGPRC5bWhwBuaLVsbjUOkDcPSQb7lTtz
 66oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vYpQMqW6dCHm3d6TURtQD9k2qyHHt0kJtDbX+3qegZg=;
 b=P6sAiZB8SpR/DR+7tE0VeHqTKI5Kn92MHIz6H2goGk3SLQvEKr/M47GT1pyOaDU4SQ
 kEAApdxvPEsk7C0T8SdKEoHz4rOuyH08Tadx4G9UgDkCN1IEfdY/2zPSse5mwpmrYZva
 wIs9YeG5dNAZIdKyz+5aGg8ZCWEUN9z+VIkDLRXMCVHOA44652lKYZUcgwQP2QTYPBFV
 YcLNfBd2SN4TjhZjHM1ONKsegKdYM1DMcSlzVp2A5DN8+n1Qhyq2uL0tLnCk7/kRh6hB
 UwxOrW5x7Z4Xxc8rTXAi/HosV4QhdNh4QB0UuECGKnCLXKzX7WycCoMnVzQGR/KVv7zj
 h7Dg==
X-Gm-Message-State: AOAM533OkDDRBUB1I192ZVPofFa3Rn0Qi0+5/DfH3jsvgoHlCTqJX2As
 pahGiAIscPObUk/8Nc+/VSrHbVCFuGY=
X-Google-Smtp-Source: ABdhPJwSNf1twRVGvWKn3brEBKto4KmBX+OAWTuuPZY3bdkoJc2sWTXjePX49pdvFy3+7rJs4cKNzQ==
X-Received: by 2002:a17:907:960f:: with SMTP id
 gb15mr1739788ejc.460.1632833478965; 
 Tue, 28 Sep 2021 05:51:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] x86 and misc changes for 2021-09-28
Date: Tue, 28 Sep 2021 14:50:43 +0200
Message-Id: <20210928125116.183620-1-pbonzini@redhat.com>
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

The following changes since commit 14f02d8a9ec1746823c106933a4c8f062f9e0f95:

  Merge remote-tracking branch 'remotes/philmd/tags/integration-testing-20210927' into staging (2021-09-27 19:52:43 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 824ba1e99c8bc12048636ea43dec923385ff042f:

  meson_options.txt: Switch the default value for the vnc option to 'auto' (2021-09-28 14:50:14 +0200)

----------------------------------------------------------------
* SGX implementation for x86
* Miscellaneous bugfixes
* Fix dependencies from ROMs to qtests

----------------------------------------------------------------
Marc-André Lureau (1):
      build-sys: add HAVE_IPPROTO_MPTCP

Paolo Bonzini (2):
      meson: unpack edk2 firmware even if --disable-blobs
      tests: qtest: bios-tables-test depends on the unpacked edk2 ROMs

Peter Maydell (1):
      target/i386: Fix memory leak in sev_read_file_base64()

Peter Xu (2):
      memory: Name all the memory listeners
      memory: Add tracepoint for dirty sync

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
      meson_options.txt: Switch the default value for the vnc option to 'auto'

Yang Zhong (5):
      Kconfig: Add CONFIG_SGX support
      qom: Add memory-backend-epc ObjectOptions support
      sgx-epc: Add the fill_device_info() callback support
      target/i386: Add HMP and QMP interfaces for SGX
      target/i386: Add the query-sgx-capabilities QMP command

 accel/hvf/hvf-accel-ops.c                |   1 +
 accel/kvm/kvm-all.c                      |   7 +-
 backends/hostmem-epc.c                   |  82 ++++++++++++++
 backends/meson.build                     |   1 +
 configs/devices/i386-softmmu/default.mak |   1 +
 docs/system/i386/sgx.rst                 | 165 +++++++++++++++++++++++++++
 docs/system/target-i386.rst              |   1 +
 hmp-commands-info.hx                     |  15 +++
 hw/i386/Kconfig                          |   5 +
 hw/i386/acpi-build.c                     |  22 ++++
 hw/i386/fw_cfg.c                         |  10 +-
 hw/i386/meson.build                      |   2 +
 hw/i386/pc.c                             |  15 ++-
 hw/i386/pc_piix.c                        |   1 +
 hw/i386/pc_q35.c                         |   1 +
 hw/i386/sgx-epc.c                        | 184 +++++++++++++++++++++++++++++++
 hw/i386/sgx-stub.c                       |  26 +++++
 hw/i386/sgx.c                            | 170 ++++++++++++++++++++++++++++
 hw/i386/x86.c                            |  29 +++++
 hw/i386/xen/xen-hvm.c                    |   2 +
 hw/intc/openpic_kvm.c                    |   1 +
 hw/remote/proxy-memory-listener.c        |   1 +
 hw/vfio/common.c                         |   2 +
 hw/vfio/spapr.c                          |   1 +
 hw/virtio/vhost-vdpa.c                   |   1 +
 hw/virtio/vhost.c                        |   2 +
 hw/virtio/virtio.c                       |   1 +
 hw/xen/xen_pt.c                          |   2 +
 include/exec/memory.h                    |  23 +++-
 include/hw/i386/hostmem-epc.h            |  28 +++++
 include/hw/i386/pc.h                     |   6 +
 include/hw/i386/sgx-epc.h                |  67 +++++++++++
 include/hw/i386/sgx.h                    |  12 ++
 include/hw/i386/x86.h                    |   1 +
 include/monitor/hmp-target.h             |   1 +
 include/sysemu/kvm_int.h                 |   2 +-
 io/dns-resolver.c                        |   2 +-
 meson.build                              |  18 +--
 meson_options.txt                        |   2 +-
 monitor/hmp-cmds.c                       |  10 ++
 pc-bios/descriptors/meson.build          |   4 +-
 pc-bios/meson.build                      |   5 +-
 qapi/machine.json                        |  63 ++++++++++-
 qapi/misc-target.json                    |  61 ++++++++++
 qapi/qom.json                            |  19 ++++
 qapi/sockets.json                        |   2 +-
 qemu-options.hx                          |  10 +-
 softmmu/memory.c                         |   7 ++
 softmmu/physmem.c                        |   4 +-
 softmmu/trace-events                     |   1 +
 target/arm/kvm.c                         |   1 +
 target/i386/cpu.c                        | 167 +++++++++++++++++++++++++++-
 target/i386/cpu.h                        |  16 +++
 target/i386/hax/hax-mem.c                |   1 +
 target/i386/kvm/kvm.c                    |  77 ++++++++++++-
 target/i386/kvm/kvm_i386.h               |   2 +
 target/i386/machine.c                    |  20 ++++
 target/i386/monitor.c                    |  32 ++++++
 target/i386/nvmm/nvmm-all.c              |   1 +
 target/i386/sev.c                        |   2 +-
 target/i386/whpx/whpx-all.c              |   1 +
 tests/qtest/meson.build                  |   6 +-
 tests/qtest/qmp-cmd-test.c               |   2 +
 util/qemu-sockets.c                      |   6 +-
 64 files changed, 1395 insertions(+), 38 deletions(-)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 docs/system/i386/sgx.rst
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c
 create mode 100644 include/hw/i386/hostmem-epc.h
 create mode 100644 include/hw/i386/sgx-epc.h
 create mode 100644 include/hw/i386/sgx.h
-- 
2.31.1


