Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67211435
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 09:34:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6EZ-0008BB-7Z
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 03:34:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM69S-0004JF-VZ
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM69Q-0002SK-4V
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:29:05 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36222)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM69G-000056-Nr
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:28:58 -0400
Received: by mail-wr1-x443.google.com with SMTP id o4so1817405wra.3
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x82aHJMzl8f+PCXWhu2ZX9N8tzch1kuJG+XquT6URF0=;
	b=IXsZ9WJ2JUvn/1lBaWmCeiA/2YPQWM6O+Nm6TOnKRmip/j06SKj8Dcwe+IsigY2URw
	JNEnGKdDLE0XvN1FgaDjNq3Wolj3Q51MfKIUlixCl3pa3r8CYK0GGCiMx8Bf6+iQShZr
	jGHbQHquAU9R7yqOzxi5uGcWBA5WHYmtlb4xBs4BHlOvB8RRYrHiAJQmQl8sEIx9onpM
	vNNVkWxw+elHEuAaxr0rOvWQ+r4UhnfMwKqVj6B9vnIdkSzpY1AaKFbu2zBaTRK09zZD
	NR3IXNdMOjoqWgzbgG0iK/fb+RtQkCySdPKinjTiJgjLLOR49tDPaqEZeJPx5xqmmz2K
	cQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x82aHJMzl8f+PCXWhu2ZX9N8tzch1kuJG+XquT6URF0=;
	b=nbzUA+q4oIZPqHCfeKRpaJMjYatxQr7K0RF8OR/62eEeClm5KzHw1apCjwfdUkdXbN
	umz6ugPlVjfZqgtFSMKmTnBMF4V1LejvTfArjlf9iGUJjY7dfvLXrAf3Rv5RUmxk5kEB
	6Mv/CvRwDA1pXA2j7pxSU4HRwjNSEol5fqfowqghOgSdbWl7Uax83Gi8wbooEQtROk8q
	jF8wKwFkmg2M6JlMeLYAdOQ9PUtGV2fmrbc9/otJR7FasKqEIxsMEHTj07qHd2x92A+U
	znAFpxEda4IEnkavNVlJHHOmrBlVi6b7PKx4u9Hl6HQrZYLA0KAgzCpaC67sB+xz2Im8
	dQZA==
X-Gm-Message-State: APjAAAW/zoiuAklJodW4/fFkBuwIT8khheU+0fimmi5znUkO5J2+5XEc
	99uXQRrEvKux8EmeGos0LMyZ2EcL
X-Google-Smtp-Source: APXvYqxUBZk85K3lri+CL0t2ly9IsRUDNT6rE1c/lxK94AojZGezQEakGLVhSq53sifX7Qx/QsBfTA==
X-Received: by 2002:adf:a28b:: with SMTP id s11mr1556815wra.16.1556782021544; 
	Thu, 02 May 2019 00:27:01 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id z5sm8769289wre.70.2019.05.02.00.26.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 00:27:00 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 10:26:19 +0300
Message-Id: <20190502072641.4667-6-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502072641.4667-1-arilou@gmail.com>
References: <20190502072641.4667-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v8 05/27] gdbstub: Implement continue with
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
Cc: liran.alon@oracle.com, alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 gdbstub.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 89f1ab6524..469aaeb875 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1532,6 +1532,21 @@ static void handle_continue(GdbCmdContext *gdb_ctx, void *user_ctx)
     gdb_continue(gdb_ctx->s);
 }
 
+static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    unsigned long signal = 0;
+
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
@@ -1579,11 +1594,16 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
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
2.20.1


