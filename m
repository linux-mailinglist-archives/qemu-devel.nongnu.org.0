Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3A98240
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 20:03:40 +0200 (CEST)
Received: from localhost ([::1]:51470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0UxO-0001a0-L8
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 14:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URB-0000y8-0j
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0UR9-0007I1-Tp
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:20 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:44226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0UR9-0007Hn-Po
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:19 -0400
Received: by mail-yb1-xb41.google.com with SMTP id y21so1329187ybi.11
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jS+rLYgxOqIa8/bxsHiDIZiaK1N2ucGgGDJ5Wj9+e7w=;
 b=YFZs8vUBuuO/1tlqZ1ku0SsxOWi3NSAYNxfco/azk5unhNJkCqWHoIXKBb1RWjBqtj
 pVbxLq9yGCnVfhxn6F4i5JGM1iU68BtZooS6bZFbxzYyd74AKb2yzc3TVcCE53KC0Clj
 JF0NcqGfVlxlRijXGtfzB9qsVF35ZZ9/gKPM8TANnX+P31pink36R70MKmbo0MA31NWF
 gaecxTnIy68tdVldVMEZrTGilCSnzFQOwBKKtqgArZgGcmIQgpdP6khFz7JETJBLD/mh
 vWH5VisZydQh3WCaxWPjy5O7b3ocJ9HvBI30eMi+jZhEK2vlt2iBD3KZsMirW2fdz6YP
 rzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jS+rLYgxOqIa8/bxsHiDIZiaK1N2ucGgGDJ5Wj9+e7w=;
 b=bg8jrxFWoasSwJjAGdxdbWPoVne4FA9oOoOfW0PaHqkUm8zIadS7G3Yr5oPOaDHg19
 kHHRB+Vr0Bvh4Xvjt9jWh2haxUMzehVq3xm/vCJaXNyb5D6UUC2vcN7CWUNu4u3FAHoh
 yQI8BXSGJYsUT0HxRgH7PHrpKLQNpkG1f4P0VfQwA+3kwZvnO1d59eafbcZK+IOFUuWZ
 gJgInohFnF2Z3Q+xhfvnBMY83oVX7Q996vFZ9FTspKkuSzrPiiuN7kSELLaZ0AJgXX4+
 7FZxdKFGuZqEf8sEfSwf/U+xBYLRssgybPt5HvCUAcn1Gi3vWa1cVWTzT4LTHpYI1iwR
 WLjQ==
X-Gm-Message-State: APjAAAWwDMvryB1xIlDNA2fiL2a24x2g3mw6kumEyIZlBXX1Z2K1Vcsd
 2DOJLjiK6pRxDODHX92aO67E69WR
X-Google-Smtp-Source: APXvYqw9guS2f10ej8yDGrrA/+NmBCRK3PyB9q3dhCQ000tek7vjIzw4I+8TXBTQH+8Q4BoyQpMCaA==
X-Received: by 2002:a25:2f42:: with SMTP id v63mr24151993ybv.228.1566408619155; 
 Wed, 21 Aug 2019 10:30:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:30:18 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:28:54 -0400
Message-Id: <20190821172951.15333-19-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-devel] [RFC PATCH v4 18/75] target/i386: introduce generic
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
 target/i386/translate.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 78ef0e6608..a6f23bae4e 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4606,6 +4606,26 @@ static bool check_cpuid(CPUX86State *env, DisasContext *s, CheckCpuidFeat feat)
                                      int modrm, bool is_write,  \
                                      insnop_arg_t(opT) arg)
 
+/*
+ * Operand alias
+ */
+#define DEF_INSNOP_ALIAS(opT, opT2)                                     \
+    typedef insnop_arg_t(opT2) insnop_arg_t(opT);                       \
+    typedef insnop_ctxt_t(opT2) insnop_ctxt_t(opT);                     \
+                                                                        \
+    INSNOP_INIT(opT)                                                    \
+    {                                                                   \
+        return insnop_init(opT2)(ctxt, env, s, modrm, is_write);        \
+    }                                                                   \
+    INSNOP_PREPARE(opT)                                                 \
+    {                                                                   \
+        return insnop_prepare(opT2)(ctxt, env, s, modrm, is_write);     \
+    }                                                                   \
+    INSNOP_FINALIZE(opT)                                                \
+    {                                                                   \
+        insnop_finalize(opT2)(ctxt, env, s, modrm, is_write, arg);      \
+    }
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1


