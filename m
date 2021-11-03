Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F54446E4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:18:55 +0100 (CET)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJuY-0002A4-Ln
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoB-0005CK-Qm
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJo9-00073r-Jh
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id 133so2584975wme.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jEm8wFXqDZuskzPXAa1Sb29OHvLZldSUOvxYEh9L5yg=;
 b=dfOo/WUO+sMaPXo5fePo76AvghODAB2fA4E4BJ1ebmYTI2ji8XN15VCd7VDBeMSRKp
 yKcnLUNIaTPxmMycpLoxEIQJUx3y7vax0LjW4jbx07E0lWfFyNDHkXxzuTRbW130P9C/
 0VlLC3FYr2HjU29cVvcEAKr+as0FmNnFNME+idi4RxfjMuFNyeMTWDAjlZJztRnK7x/r
 fC9hTz3qjAhu+sOXj3ViGpl5yWxlJVe8+UVjC5pPiyeiUhcEuTy204JJ3WfSC9XQD7AV
 1I0iZemxUe7ps21nQorhkFVCdTvn6bQjFDXjVPugXEjrQ/6F0hwpjX/Shqhi1BMAbm8E
 BU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jEm8wFXqDZuskzPXAa1Sb29OHvLZldSUOvxYEh9L5yg=;
 b=ELG2RFj3dy6IMb5xvGoY0lb9xNvxzrH4q1nc69BB0RUXVzvhxjGMe9E8dZPip/BF2s
 xMGUWumkDXZQDJNpstT/HtNvAK+7a9NCZJvFzkDuFsBSmSD2C+aX6VxG/gmsG15pQQuH
 fjdvm+TuLC1I/ATw3JjBrb1t8C8LEN7STLw6Tjssar795QZoHkuXJfaB7tVmUSbuF8MS
 IpIouV1YSco6AriJmCNbQz6iVFEgIDnJKkaaJ4F8svQEXDanB85aJgdss+tysfBIvdtj
 7cfr2XzI5lHRGRK8EnA2FlcenHfXoZwtU17lrxMsGtQQnC+9fYs43TjILkfYs1OErl2B
 lXPA==
X-Gm-Message-State: AOAM530w7VoQWwuAvXl2jJtR9otKkRfgQBw2t5znnPhE1eA61L4gq2KZ
 BmVYGV7+mA2kg6ycjE//PJkSow==
X-Google-Smtp-Source: ABdhPJx7MvxoUoKPWTDUm08vSlkEZcz7x4HTy+T0AzVKr0EyGldvEpZuwA+acfoncgznqFEfqpSWjw==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr16351901wmc.58.1635959536218; 
 Wed, 03 Nov 2021 10:12:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k187sm6170771wme.0.2021.11.03.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C8291FFB4;
 Wed,  3 Nov 2021 17:06:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/21] gdbstub: Switch to the thread receiving a signal
Date: Wed,  3 Nov 2021 17:05:56 +0000
Message-Id: <20211103170558.717981-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pavel Labath <pavel@labath.sk>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Labath <pavel@labath.sk>

Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
thread received the signal. Otherwise, the debugger will associate it
with the main one. Also automatically select this thread, as that is
what gdb expects.

Signed-off-by: Pavel Labath <pavel@labath.sk>
Message-Id: <20211019174953.36560-1-pavel@labath.sk>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211026102234.3961636-29-alex.bennee@linaro.org>

diff --git a/gdbstub.c b/gdbstub.c
index 36b85aa50e..23baaef40e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3138,8 +3138,12 @@ gdb_handlesig(CPUState *cpu, int sig)
     tb_flush(cpu);
 
     if (sig != 0) {
-        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
-        put_packet(buf);
+        gdb_set_stop_cpu(cpu);
+        g_string_printf(gdbserver_state.str_buf,
+                        "T%02xthread:", target_signal_to_gdb(sig));
+        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        put_strbuf();
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index c0d9e638e9..b962ed8236 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -68,11 +68,19 @@ run-gdbstub-qxfer-auxv-read: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
 	"basic gdbstub qXfer:auxv:read support")
 
+run-gdbstub-thread-breakpoint: testthread
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
+	"hitting a breakpoint on non-main thread")
+
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb")
 endif
-EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
+EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
+	      run-gdbstub-thread-breakpoint
 
 # ARM Compatible Semi Hosting Tests
 #
diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
new file mode 100644
index 0000000000..798d508bc7
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
@@ -0,0 +1,60 @@
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
+    sym, ok = gdb.lookup_symbol("thread1_func")
+    gdb.execute("b thread1_func")
+    gdb.execute("c")
+
+    frame = gdb.selected_frame()
+    report(str(frame.function()) == "thread1_func", "break @ %s"%frame)
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
2.30.2


