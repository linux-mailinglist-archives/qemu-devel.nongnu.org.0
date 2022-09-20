Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC515BF04C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:40:34 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaluq-0003Q3-PA
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0L-0006Su-Hy
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0I-0002Dy-Ot
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9Lnu9mvyjwzq9QbOxVjShbFP29UAYt4sG34U5TM//s=;
 b=QD94fVdwymNCc8YWr8BtdWLBZjE1SPZJ70Op9YIaLdqZ5a5JKS2zWeISi4wpuhfnk02e8g
 V0xZ9J7jXoh2Bz+EidHqH1RvmTU+FqEj/xZtZwYqXtt+L9VJ7x5RGYwmv+mV4YauL8Mt6w
 azCuIBu3ojxVWajM/9QrPW/eqjv5Fuo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-9CXht9ZFPUuihAQ-UGw4Mw-1; Tue, 20 Sep 2022 13:25:49 -0400
X-MC-Unique: 9CXht9ZFPUuihAQ-UGw4Mw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qb30-20020a1709077e9e00b0077d1271283eso1784704ejc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=v9Lnu9mvyjwzq9QbOxVjShbFP29UAYt4sG34U5TM//s=;
 b=CMocuOlN/iqAh+l/Ettz7ptOMjShfLmRtbr46au89b+cDA/cFS9l8vjMzgRFBsIP0Z
 4O/Jv0GC+4UdSNjLil2GAVrtovIamCDb1MolCAHv0TbisioSjyK1kFfKS/3t5EvPLPmy
 Doz/ihdT+le62vISADKIWe0BeQX7CCc75AjjwQAthg7FtTSbknoIaN6PXkE4e/RccpE2
 ejCa98TVLslNbKkIJsoawzNwN6XQfVfxuCjRCWqRJrp+XA7/jpWbpYQ1N8/N9RyfymaY
 WxSa52PYQfOx7yE6nfdZgineSMVxdK0cPPYAieWnEF2oGyQAKVQgw1dyJ6EHFi9Jd2qR
 3HpA==
X-Gm-Message-State: ACrzQf2aZRKg/aVBhTVakJtnl8NZJAd1f6Tccj33uujDuwFZZ0BugDUd
 SNY8gYv8XLdtdJiJOPMbw20EujpOPNfqgf9+RehzHnMpoCxnDMu413Zk+PfqSWD8e/l6IhGcwNS
 3O3njaSzX+CpYZkQbVV+zUnpGgqUSkDO1J7vFg6GbcTDg6Sw+tFTp2nONWsyW5lV/4AM=
X-Received: by 2002:a17:906:9b8f:b0:77b:2b61:ae2d with SMTP id
 dd15-20020a1709069b8f00b0077b2b61ae2dmr17442068ejc.50.1663694747565; 
 Tue, 20 Sep 2022 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tTU8Y48HmCCvLb9E4lnxYN+q9w8HH1jG+1B4s8W8Fkjvzv18KmXxygeQ437c2ogixKc390A==
X-Received: by 2002:a17:906:9b8f:b0:77b:2b61:ae2d with SMTP id
 dd15-20020a1709069b8f00b0077b2b61ae2dmr17442046ejc.50.1663694747250; 
 Tue, 20 Sep 2022 10:25:47 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a170906399700b00773f3cb67ffsm197178eje.28.2022.09.20.10.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 25/37] target/i386: clarify (un)signedness of immediates
 from 0F3Ah opcodes
Date: Tue, 20 Sep 2022 19:24:55 +0200
Message-Id: <20220920172507.95568-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Three-byte opcodes from the 0F3Ah area all have an immediate byte which
is usually unsigned.  Clarify in the helper code that it is unsigned;
the new decoder treats immediates as signed by default, and seeing
an intN_t in the prototype might give the wrong impression that one
can use decode->immediate directly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 8 ++++----
 target/i386/ops_sse_header.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 090ba013b3..e7830ff277 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1605,17 +1605,17 @@ SSE_HELPER_W(helper_psignw, FSIGNW)
 SSE_HELPER_L(helper_psignd, FSIGNL)
 
 void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
-                                  int32_t shift)
+                                  uint32_t imm)
 {
     int i;
 
     /* XXX could be checked during translation */
-    if (shift >= (SHIFT ? 32 : 16)) {
+    if (imm >= (SHIFT ? 32 : 16)) {
         for (i = 0; i < (1 << SHIFT); i++) {
             d->Q(i) = 0;
         }
     } else {
-        shift <<= 3;
+        int shift = imm * 8;
 #define SHR(v, i) (i < 64 && i > -64 ? i > 0 ? v >> (i) : (v << -(i)) : 0)
 #if SHIFT == 0
         d->Q(0) = SHR(s->Q(0), shift - 0) |
@@ -2093,7 +2093,7 @@ static inline int pcmp_val(Reg *r, uint8_t ctrl, int i)
 }
 
 static inline unsigned pcmpxstrx(CPUX86State *env, Reg *d, Reg *s,
-                                 int8_t ctrl, int valids, int validd)
+                                 uint8_t ctrl, int valids, int validd)
 {
     unsigned int res = 0;
     int v;
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 440f1c0e78..98178be148 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -335,7 +335,7 @@ DEF_HELPER_4(glue(pshufb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignd, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, s32)
+DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, i32)
 
 /* SSE4.1 op helpers */
 #if SHIFT >= 1
-- 
2.37.2


