Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D34C02C1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:01:58 +0100 (CET)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbMD-0001XE-MJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1W-0007lM-LK
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1T-000805-1j
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645558821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=19MmkWKyCVl6hBpUYG7+qLbSrcD3DdiIzOrJIG3SxDg=;
 b=KowzO5OVrouWn8KgXoR7X/UeT5ZPu001Q92U4DIXffH4B1+jKtLaXI7anBYYQ3OW4GJC6F
 j6s6mH52p7/K2EHI9qEHTgk/KZIVJmnO5GDtowvrQxmopnM2PpxiXLI0I7Rq8hhuDB0tpi
 ocwoApTBPgk6QB5bifHJMSKmA3I0hiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-vUEzl0UWNgCJrBsumhESvw-1; Tue, 22 Feb 2022 14:40:13 -0500
X-MC-Unique: vUEzl0UWNgCJrBsumhESvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 130251854E26;
 Tue, 22 Feb 2022 19:40:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 953D15DB81;
 Tue, 22 Feb 2022 19:40:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] Misc build fixes and cleanups
Date: Tue, 22 Feb 2022 23:40:00 +0400
Message-Id: <20220222194008.610377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
A small collection of patches gleaned while working on different things.=0D
=0D
Marc-Andr=C3=A9 Lureau (8):=0D
  meson: fix generic location of vss headers=0D
  qga/vss-win32: check old VSS SDK headers=0D
  qga/vss: update informative message about MinGW=0D
  meson: drop the .fa library suffix=0D
  meson: use chardev_ss dependencies=0D
  char: move qemu_openpty_raw from util/ to char/=0D
  Drop qemu_foo() socket API wrapper=0D
  Replace GCC_FMT_ATTR with G_GNUC_PRINTF=0D
=0D
 docs/devel/build-system.rst             |   5 -=0D
 meson.build                             |  25 ++---=0D
 audio/audio.h                           |   4 +-=0D
 block/qcow2.h                           |   2 +-=0D
 bsd-user/qemu.h                         |   2 +-=0D
 hw/display/qxl.h                        |   2 +-=0D
 hw/net/rocker/rocker.h                  |   2 +-=0D
 hw/xen/xen_pt.h                         |   2 +-=0D
 include/chardev/char-fe.h               |   2 +-=0D
 include/disas/dis-asm.h                 |   2 +-=0D
 include/hw/acpi/aml-build.h             |  12 +-=0D
 include/hw/core/cpu.h                   |   2 +-=0D
 include/hw/hw.h                         |   2 +-=0D
 include/hw/virtio/virtio.h              |   2 +-=0D
 include/hw/xen/xen-bus-helper.h         |   4 +-=0D
 include/hw/xen/xen-bus.h                |   4 +-=0D
 include/hw/xen/xen_common.h             |   2 +-=0D
 include/hw/xen/xen_pvdev.h              |   2 +-=0D
 include/monitor/monitor.h               |   4 +-=0D
 include/qapi/error.h                    |  20 ++--=0D
 include/qapi/qmp/qjson.h                |   8 +-=0D
 include/qemu-common.h                   |  21 ----=0D
 include/qemu/buffer.h                   |   2 +-=0D
 include/qemu/compiler.h                 |  11 +-=0D
 include/qemu/error-report.h             |  24 ++--=0D
 include/qemu/log-for-trace.h            |   2 +-=0D
 include/qemu/log.h                      |   2 +-=0D
 include/qemu/qemu-print.h               |   8 +-=0D
 include/qemu/readline.h                 |   2 +-=0D
 qga/guest-agent-core.h                  |   2 +-=0D
 qga/vss-win32/requester.h               |   2 +-=0D
 qga/vss-win32/vss-common.h              |   3 +-=0D
 scripts/cocci-macro-file.h              |   2 +-=0D
 tests/qtest/libqos/libqtest.h           |  42 +++----=0D
 tests/qtest/libqtest-single.h           |   2 +-=0D
 tests/qtest/migration-helpers.h         |   6 +-=0D
 audio/alsaaudio.c                       |   4 +-=0D
 audio/coreaudio.c                       |   4 +-=0D
 audio/dsoundaudio.c                     |   4 +-=0D
 audio/ossaudio.c                        |   4 +-=0D
 audio/paaudio.c                         |   2 +-=0D
 audio/sdlaudio.c                        |   2 +-=0D
 block/blkverify.c                       |   2 +-=0D
 block/ssh.c                             |   4 +-=0D
 chardev/char-pty.c                      | 104 ++++++++++++++++++=0D
 crypto/cipher-afalg.c                   |   4 +-=0D
 crypto/hash-afalg.c                     |   4 +-=0D
 fsdev/9p-marshal.c                      |   2 +-=0D
 fsdev/virtfs-proxy-helper.c             |   2 +-=0D
 gdbstub.c                               |   2 +-=0D
 hw/9pfs/9p.c                            |   2 +-=0D
 hw/acpi/aml-build.c                     |   4 +-=0D
 hw/mips/fuloong2e.c                     |   2 +-=0D
 hw/mips/malta.c                         |   2 +-=0D
 hw/net/rtl8139.c                        |   2 +-=0D
 hw/virtio/virtio.c                      |   2 +-=0D
 io/channel-socket.c                     |   6 +-=0D
 io/channel-websock.c                    |   2 +-=0D
 monitor/hmp.c                           |   4 +-=0D
 nbd/server.c                            |  10 +-=0D
 net/socket.c                            |  24 ++--=0D
 qemu-img.c                              |   4 +-=0D
 qemu-io.c                               |   2 +-=0D
 qobject/json-parser.c                   |   2 +-=0D
 softmmu/qtest.c                         |   4 +-=0D
 tests/qtest/e1000e-test.c               |   4 +-=0D
 tests/qtest/libqtest.c                  |   6 +-=0D
 tests/qtest/npcm7xx_emc-test.c          |   4 +-=0D
 tests/qtest/test-filter-mirror.c        |   4 +-=0D
 tests/qtest/test-filter-redirector.c    |   8 +-=0D
 tests/qtest/virtio-net-test.c           |  10 +-=0D
 tests/unit/socket-helpers.c             |   2 +-=0D
 tests/unit/test-qobject-input-visitor.c |   4 +-=0D
 util/osdep.c                            |   4 +-=0D
 util/qemu-openpty.c                     | 139 ------------------------=0D
 util/qemu-sockets.c                     |  10 +-=0D
 chardev/meson.build                     |   4 +-=0D
 qga/meson.build                         |   2 +-=0D
 qga/vss-win32/install.cpp               |   4 +=0D
 qga/vss-win32/provider.cpp              |   4 +=0D
 scripts/checkpatch.pl                   |   2 +-=0D
 tests/qtest/libqos/meson.build          |   1 -=0D
 util/meson.build                        |   1 -=0D
 83 files changed, 300 insertions(+), 370 deletions(-)=0D
 delete mode 100644 util/qemu-openpty.c=0D
=0D
--=20=0D
2.35.1.273.ge6ebfd0e8cbb=0D
=0D


