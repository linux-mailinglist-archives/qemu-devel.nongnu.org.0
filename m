Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927A24C4E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 12:10:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT1iu-0003hT-Ci
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 06:10:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hT1ZM-0005v3-0L
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hT1ZK-0007mp-2y
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:27 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hT1ZJ-0007kv-3Z
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:26 -0400
Received: by mail-wr1-x444.google.com with SMTP id w8so17871149wrl.6
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ni+e0LhW6YWUs24EBh3Q0RNwpZ46aTDH74CutNl7AtE=;
	b=YtSHz2SqC6bI3ZA/fWNPrSgpZpKEjn2P9IDE64IVGFwd05HPp1kJecwpousInpyZQM
	AwTNJO3iFJzypJIsQiqXlgXsnurxG+wflMI7so/P1wa+RCtO6DBFyYmriZgTLOqgwSs4
	iS4S71GkbZJ05aGFKN1GpttlzPl2skKZOT57EdRlAxgEOe6P55VIeb8KANzS8BP5Q87h
	mP9DEMwHC64vOzZhdTSapBBzBotOy0hHIgrZMsq2DBFFqiCxGj+TMEy/ZrL2GSU95YbN
	p0IJkgB5gXcS+6ChLJCN/rSIEdN/wR29NsNtNyo8xJceQGiyntg2C0mRk7atd90jbcDc
	qUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ni+e0LhW6YWUs24EBh3Q0RNwpZ46aTDH74CutNl7AtE=;
	b=SvZp3RrgQAtylIRTl1n4LyMXGZR0fHdQy0A3DrAO3p0zCEceJpeWwYXc26kNjtGAcn
	V3Mtu/oFNT26//OdIiWtM1QqQa/Zh62YVWgPXc8g8NZL4RZPmFiUKJSdPvTEkku/WkvI
	7lTbhd539TyAo2vCj5AYETBnrt3lFVS+OXqnS79QfYg5yNfM/MyT3n6t/Gm86jqEBX8b
	x99dciL+wfuGPBUjYOz9pdyH+z+RW2H4ridBf3K1zRh3lFTwxoQjYCdpVMnk0imXZ5EQ
	YxOoDe12KzP4+Yy94KYH7T1MhbHHBEZLC0BBlVZ8W6w74EI9lZtuBV72us32MhSUGUoY
	F1uw==
X-Gm-Message-State: APjAAAVnNPW6oMtpweNVr0sbXpwItN8y0Fw7v0tDwbMy7tdrkEn1pf4h
	1r5ys2nyGJbrJzqBwo9M4O/GT2vW
X-Google-Smtp-Source: APXvYqwm9/e9ga4CH6nz2euu7q0P4Ld/vwX3Rt4UzmHlSd7biQ3xNADRw6RoPoV6G3axZ0blduRwhQ==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr20094523wrw.105.1558432824125;
	Tue, 21 May 2019 03:00:24 -0700 (PDT)
Received: from jondnuc.lan ([176.230.64.64])
	by smtp.gmail.com with ESMTPSA id 65sm3080257wro.85.2019.05.21.03.00.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 03:00:23 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 12:59:42 +0300
Message-Id: <20190521095948.8204-15-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521095948.8204-1-arilou@gmail.com>
References: <20190521095948.8204-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v10 14/20] gdbstub: Implement file io (F pkt)
 with new infra
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
 gdbstub.c | 48 ++++++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 781f5882ac..b35acc679c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1775,6 +1775,25 @@ static void handle_read_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, gdb_ctx->str_buf);
 }
 
+static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    if (gdb_ctx->num_params >= 2 && gdb_ctx->s->current_syscall_cb) {
+        target_ulong ret, err;
+
+        ret = (target_ulong)gdb_ctx->params[0].val_ull;
+        err = (target_ulong)gdb_ctx->params[1].val_ull;
+        gdb_ctx->s->current_syscall_cb(gdb_ctx->s->c_cpu, ret, err);
+        gdb_ctx->s->current_syscall_cb = NULL;
+    }
+
+    if (gdb_ctx->num_params >= 3 && gdb_ctx->params[2].opcode == (uint8_t)'C') {
+        put_packet(gdb_ctx->s, "T02");
+        return;
+    }
+
+    gdb_continue(gdb_ctx->s);
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1916,28 +1935,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         return RS_IDLE;
     case 'F':
         {
-            target_ulong ret;
-            target_ulong err;
-
-            ret = strtoull(p, (char **)&p, 16);
-            if (*p == ',') {
-                p++;
-                err = strtoull(p, (char **)&p, 16);
-            } else {
-                err = 0;
-            }
-            if (*p == ',')
-                p++;
-            type = *p;
-            if (s->current_syscall_cb) {
-                s->current_syscall_cb(s->c_cpu, ret, err);
-                s->current_syscall_cb = NULL;
-            }
-            if (type == 'C') {
-                put_packet(s, "T02");
-            } else {
-                gdb_continue(s);
-            }
+            static const GdbCmdParseEntry file_io_cmd_desc = {
+                .handler = handle_file_io,
+                .cmd = "F",
+                .cmd_startswith = 1,
+                .schema = "L,L,o0"
+            };
+            cmd_parser = &file_io_cmd_desc;
         }
         break;
     case 'g':
-- 
2.21.0


