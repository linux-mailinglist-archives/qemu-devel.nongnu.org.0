Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7C5A32B3
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:37:56 +0200 (CEST)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRitf-000261-BY
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVl-0007Kh-90
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVW-0007sW-Hg
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdzxNqc3E/z2EO4Qyu4yrjNJ5KEu/Wcds8vGPwbfTeQ=;
 b=NLzHKp+85o2DtqlcydkeXbPyRPX05C/vtkpWx1sVYF+/0kJD2J4XqzKVSuX7vR8RzFEAWW
 WMF9qqoPC021OlGPEQi8ABLNBhdrvxyDpJNtC/PbBHCVDF2DmqHptqGdMMdqutMPRd1zDp
 9bThTTwIBRZWnyQe3EgsU9VGVvxUbbs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-yH9DzL6RNz-vg8PSX1kmqQ-1; Fri, 26 Aug 2022 19:12:53 -0400
X-MC-Unique: yH9DzL6RNz-vg8PSX1kmqQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w20-20020a05640234d400b00447e6ffefccso1877552edc.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EdzxNqc3E/z2EO4Qyu4yrjNJ5KEu/Wcds8vGPwbfTeQ=;
 b=QUxmyYtsr6MNodbtJQPYJlbw8eJEANKiboG/YmKU0mMDjIG2rFfLjFcxpl4pbBT/Fa
 X0Lv9CLEosD9Yx+T9LPN4PlTovO0Ki/LDS8vx2RA0RwbSPyu/2QLgYIuQMWGuJlS/Ns4
 X9Ed1zQrYCYPZCrrUrXYzNZ9jJuvnJlZSIp/7yCZXQaIAykUdsx6VOkrfJobioNpLJYb
 dogDNikPoh73kHpokVsxqIGX2y6ZVdG8dd13bMEluZdCJlqp5n1u24PBUcQX6LXndW0h
 wTlx8DVEhmFoKrrpLe1m/e5BsXwPEfKFv2ZfYnLA/vpW+5wBP3Q2xWJ2Dy6EmOVbMh2K
 q6IA==
X-Gm-Message-State: ACgBeo0ikolWSGH83nVtigu5FuilE886xhy4Lb/6knPln6g1b4Edm4hM
 bkFoGGinhThBaZTSpsdyLiJvBwAYvct1zNERc1ZoaNhnnAZfZ/kTDSAbmNmY5BBuO+TMd9vIv+e
 CTRp7KkfFlUpn3slni7/nRNHEA3kfS/sfS29ljGxHRKzyOrrYyEgpUZmakmsCeg5aHcs=
X-Received: by 2002:a17:907:3e07:b0:73d:760d:3e01 with SMTP id
 hp7-20020a1709073e0700b0073d760d3e01mr6596192ejc.136.1661555572294; 
 Fri, 26 Aug 2022 16:12:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5iit9OkcezP/M58TvCAAPPqqT513DBsSgZlYJn1/shpVKgW27eDYb4q3MZQoBHxE8ez8Huow==
X-Received: by 2002:a17:907:3e07:b0:73d:760d:3e01 with SMTP id
 hp7-20020a1709073e0700b0073d760d3e01mr6596180ejc.136.1661555571994; 
 Fri, 26 Aug 2022 16:12:51 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906210100b00731582babcasm1426540ejt.71.2022.08.26.16.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 22/23] i386: AVX pclmulqdq prep
Date: Sat, 27 Aug 2022 01:12:03 +0200
Message-Id: <20220826231204.201395-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Make the pclmulqdq helper AVX ready

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-21-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index f9cc1d7623..2b35b6e533 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2247,14 +2247,14 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
 
 #endif
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-                                    uint32_t ctrl)
+#if SHIFT == 1
+static void clmulq(uint64_t *dest_l, uint64_t *dest_h,
+                          uint64_t a, uint64_t b)
 {
-    uint64_t ah, al, b, resh, resl;
+    uint64_t al, ah, resh, resl;
 
     ah = 0;
-    al = d->Q((ctrl & 1) != 0);
-    b = s->Q((ctrl & 16) != 0);
+    al = a;
     resh = resl = 0;
 
     while (b) {
@@ -2267,8 +2267,23 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         b >>= 1;
     }
 
-    d->Q(0) = resl;
-    d->Q(1) = resh;
+    *dest_l = resl;
+    *dest_h = resh;
+}
+#endif
+
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                                    uint32_t ctrl)
+{
+    Reg *v = d;
+    uint64_t a, b;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        a = v->Q(((ctrl & 1) != 0) + i);
+        b = s->Q(((ctrl & 16) != 0) + i);
+        clmulq(&d->Q(i), &d->Q(i + 1), a, b);
+    }
 }
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-- 
2.37.1



