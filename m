Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA751519131
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:17:38 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0pt-0004sJ-LN
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzKF-0006VS-Pe
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzKD-00027W-He
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6RRqL7i84XbpzmUlWx/HNN79SJV/Wu7hItybY5jAc6Q=;
 b=Hks4rHG6Azq61N9JO9YCf2O02T2QPiudakxiL2M+wRiAR8X12lF+WZfVfBb/Xizu8MNX/G
 EHRLM7No7g0ord2Kc85hzS8wniNLFRx33foUKgHNXeJNax2m7Kma8hCfQPqk5wyDAL9TeR
 EDEH4SkJcP3CZf6VUsIJeg97Rqu2SDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-LpIoGY0mPI-JvTg3ZeKeyw-1; Tue, 03 May 2022 11:42:29 -0400
X-MC-Unique: LpIoGY0mPI-JvTg3ZeKeyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC2A140E3B8;
 Tue,  3 May 2022 13:13:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC34AC27EB1;
 Tue,  3 May 2022 13:12:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 00/23] Misc patches
Date: Tue,  3 May 2022 17:12:33 +0400
Message-Id: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65:

  Merge tag 'pull-9p-20220501' of https://github.com/cschoenebeck/qemu into staging (2022-05-01 07:48:11 -0700)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/misc-pull-request

for you to fetch changes up to ff5927baa7ffb9c97873a071f6a8d85a3584182b:

  util: rename qemu_*block() socket functions (2022-05-03 15:53:20 +0400)

----------------------------------------------------------------
Misc cleanups

----------------------------------------------------------------

Marc-André Lureau (23):
  Use QEMU_SANITIZE_THREAD
  Use QEMU_SANITIZE_ADDRESS
  tests: move libqtest.h back under qtest/
  libqtest: split QMP part in libqmp
  Use g_unix_set_fd_nonblocking()
  block: move fcntl_setfl()
  Replace qemu_pipe() with g_unix_open_pipe()
  util: replace pipe()+cloexec with g_unix_open_pipe()
  qga: replace pipe() with g_unix_open_pipe(CLOEXEC)
  tests: replace pipe() with g_unix_open_pipe(CLOEXEC)
  os-posix: replace pipe()+cloexec with g_unix_open_pipe(CLOEXEC)
  virtiofsd: replace pipe() with g_unix_open_pipe(CLOEXEC)
  io: replace pipe() with g_unix_open_pipe(CLOEXEC)
  Replace fcntl(O_NONBLOCK) with g_unix_set_fd_nonblocking()
  io: make qio_channel_command_new_pid() static
  chardev: replace qemu_set_nonblock()
  io: replace qemu_set{_non}block()
  qga: replace qemu_set_nonblock()
  hw: replace qemu_set_nonblock()
  ui: replace qemu_set_nonblock()
  net: replace qemu_set_nonblock()
  tests: replace qemu_set_nonblock()
  util: rename qemu_*block() socket functions

 docs/devel/qtest.rst                          |   2 +-
 include/io/channel-command.h                  |  25 --
 include/qemu/atomic.h                         |   8 +-
 include/qemu/osdep.h                          |   4 -
 include/qemu/sockets.h                        |   6 +-
 include/sysemu/os-posix.h                     |   2 -
 subprojects/libvhost-user/include/compiler.h  |   1 +
 tests/qtest/acpi-utils.h                      |   2 +-
 tests/qtest/boot-sector.h                     |   2 +-
 tests/qtest/fuzz/fuzz.h                       |   2 +-
 tests/qtest/libqmp.h                          |  50 ++++
 tests/qtest/libqos/fw_cfg.h                   |   2 +-
 tests/qtest/libqos/i2c.h                      |   2 +-
 tests/qtest/libqos/libqos.h                   |   2 +-
 tests/qtest/libqos/malloc.h                   |   2 +-
 tests/qtest/libqos/pci.h                      |   2 +-
 tests/qtest/libqos/sdhci-cmd.h                |   2 +-
 tests/qtest/libqtest-single.h                 |   2 +-
 tests/qtest/{libqos => }/libqtest.h           |  29 +--
 tests/qtest/migration-helpers.h               |   2 +-
 tests/qtest/tpm-emu.h                         |   2 +-
 block/file-posix.c                            |  15 ++
 chardev/char-fd.c                             |   4 +-
 chardev/char-pty.c                            |   5 +-
 chardev/char-serial.c                         |   5 +-
 chardev/char-socket.c                         |   2 +-
 chardev/char-stdio.c                          |   5 +-
 contrib/ivshmem-server/ivshmem-server.c       |   2 +-
 hw/hyperv/syndbg.c                            |   2 +-
 hw/input/virtio-input-host.c                  |   5 +-
 hw/misc/ivshmem.c                             |   2 +-
 hw/virtio/vhost-user.c                        |   2 +-
 hw/virtio/vhost-vsock.c                       |  11 +-
 io/channel-command.c                          |  46 +++-
 io/channel-file.c                             |  13 +-
 io/channel-socket.c                           |   6 +-
 net/l2tpv3.c                                  |   2 +-
 net/socket.c                                  |  10 +-
 net/tap-bsd.c                                 |   4 +-
 net/tap-linux.c                               |   2 +-
 net/tap-solaris.c                             |   2 +-
 net/tap.c                                     |  33 +--
 os-posix.c                                    |   3 +-
 qemu-nbd.c                                    |   5 +-
 qga/channel-posix.c                           |   2 +-
 qga/commands-posix.c                          |   8 +-
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
 tests/qtest/fuzz/fuzz.c                       |   2 +-
 tests/qtest/fuzz/generic_fuzz.c               |   2 +-
 tests/qtest/fuzz/i440fx_fuzz.c                |   2 +-
 tests/qtest/fuzz/qos_fuzz.c                   |   2 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c            |   2 +-
 tests/qtest/fuzz/virtio_net_fuzz.c            |   4 +-
 tests/qtest/fuzz/virtio_scsi_fuzz.c           |   2 +-
 tests/qtest/fw_cfg-test.c                     |   2 +-
 tests/qtest/hd-geo-test.c                     |   2 +-
 tests/qtest/hexloader-test.c                  |   2 +-
 tests/qtest/ide-test.c                        |   2 +-
 tests/qtest/ipoctal232-test.c                 |   2 +-
 tests/qtest/ivshmem-test.c                    |   7 +-
 tests/qtest/libqmp.c                          | 233 ++++++++++++++++++
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
 tests/qtest/libqtest.c                        | 207 +---------------
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
 tests/qtest/vhost-user-test.c                 |   4 +-
 tests/qtest/virtio-net-failover.c             |   2 +-
 tests/qtest/virtio-rng-test.c                 |   2 +-
 tests/qtest/virtio-test.c                     |   2 +-
 tests/qtest/vmgenid-test.c                    |   2 +-
 tests/qtest/vmxnet3-test.c                    |   2 +-
 tests/qtest/wdt_ib700-test.c                  |   2 +-
 tests/qtest/xlnx-can-test.c                   |   2 +-
 tests/unit/socket-helpers.c                   |   2 +-
 tests/unit/test-crypto-tlssession.c           |   8 +-
 tests/unit/test-io-channel-file.c             |   2 +-
 tests/unit/test-iov.c                         |   4 +-
 tests/unit/test-qga.c                         |   2 +-
 tools/virtiofsd/helper.c                      |   2 +-
 ui/input-linux.c                              |   5 +-
 util/compatfd.c                               |   5 +-
 util/coroutine-ucontext.c                     |   2 +-
 util/event_notifier-posix.c                   |   8 +-
 util/main-loop.c                              |   2 +-
 util/oslib-posix.c                            |  61 +----
 util/oslib-win32.c                            |   8 +-
 util/vhost-user-server.c                      |   4 +-
 scripts/oss-fuzz/output_reproducer.py         |   2 +-
 tests/qtest/libqos/meson.build                |   5 +-
 tests/unit/meson.build                        |   2 +-
 192 files changed, 609 insertions(+), 565 deletions(-)
 create mode 120000 subprojects/libvhost-user/include/compiler.h
 create mode 100644 tests/qtest/libqmp.h
 rename tests/qtest/{libqos => }/libqtest.h (95%)
 create mode 100644 tests/qtest/libqmp.c

-- 
2.36.0.44.g0f828332d5ac


