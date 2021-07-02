Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E957E3BA155
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:41:25 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJQ4-00005J-V0
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLj-0002yT-Gp
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:55 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLi-00045f-2Y
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:55 -0400
Received: by mail-wm1-x32b.google.com with SMTP id o22so6720717wms.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XwdyHylrd/DY/3JN/AT1x4i76a7V8lVv7L0SE4yhb+8=;
 b=jl0o0fTbk8q3CAt3kGKAB9Lj9peuWAf3NZwq1Me7vOqkOqCOiStrBKAf2O9c4J3TMT
 NNfpHuFlzE7SPxFdLRxl+3wwnELXmabRM5k4tFmmSyS+i+mdrWuaoaI3e+/6mFyziqHL
 N6eX3VAKaFId3QNBjMEShvPART/ckOO9W1n4hpGGqeUN23wqAYtj61ppiR6cbhVqUcFh
 K8NZcBCLmXMsYaBTV5MTcnpkF3XEgW6alWfgeztUEGTcdKdu+gUPIhMnL8yTLdyievNG
 8feJsb+it9KO0aZnOBCEnFSYfqBJ4lVUFNOFcuaZeBdXxYxCDhgKHBkAyK9gaUIz/mVr
 0v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XwdyHylrd/DY/3JN/AT1x4i76a7V8lVv7L0SE4yhb+8=;
 b=V9VF9goSvXAw+hr+HPmtD+B1gbU1HhDBTtJePLmfDrv482+2dIGE/r+wjbbwBVEk6C
 Xzrjla641rgPT9P3FFU1Zlshf6SNDEAIwpaxlPyZbkV/oWH0T5lew6PC4wlJW40u46EC
 gn2axbtp/YzGaKC/tRQZOpGXkru1F1pubb3shKAZXrP3npAdPZ4EjinuXRDHriyOVkh9
 hVfsHLkmB0t+JOSQVTve8IK3yFKFDIJqbk0fjkJoxrk/qe65GJzaL7jyQJbSAlNKwmkc
 x8z7aPR0pJr0ooEXsllCcFKRsy0FcWniHShjNeHwJ7RVrDh/eG/lF7224b3x2fRh/KNZ
 gKBg==
X-Gm-Message-State: AOAM531yy1sBWajdRVDFv8FQjn0ErMDqP91Yh5T3dOXOqjCYXnrtBFw+
 ReZGX3r0dh2xsWp3xY6VSrYGNs3tXq5XkXTf
X-Google-Smtp-Source: ABdhPJysDHPTWOwBXvPfMpqRnbPOiI97Z8Vbsvf3BMYDzA402TkjIFW8qN12ZPf5RgjZOshZhSISmQ==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr5641411wmm.10.1625233012619; 
 Fri, 02 Jul 2021 06:36:52 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id r16sm3912571wrx.63.2021.07.02.06.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:36:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] g364fb: add VMStateDescription for G364SysBusState
Date: Fri,  2 Jul 2021 15:35:48 +0200
Message-Id: <20210702133557.60317-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Currently when QEMU attempts to migrate the MIPS magnum machine it crashes due
to a mistake in the g364fb VMStateDescription configuration which expects a
G364SysBusState and not a G364State.

Resolve the issue by adding a new VMStateDescription for G364SysBusState and
embedding the existing vmstate_g364fb VMStateDescription inside it using
VMSTATE_STRUCT.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 97a3f6ffbba ("g364fb: convert to qdev")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625163554.14879-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/g364fb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 87effbf2b0f..caca86d7738 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -517,6 +517,16 @@ static Property g364fb_sysbus_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static const VMStateDescription vmstate_g364fb_sysbus = {
+    .name = "g364fb-sysbus",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(g364, G364SysBusState, 2, vmstate_g364fb, G364State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void g364fb_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -525,7 +535,7 @@ static void g364fb_sysbus_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->desc = "G364 framebuffer";
     dc->reset = g364fb_sysbus_reset;
-    dc->vmsd = &vmstate_g364fb;
+    dc->vmsd = &vmstate_g364fb_sysbus;
     device_class_set_props(dc, g364fb_sysbus_properties);
 }
 
-- 
2.31.1


