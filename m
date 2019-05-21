Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298A24C8E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 12:21:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT1u1-000612-7O
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 06:21:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hT1ZO-0005vo-0J
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hT1ZM-0007os-0X
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:29 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55959)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hT1ZK-0007mL-DI
	for qemu-devel@nongnu.org; Tue, 21 May 2019 06:00:27 -0400
Received: by mail-wm1-x341.google.com with SMTP id x64so2290487wmb.5
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gwyQsYX56ID1TewcmfUtZ1MdkZFKQMfuvtZW1avWGQ4=;
	b=ARHVwM9rTiPxLFWDyjVtMWx6us42wS9tdqC4KFcnnSQdNboG5yP7HeF9/Dwbwp0NZY
	F4X0DdqoUKqkAYR9ix4Gt8mzbEekjLpDfGwNB0EazcuSRkCFVMIiZQHlzYF0ylXIQZnX
	Bpn3Z/mMTIRpsX/LTonl76c0hq6DyrU1og8k2BGz/Xfr7ZB6Fw30l0gCjVh5ppZy0Kc8
	HzvfJFelBK19s2fI/9T45ltTtNOloWyMKebBMKLSG1J0rU2MLtg2AsIWGf5Y3r7Pu2Ld
	vv05viV8XYgdz++JOtKrzhDPUw2sL+47eof25iXH0bcn6hGArO+vPy+upme7dsHPpV1v
	1+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gwyQsYX56ID1TewcmfUtZ1MdkZFKQMfuvtZW1avWGQ4=;
	b=FXWGT1gPZednR6ySzf5G//ZwF1tx7P8qMXnLxkyp7mXIx/EX+QexLiHR+thdcOIbgB
	zFPC5Rzujk067TECFXCS5KJQS/86QzRDSZnjAb5nWY0GARu5iGg85NL+WKH8glKFrSds
	hWMnLHZ4KjNxIecdA40fcSUc+JNJjOzv5Ss/kQCFJSmNv53ZVqcjSmhE+KBkjP1TbUMh
	PqEq8iVGgM6eGAw7qW0lgxZHm2OPQykcPDLMiFrGQc0r91Gb+DrotFdhMpaIYe7I8A+a
	I+fDw3Rwml6ytUwDSkUCm0Nl57P4VHkZrZ8rIIYABfqEJaa1GDfWlrx/YEy4Kej8lWZ5
	Q+XQ==
X-Gm-Message-State: APjAAAUZVkFxHWTG0qLaIaOCA9N6tk0tLzd7UG5I6yW2PNEbloDMJ+Oa
	RjlSo1nUm0ukU26Rs1ZcZoS+ewxP
X-Google-Smtp-Source: APXvYqz1Qlk2Q1s2uBORILH4u2oruRhk6IId+X6ggWP9xi/p92ZM8i1YKphMdvu4lgDQBShO+xCU1Q==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr2940731wmk.72.1558432825238;
	Tue, 21 May 2019 03:00:25 -0700 (PDT)
Received: from jondnuc.lan ([176.230.64.64])
	by smtp.gmail.com with ESMTPSA id 65sm3080257wro.85.2019.05.21.03.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 03:00:24 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 12:59:43 +0300
Message-Id: <20190521095948.8204-16-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521095948.8204-1-arilou@gmail.com>
References: <20190521095948.8204-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v10 15/20] gdbstub: Implement step (s pkt) with
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
 gdbstub.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index b35acc679c..a8b81121c5 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1794,6 +1794,16 @@ static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue(gdb_ctx->s);
 }
 
+static void handle_step(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    if (gdb_ctx->num_params) {
+        gdb_set_cpu_pc(gdb_ctx->s, (target_ulong)gdb_ctx->params[0].val_ull);
+    }
+
+    cpu_single_step(gdb_ctx->s->c_cpu, sstep_flags);
+    gdb_continue(gdb_ctx->s);
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1926,13 +1936,16 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         break;
     case 's':
-        if (*p != '\0') {
-            addr = strtoull(p, (char **)&p, 16);
-            gdb_set_cpu_pc(s, addr);
+        {
+            static const GdbCmdParseEntry step_cmd_desc = {
+                .handler = handle_step,
+                .cmd = "s",
+                .cmd_startswith = 1,
+                .schema = "L0"
+            };
+            cmd_parser = &step_cmd_desc;
         }
-        cpu_single_step(s->c_cpu, sstep_flags);
-        gdb_continue(s);
-        return RS_IDLE;
+        break;
     case 'F':
         {
             static const GdbCmdParseEntry file_io_cmd_desc = {
-- 
2.21.0


