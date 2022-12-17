Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E7C64F866
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 10:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6TAh-0005rq-DL; Sat, 17 Dec 2022 04:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TAf-0005rF-AQ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TAd-0006cT-FT
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671268068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DAu2MITSdzygQ62vSuk8WRCfih/GPhc9te9EkIw4oj0=;
 b=M+WGEE4ZdJw06xamegYmiwlnVGN+ILsgC2d53A95W++b40q2LB0VKhfgfYsO77x57G0+5j
 XtvKxtFArNHOI/B6wb35psn+NsP9ZTv7mr060UDf0Cr3o63P/t4Ms4e4FfbI91wC/7mmCg
 NfJ79G3RTog2zm67fJOzuNjlWYtmaWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-nikq27l3M3iwIVIELa2WsQ-1; Sat, 17 Dec 2022 04:07:44 -0500
X-MC-Unique: nikq27l3M3iwIVIELa2WsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449F41871D94;
 Sat, 17 Dec 2022 09:07:44 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-192-10.brq.redhat.com [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D624C40C6EC4;
 Sat, 17 Dec 2022 09:07:42 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v2 0/6] QEMU Guest Agent misc patches
Date: Sat, 17 Dec 2022 11:07:34 +0200
Message-Id: <20221217090740.522093-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

The following changes since commit d038d2645acabf6f52fd61baeaa021c3ebe97714:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2022-12-16 13:26:09 +0000)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-17

for you to fetch changes up to ea5ea85c5894ac220cdb52b3f07c6ad6e4544900:

  qga-win: choose the right libpcre version to include in MSI package (2022-12-17 10:53:38 +0200)

----------------------------------------------------------------
qga-pull-2022-12-17

v1 -> v2:
  removed 'qga: Add ZFS TRIM support for FreeBSD' series
  that failed to merge

----------------------------------------------------------------
Andrey Drobyshev via (3):
      qga-win: add logging to Windows event log
      qga: map GLib log levels to system levels
      qga-win: choose the right libpcre version to include in MSI package

Brad Smith (1):
      qga: Add initial OpenBSD and NetBSD support

Kfir Manor (2):
      qga:/qga-win: adding a empty PCI address creation function
      qga:/qga-win: skip getting pci info for USB disks

 configure                 |  3 +++
 meson.build               |  2 +-
 qga/commands-bsd.c        |  5 +++++
 qga/commands-posix.c      |  9 ++++++--
 qga/commands-win32.c      | 32 +++++++++++++++++----------
 qga/installer/qemu-ga.wxs | 17 +++++++++++---
 qga/main.c                | 56 +++++++++++++++++++++++++++++++++++++++++------
 qga/meson.build           | 25 ++++++++++++++++++++-
 qga/messages-win32.mc     |  9 ++++++++
 9 files changed, 133 insertions(+), 25 deletions(-)
 create mode 100644 qga/messages-win32.mc


--
2.25.1


