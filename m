Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF6F981C7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 19:52:33 +0200 (CEST)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Umd-0004Z1-Rr
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 13:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URJ-0001CY-U1
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URJ-0007Y3-0b
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:29 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:34115)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0URG-0007SV-He
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:27 -0400
Received: by mail-yb1-xb43.google.com with SMTP id u68so1356279ybg.1
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKnxDUl+pAS+n7e2NGlRxgig6yb22d1z6rELIvzn6Yg=;
 b=r5zeisa3m8t866tcsegYfLtu5+E6a8eg7w9MbR8oPXD7Sf2R1IB+wUFkJY2Qz3aRkh
 nOZ5of8LHREQ3UkfnJac6387a4mxGPjNjYyPTKRMAM4VZ/JcAN3Js7SB86UQ2FVo217y
 klcnbxUyw16+x0TVRDwfk1CVjTxHTRxqBqIx1KUlETZbD+2B8i8puBd/Rs6yJmdnQgNO
 Yn0jmTqXyCvNKgaMPzRTAalQfXN6CzSinB72mYSMW/C7pnZf+eIG9PpEkLZr3BjCf+G5
 i/n4pOq2m/6bbXQatkJIlhoyj53nr6yxrk70jUTj75oGmVeNoUYx4xYvERpXq6Xv2jNr
 4sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aKnxDUl+pAS+n7e2NGlRxgig6yb22d1z6rELIvzn6Yg=;
 b=jyadkH9yjviMz4dYvLDWRh70cA9tLpX+Dp8Ph82gzFBWyZgUGbBnXpcruaSk8d2DNk
 5rKXNGfJeXaaQ29RGaGjq/maQFeXYJoTxbqzGYgf1TIQAjrrt0GXRuz1tCIk0NL1Jd84
 rQ5rN6NUoMS4jjukTieg+50r2BnHQzgKjffvXyvR4+J+Jbl/a2A0oKUZrXmGyXR66+rZ
 9De0CzuIMrhuDjMUD8/kiBc8pjxwZAXgMeCHnfEaBO+z1vFjlnFt1yClX2pRR/wiXZBY
 12Z9eTEZGfOyKe6Qt40z6SkU9cjFsqOz8yr3bApwz7LYZ0A+33CeFGgYg7le61ZazJdh
 B95g==
X-Gm-Message-State: APjAAAXeF3ibW+4uyyLwC7FDoQWcZxA+FKMmSANCXKOlRgOO+fWZ5yhT
 OctJXY1/LQyMLNO1L75CDsDfZ54z
X-Google-Smtp-Source: APXvYqz9+rNiNH6SpyKg4wZzc5cot203hMBq8CXisOkmABA4EAxsOD0kAUMew+3zjJSFPSN5pXc0pw==
X-Received: by 2002:a25:ccd7:: with SMTP id
 l206mr24410486ybf.165.1566408625718; 
 Wed, 21 Aug 2019 10:30:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:30:24 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:29:01 -0400
Message-Id: <20190821172951.15333-26-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
Subject: [Qemu-devel] [RFC PATCH v4 25/75] target/i386: introduce Ib
 (immediate) operand
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

Introduce the immediate-byte operand, which loads a byte from the
instruction stream and passes its value as the operand.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 886f64a58f..9f02ea58d1 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4890,6 +4890,24 @@ INSNOP_FINALIZE(modrm_rm_direct)
     insnop_finalize(modrm_rm)(&ctxt->rm, env, s, modrm, is_write, arg);
 }
 
+/*
+ * Immediate operand
+ */
+typedef uint8_t insnop_arg_t(Ib);
+typedef struct {} insnop_ctxt_t(Ib);
+
+INSNOP_INIT(Ib)
+{
+    return true;
+}
+INSNOP_PREPARE(Ib)
+{
+    return x86_ldub_code(env, s);
+}
+INSNOP_FINALIZE(Ib)
+{
+}
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1


