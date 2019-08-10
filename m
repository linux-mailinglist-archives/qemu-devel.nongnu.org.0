Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80E887D7
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:15:09 +0200 (CEST)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwIma-0002BZ-O5
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkn-0005Mf-S9
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkm-0004Fl-Sr
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:17 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkm-0004FY-Of
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:16 -0400
Received: by mail-ot1-x341.google.com with SMTP id f17so5088365otq.4
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l+C2s0/x9K7v+IIGqknAyrxawnw0HcYf8A60AmZ8LNU=;
 b=XRSXs+vqbJuclW1RvdF+cyeSGxChBXTM01lSu2zpfKOqpPRvz16B5zzygpWV1fHXzJ
 46rr+giXKB88Sn9zVd83KyHK3I+OJGNBroxIYZDhveogF5W3GlZK+NaKQ9cPY1EfB46D
 Ho3vL6mPPxLy/pezFxLB0Hs4ba4q/HN7xKmUGoFWhbx0vhJz85D15VLjDvk8o/ZtPlPu
 GPaqmHRzotAq+ISoF3cyLucudhwcdJDyBnBzusBJo3uQJsgUCeHi+OXZ6x+lEZT/JWxI
 XOaXrgY1GqrTFPanLKglXMhmxMjgjgGOAEjGbPrPxikG4fwdE/CWwqDNRJqcfXSY+cVx
 a1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l+C2s0/x9K7v+IIGqknAyrxawnw0HcYf8A60AmZ8LNU=;
 b=dZUONPE3Ykmykzad9ahFI/8VQUSfFBB9FW3lFHxsdfFc3REJNZZjvMCwRSgdh/VTN5
 oc8hTfsyN+QLKCfxLLoU0PSn0VuaT+oRGhWNIF1TMQCyT62x8yf85uHi/3DxFUNCYNMd
 GH+GDmIAYXnZN0gqd5q14+U0XeOMj1/SxcafxLmuHDp2KQs5+GJRVWB1iMq+GrFZZMMc
 jGn1AOZdUTVRJ6nXLAhhne/MpkcBjEH/IHWZwxWUgOa5WM3DlSyL5IiXL4HZUrJpogiA
 nfzpQnMpCpq9b6hKRKAZTWoFGvOPyt5WJswSkgyHp3Lc1IsJ+v+auMeqSPKkM86z0cCw
 8ivw==
X-Gm-Message-State: APjAAAW0v6fBzyT4QnpbMyO1OHzyAsCI/IXJ/uhaaDcnwa/NYmomBcsO
 l+djXAQvQ+gQsvfTr/auiP62xScJ
X-Google-Smtp-Source: APXvYqwx7oROdhFtb5BezWIb0jyiZEMNhctk7MQzmCRZQSd+zH89moqMTBPP6WSYmgtP9O9FD/XH0w==
X-Received: by 2002:a9d:f65:: with SMTP id 92mr6771685ott.24.1565410396000;
 Fri, 09 Aug 2019 21:13:16 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:15 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:24 -0400
Message-Id: <20190810041255.6820-9-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: [Qemu-devel] [RFC PATCH v2 08/39] target/i386: make variable b1
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

The variable b1 does not change value once assigned. Make this fact
explicit by marking it const.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index b1ba2fc3e5..8bf39b73c4 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -3042,7 +3042,7 @@ static const struct SSEOpHelper_eppi sse_op_table7[256] = {
 
 static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 {
-    int b1, op1_offset, op2_offset, is_xmm, val;
+    int op1_offset, op2_offset, is_xmm, val;
     int modrm, mod, rm, reg;
     SSEFunc_0_epp sse_fn_epp;
     SSEFunc_0_eppi sse_fn_eppi;
@@ -3051,14 +3051,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     TCGMemOp ot;
 
     b &= 0xff;
-    if (s->prefix & PREFIX_DATA)
-        b1 = 1;
-    else if (s->prefix & PREFIX_REPZ)
-        b1 = 2;
-    else if (s->prefix & PREFIX_REPNZ)
-        b1 = 3;
-    else
-        b1 = 0;
+    const int b1 =
+        s->prefix & PREFIX_DATA ? 1
+        : s->prefix & PREFIX_REPZ ? 2
+        : s->prefix & PREFIX_REPNZ ? 3
+        : 0;
     sse_fn_epp = sse_op_table1[b][b1];
     if (!sse_fn_epp) {
         goto unknown_op;
-- 
2.20.1


