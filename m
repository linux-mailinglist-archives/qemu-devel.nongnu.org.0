Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A27887E7
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:20:31 +0200 (CEST)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwIrm-0004Tf-62
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkx-0005sX-Fd
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkw-0004NJ-F9
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:27 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkw-0004N3-A7
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:26 -0400
Received: by mail-ot1-x342.google.com with SMTP id o101so5583985ota.8
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxPwpX1GW/1SZtW0nrtEipcgu8BrO/U7byXPZhHTfV8=;
 b=vY70WQCnXdrUCSy2On0pGeSJz+Ng37MhHQPxpHhYRUMmYjcViehElx/Tps9tLGR732
 5fd7dv2MC3YJY0LwphdXcBJIKm4T45DDCAvKeN9yGyampb7ZENodFvp0WURBuvUWybP1
 Zhmg0EwtaAXA54yKsKN9tCvSpnrZrWdvt6OOPiBzcBzt63yV4N95yHqcSCfDwf01+XLD
 UUmqFNQJHf68IZxuFP9nmvmKIwcL+4zm2cKS7BLONTXNftLtaEjfeUF2jOUTSLnnsWo7
 Oyh8rUEg8Ai1o/h+d9f96sulU54eOdLp+PsZpMD41xL60gaVbn9iyFrJ52KKDnxqNKP7
 C2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WxPwpX1GW/1SZtW0nrtEipcgu8BrO/U7byXPZhHTfV8=;
 b=YnL3mEYpHnbQcifvEHH5A2+ubRAlursT5x5Chr+E6QjV/6e63jeJr2xDpPGPAoXtcE
 LhodDq8Q35q2Rv//PMz4gWSvSyc67jmbSLdtBnPjHmuA9aqRjvp58k314oMGDIHb+TCB
 X3N8goaJf0eymWnQuWxEgSQWKxbdYt2UAA3xv9zPstAzGLyY1JRGnuOFLPygdT/WXdw5
 JNfFQYm+mp55p84NddtDPFNT0xS0hH0B600YOHsQ4hSbC232jy2cWDvR6vJ0uRSqXGx7
 91Nsfj7D/h2QcQZEMaTP+1ilu5yCESMCaQP8nMDtb2PgPTr92fEbmy5x+MdUT87hrhMl
 +qwA==
X-Gm-Message-State: APjAAAU3l0vHoX3dhJgYiKtpMEV48kjfMNWdw57fxQ4YatqSFFOEqnYd
 rppUps17Qzfjl1sIQGwk8JDd8Zu2
X-Google-Smtp-Source: APXvYqz6TZXIK1CPRwIVU22Ov/jnQuT0z8KvMyY8WpAMUaSxCNCTX0gm8mLVolzslrYjTrfB0OKHpQ==
X-Received: by 2002:a9d:3e4e:: with SMTP id h14mr19830202otg.182.1565410405653; 
 Fri, 09 Aug 2019 21:13:25 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:25 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:35 -0400
Message-Id: <20190810041255.6820-20-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: [Qemu-devel] [RFC PATCH v2 19/39] target/i386: introduce generic
 operand alias
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It turns out it is useful to be able to declare operand name
aliases. Introduce a macro to capture this functionality.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 0bee7288e6..cd2467e6a5 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4610,6 +4610,15 @@ static int ck_cpuid(CPUX86State *env, DisasContext *s, int ck_cpuid_feat)
         }                                               \
     } while (0)
 
+/*
+ * "Alias" operand helper
+ */
+#define INSNOP_ALIAS(opT, opT2)                               \
+    INSNOP(opT, insnop_t(opT2),                               \
+           return insnop_init(opT2)(env, s, modrm, op),       \
+           insnop_prepare(opT2)(env, s, modrm, op),           \
+           insnop_finalize(opT2)(env, s, modrm, op))
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1


