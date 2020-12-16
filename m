Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7232DC571
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:37:21 +0100 (CET)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpajo-0005vE-BG
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpacs-0008Th-VE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpacp-00014m-Og
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJMktt1nQ1NlKnoOgCZyHmsz7qX8N7ctuQSuJ5wZpfM=;
 b=LPHyXQt4vTgq3P7pvWXDhu8cG/9nbLvRwCuelycZPqIKIHyFB4LVFF+afuYT/2MKNKgx2g
 qARlJ0VTT355Bwy4RkjVflhwCdRz4jjTK6vrAx8fMIIzrnzZGUyj1vee/uSsQydvYIqZB1
 h8woAIud3XL5Xz5X3ZDcovy9t14Hpd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-KMZSZWvWOQicME8NLWSc2w-1; Wed, 16 Dec 2020 12:30:02 -0500
X-MC-Unique: KMZSZWvWOQicME8NLWSc2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96AFB1005513;
 Wed, 16 Dec 2020 17:30:01 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC27010023B3;
 Wed, 16 Dec 2020 17:29:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/12] hw/rtc/twl92230: Silence warnings about missing
 fallthrough statements
Date: Wed, 16 Dec 2020 18:29:40 +0100
Message-Id: <20201216172949.57380-4-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling with -Werror=implicit-fallthrough, gcc complains about
missing fallthrough annotations in this file. Looking at the code,
the fallthrough is indeed wanted here, but instead of adding the
annotations, it can be done more efficiently by simply calculating
the offset with a subtraction instead of increasing a local variable
one by one.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201211152426.350966-4-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/rtc/twl92230.c | 43 +++++++++++++------------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index f838913b37..a787bd247d 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -271,37 +271,23 @@ static void menelaus_gpio_set(void *opaque, int line, int level)
 static uint8_t menelaus_read(void *opaque, uint8_t addr)
 {
     MenelausState *s = (MenelausState *) opaque;
-    int reg = 0;
 
     switch (addr) {
     case MENELAUS_REV:
         return 0x22;
 
-    case MENELAUS_VCORE_CTRL5: reg ++;
-    case MENELAUS_VCORE_CTRL4: reg ++;
-    case MENELAUS_VCORE_CTRL3: reg ++;
-    case MENELAUS_VCORE_CTRL2: reg ++;
-    case MENELAUS_VCORE_CTRL1:
-        return s->vcore[reg];
+    case MENELAUS_VCORE_CTRL1 ... MENELAUS_VCORE_CTRL5:
+        return s->vcore[addr - MENELAUS_VCORE_CTRL1];
 
-    case MENELAUS_DCDC_CTRL3: reg ++;
-    case MENELAUS_DCDC_CTRL2: reg ++;
-    case MENELAUS_DCDC_CTRL1:
-        return s->dcdc[reg];
-
-    case MENELAUS_LDO_CTRL8: reg ++;
-    case MENELAUS_LDO_CTRL7: reg ++;
-    case MENELAUS_LDO_CTRL6: reg ++;
-    case MENELAUS_LDO_CTRL5: reg ++;
-    case MENELAUS_LDO_CTRL4: reg ++;
-    case MENELAUS_LDO_CTRL3: reg ++;
-    case MENELAUS_LDO_CTRL2: reg ++;
-    case MENELAUS_LDO_CTRL1:
-        return s->ldo[reg];
+    case MENELAUS_DCDC_CTRL1 ... MENELAUS_DCDC_CTRL3:
+        return s->dcdc[addr - MENELAUS_DCDC_CTRL1];
+
+    case MENELAUS_LDO_CTRL1 ... MENELAUS_LDO_CTRL8:
+        return s->ldo[addr - MENELAUS_LDO_CTRL1];
 
-    case MENELAUS_SLEEP_CTRL2: reg ++;
     case MENELAUS_SLEEP_CTRL1:
-        return s->sleep[reg];
+    case MENELAUS_SLEEP_CTRL2:
+        return s->sleep[addr - MENELAUS_SLEEP_CTRL1];
 
     case MENELAUS_DEVICE_OFF:
         return 0;
@@ -395,10 +381,8 @@ static uint8_t menelaus_read(void *opaque, uint8_t addr)
     case MENELAUS_S2_PULL_DIR:
         return s->pull[3];
 
-    case MENELAUS_MCT_CTRL3: reg ++;
-    case MENELAUS_MCT_CTRL2: reg ++;
-    case MENELAUS_MCT_CTRL1:
-        return s->mmc_ctrl[reg];
+    case MENELAUS_MCT_CTRL1 ... MENELAUS_MCT_CTRL3:
+        return s->mmc_ctrl[addr - MENELAUS_MCT_CTRL1];
     case MENELAUS_MCT_PIN_ST:
         /* TODO: return the real Card Detect */
         return 0;
@@ -418,7 +402,6 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
 {
     MenelausState *s = (MenelausState *) opaque;
     int line;
-    int reg = 0;
     struct tm tm;
 
     switch (addr) {
@@ -496,9 +479,9 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
         s->ldo[7] = value & 3;
         break;
 
-    case MENELAUS_SLEEP_CTRL2: reg ++;
     case MENELAUS_SLEEP_CTRL1:
-        s->sleep[reg] = value;
+    case MENELAUS_SLEEP_CTRL2:
+        s->sleep[addr - MENELAUS_SLEEP_CTRL1] = value;
         break;
 
     case MENELAUS_DEVICE_OFF:
-- 
2.27.0


