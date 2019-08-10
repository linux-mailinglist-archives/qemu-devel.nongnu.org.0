Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD7887D8
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:15:17 +0200 (CEST)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwImi-0002dH-US
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIko-0005PC-Of
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkn-0004Fx-K9
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:18 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44992)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkn-0004Fp-Fn
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:17 -0400
Received: by mail-ot1-x343.google.com with SMTP id b7so90233340otl.11
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAcvgP4Isw7Hfqe0q/GzuOtPct/EkGIUWGKaxvtkJzo=;
 b=B/GdNl8uEz9ez4yNhPbXeRK5D81FqoTCXLBmLU3HVzydkDw7fTkRE9jgVQd1o5Fwbk
 RJzvWE7Dx6VZPRKwhkgfN/uof3CtBsbm03DGZL10fb1g7o2wfIBwmA7rjs8AsDzUjZYS
 Sc+6fFh9vNJF4cl6fAgREUYreTQaihHOmvynIcBedC0eGy0Fo5d9mZMshvsG1LpiIYDV
 vE1YJPbjzYffJx2yqjNDm2pvsr/pXxWxs9//ikzinRFqc6uGsdxawZLTiTtPEKOHg7uP
 1dSfn+ZvLJNmZcnqKt0sC/1y7owhmiSOe/R94/q7c0RqUWtT49HmA97fAwAnKgRIhbQG
 bYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAcvgP4Isw7Hfqe0q/GzuOtPct/EkGIUWGKaxvtkJzo=;
 b=M9ygHuQ81MyOggcAkEmJxs9W+xURe8xvnzCQXAi4kHG4s/I5AbPwis9T7J3+V5mOil
 W4dYIe93ieXfd3Ood/ubuwyCXe/jM8EpMRhQbGX2qRRbpoAD9dYP8tt1faBwbhmvFmvY
 KJPVykLfiSOsb3FKLpp5LjELWxEu6fzxiAsG9XgbC1tcaUL7iGmgstl58L9PepYq7gYb
 g6eR3Y2OpQzRsrtG44IB2GEhzQo9ma2ZopTbRsoTEYBObS8kxNmkR21Hk6O7Tl1g4eU8
 A4zs0mj3icZQjOlLGeMb1hjB+D9X/gcGPDsgNzH0WKx1dm/7/aajyFh0kB1yWXMDxsem
 RLXw==
X-Gm-Message-State: APjAAAVaAo+BohngiUTwOBbJznn5QW9EMijjYb3UVsyfvY+J6jhTBARO
 WmgiI0Eg4D3rwnS9I/PDtoVYuStO
X-Google-Smtp-Source: APXvYqxrM0Z+eQC7q8yxKZwAvTIyPpiPsjj/4SCdGy18kRwCM7RdT3jliMYPqXzeXfm+wtPokbUo9w==
X-Received: by 2002:a9d:7988:: with SMTP id h8mr20925964otm.301.1565410396806; 
 Fri, 09 Aug 2019 21:13:16 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:16 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:25 -0400
Message-Id: <20190810041255.6820-10-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-devel] [RFC PATCH v2 09/39] target/i386: make variable is_xmm
 const
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

The variable is_xmm does not change value after assignment, so make
this fact explicit by marking it const.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 8bf39b73c4..c5ec309fe2 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -3042,7 +3042,7 @@ static const struct SSEOpHelper_eppi sse_op_table7[256] = {
 
 static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 {
-    int op1_offset, op2_offset, is_xmm, val;
+    int op1_offset, op2_offset, val;
     int modrm, mod, rm, reg;
     SSEFunc_0_epp sse_fn_epp;
     SSEFunc_0_eppi sse_fn_eppi;
@@ -3056,20 +3056,15 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         : s->prefix & PREFIX_REPZ ? 2
         : s->prefix & PREFIX_REPNZ ? 3
         : 0;
+    const int is_xmm =
+        (0x10 <= b && b <= 0x5f)
+        || b == 0xc6
+        || b == 0xc2
+        || !!b1;
     sse_fn_epp = sse_op_table1[b][b1];
     if (!sse_fn_epp) {
         goto unknown_op;
     }
-    if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
-        is_xmm = 1;
-    } else {
-        if (b1 == 0) {
-            /* MMX case */
-            is_xmm = 0;
-        } else {
-            is_xmm = 1;
-        }
-    }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
         gen_exception(s, EXCP07_PREX);
-- 
2.20.1


