Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98632D7963
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:32:51 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkPa-0004tA-RT
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHi-0004PT-Dh
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHg-0005zM-Ig
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEsf0f+DfbeaxGosLWLxrImcvGCVpEGSYni5DdQ4U0M=;
 b=DAo9ECZNIkFm+P/CSNeraxoNQO4bUQxn8AXTxsNBHU/C6f3lBQuNbE1rF+o/3PzD+sZBo2
 XqpmzVyzsnockLEX18f2yF7M/ktt1PwFfR/gHFYXv5/ZZGztUNVCmU1ei/DwjtSS8oKSq7
 KR2tH4fC1iVv4WtJuSewbNr9SmH5T9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-qPYLt1zwPeuWlHOfJE131A-1; Fri, 11 Dec 2020 10:24:38 -0500
X-MC-Unique: qPYLt1zwPeuWlHOfJE131A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB6CB187653B;
 Fri, 11 Dec 2020 15:24:36 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B20A10016FE;
 Fri, 11 Dec 2020 15:24:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 03/12] hw/rtc/twl92230: Silence warnings about missing
 fallthrough statements
Date: Fri, 11 Dec 2020 16:24:17 +0100
Message-Id: <20201211152426.350966-4-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
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
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling with -Werror=implicit-fallthrough, gcc complains about
missing fallthrough annotations in this file. Looking at the code,
the fallthrough is indeed wanted here, but instead of adding the
annotations, it can be done more efficiently by simply calculating
the offset with a subtraction instead of increasing a local variable
one by one.

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


