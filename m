Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD511540
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 10:21:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6yW-0006jZ-BC
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 04:21:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6ta-0003Rc-BF
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6tY-0007p8-A4
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM6tU-0007Rn-Ml
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:42 -0400
Received: by mail-wm1-x343.google.com with SMTP id w15so1390817wmc.3
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 01:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6OoH0VZvs5cN/77prjtAmvXUSegJODVLc//0yGYVjjY=;
	b=Qg6WMq03GUglWUSrb7qqKs0RptQHnzcuQifvfD1OFNxt5dSB6XOq2dtHAtUhN7HzhX
	nLMHZh2GsE8uikqxez40DyP+2EaIW4gOTHHiMOPZ2qmvoiPfaLlcjizRYclDTG8ibQyV
	mLsvdaXcBAzO/9f0lqTu22hi7LQ6EDNpCQ7V9K5dh5hAiOA2rlPIGbczQbtMLikyARnf
	UEqfRq1AyIiPfE9jy+LFA+8vUL2k8YdQ0OGoPVorJYaGI9jji+z6HrTNkmKrBCHdLQcd
	stxvWAXHc1CbRvmaB1vQceKr8h9H5QsBLhbbbS497BJlzfnGKBwbJXcg5dwClunB5Rq9
	CZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6OoH0VZvs5cN/77prjtAmvXUSegJODVLc//0yGYVjjY=;
	b=BuvSsDlopb/qCw+kjkEKH91WcZrKzcP2DD8a6dG32e3HqpvlDu8VCbDB4Fi4b3o4eM
	Dk1vx0viJu7E7mh2s8TQWEbMoj0qxtUrtXn4lo2Q2DVPQxZZoAkVSYz5piqUbk1K0HAV
	GW0Xm+TOn0C2Mn/e8EbVFB3TOgt5eDE9gym76hPAU8i8oZrBTCiQ0Itgr8znsnYa+hgf
	7Xffd7IwrXg/vDSZzi4cAvEoZex1GAB5pei6DgzKW3828A1HsFmPNTzadN7rMvgSZ2v5
	H3R99glaREIPeDi4kBwbyETCwyuCXAfOuh/6ndeZqWnfsApzh4VkBnWFlUr7GYtZrqOp
	cR6w==
X-Gm-Message-State: APjAAAXk66uoCwkTN8S961mJEz0Qt//9mGrKBfVm2ZfGSm3ILCa4fEqV
	k1Br6PFdtLbZv8tuaAV1fqMQf05l
X-Google-Smtp-Source: APXvYqzt5wBoGEKdFeoWKUVHLXGjhk5Tpb0IDs4Du2eJhm8tlsxHnRgmvFcFsM3sR/+7MmYNk3Wj7g==
X-Received: by 2002:a1c:1dd3:: with SMTP id d202mr1317337wmd.98.1556784981795; 
	Thu, 02 May 2019 01:16:21 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id
	d16sm44698367wra.54.2019.05.02.01.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 01:16:21 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 11:15:36 +0300
Message-Id: <20190502081554.5521-10-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502081554.5521-1-arilou@gmail.com>
References: <20190502081554.5521-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v9 09/27] gdbstub: Implement set register (P
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
Cc: alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 gdbstub.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index b42425b24c..10e3f12a68 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1634,6 +1634,27 @@ static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, "E22");
 }
 
+static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    int reg_size;
+
+    if (!gdb_has_xml) {
+        put_packet(gdb_ctx->s, "");
+        return;
+    }
+
+    if (gdb_ctx->num_params < 2) {
+        put_packet(gdb_ctx->s, "");
+        return;
+    }
+
+    reg_size = strlen(gdb_ctx->params[1].data) / 2;
+    hextomem(gdb_ctx->mem_buf, gdb_ctx->params[1].data, reg_size);
+    gdb_write_register(gdb_ctx->s->g_cpu, gdb_ctx->mem_buf,
+                       gdb_ctx->params[0].val_ull);
+    put_packet(gdb_ctx->s, "OK");
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1878,15 +1899,15 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         break;
     case 'P':
-        if (!gdb_has_xml)
-            goto unknown_command;
-        addr = strtoull(p, (char **)&p, 16);
-        if (*p == '=')
-            p++;
-        reg_size = strlen(p) / 2;
-        hextomem(mem_buf, p, reg_size);
-        gdb_write_register(s->g_cpu, mem_buf, addr);
-        put_packet(s, "OK");
+        {
+            static const GdbCmdParseEntry set_reg_cmd_desc = {
+                .handler = handle_set_reg,
+                .cmd = "P",
+                .cmd_startswith = 1,
+                .schema = "L?s0"
+            };
+            cmd_parser = &set_reg_cmd_desc;
+        }
         break;
     case 'Z':
         {
-- 
2.20.1


