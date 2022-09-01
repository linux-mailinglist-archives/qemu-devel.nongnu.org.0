Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E95A9F89
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:03:44 +0200 (CEST)
Received: from localhost ([::1]:45518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpTa-0007Lb-Qg
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTost-00005h-QK
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosj-0000AP-Fn
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNvSOtfuzdw9xMo6fD8JL48Y52q0pGEjNwYI5jvo/zA=;
 b=JP7nm87cupx2XQGQXRz1ir39Oa3BEWDI2w+V/Nhf9MRcdRUgCa3uQxav1sy3b7sHPHJRAy
 2IxoZVk6JHdBYny7g0LU/D5m/S6oVAfuN2YhT4h8jqrung+cqaEvaaqSyrwrCUOnB6Uu+I
 vwqmjUIKMF7H9MgjvrRCjxmn15/hucM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-hFOsqJaQMgiQsLCjl_Cbug-1; Thu, 01 Sep 2022 14:25:35 -0400
X-MC-Unique: hFOsqJaQMgiQsLCjl_Cbug-1
Received: by mail-ej1-f69.google.com with SMTP id
 ds17-20020a170907725100b007419bfb5fd4so5910136ejc.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UNvSOtfuzdw9xMo6fD8JL48Y52q0pGEjNwYI5jvo/zA=;
 b=iA7iWQuZLbjQRNu55urHFCvRTHF7IbsYFYkB+6CfRrjEtKswakTXxdsdml7Jx81wxw
 gl5UQcEUIKpWAuyzWLcme9ldzMgZ1psHJDMwuI6glWlkjm9bLAKb9E7me/BKWU5P+egd
 8hPuikzFY7jgoowBnKwTky78HfE1QpO31auKhckOx30y2MUUrqatXDRthos7M7BHPbB+
 Vz2nXqCKahfsn5x/vksD1m+F0nqvJXmZ9CP9ny6McMO0FX4nZwhoZp3ZOyz3HdfLIxIK
 y9NrDvChtLOF3CMvpOhC5fLyx5+lw+OuTDZ0YM05xmOqAacXKp81jCzI5m+FQN9IpQHO
 4FwA==
X-Gm-Message-State: ACgBeo2k1FPRZQ9xRuN0BRllHu+PAfkJD/WocMsy4btGSBgVc2Yveizb
 NOo3gvzdviPHREWbCuqqWglZs6Ze2jHqpW1+39afkaFRIGfrALUJKczBkVi9qn38PHLTUWE4l6I
 WzIYox/Mpu1lWqIVQa0IXmi/w0B7hN7M2TKOgKM5qtSzjvlVszScsVLfW1k1GUm9fFFc=
X-Received: by 2002:a17:906:5d0e:b0:742:7a6:a1c3 with SMTP id
 g14-20020a1709065d0e00b0074207a6a1c3mr9914239ejt.732.1662056733953; 
 Thu, 01 Sep 2022 11:25:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5nXEkzEcaXeEtW4wW+u+Lvm7VVNmVFwysgJagTQyxcQlW9RYl5OtkiLbL52ieWV2mhHNWMBQ==
X-Received: by 2002:a17:906:5d0e:b0:742:7a6:a1c3 with SMTP id
 g14-20020a1709065d0e00b0074207a6a1c3mr9914225ejt.732.1662056733706; 
 Thu, 01 Sep 2022 11:25:33 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 kv6-20020a17090778c600b0072eddcc807fsm8650541ejc.155.2022.09.01.11.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 34/39] target/i386: Dot product AVX helper prep
Date: Thu,  1 Sep 2022 20:24:24 +0200
Message-Id: <20220901182429.93533-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Paul Brook <paul@nowt.org>

Make the dpps and dppd helpers AVX-ready

I can't see any obvious reason why dppd shouldn't work on 256 bit ymm
registers, but both AMD and Intel agree that it's xmm only.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-17-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 80 ++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 7463ff1599..c9737e16b9 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1903,55 +1903,64 @@ SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
-void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                               uint32_t mask)
 {
+    Reg *v = d;
     float32 prod1, prod2, temp2, temp3, temp4;
+    int i;
 
-    /*
-     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
-     * to correctly round the intermediate results
-     */
-    if (mask & (1 << 4)) {
-        prod1 = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
-    } else {
-        prod1 = float32_zero;
-    }
-    if (mask & (1 << 5)) {
-        prod2 = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
-    } else {
-        prod2 = float32_zero;
-    }
-    temp2 = float32_add(prod1, prod2, &env->sse_status);
-    if (mask & (1 << 6)) {
-        prod1 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
-    } else {
-        prod1 = float32_zero;
-    }
-    if (mask & (1 << 7)) {
-        prod2 = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
-    } else {
-        prod2 = float32_zero;
-    }
-    temp3 = float32_add(prod1, prod2, &env->sse_status);
-    temp4 = float32_add(temp2, temp3, &env->sse_status);
+    for (i = 0; i < 2 << SHIFT; i += 4) {
+        /*
+         * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
+         * to correctly round the intermediate results
+         */
+        if (mask & (1 << 4)) {
+            prod1 = float32_mul(v->ZMM_S(i), s->ZMM_S(i), &env->sse_status);
+        } else {
+            prod1 = float32_zero;
+        }
+        if (mask & (1 << 5)) {
+            prod2 = float32_mul(v->ZMM_S(i+1), s->ZMM_S(i+1), &env->sse_status);
+        } else {
+            prod2 = float32_zero;
+        }
+        temp2 = float32_add(prod1, prod2, &env->sse_status);
+        if (mask & (1 << 6)) {
+            prod1 = float32_mul(v->ZMM_S(i+2), s->ZMM_S(i+2), &env->sse_status);
+        } else {
+            prod1 = float32_zero;
+        }
+        if (mask & (1 << 7)) {
+            prod2 = float32_mul(v->ZMM_S(i+3), s->ZMM_S(i+3), &env->sse_status);
+        } else {
+            prod2 = float32_zero;
+        }
+        temp3 = float32_add(prod1, prod2, &env->sse_status);
+        temp4 = float32_add(temp2, temp3, &env->sse_status);
 
-    d->ZMM_S(0) = (mask & (1 << 0)) ? temp4 : float32_zero;
-    d->ZMM_S(1) = (mask & (1 << 1)) ? temp4 : float32_zero;
-    d->ZMM_S(2) = (mask & (1 << 2)) ? temp4 : float32_zero;
-    d->ZMM_S(3) = (mask & (1 << 3)) ? temp4 : float32_zero;
+        d->ZMM_S(i) = (mask & (1 << 0)) ? temp4 : float32_zero;
+        d->ZMM_S(i+1) = (mask & (1 << 1)) ? temp4 : float32_zero;
+        d->ZMM_S(i+2) = (mask & (1 << 2)) ? temp4 : float32_zero;
+        d->ZMM_S(i+3) = (mask & (1 << 3)) ? temp4 : float32_zero;
+    }
 }
 
-void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+#if SHIFT == 1
+/* Oddly, there is no ymm version of dppd */
+void glue(helper_dppd, SUFFIX)(CPUX86State *env,
+                               Reg *d, Reg *s, uint32_t mask)
 {
+    Reg *v = d;
     float64 prod1, prod2, temp2;
 
     if (mask & (1 << 4)) {
-        prod1 = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+        prod1 = float64_mul(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
     } else {
         prod1 = float64_zero;
     }
     if (mask & (1 << 5)) {
-        prod2 = float64_mul(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+        prod2 = float64_mul(v->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
     } else {
         prod2 = float64_zero;
     }
@@ -1959,6 +1968,7 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
     d->ZMM_D(0) = (mask & (1 << 0)) ? temp2 : float64_zero;
     d->ZMM_D(1) = (mask & (1 << 1)) ? temp2 : float64_zero;
 }
+#endif
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
-- 
2.37.2



