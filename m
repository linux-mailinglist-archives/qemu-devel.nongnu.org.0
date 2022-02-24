Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2384C3500
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:47:29 +0100 (CET)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJ9D-0003A3-Vk
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:47:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNIzb-0008Sw-V7
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:37:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNIzX-0003EM-Op
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ra9/VksLqOX52lg6wn9OeJIwPpklxLbiHNk9U+dyIWM=;
 b=XAi336qQ1lsLhN8O4tweA0FphqI1AHsXRQvv4pUUS1GcEmyGD35pwFSb51j3hctz52ySJ+
 nqlbCULWJBcZCJHKFC8vcRNWjeX0GvqeMusdJ3DVhdGexH1eXzlN46qLbmWvgKcfAnCvJB
 tCX1B0jKom4uP4fadwNhawNc9eqrj8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-jw7KgMfMMDKuCtXFAi8pBw-1; Thu, 24 Feb 2022 13:37:19 -0500
X-MC-Unique: jw7KgMfMMDKuCtXFAi8pBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB06B801AAD;
 Thu, 24 Feb 2022 18:37:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05C3787533;
 Thu, 24 Feb 2022 18:37:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] Misc cleanups
Date: Thu, 24 Feb 2022 22:36:49 +0400
Message-Id: <20220224183701.608720-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
A small collection of patches gleaned while working on different things (mo=
re=0D
specifically, I am looking at making qapi code usable outside of qemu, many=
=0D
things are twisted together, it takes effort but it is hopefully worth it)=
=0D
=0D
Based-on: <20220222194008.610377-1-marcandre.lureau@redhat.com>=0D
=0D
Marc-Andr=C3=A9 Lureau (12):=0D
  compiler.h: replace QEMU_WARN_UNUSED_RESULT with=0D
    G_GNUC_WARN_UNUSED_RESULT=0D
  compiler.h: replace QEMU_SENTINEL with G_GNUC_NULL_TERMINATED=0D
  osdep.h: move qemu_build_not_reached()=0D
  compiler.h: replace QEMU_NORETURN with G_NORETURN=0D
  compiler.h: drop __printf__ macro MinGW/glib workaround=0D
  Replace config-time define HOST_WORDS_BIGENDIAN=0D
  Simplify HOST_LONG_BITS=0D
  Move HOST_LONG_BITS to compiler.h=0D
  scripts/modinfo-collect: remove unused/dead code=0D
  util: remove needless includes=0D
  util: remove the net/net.h dependency=0D
  qapi: remove needless include=0D
=0D
 meson.build                             |  1 -=0D
 accel/tcg/atomic_template.h             |  4 +-=0D
 accel/tcg/internal.h                    |  3 +-=0D
 audio/audio.h                           |  2 +-=0D
 hw/display/pl110_template.h             |  6 +--=0D
 hw/net/can/ctucan_core.h                |  2 +-=0D
 hw/net/vmxnet3.h                        |  4 +-=0D
 include/exec/cpu-all.h                  |  4 +-=0D
 include/exec/cpu-common.h               |  2 +-=0D
 include/exec/exec-all.h                 | 20 ++++-----=0D
 include/exec/helper-head.h              |  2 +-=0D
 include/exec/memop.h                    |  2 +-=0D
 include/exec/memory.h                   |  2 +-=0D
 include/fpu/softfloat-types.h           |  2 +-=0D
 include/glib-compat.h                   |  4 ++=0D
 include/hw/core/cpu.h                   |  4 +-=0D
 include/hw/core/tcg-cpu-ops.h           |  6 +--=0D
 include/hw/hw.h                         |  2 +-=0D
 include/hw/i386/intel_iommu.h           |  6 +--=0D
 include/hw/i386/x86-iommu.h             |  4 +-=0D
 include/hw/virtio/virtio-access.h       |  6 +--=0D
 include/hw/virtio/virtio-gpu-bswap.h    |  2 +-=0D
 include/libdecnumber/dconfig.h          |  2 +-=0D
 include/net/eth.h                       |  2 +-=0D
 include/qemu-common.h                   |  3 +-=0D
 include/qemu/bswap.h                    |  8 ++--=0D
 include/qemu/compiler.h                 | 35 +++-------------=0D
 include/qemu/host-utils.h               |  2 +-=0D
 include/qemu/int128.h                   |  2 +-=0D
 include/qemu/osdep.h                    | 25 +++++++-----=0D
 include/qemu/range.h                    |  4 +-=0D
 include/qemu/thread.h                   |  2 +-=0D
 include/qom/object.h                    |  6 +--=0D
 include/tcg/tcg-ldst.h                  |  4 +-=0D
 include/tcg/tcg.h                       |  2 +-=0D
 include/ui/qemu-pixman.h                |  2 +-=0D
 linux-user/user-internals.h             |  2 +-=0D
 net/util.h                              |  2 +-=0D
 scripts/cocci-macro-file.h              |  6 +--=0D
 target/alpha/cpu.h                      | 10 ++---=0D
 target/arm/cpu.h                        |  8 ++--=0D
 target/arm/internals.h                  | 12 +++---=0D
 target/arm/translate-a64.h              |  2 +-=0D
 target/arm/vec_internal.h               |  2 +-=0D
 target/hppa/cpu.h                       |  2 +-=0D
 target/i386/cpu.h                       |  2 +-=0D
 target/i386/tcg/helper-tcg.h            | 24 +++++------=0D
 target/microblaze/cpu.h                 |  6 +--=0D
 target/mips/cpu.h                       |  2 +-=0D
 target/mips/tcg/tcg-internal.h          | 16 ++++----=0D
 target/nios2/cpu.h                      |  6 +--=0D
 target/openrisc/exception.h             |  2 +-=0D
 target/ppc/cpu.h                        | 16 ++++----=0D
 target/ppc/internal.h                   |  6 +--=0D
 target/riscv/cpu.h                      | 10 ++---=0D
 target/s390x/s390x-internal.h           |  6 +--=0D
 target/s390x/tcg/tcg_s390x.h            | 12 +++---=0D
 target/s390x/tcg/vec.h                  |  2 +-=0D
 target/sh4/cpu.h                        |  6 +--=0D
 target/sparc/cpu.h                      | 10 ++---=0D
 target/xtensa/cpu.h                     |  4 +-=0D
 tests/fp/platform.h                     |  4 +-=0D
 accel/kvm/kvm-all.c                     |  4 +-=0D
 accel/stubs/tcg-stub.c                  |  4 +-=0D
 audio/dbusaudio.c                       |  2 +-=0D
 block/qcow2-refcount.c                  | 20 ++++-----=0D
 bsd-user/signal.c                       |  2 +-=0D
 disas.c                                 |  2 +-=0D
 hw/core/loader.c                        |  4 +-=0D
 hw/display/artist.c                     |  6 +--=0D
 hw/display/pxa2xx_lcd.c                 |  2 +-=0D
 hw/display/vga.c                        | 12 +++---=0D
 hw/display/virtio-gpu-gl.c              |  2 +-=0D
 hw/misc/mips_itu.c                      |  2 +-=0D
 hw/s390x/event-facility.c               |  2 +-=0D
 hw/virtio/vhost.c                       |  2 +-=0D
 linux-user/arm/nwfpe/double_cpdo.c      |  4 +-=0D
 linux-user/arm/nwfpe/fpa11_cpdt.c       |  4 +-=0D
 linux-user/ppc/signal.c                 |  3 +-=0D
 linux-user/signal.c                     |  2 +-=0D
 linux-user/syscall.c                    |  6 +--=0D
 monitor/hmp.c                           |  2 +-=0D
 net/announce.c                          | 13 ++++++=0D
 net/net.c                               |  4 +-=0D
 qapi/qmp-dispatch.c                     |  1 -=0D
 qemu-img.c                              |  9 +++--=0D
 target/alpha/helper.c                   | 10 ++---=0D
 target/alpha/translate.c                |  2 +-=0D
 target/arm/crypto_helper.c              |  2 +-=0D
 target/arm/helper.c                     |  2 +-=0D
 target/arm/kvm64.c                      |  4 +-=0D
 target/arm/neon_helper.c                |  2 +-=0D
 target/arm/pauth_helper.c               |  4 +-=0D
 target/arm/sve_helper.c                 |  4 +-=0D
 target/arm/tlb_helper.c                 |  6 +--=0D
 target/arm/translate-sve.c              |  6 +--=0D
 target/arm/translate-vfp.c              |  2 +-=0D
 target/arm/translate.c                  |  2 +-=0D
 target/hexagon/op_helper.c              |  8 ++--=0D
 target/hppa/cpu.c                       |  2 +-=0D
 target/hppa/op_helper.c                 |  4 +-=0D
 target/hppa/translate.c                 |  2 +-=0D
 target/i386/tcg/bpt_helper.c            |  2 +-=0D
 target/i386/tcg/excp_helper.c           | 30 +++++++-------=0D
 target/i386/tcg/misc_helper.c           |  6 +--=0D
 target/i386/tcg/sysemu/misc_helper.c    |  6 +--=0D
 target/i386/tcg/translate.c             |  2 +-=0D
 target/mips/tcg/lmmi_helper.c           |  2 +-=0D
 target/mips/tcg/msa_helper.c            | 54 ++++++++++++-------------=0D
 target/openrisc/exception.c             |  2 +-=0D
 target/openrisc/exception_helper.c      |  2 +-=0D
 target/ppc/arch_dump.c                  |  2 +-=0D
 target/ppc/int_helper.c                 | 22 +++++-----=0D
 target/ppc/kvm.c                        |  4 +-=0D
 target/ppc/mem_helper.c                 |  2 +-=0D
 target/riscv/op_helper.c                |  4 +-=0D
 target/riscv/vector_helper.c            |  2 +-=0D
 target/rx/op_helper.c                   | 20 ++++-----=0D
 target/s390x/tcg/excp_helper.c          | 20 ++++-----=0D
 target/s390x/tcg/translate.c            |  2 +-=0D
 target/sh4/op_helper.c                  |  4 +-=0D
 target/sparc/mmu_helper.c               |  8 ++--=0D
 target/sparc/vis_helper.c               |  4 +-=0D
 target/tricore/op_helper.c              |  2 +-=0D
 tcg/tcg-op.c                            |  4 +-=0D
 tcg/tcg.c                               | 14 +++----=0D
 tests/fp/fp-bench.c                     |  2 +-=0D
 tests/fp/fp-test.c                      |  2 +-=0D
 tests/qtest/vhost-user-blk-test.c       |  2 +-=0D
 tests/qtest/virtio-blk-test.c           |  2 +-=0D
 ui/vdagent.c                            |  2 +-=0D
 ui/vnc.c                                |  2 +-=0D
 util/bitmap.c                           |  2 +-=0D
 util/cutils.c                           | 16 --------=0D
 util/host-utils.c                       |  2 +-=0D
 target/ppc/translate/vmx-impl.c.inc     |  4 +-=0D
 target/ppc/translate/vsx-impl.c.inc     |  2 +-=0D
 target/riscv/insn_trans/trans_rvv.c.inc |  4 +-=0D
 target/s390x/tcg/translate_vx.c.inc     |  2 +-=0D
 tcg/aarch64/tcg-target.c.inc            |  4 +-=0D
 tcg/arm/tcg-target.c.inc                |  4 +-=0D
 tcg/mips/tcg-target.c.inc               |  2 +-=0D
 tcg/ppc/tcg-target.c.inc                | 10 ++---=0D
 tcg/riscv/tcg-target.c.inc              |  4 +-=0D
 scripts/checkpatch.pl                   |  6 +--=0D
 scripts/modinfo-collect.py              |  5 ---=0D
 146 files changed, 410 insertions(+), 434 deletions(-)=0D
=0D
--=20=0D
2.35.1.273.ge6ebfd0e8cbb=0D
=0D


