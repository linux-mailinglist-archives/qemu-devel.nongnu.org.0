Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F44D99E5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:03:57 +0100 (CET)
Received: from localhost ([::1]:45516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4y4-0006CG-BW
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:03:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU4pN-0007Wv-33
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:54:58 -0400
Received: from [2a00:1450:4864:20::535] (port=41636
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU4pK-0002JG-Rb
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:54:56 -0400
Received: by mail-ed1-x535.google.com with SMTP id c20so23617673edr.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c35fIfHlUurVNU5oiXgpvaZuMKMY1HzDBarpdEzAlns=;
 b=b3SAVBQhB7StKnrAqfNfRamTqFN5Fa3kjiyEakMiBzJlCJpSUEk5k1S1oYafJA0G7c
 FUxgGZxhK8nBF5N+EjkBIISkyTcBlOd6Hz/mNsP8ilLIWGxMHchHLwgkiho1BbZRGxkC
 rXSG4jM8lZbAGo1BTX3XNhN7+k7d4L1fZGhwlIcRb77yVLFgoRY++qoJKlmRlm2D/tIJ
 mQVe/yr+nNp+pWUbD0TARiZ9YmI1jGpsJbpEjBpl4Ci3k2ncuhEnblTsXBVVdUNRWt19
 EbJKaih1gV0Tz2Bwt3NV6r478AkDM/aSC38CVmcIcoQbzLnX4SKdMxGfojyXBvSoYJfA
 7IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=c35fIfHlUurVNU5oiXgpvaZuMKMY1HzDBarpdEzAlns=;
 b=wX0738UvJcBF7X5mDQhWPPJHynyc1zDJIGW+LPCwkQI1+lNomYkEe9FP246ilLpUht
 mZ3OfNKWlZzkBYFZiksxNvKDjT/nDa3O4rvT3t8IB5LDas+rYjPuqfotTVIprtf4pCng
 W9AV1w2kvxC55TJhy4lBnmFooPtHKcK/o3UWG2+Abf7l1zLnvXalRmA6C1FLTWeC+PIF
 3sz0f/wxrdLRHQr1p4TFlqTUhtol5BzWwB+O/YViGZ+gPdo4mt3/02quYHm5Jrup2x9v
 YyVOnbryG9VRW9WZaDt59NudesQ40YWo8qDlpVRYhq31b5SW5/sCmGghuASChc/qsUTY
 ELZA==
X-Gm-Message-State: AOAM5323OC9DychrKweowTmtfRZ9PPQJ1r3kXY9Jeae7bas5v9NIJc6m
 AmnOt+CXw1UA8W4CJhRmpsA/1EAVWyQ=
X-Google-Smtp-Source: ABdhPJw/OCQ+WfZYliuYZkIxC2qW4tlZvGkTadpOO70WADwBR7AudV3Bf0m1j10yXTON+at+IJ3zzw==
X-Received: by 2002:aa7:de0e:0:b0:416:607c:6d45 with SMTP id
 h14-20020aa7de0e000000b00416607c6d45mr24885882edv.127.1647341692773; 
 Tue, 15 Mar 2022 03:54:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 qa44-20020a17090786ac00b006dbe1ca23casm1731344ejc.45.2022.03.15.03.54.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 03:54:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/22] QEMU changes for 7.0 soft freeze
Date: Tue, 15 Mar 2022 11:54:49 +0100
Message-Id: <20220315105450.1587293-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 6f4fe14b46f0a161f94e3f6e98690ac38184b0be:

  Merge tag 'pull-tcg-20220314' of https://gitlab.com/rth7680/qemu into staging (2022-03-14 18:11:36 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8a5606f6449c90a0731790ed03eebedcf7045070:

  gitlab-ci: do not run tests with address sanitizer (2022-03-15 11:50:50 +0100)

----------------------------------------------------------------
* whpx fixes in preparation for GDB support (Ivan)
* VSS header fixes (Marc-André)
* 5-level EPT support (Vitaly)
* AMX support (Jing Liu & Yang Zhong)
* Bundle changes to MSI routes (Longpeng)
* More precise emulation of #SS
* Disable ASAN testing

----------------------------------------------------------------
Sorry for this being so late.  If you want to delay it to 7.1 I won't complain.

v3->v4: fix sign extension in "target/i386: Throw a
        #SS when loading a non-canonical IST"

Gareth Webb (1):
      target/i386: Throw a #SS when loading a non-canonical IST

Ivan Shcherbakov (2):
      whpx: Fixed reporting of the CPU context to GDB for 64-bit
      whpx: Fixed incorrect CR8/TPR synchronization

Jing Liu (5):
      x86: Fix the 64-byte boundary enumeration for extended state
      x86: Add AMX XTILECFG and XTILEDATA components
      x86: Add XFD faulting bit for state components
      x86: Add AMX CPUIDs enumeration
      x86: add support for KVM_CAP_XSAVE2 and AMX state migration

Longpeng (Mike) (2):
      kvm-irqchip: introduce new API to support route change
      kvm/msi: do explicit commit when adding msi routes

Marc-André Lureau (3):
      meson: fix generic location of vss headers
      qga/vss-win32: check old VSS SDK headers
      qga/vss: update informative message about MinGW

Maxim Levitsky (1):
      KVM: SVM: always set MSR_AMD64_TSC_RATIO to default value

Paolo Bonzini (4):
      update meson-buildoptions.sh
      target/i386: only include bits in pg_mode if they are not ignored
      linux-headers: include missing changes from 5.17
      gitlab-ci: do not run tests with address sanitizer

Vitaly Kuznetsov (2):
      vmxcap: Add 5-level EPT bit
      i386: Add Icelake-Server-v6 CPU model with 5-level EPT support

Yang Zhong (1):
      x86: Grant AMX permission for guest

Zeng Guang (1):
      x86: Support XFD and AMX xsave data migration

 .gitlab-ci.d/buildtest.yml           |   2 -
 accel/kvm/kvm-all.c                  |   7 +-
 accel/stubs/kvm-stub.c               |   2 +-
 hw/misc/ivshmem.c                    |   5 +-
 hw/vfio/pci.c                        |   5 +-
 hw/virtio/virtio-pci.c               |   4 +-
 include/sysemu/kvm.h                 |  23 ++++++-
 linux-headers/asm-x86/kvm.h          |   3 +
 linux-headers/linux/kvm.h            |   4 ++
 meson.build                          |   5 +-
 qga/meson.build                      |   2 +-
 qga/vss-win32/install.cpp            |   4 ++
 qga/vss-win32/provider.cpp           |   4 ++
 qga/vss-win32/vss-common.h           |   3 +-
 scripts/kvm/vmxcap                   |   1 +
 scripts/meson-buildoptions.sh        |   2 +-
 target/i386/cpu.c                    |  84 +++++++++++++++++++++--
 target/i386/cpu.h                    |  43 +++++++++++-
 target/i386/kvm/kvm-cpu.c            |  11 +--
 target/i386/kvm/kvm.c                | 125 ++++++++++++++++++++++++++++++-----
 target/i386/kvm/kvm_i386.h           |   1 +
 target/i386/machine.c                |  46 +++++++++++++
 target/i386/tcg/seg_helper.c         |  52 ++++++++++++++-
 target/i386/tcg/sysemu/excp_helper.c |  40 +----------
 target/i386/whpx/whpx-all.c          |  30 ++++++++-
 target/i386/xsave_helper.c           |  28 ++++++++
 26 files changed, 451 insertions(+), 85 deletions(-)
-- 
2.35.1


