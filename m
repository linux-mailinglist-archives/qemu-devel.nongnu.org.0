Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417F91D1C5D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 19:36:58 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYvJR-0003JG-8q
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 13:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jYvEz-00054H-84
 for qemu-devel@nongnu.org; Wed, 13 May 2020 13:32:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jYvEx-0007oU-Kq
 for qemu-devel@nongnu.org; Wed, 13 May 2020 13:32:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id u16so29456450wmc.5
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qrjRWWkfvfrzIarb2T2Snq5Ul6a8M/IZ5P4/vErDudE=;
 b=iIg+pXvH64/b6g0op07SrkLfEluWAaLsSaclTIYgy+XKUDScoHaDCAAVcLMcBWVnST
 m51d63dN8zdv9qAx31OeB+cosfnxXD39U4W9kh5EED3UF3POprhDXBiL/K2wUNm/cwtt
 1fhTjy+t2c4VahiTxqQFey0gPyo0RNzbP8zEnECI6w9Zerx8lkS7E+166iNWryPncy+C
 5cOPnDDnrCSCrjUCKRdwidznxYNzL0EsGJZOUuZLT9xCDjlcvLR+2pllpk+iHehaFxWi
 pJBwi8DkaHYQzXAB7HjTQkYyzWjQUqNw8ZEgW/dAWHpsmzM4q0iKstwk3bZBz1ncaSz2
 72cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qrjRWWkfvfrzIarb2T2Snq5Ul6a8M/IZ5P4/vErDudE=;
 b=BMtnD3GMFBIjDPz5egCP/omhrp0/BevABRRVdNyTVa8+yKRl/b9yLVwr700CdE2OLz
 na9LL8mqwgfi8gENmNMSWfwt686NqKQIcY/9FvNaTQd9jBuQsQf6QOL2D2O4p79xFnFu
 IxGRHg2A9lOZW+en9B61pQr8fBMK91xRxJ56b/RAJ77ZarXUqtwOA6E7z98V9VUA9vII
 XAc41rmL2hejQ0ttsLse4Usp3opR5rzTRIb+jDM0EufOTD58qn50giktEKyTSHDawr3d
 kl22ASDHecARfWf+4OWZ160hrvCjufCisL6nvmo5xbzE7y64kqXbI/jSAWB0jbEuNEyi
 DpXQ==
X-Gm-Message-State: AOAM532f7zMCTaJqs3TFB/ldRjyCEERQigBJJhNxsBisHkoJ/gc3g1RA
 q11epBsp/QaaOl/of6+OT6bjVoSjwqY=
X-Google-Smtp-Source: ABdhPJylWXRXYEg1N0mUEM9D0EkCb+IEL3ieTuKu6uEXvT40ieRdJ6ak/I+sMm1JacepSRrP0SLfSg==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr9698483wmj.189.1589391138051; 
 Wed, 13 May 2020 10:32:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 1sm37544937wmi.0.2020.05.13.10.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 10:32:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F04B1FF96;
 Wed, 13 May 2020 18:32:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 8/8] plugins: new lockstep plugin for debugging TCG changes
Date: Wed, 13 May 2020 18:32:00 +0100
Message-Id: <20200513173200.11830-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200513173200.11830-1-alex.bennee@linaro.org>
References: <20200513173200.11830-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we make changes to the TCG we sometimes cause regressions that
are deep into the execution cycle of the guest. Debugging this often
requires comparing large volumes of trace information to figure out
where behaviour has diverged.

The lockstep plugin utilises a shared socket so two QEMU's running
with the plugin will write their current execution position and wait
to receive the position of their partner process. When execution
diverges the plugins output where they were and the previous few
blocks before unloading themselves and letting execution continue.

Originally I planned for this to be most useful with -icount but it
turns out you can get divergence pretty quickly due to asynchronous
qemu_cpu_kick_rr_cpus() events causing one side to eventually run into
a short block a few cycles before the other side. For this reason I've
added a bit of tracking and I think the divergence reporting could be
finessed to report only if we really start to diverge in execution.

An example run would be:

  qemu-system-sparc -monitor none -parallel none -net none \
    -M SS-20 -m 256 -kernel day11/zImage.elf \
    -plugin ./tests/plugin/liblockstep.so,arg=lockstep-sparc.sock \
    -d plugin,nochain

with an identical command in another window in the same working
directory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20200429200754.18327-1-alex.bennee@linaro.org>

---
v3
  - added verbose flag
  - basic heuristics to detect "real" divergence
---
 tests/plugin/lockstep.c   | 345 ++++++++++++++++++++++++++++++++++++++
 tests/plugin/Makefile     |   1 +
 tests/tcg/Makefile.target |   2 +-
 3 files changed, 347 insertions(+), 1 deletion(-)
 create mode 100644 tests/plugin/lockstep.c

diff --git a/tests/plugin/lockstep.c b/tests/plugin/lockstep.c
new file mode 100644
index 00000000000..4d1a5c3264e
--- /dev/null
+++ b/tests/plugin/lockstep.c
@@ -0,0 +1,345 @@
+/*
+ * Lockstep Execution Plugin
+ *
+ * Allows you to execute two QEMU instances in lockstep and report
+ * when their execution diverges. This is mainly useful for developers
+ * who want to see where a change to TCG code generation has
+ * introduced a subtle and hard to find bug.
+ *
+ * Caveats:
+ *   - single-threaded linux-user apps only with non-deterministic syscalls
+ *   - no MTTCG enabled system emulation (icount may help)
+ *
+ * While icount makes things more deterministic it doesn't mean a
+ * particular run may execute the exact same sequence of blocks. An
+ * asynchronous event (for example X11 graphics update) may cause a
+ * block to end early and a new partial block to start. This means
+ * serial only test cases are a better bet. -d nochain may also help.
+ *
+ * This code is not thread safe!
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <glib.h>
+#include <inttypes.h>
+#include <unistd.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <stdio.h>
+#include <errno.h>
+
+#include <qemu-plugin.h>
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+/* saved so we can uninstall later */
+static qemu_plugin_id_t our_id;
+
+static unsigned long bb_count;
+static unsigned long insn_count;
+
+/* Information about a translated block */
+typedef struct {
+    uint64_t pc;
+    uint64_t insns;
+} BlockInfo;
+
+/* Information about an execution state in the log */
+typedef struct {
+    BlockInfo *block;
+    unsigned long insn_count;
+    unsigned long block_count;
+} ExecInfo;
+
+/* The execution state we compare */
+typedef struct {
+    uint64_t pc;
+    unsigned long insn_count;
+} ExecState;
+
+typedef struct {
+    GSList *log_pos;
+    int distance;
+} DivergeState;
+
+/* list of translated block info */
+static GSList *blocks;
+
+/* execution log and points of divergence */
+static GSList *log, *divergence_log;
+
+static int socket_fd;
+static char *path_to_unlink;
+
+static bool verbose;
+
+static void plugin_cleanup(qemu_plugin_id_t id)
+{
+    /* Free our block data */
+    g_slist_free_full(blocks, &g_free);
+    g_slist_free_full(log, &g_free);
+    g_slist_free(divergence_log);
+
+    close(socket_fd);
+    if (path_to_unlink) {
+        unlink(path_to_unlink);
+    }
+}
+
+static void plugin_exit(qemu_plugin_id_t id, void *p)
+{
+    g_autoptr(GString) out = g_string_new("No divergence :-)\n");
+    g_string_append_printf(out, "Executed %ld/%d blocks\n",
+                           bb_count, g_slist_length(log));
+    g_string_append_printf(out, "Executed ~%ld instructions\n", insn_count);
+    qemu_plugin_outs(out->str);
+
+    plugin_cleanup(id);
+}
+
+static inline const char * ord_ind(int n) {
+    return  n > 3 ? "th" :
+        n == 3 ? "rd" :
+        n == 2 ? "nd" : "st";
+}
+
+static void report_divergance(ExecState *us, ExecState *them)
+{
+    DivergeState divrec = { log, 0 };
+    g_autoptr(GString) out = g_string_new("");
+    bool diverged = false;
+
+    /*
+     * If we have diverged before did we get back on track or are we
+     * totally loosing it?
+     */
+    if (divergence_log) {
+        DivergeState *last = (DivergeState *) divergence_log->data;
+        GSList *entry;
+
+        for (entry = log; g_slist_next(entry); entry = g_slist_next(entry)) {
+            if (entry == last->log_pos) {
+                break;
+            }
+            divrec.distance++;
+        }
+
+        /*
+         * If the last two records are so close it is likely we will
+         * not recover synchronisation with the other end.
+         */
+        if (divrec.distance == 1 && last->distance == 1) {
+            diverged = true;
+        }
+    }
+    divergence_log = g_slist_prepend(divergence_log,
+                                     g_memdup(&divrec, sizeof(divrec)));
+
+    /* Output short log entry of going out of sync... */
+    if (verbose || divrec.distance == 1 || diverged) {
+        g_string_printf(out, "@ %#016lx vs %#016lx (%d/%d since last)\n",
+                        us->pc, them->pc, g_slist_length(divergence_log),
+                        divrec.distance);
+        qemu_plugin_outs(out->str);
+    }
+
+    if (diverged) {
+        int i;
+        GSList *entry;
+
+        g_string_printf(out, "Δ insn_count @ %#016lx (%ld) vs %#016lx (%ld)\n",
+                        us->pc, us->insn_count, them->pc, them->insn_count);
+
+        for (entry = log, i = 0;
+             g_slist_next(entry) && i < 5;
+             entry = g_slist_next(entry), i++) {
+            ExecInfo *prev = (ExecInfo *) entry->data;
+            g_string_append_printf(out, "  previously @ %#016lx/%ld (%ld insns)\n",
+                                   prev->block->pc, prev->block->insns,
+                                   prev->insn_count);
+        }
+        qemu_plugin_outs(out->str);
+        qemu_plugin_outs("too much divergence... giving up.");
+        qemu_plugin_uninstall(our_id, plugin_cleanup);
+    }
+}
+
+static void vcpu_tb_exec(unsigned int cpu_index, void *udata)
+{
+    BlockInfo *bi = (BlockInfo *) udata;
+    ExecState us, them;
+    ssize_t bytes;
+    ExecInfo *exec;
+
+    us.pc = bi->pc;
+    us.insn_count = insn_count;
+
+    /*
+     * Write our current position to the other end. If we fail the
+     * other end has probably died and we should shut down gracefully.
+     */
+    bytes = write(socket_fd, &us, sizeof(ExecState));
+    if (bytes < sizeof(ExecState)) {
+        qemu_plugin_outs(bytes < 0 ?
+                         "problem writing to socket" :
+                         "wrote less than expected to socket");
+        qemu_plugin_uninstall(our_id, plugin_cleanup);
+        return;
+    }
+
+    /*
+     * Now read where our peer has reached. Again a failure probably
+     * indicates the other end died and we should close down cleanly.
+     */
+    bytes = read(socket_fd, &them, sizeof(ExecState));
+    if (bytes < sizeof(ExecState)) {
+        qemu_plugin_outs(bytes < 0 ?
+                         "problem reading from socket" :
+                         "read less than expected");
+        qemu_plugin_uninstall(our_id, plugin_cleanup);
+        return;
+    }
+
+    /*
+     * Compare and report if we have diverged.
+     */
+    if (us.pc != them.pc) {
+        report_divergance(&us, &them);
+    }
+
+    /*
+     * Assume this block will execute fully and record it
+     * in the execution log.
+     */
+    insn_count += bi->insns;
+    bb_count++;
+    exec = g_new0(ExecInfo, 1);
+    exec->block = bi;
+    exec->insn_count = insn_count;
+    exec->block_count = bb_count;
+    log = g_slist_prepend(log, exec);
+}
+
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
+{
+    BlockInfo *bi = g_new0(BlockInfo, 1);
+    bi->pc = qemu_plugin_tb_vaddr(tb);
+    bi->insns = qemu_plugin_tb_n_insns(tb);
+
+    // save a reference so we can free later
+    blocks = g_slist_prepend(blocks, bi);
+    qemu_plugin_register_vcpu_tb_exec_cb(tb, vcpu_tb_exec,
+                                         QEMU_PLUGIN_CB_NO_REGS, (void *)bi);
+}
+
+
+/*
+ * Instead of encoding master/slave status into what is essentially
+ * two peers we shall just take the simple approach of checking for
+ * the existence of the pipe and assuming if it's not there we are the
+ * first process.
+ */
+static bool setup_socket(const char *path)
+{
+    struct sockaddr_un sockaddr;
+    int fd;
+
+    fd = socket(AF_UNIX, SOCK_STREAM, 0);
+    if (fd < 0) {
+        perror("create socket");
+        return false;
+    }
+
+    sockaddr.sun_family = AF_UNIX;
+    g_strlcpy(sockaddr.sun_path, path, sizeof(sockaddr.sun_path) - 1);
+    if (bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
+        perror("bind socket");
+        close(fd);
+        return false;
+    }
+
+    /* remember to clean-up */
+    path_to_unlink = g_strdup(path);
+
+    if (listen(fd, 1) < 0) {
+        perror("listen socket");
+        close(fd);
+        return false;
+    }
+
+    socket_fd = accept(fd, NULL, NULL);
+    if (socket_fd < 0 && errno != EINTR) {
+        perror("accept socket");
+        return false;
+    }
+
+    qemu_plugin_outs("setup_socket::ready\n");
+
+    return true;
+}
+
+static bool connect_socket(const char *path)
+{
+    int fd;
+    struct sockaddr_un sockaddr;
+
+    fd = socket(AF_UNIX, SOCK_STREAM, 0);
+    if (fd < 0) {
+        perror("create socket");
+        return false;
+    }
+
+    sockaddr.sun_family = AF_UNIX;
+    g_strlcpy(sockaddr.sun_path, path, sizeof(sockaddr.sun_path) - 1);
+
+    if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
+        perror("failed to connect");
+        return false;
+    }
+
+    qemu_plugin_outs("connect_socket::ready\n");
+
+    socket_fd = fd;
+    return true;
+}
+
+static bool setup_unix_socket(const char *path)
+{
+    if (g_file_test(path, G_FILE_TEST_EXISTS)) {
+        return connect_socket(path);
+    } else {
+        return setup_socket(path);
+    }
+}
+
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info,
+                                           int argc, char **argv)
+{
+    int i;
+
+    if (!argc || !argv[0]) {
+        qemu_plugin_outs("Need a socket path to talk to other instance.");
+        return -1;
+    }
+
+    for (i = 0; i < argc; i++) {
+        char *p = argv[i];
+        if (strcmp(p, "verbose") == 0) {
+            verbose = true;
+        } else if (!setup_unix_socket(argv[0])) {
+            qemu_plugin_outs("Failed to setup socket for communications.");
+            return -1;
+        }
+    }
+
+    our_id = id;
+
+    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
+    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
+    return 0;
+}
diff --git a/tests/plugin/Makefile b/tests/plugin/Makefile
index 75467b6db85..b3250e2504c 100644
--- a/tests/plugin/Makefile
+++ b/tests/plugin/Makefile
@@ -13,6 +13,7 @@ NAMES += mem
 NAMES += hotblocks
 NAMES += howvec
 NAMES += hotpages
+NAMES += lockstep
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index b3cff3cad1a..075daf3d22d 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -128,7 +128,7 @@ RUN_TESTS=$(patsubst %,run-%, $(TESTS))
 ifeq ($(CONFIG_PLUGIN),y)
 PLUGIN_DIR=../../plugin
 VPATH+=$(PLUGIN_DIR)
-PLUGINS=$(notdir $(wildcard $(PLUGIN_DIR)/*.so))
+PLUGINS=$(filter-out liblockstep.so,$(notdir $(wildcard $(PLUGIN_DIR)/*.so)))
 
 # We need to ensure expand the run-plugin-TEST-with-PLUGIN
 # pre-requistes manually here as we can't use stems to handle it. We
-- 
2.20.1


