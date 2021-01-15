Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32262F7C59
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:20:02 +0100 (CET)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0P1F-00048g-Rf
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqW-0006Jp-4F
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:56 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqS-0006av-Q7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:55 -0500
Received: by mail-wr1-x430.google.com with SMTP id m4so9205936wrx.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2GUhzUadCRVMspuODUa1CjJLdyIkkEbOLktjex9QAso=;
 b=ru4X31pvQGX1+6QxQcU6wBx4HTlI0pcX16KjFZZJrtdwjRzMBIrSA2igYBwOHXrVJY
 q6QEla+GXCmTAVPe8oqUqdpn8nkesnkFkBLtfS4lUGjiQOy0p3Ewy5R5h9KUUrGjPSMQ
 7Xfp8lWxfmYDktR/3C0tzD7mYPrL3aBG7X1dDq+djWdqxBAJVE82CfYdrlfaIBXpcIdr
 FE8MG7h0KWRaafXM8kOF6O7DXi0CPraYIlQ/QylW3dYSF5qXt/kCdeWHbWu35eLdLAPd
 nYtAhhh1932g8R35U4NZxpZz+MHbQzAx0CBB7xdzCfPXuBfXlgQw+ith8GLXdyvwVTPJ
 YPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2GUhzUadCRVMspuODUa1CjJLdyIkkEbOLktjex9QAso=;
 b=nFrVN3+CIY5KWRDikHqU41/XkCi8POpiBNpGegXg05GezxDMUecSqmXRzAvGe6V5ll
 fcjaXZvjX8v3KeGNfk7hdP81blYmf2lzazcls/BmzfJymYh30viEj+VR8ecVpeuvoFD9
 3HXXEGK1Y0hM4ZBU6sknu2J6n5hhTXKaTdKkicwFC4ym2YkbV7dIVCMBwPm26HqsV5Us
 0JVPqpwB7iQl4OsvBjSCMdHBg0awNRwkh/s/xMHc3y84ywQrxWE2+kEsIZAa5iDM4N+w
 mXIOhINpmnifY7+efzVAg7Oyva26nhBP3qzfCbJXKY6mt0ZntW5XXvc0FeDwJuzjo1xR
 MdSg==
X-Gm-Message-State: AOAM531/GDqCzdjAZiaf/cmPg4USJp4SBsaotHGwc2VEINutoWL7tA5f
 VUeOwfU5mRDFbKSHmuIPElJM+A==
X-Google-Smtp-Source: ABdhPJx0j90ziwAFemxcINzfu0XPCB3yUY5u0D5iLSEyMD7DnRlWPLTn4dPXkBPjbIIIfgvDWxbm9w==
X-Received: by 2002:a05:6000:1884:: with SMTP id
 a4mr13238081wri.42.1610716131565; 
 Fri, 15 Jan 2021 05:08:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y11sm12293981wmi.0.2021.01.15.05.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51C121FF9F;
 Fri, 15 Jan 2021 13:08:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/30] gdbstub: add support to Xfer:auxv:read: packet
Date: Fri, 15 Jan 2021 13:08:15 +0000
Message-Id: <20210115130828.23968-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200730193932.3654677-1-yuanzi@google.com>
Message-Id: <20210108224256.2321-7-alex.bennee@linaro.org>

diff --git a/gdbstub.c b/gdbstub.c
index d99bc0bf2e..15d3a8e1f5 100644
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
index 07e4851aa4..3216387521 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2322,6 +2322,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: gdbstub*
 F: gdb-xml/
+F: tests/tcg/multiarch/gdbstub/
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index cb49cc9ccb..1dd0f64d23 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -55,6 +55,15 @@ run-gdbstub-sha1: sha1
 	"basic gdbstub support")
 
 EXTRA_RUNS += run-gdbstub-sha1
+
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


