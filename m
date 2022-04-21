Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B1350A15F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:56:56 +0200 (CEST)
Received: from localhost ([::1]:38876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXIl-0005Zl-W9
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCF-0002PU-LK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCD-0005xZ-TN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uz9rYuIbm2e/lL/JR324bAfTr/8Tj+ns6X88klfTiM4=;
 b=HnPcS7Ec3vZgcq6lpMhtOJJxUnvYZd60Ift/Zfzi4D5Jrw7tZr+Y1XlcDBi3yEae/Eg1mf
 ria8z7Bn9M9cMfdC2Ff4RS9cXdcbyaU79QbxFXoctGnEy8sDUBMbeiMZ1g+0JExhSgNwno
 DDFRlRr2V7weNht6SUoeT85tkQlJ3Kc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-Lf_mhocuOVK9wlAHKmYmcg-1; Thu, 21 Apr 2022 09:50:07 -0400
X-MC-Unique: Lf_mhocuOVK9wlAHKmYmcg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA174833968;
 Thu, 21 Apr 2022 13:50:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D28057233C;
 Thu, 21 Apr 2022 13:50:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] include: rename qemu-common.h qemu/help-texts.h
Date: Thu, 21 Apr 2022 17:49:15 +0400
Message-Id: <20220421134940.2887768-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20220420132624.2439741-7-marcandre.lureau@redhat.com>
---
 include/{qemu-common.h => qemu/help-texts.h} | 0
 bsd-user/main.c                              | 2 +-
 linux-user/main.c                            | 2 +-
 qemu-img.c                                   | 2 +-
 qemu-io.c                                    | 2 +-
 qemu-nbd.c                                   | 2 +-
 qga/main.c                                   | 2 +-
 scsi/qemu-pr-helper.c                        | 2 +-
 softmmu/vl.c                                 | 2 +-
 storage-daemon/qemu-storage-daemon.c         | 2 +-
 tools/virtiofsd/passthrough_ll.c             | 2 +-
 ui/cocoa.m                                   | 2 +-
 12 files changed, 11 insertions(+), 11 deletions(-)
 rename include/{qemu-common.h => qemu/help-texts.h} (100%)

diff --git a/include/qemu-common.h b/include/qemu/help-texts.h
similarity index 100%
rename from include/qemu-common.h
rename to include/qemu/help-texts.h
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 74f2d35a5497..6f09180d6541 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -24,7 +24,7 @@
 #include <sys/sysctl.h>
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
 #include "qemu-version.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 5fb6ecac3f86..7ca48664e447 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
 #include "qemu-version.h"
diff --git a/qemu-img.c b/qemu-img.c
index ef3224a9d4a8..6337a63b3b80 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include <getopt.h>
 
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qemu/qemu-progress.h"
 #include "qemu-version.h"
 #include "qapi/error.h"
diff --git a/qemu-io.c b/qemu-io.c
index 38321a27a301..d70d3dd4fde5 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -15,7 +15,7 @@
 #include <termios.h>
 #endif
 
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qapi/error.h"
 #include "qemu-io.h"
 #include "qemu/error-report.h"
diff --git a/qemu-nbd.c b/qemu-nbd.c
index bf9c5fedceba..397ffa64d768 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -21,7 +21,7 @@
 #include <libgen.h>
 #include <pthread.h>
 
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "sysemu/block-backend.h"
diff --git a/qga/main.c b/qga/main.c
index 1deb0ee2fbfe..e4b22df01dcd 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -18,7 +18,7 @@
 #include <syslog.h>
 #include <sys/wait.h>
 #endif
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 1f2a84c53454..df493e2a503e 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -36,7 +36,7 @@
 #include <mpath_persist.h>
 #endif
 
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index f679d48d7415..2a38ebe5fbb4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "exec/cpu-common.h"
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 1398f0443d76..9b8b17f52e48 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -42,7 +42,7 @@
 #include "qapi/qmp/qstring.h"
 #include "qapi/qobject-input-visitor.h"
 
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qemu-version.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 028dacdd8f5a..b15c631ca512 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -38,7 +38,7 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "qemu-version.h"
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "fuse_virtio.h"
 #include "fuse_log.h"
 #include "fuse_lowlevel.h"
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 839ae4f58a69..68bff4ff3796 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -27,7 +27,7 @@
 #import <Cocoa/Cocoa.h>
 #include <crt_externs.h>
 
-#include "qemu-common.h"
+#include "qemu/help-texts.h"
 #include "qemu-main.h"
 #include "ui/clipboard.h"
 #include "ui/console.h"
-- 
2.36.0


