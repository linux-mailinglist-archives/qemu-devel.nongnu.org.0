Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417375FC901
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:18:10 +0200 (CEST)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieQr-00007V-53
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieE8-0003Am-P3
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieE3-0005TE-CC
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665590689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UlAeU0kk5XE4TEsZVrH4G0XLRNgVrE59MG03vn6XSpo=;
 b=btDV8jthcTfL2DDCavVXreGTTmrePoGW8gRYHN3bNy5SU9NAfwyzdvA0MoXVJ/sfrkPiiV
 dpIoqZEPX5m9Hszb+61AI2YPOZyWanMUPQntWoRgT93HGmF5qYSLVmhWALnpM/F42Wv5XO
 1PoWjtWy92iNnqDDLLo2s3+qm5yqjC8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-4jfbJLHDMCe6VfzOV227Ww-1; Wed, 12 Oct 2022 12:04:48 -0400
X-MC-Unique: 4jfbJLHDMCe6VfzOV227Ww-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B461C05ACA;
 Wed, 12 Oct 2022 16:04:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F23D49BB64;
 Wed, 12 Oct 2022 16:04:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 0/7] Win32 patches
Date: Wed, 12 Oct 2022 20:04:37 +0400
Message-Id: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit ab44ea1059242ff2dbbde44e94468f6c6e5f87be:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-111022-1' of https://github.com/stsquad/qemu into staging (2022-10-11 15:31:27 -0400)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/win32-pull-request

for you to fetch changes up to 76f5148c21b4543e62a6ad605ac4b44133421401:

  tests/unit: make test-io-channel-command work on win32 (2022-10-12 19:22:01 +0400)

----------------------------------------------------------------
win32-related misc patches

----------------------------------------------------------------

Marc-André Lureau (7):
  win32: set threads name
  osdep: make readv_writev() work with partial read/write
  util: make do_send_recv work with partial send/recv
  tests/channel-helper: set blocking in main thread
  io/command: use glib GSpawn, instead of open-coding fork/exec
  io/command: implement support for win32
  tests/unit: make test-io-channel-command work on win32

 include/io/channel-command.h         |   5 +-
 io/channel-command.c                 | 185 +++++++++++----------------
 tests/unit/io-channel-helpers.c      |   9 +-
 tests/unit/test-io-channel-command.c |  37 +++---
 util/iov.c                           |  10 +-
 util/osdep.c                         |  11 +-
 util/qemu-thread-win32.c             |  54 +++++++-
 7 files changed, 171 insertions(+), 140 deletions(-)

-- 
2.37.3


