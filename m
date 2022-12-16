Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C264F3A8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:01:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU6-00061q-0n; Fri, 16 Dec 2022 16:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITs-0005wa-LD
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITp-0000bj-Is
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b003d1e906ca23so2079437wma.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=18PIUptsG0HDozMjNUaDXZMKAMCj9HHUBMVLqT4eZ7w=;
 b=ht1iUpW1qxl9jPHRbqK1PQnKRpCmqA23TW4jbkZS3CLntLX+X822yx8MKgOZOFsX7t
 N1Ms6bz7Ib/0VNvIr7oOUGB8XV393hObh7hIDKOhFRcWTAHBaTEhvzXyJwG11vs+ezhH
 Hn+nhwotYTLK6seOWbOHkxNP4JSeiVzhP/IYFtdsyX1Mfwk0DRUfRGAu41RftL633QZs
 qQ5mzJSYGFBgmKJCSV9sSBOFZE3BGmlCxIkbZt6EB5p9b6np08+7tWxWBJ8+jimQ9/Kn
 SU4zyxsi/fplCJiDmDNW4xjECPCD5l3geHD5gtEFNKA1FrknkUzmt97mMs4cg8yKd+l9
 Vb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18PIUptsG0HDozMjNUaDXZMKAMCj9HHUBMVLqT4eZ7w=;
 b=6HICtwH96e25CTrZWX0HBHCXG8jigwzgxeF53KhJMa+DSQ0Uq1gk8e9j+fmDr8hZ19
 SbkcNfbuMdoWhbNTiMILGHUH6PLbTEDFOL9oQCw8Nb/6HIguz0mM4k7ac5hyRNJTCNa/
 4WjYunp773uDeY3dXRLgASjFlCczRFE9fu3jY+O9pFCCKDezd7KwP3XdEgXRe/MSZOQz
 DBw4bptfOyyz+EV/pbeLbH/oCCAhI2uTkQDNPtgmCBNqqmEvpdiaHgAuXyirpYdmUeab
 yyue3lEKL8kf8H/gcghmar5OJke9Ag2eO7Xkl+s38kPK1dWPB7rQiY7SY3DpSitATb5z
 a2cw==
X-Gm-Message-State: ANoB5pm8xPLsYXPemBTHqnneAjqJdeyZAMFW5tVxrGWDRAWxAN+V8GD8
 dBgJ1CyRhcT9DPJs/pFuGHj33ypEQz2KGfuF
X-Google-Smtp-Source: AA0mqf4s3MWB10jQeG8IyDx/VD6q1Hm3WSOF7LDpgn2RymngeGZKn6MGSO3GYHlyevET24pbOhXyEA==
X-Received: by 2002:a05:600c:3d8f:b0:3cf:a18d:399c with SMTP id
 bi15-20020a05600c3d8f00b003cfa18d399cmr26796086wmb.1.1671226973402; 
 Fri, 16 Dec 2022 13:42:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/36] hw/input/ps2.c: Convert TYPE_PS2_{KBD,
 MOUSE}_DEVICE to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:16 +0000
Message-Id: <20221216214244.1391647-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the child classes TYPE_PS2_KBD_DEVICE and
TYPE_PS2_MOUSE_DEVICE to the 3-phase reset system.  This allows us to
stop using the old device_class_set_parent_reset() function.

We don't need to register an 'exit' phase function for the
subclasses, because they have no work to do in that phase.  Passing
NULL to resettable_class_set_parent_phases() will result in the
parent class method being called for that phase, so we don't need to
register a function purely to chain to the parent 'exit' phase
function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221109170009.3498451-3-peter.maydell@linaro.org
---
 include/hw/input/ps2.h |  2 +-
 hw/input/ps2.c         | 31 ++++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index ff777582cd6..cd61a634c39 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -36,7 +36,7 @@
 struct PS2DeviceClass {
     SysBusDeviceClass parent_class;
 
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 /*
diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 47a5d68e300..3253ab6a92c 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1042,13 +1042,16 @@ static void ps2_common_post_load(PS2State *s)
     q->cwptr = ccount ? (q->rptr + ccount) & (PS2_BUFFER_SIZE - 1) : -1;
 }
 
-static void ps2_kbd_reset(DeviceState *dev)
+static void ps2_kbd_reset_hold(Object *obj)
 {
-    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
-    PS2KbdState *s = PS2_KBD_DEVICE(dev);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(obj);
+    PS2KbdState *s = PS2_KBD_DEVICE(obj);
 
     trace_ps2_kbd_reset(s);
-    ps2dc->parent_reset(dev);
+
+    if (ps2dc->parent_phases.hold) {
+        ps2dc->parent_phases.hold(obj);
+    }
 
     s->scan_enabled = 1;
     s->translate = 0;
@@ -1056,13 +1059,16 @@ static void ps2_kbd_reset(DeviceState *dev)
     s->modifiers = 0;
 }
 
-static void ps2_mouse_reset(DeviceState *dev)
+static void ps2_mouse_reset_hold(Object *obj)
 {
-    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
-    PS2MouseState *s = PS2_MOUSE_DEVICE(dev);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(obj);
+    PS2MouseState *s = PS2_MOUSE_DEVICE(obj);
 
     trace_ps2_mouse_reset(s);
-    ps2dc->parent_reset(dev);
+
+    if (ps2dc->parent_phases.hold) {
+        ps2dc->parent_phases.hold(obj);
+    }
 
     s->mouse_status = 0;
     s->mouse_resolution = 0;
@@ -1245,10 +1251,12 @@ static void ps2_mouse_realize(DeviceState *dev, Error **errp)
 static void ps2_kbd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
 
     dc->realize = ps2_kbd_realize;
-    device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, ps2_kbd_reset_hold, NULL,
+                                       &ps2dc->parent_phases);
     dc->vmsd = &vmstate_ps2_keyboard;
 }
 
@@ -1262,11 +1270,12 @@ static const TypeInfo ps2_kbd_info = {
 static void ps2_mouse_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
 
     dc->realize = ps2_mouse_realize;
-    device_class_set_parent_reset(dc, ps2_mouse_reset,
-                                  &ps2dc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, ps2_mouse_reset_hold, NULL,
+                                       &ps2dc->parent_phases);
     dc->vmsd = &vmstate_ps2_mouse;
 }
 
-- 
2.25.1


