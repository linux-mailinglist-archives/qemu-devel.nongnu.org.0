Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8E37586E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:28:23 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legrO-0000lV-Oq
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1legXb-0006PX-IP
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:07:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1legXX-0004KP-SU
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:07:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id l13so6191141wru.11
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C9TMEEn7NjrCWSPQtQE1m+33+Bq3pnw+8KqHGVyO88g=;
 b=vGeQneJBMUnRGYY2EQLWTwYVSf/pIm7329LCL6HKCZDh6wmn65Ae33DrtC/SGtW2cQ
 WytSGBYjtxlePUQs7OsS/xkcfu3+en9gKagPeVBtdVSPvnTJC4BhYLkmnAl5uU+YNVY7
 ayHWVEWEkf8EqbdQ6zFJtOHKg9lHRQOTMXckFTxuKzLLP2ob6EUxksQ/FJgW78XUKMU+
 DuotPaexhBWvI1Vn07TXl9xJ64wOB2AWiMGqS657ram5I5dZ1BWlFZYaEsj9UES1O5Pw
 KtPfX4y/QTdf2bMa9pDiAmxGT1QAvVI5pU180+FiaX7owJUdQtyojISjTE7K1GRlLzL2
 39Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C9TMEEn7NjrCWSPQtQE1m+33+Bq3pnw+8KqHGVyO88g=;
 b=bFlRGzWrHEmA6fK1H7YtTUlt+RdFvJCK5t3h5cR+TbVlydaDvXgFh1xRRMeepdLPjc
 uQ41aNERu0cXVhZ2DLxzCOJLGW5jJX16pvxCiOHOaHCdVWG2BtVC34vHOtg/1Il4r44P
 4oucnEGgRCYhy4Yba6E5HTQcOt4qphtm2HYWJWnDYCiSk9+BKZxIUrv9DEL3szaa+/Cw
 BHbrEe09Dob2ETaA3IdBsJbzLbwNoUNRFw8sR87HwBBzvAT2oqrRyl8Ktsk705gGOfSm
 f2W/Ljrhg6XDNCBgJwHTF3GN42IHap/JuGrPj14tnXgpCPOSqJ2YF5/3Ic8kawbVHxnZ
 tGLw==
X-Gm-Message-State: AOAM530y9qWqcLgn6VCHawPXQqDu2eZdoHRpB6NsyB4uEJdshph9QH/Y
 BanXeYgq1lCdmCCtqiFlitlv4A==
X-Google-Smtp-Source: ABdhPJz3hsKstvKHISevo6TEokfruO3A6pWtZgIqV6Zc06IUZL7akcAmkQlIJojPfUMaIkJjZzu2EA==
X-Received: by 2002:adf:e404:: with SMTP id g4mr6320234wrm.240.1620317269781; 
 Thu, 06 May 2021 09:07:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm3708610wmh.0.2021.05.06.09.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:07:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C25EF1FF7E;
 Thu,  6 May 2021 17:07:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [ALT PATCH] gdbstub: Replace GdbCmdContext with plain g_array()
Date: Thu,  6 May 2021 17:07:41 +0100
Message-Id: <20210506160741.9841-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505170055.1415360-5-philmd@redhat.com>
References: <20210505170055.1415360-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Instead of jumping through hoops let glib deal with both tracking the
number of elements and auto freeing the memory once we are done. This
allows is to drop the usage of ALLOCA(3) which the man-page mentions
its "use is discouraged".

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 314 +++++++++++++++++++++++++-----------------------------
 1 file changed, 146 insertions(+), 168 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 6f663cbd8d..affe5f719f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1339,6 +1339,8 @@ typedef union GdbCmdVariant {
     } thread_id;
 } GdbCmdVariant;
 
+#define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
+
 static const char *cmd_next_param(const char *param, const char delimiter)
 {
     static const char all_delimiters[] = ",;:=";
@@ -1364,54 +1366,46 @@ static const char *cmd_next_param(const char *param, const char delimiter)
 }
 
 static int cmd_parse_params(const char *data, const char *schema,
-                            GdbCmdVariant *params, int *num_params)
+                            GArray *params)
 {
-    int curr_param;
     const char *curr_schema, *curr_data;
 
-    *num_params = 0;
-
-    if (!schema) {
-        return 0;
-    }
+    g_assert(schema);
+    g_assert(params->len == 0);
 
     curr_schema = schema;
-    curr_param = 0;
     curr_data = data;
     while (curr_schema[0] && curr_schema[1] && *curr_data) {
+        GdbCmdVariant this_param;
+
         switch (curr_schema[0]) {
         case 'l':
             if (qemu_strtoul(curr_data, &curr_data, 16,
-                             &params[curr_param].val_ul)) {
+                             &this_param.val_ul)) {
                 return -EINVAL;
             }
-            curr_param++;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
             break;
         case 'L':
             if (qemu_strtou64(curr_data, &curr_data, 16,
-                              (uint64_t *)&params[curr_param].val_ull)) {
+                              (uint64_t *)&this_param.val_ull)) {
                 return -EINVAL;
             }
-            curr_param++;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
             break;
         case 's':
-            params[curr_param].data = curr_data;
-            curr_param++;
+            this_param.data = curr_data;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
             break;
         case 'o':
-            params[curr_param].opcode = *(uint8_t *)curr_data;
-            curr_param++;
+            this_param.opcode = *(uint8_t *)curr_data;
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
             break;
         case 't':
-            params[curr_param].thread_id.kind =
+            this_param.thread_id.kind =
                 read_thread_id(curr_data, &curr_data,
-                               &params[curr_param].thread_id.pid,
-                               &params[curr_param].thread_id.tid);
-            curr_param++;
+                               &this_param.thread_id.pid,
+                               &this_param.thread_id.tid);
             curr_data = cmd_next_param(curr_data, curr_schema[1]);
             break;
         case '?':
@@ -1420,19 +1414,14 @@ static int cmd_parse_params(const char *data, const char *schema,
         default:
             return -EINVAL;
         }
+        g_array_append_val(params, this_param);
         curr_schema += 2;
     }
 
-    *num_params = curr_param;
     return 0;
 }
 
-typedef struct GdbCmdContext {
-    GdbCmdVariant *params;
-    int num_params;
-} GdbCmdContext;
-
-typedef void (*GdbCmdHandler)(GdbCmdContext *gdb_ctx, void *user_ctx);
+typedef void (*GdbCmdHandler)(GArray *params, void *user_ctx);
 
 /*
  * cmd_startswith -> cmd is compared using startswith
@@ -1472,8 +1461,8 @@ static inline int startswith(const char *string, const char *pattern)
 static int process_string_cmd(void *user_ctx, const char *data,
                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
-    int i, schema_len, max_num_params = 0;
-    GdbCmdContext gdb_ctx;
+    int i;
+    g_autoptr(GArray) params = g_array_new(false, true, sizeof(GdbCmdVariant));
 
     if (!cmds) {
         return -1;
@@ -1489,24 +1478,13 @@ static int process_string_cmd(void *user_ctx, const char *data,
         }
 
         if (cmd->schema) {
-            schema_len = strlen(cmd->schema);
-            if (schema_len % 2) {
-                return -2;
+            if (cmd_parse_params(&data[strlen(cmd->cmd)],
+                                 cmd->schema, params)) {
+                return -1;
             }
-
-            max_num_params = schema_len / 2;
-        }
-
-        gdb_ctx.params =
-            (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params) * max_num_params);
-        memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
-
-        if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
-                             gdb_ctx.params, &gdb_ctx.num_params)) {
-            return -1;
         }
 
-        cmd->handler(&gdb_ctx, user_ctx);
+        cmd->handler(params, user_ctx);
         return 0;
     }
 
@@ -1529,18 +1507,18 @@ static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
     }
 }
 
-static void handle_detach(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_detach(GArray *params, void *user_ctx)
 {
     GDBProcess *process;
     uint32_t pid = 1;
 
     if (gdbserver_state.multiprocess) {
-        if (!gdb_ctx->num_params) {
+        if (!params->len) {
             put_packet("E22");
             return;
         }
 
-        pid = gdb_ctx->params[0].val_ul;
+        pid = get_param(params, 0)->val_ul;
     }
 
     process = gdb_get_process(pid);
@@ -1563,22 +1541,22 @@ static void handle_detach(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_thread_alive(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_thread_alive(GArray *params, void *user_ctx)
 {
     CPUState *cpu;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E22");
         return;
     }
 
-    if (gdb_ctx->params[0].thread_id.kind == GDB_READ_THREAD_ERR) {
+    if (get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
         put_packet("E22");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->params[0].thread_id.pid,
-                      gdb_ctx->params[0].thread_id.tid);
+    cpu = gdb_get_cpu(get_param(params, 0)->thread_id.pid,
+                      get_param(params, 0)->thread_id.tid);
     if (!cpu) {
         put_packet("E22");
         return;
@@ -1587,17 +1565,17 @@ static void handle_thread_alive(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_continue(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_continue(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params) {
-        gdb_set_cpu_pc(gdb_ctx->params[0].val_ull);
+    if (params->len) {
+        gdb_set_cpu_pc(get_param(params, 0)->val_ull);
     }
 
     gdbserver_state.signal = 0;
     gdb_continue();
 }
 
-static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_cont_with_sig(GArray *params, void *user_ctx)
 {
     unsigned long signal = 0;
 
@@ -1605,8 +1583,8 @@ static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
      * Note: C sig;[addr] is currently unsupported and we simply
      *       omit the addr parameter
      */
-    if (gdb_ctx->num_params) {
-        signal = gdb_ctx->params[0].val_ul;
+    if (params->len) {
+        signal = get_param(params, 0)->val_ul;
     }
 
     gdbserver_state.signal = gdb_signal_to_target(signal);
@@ -1616,27 +1594,27 @@ static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue();
 }
 
-static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_thread(GArray *params, void *user_ctx)
 {
     CPUState *cpu;
 
-    if (gdb_ctx->num_params != 2) {
+    if (params->len != 2) {
         put_packet("E22");
         return;
     }
 
-    if (gdb_ctx->params[1].thread_id.kind == GDB_READ_THREAD_ERR) {
+    if (get_param(params, 1)->thread_id.kind == GDB_READ_THREAD_ERR) {
         put_packet("E22");
         return;
     }
 
-    if (gdb_ctx->params[1].thread_id.kind != GDB_ONE_THREAD) {
+    if (get_param(params, 1)->thread_id.kind != GDB_ONE_THREAD) {
         put_packet("OK");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->params[1].thread_id.pid,
-                      gdb_ctx->params[1].thread_id.tid);
+    cpu = gdb_get_cpu(get_param(params, 1)->thread_id.pid,
+                      get_param(params, 1)->thread_id.tid);
     if (!cpu) {
         put_packet("E22");
         return;
@@ -1646,7 +1624,7 @@ static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
      * Note: This command is deprecated and modern gdb's will be using the
      *       vCont command instead.
      */
-    switch (gdb_ctx->params[0].opcode) {
+    switch (get_param(params, 0)->opcode) {
     case 'c':
         gdbserver_state.c_cpu = cpu;
         put_packet("OK");
@@ -1661,18 +1639,18 @@ static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 }
 
-static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_insert_bp(GArray *params, void *user_ctx)
 {
     int res;
 
-    if (gdb_ctx->num_params != 3) {
+    if (params->len != 3) {
         put_packet("E22");
         return;
     }
 
-    res = gdb_breakpoint_insert(gdb_ctx->params[0].val_ul,
-                                gdb_ctx->params[1].val_ull,
-                                gdb_ctx->params[2].val_ull);
+    res = gdb_breakpoint_insert(get_param(params, 0)->val_ul,
+                                get_param(params, 1)->val_ull,
+                                get_param(params, 2)->val_ull);
     if (res >= 0) {
         put_packet("OK");
         return;
@@ -1684,18 +1662,18 @@ static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("E22");
 }
 
-static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_remove_bp(GArray *params, void *user_ctx)
 {
     int res;
 
-    if (gdb_ctx->num_params != 3) {
+    if (params->len != 3) {
         put_packet("E22");
         return;
     }
 
-    res = gdb_breakpoint_remove(gdb_ctx->params[0].val_ul,
-                                gdb_ctx->params[1].val_ull,
-                                gdb_ctx->params[2].val_ull);
+    res = gdb_breakpoint_remove(get_param(params, 0)->val_ul,
+                                get_param(params, 1)->val_ull,
+                                get_param(params, 2)->val_ull);
     if (res >= 0) {
         put_packet("OK");
         return;
@@ -1718,7 +1696,7 @@ static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
  * the remote gdb to fallback to older methods.
  */
 
-static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_reg(GArray *params, void *user_ctx)
 {
     int reg_size;
 
@@ -1727,19 +1705,19 @@ static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    if (gdb_ctx->num_params != 2) {
+    if (params->len != 2) {
         put_packet("E22");
         return;
     }
 
-    reg_size = strlen(gdb_ctx->params[1].data) / 2;
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[1].data, reg_size);
+    reg_size = strlen(get_param(params, 1)->data) / 2;
+    hextomem(gdbserver_state.mem_buf, get_param(params, 1)->data, reg_size);
     gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
-                       gdb_ctx->params[0].val_ull);
+                       get_param(params, 0)->val_ull);
     put_packet("OK");
 }
 
-static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_get_reg(GArray *params, void *user_ctx)
 {
     int reg_size;
 
@@ -1748,14 +1726,14 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E14");
         return;
     }
 
     reg_size = gdb_read_register(gdbserver_state.g_cpu,
                                  gdbserver_state.mem_buf,
-                                 gdb_ctx->params[0].val_ull);
+                                 get_param(params, 0)->val_ull);
     if (!reg_size) {
         put_packet("E14");
         return;
@@ -1767,22 +1745,22 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_write_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_write_mem(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params != 3) {
+    if (params->len != 3) {
         put_packet("E22");
         return;
     }
 
     /* hextomem() reads 2*len bytes */
-    if (gdb_ctx->params[1].val_ull > strlen(gdb_ctx->params[2].data) / 2) {
+    if (get_param(params, 1)->val_ull > strlen(get_param(params, 2)->data) / 2) {
         put_packet("E22");
         return;
     }
 
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[2].data,
-             gdb_ctx->params[1].val_ull);
-    if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
+    hextomem(gdbserver_state.mem_buf, get_param(params, 2)->data,
+             get_param(params, 1)->val_ull);
+    if (target_memory_rw_debug(gdbserver_state.g_cpu, get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, true)) {
         put_packet("E14");
@@ -1792,22 +1770,22 @@ static void handle_write_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_read_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_read_mem(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params != 2) {
+    if (params->len != 2) {
         put_packet("E22");
         return;
     }
 
     /* memtohex() doubles the required space */
-    if (gdb_ctx->params[1].val_ull > MAX_PACKET_LENGTH / 2) {
+    if (get_param(params, 1)->val_ull > MAX_PACKET_LENGTH / 2) {
         put_packet("E22");
         return;
     }
 
-    g_byte_array_set_size(gdbserver_state.mem_buf, gdb_ctx->params[1].val_ull);
+    g_byte_array_set_size(gdbserver_state.mem_buf, get_param(params, 1)->val_ull);
 
-    if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
+    if (target_memory_rw_debug(gdbserver_state.g_cpu, get_param(params, 0)->val_ull,
                                gdbserver_state.mem_buf->data,
                                gdbserver_state.mem_buf->len, false)) {
         put_packet("E14");
@@ -1819,19 +1797,19 @@ static void handle_read_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_write_all_regs(GArray *params, void *user_ctx)
 {
     target_ulong addr, len;
     uint8_t *registers;
     int reg_size;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
     cpu_synchronize_state(gdbserver_state.g_cpu);
-    len = strlen(gdb_ctx->params[0].data) / 2;
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[0].data, len);
+    len = strlen(get_param(params, 0)->data) / 2;
+    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     registers = gdbserver_state.mem_buf->data;
     for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          addr++) {
@@ -1842,7 +1820,7 @@ static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("OK");
 }
 
-static void handle_read_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_read_all_regs(GArray *params, void *user_ctx)
 {
     target_ulong addr, len;
 
@@ -1860,14 +1838,14 @@ static void handle_read_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_file_io(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params >= 1 && gdbserver_state.current_syscall_cb) {
+    if (params->len >= 1 && gdbserver_state.current_syscall_cb) {
         target_ulong ret, err;
 
-        ret = (target_ulong)gdb_ctx->params[0].val_ull;
-        if (gdb_ctx->num_params >= 2) {
-            err = (target_ulong)gdb_ctx->params[1].val_ull;
+        ret = (target_ulong)get_param(params, 0)->val_ull;
+        if (params->len >= 2) {
+            err = (target_ulong)get_param(params, 1)->val_ull;
         } else {
             err = 0;
         }
@@ -1875,7 +1853,7 @@ static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
         gdbserver_state.current_syscall_cb = NULL;
     }
 
-    if (gdb_ctx->num_params >= 3 && gdb_ctx->params[2].opcode == (uint8_t)'C') {
+    if (params->len >= 3 && get_param(params, 2)->opcode == (uint8_t)'C') {
         put_packet("T02");
         return;
     }
@@ -1883,23 +1861,23 @@ static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue();
 }
 
-static void handle_step(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_step(GArray *params, void *user_ctx)
 {
-    if (gdb_ctx->num_params) {
-        gdb_set_cpu_pc((target_ulong)gdb_ctx->params[0].val_ull);
+    if (params->len) {
+        gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
     }
 
     cpu_single_step(gdbserver_state.c_cpu, get_sstep_flags());
     gdb_continue();
 }
 
-static void handle_backward(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_backward(GArray *params, void *user_ctx)
 {
     if (replay_mode != REPLAY_MODE_PLAY) {
         put_packet("E22");
     }
-    if (gdb_ctx->num_params == 1) {
-        switch (gdb_ctx->params[0].opcode) {
+    if (params->len == 1) {
+        switch (get_param(params, 0)->opcode) {
         case 's':
             if (replay_reverse_step()) {
                 gdb_continue();
@@ -1921,20 +1899,20 @@ static void handle_backward(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet("");
 }
 
-static void handle_v_cont_query(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_cont_query(GArray *params, void *user_ctx)
 {
     put_packet("vCont;c;C;s;S");
 }
 
-static void handle_v_cont(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_cont(GArray *params, void *user_ctx)
 {
     int res;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    res = gdb_handle_vcont(gdb_ctx->params[0].data);
+    res = gdb_handle_vcont(get_param(params, 0)->data);
     if ((res == -EINVAL) || (res == -ERANGE)) {
         put_packet("E22");
     } else if (res) {
@@ -1942,17 +1920,17 @@ static void handle_v_cont(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 }
 
-static void handle_v_attach(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_attach(GArray *params, void *user_ctx)
 {
     GDBProcess *process;
     CPUState *cpu;
 
     g_string_assign(gdbserver_state.str_buf, "E22");
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         goto cleanup;
     }
 
-    process = gdb_get_process(gdb_ctx->params[0].val_ul);
+    process = gdb_get_process(get_param(params, 0)->val_ul);
     if (!process) {
         goto cleanup;
     }
@@ -1973,7 +1951,7 @@ cleanup:
     put_strbuf();
 }
 
-static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_kill(GArray *params, void *user_ctx)
 {
     /* Kill the target */
     put_packet("OK");
@@ -2008,43 +1986,43 @@ static const GdbCmdParseEntry gdb_v_commands_table[] = {
     },
 };
 
-static void handle_v_commands(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_v_commands(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_v_commands_table,
                            ARRAY_SIZE(gdb_v_commands_table))) {
         put_packet("");
     }
 }
 
-static void handle_query_qemu_sstepbits(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_qemu_sstepbits(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "ENABLE=%x,NOIRQ=%x,NOTIMER=%x",
                     SSTEP_ENABLE, SSTEP_NOIRQ, SSTEP_NOTIMER);
     put_strbuf();
 }
 
-static void handle_set_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    sstep_flags = gdb_ctx->params[0].val_ul;
+    sstep_flags = get_param(params, 0)->val_ul;
     put_packet("OK");
 }
 
-static void handle_query_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_qemu_sstep(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "0x%x", sstep_flags);
     put_strbuf();
 }
 
-static void handle_query_curr_tid(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_curr_tid(GArray *params, void *user_ctx)
 {
     CPUState *cpu;
     GDBProcess *process;
@@ -2061,7 +2039,7 @@ static void handle_query_curr_tid(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_query_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_threads(GArray *params, void *user_ctx)
 {
     if (!gdbserver_state.query_cpu) {
         put_packet("l");
@@ -2074,25 +2052,25 @@ static void handle_query_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
 }
 
-static void handle_query_first_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_first_threads(GArray *params, void *user_ctx)
 {
     gdbserver_state.query_cpu = gdb_first_attached_cpu();
-    handle_query_threads(gdb_ctx, user_ctx);
+    handle_query_threads(params, user_ctx);
 }
 
-static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_thread_extra(GArray *params, void *user_ctx)
 {
     g_autoptr(GString) rs = g_string_new(NULL);
     CPUState *cpu;
 
-    if (!gdb_ctx->num_params ||
-        gdb_ctx->params[0].thread_id.kind == GDB_READ_THREAD_ERR) {
+    if (!params->len ||
+        get_param(params, 0)->thread_id.kind == GDB_READ_THREAD_ERR) {
         put_packet("E22");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->params[0].thread_id.pid,
-                      gdb_ctx->params[0].thread_id.tid);
+    cpu = gdb_get_cpu(get_param(params, 0)->thread_id.pid,
+                      get_param(params, 0)->thread_id.tid);
     if (!cpu) {
         return;
     }
@@ -2117,7 +2095,7 @@ static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 
 #ifdef CONFIG_USER_ONLY
-static void handle_query_offsets(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_offsets(GArray *params, void *user_ctx)
 {
     TaskState *ts;
 
@@ -2132,17 +2110,17 @@ static void handle_query_offsets(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 #else
-static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_rcmd(GArray *params, void *user_ctx)
 {
     const guint8 zero = 0;
     int len;
 
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E22");
         return;
     }
 
-    len = strlen(gdb_ctx->params[0].data);
+    len = strlen(get_param(params, 0)->data);
     if (len % 2) {
         put_packet("E01");
         return;
@@ -2150,7 +2128,7 @@ static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     g_assert(gdbserver_state.mem_buf->len == 0);
     len = len / 2;
-    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[0].data, len);
+    hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
     g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
     qemu_chr_be_write(gdbserver_state.mon_chr, gdbserver_state.mem_buf->data,
                       gdbserver_state.mem_buf->len);
@@ -2158,7 +2136,7 @@ static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_supported(GArray *params, void *user_ctx)
 {
     CPUClass *cc;
 
@@ -2179,8 +2157,8 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 #endif
 
-    if (gdb_ctx->num_params &&
-        strstr(gdb_ctx->params[0].data, "multiprocess+")) {
+    if (params->len &&
+        strstr(get_param(params, 0)->data, "multiprocess+")) {
         gdbserver_state.multiprocess = true;
     }
 
@@ -2188,7 +2166,7 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_strbuf();
 }
 
-static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_xfer_features(GArray *params, void *user_ctx)
 {
     GDBProcess *process;
     CPUClass *cc;
@@ -2196,7 +2174,7 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
     const char *xml;
     const char *p;
 
-    if (gdb_ctx->num_params < 3) {
+    if (params->len < 3) {
         put_packet("E22");
         return;
     }
@@ -2209,15 +2187,15 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 
     gdb_has_xml = true;
-    p = gdb_ctx->params[0].data;
+    p = get_param(params, 0)->data;
     xml = get_feature_xml(p, &p, process);
     if (!xml) {
         put_packet("E00");
         return;
     }
 
-    addr = gdb_ctx->params[1].val_ul;
-    len = gdb_ctx->params[2].val_ul;
+    addr = get_param(params, 1)->val_ul;
+    len = get_param(params, 2)->val_ul;
     total_len = strlen(xml);
     if (addr > total_len) {
         put_packet("E00");
@@ -2241,18 +2219,18 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
-static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_xfer_auxv(GArray *params, void *user_ctx)
 {
     TaskState *ts;
     unsigned long offset, len, saved_auxv, auxv_len;
 
-    if (gdb_ctx->num_params < 2) {
+    if (params->len < 2) {
         put_packet("E22");
         return;
     }
 
-    offset = gdb_ctx->params[0].val_ul;
-    len = gdb_ctx->params[1].val_ul;
+    offset = get_param(params, 0)->val_ul;
+    len = get_param(params, 1)->val_ul;
     ts = gdbserver_state.c_cpu->opaque;
     saved_auxv = ts->info->saved_auxv;
     auxv_len = ts->info->auxv_len;
@@ -2287,12 +2265,12 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 #endif
 
-static void handle_query_attached(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_attached(GArray *params, void *user_ctx)
 {
     put_packet(GDB_ATTACHED);
 }
 
-static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_query_qemu_supported(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "sstepbits;sstep");
 #ifndef CONFIG_USER_ONLY
@@ -2302,21 +2280,21 @@ static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void handle_query_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx,
+static void handle_query_qemu_phy_mem_mode(GArray *params,
                                            void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
     put_strbuf();
 }
 
-static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         put_packet("E22");
         return;
     }
 
-    if (!gdb_ctx->params[0].val_ul) {
+    if (!get_param(params, 0)->val_ul) {
         phy_memory_mode = 0;
     } else {
         phy_memory_mode = 1;
@@ -2439,45 +2417,45 @@ static const GdbCmdParseEntry gdb_gen_set_table[] = {
 #endif
 };
 
-static void handle_gen_query(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_gen_query(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    if (!process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (!process_string_cmd(NULL, get_param(params, 0)->data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_query_table,
                            ARRAY_SIZE(gdb_gen_query_table))) {
         put_packet("");
     }
 }
 
-static void handle_gen_set(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_gen_set(GArray *params, void *user_ctx)
 {
-    if (!gdb_ctx->num_params) {
+    if (!params->len) {
         return;
     }
 
-    if (!process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (!process_string_cmd(NULL, get_param(params, 0)->data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, get_param(params, 0)->data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
         put_packet("");
     }
 }
 
-static void handle_target_halt(GdbCmdContext *gdb_ctx, void *user_ctx)
+static void handle_target_halt(GArray *params, void *user_ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_TRAP);
     gdb_append_thread_id(gdbserver_state.c_cpu, gdbserver_state.str_buf);
-- 
2.20.1


