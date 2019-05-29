Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D340E2D5A2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:44:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsJt-00028N-0l
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:44:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsHl-0000xZ-Qf
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsHk-0008W4-I6
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:05 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35283)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hVsHk-0008LT-CA
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:04 -0400
Received: by mail-wm1-x341.google.com with SMTP id w9so695831wmi.0
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7u1KXDRCT1QNSYdCXZwUYyZhwAFQkk64IoLiLE7FVbs=;
	b=CsNaQCuxNY48Eze7tJ5XsBUrguE0xOqRzWi9qVbQXODtcdNgkP2hZQim/a42F7g9Ia
	eTWZmSt6QIKI0gDaitu7mUunkPIgJ2y0NPYJg5qIgfg0GDK+JQx8mMUT4cmOJBjnemo/
	mBJeehzN8OGNl3iZGiPpTagb16C7dfabzGxJd99eujCaFJaI9SdHzkchg11l1Kl59wtM
	iwlG5qNfO1vW5NvScrv5DEyImQ9PRC6egkplAqoV0bmFQQfIYj15Kncac0auRmtb2RgF
	iZbTFvvzXWsxPTTgzo//gNmj/hLc6nctApcRZTj8vv0NamfHmRqliN44BuF3UPkW78im
	bG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7u1KXDRCT1QNSYdCXZwUYyZhwAFQkk64IoLiLE7FVbs=;
	b=dc9t+wnhVT09CaCrtN6GHfBrshaw7jluOCxZIFGPcuQOKzmd7LRl0wV4PGar/piOoI
	WAZvNE7Cs22jFrE5BU4Eb5Z7MJ6QZEx/dlsft5EgWus+sGbwjK+iDDMjYOXqkKue6oIb
	MaN3hNwHHOM2pIoUwpKEvAcx2C9ahSKgqZ3vhQv1lEBtd3HxZKqAAR8g+FTtGNBq7xDB
	AcOE9c8OIP2EHw/4xRTiE4n3WQCkUydXE1lpZfZaB15foMdwSec6CffVcnhDx75NTsF8
	IuYAQQnG6ezn6y2Q/rUgQmReUBo6N8NXkdjrO+vRGXX9IxlRd7mDE96kSX5L6O+evv9U
	znZQ==
X-Gm-Message-State: APjAAAWAM6uGhnT6ZB05c3rgbLvWPH4OiGLOuXFP3WrLEp1yoUQABIEW
	Ouj/AY8epB7VKn2TgAncCpd8SOXO
X-Google-Smtp-Source: APXvYqyKasfXc4KBR8WPqp4raoJ7CbEmVyVvaIE0AbK1g46NU/cRzTIKVh0WoliDHMV+ctfjhKj6kg==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr5191504wml.159.1559112122356; 
	Tue, 28 May 2019 23:42:02 -0700 (PDT)
Received: from linux.local ([31.154.166.148])
	by smtp.gmail.com with ESMTPSA id f2sm6831168wme.12.2019.05.28.23.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 23:42:01 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 09:41:29 +0300
Message-Id: <20190529064148.19856-2-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529064148.19856-1-arilou@gmail.com>
References: <20190529064148.19856-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v12 01/20] gdbstub: Add infrastructure to parse
 cmd packets
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 195 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index d54abd17cc..e6d895177b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1268,6 +1268,201 @@ out:
     return res;
 }
 
+typedef union GdbCmdVariant {
+    const char *data;
+    uint8_t opcode;
+    unsigned long val_ul;
+    unsigned long long val_ull;
+    struct {
+        GDBThreadIdKind kind;
+        uint32_t pid;
+        uint32_t tid;
+    } thread_id;
+} GdbCmdVariant;
+
+static const char *cmd_next_param(const char *param, const char delimiter)
+{
+    static const char all_delimiters[] = ",;:=";
+    char curr_delimiters[2] = {0};
+    const char *delimiters;
+
+    if (delimiter == '?') {
+        delimiters = all_delimiters;
+    } else if (delimiter == '0') {
+        return strchr(param, '\0');
+    } else if (delimiter == '.' && *param) {
+        return param + 1;
+    } else {
+        curr_delimiters[0] = delimiter;
+        delimiters = curr_delimiters;
+    }
+
+    param += strcspn(param, delimiters);
+    if (*param) {
+        param++;
+    }
+    return param;
+}
+
+static int cmd_parse_params(const char *data, const char *schema,
+                            GdbCmdVariant *params, int *num_params)
+{
+    int curr_param;
+    const char *curr_schema, *curr_data;
+
+    *num_params = 0;
+
+    if (!schema) {
+        return 0;
+    }
+
+    curr_schema = schema;
+    curr_param = 0;
+    curr_data = data;
+    while (curr_schema[0] && curr_schema[1] && *curr_data) {
+        switch (curr_schema[0]) {
+        case 'l':
+            if (qemu_strtoul(curr_data, &curr_data, 16,
+                             &params[curr_param].val_ul)) {
+                return -EINVAL;
+            }
+            curr_param++;
+            curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            break;
+        case 'L':
+            if (qemu_strtou64(curr_data, &curr_data, 16,
+                              (uint64_t *)&params[curr_param].val_ull)) {
+                return -EINVAL;
+            }
+            curr_param++;
+            curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            break;
+        case 's':
+            params[curr_param].data = curr_data;
+            curr_param++;
+            curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            break;
+        case 'o':
+            params[curr_param].opcode = *(uint8_t *)curr_data;
+            curr_param++;
+            curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            break;
+        case 't':
+            params[curr_param].thread_id.kind =
+                read_thread_id(curr_data, &curr_data,
+                               &params[curr_param].thread_id.pid,
+                               &params[curr_param].thread_id.tid);
+            curr_param++;
+            curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            break;
+        case '?':
+            curr_data = cmd_next_param(curr_data, curr_schema[1]);
+            break;
+        default:
+            return -EINVAL;
+        }
+        curr_schema += 2;
+    }
+
+    *num_params = curr_param;
+    return 0;
+}
+
+typedef struct GdbCmdContext {
+    GDBState *s;
+    GdbCmdVariant *params;
+    int num_params;
+    uint8_t mem_buf[MAX_PACKET_LENGTH];
+    char str_buf[MAX_PACKET_LENGTH + 1];
+} GdbCmdContext;
+
+typedef void (*GdbCmdHandler)(GdbCmdContext *gdb_ctx, void *user_ctx);
+
+/*
+ * cmd_startswith -> cmd is compared using startswith
+ *
+ *
+ * schema definitions:
+ * Each schema parameter entry consists of 2 chars,
+ * the first char represents the parameter type handling
+ * the second char represents the delimiter for the next parameter
+ *
+ * Currently supported schema types:
+ * 'l' -> unsigned long (stored in .val_ul)
+ * 'L' -> unsigned long long (stored in .val_ull)
+ * 's' -> string (stored in .data)
+ * 'o' -> single char (stored in .opcode)
+ * 't' -> thread id (stored in .thread_id)
+ * '?' -> skip according to delimiter
+ *
+ * Currently supported delimiters:
+ * '?' -> Stop at any delimiter (",;:=\0")
+ * '0' -> Stop at "\0"
+ * '.' -> Skip 1 char unless reached "\0"
+ * Any other value is treated as the delimiter value itself
+ */
+typedef struct GdbCmdParseEntry {
+    GdbCmdHandler handler;
+    const char *cmd;
+    bool cmd_startswith;
+    const char *schema;
+} GdbCmdParseEntry;
+
+static inline int startswith(const char *string, const char *pattern)
+{
+  return !strncmp(string, pattern, strlen(pattern));
+}
+
+static int process_string_cmd(
+        GDBState *s, void *user_ctx, const char *data,
+        const GdbCmdParseEntry *cmds, int num_cmds)
+        __attribute__((unused));
+
+static int process_string_cmd(GDBState *s, void *user_ctx, const char *data,
+                              const GdbCmdParseEntry *cmds, int num_cmds)
+{
+    int i, schema_len, max_num_params = 0;
+    GdbCmdContext gdb_ctx;
+
+    if (!cmds) {
+        return -1;
+    }
+
+    for (i = 0; i < num_cmds; i++) {
+        const GdbCmdParseEntry *cmd = &cmds[i];
+        g_assert(cmd->handler && cmd->cmd);
+
+        if ((cmd->cmd_startswith && !startswith(data, cmd->cmd)) ||
+            (!cmd->cmd_startswith && strcmp(cmd->cmd, data))) {
+            continue;
+        }
+
+        if (cmd->schema) {
+            schema_len = strlen(cmd->schema);
+            if (schema_len % 2) {
+                return -2;
+            }
+
+            max_num_params = schema_len / 2;
+        }
+
+        gdb_ctx.params =
+            (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params) * max_num_params);
+        memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
+
+        if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
+                             gdb_ctx.params, &gdb_ctx.num_params)) {
+            return -1;
+        }
+
+        gdb_ctx.s = s;
+        cmd->handler(&gdb_ctx, user_ctx);
+        return 0;
+    }
+
+    return -1;
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
-- 
2.21.0


