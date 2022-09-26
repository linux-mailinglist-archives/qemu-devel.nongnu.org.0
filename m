Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFD5EAF50
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:12:17 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsaW-0002rl-7s
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrac-0005eb-9l
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocraY-0005Kj-Pg
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ry1u1911He4f+X3SfOsROVsnGTyqdANCMkZdUQI6R+c=;
 b=L8sW6X9haARyTVmNKmcHNwBGIFhRqHvlmEtOeg3C6vEvOe46upKBDHq869FzDWQN0jPrkH
 4E9GmEi3luhCeUNl4FdKZcWuA0mbG510c/mDqPpvShz5ixxFst0B9TMHLwy7maZrfz4Urf
 sDPIcUSCJT0byeDj2VvQ8zcKZxRc/zc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-zuy6YTenM-u3vsj4-DllMA-1; Mon, 26 Sep 2022 13:08:09 -0400
X-MC-Unique: zuy6YTenM-u3vsj4-DllMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2036A85A59D;
 Mon, 26 Sep 2022 17:08:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0527D140EBF4;
 Mon, 26 Sep 2022 17:08:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PULL 00/14] s390x patches and slirp submodule removal
Date: Mon, 26 Sep 2022 19:07:50 +0200
Message-Id: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

 Hi Stefan!

The following changes since commit 6160d8ff81fb9fba70f5dad88d43ffd0fa44984c:

  Merge tag 'edgar/xilinx-next-2022-09-21.for-upstream' of https://github.com/edgarigl/qemu into staging (2022-09-22 13:24:28 -0400)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-09-26

for you to fetch changes up to 5890258aeeba303704ec1adca415e46067800777:

  Remove the slirp submodule (i.e. compile only with an external libslirp) (2022-09-26 17:23:47 +0200)

----------------------------------------------------------------
* Fix emulation of the LZRF instruction
* Fix "noexec" TCG test on s390x
* Implement SHA-512 and random number generator instructions
* Support for zPCI interpretation on s390x hosts
* Removal of the "slirp" submodule

----------------------------------------------------------------
Chenyi Qiang (2):
      configure: Add -Wno-gnu-variable-sized-type-not-at-end
      Update linux headers to v6.0-rc4

Christian Borntraeger (1):
      s390x/tcg: Fix opcode for lzrf

Ilya Leoshkevich (1):
      linux-user/host/s390: Add vector instructions to host_signal_write()

Jason A. Donenfeld (2):
      target/s390x: support SHA-512 extensions
      target/s390x: support PRNO_TRNG instruction

Matthew Rosato (7):
      s390x/pci: add routine to get host function handle from CLP info
      s390x/pci: enable for load/store interpretation
      s390x/pci: don't fence interpreted devices without MSI-X
      s390x/pci: enable adapter event notification for interpreted devices
      s390x/pci: let intercept devices have separate PCI groups
      s390x/pci: reflect proper maxstbl for groups of interpreted devices
      s390x/s390-virtio-ccw: add zpcii-disable machine property

Thomas Huth (1):
      Remove the slirp submodule (i.e. compile only with an external libslirp)

 configure                                      |  25 +--
 meson.build                                    | 121 +++---------
 include/hw/s390x/s390-pci-bus.h                |   8 +-
 include/hw/s390x/s390-pci-kvm.h                |  38 ++++
 include/hw/s390x/s390-pci-vfio.h               |   5 +
 include/hw/s390x/s390-virtio-ccw.h             |   1 +
 include/standard-headers/asm-x86/bootparam.h   |   7 +-
 include/standard-headers/drm/drm_fourcc.h      |  73 ++++++-
 include/standard-headers/linux/ethtool.h       |  29 +--
 include/standard-headers/linux/input.h         |  12 +-
 include/standard-headers/linux/pci_regs.h      |  30 ++-
 include/standard-headers/linux/vhost_types.h   |  17 +-
 include/standard-headers/linux/virtio_9p.h     |   2 +-
 include/standard-headers/linux/virtio_config.h |   7 +-
 include/standard-headers/linux/virtio_ids.h    |  14 +-
 include/standard-headers/linux/virtio_net.h    |  34 +++-
 include/standard-headers/linux/virtio_pci.h    |   2 +
 include/standard-headers/linux/virtio_ring.h   |  16 +-
 linux-headers/asm-arm64/kvm.h                  |  33 +++-
 linux-headers/asm-generic/unistd.h             |   4 +-
 linux-headers/asm-riscv/kvm.h                  |  22 +++
 linux-headers/asm-riscv/unistd.h               |   3 +-
 linux-headers/asm-s390/kvm.h                   |   1 +
 linux-headers/asm-x86/kvm.h                    |  33 ++--
 linux-headers/asm-x86/mman.h                   |  14 --
 linux-headers/linux/kvm.h                      | 172 +++++++++++++++-
 linux-headers/linux/userfaultfd.h              |  10 +-
 linux-headers/linux/vduse.h                    |  47 +++++
 linux-headers/linux/vfio.h                     |   4 +-
 linux-headers/linux/vfio_zdev.h                |   7 +
 linux-headers/linux/vhost.h                    |  35 +++-
 linux-user/include/host/s390/host-signal.h     |  25 +++
 target/s390x/kvm/kvm_s390x.h                   |   1 +
 hw/s390x/s390-pci-bus.c                        | 111 ++++++++++-
 hw/s390x/s390-pci-inst.c                       |  56 +++++-
 hw/s390x/s390-pci-kvm.c                        |  54 ++++++
 hw/s390x/s390-pci-vfio.c                       | 129 ++++++++++--
 hw/s390x/s390-virtio-ccw.c                     |  27 +++
 target/s390x/gen-features.c                    |  10 +-
 target/s390x/kvm/kvm.c                         |   7 +
 target/s390x/tcg/crypto_helper.c               | 259 +++++++++++++++++++++++++
 util/qemu-config.c                             |   4 +
 .gitlab-ci.d/buildtest.yml                     |  20 +-
 .gitmodules                                    |   3 -
 MAINTAINERS                                    |   1 -
 hw/s390x/meson.build                           |   1 +
 meson_options.txt                              |   5 +-
 qemu-options.hx                                |   8 +-
 scripts/archive-source.sh                      |   2 +-
 scripts/meson-buildoptions.sh                  |   4 +-
 slirp                                          |   1 -
 target/s390x/tcg/insn-data.def                 |   2 +-
 tests/avocado/machine_s390_ccw_virtio.py       |   1 +
 53 files changed, 1287 insertions(+), 270 deletions(-)
 create mode 100644 include/hw/s390x/s390-pci-kvm.h
 create mode 100644 hw/s390x/s390-pci-kvm.c
 delete mode 160000 slirp


