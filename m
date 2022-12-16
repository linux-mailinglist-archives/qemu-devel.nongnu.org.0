Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143D64EC6C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:57:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BAo-0008AA-Fz; Fri, 16 Dec 2022 08:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAl-00089w-It
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAj-0007kE-NC
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VmP6ZxsKlacdKTimai/aBisqX2aWV6xKhzV+PdHBnjY=;
 b=AnN+fOQv/Mqq6JeoIP8COUG3rewjHYjZfKi0VzX9Yo2g1kJVFetrkgUi/Kt++MqwIiHlGf
 rcWoIW403IzGKfdsRJD7GCVvg39qFsQ/IR4tgA1yzniT18cyhPkVmnx10YjRqHt7bmZ3yQ
 DyIF0s5unev3H3SXrPjBgNVMr2JPung=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-CN_GpLrUNQW4NmUjEeY_ig-1; Fri, 16 Dec 2022 08:54:43 -0500
X-MC-Unique: CN_GpLrUNQW4NmUjEeY_ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB33A181E3F4;
 Fri, 16 Dec 2022 13:54:42 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-193-42.brq.redhat.com [10.40.193.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D323840C2005;
 Fri, 16 Dec 2022 13:54:41 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 0/8] QEMU Guest Agent misc patches
Date: Fri, 16 Dec 2022 15:54:31 +0200
Message-Id: <20221216135439.465033-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit edc93f455fa823a9a5fcb3a8da430104c7375a0a:

  Revert "hw/loongarch/virt: Add cfi01 pflash device" (2022-12-05 11:24:35 -0500)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-16

for you to fetch changes up to 10d83e7d59af4464ba4382bcbf31ed162db87656:

  qga: map GLib log levels to system levels (2022-12-16 14:24:36 +0200)

----------------------------------------------------------------
qga-pull-2022-12-16

----------------------------------------------------------------
Alexander Ivanov (2):
      qga: Move FS TRIM code to commands-linux.c
      qga: Add ZFS TRIM support for FreeBSD

Andrey Drobyshev via (3):
      qga-win: choose the right libpcre version to include in MSI package
      qga-win: add logging to Windows event log
      qga: map GLib log levels to system levels

Brad Smith (1):
      qga: Add initial OpenBSD and NetBSD support

Kfir Manor (2):
      qga:/qga-win: adding a empty PCI address creation function
      qga:/qga-win: skip getting pci info for USB disks

 configure                 |   3 ++
 meson.build               |   2 +-
 qga/commands-bsd.c        | 114 ++++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-common.h     |   1 +
 qga/commands-linux.c      |  73 +++++++++++++++++++++++++++++
 qga/commands-posix.c      |  81 +++-----------------------------
 qga/commands-win32.c      |  32 ++++++++-----
 qga/installer/qemu-ga.wxs |  17 +++++--
 qga/main.c                |  56 ++++++++++++++++++++---
 qga/meson.build           |  25 +++++++++-
 qga/messages-win32.mc     |   9 ++++
 11 files changed, 316 insertions(+), 97 deletions(-)
 create mode 100644 qga/messages-win32.mc

--
2.25.1


