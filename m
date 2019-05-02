Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C21145A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 09:41:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM6Ls-0006SP-S1
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 03:41:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6AD-00052b-Rf
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hM6A3-0002tl-Pz
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:29:47 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hM69v-0000jZ-Lo
	for qemu-devel@nongnu.org; Thu, 02 May 2019 03:29:37 -0400
Received: by mail-wr1-x444.google.com with SMTP id f7so1831542wrs.2
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0s6me8TS+YJwMJaLYgFa/gUYh4mdTLo/usW+gDFwuc4=;
	b=W1f0oXW0udUzCj6hVNoZMmevJaV+VXN2zc97NBTFTZO5+KUcwMeIM7WiWPWtGehVR5
	AGIcqLKBHkpzlOcZVrl5/og1ebq8uNjso0UF4jdWvuLuluNZ9NzboTjsroyKMDBobdh8
	d7kID+ZOtm/yflTE9BjytH7PvKAyklh3wTxH6h6mz5tJmMTAlIK9t7fLgG9tQeO3GPA3
	1N5mELi8fjUHrDh7xHgvrCaatUJPZVBS/3GmXe8vQVT7YYXyucbzM8WlZas/g+LQHsVO
	xS4Ov0wg+AWvyoL/EyIJmBcloAH8/HHoqrEYyIVNhk9a8kQiqnliwwxM3g1HAFJkhK9C
	l2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0s6me8TS+YJwMJaLYgFa/gUYh4mdTLo/usW+gDFwuc4=;
	b=pXZGI4WfKiKlTWsMmFxPOnBqUWcDb7ApgO9v/CDOhtcgDMbeUvcPNmr4vYMDjCZzHW
	rCoaAVu3iMNlZYNBOTwX6qZ+T68E+ceO1k3SUkwEWsiXB3Efb9xQlfGBGG/r5j3HSxto
	mHkCzUttoESMohCB5oRontShDocI484O104/5Oi8egHHwIPS3xATpPP6knuMDma/jsPv
	kIh5sZn6VQFvRbMVKU5gD2CwaQMgFYjJZKGllqEQBB3ixHTEyjNA+e4hUOLvwcG8A7bV
	azfS6uuQtjNTpZT1BpnxGMfB/8y3e0egVHh8gDikRibLl9pn+kiG1sqY8kyqxPBdIhcP
	RQaA==
X-Gm-Message-State: APjAAAWr2JhVtr9VF7TJ8slmqWJXyyzyLPe3q+I094Wjm7SZOsjmYljD
	RDGqtR26CN3GbjZGl962TYpUCXWF
X-Google-Smtp-Source: APXvYqxTmvZKv/gl0fvdYLMxqRmA1kRBTHEoh21V/GelxquMuU/Tq4SWyenQ9qRCYKrqlKM/K5CXOg==
X-Received: by 2002:a05:6000:1184:: with SMTP id g4mr8770wrx.70.1556782051771; 
	Thu, 02 May 2019 00:27:31 -0700 (PDT)
Received: from localhost.localdomain ([176.230.64.186])
	by smtp.gmail.com with ESMTPSA id z5sm8769289wre.70.2019.05.02.00.27.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 00:27:31 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 10:26:36 +0300
Message-Id: <20190502072641.4667-23-arilou@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502072641.4667-1-arilou@gmail.com>
References: <20190502072641.4667-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v8 22/27] gdbstub: Implement generic query
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
Cc: liran.alon@oracle.com, alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
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


