Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED1A11561
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 10:27:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM73v-0004Rl-C9
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 04:27:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6te-0003V0-At
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6ta-0007z6-Cv
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:48 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36600)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM6tY-0007mD-Ej
	for qemu-devel@nongnu.org; Thu, 02 May 2019 04:16:46 -0400
Received: by mail-wr1-x444.google.com with SMTP id o4so2024719wra.3
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0s6me8TS+YJwMJaLYgFa/gUYh4mdTLo/usW+gDFwuc4=;
	b=KXgsuRQdQojeqMmAJ6wkiSC1QotI7q+wigaTorSC8jpfYuHHwqAV+Zt1FW8eH1EL6i
	37IqjBZ5MIz1ZJzgBOkkei8ZcL7H9Aw4ny3KFBsLKpvgSvRzRDCxjMl+cWJJ3skCzEA7
	ptOj+hzkoPPIZM9e8GSaOgEVaW2uIKU2fhYUAsQ165WfsUJmMfz2HGDR2DuDU3S907nL
	tzo0XNFSHpRX7qByTS9QFT4qKHjfcXlOyuH4r9mbNxGpX3ol5GobmthfLZaR1JIiZCRg
	KplbRXGHIfsVsvgJ3F+nEmgdk0fvHVKb52eUT/yc39JfXPPqy4JQGhLUDISFYTVML+CF
	4neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0s6me8TS+YJwMJaLYgFa/gUYh4mdTLo/usW+gDFwuc4=;
	b=KA3e/J4ZKYj4cEm7LnjlFFGe6TLCkSm7yKLrwQCpPwOgWGxHpoxwD0Q7fETRqEwnHJ
	RtKRvQ3F/NckCgnzZFAOGhe9/weLPi7JooUClh39OB9t5t78lYxzW+vVi3e3ovoMujAQ
	eADToCp1yPh5RouL7uXV0lykE8mcpBFZdKashVCKuAUMqQXJEfYaJIEULFeZKIaTGw/F
	YOp5/xEPuvu4C4Eqz7E0wMfz2qGvYaxe2Rq5W4jPpln24ndQIGf4Ht5mzwy6ipTqM4bD
	aVofnA2/Rq6CDrtVIjFuYZm8uXxFCcnj4vVvGfGLSmGv3qugXRuMkw9TiXJbtxncr8hu
	E+LQ==
X-Gm-Message-State: APjAAAUdbnfEVXrZR3pmvn/6+HEYxx1UeujU58oSTMX+f8ELzPr7kKQl
	aS2Bhvuv6GSK7Jopv6vA6WIrA+E+
X-Google-Smtp-Source: APXvYqxM7OIbbHRws0Pgz7QBsaiKNDV7LkYNLWY/tYmKUOge3EhNmy/mkMhCf9wl9YV4HQ8QDQbtiw==
X-Received: by 2002:adf:f7cd:: with SMTP id a13mr1793293wrq.289.1556785001590; 
	Thu, 02 May 2019 01:16:41 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id
	d16sm44698367wra.54.2019.05.02.01.16.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 01:16:40 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 11:15:49 +0300
Message-Id: <20190502081554.5521-23-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502081554.5521-1-arilou@gmail.com>
References: <20190502081554.5521-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v9 22/27] gdbstub: Implement generic query
 qemu.Supported
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

qemu.Supported query reply back with the supported qemu query/set
commands (commands are seperated with a semicolon from each other).

gdb> maint packet qqemu.Supported

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 gdbstub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 8bdfae4b29..00c07d6ec0 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2127,6 +2127,11 @@ static void handle_query_attached(GdbCmdContext *gdb_ctx, void *user_ctx)
     put_packet(gdb_ctx->s, GDB_ATTACHED);
 }
 
+static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
+{
+    put_packet(gdb_ctx->s, "sstepbits;sstep");
+}
+
 static GdbCmdParseEntry gdb_gen_query_set_common_table[] = {
     /* Order is important if has same prefix */
     {
@@ -2203,6 +2208,10 @@ static GdbCmdParseEntry gdb_gen_query_table[] = {
         .handler = handle_query_attached,
         .cmd = "Attached",
     },
+    {
+        .handler = handle_query_qemu_supported,
+        .cmd = "qemu.Supported",
+    },
 };
 
 static void handle_gen_query(GdbCmdContext *gdb_ctx, void *user_ctx)
-- 
2.20.1


