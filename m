Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F630F9B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 16:05:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWiA9-00079P-CG
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 10:05:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhp3-0007ip-1G
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhp1-0000je-TK
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:53 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42182)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWhp1-0000ix-OG
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:51 -0400
Received: by mail-oi1-x241.google.com with SMTP id v25so7163140oic.9
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ukF5U5/YWULrIZTRqlrGB8Y3cOFI0trhAV1LyR0c8Es=;
	b=lWQhEC2IaAIRs7J/QGxTu6dKe0hqaytXLP4CB+uJsV1vlmK0Vns31smwNY67rYfCJ6
	t4WTnRClJma1C/Nrg6hGgiHiGPj/4dOEXEfrZOC3H7JY166S6POXM4o6+cjRbHj4XbKL
	4VJcFkLu4adhzLfHn3cGhH5AvKPHCrmLn6sUty8GBUtTC5QgGg2YP5u4ou5Cc7cVzHSp
	z/X+nWF0UlmxlwBJOSmYjzt6nHLrrma4Gq5w15xwRIYKWlTwB2Cyshaw6nI8eaJ/GkNS
	pYFZXEDRPB/nBsBr0oT87xH5NZotkLXig/dCABuRFaud1qq9qghJZo1NG9HD+AuMnI7Z
	SV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ukF5U5/YWULrIZTRqlrGB8Y3cOFI0trhAV1LyR0c8Es=;
	b=Qk6kUNCRtvusxFrDLTNa5UhXKBzhma87inKlzxkjXjpV/KF5fXk8wZox/ePoV9L6T+
	w9+ju97w7GjLEkADvvNJYfeJPDnC8pGM6e+WhzNwmkWFEiITZ70eNS+AsLwsjZtvIIQ2
	LovAWdkL+uVuYkUB/pSPNLtfAneDoXHOCMZn0CIrxjiUuuPdAyf9MpOaD3q5ozzQv0gy
	RWnyC4+fE9hfRMOnS7BtnBAyRGViL+PEaIwHKlD02/PK6/YOD/bL0OdD/cqoI4p+0Qbe
	yZGXFUiRIameVPPrNa6eD9oAzPQ0rQCJLtr8OLtnXjw1tqSQFkK0MV2KcpawKcwxet8c
	lE2g==
X-Gm-Message-State: APjAAAUZTJlVFbWVewFG2NMg1L7ecYPmq3/s/3I2H/07IiJJM7PiYO3I
	w6/JU59eDa2ZUXBy0J+ka64BGKlV7eIUsQ==
X-Google-Smtp-Source: APXvYqz1VDYT98fGX8nwnVDw77yzrO4z8UB+2RTYa07nxqxZ4gt+xzOOJpBG8hvQq3paNWuzzjJWeg==
X-Received: by 2002:aca:3942:: with SMTP id g63mr5265549oia.48.1559310230879; 
	Fri, 31 May 2019 06:43:50 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	r23sm2391176otg.49.2019.05.31.06.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 06:43:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 08:43:15 -0500
Message-Id: <20190531134315.4109-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531134315.4109-1-richard.henderson@linaro.org>
References: <20190531134315.4109-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: [Qemu-devel] [PATCH v16 23/23] target/rx: Dump bytes for each insn
 during disassembly
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
Cc: philmd@redhat.com, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are so many different forms of each RX instruction
that it will be very useful to be able to look at the bytes
to see on which path a bug may lie.

Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/disas.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index 5a32a87534..d73b53db44 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -102,7 +102,21 @@ static int bdsp_s(DisasContext *ctx, int d)
 /* Include the auto-generated decoder.  */
 #include "decode.inc.c"
 
-#define prt(...) (ctx->dis->fprintf_func)((ctx->dis->stream), __VA_ARGS__)
+static void dump_bytes(DisasContext *ctx)
+{
+    int i, len = ctx->len;
+
+    for (i = 0; i < len; ++i) {
+        ctx->dis->fprintf_func(ctx->dis->stream, "%02x ", ctx->bytes[i]);
+    }
+    ctx->dis->fprintf_func(ctx->dis->stream, "%*c", (8 - i) * 3, '\t');
+}
+
+#define prt(...) \
+    do {                                                        \
+        dump_bytes(ctx);                                        \
+        ctx->dis->fprintf_func(ctx->dis->stream, __VA_ARGS__);  \
+    } while (0)
 
 #define RX_MEMORY_BYTE 0
 #define RX_MEMORY_WORD 1
-- 
2.17.1


