Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35287667378
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:45:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxsB-0006R6-BJ; Thu, 12 Jan 2023 08:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFxs8-0006Qj-Vu
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFxs7-0001uq-4x
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JrCIqV+iAbZqtxkDbN9QPvANoihbtZMBSSgYCgmsNrc=;
 b=AupG7VgFWbC9zgR3HuD5LEOgSoSgat6JE802QVREQqiKjVCejFk8aq67QRTCTI2QC6Dmy+
 YtXT0027wkC0jHqLaG2LRzNliqaMVW7bQB7sSBrXjzUnItKKxV1UrOXqz4gJVfsJmOinxC
 Phj5gTpe2BANVMP9daYxrAqvANfcGrE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-PCHd4CXGMBy1HPR88Nkvlg-1; Thu, 12 Jan 2023 08:43:56 -0500
X-MC-Unique: PCHd4CXGMBy1HPR88Nkvlg-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa18-20020a170907869200b007df87611618so12585025ejc.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JrCIqV+iAbZqtxkDbN9QPvANoihbtZMBSSgYCgmsNrc=;
 b=3L+Hvouf+llSFyHh8itgioCZT7n7PLg8vRMFY1CQCkSXwpkClZ+eZptV+kkkyF/jbA
 W6OIaylhYG6WgeSJnmFhzEGaRjvzCaR28JdZ47NN5+37QJY5+7FeUAGIWMCIhXNOs2S/
 MGtzrarFPZ+vB/EOGML2uzkU0IpagIFfFETOAGCbHdLL1Ud0rt13ICWuFKEuOCYdU5MI
 gPcZFsnAgDjTW77L8LNy4xOBrnhDwWx42c+inV5whvq80qs3N0im5q61c+JFrlcemfoU
 +grlVfWfacITASqRaG6WmlNGVKMnEMpTM2zaLT8xnmwVVAzxiF4ZS1InbV7u1qvx6UAa
 2Adw==
X-Gm-Message-State: AFqh2kp3l59vYre5UvwzPQYKMR+7WinhmyyaCRc3ndPpWzrHlSDyyqLe
 gEInf/uBtr8Ov/tbZnqvj8flsMfAWlfCYFLsliUaxuK6drjSvjTK5OZvYaRXN/ZYPmyc9zY9IDN
 gNj5WPmBsXjTmBVNS/HpvHBQlbMHNh2sNBsuo4QCeB3uV5dMuCkujEBCjvZsVV1u2zn0=
X-Received: by 2002:a17:907:3888:b0:83f:757e:f182 with SMTP id
 sq8-20020a170907388800b0083f757ef182mr62798482ejc.65.1673531034757; 
 Thu, 12 Jan 2023 05:43:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtognu/Wddweb6Hh1vNXL2HRdnYuoafLMxp3mOB+Vy/yXnn7jmSLppy9C9D2K5m54IKDZMyyQ==
X-Received: by 2002:a17:907:3888:b0:83f:757e:f182 with SMTP id
 sq8-20020a170907388800b0083f757ef182mr62798455ejc.65.1673531034211; 
 Thu, 12 Jan 2023 05:43:54 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170906314f00b007bd1ef2cccasm7343912eje.48.2023.01.12.05.43.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 05:43:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/29] Misc patches for 2023-01-10
Date: Thu, 12 Jan 2023 14:43:48 +0100
Message-Id: <20230112134350.469317-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit aa96ab7c9df59c615ca82b49c9062819e0a1c287:

  Merge tag 'pull-request-2023-01-09' of https://gitlab.com/thuth/qemu into staging (2023-01-09 15:54:31 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 75cc286485742feeb00f4b446f5682765792323e:

  configure: remove backwards-compatibility code (2023-01-11 10:44:35 +0100)

----------------------------------------------------------------
* Atomic memslot updates for KVM (Emanuele, David)
* libvhost-user/libvduse warnings fixes (Marcel)
* i386 TCG fixes (Joe, myself)
* Remove compilation errors when -Werror=maybe-uninitialized (Eric)
* fix GLIB_VERSION for cross-compilation (Paolo)

----------------------------------------------------------------
patch 6: replace with newer version
patch 14: disable warning in testfloat submodule

Daniel P. Berrangé (8):
      gitlab: remove redundant setting of PKG_CONFIG_PATH
      disas: add G_GNUC_PRINTF to gstring_printf
      hw/xen: use G_GNUC_PRINTF/SCANF for various functions
      tools/virtiofsd: add G_GNUC_PRINTF for logging functions
      util/error: add G_GNUC_PRINTF for various functions
      tests: add G_GNUC_PRINTF for various functions
      enforce use of G_GNUC_PRINTF attributes
      hw/display: avoid creating empty loadable modules

David Hildenbrand (1):
      kvm: Atomic memslot updates

Emanuele Giuseppe Esposito (2):
      accel: introduce accelerator blocker API
      KVM: keep track of running ioctls

Eric Auger (1):
      target/i386: Remove compilation errors when -Werror=maybe-uninitialized

Joe Richey (1):
      i386: Emit correct error code for 64-bit IDT entry

Marcel Holtmann (12):
      libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
      libvhost-user: Replace typeof with __typeof__
      libvhost-user: Cast rc variable to avoid compiler warning
      libvhost-user: Use unsigned int i for some for-loop iterations
      libvhost-user: Declare uffdio_register early to make it C90 compliant
      libvhost-user: Change dev->postcopy_ufd assignment to make it C90 compliant
      libvduse: Provide _GNU_SOURCE when compiling outside of QEMU
      libvduse: Switch to unsigned int for inuse field in struct VduseVirtq
      libvduse: Fix assignment in vring_set_avail_event
      libvhost-user: Fix assignment in vring_set_avail_event
      libvhost-user: Add extra compiler warnings
      libvduse: Add extra compiler warnings

Paolo Bonzini (4):
      configure: fix GLIB_VERSION for cross-compilation
      chardev: clean up chardev-parallel.c
      target/i386: fix operand size of unary SSE operations
      configure: remove backwards-compatibility code

 .gitlab-ci.d/crossbuild-template.yml      |   9 +-
 accel/accel-blocker.c                     | 154 ++++++++++++++++++++++++++++++
 accel/kvm/kvm-all.c                       | 108 ++++++++++++++++++---
 accel/meson.build                         |   2 +-
 chardev/char-parallel.c                   |  15 +--
 chardev/meson.build                       |   5 +-
 configure                                 |  13 +--
 disas.c                                   |   3 +-
 hw/core/cpu-common.c                      |   2 +
 hw/display/meson.build                    |  20 ++--
 hw/xen/xen-bus.c                          |   1 +
 hw/xen/xen_pvdev.c                        |   1 +
 include/hw/core/cpu.h                     |   3 +
 include/hw/xen/xen-bus-helper.h           |   6 +-
 include/hw/xen/xen-bus.h                  |   3 +-
 include/qemu/osdep.h                      |   5 -
 include/sysemu/accel-blocker.h            |  56 +++++++++++
 include/sysemu/kvm_int.h                  |   8 ++
 subprojects/libvduse/libvduse.c           |   9 +-
 subprojects/libvduse/meson.build          |   8 +-
 subprojects/libvhost-user/libvhost-user.c |  36 ++++---
 subprojects/libvhost-user/meson.build     |   8 +-
 target/i386/ops_sse.h                     |   4 +
 target/i386/tcg/decode-new.c.inc          |  11 ++-
 target/i386/tcg/seg_helper.c              |   8 +-
 tests/fp/meson.build                      |   1 +
 tests/qtest/ahci-test.c                   |   3 +
 tests/qtest/arm-cpu-features.c            |   1 +
 tests/qtest/erst-test.c                   |   2 +-
 tests/qtest/ide-test.c                    |   3 +-
 tests/qtest/ivshmem-test.c                |   4 +-
 tests/qtest/libqmp.c                      |   2 +-
 tests/qtest/libqos/libqos-pc.h            |   6 +-
 tests/qtest/libqos/libqos-spapr.h         |   6 +-
 tests/qtest/libqos/libqos.h               |   6 +-
 tests/qtest/libqos/virtio-9p.c            |   1 +
 tests/qtest/migration-helpers.h           |   1 +
 tests/qtest/rtas-test.c                   |   2 +-
 tests/qtest/usb-hcd-uhci-test.c           |   4 +-
 tests/unit/test-qmp-cmds.c                |  13 ++-
 tools/virtiofsd/fuse_log.c                |   1 +
 tools/virtiofsd/fuse_log.h                |   6 +-
 tools/virtiofsd/passthrough_ll.c          |   1 +
 util/error-report.c                       |   1 +
 util/error.c                              |   1 +
 util/meson.build                          |   2 +-
 46 files changed, 456 insertions(+), 109 deletions(-)
 create mode 100644 accel/accel-blocker.c
 create mode 100644 include/sysemu/accel-blocker.h
-- 
2.38.1


