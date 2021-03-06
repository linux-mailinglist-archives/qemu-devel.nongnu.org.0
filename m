Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9931832F97B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:56:33 +0100 (CET)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUbo-0007NN-HF
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZk-0005jI-DD
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZi-00081W-M2
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so817166wmd.5
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcbMbCWMwtpSyDqG2EhWc9p/uzgheUgFvQdRlE8SlB0=;
 b=aqfd7wdgqfIWgclNVqaOZX5kuX6LZ9m0Q8xUakZDbmDpG3T5w44pCGeHp0On+rR2bI
 yCp0lwh5U4FAg3njqMbo5FDxAnnvbn4/CyMdRSLkFXBLdU6AM54gOaloYirePe/rRcGV
 pQbAGbbSjXIDNbIwepOxhJVOZvUDmdNG4/Uk/siI1/D5kcIbY0bBtijfdcOfYDLcYBz7
 axtSMUKu9iefek5coPMQvIngjpPbuGrlP0RvWghP3gWf4RyzBnm4oOweHb8tBAqPDPX2
 cMX7BYasaQN9rsfbNgR+HvyJcKecM7I5/nRZbGw2m+B6MMeToWdK+r+W+BjNzePkvDZN
 KXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vcbMbCWMwtpSyDqG2EhWc9p/uzgheUgFvQdRlE8SlB0=;
 b=gTTqIK+ctR/97OhN++hZ7S1WNPSJa8Bz6OCo/cdCwYtWTncMg2bbRYfmxO2oAalm6w
 Z+W/C4oW4XPN6cai0zoaa5QtKjFcR2vkkVLHTZ6VF6tKMWaG1fVDSI04WOKhxhYxS9CF
 DCA3XDg5MlLvIOFgPLqxZniikb3n5QOo9DERY7ODcvwN8yke1gKm0H46f6pMumQu6byd
 XKmH6T/m1a/eaAPSAUIl+9SKbSFxi1Fe8PyjziM+wY++8FjbYmJrNDmRJ2KNSD7mHSy+
 YWsxJMH5CgpNxmHUM3DQyGVKm82zclOJwCsJ95aWEz5u/3yGvhHDOPIJqAyAK/jUqJQP
 eKqQ==
X-Gm-Message-State: AOAM53324HCGlO1fJ9NJ3pyK/0n4wayB4P5QpBCjYvpnnKBQB/onLv29
 qj+EmLE0ijJI7TGwPVTDo2TbeI2ANxs=
X-Google-Smtp-Source: ABdhPJxZP9Tt7cfD8egxmbADhlcYraie/yORcZikLfJRiIrW5DO5+CXOxSx7Azaga//coKECW5pVBw==
X-Received: by 2002:a1c:dc42:: with SMTP id t63mr13081537wmg.153.1615028060753; 
 Sat, 06 Mar 2021 02:54:20 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] Misc patches for 2021-03-06
Date: Sat,  6 Mar 2021 11:53:56 +0100
Message-Id: <20210306105419.110503-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
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

The following changes since commit e586edcb410543768ef009eaa22a2d9dd4a53846:

  virtiofs: drop remapped security.capability xattr as needed (2021-03-04 10:26:16 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to c715343fd96bcf93263fda38d81af815fdb5a7fa:

  meson: Stop if cfi is enabled with system slirp (2021-03-06 11:42:57 +0100)

----------------------------------------------------------------
* fix tracing vs -daemonize (Daniel)
* detect invalid CFI configuration (Daniele)
* 32-bit PVH fix (David)
* forward SCSI passthrough host-status to the SCSI HBA (Hannes)
* detect ill-formed id in QMP object-add (Kevin)
* miscellaneous bugfixes and cleanups (Keqian, Kostiantyn, myself, Peng Liang)
* add nodelay option for chardev (myself)
* deprecate -M kernel-irqchip=off on x86 (myself)
* keep .d files (myself)
* Fix -trace file (myself)

----------------------------------------------------------------
Daniel Henrique Barboza (1):
      vl.c: do not execute trace_init_backends() before daemonizing

Daniele Buono (1):
      meson: Stop if cfi is enabled with system slirp

David Edmondson (2):
      elf_ops: correct loading of 32 bit PVH kernel
      x86/pvh: extract only 4 bytes of start address for 32 bit kernels

Hannes Reinecke (4):
      scsi: Rename linux-specific SG_ERR codes to generic SCSI_HOST error codes
      scsi: Add mapping for generic SCSI_HOST status to sense codes
      scsi: inline sg_io_sense_from_errno() into the callers.
      scsi: move host_status handling into SCSI drivers

Keqian Zhu (2):
      accel: kvm: Fix memory waste under mismatch page size
      accel: kvm: Add aligment assert for kvm_log_clear_one_slot

Kevin Wolf (1):
      qom: Check for wellformed id in user_creatable_add_type()

Kostiantyn Kostiuk (1):
      qga-vss: Use dynamic linking for GLib

Paolo Bonzini (10):
      KVM: x86: do not fail if software breakpoint has already been removed
      KVM: x86: deprecate -M kernel-irqchip=off except for -M isapc
      chardev: add nodelay option
      qemu-config: add error propagation to qemu_config_parse
      scsi-generic: do not snoop the output of failed commands
      qemu-option: do not suggest using the delay option
      build-sys: invoke ninja with -d keepdepfile
      meson: adjust timeouts for some slower tests
      trace: fix "-trace file=..."
      trace: skip qemu_set_log_filename if no "-D" option was passed

Peng Liang (1):
      lsilogic: Use PCIDevice::exit instead of DeviceState::unrealize

 Makefile                   |  2 +-
 accel/kvm/kvm-all.c        | 13 ++++++++-
 block/blkdebug.c           |  3 +-
 chardev/char-socket.c      | 13 +++++++--
 chardev/char.c             |  3 ++
 docs/system/deprecated.rst | 13 +++++++++
 gdbstub.c                  |  2 +-
 hw/i386/x86.c              |  6 ++--
 hw/intc/apic.c             |  6 ++++
 hw/scsi/lsi53c895a.c       |  4 +--
 hw/scsi/scsi-bus.c         | 33 +++++++++++++++++++--
 hw/scsi/scsi-disk.c        | 47 ++++++++++++++++++++++++++----
 hw/scsi/scsi-generic.c     | 25 +++++++++++-----
 hw/scsi/virtio-scsi.c      | 46 +++++++++++++++++++++++++++++
 hw/scsi/vmw_pvscsi.c       | 39 +++++++++++++++++++++++++
 include/hw/elf_ops.h       |  4 +--
 include/hw/scsi/scsi.h     |  5 +++-
 include/qemu/config-file.h |  5 ++--
 include/scsi/utils.h       | 27 ++++++++++-------
 meson.build                | 12 ++++++++
 qemu-options.hx            | 14 ++++-----
 qga/vss-win32/meson.build  |  4 +--
 qom/object_interfaces.c    |  9 ++++++
 scsi/qemu-pr-helper.c      | 24 +++++++++++-----
 scsi/utils.c               | 72 ++++++++++++++++++++++++++++++++--------------
 softmmu/vl.c               | 51 ++++++++++++++++----------------
 target/i386/kvm/kvm.c      |  9 ++++--
 tests/fp/meson.build       |  2 +-
 tests/meson.build          |  8 ++++++
 tests/qtest/meson.build    | 15 ++++++++++
 trace/control.c            | 13 +++++----
 util/qemu-config.c         | 23 ++++++++-------
 util/qemu-option.c         |  6 +++-
 33 files changed, 434 insertions(+), 124 deletions(-)
-- 
2.29.2


