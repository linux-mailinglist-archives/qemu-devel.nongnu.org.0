Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679AF1142C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 09:33:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6DH-000774-Hy
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 03:33:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM68z-0003xb-As
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM68q-0001pg-VI
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:28:31 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM68l-0000Vw-Bm
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:28:27 -0400
Received: by mail-wr1-x444.google.com with SMTP id l2so1783093wrb.9
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C5wVxSSu9B3yjrVL1kbdSqghY5biwyr5/S2ykkoUubY=;
	b=reTAzNSlqYQ9gK8vh9ByDodeF+2J6IsK4yx05FXlNRzYrSZlkig6Y7jFfqx4X7vKHC
	FtsmZcw6Kj0PN3DuFwlCF5IsnFSebqB3eigtZfEvnUOxA+Hwqo/wlLH28sedFHs4KHnS
	6SiGyzyKEbZAizI2R0cHbefN8VSZjGB7U/KglAkg9UrNIhdHf3soP0WgGW6S0AyV6O7q
	AlUh9s+Dt8AYIsX0fjtiopv8UxMC5Obzro2pLdk8ywyg+WXBqBTzBfSCc+hCOr8N0U4R
	ZxpUOALkusN97UYPZt8jvtb+yL1Gf+BUL2FjP89Xm00aPMDCnCZRg8/EiXrmHhrtFtY6
	Z04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C5wVxSSu9B3yjrVL1kbdSqghY5biwyr5/S2ykkoUubY=;
	b=Jspa5kneHJ41MQ1EpfexlSWKDX2VQHsDVP0jqgopzIkj4rwR0a6yr+IGJtU8DKR3T6
	23Ds75hbrixfTS00WSlM1YEmKGGictpNRuXU6PvkxyG48fXDI0kgqThsCfqYP8O8tgvg
	gVcosu9dk8A6mHCuxF7z0mNyFc3NoBEcfh4kZYflqw81hcw3Ci3FGsKKVlFPiMyjjQXk
	WhkaRL/4Lb79M82L9NiHRhINVdFmsORq6mxY6S4rpxy7GUIz4dWjYrFbhiCC8zCcDveJ
	xl+WUh4sFGflb16QhrVowGi2C7+FV98k3V/wMXggbFgyGEJFf6Rh7e1rHPKVotBJYqvU
	RC5A==
X-Gm-Message-State: APjAAAXIx7kwhzDoTvIwjOdsEGdxkUrWQTGtvDdo7KbEYhwT4ZAAuXhW
	qzSSSnC8MsgxIeTUyq8B4vsJiYDI
X-Google-Smtp-Source: APXvYqzqCjgiweov8PUsJPF41vd9UltaYGRZpU4E/NU4qWt70/qpbS/7N1X/KTGKKNHRnKbireFpCw==
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr1658364wro.245.1556782031511; 
	Thu, 02 May 2019 00:27:11 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id z5sm8769289wre.70.2019.05.02.00.27.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 00:27:10 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 10:26:24 +0300
Message-Id: <20190502072641.4667-11-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502072641.4667-1-arilou@gmail.com>
References: <20190502072641.4667-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v8 10/27] gdbstub: Implement get register (p
 pkt) with new infra
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
Cc: liran.alon@oracle.com, alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 gdbstub.c | 50 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 10e3f12a68..e9a3d0c2bc 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1655,6 +1655,36 @@ static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, "OK");
 }
 
+static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    int reg_size;
+
+    /*
+     * Older gdb are really dumb, and don't use 'g' if 'p' is avaialable.
+     * This works, but can be very slow.  Anything new enough to
+     * understand XML also knows how to use this properly.
+     */
+    if (!gdb_has_xml) {
+        put_packet(gdb_ctx->s, "");
+        return;
+    }
+
+    if (!gdb_ctx->num_params) {
+        put_packet(gdb_ctx->s, "E14");
+        return;
+    }
+
+    reg_size = gdb_read_register(gdb_ctx->s->g_cpu, gdb_ctx->mem_buf,
+                                 gdb_ctx->params[0].val_ull);
+    if (!reg_size) {
+        put_packet(gdb_ctx->s, "E14");
+        return;
+    }
+
+    memtohex(gdb_ctx->str_buf, gdb_ctx->mem_buf, reg_size);
+    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1884,18 +1914,14 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         break;
     case 'p':
-        /* Older gdb are really dumb, and don't use 'g' if 'p' is avaialable.
-           This works, but can be very slow.  Anything new enough to
-           understand XML also knows how to use this properly.  */
-        if (!gdb_has_xml)
-            goto unknown_command;
-        addr = strtoull(p, (char **)&p, 16);
-        reg_size = gdb_read_register(s->g_cpu, mem_buf, addr);
-        if (reg_size) {
-            memtohex(buf, mem_buf, reg_size);
-            put_packet(s, buf);
-        } else {
-            put_packet(s, "E14");
+        {
+            static const GdbCmdParseEntry get_reg_cmd_desc = {
+                .handler = handle_get_reg,
+                .cmd = "p",
+                .cmd_startswith = 1,
+                .schema = "L0"
+            };
+            cmd_parser = &get_reg_cmd_desc;
         }
         break;
     case 'P':
-- 
2.20.1


