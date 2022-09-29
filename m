Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8A5EF41E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:17:44 +0200 (CEST)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrXn-0007jx-PM
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrLy-0000gf-6f
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1odrLv-0001tq-7A
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dDxKdmViLLrMvXowr/tH7isEkRcvnMhmdwvFU1x0fcU=;
 b=B7VX1T8OiKQ+s1wViquMdF5jbL2ELucD0Dr4jOB7xPOEkGltcrQpkQo2gCftQEDWk0jcGm
 0DfAPhyxzgdOHAgbgSUgm54yus5wCGzRzrFQ+8G5XmVSknTYl8RR2e7EnChe9z4112GV4M
 /gmWfUznC23meMJTJpwweYn9dj7bxoA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-kcFv3xVGMgecFbg4Gu35oA-1; Thu, 29 Sep 2022 07:05:12 -0400
X-MC-Unique: kcFv3xVGMgecFbg4Gu35oA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ACC4185A7A3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 11:05:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40AEC492CA2;
 Thu, 29 Sep 2022 11:05:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 0/8] chardev patches
Date: Thu, 29 Sep 2022 15:05:00 +0400
Message-Id: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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

The following changes since commit dbc4f48b5ab3e6d85f78aa4df6bd6ad561c3d152:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-09-27 11:08:36 -0400)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/char-pull-request

for you to fetch changes up to 9cbda7b354389e536d546cc2091365bc402b3206:

  vhost-user: Call qemu_socketpair() instead of socketpair() (2022-09-29 14:38:05 +0400)

----------------------------------------------------------------
chardev related patches

----------------------------------------------------------------

Arwed Meyer (5):
  msmouse: Handle mouse reset
  chardev: src buffer const for write functions
  msmouse: Use fifo8 instead of array
  msmouse: Add pnp data
  serial: Allow unaligned i/o access

Guoyi Tu (2):
  oslib-posix: Introduce qemu_socketpair()
  vhost-user: Call qemu_socketpair() instead of socketpair()

Maksim Davydov (1):
  chardev: fix segfault in finalize

 include/chardev/char.h      |   4 +-
 include/qemu/sockets.h      |  18 +++++
 include/sysemu/replay.h     |   2 +-
 chardev/char.c              |   4 +-
 chardev/msmouse.c           | 152 ++++++++++++++++++++++++++++++------
 chardev/wctablet.c          |   4 +-
 hw/char/serial.c            |   3 +
 hw/display/vhost-user-gpu.c |   3 +-
 hw/virtio/vhost-user.c      |   2 +-
 replay/replay-char.c        |   2 +-
 stubs/replay-tools.c        |   2 +-
 util/oslib-posix.c          |  19 +++++
 12 files changed, 179 insertions(+), 36 deletions(-)

-- 
2.37.3


