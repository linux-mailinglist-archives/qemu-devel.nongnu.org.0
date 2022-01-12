Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D904248C32B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:31:48 +0100 (CET)
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7br1-0005dx-FO
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:31:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmy-0002cp-8j
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:36 -0500
Received: from [2607:f8b0:4864:20::92f] (port=36515
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmw-0003OG-HE
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:35 -0500
Received: by mail-ua1-x92f.google.com with SMTP id r15so4128452uao.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iUUsxduOQQvdvTKron49JU4EmlWie7HnJBthT1HKNP8=;
 b=p6Cb+Bo4vA9l0QI0SE/9ZBuzLJtoD/whrPTIcZks/cpn/mvtzhiqqfaFhLFOn2s5ob
 wvqXTASphU0FtZqUygQj9dHhlnvj8T7CAPXCAAO6eR5zi00hqV0Jigv5kvlRNyF2CVlz
 1E+eGGWYvGePhdGYE0v1bVazi4kuLBDU/gvH/Sbd7MPnCjiR5xZsDeNuSb3I6LwZ/AwE
 hm1e/uz1jAFGLz7pcpInwa4XMgN53udVyDho9ookGimQc8RnHZFoesAhffQCSOAnwUek
 0nk0JUtp8Crz9Pk5kvSQKLpL7g4cadOgQBLkZvl8VK8sWcNnlHeZQ6l62eQ1d+j9W1PF
 AxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUUsxduOQQvdvTKron49JU4EmlWie7HnJBthT1HKNP8=;
 b=Mxu7ITOCVMTrKUOiw8xgMRXh0g9Ft6z0amc30uLfFStECmosFU/sLX21F12YSHt04p
 H7fxfCwi1PjA84bGClCULF8BXputaTq6du7uzjcbF0qRSzIOLD0Sd3Sppc10kwDMIrb2
 6u7XFzUOQ6dg6UkzlnQQ9kxarg/JaTYIkAG8n7zLR8P2uZetdtx8V6iH8g5qF8QwAHwa
 9exgJSJFXax6n6sGEmBf9VfWXP/Dt/hwT5TlL/GwK8sbc4QlwusJsHkG30xieuQrBb2H
 BUQm/fg8eddvhzPMA3ncwJ5fQ2Xu9xCUzGsccwxATFRvhbuZib7ijqt05Fdeq7hHK1P4
 xE6A==
X-Gm-Message-State: AOAM5335bfh7VRSz6BqNpAkifiUA1hABUfx+YHXeewdLXCiCtG1jE07P
 AN7a1wMTrJ3JAquHyDVY66848A==
X-Google-Smtp-Source: ABdhPJxtS2Q/iSrNEKgFztLYep76KZvehUg9sbOgnJBdNLALeqYaR4MZrTy0AcMEadlX7yQkvAglFw==
X-Received: by 2002:a05:6102:52a:: with SMTP id
 m10mr3771504vsa.80.1641986852566; 
 Wed, 12 Jan 2022 03:27:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m62sm7563606uam.0.2022.01.12.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A7A71FFBA;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/31] spice: Update QXLInterface for spice >= 0.15.0
Date: Wed, 12 Jan 2022 11:26:53 +0000
Message-Id: <20220112112722.3641051-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

spice updated the spelling (and arguments) of "attache_worker" in
0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
compilations from reporting build errors.

See also:
https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-3-berrange@redhat.com>
Message-Id: <20220105135009.1584676-3-alex.bennee@linaro.org>

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 71ecd6cfd1..21fe195e18 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -40,6 +40,12 @@ int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
 #define SPICE_NEEDS_SET_MM_TIME 0
 #endif
 
+#if defined(SPICE_SERVER_VERSION) && (SPICE_SERVER_VERSION >= 0x000f00)
+#define SPICE_HAS_ATTACHED_WORKER 1
+#else
+#define SPICE_HAS_ATTACHED_WORKER 0
+#endif
+
 #else  /* CONFIG_SPICE */
 
 #include "qemu/error-report.h"
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index e2d6e317da..1f9ad31943 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -517,13 +517,20 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
 
 /* spice display interface callbacks */
 
-static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
+static void interface_attached_worker(QXLInstance *sin)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
 
     trace_qxl_interface_attach_worker(qxl->id);
 }
 
+#if !(SPICE_HAS_ATTACHED_WORKER)
+static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
+{
+    interface_attached_worker(sin);
+}
+#endif
+
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
@@ -1131,7 +1138,12 @@ static const QXLInterface qxl_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
+#if SPICE_HAS_ATTACHED_WORKER
+    .attached_worker         = interface_attached_worker,
+#else
     .attache_worker          = interface_attach_worker,
+#endif
+
     .set_compression_level   = interface_set_compression_level,
 #if SPICE_NEEDS_SET_MM_TIME
     .set_mm_time             = interface_set_mm_time,
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 1043f47f94..a3078adf91 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -500,10 +500,17 @@ void qemu_spice_display_refresh(SimpleSpiceDisplay *ssd)
 
 /* spice display interface callbacks */
 
+#if SPICE_HAS_ATTACHED_WORKER
+static void interface_attached_worker(QXLInstance *sin)
+{
+    /* nothing to do */
+}
+#else
 static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
 {
     /* nothing to do */
 }
+#endif
 
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
@@ -702,7 +709,11 @@ static const QXLInterface dpy_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
+#if SPICE_HAS_ATTACHED_WORKER
+    .attached_worker         = interface_attached_worker,
+#else
     .attache_worker          = interface_attach_worker,
+#endif
     .set_compression_level   = interface_set_compression_level,
 #if SPICE_NEEDS_SET_MM_TIME
     .set_mm_time             = interface_set_mm_time,
-- 
2.30.2


