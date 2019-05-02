Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC6B1143F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 09:36:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6G8-00011I-ON
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 03:36:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM68z-0003xc-Aq
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM68q-0001pT-SV
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:28:31 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM68k-0000ZV-Dj
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:28:23 -0400
Received: by mail-wr1-x444.google.com with SMTP id e9so1827900wrc.1
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=brvpFyYDw1Z1o2sLMNd/sMXNZo4TYemLFYCJt79OgBg=;
	b=AgOY6GPBpz+eyDNfwQ74HA2RWIbVmmDB5s2mzrkY1fYlD95VHug66NfWm/FMIqQ1AI
	79rLMKle5fDwg0pKHUJEe2f68EjrjXgcB/XcJf0TVtNDsI3WtjJirWYrBSG+mzCCz/9p
	yuIFlT94vRHSTVioJXwwxcKYnbaYhNrbk0Y60SxaHfecxuzGzEEXUH8JZuTLqdhxZ10z
	2slev7N/vhA40yE0tWBxF11MUTj4k18OzVpFcnKFan+woKrCQvy9iAkZcaKfUu6X1tFA
	n0ijBBlqqXrIS4HNpVg1oikHsDvr5+ypDep1gJOVs759h+uzqrrQq0IRBEL7deN6D61C
	9okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=brvpFyYDw1Z1o2sLMNd/sMXNZo4TYemLFYCJt79OgBg=;
	b=jTyfCHG5G0BXBaJx2gUQdOL/B6o4zLsGpuqUD5flct8+BEg3i9iP3ixSk2sLPgobcU
	tTDqoic3P57pChZaheHdrf5eMZMCnadTbcUfm1gXyauDjr1/eCMccUnFlb5YmpG1Tn9U
	8rDpA5ZBmMnq1rBqpYfwLmmvCgAc3DYKHkZct5sEQr1+T97beXHesIUs+jzmDfpnGgtD
	2mKtUDA4Qmv8/nBnSLhj14K8y5yDu2Tirp8owEfXuyRYjcBFVMraMjpM2BW6BN3B1hmJ
	0PvIOQwQHYhdqq1dm04CNMGYjh1/GVjNfUwCXFqEgpROQEjdNWmquCyzm7oz34W8CaH8
	TUqQ==
X-Gm-Message-State: APjAAAW6Y5fQxIF0+jRaCDGqtmwArg51beiiIag3N/R+EFZ2hoJj/47S
	P3aYXSQ1KEQl21T84AIYpxWlSpWs
X-Google-Smtp-Source: APXvYqzuex3njM3+X1wmDyI8kERIoHhELAqvL9kQ5JqNHK3+z+KN4zONPuWTr+aCSrAip82jtq/+mw==
X-Received: by 2002:a05:6000:10:: with SMTP id
	h16mr1169408wrx.151.1556782036350; 
	Thu, 02 May 2019 00:27:16 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id z5sm8769289wre.70.2019.05.02.00.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 00:27:15 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 10:26:27 +0300
Message-Id: <20190502072641.4667-14-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502072641.4667-1-arilou@gmail.com>
References: <20190502072641.4667-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v8 13/27] gdbstub: Implement write all
 registers (G pkt) with new infra
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
 gdbstub.c | 41 +++++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index daa602edc3..adfe39b3a3 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1734,6 +1734,29 @@ static void handle_read_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, gdb_ctx->str_buf);
 }
 
+static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    target_ulong addr, len;
+    uint8_t *registers;
+    int reg_size;
+
+    if (!gdb_ctx->num_params) {
+        return;
+    }
+
+    cpu_synchronize_state(gdb_ctx->s->g_cpu);
+    registers = gdb_ctx->mem_buf;
+    len = strlen(gdb_ctx->params[0].data) / 2;
+    hextomem(registers, gdb_ctx->params[0].data, len);
+    for (addr = 0; addr < gdb_ctx->s->g_cpu->gdb_num_g_regs && len > 0;
+         addr++) {
+        reg_size = gdb_write_register(gdb_ctx->s->g_cpu, registers, addr);
+        len -= reg_size;
+        registers += reg_size;
+    }
+    put_packet(gdb_ctx->s, "OK");
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1745,7 +1768,6 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
     char thread_id[16];
-    uint8_t *registers;
     target_ulong addr, len;
     const GdbCmdParseEntry *cmd_parser = NULL;
 
@@ -1911,16 +1933,15 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         put_packet(s, buf);
         break;
     case 'G':
-        cpu_synchronize_state(s->g_cpu);
-        registers = mem_buf;
-        len = strlen(p) / 2;
-        hextomem((uint8_t *)registers, p, len);
-        for (addr = 0; addr < s->g_cpu->gdb_num_g_regs && len > 0; addr++) {
-            reg_size = gdb_write_register(s->g_cpu, registers, addr);
-            len -= reg_size;
-            registers += reg_size;
+        {
+            static const GdbCmdParseEntry write_all_regs_cmd_desc = {
+                .handler = handle_write_all_regs,
+                .cmd = "G",
+                .cmd_startswith = 1,
+                .schema = "s0"
+            };
+            cmd_parser = &write_all_regs_cmd_desc;
         }
-        put_packet(s, "OK");
         break;
     case 'm':
         {
-- 
2.20.1


