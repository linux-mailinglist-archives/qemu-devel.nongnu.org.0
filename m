Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5316474C63
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 20:59:53 +0100 (CET)
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxDxo-0006Le-Fk
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 14:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxDwb-0005aX-6x
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 14:58:37 -0500
Received: from [2607:f8b0:4864:20::1034] (port=42712
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxDwZ-00015c-BZ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 14:58:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so17005224pjb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 11:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fPLE86TguE5CkK57HQyIAIvuRVzxXAz3nreJFzgQc5k=;
 b=d40X+wdK0KvIHXpZRUxItEvYJrAH8UtqQMV7OYBz3Ddhr7PfV+rE7XangCkHS9A3E3
 BU2ke5Z/qwR6+4Gg6NgnuzDur58T81RlL2z17z5mSEEYENUm4EwFCeCOM2+wxZXozVB2
 O06K8J7nG+Dju7xfOwUhmlZGb8Cxfr5xOfpmP0jzHAbBFJgCjYviEW0PfOdtbJ2HGQ2/
 KhnWDbbQp/hD/kPfjTn4mq4ef47iQ4p/SW1rZzVL8H6y4tIn82c3cPghPGIyJ24mToeh
 PDFusf13RK4Wy52xGcuqim8i3NbOC9yZmz3Q2nTMHBQf0AfxGZh6JuSiewcIjxpM/QFt
 46NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fPLE86TguE5CkK57HQyIAIvuRVzxXAz3nreJFzgQc5k=;
 b=ZWqIUQlh29jpnWOxWmXaHrb7donbC/P0KYaeGXD3gbtppPRDtDolcKwMGZqwNmxJZJ
 gQOLc8aoBMyyeukZlicZVIlm4psEuvRXkjVZDSLhV5Afh8OtHkRX+yz1GGqY7MimSA6+
 yO0FNXVzZgU717rOTNToSzV1iS1UjdJ1RRYTDLQkt7dfxRO5ErF866Cyt2ExGu44hu3c
 7syHc/vPNXMd8nvGxIfqWT9upvv1OaWPDi/auJjdGj95R+znbnAhOP1RmXjQBgK6TXAJ
 RdNOTy+rhqRmSk2uDuumcNm+pc6zPYPLASqTC7VePCa6A84jchn5b5bce4icdSL3+SYU
 uPtw==
X-Gm-Message-State: AOAM532fsTXnduBwXngZ1ujZHIjhtkSjA33QOk6rxDyc19DcWgug/fzG
 0+cQlmN+675dSXkSnXsRnK37IHl/1u9a0g==
X-Google-Smtp-Source: ABdhPJwYYO+3A5rJ2ojPTjcDK/U2PUTj+azQaVezEWvZGn7qh86fcoRFc4BTHI58Cpqb26J2eCLWFw==
X-Received: by 2002:a1f:2849:: with SMTP id o70mr1399341vko.35.1639511456872; 
 Tue, 14 Dec 2021 11:50:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g187sm170966vsc.10.2021.12.14.11.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 11:50:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFFE61FF96;
 Tue, 14 Dec 2021 19:50:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] monitor: move x-query-profile into accel/tcg to fix build
Date: Tue, 14 Dec 2021 19:50:48 +0000
Message-Id: <20211214195048.1438209-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alex.bennee@linaro.org; helo=mail-pj1-x1034.google.com
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
v2
  - enclosed in #ifndef CONFIG_USER_ONLY section
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
-- 
2.30.2


