Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41122D5F3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:10:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsji-0007zD-OX
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:10:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsHy-00019y-LO
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsHx-0002T5-9j
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:18 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hVsHx-0002Jq-48
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:17 -0400
Received: by mail-wm1-x341.google.com with SMTP id u78so714973wmu.5
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WJhaKk0Bv9gRHhRS5uztzL7FE5AQMtFAVizIuMhmaP4=;
	b=px0LcRNrPB7184dsi9bPUkbTrp6T1HnCkcUH8cYGUDYK3SrU+Q66JPUV/nd9p8oEi+
	CIQ7/aTXxJOwIAiwQOAzrlGCFcaxfmD4M79OA/YYn0E8sxclLc1KwpFj/ENrbIs50tdQ
	3LrtGh4INJTfYeP4cKDwHxM7w+92cwQ85fr51s0xuYEKkwvetA4Mp0j7fYYa2dznIat4
	jGrKT1X2UmjRnMscksfhVt9clxHQGPixVJrZMCA0LstyzQIv92UqbjPzO3sTGzsDJnfX
	P5qHRug+DDQsYvv5rnDKYLuT42VLsAk7YZrYAgxJiOmVA93Kqq67xCeqMEM8g9Yx7Yiw
	pHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WJhaKk0Bv9gRHhRS5uztzL7FE5AQMtFAVizIuMhmaP4=;
	b=RKUgUUDQ/qt3qT/aKEPh6Z06hxwAvHuMtT9qL+7g2jnu3knTE1hPkC3d/feF4sr/D/
	ofAbh9wvjBGlbPVOa6fsnXKBViDRrTlUbNfT0hiRknZfFFjIPuAWnaFkSTmpI9jKEExh
	wunI4NciOGRHKLH9VYWqlD06j5mzTzFysRxUVCHVk2M4v8Z8yYxu4jpkWpQVfvCJsD4l
	JBeruyAb8i9uqlDDoFy5hnmKB/aEe9/kBvRoaDk38WbOkkhsXlD2A51FpUcpD0WL+yD0
	YeOqT3HsaokB4glPqvEvGq3n/CcfYyncVrZw1OpnJ+dRK6R6G7eWC83dz7EIcfXnNMal
	1IfA==
X-Gm-Message-State: APjAAAUVaK0l9ypVOC+x5accB2F9orRgdZ4S3cFec8yLVlGc8LF22Bx1
	4vSsJNqUHHD8StLavYBRmU+HeBfF
X-Google-Smtp-Source: APXvYqzyh65MPSvEbgK/SqHKtBapmD5ltw/UATkC6ZwWpHAq+VoBxjfVjJvSBN21WJhixZcn5TO06w==
X-Received: by 2002:a1c:f610:: with SMTP id w16mr5337031wmc.37.1559112136097; 
	Tue, 28 May 2019 23:42:16 -0700 (PDT)
Received: from linux.local ([31.154.166.148])
	by smtp.gmail.com with ESMTPSA id f2sm6831168wme.12.2019.05.28.23.42.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 23:42:15 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 09:41:44 +0300
Message-Id: <20190529064148.19856-17-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529064148.19856-1-arilou@gmail.com>
References: <20190529064148.19856-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v12 16/20] gdbstub: Implement v commands with
 new infra
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 gdbstub.c | 170 +++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 110 insertions(+), 60 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3fd1a1cddb..648191a3b0 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1818,6 +1818,106 @@ static void handle_step(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue(gdb_ctx->s);
 }
 
+static void handle_v_cont_query(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    put_packet(gdb_ctx->s, "vCont;c;C;s;S");
+}
+
+static void handle_v_cont(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    int res;
+
+    if (!gdb_ctx->num_params) {
+        return;
+    }
+
+    res = gdb_handle_vcont(gdb_ctx->s, gdb_ctx->params[0].data);
+    if ((res == -EINVAL) || (res == -ERANGE)) {
+        put_packet(gdb_ctx->s, "E22");
+    } else if (res) {
+        put_packet(gdb_ctx->s, "");
+    }
+}
+
+static void handle_v_attach(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    GDBProcess *process;
+    CPUState *cpu;
+    char thread_id[16];
+
+    pstrcpy(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "E22");
+    if (!gdb_ctx->num_params) {
+        goto cleanup;
+    }
+
+    process = gdb_get_process(gdb_ctx->s, gdb_ctx->params[0].val_ul);
+    if (!process) {
+        goto cleanup;
+    }
+
+    cpu = get_first_cpu_in_process(gdb_ctx->s, process);
+    if (!cpu) {
+        goto cleanup;
+    }
+
+    process->attached = true;
+    gdb_ctx->s->g_cpu = cpu;
+    gdb_ctx->s->c_cpu = cpu;
+
+    gdb_fmt_thread_id(gdb_ctx->s, cpu, thread_id, sizeof(thread_id));
+    snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "T%02xthread:%s;",
+             GDB_SIGNAL_TRAP, thread_id);
+cleanup:
+    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+}
+
+static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    /* Kill the target */
+    put_packet(gdb_ctx->s, "OK");
+    error_report("QEMU: Terminated via GDBstub");
+    exit(0);
+}
+
+static GdbCmdParseEntry gdb_v_commands_table[] = {
+    /* Order is important if has same prefix */
+    {
+        .handler = handle_v_cont_query,
+        .cmd = "Cont?",
+        .cmd_startswith = 1
+    },
+    {
+        .handler = handle_v_cont,
+        .cmd = "Cont",
+        .cmd_startswith = 1,
+        .schema = "s0"
+    },
+    {
+        .handler = handle_v_attach,
+        .cmd = "Attach;",
+        .cmd_startswith = 1,
+        .schema = "l0"
+    },
+    {
+        .handler = handle_v_kill,
+        .cmd = "Kill;",
+        .cmd_startswith = 1
+    },
+};
+
+static void handle_v_commands(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    if (!gdb_ctx->num_params) {
+        return;
+    }
+
+    if (process_string_cmd(gdb_ctx->s, NULL, gdb_ctx->params[0].data,
+                           gdb_v_commands_table,
+                           ARRAY_SIZE(gdb_v_commands_table))) {
+        put_packet(gdb_ctx->s, "");
+    }
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1825,7 +1925,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     CPUClass *cc;
     const char *p;
     uint32_t pid, tid;
-    int ch, type, res;
+    int ch, type;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
     char thread_id[16];
@@ -1874,66 +1974,16 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         break;
     case 'v':
-        if (strncmp(p, "Cont", 4) == 0) {
-            p += 4;
-            if (*p == '?') {
-                put_packet(s, "vCont;c;C;s;S");
-                break;
-            }
-
-            res = gdb_handle_vcont(s, p);
-
-            if (res) {
-                if ((res == -EINVAL) || (res == -ERANGE)) {
-                    put_packet(s, "E22");
-                    break;
-                }
-                goto unknown_command;
-            }
-            break;
-        } else if (strncmp(p, "Attach;", 7) == 0) {
-            unsigned long pid;
-
-            p += 7;
-
-            if (qemu_strtoul(p, &p, 16, &pid)) {
-                put_packet(s, "E22");
-                break;
-            }
-
-            process = gdb_get_process(s, pid);
-
-            if (process == NULL) {
-                put_packet(s, "E22");
-                break;
-            }
-
-            cpu = get_first_cpu_in_process(s, process);
-
-            if (cpu == NULL) {
-                /* Refuse to attach an empty process */
-                put_packet(s, "E22");
-                break;
-            }
-
-            process->attached = true;
-
-            s->g_cpu = cpu;
-            s->c_cpu = cpu;
-
-            snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
-                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id)));
-
-            put_packet(s, buf);
-            break;
-        } else if (strncmp(p, "Kill;", 5) == 0) {
-            /* Kill the target */
-            put_packet(s, "OK");
-            error_report("QEMU: Terminated via GDBstub");
-            exit(0);
-        } else {
-            goto unknown_command;
+        {
+            static const GdbCmdParseEntry v_cmd_desc = {
+                .handler = handle_v_commands,
+                .cmd = "v",
+                .cmd_startswith = 1,
+                .schema = "s0"
+            };
+            cmd_parser = &v_cmd_desc;
         }
+        break;
     case 'k':
         /* Kill the target */
         error_report("QEMU: Terminated via GDBstub");
-- 
2.21.0


