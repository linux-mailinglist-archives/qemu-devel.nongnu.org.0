Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128D7CB55
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 20:00:36 +0200 (CEST)
Received: from localhost ([::1]:43379 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsstv-0008CY-58
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 14:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42661)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrA-00023C-Vr
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hssr9-0002h5-VQ
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:44 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:38822)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hssr9-0002fw-RU
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:43 -0400
Received: by mail-yb1-xb43.google.com with SMTP id j199so24745007ybg.5
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ekAymW7+Pf7uZP93T+0YUhPCN4vlbqsaROZQAkd+Pc=;
 b=vLAJzI/Gy5CDj9uzV67TJXjYqi91u5IaoAwEmdLazhBP53Kshly3KTKVVr+3Wt2CV0
 S7ia4psPrHlb0J5wGTTQLUEn8Cw961L3E/wNy+6NYru7t34EZAecOy3gAzKygc+1Q5LU
 wvFFee4rhf2SDejdCJ7DuJ/I/8f5HRIhM7E3ph7MH9SjtL7OgYdsE2MTLAXAtUUY4EeN
 epiwzukbPji/fm5DsG4h6viCJGRpBNIIWv6o49v20qCf/vj99eYkzbE0jhzB4j1cJxoj
 B7Yyq3vOPs+9gCT4Obtmp8SbLv3pxFn7DES9ye/R07zSv3udi3C+rNVsyzilzYMkvTiY
 vBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ekAymW7+Pf7uZP93T+0YUhPCN4vlbqsaROZQAkd+Pc=;
 b=gG4GjW7DgUtxH3cmj7xJRiUT5EsyIXUp6ObEa6A80iyats70UTu46mRBKcjy1vjMz2
 wB6DEOEvUWU1h3k62R0ilwo9gSCZM5UCFbMjb7dCR+3/hJl6jtHVddQl+ZeIdoFDiiQO
 DF0JApo9PgQoM+Ag70+TqhdXp3IuGUAiHrX4NoNHEJdMYGTUFTMIFjUtnQzrXxUejwUD
 l4ERR2zV8Svf6QILphkVee20SrkNjceeLoeZjx+mF0XqyeUhUdQvY74Pl50iuKiPEL8f
 SmYdvMu5BOaDdrtG8aqKcbh6kQXvJ6LkMwxKx5KOfcL4/qRZtmwLNze8CkOoXPeYrJ5S
 ij0w==
X-Gm-Message-State: APjAAAVJXMEgGqgGi/4leUbLx2svZ6h3GILaX6tezOsk5HfLWP0herlT
 F0h9iM8Dfp6cWDcU4V23QFJhOcJf
X-Google-Smtp-Source: APXvYqxcgi5vg/dBb/ht+KVNhlnMTd4CbsgxEP+QeCYTIx9xJHI6hs8C6tg9ZOyxBEOupWBmjvSnNA==
X-Received: by 2002:a25:d05:: with SMTP id 5mr43380216ybn.200.1564595863127;
 Wed, 31 Jul 2019 10:57:43 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id 206sm16077696ywk.44.2019.07.31.10.57.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:57:42 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 13:56:45 -0400
Message-Id: <20190731175702.4916-6-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175702.4916-1-jan.bobek@gmail.com>
References: <20190731175702.4916-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
Subject: [Qemu-devel] [RFC PATCH v1 05/22] target/i386: introduce
 gen_ld_modrm_* helpers
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jan Bobek <jan.bobek@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These help with decoding/loading ModR/M vector operands; the operand's
register offset is returned, which is suitable for use with gvec
infrastructure.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 9e22eca2dc..7548677e1f 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -3040,6 +3040,53 @@ static const struct SSEOpHelper_eppi sse_op_table7[256] = {
     [0xdf] = AESNI_OP(aeskeygenassist),
 };
 
+static inline void gen_ld_modrm_PqQq(CPUX86State *env, DisasContext *s, int modrm,
+                                     uint32_t* dofs, uint32_t* aofs)
+{
+    const int mod = (modrm >> 6) & 3;
+    const int reg = (modrm >> 3) & 7; /* no REX_R */
+    *dofs = offsetof(CPUX86State, fpregs[reg].mmx);
+
+    if(mod == 3) {
+        const int rm = modrm & 7; /* no REX_B */
+
+        *aofs = offsetof(CPUX86State, fpregs[rm].mmx);
+    } else {
+        *aofs = offsetof(CPUX86State, mmx_t0);
+
+        gen_lea_modrm(env, s, modrm);
+        gen_ldq_env_A0(s, *aofs);
+    }
+}
+
+static inline void gen_ld_modrm_VxWx(CPUX86State *env, DisasContext *s, int modrm,
+                                     uint32_t* dofs, uint32_t* aofs)
+{
+    const int mod = (modrm >> 6) & 3;
+    const int reg = ((modrm >> 3) & 7) | REX_R(s);
+    *dofs = offsetof(CPUX86State, xmm_regs[reg]);
+
+    if(mod == 3) {
+        const int rm = (modrm & 7) | REX_B(s);
+
+        *aofs = offsetof(CPUX86State, xmm_regs[rm]);
+    } else {
+        *aofs = offsetof(CPUX86State, xmm_t0);
+
+        gen_lea_modrm(env, s, modrm);
+        gen_ldo_env_A0(s, *aofs); /* FIXME this needs to load 32 bytes for YMM */
+    }
+}
+
+static inline void gen_ld_modrm_VxHxWx(CPUX86State *env, DisasContext *s, int modrm,
+                                       uint32_t* dofs, uint32_t* aofs, uint32_t* bofs)
+{
+    assert(s->prefix & PREFIX_VEX);
+
+    gen_ld_modrm_VxWx(env, s, modrm, dofs, bofs);
+    *aofs = offsetof(CPUX86State, xmm_regs[s->vex_v]);
+}
+
 static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 {
     int b1, op1_offset, op2_offset, is_xmm, val;
-- 
2.20.1


