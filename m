Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C322D2D5BC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsSV-0001b9-SZ
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:53:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsHo-0000zE-CA
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsHn-0000dD-DO
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:08 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hVsHn-0000SZ-8F
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:07 -0400
Received: by mail-wr1-x442.google.com with SMTP id d18so793423wrs.5
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 23:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EtefPPv82bU3jmtDczAi1mprca6DMOXKZgFlCzVJYC0=;
	b=gr65Q4xWrYS0PmeTHl1MUkM9MIQrReCnacTl4elZ1nJ/i+pHfhXHD6OccW9N+6odXC
	x72mso3hHOGT+42wifm7t7OGzVFhMVETscXZb6JO76n2aCPA2MZVk5ZWk919xyDz0l8V
	yzDrP3Q5YlU6QGkvJ3APaU3ibnCS7ihRes7iovTNpwBTiu6iG9BDvWygYtLZIlFQ1Q0z
	xQziafGxG7OLMbH3xTx2rl018+SQUb7rAUlL3bcuHau5O7U3XdPsjKfwbmAGAhbezV4N
	gFWvw5GroiHZEOxrPc0USAQ7dlYKx3X5rArp0vVO7xRS+wrTFoTRrqEnTvMN9Mw52Mdr
	XTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EtefPPv82bU3jmtDczAi1mprca6DMOXKZgFlCzVJYC0=;
	b=X+bI7iOxkp6bSsPbBRZLfzM3CtJlMOmNT5e+KTCgn7ppd3MTb4YdmTixGVHlmqfYC9
	88kZBDoFoe4c4RFXTYU32zOWBUW8mcw3rhSTHfOCa6/0W+0egtjhqH9jl/GY2+XZgJZc
	kasJZx1x8ko34AmXGCKIR25Cvc+A6TmWn3QfPty9F3WhbvnDGncGNOS/O7k3dzUpJ6Mr
	fNF8NVVv8byPY35xRmdxMz0oYGzrWiZT78NIghd9hDfbHsdvAmnw9/qefNOXWEzcM4YL
	+KmVDXMMVKlcFAQ1/d1dKEDD4LhnnTVa3r+/Q9gfV3uXlckTE6gz5W+b5nMLcbehTqp9
	IpAw==
X-Gm-Message-State: APjAAAVaUEJlfcZ7kUCYTGnSMl/qTgiVdFNoIXMEDJb/rwQl83XIL2DL
	YL6vLpbeCaa9hqst5N8D/yWkqFTO
X-Google-Smtp-Source: APXvYqxXgmnOfmy0GSeJqUwNUTCcgJBLZceH/e1m87naR5B7qFVmYXipakFMeZ+vk/OwpBL978Fc9Q==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr1550268wrq.285.1559112126045; 
	Tue, 28 May 2019 23:42:06 -0700 (PDT)
Received: from linux.local ([31.154.166.148])
	by smtp.gmail.com with ESMTPSA id f2sm6831168wme.12.2019.05.28.23.42.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 23:42:05 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 09:41:33 +0300
Message-Id: <20190529064148.19856-6-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529064148.19856-1-arilou@gmail.com>
References: <20190529064148.19856-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v12 05/20] gdbstub: Implement continue with
 signal (C pkt) with new infra
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
 gdbstub.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 99b78aa426..5df4d58427 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1541,6 +1541,25 @@ static void handle_continue(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue(gdb_ctx->s);
 }
 
+static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    unsigned long signal = 0;
+
+    /*
+     * Note: C sig;[addr] is currently unsupported and we simply
+     *       omit the addr parameter
+     */
+    if (gdb_ctx->num_params) {
+        signal = gdb_ctx->params[0].val_ul;
+    }
+
+    gdb_ctx->s->signal = gdb_signal_to_target(signal);
+    if (gdb_ctx->s->signal == -1) {
+        gdb_ctx->s->signal = 0;
+    }
+    gdb_continue(gdb_ctx->s);
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1588,11 +1607,16 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         break;
     case 'C':
-        s->signal = gdb_signal_to_target (strtoul(p, (char **)&p, 16));
-        if (s->signal == -1)
-            s->signal = 0;
-        gdb_continue(s);
-        return RS_IDLE;
+        {
+            static const GdbCmdParseEntry cont_with_sig_cmd_desc = {
+                .handler = handle_cont_with_sig,
+                .cmd = "C",
+                .cmd_startswith = 1,
+                .schema = "l0"
+            };
+            cmd_parser = &cont_with_sig_cmd_desc;
+        }
+        break;
     case 'v':
         if (strncmp(p, "Cont", 4) == 0) {
             p += 4;
-- 
2.21.0


