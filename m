Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F05B51CD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:12:40 +0200 (CEST)
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW7z-0003X9-Fi
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0L-0000G6-9L
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0G-0006zC-M9
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9Db00TXnG0CXgJlBEJ6W2z2OhCBntWHjkaxoFsAGHk=;
 b=KtNz4Sc+lItOggy4xz3wiJlFZ11OQKr7NfYJQ/lA7w5PHXbv5VO65UJhnzqDreCRZ2TJSC
 L4lOmQBYZu8HpbwWwJUhwcTAtAfghWNnvOKn6+7j4k55YbNLgyoi6/qGT2bBzfyQuN1rDW
 NoP9s7hFQYQ/O4dOOdtYN9539SjepGQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-vT1Osg7oM5SkZd4NvVtNdQ-1; Sun, 11 Sep 2022 19:04:36 -0400
X-MC-Unique: vT1Osg7oM5SkZd4NvVtNdQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso1179985edc.18
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=W9Db00TXnG0CXgJlBEJ6W2z2OhCBntWHjkaxoFsAGHk=;
 b=ipRbnbp3DinrKwag9zH6r/F1sls3mxhE44HiP2jf+d2WBHBlFFAn+g8w7CTP9qNDGY
 ITWHIPxhoB651DbdsOMcbwNeb0RahAfO7Xl0SJW0LCF5KqtV+47fb/5nFyqnCyBzfsYd
 tDr0CFu/g/ObuA5Jia7YJUuKNywoB+yBEJkfJUwYx/yRMVn5P5VylOrGK2BUbEh3y60S
 23+oDsTtY6Vi3AjdgvGDOi4lEE9to/C8tCX/rozG3AijBnqqTgJUV+qXDvsUdHT3Z/xa
 2v/RDCImi7V4STcSuTNHq6hFitn7kja6T6XpgyNFA+S+q2nyH6aDs+uDGplgC8fnlltM
 epPg==
X-Gm-Message-State: ACgBeo1hGD+9O0RwKE9b4SAFIpRrQNPQOeT164cUApIN30NWfT4RVBcL
 Gn4skIgxpdYORssey1TrP8KJ1m4ReaiDxw0rgOUKqayeNC2XEJ8v+5xW7FkTUvxy0ooXUJGZFYZ
 eWyCKpq0lmRTyV2frqsludqg5AAfE6Wba3Cza9o7gZzxGQuZg7bZQvkzK8zD4vUjWf8I=
X-Received: by 2002:a17:907:6e1e:b0:77d:4fc3:d6c4 with SMTP id
 sd30-20020a1709076e1e00b0077d4fc3d6c4mr1998728ejc.289.1662937475203; 
 Sun, 11 Sep 2022 16:04:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6rNljYwi2VCmqApjxc1UzI/1byX+K4JbplhaPtWZcLDDrNcoW1wcdBk6Auklm0FfuR45VX5A==
X-Received: by 2002:a17:907:6e1e:b0:77d:4fc3:d6c4 with SMTP id
 sd30-20020a1709076e1e00b0077d4fc3d6c4mr1998717ejc.289.1662937474935; 
 Sun, 11 Sep 2022 16:04:34 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1709063d2100b00771cb506149sm3523138ejf.59.2022.09.11.16.04.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/37] target/i386: introduce insn_get_addr
Date: Mon, 12 Sep 2022 01:03:44 +0200
Message-Id: <20220911230418.340941-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 target/i386/tcg/translate.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f8fd93dae0..f1aa830fcc 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2308,6 +2308,31 @@ static void gen_ldst_modrm(CPUX86State *env, DisasContext *s, int modrm,
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
@@ -5867,16 +5892,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
-- 
2.37.2



