Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E8B48637
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 16:56:21 +0200 (CEST)
Received: from localhost ([::1]:48192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hct3Q-0005qy-VH
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsiH-0003Ud-E6
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcsiF-000829-M4
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcsiF-00080h-DW
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:34:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n4so2143580wrs.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 07:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IZG7m84aDia5PcoPZiLWtdWTRHky1075PYQvx1TM/Ro=;
 b=bx0jjlzYOlZGWOSpVSN7l/IZyY77X5UNZ11KXWVkHmmKFT22PXrybtWE+GFTtLVQAw
 kKZBb18aIFK0HlV6rQAAZfcdPlexNgY90+Au/8kRyDieyNaqeJaawQPwQQ2VA2QzdCAV
 mQNcHjbAmJgDeSov4+x5lb2JpLhBSoUtm9jPvtSda/k70wcrCP1X2DzfG1cJ1nDrulAO
 vuzpWH7BSCAS4pvnInEyVkXq46fs/yr7Hh4eq21wW4+mubEOi9jl8cfpTLAGVuk2U/rb
 8fOgktEmDBCiQ4EsIWQ/xzLnLS325mWasWm2XbOcBBba/5nWmy7ctD8nMpUpwEp4RRn1
 YZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZG7m84aDia5PcoPZiLWtdWTRHky1075PYQvx1TM/Ro=;
 b=omdCqoIakN18xdpCdIJk4ulFqYBDue+SZCmzy1YmcWdd18qCKJqu3vXCWsU1xUQoay
 7wVR3rEFs5zgQy/AtvLQ15sc00/MZFvjAlunnY+FrKNUsSqoNCIO1EEsfK9PCCKcUCN9
 kvHWEpmW7iG0QLMPHxlgLOKOTVoUlP8+XJ4BSCTclplMY5IISmxEs69q3JdbxkvMfM6g
 0yoEzOzyw68tL5LxVvOueEw9xcLo84Hydj4gztyCxAV9qRJ2OPuj9Rtv0+uFMEUYnlLo
 1bBDA/YlwxXMA+w6vupPPvkK24txpx41SYaVwhSxQL5whWbGq0KNZ/cBib3tL8EIfxQA
 BE/A==
X-Gm-Message-State: APjAAAV3RcLE0VrmKu2VoHlGUGqeSx/8VVx5tNzf4F1Wo4i3t2FvKKnz
 +KPYJbqM6tHlj5yuRviXAzYrXg83u1bR1Q==
X-Google-Smtp-Source: APXvYqxH2x0jrO40eblMwB65MixSjAk6jAs5oSXl0dU81es+y7CccYGz5FiCw12O8nCOGmrAkDlQjA==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr245608wrr.252.1560782062192; 
 Mon, 17 Jun 2019 07:34:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a67sm13819985wmh.40.2019.06.17.07.34.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 07:34:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 15:33:55 +0100
Message-Id: <20190617143412.5734-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617143412.5734-1-peter.maydell@linaro.org>
References: <20190617143412.5734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
Subject: [Qemu-devel] [PULL 07/24] hw/arm/armv7m: Forward "vfp" and "dsp"
 properties to CPU
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create "vfp" and "dsp" properties on the armv7m container object
which will be forwarded to its CPU object, so that SoCs can
configure whether the CPU has these features.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20190517174046.11146-4-peter.maydell@linaro.org
---
 include/hw/arm/armv7m.h |  4 ++++
 hw/arm/armv7m.c         | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index e96a98f8093..d2c74d3872a 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -43,6 +43,8 @@ typedef struct {
  *   devices will be automatically layered on top of this view.)
  * + Property "idau": IDAU interface (forwarded to CPU object)
  * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
+ * + Property "vfp": enable VFP (forwarded to CPU object)
+ * + Property "dsp": enable DSP (forwarded to CPU object)
  * + Property "enable-bitband": expose bitbanded IO
  */
 typedef struct ARMv7MState {
@@ -66,6 +68,8 @@ typedef struct ARMv7MState {
     uint32_t init_svtor;
     bool enable_bitband;
     bool start_powered_off;
+    bool vfp;
+    bool dsp;
 } ARMv7MState;
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 1a8a6c8bf92..b9efad6bac9 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -190,6 +190,22 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    if (object_property_find(OBJECT(s->cpu), "vfp", NULL)) {
+        object_property_set_bool(OBJECT(s->cpu), s->vfp,
+                                 "vfp", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
+    if (object_property_find(OBJECT(s->cpu), "dsp", NULL)) {
+        object_property_set_bool(OBJECT(s->cpu), s->dsp,
+                                 "dsp", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
 
     /*
      * Tell the CPU where the NVIC is; it will fail realize if it doesn't
@@ -260,6 +276,8 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
     DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
                      false),
+    DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
+    DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


