Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A673516B72
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 09:52:57 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlQrU-0008Hr-9J
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 03:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nlQkb-00043J-1o
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:45:50 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:46844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nlQkX-0007N3-8H
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:45:43 -0400
Received: by mail-lj1-x22d.google.com with SMTP id 16so17413427lju.13
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Fv60CXptn79nwi6AACw6KKsZ4Oh7MRuTFZ0tLStiDik=;
 b=Hd1ckI4feNX12TBg9qKxwoGEP5Hy18VhI2eK4fSUdxnMagWBJbUg+94WBQz89vJf9h
 VRbUZE0hNrgcJ8UWdZVYSXxoUYDgNpRitBV03A7j0963b3A6jCNz/xplcyeHP469aSrK
 tIhJtTDZ7Z0MWPNpYLwT986H8xRabzF8O3kAAyixciKsvAGbukI/VapgF/eFr58Lujd9
 iizPRxEhC2t2VXy+1xXZGgho/bMJcC7atTiDFMhqtpzGuSUqBuNQdJAOjHG9Da5Piz3h
 +Z0OzAfIgcBKmAK1CstRN2ZqYeP7DaawN4BR0IsswaDV2jeO/ea8KEO3vhygnZnhEfM6
 xcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Fv60CXptn79nwi6AACw6KKsZ4Oh7MRuTFZ0tLStiDik=;
 b=c9kr/24fwgCxzv4phvkKei5xZ7JcnAkFFIoIlv5A7IjsqXrumoKeUArV1wfa9jplq4
 5ALcXbvlBms/tAKMVGGRKvp189hB6WtJb6RqDxsbhTCDfZoItgYW2MBLbsZJIdssxt0y
 DbxTF1AYvNAZ/atYHWHlwHeuxSzBk0lC1yxJ4SbutvCTReWcAuUgJ4UfoeejAeKRH+uG
 aNH7zYgKRtMpIz5ZMXDzEGp8LHEVjxQDRhJJOwbwkGs+r4lzR6T1FN3vfxEd1Ne3kNEu
 MzUNMB9rykS/zs6iAneS7qmKvzehrMRU5fdH+hMXtGsMMGa4MGsoLQUY1ZvAQmE2tJFD
 6LTw==
X-Gm-Message-State: AOAM53249ViQGWWiuMYvRUGQOHE5yXJSoq9St+czLH40uda0Hvn3ME/j
 aPhmSKCdRS16Q/NzRQlZIsLm1hOhpHtSjGU2LAEpztbf
X-Google-Smtp-Source: ABdhPJyE4yQU9xZVDb4BNCpwoahjlKa8SNUdYUQsclIWuYpuhfgylqTOB0gA6Y2PFVbI3rEe7dUqbsyVKtIraym5uzs=
X-Received: by 2002:a2e:9941:0:b0:247:dce8:b0ec with SMTP id
 r1-20020a2e9941000000b00247dce8b0ecmr7112695ljj.404.1651477537485; Mon, 02
 May 2022 00:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 May 2022 11:45:25 +0400
Message-ID: <CAJ+F1C+M_x343u_sAADzwkvcUQJD4nosc0vaDTknRwbXx_kzow@mail.gmail.com>
Subject: Re: [PATCH v2 00/26] Misc cleanups
To: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f9f60205de02938d"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000f9f60205de02938d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel

On Tue, Apr 26, 2022 at 1:27 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> v2:
> - add patches to replace pipe() with g_unix_open_pipe()
>

Since you suggested this change, could you review the "replace pipe()"
patches?
thanks!


> - add patch "Replace fcntl(0_NONBLOCK) with g_unix_set_fd_nonblocking()"
> - add patches to cleanup qemu_*block() usage (see "util: rename
> qemu_*block()
>   socket functions" commit message)
> - fix lost braces during code move
> - replace TRUE/FALSE with true/false
> - add reviewed/ack-by tags
>
> Marc-Andr=C3=A9 Lureau (26):
>   Use QEMU_SANITIZE_THREAD
>   Use QEMU_SANITIZE_ADDRESS
>   include: move qemu_*_exec_dir() to cutils
>   util/win32: simplify qemu_get_local_state_dir()
>   tests: move libqtest.h back under qtest/
>   libqtest: split QMP part in libqmp
>   tests: make libqmp buildable for win32
>   Use g_unix_set_fd_nonblocking()
>   block: move fcntl_setfl()
>   Replace qemu_pipe() with g_unix_open_pipe()
>   util: replace pipe()+cloexec with g_unix_open_pipe()
>   qga: replace pipe() with g_unix_open_pipe(CLOEXEC)
>   tests: replace pipe() with g_unix_open_pipe(CLOEXEC)
>   os-posix: replace pipe()+cloexec with g_unix_open_pipe(CLOEXEC)
>   virtiofsd: replace pipe() with g_unix_open_pipe(CLOEXEC)
>   io: replace pipe() with g_unix_open_pipe(CLOEXEC)
>   Replace fcntl(0_NONBLOCK) with g_unix_set_fd_nonblocking()
>   io: make qio_channel_command_new_pid() static
>   chardev: replace qemu_set_nonblock()
>   io: replace qemu_set{_non}block()
>   qga: replace qemu_set_nonblock()
>   hw: replace qemu_set_nonblock()
>   ui: replace qemu_set_nonblock()
>   net: replace qemu_set_nonblock()
>   tests: replace qemu_set_nonblock()
>   util: rename qemu_*block() socket functions
>
>  docs/devel/qtest.rst                          |   2 +-
>  include/io/channel-command.h                  |  25 --
>  include/qemu/atomic.h                         |   8 +-
>  include/qemu/cutils.h                         |   7 +
>  include/qemu/osdep.h                          |  12 -
>  include/qemu/sockets.h                        |   6 +-
>  include/sysemu/os-posix.h                     |   2 -
>  subprojects/libvhost-user/include/compiler.h  |   1 +
>  tests/qtest/acpi-utils.h                      |   2 +-
>  tests/qtest/boot-sector.h                     |   2 +-
>  tests/qtest/fuzz/fuzz.h                       |   2 +-
>  tests/qtest/libqmp.h                          |  52 ++++
>  tests/qtest/libqos/fw_cfg.h                   |   2 +-
>  tests/qtest/libqos/i2c.h                      |   2 +-
>  tests/qtest/libqos/libqos.h                   |   2 +-
>  tests/qtest/libqos/malloc.h                   |   2 +-
>  tests/qtest/libqos/pci.h                      |   2 +-
>  tests/qtest/libqos/sdhci-cmd.h                |   2 +-
>  tests/qtest/libqtest-single.h                 |   2 +-
>  tests/qtest/{libqos =3D> }/libqtest.h           |  29 +-
>  tests/qtest/migration-helpers.h               |   2 +-
>  tests/qtest/tpm-emu.h                         |   2 +-
>  block/file-posix.c                            |  15 +
>  chardev/char-fd.c                             |   4 +-
>  chardev/char-pty.c                            |   5 +-
>  chardev/char-serial.c                         |   5 +-
>  chardev/char-socket.c                         |   2 +-
>  chardev/char-stdio.c                          |   5 +-
>  contrib/ivshmem-server/ivshmem-server.c       |   2 +-
>  hw/hyperv/syndbg.c                            |   2 +-
>  hw/input/virtio-input-host.c                  |   5 +-
>  hw/misc/ivshmem.c                             |   2 +-
>  hw/virtio/vhost-user.c                        |   2 +-
>  hw/virtio/vhost-vsock.c                       |  11 +-
>  io/channel-command.c                          |  46 +++-
>  io/channel-file.c                             |  13 +-
>  io/channel-socket.c                           |   6 +-
>  net/l2tpv3.c                                  |   2 +-
>  net/socket.c                                  |  10 +-
>  net/tap-bsd.c                                 |   4 +-
>  net/tap-linux.c                               |   2 +-
>  net/tap-solaris.c                             |   2 +-
>  net/tap.c                                     |  33 ++-
>  os-posix.c                                    |   3 +-
>  qemu-io.c                                     |   1 +
>  qemu-nbd.c                                    |   5 +-
>  qga/channel-posix.c                           |   2 +-
>  qga/commands-posix.c                          |   8 +-
>  storage-daemon/qemu-storage-daemon.c          |   1 +
>  tests/qtest/ac97-test.c                       |   2 +-
>  tests/qtest/ahci-test.c                       |   2 +-
>  tests/qtest/am53c974-test.c                   |   2 +-
>  tests/qtest/arm-cpu-features.c                |   2 +-
>  tests/qtest/aspeed_hace-test.c                |   2 +-
>  tests/qtest/boot-order-test.c                 |   2 +-
>  tests/qtest/boot-sector.c                     |   2 +-
>  tests/qtest/boot-serial-test.c                |   2 +-
>  tests/qtest/cdrom-test.c                      |   2 +-
>  tests/qtest/dbus-display-test.c               |   2 +-
>  tests/qtest/dbus-vmstate-test.c               |   2 +-
>  tests/qtest/device-introspect-test.c          |   2 +-
>  tests/qtest/device-plug-test.c                |   2 +-
>  tests/qtest/drive_del-test.c                  |   2 +-
>  tests/qtest/ds1338-test.c                     |   2 +-
>  tests/qtest/e1000-test.c                      |   2 +-
>  tests/qtest/eepro100-test.c                   |   2 +-
>  tests/qtest/endianness-test.c                 |   2 +-
>  tests/qtest/erst-test.c                       |   2 +-
>  tests/qtest/es1370-test.c                     |   2 +-
>  tests/qtest/fdc-test.c                        |   2 +-
>  tests/qtest/fuzz-e1000e-test.c                |   2 +-
>  tests/qtest/fuzz-lsi53c895a-test.c            |   2 +-
>  tests/qtest/fuzz-megasas-test.c               |   2 +-
>  tests/qtest/fuzz-sb16-test.c                  |   2 +-
>  tests/qtest/fuzz-sdcard-test.c                |   2 +-
>  tests/qtest/fuzz-virtio-scsi-test.c           |   2 +-
>  tests/qtest/fuzz-xlnx-dp-test.c               |   2 +-
>  tests/qtest/fuzz/fuzz.c                       |   3 +-
>  tests/qtest/fuzz/generic_fuzz.c               |   2 +-
>  tests/qtest/fuzz/i440fx_fuzz.c                |   2 +-
>  tests/qtest/fuzz/qos_fuzz.c                   |   2 +-
>  tests/qtest/fuzz/virtio_blk_fuzz.c            |   2 +-
>  tests/qtest/fuzz/virtio_net_fuzz.c            |   4 +-
>  tests/qtest/fuzz/virtio_scsi_fuzz.c           |   2 +-
>  tests/qtest/fw_cfg-test.c                     |   2 +-
>  tests/qtest/hd-geo-test.c                     |   2 +-
>  tests/qtest/hexloader-test.c                  |   2 +-
>  tests/qtest/ide-test.c                        |   2 +-
>  tests/qtest/ipoctal232-test.c                 |   2 +-
>  tests/qtest/ivshmem-test.c                    |   7 +-
>  tests/qtest/libqmp.c                          | 258 ++++++++++++++++++
>  .../libqos/aarch64-xlnx-zcu102-machine.c      |   2 +-
>  tests/qtest/libqos/ahci.c                     |   2 +-
>  tests/qtest/libqos/arm-imx25-pdk-machine.c    |   2 +-
>  tests/qtest/libqos/arm-n800-machine.c         |   2 +-
>  tests/qtest/libqos/arm-raspi2-machine.c       |   2 +-
>  tests/qtest/libqos/arm-sabrelite-machine.c    |   2 +-
>  tests/qtest/libqos/arm-smdkc210-machine.c     |   2 +-
>  tests/qtest/libqos/arm-virt-machine.c         |   2 +-
>  .../qtest/libqos/arm-xilinx-zynq-a9-machine.c |   2 +-
>  tests/qtest/libqos/e1000e.c                   |   2 +-
>  tests/qtest/libqos/fw_cfg.c                   |   2 +-
>  tests/qtest/libqos/i2c-imx.c                  |   2 +-
>  tests/qtest/libqos/i2c-omap.c                 |   2 +-
>  tests/qtest/libqos/i2c.c                      |   2 +-
>  tests/qtest/libqos/libqos.c                   |   2 +-
>  tests/qtest/libqos/pci-pc.c                   |   2 +-
>  tests/qtest/libqos/pci-spapr.c                |   2 +-
>  tests/qtest/libqos/ppc64_pseries-machine.c    |   2 +-
>  tests/qtest/libqos/qgraph.c                   |   2 +-
>  tests/qtest/libqos/qos_external.c             |   2 +-
>  tests/qtest/libqos/rtas.c                     |   2 +-
>  tests/qtest/libqos/sdhci-cmd.c                |   2 +-
>  tests/qtest/libqos/sdhci.c                    |   2 +-
>  tests/qtest/libqos/tpci200.c                  |   2 +-
>  tests/qtest/libqos/usb.c                      |   2 +-
>  tests/qtest/libqos/vhost-user-blk.c           |   2 +-
>  tests/qtest/libqos/virtio-9p.c                |   2 +-
>  tests/qtest/libqos/virtio-balloon.c           |   2 +-
>  tests/qtest/libqos/virtio-blk.c               |   2 +-
>  tests/qtest/libqos/virtio-iommu.c             |   2 +-
>  tests/qtest/libqos/virtio-mmio.c              |   2 +-
>  tests/qtest/libqos/virtio-net.c               |   2 +-
>  tests/qtest/libqos/virtio-pci.c               |   2 +-
>  tests/qtest/libqos/virtio-rng.c               |   2 +-
>  tests/qtest/libqos/virtio-scsi.c              |   2 +-
>  tests/qtest/libqos/virtio-serial.c            |   2 +-
>  tests/qtest/libqos/virtio.c                   |   2 +-
>  tests/qtest/libqos/x86_64_pc-machine.c        |   2 +-
>  tests/qtest/libqtest.c                        | 207 +-------------
>  tests/qtest/lpc-ich9-test.c                   |   2 +-
>  tests/qtest/m48t59-test.c                     |   2 +-
>  tests/qtest/machine-none-test.c               |   2 +-
>  tests/qtest/megasas-test.c                    |   2 +-
>  tests/qtest/microbit-test.c                   |   2 +-
>  tests/qtest/migration-test.c                  |   2 +-
>  tests/qtest/modules-test.c                    |   2 +-
>  tests/qtest/ne2000-test.c                     |   2 +-
>  tests/qtest/npcm7xx_adc-test.c                |   2 +-
>  tests/qtest/npcm7xx_pwm-test.c                |   2 +-
>  tests/qtest/npcm7xx_sdhci-test.c              |   2 +-
>  tests/qtest/npcm7xx_smbus-test.c              |   2 +-
>  tests/qtest/npcm7xx_watchdog_timer-test.c     |   2 +-
>  tests/qtest/numa-test.c                       |   2 +-
>  tests/qtest/nvme-test.c                       |   2 +-
>  tests/qtest/pca9552-test.c                    |   2 +-
>  tests/qtest/pci-test.c                        |   2 +-
>  tests/qtest/pcnet-test.c                      |   2 +-
>  tests/qtest/pflash-cfi02-test.c               |   2 +-
>  tests/qtest/pnv-xscom-test.c                  |   2 +-
>  tests/qtest/prom-env-test.c                   |   2 +-
>  tests/qtest/pvpanic-pci-test.c                |   2 +-
>  tests/qtest/pvpanic-test.c                    |   2 +-
>  tests/qtest/pxe-test.c                        |   2 +-
>  tests/qtest/q35-test.c                        |   2 +-
>  tests/qtest/qmp-cmd-test.c                    |   2 +-
>  tests/qtest/qmp-test.c                        |   2 +-
>  tests/qtest/qom-test.c                        |   2 +-
>  tests/qtest/rtas-test.c                       |   2 +-
>  tests/qtest/sdhci-test.c                      |   2 +-
>  tests/qtest/spapr-phb-test.c                  |   2 +-
>  tests/qtest/tco-test.c                        |   2 +-
>  tests/qtest/test-filter-mirror.c              |   2 +-
>  tests/qtest/test-filter-redirector.c          |   2 +-
>  tests/qtest/test-hmp.c                        |   2 +-
>  tests/qtest/tpm-crb-swtpm-test.c              |   2 +-
>  tests/qtest/tpm-tis-device-swtpm-test.c       |   2 +-
>  tests/qtest/tpm-tis-swtpm-test.c              |   2 +-
>  tests/qtest/tpm-util.c                        |   2 +-
>  tests/qtest/tulip-test.c                      |   2 +-
>  tests/qtest/vhost-user-test.c                 |   4 +-
>  tests/qtest/virtio-net-failover.c             |   2 +-
>  tests/qtest/virtio-rng-test.c                 |   2 +-
>  tests/qtest/virtio-test.c                     |   2 +-
>  tests/qtest/vmgenid-test.c                    |   2 +-
>  tests/qtest/vmxnet3-test.c                    |   2 +-
>  tests/qtest/wdt_ib700-test.c                  |   2 +-
>  tests/qtest/xlnx-can-test.c                   |   2 +-
>  tests/unit/socket-helpers.c                   |   2 +-
>  tests/unit/test-crypto-tlssession.c           |   8 +-
>  tests/unit/test-io-channel-file.c             |   2 +-
>  tests/unit/test-iov.c                         |   4 +-
>  tests/unit/test-qga.c                         |   2 +-
>  tools/virtiofsd/helper.c                      |   2 +-
>  ui/input-linux.c                              |   5 +-
>  util/compatfd.c                               |   5 +-
>  util/coroutine-ucontext.c                     |   2 +-
>  util/cutils.c                                 | 108 ++++++++
>  util/event_notifier-posix.c                   |   8 +-
>  util/main-loop.c                              |   2 +-
>  util/oslib-posix.c                            | 142 +---------
>  util/oslib-win32.c                            |  61 +----
>  util/vhost-user-server.c                      |   4 +-
>  scripts/oss-fuzz/output_reproducer.py         |   2 +-
>  tests/qtest/libqos/meson.build                |   5 +-
>  tests/unit/meson.build                        |   2 +-
>  196 files changed, 758 insertions(+), 703 deletions(-)
>  create mode 120000 subprojects/libvhost-user/include/compiler.h
>  create mode 100644 tests/qtest/libqmp.h
>  rename tests/qtest/{libqos =3D> }/libqtest.h (95%)
>  create mode 100644 tests/qtest/libqmp.c
>
> --
> 2.36.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f9f60205de02938d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgRGFuaWVsPGJyPjwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9u
IFR1ZSwgQXByIDI2LCAyMDIyIGF0IDE6MjcgUE0gJmx0OzxhIGhyZWY9Im1haWx0bzptYXJjYW5k
cmUubHVyZWF1QHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJjYW5kcmUubHVyZWF1QHJl
ZGhhdC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkZyb206IE1hcmMtQW5kcsOp
IEx1cmVhdSAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPm1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0K
PGJyPg0KSGksPGJyPg0KPGJyPg0KdjI6PGJyPg0KLSBhZGQgcGF0Y2hlcyB0byByZXBsYWNlIHBp
cGUoKSB3aXRoIGdfdW5peF9vcGVuX3BpcGUoKTxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9k
aXY+PGRpdj5TaW5jZSB5b3Ugc3VnZ2VzdGVkIHRoaXMgY2hhbmdlLCBjb3VsZCB5b3UgcmV2aWV3
IHRoZSAmcXVvdDtyZXBsYWNlIHBpcGUoKSZxdW90OyBwYXRjaGVzPzwvZGl2PjxkaXY+dGhhbmtz
ITxicj48L2Rpdj48ZGl2PsKgPGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCi0gYWRkIHBhdGNoICZxdW90O1Jl
cGxhY2UgZmNudGwoMF9OT05CTE9DSykgd2l0aCBnX3VuaXhfc2V0X2ZkX25vbmJsb2NraW5nKCkm
cXVvdDs8YnI+DQotIGFkZCBwYXRjaGVzIHRvIGNsZWFudXAgcWVtdV8qYmxvY2soKSB1c2FnZSAo
c2VlICZxdW90O3V0aWw6IHJlbmFtZSBxZW11XypibG9jaygpPGJyPg0KwqAgc29ja2V0IGZ1bmN0
aW9ucyZxdW90OyBjb21taXQgbWVzc2FnZSk8YnI+DQotIGZpeCBsb3N0IGJyYWNlcyBkdXJpbmcg
Y29kZSBtb3ZlPGJyPg0KLSByZXBsYWNlIFRSVUUvRkFMU0Ugd2l0aCB0cnVlL2ZhbHNlPGJyPg0K
LSBhZGQgcmV2aWV3ZWQvYWNrLWJ5IHRhZ3M8YnI+DQo8YnI+DQpNYXJjLUFuZHLDqSBMdXJlYXUg
KDI2KTo8YnI+DQrCoCBVc2UgUUVNVV9TQU5JVElaRV9USFJFQUQ8YnI+DQrCoCBVc2UgUUVNVV9T
QU5JVElaRV9BRERSRVNTPGJyPg0KwqAgaW5jbHVkZTogbW92ZSBxZW11XypfZXhlY19kaXIoKSB0
byBjdXRpbHM8YnI+DQrCoCB1dGlsL3dpbjMyOiBzaW1wbGlmeSBxZW11X2dldF9sb2NhbF9zdGF0
ZV9kaXIoKTxicj4NCsKgIHRlc3RzOiBtb3ZlIGxpYnF0ZXN0LmggYmFjayB1bmRlciBxdGVzdC88
YnI+DQrCoCBsaWJxdGVzdDogc3BsaXQgUU1QIHBhcnQgaW4gbGlicW1wPGJyPg0KwqAgdGVzdHM6
IG1ha2UgbGlicW1wIGJ1aWxkYWJsZSBmb3Igd2luMzI8YnI+DQrCoCBVc2UgZ191bml4X3NldF9m
ZF9ub25ibG9ja2luZygpPGJyPg0KwqAgYmxvY2s6IG1vdmUgZmNudGxfc2V0ZmwoKTxicj4NCsKg
IFJlcGxhY2UgcWVtdV9waXBlKCkgd2l0aCBnX3VuaXhfb3Blbl9waXBlKCk8YnI+DQrCoCB1dGls
OiByZXBsYWNlIHBpcGUoKStjbG9leGVjIHdpdGggZ191bml4X29wZW5fcGlwZSgpPGJyPg0KwqAg
cWdhOiByZXBsYWNlIHBpcGUoKSB3aXRoIGdfdW5peF9vcGVuX3BpcGUoQ0xPRVhFQyk8YnI+DQrC
oCB0ZXN0czogcmVwbGFjZSBwaXBlKCkgd2l0aCBnX3VuaXhfb3Blbl9waXBlKENMT0VYRUMpPGJy
Pg0KwqAgb3MtcG9zaXg6IHJlcGxhY2UgcGlwZSgpK2Nsb2V4ZWMgd2l0aCBnX3VuaXhfb3Blbl9w
aXBlKENMT0VYRUMpPGJyPg0KwqAgdmlydGlvZnNkOiByZXBsYWNlIHBpcGUoKSB3aXRoIGdfdW5p
eF9vcGVuX3BpcGUoQ0xPRVhFQyk8YnI+DQrCoCBpbzogcmVwbGFjZSBwaXBlKCkgd2l0aCBnX3Vu
aXhfb3Blbl9waXBlKENMT0VYRUMpPGJyPg0KwqAgUmVwbGFjZSBmY250bCgwX05PTkJMT0NLKSB3
aXRoIGdfdW5peF9zZXRfZmRfbm9uYmxvY2tpbmcoKTxicj4NCsKgIGlvOiBtYWtlIHFpb19jaGFu
bmVsX2NvbW1hbmRfbmV3X3BpZCgpIHN0YXRpYzxicj4NCsKgIGNoYXJkZXY6IHJlcGxhY2UgcWVt
dV9zZXRfbm9uYmxvY2soKTxicj4NCsKgIGlvOiByZXBsYWNlIHFlbXVfc2V0e19ub259YmxvY2so
KTxicj4NCsKgIHFnYTogcmVwbGFjZSBxZW11X3NldF9ub25ibG9jaygpPGJyPg0KwqAgaHc6IHJl
cGxhY2UgcWVtdV9zZXRfbm9uYmxvY2soKTxicj4NCsKgIHVpOiByZXBsYWNlIHFlbXVfc2V0X25v
bmJsb2NrKCk8YnI+DQrCoCBuZXQ6IHJlcGxhY2UgcWVtdV9zZXRfbm9uYmxvY2soKTxicj4NCsKg
IHRlc3RzOiByZXBsYWNlIHFlbXVfc2V0X25vbmJsb2NrKCk8YnI+DQrCoCB1dGlsOiByZW5hbWUg
cWVtdV8qYmxvY2soKSBzb2NrZXQgZnVuY3Rpb25zPGJyPg0KPGJyPg0KwqBkb2NzL2RldmVsL3F0
ZXN0LnJzdMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08
YnI+DQrCoGluY2x1ZGUvaW8vY2hhbm5lbC1jb21tYW5kLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgMjUgLS08YnI+DQrCoGluY2x1ZGUvcWVtdS9hdG9taWMuaMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgOCArLTxicj4NCsKgaW5jbHVkZS9xZW11L2N1
dGlscy5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqA3ICs8YnI+
DQrCoGluY2x1ZGUvcWVtdS9vc2RlcC5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfMKgIDEyIC08YnI+DQrCoGluY2x1ZGUvcWVtdS9zb2NrZXRzLmjCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqA2ICstPGJyPg0KwqBpbmNsdWRlL3N5c2VtdS9v
cy1wb3NpeC5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyIC08YnI+DQrC
oHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvaW5jbHVkZS9jb21waWxlci5owqAgfMKgIMKgMSAr
PGJyPg0KwqB0ZXN0cy9xdGVzdC9hY3BpLXV0aWxzLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9ib290LXNlY3Rvci5owqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9m
dXp6L2Z1enouaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxi
cj4NCsKgdGVzdHMvcXRlc3QvbGlicW1wLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgNTIgKysrKzxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL2Z3X2NmZy5owqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9s
aWJxb3MvaTJjLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJy
Pg0KwqB0ZXN0cy9xdGVzdC9saWJxb3MvbGlicW9zLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2xpYnFvcy9tYWxsb2MuaMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9z
L3BjaS5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKg
dGVzdHMvcXRlc3QvbGlicW9zL3NkaGNpLWNtZC5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKg
IMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicXRlc3Qtc2luZ2xlLmjCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3tsaWJxb3MgPSZndDsg
fS9saWJxdGVzdC5owqAgwqAgwqAgwqAgwqAgwqB8wqAgMjkgKy08YnI+DQrCoHRlc3RzL3F0ZXN0
L21pZ3JhdGlvbi1oZWxwZXJzLmjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+
DQrCoHRlc3RzL3F0ZXN0L3RwbS1lbXUuaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgMiArLTxicj4NCsKgYmxvY2svZmlsZS1wb3NpeC5jwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDE1ICs8YnI+DQrCoGNoYXJkZXYvY2hhci1m
ZC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqA0ICst
PGJyPg0KwqBjaGFyZGV2L2NoYXItcHR5LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB8wqAgwqA1ICstPGJyPg0KwqBjaGFyZGV2L2NoYXItc2VyaWFsLmPCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDUgKy08YnI+DQrCoGNoYXJkZXYv
Y2hhci1zb2NrZXQuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKg
MiArLTxicj4NCsKgY2hhcmRldi9jaGFyLXN0ZGlvLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqA1ICstPGJyPg0KwqBjb250cmliL2l2c2htZW0tc2VydmVyL2l2
c2htZW0tc2VydmVyLmPCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoGh3L2h5cGVydi9zeW5k
YmcuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08
YnI+DQrCoGh3L2lucHV0L3ZpcnRpby1pbnB1dC1ob3N0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgwqA1ICstPGJyPg0KwqBody9taXNjL2l2c2htZW0uY8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgaHcvdmlydGlvL3Zo
b3N0LXVzZXIuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08
YnI+DQrCoGh3L3ZpcnRpby92aG9zdC12c29jay5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8wqAgMTEgKy08YnI+DQrCoGlvL2NoYW5uZWwtY29tbWFuZC5jwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIDQ2ICsrKy08YnI+DQrCoGlvL2NoYW5uZWwt
ZmlsZS5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMTMg
Ky08YnI+DQrCoGlvL2NoYW5uZWwtc29ja2V0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoDYgKy08YnI+DQrCoG5ldC9sMnRwdjMuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoG5l
dC9zb2NrZXQuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCAxMCArLTxicj4NCsKgbmV0L3RhcC1ic2QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgNCArLTxicj4NCsKgbmV0L3RhcC1saW51
eC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAy
ICstPGJyPg0KwqBuZXQvdGFwLXNvbGFyaXMuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgbmV0L3RhcC5jwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgMzMgKystPGJyPg0K
wqBvcy1wb3NpeC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfMKgIMKgMyArLTxicj4NCsKgcWVtdS1pby5jwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAxICs8YnI+DQrCoHFlbXUt
bmJkLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCB8wqAgwqA1ICstPGJyPg0KwqBxZ2EvY2hhbm5lbC1wb3NpeC5jwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqBxZ2EvY29tbWFuZHMtcG9z
aXguY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDggKy08YnI+
DQrCoHN0b3JhZ2UtZGFlbW9uL3FlbXUtc3RvcmFnZS1kYWVtb24uY8KgIMKgIMKgIMKgIMKgIHzC
oCDCoDEgKzxicj4NCsKgdGVzdHMvcXRlc3QvYWM5Ny10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2FoY2ktdGVzdC5j
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0
cy9xdGVzdC9hbTUzYzk3NC10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDC
oDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2FybS1jcHUtZmVhdHVyZXMuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2FzcGVlZF9oYWNlLXRlc3Qu
Y8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2Jv
b3Qtb3JkZXItdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0K
wqB0ZXN0cy9xdGVzdC9ib290LXNlY3Rvci5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9ib290LXNlcmlhbC10ZXN0LmPCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9jZHJvbS10ZXN0
LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0
cy9xdGVzdC9kYnVzLWRpc3BsYXktdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAy
ICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9kYnVzLXZtc3RhdGUtdGVzdC5jwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9kZXZpY2UtaW50cm9zcGVjdC10
ZXN0LmPCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9kZXZpY2Ut
cGx1Zy10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0
cy9xdGVzdC9kcml2ZV9kZWwtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKg
MiArLTxicj4NCsKgdGVzdHMvcXRlc3QvZHMxMzM4LXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvZTEwMDAtdGVzdC5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRl
c3QvZWVwcm8xMDAtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICst
PGJyPg0KwqB0ZXN0cy9xdGVzdC9lbmRpYW5uZXNzLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvZXJzdC10ZXN0LmPCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2Vz
MTM3MC10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+
DQrCoHRlc3RzL3F0ZXN0L2ZkYy10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9mdXp6LWUxMDAwZS10ZXN0LmPCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9mdXp6LWxz
aTUzYzg5NWEtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMv
cXRlc3QvZnV6ei1tZWdhc2FzLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiAr
LTxicj4NCsKgdGVzdHMvcXRlc3QvZnV6ei1zYjE2LXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2Z1enotc2RjYXJkLXRlc3QuY8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2Z1enot
dmlydGlvLXNjc2ktdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0
cy9xdGVzdC9mdXp6LXhsbngtZHAtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAy
ICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9mdXp6L2Z1enouY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIMKgMyArLTxicj4NCsKgdGVzdHMvcXRlc3QvZnV6ei9nZW5lcmljX2Z1
enouY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3Qv
ZnV6ei9pNDQwZnhfZnV6ei5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4N
CsKgdGVzdHMvcXRlc3QvZnV6ei9xb3NfZnV6ei5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9mdXp6L3ZpcnRpb19ibGtfZnV6ei5jwqAg
wqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvZnV6ei92aXJ0aW9f
bmV0X2Z1enouY8KgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDQgKy08YnI+DQrCoHRlc3RzL3F0ZXN0
L2Z1enovdmlydGlvX3Njc2lfZnV6ei5jwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0K
wqB0ZXN0cy9xdGVzdC9md19jZmctdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9oZC1nZW8tdGVzdC5jwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9oZXhsb2Fk
ZXItdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVz
dHMvcXRlc3QvaWRlLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzC
oCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2lwb2N0YWwyMzItdGVzdC5jwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9pdnNobWVtLXRlc3Qu
Y8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDcgKy08YnI+DQrCoHRlc3RzL3F0
ZXN0L2xpYnFtcC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAyNTgg
KysrKysrKysrKysrKysrKysrPGJyPg0KwqAuLi4vbGlicW9zL2FhcmNoNjQteGxueC16Y3UxMDIt
bWFjaGluZS5jwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL2Fo
Y2kuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVz
dHMvcXRlc3QvbGlicW9zL2FybS1pbXgyNS1wZGstbWFjaGluZS5jwqAgwqAgfMKgIMKgMiArLTxi
cj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL2FybS1uODAwLW1hY2hpbmUuY8KgIMKgIMKgIMKgIMKg
fMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL2FybS1yYXNwaTItbWFjaGluZS5j
wqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3MvYXJtLXNhYnJl
bGl0ZS1tYWNoaW5lLmPCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3Mv
YXJtLXNtZGtjMjEwLW1hY2hpbmUuY8KgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRl
c3QvbGlicW9zL2FybS12aXJ0LW1hY2hpbmUuY8KgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4N
CsKgLi4uL3F0ZXN0L2xpYnFvcy9hcm0teGlsaW54LXp5bnEtYTktbWFjaGluZS5jIHzCoCDCoDIg
Ky08YnI+DQrCoHRlc3RzL3F0ZXN0L2xpYnFvcy9lMTAwMGUuY8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL2Z3X2NmZy5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9s
aWJxb3MvaTJjLWlteC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4N
CsKgdGVzdHMvcXRlc3QvbGlicW9zL2kyYy1vbWFwLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2xpYnFvcy9pMmMuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L2xpYnFvcy9s
aWJxb3MuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVz
dHMvcXRlc3QvbGlicW9zL3BjaS1wYy5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAg
wqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3MvcGNpLXNwYXByLmPCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3MvcHBjNjRfcHNl
cmllcy1tYWNoaW5lLmPCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3Mv
cWdyYXBoLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRl
c3RzL3F0ZXN0L2xpYnFvcy9xb3NfZXh0ZXJuYWwuY8KgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKg
MiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL3J0YXMuY8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL3NkaGNpLWNt
ZC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3Qv
bGlicW9zL3NkaGNpLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJy
Pg0KwqB0ZXN0cy9xdGVzdC9saWJxb3MvdHBjaTIwMC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL3VzYi5jwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9z
L3Zob3N0LXVzZXItYmxrLmPCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3Rz
L3F0ZXN0L2xpYnFvcy92aXJ0aW8tOXAuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIg
Ky08YnI+DQrCoHRlc3RzL3F0ZXN0L2xpYnFvcy92aXJ0aW8tYmFsbG9vbi5jwqAgwqAgwqAgwqAg
wqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3MvdmlydGlvLWJsay5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3Mv
dmlydGlvLWlvbW11LmPCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3Rz
L3F0ZXN0L2xpYnFvcy92aXJ0aW8tbW1pby5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiAr
LTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL3ZpcnRpby1uZXQuY8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL3ZpcnRpby1wY2kuY8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9z
L3ZpcnRpby1ybmcuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVz
dHMvcXRlc3QvbGlicW9zL3ZpcnRpby1zY3NpLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAy
ICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJxb3MvdmlydGlvLXNlcmlhbC5jwqAgwqAgwqAgwqAg
wqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbGlicW9zL3ZpcnRpby5jwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9saWJx
b3MveDg2XzY0X3BjLW1hY2hpbmUuY8KgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3Rz
L3F0ZXN0L2xpYnF0ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDIw
NyArLS0tLS0tLS0tLS0tLTxicj4NCsKgdGVzdHMvcXRlc3QvbHBjLWljaDktdGVzdC5jwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9tNDh0
NTktdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0K
wqB0ZXN0cy9xdGVzdC9tYWNoaW5lLW5vbmUtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9tZWdhc2FzLXRlc3QuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L21pY3JvYml0LXRl
c3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMv
cXRlc3QvbWlncmF0aW9uLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIg
Ky08YnI+DQrCoHRlc3RzL3F0ZXN0L21vZHVsZXMtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbmUyMDAwLXRlc3QuY8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3Qv
bnBjbTd4eF9hZGMtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4N
CsKgdGVzdHMvcXRlc3QvbnBjbTd4eF9wd20tdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbnBjbTd4eF9zZGhjaS10ZXN0LmPCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9ucGNtN3h4X3NtYnVz
LXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0
L25wY203eHhfd2F0Y2hkb2dfdGltZXItdGVzdC5jwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0
ZXN0cy9xdGVzdC9udW1hLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvbnZtZS10ZXN0LmPCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3BjYTk1NTIt
dGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVz
dHMvcXRlc3QvcGNpLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzC
oCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3BjbmV0LXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3BmbGFzaC1jZmkw
Mi10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0
ZXN0L3Budi14c2NvbS10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICst
PGJyPg0KwqB0ZXN0cy9xdGVzdC9wcm9tLWVudi10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3B2cGFuaWMtcGNpLXRlc3QuY8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3B2cGFu
aWMtdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKg
dGVzdHMvcXRlc3QvcHhlLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3EzNS10ZXN0LmPCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9xbXAtY21k
LXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRl
c3RzL3F0ZXN0L3FtcC10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8
wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC9xb20tdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvcnRhcy10ZXN0
LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRl
c3RzL3F0ZXN0L3NkaGNpLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzC
oCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3NwYXByLXBoYi10ZXN0LmPCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC90Y28tdGVzdC5jwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMv
cXRlc3QvdGVzdC1maWx0ZXItbWlycm9yLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICst
PGJyPg0KwqB0ZXN0cy9xdGVzdC90ZXN0LWZpbHRlci1yZWRpcmVjdG9yLmPCoCDCoCDCoCDCoCDC
oCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVzdC90ZXN0LWhtcC5jwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvdHBtLWNy
Yi1zd3RwbS10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstPGJyPg0KwqB0ZXN0
cy9xdGVzdC90cG0tdGlzLWRldmljZS1zd3RwbS10ZXN0LmPCoCDCoCDCoCDCoHzCoCDCoDIgKy08
YnI+DQrCoHRlc3RzL3F0ZXN0L3RwbS10aXMtc3d0cG0tdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3QvdHBtLXV0aWwuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3R1bGlw
LXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrC
oHRlc3RzL3F0ZXN0L3Zob3N0LXVzZXItdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8
wqAgwqA0ICstPGJyPg0KwqB0ZXN0cy9xdGVzdC92aXJ0aW8tbmV0LWZhaWxvdmVyLmPCoCDCoCDC
oCDCoCDCoCDCoCDCoHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3ZpcnRpby1ybmctdGVz
dC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy9xdGVz
dC92aXJ0aW8tdGVzdC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICst
PGJyPg0KwqB0ZXN0cy9xdGVzdC92bWdlbmlkLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHzCoCDCoDIgKy08YnI+DQrCoHRlc3RzL3F0ZXN0L3ZteG5ldDMtdGVzdC5jwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3Qvd2R0
X2liNzAwLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoDIgKy08YnI+DQrC
oHRlc3RzL3F0ZXN0L3hsbngtY2FuLXRlc3QuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fMKgIMKgMiArLTxicj4NCsKgdGVzdHMvdW5pdC9zb2NrZXQtaGVscGVycy5jwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJyPg0KwqB0ZXN0cy91bml0L3Rlc3QtY3J5cHRv
LXRsc3Nlc3Npb24uY8KgIMKgIMKgIMKgIMKgIMKgfMKgIMKgOCArLTxicj4NCsKgdGVzdHMvdW5p
dC90ZXN0LWlvLWNoYW5uZWwtZmlsZS5jwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqAyICstPGJy
Pg0KwqB0ZXN0cy91bml0L3Rlc3QtaW92LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHzCoCDCoDQgKy08YnI+DQrCoHRlc3RzL3VuaXQvdGVzdC1xZ2EuY8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdG9vbHMvdmlydGlv
ZnNkL2hlbHBlci5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgMiArLTxi
cj4NCsKgdWkvaW5wdXQtbGludXguY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHzCoCDCoDUgKy08YnI+DQrCoHV0aWwvY29tcGF0ZmQuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgNSArLTxicj4NCsKgdXRpbC9j
b3JvdXRpbmUtdWNvbnRleHQuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKg
MiArLTxicj4NCsKgdXRpbC9jdXRpbHMuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCAxMDggKysrKysrKys8YnI+DQrCoHV0aWwvZXZlbnRfbm90aWZp
ZXItcG9zaXguY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgOCArLTxicj4NCsKg
dXRpbC9tYWluLWxvb3AuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCDCoDIgKy08YnI+DQrCoHV0aWwvb3NsaWItcG9zaXguY8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgMTQyICstLS0tLS0tLS08YnI+DQrCoHV0aWwvb3Ns
aWItd2luMzIuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCA2
MSArLS0tLTxicj4NCsKgdXRpbC92aG9zdC11c2VyLXNlcnZlci5jwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfMKgIMKgNCArLTxicj4NCsKgc2NyaXB0cy9vc3MtZnV6ei9vdXRwdXRf
cmVwcm9kdWNlci5wecKgIMKgIMKgIMKgIMKgfMKgIMKgMiArLTxicj4NCsKgdGVzdHMvcXRlc3Qv
bGlicW9zL21lc29uLmJ1aWxkwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKgIMKgNSArLTxicj4N
CsKgdGVzdHMvdW5pdC9tZXNvbi5idWlsZMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHzCoCDCoDIgKy08YnI+DQrCoDE5NiBmaWxlcyBjaGFuZ2VkLCA3NTggaW5zZXJ0aW9ucygr
KSwgNzAzIGRlbGV0aW9ucygtKTxicj4NCsKgY3JlYXRlIG1vZGUgMTIwMDAwIHN1YnByb2plY3Rz
L2xpYnZob3N0LXVzZXIvaW5jbHVkZS9jb21waWxlci5oPGJyPg0KwqBjcmVhdGUgbW9kZSAxMDA2
NDQgdGVzdHMvcXRlc3QvbGlicW1wLmg8YnI+DQrCoHJlbmFtZSB0ZXN0cy9xdGVzdC97bGlicW9z
ID0mZ3Q7IH0vbGlicXRlc3QuaCAoOTUlKTxicj4NCsKgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rz
L3F0ZXN0L2xpYnFtcC5jPGJyPg0KPGJyPg0KLS0gPGJyPg0KMi4zNi4wPGJyPg0KPGJyPg0KPGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGVhcj0iYWxsIj48YnI+LS0gPGJyPjxkaXYgZGly
PSJsdHIiPk1hcmMtQW5kcsOpIEx1cmVhdTxicj48L2Rpdj48L2Rpdj4NCg==
--000000000000f9f60205de02938d--

