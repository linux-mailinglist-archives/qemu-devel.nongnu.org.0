Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1834853DD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:56:03 +0100 (CET)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56ll-0002PV-LV
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:56:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gL-00088M-Fu
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:26 -0500
Received: from [2a00:1450:4864:20::531] (port=44614
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56g8-0004Ab-LX
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:17 -0500
Received: by mail-ed1-x531.google.com with SMTP id w16so162409204edc.11
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKJLuSyVG5Lfmz8201MUHdNf1irseFQpyyRHuUV62Y0=;
 b=F1mLBbbjy8NFlkVpMDwqIIYf5wfYbXDAS6bgSleQceh0BHon4x3ALQq8D+r0bGGcLv
 b4Z1Ia09K1mXNa319O5EVVggI/S6eSg/z9vh609at2WfE9BCeNVAYxYW7wLICkVL3K/q
 eHTqEF5lkjXjdJCwdljgzkjWhQ9DQ0kbGjjXrvokUm/Wz3vin3CMiYJTdkub8UuMKsQU
 JVQotLr7hnn5AYtkNte8RSoiLUSKR8NnOta5XDAo3i1ehP54PSMX8srM5YJ50FlfDV6A
 LKuhhLJehD+/0c/DywengI8hfg4wOG/WvaEOdxoE6AoKOQEjjpbN6HT4QF2F6rKLnmcU
 InjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKJLuSyVG5Lfmz8201MUHdNf1irseFQpyyRHuUV62Y0=;
 b=tC57NUHmaYu0MiUPScSIrGpByopjghR9IElICITZrCCjNfSukOfd2/LHqp392O2580
 b66LjQAyvaE55JXcCmM3eskYaLfSoOQBrWRlNSYgijdR2F1ttYTH4bFj+A5zrer+tAzK
 Tvee0W/ApNEVXlfVeryfzNL89j/qJqhnbTrG+75ywj54QvC6ewfhoRSjDEgMXE2Q7XYN
 7jN3V34oLsMCRKMg2Cz2zow1KRUfksKDmQg9hpf/ybfRbX6SOweI3ngbIMJysNHROGm2
 LKb6i97XiysjauK77ncM405GVRcWinKgODRTizu/yw7ZP9lvNIkoMx0ITh9DxOhFIoP5
 YHlQ==
X-Gm-Message-State: AOAM533ncO76NkXNuwhPXmxJLVyT+zRaDLsr2nPsVMx2e5Li65F9Tltp
 NslP5Smh6lOl+xW6DcAN2LJhbw==
X-Google-Smtp-Source: ABdhPJzQTQUTmil9Qy2mZSniZjZNSuBQ6PzGL/fcX4HvQtYsSwN8kJDRjFQ0rTGzqmV5xxQbl7/JCw==
X-Received: by 2002:a17:907:7e8e:: with SMTP id
 qb14mr42519488ejc.525.1641390611001; 
 Wed, 05 Jan 2022 05:50:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id kz3sm12248269ejc.71.2022.01.05.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 49E1D1FFBA;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/34] spice: Update QXLInterface for spice >= 0.15.0
Date: Wed,  5 Jan 2022 13:49:37 +0000
Message-Id: <20220105135009.1584676-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, John Snow <jsnow@redhat.com>, aurelien@aurel32.net
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
---
 include/ui/qemu-spice.h |  6 ++++++
 hw/display/qxl.c        | 14 +++++++++++++-
 ui/spice-display.c      | 11 +++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

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


