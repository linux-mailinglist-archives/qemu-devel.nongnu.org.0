Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA48188CAF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 18:59:32 +0100 (CET)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGV0-0005N6-Vc
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 13:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jEGMx-0000Px-D0
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:51:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jEGMv-0002aG-QJ
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:51:11 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jEGMv-0002TH-JB
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:51:09 -0400
Received: by mail-wr1-x443.google.com with SMTP id y2so11393487wrn.11
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WBHtCO5gmgzNG/otPgmM1/RdLWG0Gh9mdBCHeedK/+s=;
 b=RDSXFQWk81CtYA/xCXW18I4OAPMA4zkimNPiqPXSmKxmKiMjOKm+sRvklByb8YZjI1
 P77CGpvuqOG3JL0WHwqZjTkhfbEAAOHBBPyKELpR+5gM5c2BoNe7kzrfO6REVwq0DuxL
 Oa53UQxtmvwyFo+1B4j4bp4MDibnvtYrRzSbR6v2RPc5pO9JOe0kW4U5Ub0eo0gRoers
 dFfzD/CCv7qGafyg/Y7YrOhQVM4VGiJgQ11V1785HKbQqvjf85MVMTKzyo/f/2xFFLos
 c7XyJ8LGUe7M1E176SQupS/Ee/1gU+HU9OlAk+5MnBU1wTL/Y7eHBcX7OD5XbH3vi7hg
 EIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WBHtCO5gmgzNG/otPgmM1/RdLWG0Gh9mdBCHeedK/+s=;
 b=tjUAs2OmcZKkPNf5W5CGWS1qIggPas3EcsBaRZciDxfVMQnouEElg5nHcJ9nXwqX4A
 d751EeZBgsh98NoyegUyZl0gMB9RkqB/eTJQXKV2CQVNH13g3N1E2BBr4WlISXedtnM6
 T1a9yhmKNut4B5dyctalfq47cJpxsz1hd+r2pGcTLKTnj7NdoRI6g+TL5gSm2MQBz4tp
 WiMTha6dlKDci9ENoyzCryqoL4XwByoXfSR0I5IwXM3ANOAqZoMNDdY+z5k6oo/3TFRt
 GyEIP59xdyaor6Bl5r1cA/tmFcdUprOH01qsIyImiCVYIwQkCMVVC9KQgLxG1jrruUuv
 P65Q==
X-Gm-Message-State: ANhLgQ2IOein+4bUvqiqW7DdBTUXCbPwA0PgHRkhB4GO3WJV3joxKPrt
 PlbCe5AXxika6GrXzIECoC9vKA==
X-Google-Smtp-Source: ADFU+vsZ9DHJHXkQTSKnisaGiqWIvRrthiI4BJ3MeSS99SKraFgEw23Bb/RMocnVbYb5nRTjVBBfAA==
X-Received: by 2002:adf:f503:: with SMTP id q3mr150031wro.135.1584467468439;
 Tue, 17 Mar 2020 10:51:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm2183968wrt.0.2020.03.17.10.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 10:51:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B5731FF98;
 Tue, 17 Mar 2020 17:50:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/28] gdbstub: move mem_buf to GDBState and use GByteArray
Date: Tue, 17 Mar 2020 17:50:34 +0000
Message-Id: <20200317175053.5278-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317175053.5278-1-alex.bennee@linaro.org>
References: <20200317175053.5278-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is in preparation for further re-factoring of the register API
with the rest of the code. Theoretically the read register function
could overwrite the MAX_PACKET_LENGTH buffer although currently all
registers are well within the size range.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Tested-by: Damien Hedde <damien.hedde@greensocs.com>

Message-Id: <20200316172155.971-10-alex.bennee@linaro.org>

diff --git a/gdbstub.c b/gdbstub.c
index f6b42825445..db537a712cc 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -367,6 +367,7 @@ typedef struct GDBState {
     char syscall_buf[256];
     gdb_syscall_complete_cb current_syscall_cb;
     GString *str_buf;
+    GByteArray *mem_buf;
 } GDBState;
 
 /* By default use no IRQs and no timers while single stepping so as to
@@ -382,6 +383,7 @@ static void init_gdbserver_state(void)
     memset(&gdbserver_state, 0, sizeof(GDBState));
     gdbserver_state.init = true;
     gdbserver_state.str_buf = g_string_new(NULL);
+    gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -576,12 +578,13 @@ static void memtohex(GString *buf, const uint8_t *mem, int len)
     g_string_append_c(buf, '\0');
 }
 
-static void hextomem(uint8_t *mem, const char *buf, int len)
+static void hextomem(GByteArray *mem, const char *buf, int len)
 {
     int i;
 
     for(i = 0; i < len; i++) {
-        mem[i] = (fromhex(buf[0]) << 4) | fromhex(buf[1]);
+        guint8 byte = fromhex(buf[0]) << 4 | fromhex(buf[1]);
+        g_byte_array_append(mem, &byte, 1);
         buf += 2;
     }
 }
@@ -1412,7 +1415,6 @@ static int cmd_parse_params(const char *data, const char *schema,
 typedef struct GdbCmdContext {
     GdbCmdVariant *params;
     int num_params;
-    uint8_t mem_buf[MAX_PACKET_LENGTH];
 } GdbCmdContext;
 
 typedef void (*GdbCmdHandler)(GdbCmdContext *gdb_ctx, void *user_ctx);
@@ -1503,6 +1505,7 @@ static void run_cmd_parser(const char *data, const GdbCmdParseEntry *cmd)
     }
 
     g_string_set_size(gdbserver_state.str_buf, 0);
+    g_byte_array_set_size(gdbserver_state.mem_buf, 0);
 
     /* In case there was an error during the command parsing we must
     * send a NULL packet to indicate the command is not supported */
@@ -1715,8 +1718,8 @@ static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 
     reg_size = strlen(gdb_ctx->params[1].data) / 2;
-    hextomem(gdb_ctx->mem_buf, gdb_ctx->params[1].data, reg_size);
-    gdb_write_register(gdbserver_state.g_cpu, gdb_ctx->mem_buf,
+    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[1].data, reg_size);
+    gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf->data,
                        gdb_ctx->params[0].val_ull);
     put_packet("OK");
 }
@@ -1735,14 +1738,17 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    reg_size = gdb_read_register(gdbserver_state.g_cpu, gdb_ctx->mem_buf,
+    reg_size = gdb_read_register(gdbserver_state.g_cpu,
+                                 gdbserver_state.mem_buf->data,
                                  gdb_ctx->params[0].val_ull);
     if (!reg_size) {
         put_packet("E14");
         return;
+    } else {
+        g_byte_array_set_size(gdbserver_state.mem_buf, reg_size);
     }
 
-    memtohex(gdbserver_state.str_buf, gdb_ctx->mem_buf, reg_size);
+    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, reg_size);
     put_strbuf();
 }
 
@@ -1759,11 +1765,11 @@ static void handle_write_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    hextomem(gdb_ctx->mem_buf, gdb_ctx->params[2].data,
+    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[2].data,
              gdb_ctx->params[1].val_ull);
     if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
-                               gdb_ctx->mem_buf,
-                               gdb_ctx->params[1].val_ull, true)) {
+                               gdbserver_state.mem_buf->data,
+                               gdbserver_state.mem_buf->len, true)) {
         put_packet("E14");
         return;
     }
@@ -1784,14 +1790,17 @@ static void handle_read_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
+    g_byte_array_set_size(gdbserver_state.mem_buf, gdb_ctx->params[1].val_ull);
+
     if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
-                               gdb_ctx->mem_buf,
-                               gdb_ctx->params[1].val_ull, false)) {
+                               gdbserver_state.mem_buf->data,
+                               gdbserver_state.mem_buf->len, false)) {
         put_packet("E14");
         return;
     }
 
-    memtohex(gdbserver_state.str_buf, gdb_ctx->mem_buf, gdb_ctx->params[1].val_ull);
+    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data,
+             gdbserver_state.mem_buf->len);
     put_strbuf();
 }
 
@@ -1806,9 +1815,9 @@ static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 
     cpu_synchronize_state(gdbserver_state.g_cpu);
-    registers = gdb_ctx->mem_buf;
     len = strlen(gdb_ctx->params[0].data) / 2;
-    hextomem(registers, gdb_ctx->params[0].data, len);
+    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[0].data, len);
+    registers = gdbserver_state.mem_buf->data;
     for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          addr++) {
         reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, addr);
@@ -1825,11 +1834,14 @@ static void handle_read_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
     cpu_synchronize_state(gdbserver_state.g_cpu);
     len = 0;
     for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs; addr++) {
-        len += gdb_read_register(gdbserver_state.g_cpu, gdb_ctx->mem_buf + len,
+        len += gdb_read_register(gdbserver_state.g_cpu,
+                                 gdbserver_state.mem_buf->data + len,
                                  addr);
     }
+    /* FIXME: This is after the fact sizing */
+    g_byte_array_set_size(gdbserver_state.mem_buf, len);
 
-    memtohex(gdbserver_state.str_buf, gdb_ctx->mem_buf, len);
+    memtohex(gdbserver_state.str_buf, gdbserver_state.mem_buf->data, len);
     put_strbuf();
 }
 
@@ -2078,6 +2090,7 @@ static void handle_query_offsets(GdbCmdContext *gdb_ctx, void *user_ctx)
 #else
 static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
+    const guint8 zero = 0;
     int len;
 
     if (!gdb_ctx->num_params) {
@@ -2091,12 +2104,13 @@ static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
+    g_assert(gdbserver_state.mem_buf->len == 0);
     len = len / 2;
-    hextomem(gdb_ctx->mem_buf, gdb_ctx->params[0].data, len);
-    gdb_ctx->mem_buf[len++] = 0;
-    qemu_chr_be_write(gdbserver_state.mon_chr, gdb_ctx->mem_buf, len);
+    hextomem(gdbserver_state.mem_buf, gdb_ctx->params[0].data, len);
+    g_byte_array_append(gdbserver_state.mem_buf, &zero, 1);
+    qemu_chr_be_write(gdbserver_state.mon_chr, gdbserver_state.mem_buf->data,
+                      gdbserver_state.mem_buf->len);
     put_packet("OK");
-
 }
 #endif
 
-- 
2.20.1


