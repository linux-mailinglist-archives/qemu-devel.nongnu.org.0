Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D153250B319
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:41:37 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhorA-0000mr-UB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhomX-0004tC-B1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhomU-00061p-6Z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l6ZfZi+p/O4iOnpXyWV1NShRx02PSSejlxrnwMNsQaU=;
 b=LWDhG3ig5kJJ48T5nfRc/U5+19AmbFWwiX9wLUtz6HsQPDU/7Ya1TVoStl9PRlnm5ZSrSf
 prozoeOBwnJtXPwnAhbDmfP1xEFVL63cgoAn3Z4w0v84/LXFmItCkyOpn7zKS3Mdz8syso
 xoFrGLPqGITaCnDxHALznX6kFH6fF6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-V1MLpLmqM_qPwXyB0cQvNw-1; Fri, 22 Apr 2022 04:36:43 -0400
X-MC-Unique: V1MLpLmqM_qPwXyB0cQvNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4461485A5A8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:36:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E2F8572359;
 Fri, 22 Apr 2022 08:36:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] Misc cleanups
Date: Fri, 22 Apr 2022 12:36:29 +0400
Message-Id: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

Another batch of cleanup patches, mostly while working on moving the common code
in some future subprojects. (a few patches have been posted and reviewed
earlier)

Marc-André Lureau (10):
  Use QEMU_SANITIZE_THREAD
  Use QEMU_SANITIZE_ADDRESS
  include: move qemu_*_exec_dir() to cutils
  tests: move libqtest.h back under qtest/
  libqtest: split QMP part in libqmp
  Replace qemu_pipe() with g_unix_open_pipe()
  tests: make libqmp buildable for win32
  Use g_unix_set_fd_nonblocking()
  block: move fcntl_setfl()
  util/win32: simplify qemu_get_local_state_dir()

 docs/devel/qtest.rst                          |   2 +-
 include/qemu/atomic.h                         |   8 +-
 include/qemu/cutils.h                         |   7 +
 include/qemu/osdep.h                          |  12 -
 include/sysemu/os-posix.h                     |   2 -
 subprojects/libvhost-user/include/compiler.h  |   1 +
 tests/qtest/acpi-utils.h                      |   2 +-
 tests/qtest/boot-sector.h                     |   2 +-
 tests/qtest/fuzz/fuzz.h                       |   2 +-
 tests/qtest/libqmp.h                          |  52 ++++
 tests/qtest/libqos/fw_cfg.h                   |   2 +-
 tests/qtest/libqos/i2c.h                      |   2 +-
 tests/qtest/libqos/libqos.h                   |   2 +-
 tests/qtest/libqos/malloc.h                   |   2 +-
 tests/qtest/libqos/pci.h                      |   2 +-
 tests/qtest/libqos/sdhci-cmd.h                |   2 +-
 tests/qtest/libqtest-single.h                 |   2 +-
 tests/qtest/{libqos => }/libqtest.h           |  29 +-
 tests/qtest/migration-helpers.h               |   2 +-
 tests/qtest/tpm-emu.h                         |   2 +-
 block/file-posix.c                            |  15 +
 hw/misc/ivshmem.c                             |   2 +-
 qemu-io.c                                     |   1 +
 qemu-nbd.c                                    |   5 +-
 storage-daemon/qemu-storage-daemon.c          |   1 +
 tests/qtest/ac97-test.c                       |   2 +-
 tests/qtest/ahci-test.c                       |   2 +-
 tests/qtest/am53c974-test.c                   |   2 +-
 tests/qtest/arm-cpu-features.c                |   2 +-
 tests/qtest/aspeed_hace-test.c                |   2 +-
 tests/qtest/boot-order-test.c                 |   2 +-
 tests/qtest/boot-sector.c                     |   2 +-
 tests/qtest/boot-serial-test.c                |   2 +-
 tests/qtest/cdrom-test.c                      |   2 +-
 tests/qtest/dbus-display-test.c               |   2 +-
 tests/qtest/dbus-vmstate-test.c               |   2 +-
 tests/qtest/device-introspect-test.c          |   2 +-
 tests/qtest/device-plug-test.c                |   2 +-
 tests/qtest/drive_del-test.c                  |   2 +-
 tests/qtest/ds1338-test.c                     |   2 +-
 tests/qtest/e1000-test.c                      |   2 +-
 tests/qtest/eepro100-test.c                   |   2 +-
 tests/qtest/endianness-test.c                 |   2 +-
 tests/qtest/erst-test.c                       |   2 +-
 tests/qtest/es1370-test.c                     |   2 +-
 tests/qtest/fdc-test.c                        |   2 +-
 tests/qtest/fuzz-e1000e-test.c                |   2 +-
 tests/qtest/fuzz-lsi53c895a-test.c            |   2 +-
 tests/qtest/fuzz-megasas-test.c               |   2 +-
 tests/qtest/fuzz-sb16-test.c                  |   2 +-
 tests/qtest/fuzz-sdcard-test.c                |   2 +-
 tests/qtest/fuzz-virtio-scsi-test.c           |   2 +-
 tests/qtest/fuzz-xlnx-dp-test.c               |   2 +-
 tests/qtest/fuzz/fuzz.c                       |   3 +-
 tests/qtest/fuzz/generic_fuzz.c               |   2 +-
 tests/qtest/fuzz/i440fx_fuzz.c                |   2 +-
 tests/qtest/fuzz/qos_fuzz.c                   |   2 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c            |   2 +-
 tests/qtest/fuzz/virtio_net_fuzz.c            |   2 +-
 tests/qtest/fuzz/virtio_scsi_fuzz.c           |   2 +-
 tests/qtest/fw_cfg-test.c                     |   2 +-
 tests/qtest/hd-geo-test.c                     |   2 +-
 tests/qtest/hexloader-test.c                  |   2 +-
 tests/qtest/ide-test.c                        |   2 +-
 tests/qtest/ipoctal232-test.c                 |   2 +-
 tests/qtest/ivshmem-test.c                    |   2 +-
 tests/qtest/libqmp.c                          | 258 ++++++++++++++++++
 .../libqos/aarch64-xlnx-zcu102-machine.c      |   2 +-
 tests/qtest/libqos/ahci.c                     |   2 +-
 tests/qtest/libqos/arm-imx25-pdk-machine.c    |   2 +-
 tests/qtest/libqos/arm-n800-machine.c         |   2 +-
 tests/qtest/libqos/arm-raspi2-machine.c       |   2 +-
 tests/qtest/libqos/arm-sabrelite-machine.c    |   2 +-
 tests/qtest/libqos/arm-smdkc210-machine.c     |   2 +-
 tests/qtest/libqos/arm-virt-machine.c         |   2 +-
 .../qtest/libqos/arm-xilinx-zynq-a9-machine.c |   2 +-
 tests/qtest/libqos/e1000e.c                   |   2 +-
 tests/qtest/libqos/fw_cfg.c                   |   2 +-
 tests/qtest/libqos/i2c-imx.c                  |   2 +-
 tests/qtest/libqos/i2c-omap.c                 |   2 +-
 tests/qtest/libqos/i2c.c                      |   2 +-
 tests/qtest/libqos/libqos.c                   |   2 +-
 tests/qtest/libqos/pci-pc.c                   |   2 +-
 tests/qtest/libqos/pci-spapr.c                |   2 +-
 tests/qtest/libqos/ppc64_pseries-machine.c    |   2 +-
 tests/qtest/libqos/qgraph.c                   |   2 +-
 tests/qtest/libqos/qos_external.c             |   2 +-
 tests/qtest/libqos/rtas.c                     |   2 +-
 tests/qtest/libqos/sdhci-cmd.c                |   2 +-
 tests/qtest/libqos/sdhci.c                    |   2 +-
 tests/qtest/libqos/tpci200.c                  |   2 +-
 tests/qtest/libqos/usb.c                      |   2 +-
 tests/qtest/libqos/vhost-user-blk.c           |   2 +-
 tests/qtest/libqos/virtio-9p.c                |   2 +-
 tests/qtest/libqos/virtio-balloon.c           |   2 +-
 tests/qtest/libqos/virtio-blk.c               |   2 +-
 tests/qtest/libqos/virtio-iommu.c             |   2 +-
 tests/qtest/libqos/virtio-mmio.c              |   2 +-
 tests/qtest/libqos/virtio-net.c               |   2 +-
 tests/qtest/libqos/virtio-pci.c               |   2 +-
 tests/qtest/libqos/virtio-rng.c               |   2 +-
 tests/qtest/libqos/virtio-scsi.c              |   2 +-
 tests/qtest/libqos/virtio-serial.c            |   2 +-
 tests/qtest/libqos/virtio.c                   |   2 +-
 tests/qtest/libqos/x86_64_pc-machine.c        |   2 +-
 tests/qtest/libqtest.c                        | 207 +-------------
 tests/qtest/lpc-ich9-test.c                   |   2 +-
 tests/qtest/m48t59-test.c                     |   2 +-
 tests/qtest/machine-none-test.c               |   2 +-
 tests/qtest/megasas-test.c                    |   2 +-
 tests/qtest/microbit-test.c                   |   2 +-
 tests/qtest/migration-test.c                  |   2 +-
 tests/qtest/modules-test.c                    |   2 +-
 tests/qtest/ne2000-test.c                     |   2 +-
 tests/qtest/npcm7xx_adc-test.c                |   2 +-
 tests/qtest/npcm7xx_pwm-test.c                |   2 +-
 tests/qtest/npcm7xx_sdhci-test.c              |   2 +-
 tests/qtest/npcm7xx_smbus-test.c              |   2 +-
 tests/qtest/npcm7xx_watchdog_timer-test.c     |   2 +-
 tests/qtest/numa-test.c                       |   2 +-
 tests/qtest/nvme-test.c                       |   2 +-
 tests/qtest/pca9552-test.c                    |   2 +-
 tests/qtest/pci-test.c                        |   2 +-
 tests/qtest/pcnet-test.c                      |   2 +-
 tests/qtest/pflash-cfi02-test.c               |   2 +-
 tests/qtest/pnv-xscom-test.c                  |   2 +-
 tests/qtest/prom-env-test.c                   |   2 +-
 tests/qtest/pvpanic-pci-test.c                |   2 +-
 tests/qtest/pvpanic-test.c                    |   2 +-
 tests/qtest/pxe-test.c                        |   2 +-
 tests/qtest/q35-test.c                        |   2 +-
 tests/qtest/qmp-cmd-test.c                    |   2 +-
 tests/qtest/qmp-test.c                        |   2 +-
 tests/qtest/qom-test.c                        |   2 +-
 tests/qtest/rtas-test.c                       |   2 +-
 tests/qtest/sdhci-test.c                      |   2 +-
 tests/qtest/spapr-phb-test.c                  |   2 +-
 tests/qtest/tco-test.c                        |   2 +-
 tests/qtest/test-filter-mirror.c              |   2 +-
 tests/qtest/test-filter-redirector.c          |   2 +-
 tests/qtest/test-hmp.c                        |   2 +-
 tests/qtest/tpm-crb-swtpm-test.c              |   2 +-
 tests/qtest/tpm-tis-device-swtpm-test.c       |   2 +-
 tests/qtest/tpm-tis-swtpm-test.c              |   2 +-
 tests/qtest/tpm-util.c                        |   2 +-
 tests/qtest/tulip-test.c                      |   2 +-
 tests/qtest/virtio-net-failover.c             |   2 +-
 tests/qtest/virtio-rng-test.c                 |   2 +-
 tests/qtest/virtio-test.c                     |   2 +-
 tests/qtest/vmgenid-test.c                    |   2 +-
 tests/qtest/vmxnet3-test.c                    |   2 +-
 tests/qtest/wdt_ib700-test.c                  |   2 +-
 tests/qtest/xlnx-can-test.c                   |   2 +-
 tests/unit/test-qga.c                         |   2 +-
 util/coroutine-ucontext.c                     |   2 +-
 util/cutils.c                                 | 108 ++++++++
 util/event_notifier-posix.c                   |   8 +-
 util/main-loop.c                              |   2 +-
 util/oslib-posix.c                            | 118 --------
 util/oslib-win32.c                            |  53 +---
 scripts/oss-fuzz/output_reproducer.py         |   2 +-
 tests/qtest/libqos/meson.build                |   5 +-
 tests/unit/meson.build                        |   2 +-
 163 files changed, 611 insertions(+), 570 deletions(-)
 create mode 120000 subprojects/libvhost-user/include/compiler.h
 create mode 100644 tests/qtest/libqmp.h
 rename tests/qtest/{libqos => }/libqtest.h (95%)
 create mode 100644 tests/qtest/libqmp.c

-- 
2.36.0


