Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05B38751
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:48:03 +0200 (CEST)
Received: from localhost ([::1]:47606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZBTf-0003e2-2g
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAvQ-0002Bu-80
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAvL-0004oH-VU
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:12:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:54139)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hZAvI-0004fx-7i
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:12:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id x15so1233607wmj.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 02:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wBpPG2QSWocir6/2nFFz+iLLwOYsMTxKGDZ5nY+8mc=;
 b=D0YkxFpd9q8z8zKYTs9lUfAWsuyEf5AM0XbBfwROaurTBdkulw3LIkk1TnYT8nBFLO
 fZOmtrBYUpAoJHO23ODzUtSaHUky3bGY7wcIwIRRoRcRvyNJJW6x69W0OukndpZYjh9u
 Qipn1zIyOCz7X0V/goZgt0cyQODV4oBWOEywboz65JaLBuqFWA4ZtQgFQu1XqVHH8o4u
 PLALjz1JEuiqXPQO2irjvmmcSMDVF050A/yZK4kYKq2US/5HYJ0LbhgIVfZivfaSzRcm
 wTtsU35ll0AUlMpvsjxUMEdmPD2I0uTusr7iOwX5PRxI69UC9uSFh+jDKYxBd0XOdxE7
 HBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wBpPG2QSWocir6/2nFFz+iLLwOYsMTxKGDZ5nY+8mc=;
 b=LS1rCU8jAbU+EdZa584gHjkC4vBe78zatb6Pi1Yyi8Fkw75KbPbtJVWsCD2sLyRmEK
 3yAUjm1w3Qdl6Ne5PJ0Ltu2NYNavOU6exUsdGCqn+hSuwq5C08itJQSPYYhlVgB5+UZv
 Ozl5jChlGsmpRPMWS8iUKhg4AmLFut5MQGyvsTTQn4a+Rn2Fr5gHfN60Rq+9MzV4IjSn
 XNR/0xHcrGxJu8Nl7kILpPmRK9vGkdfYg5QunXUWTmLRDzCUOYXqJHFdr3F/7Ev/21Xt
 XODb7PgU9LoUkkzaC1q+WTB9nE/q+9+Vh4L6/sBYwR7KILomsKO6kD6/PHk3hdWnyRRn
 PCDQ==
X-Gm-Message-State: APjAAAVdwm7CGoOkMhOYX0kMT+/xqNysEMyymlRKsT/lwUHRxPzQs2IN
 KA5BGvzMEr/zyrXfvY+HGmpWVA==
X-Google-Smtp-Source: APXvYqzZ1zsQGLO2ue1tyYRvnaFhzXccxF0iWUeGT4dH+LPOc+JrVeb/fIq2jw4ym6g3gMS4enQBqg==
X-Received: by 2002:a1c:9e92:: with SMTP id h140mr2735211wme.82.1559898750189; 
 Fri, 07 Jun 2019 02:12:30 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id 34sm1732729wre.32.2019.06.07.02.12.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 02:12:27 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5EA021FFC1;
 Fri,  7 Jun 2019 10:05:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Fri,  7 Jun 2019 10:05:41 +0100
Message-Id: <20190607090552.12434-43-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607090552.12434-1-alex.bennee@linaro.org>
References: <20190607090552.12434-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
Subject: [Qemu-devel] [PULL 42/52] gdbstub: Implement write memory (M pkt)
 with new infra
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jon Doron <arilou@gmail.com>

Signed-off-by: Jon Doron <arilou@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20190529064148.19856-11-arilou@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/gdbstub.c b/gdbstub.c
index 63809b2ab9..681a0c8550 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1702,6 +1702,31 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, gdb_ctx->str_buf);
 }
 
+static void handle_write_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    if (gdb_ctx->num_params != 3) {
+        put_packet(gdb_ctx->s, "E22");
+        return;
+    }
+
+    /* hextomem() reads 2*len bytes */
+    if (gdb_ctx->params[1].val_ull > strlen(gdb_ctx->params[2].data) / 2) {
+        put_packet(gdb_ctx->s, "E22");
+        return;
+    }
+
+    hextomem(gdb_ctx->mem_buf, gdb_ctx->params[2].data,
+             gdb_ctx->params[1].val_ull);
+    if (target_memory_rw_debug(gdb_ctx->s->g_cpu, gdb_ctx->params[0].val_ull,
+                               gdb_ctx->mem_buf,
+                               gdb_ctx->params[1].val_ull, true)) {
+        put_packet(gdb_ctx->s, "E14");
+        return;
+    }
+
+    put_packet(gdb_ctx->s, "OK");
+}
+
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
@@ -1910,24 +1935,14 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         break;
     case 'M':
-        addr = strtoull(p, (char **)&p, 16);
-        if (*p == ',')
-            p++;
-        len = strtoull(p, (char **)&p, 16);
-        if (*p == ':')
-            p++;
-
-        /* hextomem() reads 2*len bytes */
-        if (len > strlen(p) / 2) {
-            put_packet (s, "E22");
-            break;
-        }
-        hextomem(mem_buf, p, len);
-        if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
-                                   true) != 0) {
-            put_packet(s, "E14");
-        } else {
-            put_packet(s, "OK");
+        {
+            static const GdbCmdParseEntry write_mem_cmd_desc = {
+                .handler = handle_write_mem,
+                .cmd = "M",
+                .cmd_startswith = 1,
+                .schema = "L,L:s0"
+            };
+            cmd_parser = &write_mem_cmd_desc;
         }
         break;
     case 'p':
-- 
2.20.1


