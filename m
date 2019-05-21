Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32324C4F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 12:10:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT1ix-0003kS-MZ
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 06:10:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hT1ZA-0005kc-4d
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hT1Z8-0007VM-6J
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:15 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hT1Z7-0007UH-V1
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:14 -0400
Received: by mail-wm1-x341.google.com with SMTP id n25so386645wmk.4
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JBP05yP+oKTHN0+qEMyIVDJm99TfFag3Xoa9AN/GQ0I=;
	b=br0E+9Cv/qFJClTAmxvpVAEG0K4lrlDsStfRHa3C47BBc740UUFsGSmVmK0fTYb8CH
	z5ScgCLvRXLTG5oV5iXXFt/T+9iuyssS/G71t2Ep6oet7s/wmknIs0UOyas78Y3lUMm1
	dahPCvVFt8rSq7KvfJryTSIX+g+1Ea9Qr1iP11Cyu/kpnJsPfxb8CECdfIbvszxYjMwZ
	phuun1oefwSqVQaJz/Dj8ANSW17Z+5OQrJW6EfZul0oEL+Rbe7D46oTtJKi0uuQ/Nq/a
	QqHQnp/TQVL8QuEl3GqJyDP5ohCflCO/A0rDK6FvarZ16C/7WJHqtiIHwKYwcbb1pI6N
	CPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JBP05yP+oKTHN0+qEMyIVDJm99TfFag3Xoa9AN/GQ0I=;
	b=bKZflh/qe9KpJ0nyBAUTOPzwd2HhTcOK0WNjTc9rqvL41+EzE6IzX3zaTvt5YYjbIX
	XDWVeKULZ4zDxT7TZtICj+D6ke5cUuha5d7ML4YEirwuVv+8y/uBXBSB0SWRb+koefIA
	LD6M0dd/aBOVGyzJb2jZh7cur2a0lkrB/jBH6x5x9kzpIGuTLZayqyr0gK5GFz2XtuJK
	t48hqYyv1+2ze/wBu8kPPOxnn4vfVXrNz0Y/uNQle5c2GaQg1niiJd0a1DuKEg+21zV3
	PwCt4kulgXqssV4a33d8xIpBfzsMKQ2TyDn9HdcLdsx6lGwpU1WxIBjPdskX4WBncEZq
	Rctg==
X-Gm-Message-State: APjAAAUvcwVOaxluHk/geHfv3kzEOuid+V4Ym1GKxR6dYYerboSYDecD
	MBTtJuynG3o+QeRm9ZdRs/Ei2owj
X-Google-Smtp-Source: APXvYqy+qD+hD1ljcry6sX3jwcynDMz3iXZq+BifOi3dtWBR5W05UJqaRu1CXEXOkMAPLiO7253SSA==
X-Received: by 2002:a1c:a7cc:: with SMTP id q195mr2785399wme.53.1558432812906; 
	Tue, 21 May 2019 03:00:12 -0700 (PDT)
Received: from jondnuc.lan ([176.230.64.64])
	by smtp.gmail.com with ESMTPSA id 65sm3080257wro.85.2019.05.21.03.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 03:00:12 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 12:59:35 +0300
Message-Id: <20190521095948.8204-8-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521095948.8204-1-arilou@gmail.com>
References: <20190521095948.8204-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v10 07/20] gdbstub: Implement breakpoint
 commands (Z/z pkt) with new infra
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
 gdbstub.c | 84 +++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 66 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 129a47230f..c59a6765cd 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -950,7 +950,7 @@ static inline int xlat_gdb_type(CPUState *cpu, int gdbtype)
 }
 #endif
 
-static int gdb_breakpoint_insert(target_ulong addr, target_ulong len, int type)
+static int gdb_breakpoint_insert(int type, target_ulong addr, target_ulong len)
 {
     CPUState *cpu;
     int err = 0;
@@ -1591,6 +1591,52 @@ static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 }
 
+static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    int res;
+
+    if (gdb_ctx->num_params != 3) {
+        put_packet(gdb_ctx->s, "E22");
+        return;
+    }
+
+    res = gdb_breakpoint_insert(gdb_ctx->params[0].val_ul,
+                                gdb_ctx->params[1].val_ull,
+                                gdb_ctx->params[2].val_ull);
+    if (res >= 0) {
+        put_packet(gdb_ctx->s, "OK");
+        return;
+    } else if (res == -ENOSYS) {
+        put_packet(gdb_ctx->s, "");
+        return;
+    }
+
+    put_packet(gdb_ctx->s, "E22");
+}
+
+static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    int res;
+
+    if (gdb_ctx->num_params != 3) {
+        put_packet(gdb_ctx->s, "E22");
+        return;
+    }
+
+    res = gdb_breakpoint_remove(gdb_ctx->params[0].val_ul,
+                                gdb_ctx->params[1].val_ull,
+                                gdb_ctx->params[2].val_ull);
+    if (res >= 0) {
+        put_packet(gdb_ctx->s, "OK");
+        return;
+    } else if (res == -ENOSYS) {
+        put_packet(gdb_ctx->s, "");
+        return;
+    }
+
+    put_packet(gdb_ctx->s, "E22");
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1846,24 +1892,26 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         put_packet(s, "OK");
         break;
     case 'Z':
+        {
+            static const GdbCmdParseEntry insert_bp_cmd_desc = {
+                .handler = handle_insert_bp,
+                .cmd = "Z",
+                .cmd_startswith = 1,
+                .schema = "l?L?L0"
+            };
+            cmd_parser = &insert_bp_cmd_desc;
+        }
+        break;
     case 'z':
-        type = strtoul(p, (char **)&p, 16);
-        if (*p == ',')
-            p++;
-        addr = strtoull(p, (char **)&p, 16);
-        if (*p == ',')
-            p++;
-        len = strtoull(p, (char **)&p, 16);
-        if (ch == 'Z')
-            res = gdb_breakpoint_insert(addr, len, type);
-        else
-            res = gdb_breakpoint_remove(addr, len, type);
-        if (res >= 0)
-             put_packet(s, "OK");
-        else if (res == -ENOSYS)
-            put_packet(s, "");
-        else
-            put_packet(s, "E22");
+        {
+            static const GdbCmdParseEntry remove_bp_cmd_desc = {
+                .handler = handle_remove_bp,
+                .cmd = "z",
+                .cmd_startswith = 1,
+                .schema = "l?L?L0"
+            };
+            cmd_parser = &remove_bp_cmd_desc;
+        }
         break;
     case 'H':
         {
-- 
2.21.0


