Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792B2D9B0F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:33:22 +0100 (CET)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopqj-00013I-Ge
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnr-0007kb-MF
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:23 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopno-00066e-UP
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id r3so16865450wrt.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXB03b69IRRD0RMhlaFUm5Vdm4BgZtmItrqWS1AnHsY=;
 b=dVi7PbbkiKDb1HjXH6UjjVarCGWe4nKSZyGrcWMJe/VTXfJtjQB/V6TrPj2j2hSGnu
 4YfhnwOur0SSDNsMgIOlBSP0RKhz1XQm+ZtWN/lmKuSjBu3qJOaTjuIN5FtDqXCvWKtv
 B0rtlp8kgP3e6C7F0u9sUEqtD1i8umnCEcuViRhaYlEWKojRU/c+mvsIw2dsmvD/b/tC
 5Dc1VMIY3yr+/rPpmZVZZnfkSCo+xQUx11IFw/sW9Ale5egYV3sJlYUrQCRvA369DpNw
 IIt2soRTYU+BqsO4no/dsPDkz9W4fy7BrhH30UeoK9EcmyLVjn5M/Ryv1ZEHSlXKAM9x
 1Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXB03b69IRRD0RMhlaFUm5Vdm4BgZtmItrqWS1AnHsY=;
 b=GYP5lkaRowa9ZzNCqmQ1u6RvQqt4bQDRLbo6nLjOeyQwGtav5tutI4A/ylITMV4IS2
 9PLedMdxeclB9NdHN0lbhNOasOwAzHD4ajLQ5J8dnPy0e8EdWZfk7nP2klWrJeFaKvh4
 OvSO2hejngnnEAJOhFnarsarazXYHDrrtkJdh8QzFuHTk7gy1kJQabBpwwT2p/CLdyIQ
 ACrK3aFecaxTHT/oqEtMYJIkCMYrqYM7BCqAK1yPjCue5PhTh1/2Yq81iTx0rOSCsSM3
 DAG+tvWMFyNu03M6Gq0VJlNfAV75DF9y7IkMUpkvEySrirLMSzDYximl/haPG6/sFBoe
 oYwg==
X-Gm-Message-State: AOAM531C74OoUNz3W4KJAPzHCs7gfISxzyPHuAzBiOlpB6GyGAmp7BT6
 RPyvQD6ZwvpgO7cRf8pRi550lXaZghkQUg==
X-Google-Smtp-Source: ABdhPJxdIpHLalPs1uM2w/z8LK20MklZ6BE4jdaAm6nzYFqWooN46gFUTNF5n5464IbTudVCVEoWrQ==
X-Received: by 2002:adf:aa4a:: with SMTP id q10mr28768816wrd.276.1607959819442; 
 Mon, 14 Dec 2020 07:30:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h98sm35454468wrh.69.2020.12.14.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:30:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE9141FF8F;
 Mon, 14 Dec 2020 15:30:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/6] gdbstub: add support to Xfer:auxv:read: packet
Date: Mon, 14 Dec 2020 15:30:09 +0000
Message-Id: <20201214153012.12723-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214153012.12723-1-alex.bennee@linaro.org>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Lirong Yuan <yuanzi@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lirong Yuan <yuanzi@google.com>

This allows gdb to access the target’s auxiliary vector,
which can be helpful for telling system libraries important details
about the hardware, operating system, and process.

Signed-off-by: Lirong Yuan <yuanzi@google.com>
[AJB: minor tweaks to test case, update MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200730193932.3654677-1-yuanzi@google.com>
---
 gdbstub.c                                     | 54 ++++++++++++++++++
 MAINTAINERS                                   |  1 +
 tests/tcg/multiarch/Makefile.target           |  9 ++-
 .../multiarch/gdbstub/test-qxfer-auxv-read.py | 57 +++++++++++++++++++
 4 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py

diff --git a/gdbstub.c b/gdbstub.c
index f19f98ab1a..ec8daa002b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2172,6 +2172,12 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
             ";ReverseStep+;ReverseContinue+");
     }
 
+#ifdef CONFIG_USER_ONLY
+    if (gdbserver_state.c_cpu->opaque) {
+        g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
+    }
+#endif
+
     if (gdb_ctx->num_params &&
         strstr(gdb_ctx->params[0].data, "multiprocess+")) {
         gdbserver_state.multiprocess = true;
@@ -2233,6 +2239,46 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
                       gdbserver_state.str_buf->len, true);
 }
 
+#ifdef CONFIG_USER_ONLY
+static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    TaskState *ts;
+    unsigned long offset, len, saved_auxv, auxv_len;
+    const char *mem;
+
+    if (gdb_ctx->num_params < 2) {
+        put_packet("E22");
+        return;
+    }
+
+    offset = gdb_ctx->params[0].val_ul;
+    len = gdb_ctx->params[1].val_ul;
+    ts = gdbserver_state.c_cpu->opaque;
+    saved_auxv = ts->info->saved_auxv;
+    auxv_len = ts->info->auxv_len;
+    mem = (const char *)(saved_auxv + offset);
+    if (offset > auxv_len) {
+        put_packet("E00");
+        return;
+    }
+
+    if (len > (MAX_PACKET_LENGTH - 5) / 2) {
+        len = (MAX_PACKET_LENGTH - 5) / 2;
+    }
+
+    if (len < auxv_len - offset) {
+        g_string_assign(gdbserver_state.str_buf, "m");
+        memtox(gdbserver_state.str_buf, mem, len);
+    } else {
+        g_string_assign(gdbserver_state.str_buf, "l");
+        memtox(gdbserver_state.str_buf, mem, auxv_len - offset);
+    }
+
+    put_packet_binary(gdbserver_state.str_buf->str,
+                      gdbserver_state.str_buf->len, true);
+}
+#endif
+
 static void handle_query_attached(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     put_packet(GDB_ATTACHED);
@@ -2338,6 +2384,14 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
         .cmd_startswith = 1,
         .schema = "s:l,l0"
     },
+#ifdef CONFIG_USER_ONLY
+    {
+        .handler = handle_query_xfer_auxv,
+        .cmd = "Xfer:auxv:read::",
+        .cmd_startswith = 1,
+        .schema = "l,l0"
+    },
+#endif
     {
         .handler = handle_query_attached,
         .cmd = "Attached:",
diff --git a/MAINTAINERS b/MAINTAINERS
index a83416d54c..9dedc37be4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2295,6 +2295,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: gdbstub*
 F: gdb-xml/
+F: tests/tcg/multiarch/gdbstub/
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index cb49cc9ccb..c8cdb1e04d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -54,7 +54,14 @@ run-gdbstub-sha1: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
 
-EXTRA_RUNS += run-gdbstub-sha1
+run-gdbstub-qxfer-auxv-read: sha1
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
+	"basic gdbstub qXfer:auxv:read support")
+
+EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
 endif
 
 
diff --git a/tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py b/tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py
new file mode 100644
index 0000000000..d91e8fdf19
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py
@@ -0,0 +1,57 @@
+from __future__ import print_function
+#
+# Test auxiliary vector is loaded via gdbstub
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
+import sys
+
+failcount = 0
+
+def report(cond, msg):
+    "Report success/fail of test"
+    if cond:
+        print ("PASS: %s" % (msg))
+    else:
+        print ("FAIL: %s" % (msg))
+        global failcount
+        failcount += 1
+
+def run_test():
+    "Run through the tests one by one"
+
+    auxv = gdb.execute("info auxv", False, True)
+    report(isinstance(auxv, str), "Fetched auxv from inferior")
+    report(auxv.find("sha1"), "Found test binary name in auxv")
+
+#
+# This runs as the script it sourced (via -x, via run-test.py)
+#
+try:
+    inferior = gdb.selected_inferior()
+    arch = inferior.architecture()
+    print("ATTACHED: %s" % arch.name())
+except (gdb.error, AttributeError):
+    print("SKIPPING (not connected)", file=sys.stderr)
+    exit(0)
+
+if gdb.parse_and_eval('$pc') == 0:
+    print("SKIP: PC not set")
+    exit(0)
+
+try:
+    # These are not very useful in scripts
+    gdb.execute("set pagination off")
+    gdb.execute("set confirm off")
+
+    # Run the actual tests
+    run_test()
+except (gdb.error):
+    print ("GDB Exception: %s" % (sys.exc_info()[0]))
+    failcount += 1
+    pass
+
+print("All tests complete: %d failures" % failcount)
+exit(failcount)
-- 
2.20.1


