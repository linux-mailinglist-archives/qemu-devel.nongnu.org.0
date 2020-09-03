Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966525C582
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 17:37:01 +0200 (CEST)
Received: from localhost ([::1]:33722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDrIJ-0004qw-VU
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 11:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kDrHB-0003aF-IW
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:35:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:34402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kDrH6-0001kU-UY
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:35:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABD63B1AE;
 Thu,  3 Sep 2020 15:35:44 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: install ivshmem-client and ivshmem-server
Date: Thu,  3 Sep 2020 09:35:24 -0600
Message-Id: <20200903153524.98168-1-brogers@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, Bruce Rogers <brogers@suse.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn on the meson install flag for these executables

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 contrib/ivshmem-client/meson.build | 2 +-
 contrib/ivshmem-server/meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/ivshmem-client/meson.build b/contrib/ivshmem-client/meson.build
index 1b171efb4f..83a559117f 100644
--- a/contrib/ivshmem-client/meson.build
+++ b/contrib/ivshmem-client/meson.build
@@ -1,4 +1,4 @@
 executable('ivshmem-client', files('ivshmem-client.c', 'main.c'),
            dependencies: glib,
            build_by_default: targetos == 'linux',
-           install: false)
+           install: true)
diff --git a/contrib/ivshmem-server/meson.build b/contrib/ivshmem-server/meson.build
index 3a53942201..a1c39aa3b3 100644
--- a/contrib/ivshmem-server/meson.build
+++ b/contrib/ivshmem-server/meson.build
@@ -1,4 +1,4 @@
 executable('ivshmem-server', files('ivshmem-server.c', 'main.c'),
            dependencies: [qemuutil, rt],
            build_by_default: targetos == 'linux',
-           install: false)
+           install: true)
-- 
2.28.0


