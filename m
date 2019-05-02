Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F511542
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 10:22:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6yd-0006mn-Q9
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 04:21:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6tJ-0003Cv-3Y
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6tG-0007Tk-A4
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:28 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM6t7-0007JB-VU
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:19 -0400
Received: by mail-wr1-x443.google.com with SMTP id a12so1977899wrq.10
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9IF4rsqYBB5CcGAeM/Zis8CV+HM8l1BP4iU1qHaXB5E=;
	b=uUAX/zF+Z8eOgAIkBfhItK/EJAQjSlCS5CaZUuB5Hsgq1PYx+izpxQv2Vqxqm0oFop
	uOG2HsAykPzXSow2Ak/HEvveYdkB4mLQx3XnRQ9w/Yt3ldcqyhSREHrS9KKjKHsINZIT
	OnYlglovt4LH6bP6yDasAxnSAbUtmPw6KRLS/+5zQkngYvOeGY/ObdU66JtQU76Q0j0m
	kW+qhBrKofeqw0p4rurA3fO+YP0lrDjQmlpBfM7m3wzfDFiaax6Aznyk4BMKEHmTwgVS
	QLC5Iwkk0C8KbGv9hJ/vBbtQ2DxyrSeoaFpBLS3ytkKIoKK25NLjR6ElBhHax0iWwzzw
	5AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9IF4rsqYBB5CcGAeM/Zis8CV+HM8l1BP4iU1qHaXB5E=;
	b=LCE6wRGgGLrWhs9MApPF5auz6NsONs9y3uwFJbscETLKBD+SW2sSFeVc5k8NaYdFe/
	wvs/h2lQWcET5Jkx5fWA7GYKz9DE3WyXIdHDUxhWcSK5HRZ0mqq119fPoVHfr+EM3Mxm
	TNBeZCdFwhcMu5jUOBu0QSC3ovYXhRp9AzdTfI6R/wWU84E+sWEiZD4VACAMwsghSQlj
	CBU3I3XY+qlwe0Py9KgqXQtE1dnAt3eSao2aoyWGizOg93AJtoVvmkeCq5IQEOoD3XJT
	qz6ZFXqXBlvNfk7NX8TSz0wLsYuir9xsbCirxyqNIncAQu1ihhbqpui+Do7ykhFtJiqr
	R0/Q==
X-Gm-Message-State: APjAAAVG/DH5A2xg1dOci/0rYSbZUUTWir7V3ytbqtEfzVBpvZcjsIGU
	TIelKt8pEi9eqK/+6bJw2kfGgLsz
X-Google-Smtp-Source: APXvYqxWnLllbSFESY6Sgm7zYgl+y/uijNyIowzI9TF/6CK54U/JoIQr2c55BdFYTLdx5Nm7lHWlXw==
X-Received: by 2002:a5d:54cd:: with SMTP id x13mr1709106wrv.121.1556784974069; 
	Thu, 02 May 2019 01:16:14 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id
	d16sm44698367wra.54.2019.05.02.01.16.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 01:16:13 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 11:15:31 +0300
Message-Id: <20190502081554.5521-5-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502081554.5521-1-arilou@gmail.com>
References: <20190502081554.5521-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v9 04/27] gdbstub: Implement continue (c pkt)
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
 gdbstub.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c47ef7dd9c..89f1ab6524 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1522,6 +1522,16 @@ static void handle_thread_alive(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, "OK");
 }
 
+static void handle_continue(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    if (gdb_ctx->num_params) {
+        gdb_set_cpu_pc(gdb_ctx->s, gdb_ctx->params[0].val_ull);
+    }
+
+    gdb_ctx->s->signal = 0;
+    gdb_continue(gdb_ctx->s);
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1558,13 +1568,16 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         gdb_breakpoint_remove_all();
         break;
     case 'c':
-        if (*p != '\0') {
-            addr = strtoull(p, (char **)&p, 16);
-            gdb_set_cpu_pc(s, addr);
+        {
+            static const GdbCmdParseEntry continue_cmd_desc = {
+                .handler = handle_continue,
+                .cmd = "c",
+                .cmd_startswith = 1,
+                .schema = "L0"
+            };
+            cmd_parser = &continue_cmd_desc;
         }
-        s->signal = 0;
-        gdb_continue(s);
-        return RS_IDLE;
+        break;
     case 'C':
         s->signal = gdb_signal_to_target (strtoul(p, (char **)&p, 16));
         if (s->signal == -1)
-- 
2.20.1


