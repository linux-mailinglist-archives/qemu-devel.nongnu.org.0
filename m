Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC12721F6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 13:12:11 +0200 (CEST)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKJjt-0002VY-Ok
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 07:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKJha-00013X-EX
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 07:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKJhW-0006Sb-3f
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 07:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600686579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDFe6uG1hTBeYm4keIn1qKro+OHwiLWWlPCe18C7lNc=;
 b=JZjCi3NzfkTd8AWvKCoVpYArJkzf07B2HFKoVxVPOYqMsl7hms/jh+QM+jFZrTWzMBiUp5
 r6hO5M+/cKlk7GfLnlVSndqYJ10k4vbFU5QDH2/22fi5NJsAL6EMoUDsKkyek2opqr0Kn9
 LW5REKwKIKKsHqiFwjutOkbVDlzCV8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-D87dqLCTNou3PQeenXAqBg-1; Mon, 21 Sep 2020 07:09:35 -0400
X-MC-Unique: D87dqLCTNou3PQeenXAqBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB4D91017DE9;
 Mon, 21 Sep 2020 11:09:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A5A319C4F;
 Mon, 21 Sep 2020 11:09:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3644E16E16; Mon, 21 Sep 2020 13:09:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] hw/input/tsc2xxx: Reduce MouseTransformInfo structure
 exposure
Date: Mon, 21 Sep 2020 13:09:29 +0200
Message-Id: <20200921110929.7410-2-kraxel@redhat.com>
In-Reply-To: <20200921110929.7410-1-kraxel@redhat.com>
References: <20200921110929.7410-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit a5d7eb6534a ("Add TSC2301 touchscreen & keypad controller")
added the MouseTransformInfo declaration in "ui/console.h",
however it is only used in "hw/input/tsc2xxx.h".
Reduce the structure exposure by moving it to the single include
where it is used.

This should fix a build failure on OpenBSD:

  In file included from hw/arm/nseries.c:30:
  In file included from include/hw/arm/omap.h:24:
  In file included from include/hw/input/tsc2xxx.h:14:
  include/ui/console.h:11:11: fatal error: 'epoxy/gl.h' file not found
  # include <epoxy/gl.h>
            ^~~~~~~~~~~~
  1 error generated.
  gmake: *** [Makefile.ninja:1735:
  libqemu-aarch64-softmmu.fa.p/hw_arm_nseries.c.o] Error 1

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20200907010155.815131-1-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/input/tsc2xxx.h | 8 +++++++-
 include/ui/console.h       | 8 --------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/hw/input/tsc2xxx.h b/include/hw/input/tsc2xxx.h
index 3cd8f1bf55be..5b76ebc17761 100644
--- a/include/hw/input/tsc2xxx.h
+++ b/include/hw/input/tsc2xxx.h
@@ -11,7 +11,13 @@
 #ifndef HW_INPUT_TSC2XXX_H
 #define HW_INPUT_TSC2XXX_H
 
-#include "ui/console.h"
+typedef struct MouseTransformInfo {
+    /* Touchscreen resolution */
+    int x;
+    int y;
+    /* Calibration values as used/generated by tslib */
+    int a[7];
+} MouseTransformInfo;
 
 typedef struct uWireSlave {
     uint16_t (*receive)(void *opaque);
diff --git a/include/ui/console.h b/include/ui/console.h
index 8602203523d9..f02da5372599 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -65,14 +65,6 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *entry);
 
 void kbd_put_ledstate(int ledstate);
 
-typedef struct MouseTransformInfo {
-    /* Touchscreen resolution */
-    int x;
-    int y;
-    /* Calibration values as used/generated by tslib */
-    int a[7];
-} MouseTransformInfo;
-
 void hmp_mouse_set(Monitor *mon, const QDict *qdict);
 
 /* keysym is a unicode code except for special keys (see QEMU_KEY_xxx
-- 
2.27.0


