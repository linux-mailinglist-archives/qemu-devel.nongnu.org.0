Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81CE5363A3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 15:58:30 +0200 (CEST)
Received: from localhost ([::1]:49994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuaU1-0004u7-Dr
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 09:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nuaQp-000209-3I
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nuaQj-0000WY-M3
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653659704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OL6/PhVjZTNQa37/GvMrMjZWdUMZ4jncl/OWYlatQp8=;
 b=PKwxe77ILUXdIN85Vf8enwe+FOsBwSpqNK9g2oK+1hTs3uFwnnlUuc5HfuohOGS3zugN/7
 RqS9O6GU7WmheIAybpDv6dSQZA6V7MNFEUxS1d0JkYmDiJgMBYdyUR+36gndd8ljSxTEiw
 6aBV2KXm7JxCsbw7Tm80vZVFBvzh1Z8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-ZnvVblX0MLiXTl2al1Smlg-1; Fri, 27 May 2022 09:55:01 -0400
X-MC-Unique: ZnvVblX0MLiXTl2al1Smlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6C913810785;
 Fri, 27 May 2022 13:55:00 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719892166B26;
 Fri, 27 May 2022 13:55:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Michael Roth <michael.roth@amd.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 00/15] Misc patches
Date: Fri, 27 May 2022 15:54:44 +0200
Message-Id: <20220527135459.117877-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 2417cbd5916d043e0c56408221fbe9935d0bc8da:

  Merge tag 'ak-pull-request' of https://gitlab.com/berrange/qemu into staging (2022-05-26 07:00:04 -0700)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/misc-pull-request

for you to fetch changes up to 71a56d6afc28b4175fedb0892e088e67f1d603f1:

  test/qga: use g_auto wherever sensible (2022-05-27 15:40:20 +0200)

----------------------------------------------------------------
Misc cleanups

Mostly qemu-ga related cleanups.

----------------------------------------------------------------

Marc-André Lureau (15):
  include: move qemu_*_exec_dir() to cutils
  util/win32: simplify qemu_get_local_state_dir()
  tests: make libqmp buildable for win32
  qga: flatten safe_open_or_create()
  qga: add qga_open_cloexec() helper
  qga: use qga_open_cloexec() for safe_open_or_create()
  qga: throw an Error in ga_channel_open()
  qga: replace qemu_open_old() with qga_open_cloexec()
  qga: make build_fs_mount_list() return a bool
  test/qga: use G_TEST_DIR to locate os-release test file
  qga/wixl: prefer variables over environment
  qga/wixl: require Mingw_bin
  qga/wixl: simplify some pre-processing
  qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir
  test/qga: use g_auto wherever sensible

 configure                            |   9 +-
 meson.build                          |   5 +-
 include/qemu/cutils.h                |   7 ++
 include/qemu/osdep.h                 |   8 --
 qga/cutils.h                         |   8 ++
 tests/qtest/libqmp.h                 |   2 +
 qemu-io.c                            |   1 +
 qga/channel-posix.c                  |  55 +++++-----
 qga/commands-posix.c                 | 154 +++++++++++++--------------
 qga/cutils.c                         |  33 ++++++
 storage-daemon/qemu-storage-daemon.c |   1 +
 tests/qtest/fuzz/fuzz.c              |   1 +
 tests/qtest/libqmp.c                 |  34 +++++-
 tests/unit/test-qga.c                | 130 ++++++++--------------
 util/cutils.c                        | 108 +++++++++++++++++++
 util/oslib-posix.c                   |  81 --------------
 util/oslib-win32.c                   |  53 +--------
 qga/installer/qemu-ga.wxs            |  83 +++++----------
 qga/meson.build                      |  12 +--
 19 files changed, 385 insertions(+), 400 deletions(-)
 create mode 100644 qga/cutils.h
 create mode 100644 qga/cutils.c

-- 
2.36.1


