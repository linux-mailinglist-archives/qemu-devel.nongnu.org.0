Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8494474AB0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 19:23:49 +0100 (CET)
Received: from localhost ([::1]:52504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxCSq-0003St-AI
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 13:23:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxCRU-0002no-PE
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:22:25 -0500
Received: from [2a00:1450:4864:20::42d] (port=47078
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxCRR-0004nc-H6
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 13:22:23 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i22so4107550wrb.13
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aLt2TUgSzLO10dQEKYLOpEEl8MmCeHXBkcOlhjmIuXA=;
 b=AWCrB/xP3Kz/8ONQAcadMr4/oj/cukeUipKA2S+6znnZ3rXqd0TAWM6ot0fUsw1VXD
 4WfThEFt94k6prvEVAKY0cW4++zehnLJSw/CedZViXBHq0q9kw5X59snYzUc1i3PZyHX
 U8+Iw03ThENLMQn//mASPSKjSH7zcJs/0d3C1nThC6+S9yjR7OOYhtu8FQXoNqJB5VNX
 Y86gHAVVkV77XKCFzJzKaLblOkHtdRPYyjk5izn7PJMMYTVmZPw9VslnIaLy10oxCUBo
 9156QY+ASQeMi+7vDHXJy4R1IRnW5kUX1TTx0Ya8uE4B7ZzY5j/n6GuJzQpvYWJIH2Lj
 R0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aLt2TUgSzLO10dQEKYLOpEEl8MmCeHXBkcOlhjmIuXA=;
 b=24KEXukmXLGhmEhuW+qlF7KLVQ8xcZ0NoS13xGwKVqZ3i9UYnYg+KV6dghTvMiyUJz
 OOoIxXgCE7fqXasN89gVInK0YtJi7OvxqGuv1jbYfd4UkADn8eLmtJZVAobWw2Jqp7IR
 +s9JfTu4E0GJg3+L6Y2wVAdZeiyABZqRodBs6w8aphojLGLYr17Q0ucg6p5BkSoLIZzz
 KoijNPuDsWUNBcy5+8SpasRm4Zy3W/ydW5IARPwmvStiWMfDVSNe4DnNtM3dXK7RrfNa
 kYHU3pUH9mFkB70fYL+fmyrGhvwUsnKx+O7qfro+rhbZ3g5V6ltC+MlQXoYTeyXHD2Ez
 gwZg==
X-Gm-Message-State: AOAM530Q1d4+XI6QfUAsit4SqS9gN/X1hC8deGWwfYSTP/CaXYMRo0n/
 jjp2QOnWrqQdHiP5xBL4jhEH9A==
X-Google-Smtp-Source: ABdhPJzo2JasAMACm5MB2ozYdscJ5itcXEEqNkE+dtSu2jpT7qoYQyZxLJOHrdmZY+NRiMBXEsrJyA==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr659863wri.241.1639506135181; 
 Tue, 14 Dec 2021 10:22:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q24sm2706938wmj.21.2021.12.14.10.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 10:22:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92C261FF96;
 Tue, 14 Dec 2021 18:22:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] monitor: move x-query-profile into accel/tcg to fix build
Date: Tue, 14 Dec 2021 18:22:07 +0000
Message-Id: <20211214182207.1416246-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As --enable-profiler isn't defended in CI we missed this breakage.
Move the qmp handler into accel/tcg so we have access to the helpers
we need. While we are at it ensure we gate the feature on CONFIG_TCG.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 37087fde0e ("qapi: introduce x-query-profile QMP command")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/773
---
 qapi/machine.json    |  1 +
 accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c   | 31 -------------------------------
 3 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 067e3f5378..0c9f24a712 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1492,6 +1492,7 @@
 ##
 { 'command': 'x-query-profile',
   'returns': 'HumanReadableText',
+  'if': 'CONFIG_TCG',
   'features': [ 'unstable' ] }
 
 ##
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 409ec8c38c..9498a16681 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1091,3 +1091,34 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
 }
 
 #endif /* !CONFIG_USER_ONLY */
+
+#ifdef CONFIG_PROFILER
+
+int64_t dev_time;
+
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    static int64_t last_cpu_exec_time;
+    int64_t cpu_exec_time;
+    int64_t delta;
+
+    cpu_exec_time = tcg_cpu_exec_time();
+    delta = cpu_exec_time - last_cpu_exec_time;
+
+    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
+                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
+    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
+                           delta, delta / (double)NANOSECONDS_PER_SECOND);
+    last_cpu_exec_time = cpu_exec_time;
+    dev_time = 0;
+
+    return human_readable_text_from_str(buf);
+}
+#else
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    error_setg(errp, "Internal profiler not compiled");
+    return NULL;
+}
+#endif
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 343353e27a..be5e44c569 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -355,37 +355,6 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
     }
 }
 
-#ifdef CONFIG_PROFILER
-
-int64_t dev_time;
-
-HumanReadableText *qmp_x_query_profile(Error **errp)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    static int64_t last_cpu_exec_time;
-    int64_t cpu_exec_time;
-    int64_t delta;
-
-    cpu_exec_time = tcg_cpu_exec_time();
-    delta = cpu_exec_time - last_cpu_exec_time;
-
-    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
-                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
-    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
-                           delta, delta / (double)NANOSECONDS_PER_SECOND);
-    last_cpu_exec_time = cpu_exec_time;
-    dev_time = 0;
-
-    return human_readable_text_from_str(buf);
-}
-#else
-HumanReadableText *qmp_x_query_profile(Error **errp)
-{
-    error_setg(errp, "Internal profiler not compiled");
-    return NULL;
-}
-#endif
-
 static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
 {
     RdmaProvider *rdma;
-- 
2.30.2


