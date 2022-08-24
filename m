Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D05A0083
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:37:30 +0200 (CEST)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuJl-00009w-4f
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuEB-0001cP-2N
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuE7-0003hy-36
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rr2uV9/Sefp2Go3IHv8EFQK2PMyT695YRejnJjqEqao=;
 b=I6OxVFA1WlhaYS2XcWRXxUm9Jo6caM6NG89WRblrN5NQRHtgJx4CbpaEUvjIpezNNPmPkv
 tXphbv3cB+LarlIdnt9XgLQjhzuYeKZY2h1hCUe84zBTru+7eXqKcZJlc4rXMMlnQtonlm
 vlfPETxIjpt3knQBWk6PPcTyUrVLrOY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-j_qhn6mgOSyhfqSV9cJO7A-1; Wed, 24 Aug 2022 13:31:30 -0400
X-MC-Unique: j_qhn6mgOSyhfqSV9cJO7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 f9-20020a7bcd09000000b003a62725489bso589580wmj.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rr2uV9/Sefp2Go3IHv8EFQK2PMyT695YRejnJjqEqao=;
 b=xBrEhNqHoRVy0+hRD8IaNX9R75dmqdNQ1vIRuuC3PK4JjuNeVPWYLmKAwEmc2xU7VG
 LIJhoI+YqdHZbclGwZ6VCS/aDFwfgm82JMJqSzylKa47jv+H16P46zMz1UpzYIYDq8In
 Q3i3Cxn8lfNY5pegLWdzol7pIO+Jhhbzfvbn2xbA4sdSzKU7U39R76S4OQnVfAFGfa4/
 q4Mf2tcZVGoZv7Af6vITEjHHSs2AiSv31jJuED/HUtVjaaxWdG3bjVGf97bBDiskqW1j
 RpCOa26R5SZ8owZbWBJcCLmyq8+fupQW30/qXNxAtPfTcejAr1O71cn3Ne1/Jt2RSE9t
 cisw==
X-Gm-Message-State: ACgBeo0ui/i6sm9fykoMEm1Yl6iDDQYAwyRam7mwzLVdE5yGbSiHevsA
 nG6LWG9VaKzucv6QnrKLuKyd8J5cOU8axJsr6NjlZIfDq2KOR9rzgh8S6CtQIExZrt7IiHH7kcu
 C9JBZI+8ViV3ZGSnBySYEqbqT22boPvS9ECDJi2+tlPimJ4DD4wb7xqDZYI91lYV+mJk=
X-Received: by 2002:a5d:43c2:0:b0:225:2d8a:ad25 with SMTP id
 v2-20020a5d43c2000000b002252d8aad25mr165258wrr.208.1661362288623; 
 Wed, 24 Aug 2022 10:31:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SX4kLQhT9CbPxGMAHqa0D3Ufgi8/xiCMg5GgzYMeaHoRAlYFUDgmJ/2qu7wl9A7kvXD7UCA==
X-Received: by 2002:a5d:43c2:0:b0:225:2d8a:ad25 with SMTP id
 v2-20020a5d43c2000000b002252d8aad25mr165246wrr.208.1661362288325; 
 Wed, 24 Aug 2022 10:31:28 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b002250c35826dsm17319508wrw.104.2022.08.24.10.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:31:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 02/17] target/i386: introduce insn_get_addr
Date: Wed, 24 Aug 2022 19:31:08 +0200
Message-Id: <20220824173123.232018-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824173123.232018-1-pbonzini@redhat.com>
References: <20220824173123.232018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "O" operand type in the Intel SDM needs to load an 8- to 64-bit
unsigned value, while insn_get is limited to 32 bits.  Extract the code
out of disas_insn and into a separate function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-old.c.inc | 11 +----------
 target/i386/tcg/translate.c      | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index 61448ab7c9..603642d6e1 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -2930,16 +2930,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             target_ulong offset_addr;
 
             ot = mo_b_d(b, dflag);
-            switch (s->aflag) {
-#ifdef TARGET_X86_64
-            case MO_64:
-                offset_addr = x86_ldq_code(env, s);
-                break;
-#endif
-            default:
-                offset_addr = insn_get(env, s, s->aflag);
-                break;
-            }
+            offset_addr = insn_get_addr(env, s, s->aflag);
             tcg_gen_movi_tl(s->A0, offset_addr);
             gen_add_A0_ds_seg(s);
             if ((b & 2) == 0) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d2d6eb89e7..5c4b685de7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2268,6 +2268,31 @@ static void gen_ldst_modrm(CPUX86State *env, DisasContext *s, int modrm,
     }
 }
 
+static inline target_ulong insn_get_addr(CPUX86State *env, DisasContext *s, MemOp ot)
+{
+    target_ulong ret;
+
+    switch (ot) {
+    case MO_8:
+        ret = x86_ldub_code(env, s);
+        break;
+    case MO_16:
+        ret = x86_lduw_code(env, s);
+        break;
+    case MO_32:
+        ret = x86_ldl_code(env, s);
+        break;
+#ifdef TARGET_X86_64
+    case MO_64:
+        ret = x86_ldq_code(env, s);
+        break;
+#endif
+    default:
+        tcg_abort();
+    }
+    return ret;
+}
+
 static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, MemOp ot)
 {
     uint32_t ret;
-- 
2.37.1



