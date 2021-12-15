Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1BF475ADF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:44:09 +0100 (CET)
Received: from localhost ([::1]:41800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVVo-0002zG-74
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxUuG-0004rs-Dd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:05:21 -0500
Received: from [2a00:1450:4864:20::429] (port=39642
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxUuD-0001yJ-0Q
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:05:19 -0500
Received: by mail-wr1-x429.google.com with SMTP id a18so38422887wrn.6
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b6i02MVLehWsp7syQISC50HODgK5GX+9SoKqQ9/2sEU=;
 b=KNlV1VIyz/hcjcWK44TfMpzQd4lGMygSpcUMHMvoaWR+qitLg35us+OAzEAzk6eZIv
 fWmjgODiX8fCRPyCxKCiUpkppm7LIta/sIJQ7LKuNVMHDGLDRrQcqCy3TDLjQRJZPqvZ
 zGlwC7R6foNwSQI/qbAVhCZmBci+eoLmBJHBYHXFjrNrEcO3j3iFOm0G0JXfZZROs1ii
 s4zdKHZjRVeMbTnA9OFAoBz9eAdtCk1o0Nuaox7Aona9o7KNsDurTf5zkNE1LVpJ8oh4
 ktlWF2rFpcZKMkhbrkqHrA/6v9BLTg6fNPwxcYEkJuDGWsjlQksSC86gbGCjsoLOynMt
 YgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b6i02MVLehWsp7syQISC50HODgK5GX+9SoKqQ9/2sEU=;
 b=RDvEDkdEjxTArUNW/mrCDDQmtChsf83utqvVa6OXj2k5npVP6vV1W8rzrwEMjjH+GF
 ZlzFag7JfDDQ50uUA4JFkxlEgCSkDforhTgmDnsy9oQaIfDYoH6uCq7kVRVndBl3RJlg
 NJhVVJB3mf0SlYW4UubqQc8I0P9I28uTdA6XclUWuS+A8fDNKVa1TpqQyZTzKoabbdLk
 4v0INE9kkmq70r8e3XIWx+jWn0ny1gQLOXatieTCxeJF99EZtozFR3Tx/Q+5MjZ6ZzE+
 Jd8ajwAvO2xFftjUjYsn9DgBgBRXYjkX9u9CAmoY3r9cHbMVTXsx26GxUNNO0tmz4Aee
 Q8zg==
X-Gm-Message-State: AOAM533lWdcAqtGEF05j/SI/MzviSD1O5LSONfKnQEGGSKcJrcscbRv4
 eYW/PiFCEv+eFlF/Pm/M9p+gqg==
X-Google-Smtp-Source: ABdhPJzrYJYWgrc1zv2EynYbJdqTjHSeWLPULnqdw4dq/S+fsJY/x/QafrOAi1y+d1qcjyeybXq6Kw==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr4344662wrw.401.1639577111219; 
 Wed, 15 Dec 2021 06:05:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j14sm1584077wrn.88.2021.12.15.06.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:05:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7A1E1FF96;
 Wed, 15 Dec 2021 14:05:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] monitor: move x-query-profile into accel/tcg to fix build
Date: Wed, 15 Dec 2021 14:04:54 +0000
Message-Id: <20211215140454.1725364-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20211214195048.1438209-1-alex.bennee@linaro.org>

---
v3
  - also add #ifdef CONFIG_TCG to hmp-commands-info.hx
---
 qapi/machine.json    |  1 +
 accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c   | 31 -------------------------------
 hmp-commands-info.hx |  2 ++
 4 files changed, 34 insertions(+), 31 deletions(-)

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
index 409ec8c38c..8b4cd6c59d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1090,4 +1090,35 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
     return human_readable_text_from_str(buf);
 }
 
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
+
 #endif /* !CONFIG_USER_ONLY */
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
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da800..e90f20a107 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -358,6 +358,7 @@ SRST
     Show host USB devices.
 ERST
 
+#if defined(CONFIG_TCG)
     {
         .name       = "profile",
         .args_type  = "",
@@ -365,6 +366,7 @@ ERST
         .help       = "show profiling information",
         .cmd_info_hrt = qmp_x_query_profile,
     },
+#endif
 
 SRST
   ``info profile``
-- 
2.30.2


