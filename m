Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5C4E55F2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:06:17 +0100 (CET)
Received: from localhost ([::1]:55440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3V2-0007sk-L2
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:06:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Mz-0001lv-J3
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Mv-0004iW-La
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 11:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A3pdBnQ8CJB42E+G2MJ/Wh1aIobHxGkTEqTwcpBe2nI=;
 b=VHr6MAYmrrz3oYU9mDXIBUhyhLtDyysq4OW/NymOJdtcdcaPxMgZL3ZBvKjfp4KT8UNmC5
 xjX4bDMDiZOIGMig6eEh6OiM1I9rWyIPAiDfWKhjZN3CW1EW5qKbw7VadxYdzsSrFnUu1j
 ouDsi2I9twR8ZaJ4HojcMifdp7AdgMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-izwzStJyOq6RxSMy7WqXag-1; Wed, 23 Mar 2022 11:57:48 -0400
X-MC-Unique: izwzStJyOq6RxSMy7WqXag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF0D833966
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:57:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3802640CF919;
 Wed, 23 Mar 2022 15:57:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/32] Misc cleanups
Date: Wed, 23 Mar 2022 19:57:11 +0400
Message-Id: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Various cleanup patches gleaned while working on different things. A good half
of them are realted to cleaning up qemu-common.h.

Most of them can be delayed for 7.1 imho, to avoid any risk of last minute
regression. Eventually, a few safe one could be cherry-picked earlier by
maintainers.

(some patches have been posted in earlier cleanup series)

Marc-André Lureau (32):
  meson: use chardev_ss dependencies
  meson: add util dependency for oslib-posix on freebsd
  meson: remove unneeded py3
  meson: remove test-qdev-global-props dependency on testqapi
  char: move qemu_openpty_raw from util/ to char/
  Replace config-time define HOST_WORDS_BIGENDIAN
  Replace TARGET_WORDS_BIGENDIAN
  osdep: poison {HOST,TARGET}_WORDS_BIGENDIAN
  include/qapi: add g_autoptr support for qobject types
  tests: replace free_all() usage with g_auto
  Replace qemu_real_host_page variables with inlined functions
  qga: replace deprecated g_get_current_time()
  error-report: replace deprecated g_get_current_time() with glib >=
    2.62
  util: rename qemu-error.c to match its header name
  error-report: use error_printf() for program prefix
  include: move TFR to osdep.h
  include: move qemu_write_full() declaration to osdep.h
  include: move qemu_pipe() to osdep.h
  include: move coroutine IO functions to coroutine.h
  include: move dump_in_progress() to runstate.h
  include: move C/util-related declarations to cutils.h
  include: move cpu_exec* declarations to cpu-common.h
  include: move target page bits declaration to page-vary.h
  include: move progress API to qemu-progress.h
  include: move qemu_get_vm_name() to sysemu.h
  include: move os_*() to os-foo.h
  include: move page_size_init() to include/hw/core/cpu.h
  Move CPU softfloat unions to cpu-float.h
  Move fcntl_setfl() to oslib-posix
  qga: remove explicit environ argument from exec/spawn
  RFC: Simplify softmmu/main.c
  Remove qemu-common.h include from most units

 docs/devel/loads-stores.rst                |   2 +-
 configs/targets/aarch64_be-linux-user.mak  |   2 +-
 configs/targets/armeb-linux-user.mak       |   2 +-
 configs/targets/hppa-linux-user.mak        |   2 +-
 configs/targets/hppa-softmmu.mak           |   2 +-
 configs/targets/m68k-linux-user.mak        |   2 +-
 configs/targets/m68k-softmmu.mak           |   2 +-
 configs/targets/microblaze-linux-user.mak  |   2 +-
 configs/targets/microblaze-softmmu.mak     |   2 +-
 configs/targets/mips-linux-user.mak        |   2 +-
 configs/targets/mips-softmmu.mak           |   2 +-
 configs/targets/mips64-linux-user.mak      |   2 +-
 configs/targets/mips64-softmmu.mak         |   2 +-
 configs/targets/mipsn32-linux-user.mak     |   2 +-
 configs/targets/or1k-linux-user.mak        |   2 +-
 configs/targets/or1k-softmmu.mak           |   2 +-
 configs/targets/ppc-linux-user.mak         |   2 +-
 configs/targets/ppc-softmmu.mak            |   2 +-
 configs/targets/ppc64-linux-user.mak       |   2 +-
 configs/targets/ppc64-softmmu.mak          |   2 +-
 configs/targets/s390x-linux-user.mak       |   2 +-
 configs/targets/s390x-softmmu.mak          |   2 +-
 configs/targets/sh4eb-linux-user.mak       |   2 +-
 configs/targets/sh4eb-softmmu.mak          |   2 +-
 configs/targets/sparc-linux-user.mak       |   2 +-
 configs/targets/sparc-softmmu.mak          |   2 +-
 configs/targets/sparc32plus-linux-user.mak |   2 +-
 configs/targets/sparc64-linux-user.mak     |   2 +-
 configs/targets/sparc64-softmmu.mak        |   2 +-
 configs/targets/xtensaeb-linux-user.mak    |   2 +-
 configs/targets/xtensaeb-softmmu.mak       |   2 +-
 meson.build                                |  10 +-
 accel/tcg/atomic_template.h                |   4 +-
 audio/audio.h                              |   2 +-
 bsd-user/qemu.h                            |   2 +-
 hw/display/pl110_template.h                |   6 +-
 hw/net/can/ctucan_core.h                   |   2 +-
 hw/net/vmxnet3.h                           |   4 +-
 include/exec/cpu-all.h                     |   8 +-
 include/exec/cpu-common.h                  |   7 +-
 include/exec/cpu_ldst.h                    |   2 +-
 include/exec/gdbstub.h                     |   2 +-
 include/exec/memop.h                       |   4 +-
 include/exec/memory.h                      |   2 +-
 include/exec/page-vary.h                   |  18 +++
 include/exec/poison.h                      |   2 +-
 include/exec/ram_addr.h                    |   2 +-
 include/fpu/softfloat-types.h              |   2 +-
 include/glib-compat.h                      |  10 ++
 include/hw/core/cpu.h                      |   6 +-
 include/hw/i386/intel_iommu.h              |   6 +-
 include/hw/i386/x86-iommu.h                |   4 +-
 include/hw/mips/bios.h                     |   2 +-
 include/hw/virtio/virtio-access.h          |   8 +-
 include/hw/virtio/virtio-gpu-bswap.h       |   2 +-
 include/libdecnumber/dconfig.h             |   2 +-
 include/net/eth.h                          |   2 +-
 include/qapi/qmp/qbool.h                   |   4 +
 include/qapi/qmp/qdict.h                   |   4 +
 include/qapi/qmp/qlist.h                   |   4 +
 include/qapi/qmp/qnull.h                   |   4 +
 include/qapi/qmp/qnum.h                    |   4 +
 include/qapi/qmp/qstring.h                 |   4 +
 include/qemu-common.h                      | 104 ---------------
 include/qemu-main.h                        |   6 +
 include/qemu/bswap.h                       |  64 +---------
 include/qemu/coroutine.h                   |  23 ++++
 include/qemu/cpu-float.h                   |  64 ++++++++++
 include/qemu/cutils.h                      |  21 +++-
 include/qemu/host-utils.h                  |   2 +-
 include/qemu/int128.h                      |   2 +-
 include/qemu/osdep.h                       |  36 +++++-
 include/qemu/qemu-progress.h               |   8 ++
 include/sysemu/os-posix.h                  |   4 +
 include/sysemu/os-win32.h                  |   4 +-
 include/sysemu/runstate.h                  |   1 +
 include/sysemu/sysemu.h                    |   2 +
 include/ui/qemu-pixman.h                   |   2 +-
 linux-user/aarch64/target_syscall.h        |   2 +-
 linux-user/arm/target_syscall.h            |   2 +-
 linux-user/ppc/target_syscall.h            |   2 +-
 linux-user/qemu.h                          |   2 +-
 linux-user/user-internals.h                |   2 +-
 linux-user/xtensa/target_structs.h         |   2 +-
 net/util.h                                 |   2 +-
 target/alpha/cpu.h                         |   1 +
 target/arm/cpu.h                           |  17 +--
 target/arm/translate-a64.h                 |   2 +-
 target/arm/vec_internal.h                  |   2 +-
 target/hppa/cpu.h                          |   1 +
 target/i386/cpu.h                          |   3 +-
 target/m68k/cpu.h                          |   1 +
 target/microblaze/cpu.h                    |   2 +-
 target/mips/cpu.h                          |   2 +-
 target/openrisc/cpu.h                      |   1 +
 target/ppc/cpu.h                           |   3 +-
 target/riscv/cpu.h                         |   2 +-
 target/rx/cpu.h                            |   1 +
 target/s390x/cpu.h                         |   1 +
 target/s390x/tcg/vec.h                     |   2 +-
 target/sh4/cpu.h                           |   1 +
 target/sparc/cpu.h                         |   1 +
 target/tricore/cpu.h                       |   1 +
 target/xtensa/cpu.h                        |   5 +-
 target/xtensa/overlay_tool.h               |   2 +-
 tests/fp/platform.h                        |   4 +-
 accel/hvf/hvf-accel-ops.c                  |   2 +-
 accel/hvf/hvf-all.c                        |   1 -
 accel/kvm/kvm-all.c                        |  24 ++--
 accel/tcg/cpu-exec.c                       |   1 -
 accel/tcg/tcg-accel-ops-icount.c           |   1 -
 accel/tcg/tcg-accel-ops-mttcg.c            |   1 -
 accel/tcg/tcg-accel-ops-rr.c               |   1 -
 accel/tcg/tcg-accel-ops.c                  |   1 -
 accel/tcg/tcg-all.c                        |   1 -
 accel/tcg/translate-all.c                  |   1 -
 audio/audio.c                              |   2 +-
 audio/audio_win_int.c                      |   1 -
 audio/dbusaudio.c                          |   2 +-
 backends/hostmem-epc.c                     |   1 -
 backends/hostmem.c                         |   2 +-
 backends/tpm/tpm_passthrough.c             |   1 -
 block.c                                    |   4 +-
 block/file-posix.c                         |   7 +-
 block/io.c                                 |   2 +-
 block/io_uring.c                           |   1 -
 block/iscsi.c                              |   2 +-
 block/nvme.c                               |  22 ++--
 block/parallels.c                          |   2 +-
 block/qcow2-cache.c                        |   2 +-
 bsd-user/elfload.c                         |   2 +-
 bsd-user/freebsd/os-syscall.c              |   1 -
 bsd-user/mmap.c                            |   3 +-
 chardev/char-fd.c                          |   1 -
 chardev/char-pipe.c                        |   1 -
 chardev/char-pty.c                         | 112 ++++++++++++++++-
 contrib/vhost-user-gpu/vugbm.c             |   2 +-
 cpu.c                                      |   5 +-
 crypto/cipher-afalg.c                      |   1 -
 crypto/hash-afalg.c                        |   1 -
 disas.c                                    |   4 +-
 dump/dump.c                                |   5 +-
 dump/win_dump.c                            |   1 -
 fsdev/virtfs-proxy-helper.c                |   1 -
 gdbstub.c                                  |   1 -
 hw/9pfs/9p-proxy.c                         |   1 -
 hw/alpha/dp264.c                           |   1 -
 hw/arm/armv7m.c                            |   2 +-
 hw/avr/boot.c                              |   1 -
 hw/core/loader.c                           |   5 +-
 hw/display/artist.c                        |   7 +-
 hw/display/cg3.c                           |   1 -
 hw/display/pxa2xx_lcd.c                    |   2 +-
 hw/display/qxl.c                           |   2 +-
 hw/display/tcx.c                           |   1 -
 hw/display/vga.c                           |  14 +--
 hw/display/virtio-gpu-gl.c                 |   2 +-
 hw/display/virtio-gpu-udmabuf.c            |   1 -
 hw/dma/pl330.c                             |   1 -
 hw/dma/xlnx_dpdma.c                        |   2 +-
 hw/hppa/machine.c                          |   1 -
 hw/i386/pc_sysfw.c                         |   1 -
 hw/i386/x86.c                              |   1 -
 hw/input/vhost-user-input.c                |   1 -
 hw/intc/s390_flic_kvm.c                    |   2 +-
 hw/intc/xics_kvm.c                         |   1 -
 hw/m68k/mcf5208.c                          |   1 -
 hw/m68k/q800.c                             |   1 -
 hw/m68k/virt.c                             |   1 -
 hw/microblaze/boot.c                       |   3 +-
 hw/mips/fuloong2e.c                        |   1 -
 hw/mips/gt64xxx_pci.c                      |   6 +-
 hw/mips/jazz.c                             |   3 +-
 hw/mips/loongson3_virt.c                   |   1 -
 hw/mips/malta.c                            |  25 ++--
 hw/mips/mipssim.c                          |   3 +-
 hw/misc/sbsa_ec.c                          |   1 -
 hw/net/fsl_etsec/etsec.c                   |   1 -
 hw/net/fsl_etsec/rings.c                   |   1 -
 hw/net/msf2-emac.c                         |   1 -
 hw/net/npcm7xx_emc.c                       |   1 -
 hw/nios2/boot.c                            |   3 +-
 hw/nios2/generic_nommu.c                   |   1 -
 hw/nvram/fw_cfg.c                          |   7 +-
 hw/pci-host/mv64361.c                      |   1 -
 hw/pci-host/pnv_phb3.c                     |   1 -
 hw/pci-host/pnv_phb3_msi.c                 |   1 -
 hw/pci-host/pnv_phb3_pbcq.c                |   1 -
 hw/pci-host/pnv_phb4.c                     |   1 -
 hw/pci-host/pnv_phb4_pec.c                 |   1 -
 hw/pci-host/raven.c                        |   1 -
 hw/pci-host/remote.c                       |   1 -
 hw/pci/pci.c                               |   1 -
 hw/ppc/e500.c                              |   1 -
 hw/ppc/mac_newworld.c                      |   3 +-
 hw/ppc/mac_oldworld.c                      |   1 -
 hw/ppc/pegasos2.c                          |   1 -
 hw/ppc/pnv.c                               |   1 -
 hw/ppc/pnv_bmc.c                           |   1 -
 hw/ppc/ppc405_boards.c                     |   1 -
 hw/ppc/ppc440_bamboo.c                     |   1 -
 hw/ppc/sam460ex.c                          |   1 -
 hw/ppc/spapr.c                             |   1 -
 hw/ppc/spapr_numa.c                        |   1 -
 hw/ppc/spapr_pci.c                         |   2 +-
 hw/ppc/spapr_pci_nvlink2.c                 |   1 -
 hw/ppc/spapr_tpm_proxy.c                   |   1 -
 hw/ppc/spapr_vof.c                         |   1 -
 hw/ppc/virtex_ml507.c                      |   1 -
 hw/ppc/vof.c                               |   1 -
 hw/rdma/vmw/pvrdma_main.c                  |   2 +-
 hw/remote/iohub.c                          |   1 -
 hw/remote/machine.c                        |   1 -
 hw/remote/memory.c                         |   1 -
 hw/remote/message.c                        |   1 -
 hw/remote/mpqemu-link.c                    |   1 -
 hw/remote/proxy-memory-listener.c          |   1 -
 hw/remote/proxy.c                          |   1 -
 hw/remote/remote-obj.c                     |   1 -
 hw/riscv/boot.c                            |   1 -
 hw/rx/rx-gdbsim.c                          |   1 -
 hw/s390x/event-facility.c                  |   2 +-
 hw/s390x/ipl.c                             |   1 -
 hw/scsi/scsi-generic.c                     |   2 +-
 hw/sd/sd.c                                 |   1 -
 hw/sparc/leon3.c                           |   1 -
 hw/sparc/sun4m.c                           |   1 -
 hw/sparc64/sun4u.c                         |   1 -
 hw/tpm/tpm_ppi.c                           |   2 +-
 hw/usb/ccid-card-passthru.c                |   2 +-
 hw/usb/dev-mtp.c                           |   1 -
 hw/usb/dev-smartcard-reader.c              |   2 +-
 hw/usb/redirect.c                          |   2 +-
 hw/vfio/common.c                           |  24 ++--
 hw/vfio/pci.c                              |  10 +-
 hw/vfio/spapr.c                            |   8 +-
 hw/virtio/vhost-iova-tree.c                |   4 +-
 hw/virtio/vhost-shadow-virtqueue.c         |   8 +-
 hw/virtio/vhost-user.c                     |   4 +-
 hw/virtio/vhost-vdpa.c                     |   8 +-
 hw/virtio/vhost.c                          |   2 +-
 hw/virtio/virtio-iommu.c                   |   1 -
 hw/virtio/virtio-mem.c                     |  11 +-
 hw/virtio/virtio-pmem.c                    |   1 -
 hw/xtensa/sim.c                            |   2 +-
 hw/xtensa/xtfpga.c                         |   4 +-
 io/channel-socket.c                        |   1 -
 linux-user/aarch64/cpu_loop.c              |   3 +-
 linux-user/aarch64/signal.c                |   4 +-
 linux-user/alpha/cpu_loop.c                |   1 -
 linux-user/arm/cpu_loop.c                  |   3 +-
 linux-user/arm/nwfpe/double_cpdo.c         |   4 +-
 linux-user/arm/nwfpe/fpa11_cpdt.c          |   4 +-
 linux-user/cris/cpu_loop.c                 |   1 -
 linux-user/elfload.c                       |  10 +-
 linux-user/hexagon/cpu_loop.c              |   1 -
 linux-user/i386/cpu_loop.c                 |   1 -
 linux-user/m68k/cpu_loop.c                 |   1 -
 linux-user/microblaze/cpu_loop.c           |   1 -
 linux-user/mips/cpu_loop.c                 |   1 -
 linux-user/mmap.c                          |   2 +-
 linux-user/openrisc/cpu_loop.c             |   1 -
 linux-user/ppc/cpu_loop.c                  |   1 -
 linux-user/ppc/signal.c                    |   5 +-
 linux-user/riscv/cpu_loop.c                |   1 -
 linux-user/s390x/cpu_loop.c                |   1 -
 linux-user/sh4/cpu_loop.c                  |   1 -
 linux-user/sparc/cpu_loop.c                |   1 -
 linux-user/syscall.c                       |   6 +-
 linux-user/uname.c                         |   3 +-
 linux-user/xtensa/signal.c                 |   2 +-
 migration/migration.c                      |   2 +-
 migration/postcopy-ram.c                   |   4 +-
 migration/vmstate-types.c                  |   1 +
 monitor/misc.c                             |   2 +-
 monitor/qmp-cmds.c                         |   5 +-
 net/announce.c                             |   2 +-
 net/colo-compare.c                         |   1 -
 net/net.c                                  |   5 +-
 net/socket.c                               |   1 -
 net/tap-bsd.c                              |   1 -
 net/tap-linux.c                            |   1 -
 net/tap-solaris.c                          |   1 -
 net/tap-win32.c                            |   1 -
 net/tap.c                                  |   1 -
 net/vde.c                                  |   1 -
 os-posix.c                                 |   1 -
 os-win32.c                                 |  10 --
 page-vary-common.c                         |   1 -
 page-vary.c                                |   2 +-
 qemu-img.c                                 |   1 +
 qga/commands-posix.c                       |  25 ++--
 qga/main.c                                 |   7 +-
 qobject/qbool.c                            |   5 +
 qobject/qdict.c                            |   5 +
 qobject/qlist.c                            |   5 +
 qobject/qnull.c                            |   5 +
 qobject/qnum.c                             |   5 +
 qobject/qstring.c                          |   5 +
 softmmu/cpu-throttle.c                     |   1 -
 softmmu/cpu-timers.c                       |   1 -
 softmmu/cpus.c                             |   1 -
 softmmu/datadir.c                          |   1 -
 softmmu/icount.c                           |   1 -
 softmmu/main.c                             |  25 ++--
 softmmu/memory.c                           |   2 +-
 softmmu/physmem.c                          |   8 +-
 softmmu/qtest.c                            |   2 +-
 softmmu/runstate.c                         |   1 -
 softmmu/vl.c                               |   1 +
 stubs/get-vm-name.c                        |   2 +-
 stubs/monitor-core.c                       |   1 -
 target/alpha/translate.c                   |   2 +-
 target/arm/cpu.c                           |   4 +-
 target/arm/crypto_helper.c                 |   2 +-
 target/arm/helper.c                        |   2 +-
 target/arm/hvf/hvf.c                       |   1 -
 target/arm/kvm.c                           |   1 -
 target/arm/kvm64.c                         |   5 +-
 target/arm/neon_helper.c                   |   2 +-
 target/arm/sve_helper.c                    |   4 +-
 target/arm/translate-sve.c                 |   6 +-
 target/arm/translate-vfp.c                 |   2 +-
 target/arm/translate.c                     |   2 +-
 target/hexagon/gdbstub.c                   |   1 -
 target/hppa/translate.c                    |   2 +-
 target/i386/hax/hax-all.c                  |   1 -
 target/i386/hax/hax-mem.c                  |  10 +-
 target/i386/hvf/hvf.c                      |   1 -
 target/i386/hvf/x86.c                      |   1 -
 target/i386/hvf/x86_cpuid.c                |   1 -
 target/i386/hvf/x86_decode.c               |   1 -
 target/i386/hvf/x86_descr.c                |   1 -
 target/i386/hvf/x86_emu.c                  |   1 -
 target/i386/hvf/x86_flags.c                |   1 -
 target/i386/hvf/x86_mmu.c                  |   1 -
 target/i386/hvf/x86_task.c                 |   1 -
 target/i386/hvf/x86hvf.c                   |   1 -
 target/i386/kvm/sev-stub.c                 |   1 -
 target/i386/nvmm/nvmm-all.c                |   9 +-
 target/i386/tcg/translate.c                |   2 +-
 target/i386/whpx/whpx-all.c                |   9 +-
 target/i386/whpx/whpx-apic.c               |   1 -
 target/mips/cpu.c                          |   4 +-
 target/mips/kvm.c                          |   1 -
 target/mips/tcg/lmmi_helper.c              |   2 +-
 target/mips/tcg/msa_helper.c               |  64 +++++-----
 target/nios2/nios2-semi.c                  |   1 -
 target/ppc/arch_dump.c                     |   2 +-
 target/ppc/cpu_init.c                      |   2 +-
 target/ppc/gdbstub.c                       |   4 +-
 target/ppc/int_helper.c                    |  22 ++--
 target/ppc/kvm.c                           |   7 +-
 target/ppc/mem_helper.c                    |   4 +-
 target/ppc/translate.c                     |   2 +-
 target/riscv/kvm.c                         |   1 -
 target/riscv/vector_helper.c               |   2 +-
 target/rx/cpu.c                            |   1 -
 target/rx/gdbstub.c                        |   1 -
 target/s390x/kvm/kvm.c                     |   1 -
 target/s390x/tcg/translate.c               |   2 +-
 target/s390x/tcg/vec_fpu_helper.c          |   1 -
 target/s390x/tcg/vec_int_helper.c          |   1 -
 target/s390x/tcg/vec_string_helper.c       |   1 -
 target/sparc/vis_helper.c                  |   4 +-
 target/tricore/gdbstub.c                   |   1 -
 target/xtensa/core-de233_fpu.c             |   1 -
 target/xtensa/core-dsp3400.c               |   1 -
 target/xtensa/core-test_mmuhifi_c3.c       |   1 -
 target/xtensa/translate.c                  |   6 +-
 tcg/region.c                               |   8 +-
 tcg/tcg-op.c                               |   4 +-
 tcg/tcg.c                                  |  12 +-
 tcg/tci.c                                  |   1 -
 tests/qtest/acpi-utils.c                   |   1 -
 tests/qtest/ahci-test.c                    |   1 -
 tests/qtest/aspeed_hace-test.c             |   1 -
 tests/qtest/bios-tables-test.c             |   1 -
 tests/qtest/boot-sector.c                  |   1 -
 tests/qtest/cpu-plug-test.c                |   1 -
 tests/qtest/dbus-display-test.c            |   1 -
 tests/qtest/dbus-vmstate-test.c            |   1 -
 tests/qtest/device-introspect-test.c       |   1 -
 tests/qtest/e1000e-test.c                  |   2 -
 tests/qtest/erst-test.c                    |   1 -
 tests/qtest/fdc-test.c                     |   1 -
 tests/qtest/fuzz/qos_fuzz.c                |   1 -
 tests/qtest/hd-geo-test.c                  |   1 -
 tests/qtest/ide-test.c                     |   1 -
 tests/qtest/ipmi-bt-test.c                 |   1 -
 tests/qtest/ivshmem-test.c                 |   1 -
 tests/qtest/libqos/ahci.c                  |   1 -
 tests/qtest/libqos/malloc-pc.c             |   2 -
 tests/qtest/libqos/malloc-spapr.c          |   2 -
 tests/qtest/libqos/malloc.c                |   1 -
 tests/qtest/libqtest.c                     |   1 -
 tests/qtest/machine-none-test.c            |   1 -
 tests/qtest/npcm7xx_emc-test.c             |   1 -
 tests/qtest/npcm7xx_rng-test.c             |   2 +-
 tests/qtest/pxe-test.c                     |   1 -
 tests/qtest/qom-test.c                     |   1 -
 tests/qtest/rtl8139-test.c                 |   1 -
 tests/qtest/test-filter-mirror.c           |   1 -
 tests/qtest/test-filter-redirector.c       |   1 -
 tests/qtest/test-x86-cpuid-compat.c        |   1 -
 tests/qtest/vhost-user-blk-test.c          |   2 +-
 tests/qtest/virtio-blk-test.c              |   2 +-
 tests/qtest/virtio-net-test.c              |   1 -
 tests/unit/check-qjson.c                   |   1 -
 tests/unit/check-qnull.c                   |   1 -
 tests/unit/check-qnum.c                    |   1 -
 tests/unit/check-qobject.c                 | 128 ++++++-------------
 tests/unit/check-qstring.c                 |   1 -
 tests/unit/socket-helpers.c                |   1 -
 tests/unit/test-clone-visitor.c            |   1 -
 tests/unit/test-forward-visitor.c          |   1 -
 tests/unit/test-iov.c                      |   1 -
 tests/unit/test-logging.c                  |   1 -
 tests/unit/test-qmp-event.c                |   1 -
 tests/unit/test-qobject-input-visitor.c    |   1 -
 tests/unit/test-qobject-output-visitor.c   |   1 -
 tests/unit/test-string-input-visitor.c     |   1 -
 tests/unit/test-string-output-visitor.c    |   1 -
 tests/unit/test-thread-pool.c              |   1 -
 tests/unit/test-util-sockets.c             |   1 -
 tests/unit/test-visitor-serialization.c    |   1 -
 tests/unit/test-xbzrle.c                   |   1 -
 tests/vhost-user-bridge.c                  |   8 +-
 ui/gtk-clipboard.c                         |   1 -
 ui/keymaps.c                               |   1 -
 ui/vdagent.c                               |   3 +-
 ui/vnc-clipboard.c                         |   1 -
 ui/vnc-enc-tight.c                         |   2 +-
 ui/vnc.c                                   |   3 +-
 util/aio-win32.c                           |   1 -
 util/bitmap.c                              |   2 +-
 util/coroutine-sigaltstack.c               |   1 -
 util/coroutine-win32.c                     |   1 -
 util/cutils.c                              |  22 +---
 util/{qemu-error.c => error-report.c}      |  19 ++-
 util/event_notifier-posix.c                |   1 -
 util/event_notifier-win32.c                |   1 -
 util/hexdump.c                             |   2 +-
 util/host-utils.c                          |   2 +-
 util/iov.c                                 |   1 -
 util/mmap-alloc.c                          |  10 +-
 util/osdep.c                               |   5 +-
 util/oslib-posix.c                         |  24 +++-
 util/oslib-win32.c                         |   3 +-
 util/pagesize.c                            |  18 ---
 util/qemu-coroutine-io.c                   |   1 -
 util/qemu-openpty.c                        | 139 ---------------------
 util/qemu-progress.c                       |   2 +-
 util/qemu-sockets.c                        |   1 -
 util/qemu-thread-win32.c                   |   1 -
 util/vfio-helpers.c                        |  14 +--
 target/ppc/translate/vmx-impl.c.inc        |   4 +-
 target/ppc/translate/vsx-impl.c.inc        |   2 +-
 target/riscv/insn_trans/trans_rvv.c.inc    |   4 +-
 target/s390x/tcg/translate_vx.c.inc        |   2 +-
 tcg/aarch64/tcg-target.c.inc               |   4 +-
 tcg/arm/tcg-target.c.inc                   |   4 +-
 tcg/mips/tcg-target.c.inc                  |   2 +-
 tcg/ppc/tcg-target.c.inc                   |  10 +-
 tcg/riscv/tcg-target.c.inc                 |   4 +-
 chardev/meson.build                        |   4 +-
 scripts/checkpatch.pl                      |   4 +-
 target/xtensa/import_core.sh               |   1 -
 tests/meson.build                          |   2 -
 tests/tcg/xtensa/Makefile.softmmu-target   |   2 +-
 tests/unit/meson.build                     |   2 +-
 ui/cocoa.m                                 |   1 +
 util/meson.build                           |  10 +-
 473 files changed, 921 insertions(+), 1176 deletions(-)
 create mode 100644 include/qemu-main.h
 create mode 100644 include/qemu/cpu-float.h
 create mode 100644 include/qemu/qemu-progress.h
 rename util/{qemu-error.c => error-report.c} (96%)
 delete mode 100644 util/pagesize.c
 delete mode 100644 util/qemu-openpty.c

-- 
2.35.1.273.ge6ebfd0e8cbb


