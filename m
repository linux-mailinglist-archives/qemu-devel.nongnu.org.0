Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6829BF7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 18:16:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUCs9-00082P-W2
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 12:16:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hUCds-0004I6-2P
	for qemu-devel@nongnu.org; Fri, 24 May 2019 12:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hUCdp-0002HC-N6
	for qemu-devel@nongnu.org; Fri, 24 May 2019 12:01:59 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hUCdn-0002Bn-Kn
	for qemu-devel@nongnu.org; Fri, 24 May 2019 12:01:55 -0400
Received: by mail-wr1-x442.google.com with SMTP id t4so2278599wrx.7
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=N6fV9vFZuFUbts5NVK6xRLuUvhBBupBkozAmmE2Nj1U=;
	b=pxBAdde1xy/IMZ99IwNQzSwOKy6mSVQtGN344tnfFnI+MFOtne7mcV6UPQ8k7Xe8qb
	aKNk7bKU1KKYgpFjVxkNkXat/MGO5ICXUwnrtJe7zbGN6ZrfM/VXzqMtP9VetIRwmLFD
	OAZbpn4gTBzfYOe4mSwFEq1NfOe8K/UKyaZ2BwZGr4M/m+RIIAKelcQ4KqwtrMhgJt83
	vo5mPxEXKHblEZcdNnEyvCcdEgY/fVEPKi1UwnuA42+6k+/5Z6vPfjPR8jOU4mwS1VP4
	TvkUCVvUkPnYEtNDl7rEQluhPvk8enScs/D9lCZQSG6xHGxyg5Kojinef8Xi8hgY8pz6
	MIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N6fV9vFZuFUbts5NVK6xRLuUvhBBupBkozAmmE2Nj1U=;
	b=qgRNwBqh44rVtVM2nSuM40+8DdQpOhVfeiOSoSQixai5d7EY19xGJUCFXjEXJTAjUP
	jZoqGnQZi5+FZDsu5ZxKgj7mG/cFl9dYa6u4xFDQGNXRmL7JjSdrzKNmvUfBmnyg3XzW
	VFmL6MgZAKuKvpAPbPwgDuhO/3KFn06xMr1QIVxOe8tpE+IXPNMv5sEtmk0WhHIYvRwg
	cP4Ab2bBWu5OrF5d12xyBWNiaV9ldIh5ZCV1bijS9GeEil4n+Zew0iImzFlD1AB0VuYO
	/zWQzuyZTMSB/U5CZFb20GTIqCO/POQ3kc3BHNfmmTQRXbTjFH81HdlIEAqNxd22QPDG
	y60Q==
X-Gm-Message-State: APjAAAUtkETrHBF3f0z20CUFg/iNXZGCbcg6yf6rkGNC1iJF2u3hGBKi
	m8WObcVq4QXyhmKC4qBi39HTcVOp
X-Google-Smtp-Source: APXvYqybstn3EBOCSOwr+Y4oihcx3SvaKabyQXvfOExeZUcuOfb9zYnoFiKYH4OG1rntIrYGiCLakA==
X-Received: by 2002:a05:6000:10b:: with SMTP id
	o11mr547774wrx.337.1558713710667; 
	Fri, 24 May 2019 09:01:50 -0700 (PDT)
Received: from jondnuc.lan ([176.230.64.37])
	by smtp.gmail.com with ESMTPSA id s11sm370863wro.17.2019.05.24.09.01.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 09:01:50 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 19:01:14 +0300
Message-Id: <20190524160118.31134-17-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524160118.31134-1-arilou@gmail.com>
References: <20190524160118.31134-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v11 16/20] gdbstub: Implement v commands with
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
index a8b81121c5..3773b23581 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1804,6 +1804,106 @@ static void handle_step(GdbCmdContext *gdb_ctx, void *user_ctx)
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
@@ -1811,7 +1911,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     CPUClass *cc;
     const char *p;
     uint32_t pid, tid;
-    int ch, type, res;
+    int ch, type;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
     char thread_id[16];
@@ -1860,66 +1960,16 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
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


