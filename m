Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07145A9F43
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:43:22 +0200 (CEST)
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp9p-0001fo-2X
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosH-0007mh-48
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos9-0008KY-0M
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0viauODGZDJWgP/N78wIU49xUuE0smt3WWZKib6ERE=;
 b=GXDNMn9Rl7ZQSJrZPOoIrUCKgjVWWsZN3byIANgiGgxLKz4xz0cxYdlLVpI4I+sEUZoI7i
 PspUb+xBinRTyMmdDhR68ft16VbfwLS8yRxtumN32QsFUOJhRZRAQEb+x3ioVL/VNiHl82
 OrgLqgbiDXrdMGHDRN27gMg0zG2KHBA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-Cib9aaJdP7GUtYHX5wUUlA-1; Thu, 01 Sep 2022 14:24:59 -0400
X-MC-Unique: Cib9aaJdP7GUtYHX5wUUlA-1
Received: by mail-ej1-f71.google.com with SMTP id
 gn30-20020a1709070d1e00b0074144af99d1so6503016ejc.17
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f0viauODGZDJWgP/N78wIU49xUuE0smt3WWZKib6ERE=;
 b=gUNRsjm9wsAFl0/32xDn+HYp9TI3kVO8MtUMWrALkvp4RhvVaGFsy2EgnUXLwl3Wt7
 RBkil09/cnE50hF8rMmGjX6Ds9d2lsn97nNjgf6fj5ouMPa6uCDp1I74+JifD4SD5vDr
 9lMdo4GNh4++QzuFyl6FsLJQkftWOu1KCNP69n+ktHt+gsTD+18HclNVbMiEZMTR4++n
 BGgRlvjoJySUfq7ZRW2n3qhBRpcI5Rzz9nU7tjSIRRUih78NDyTk9E0RbM3Q+7AAfW0E
 1LocwBuq6dK3R9c+b77LD5ZutJoVV3kF8PmdNsCxdYgd9N3H8zYJKNRh/eMTmsMzLu77
 FoAA==
X-Gm-Message-State: ACgBeo0IdXY2KMkfJWfJYow2oF4G2ZQYg8bxpdX3Xxus7b8+VoptoNKb
 eKmc8zFapYQB/wFycCsdvVHuz2eXtDccd2kSoTEGHFPnp4kAKicHj/vSkulM1/5dbeZaN2g9HQD
 BDzqWmZaWhCLad7OFTjy54bg8FKqVrMqPIG9fNrvV6Si+oIuJl2BZhkL66Ej9A7OK/eM=
X-Received: by 2002:a17:906:847c:b0:73f:d7cf:bf2d with SMTP id
 hx28-20020a170906847c00b0073fd7cfbf2dmr20917884ejc.327.1662056697990; 
 Thu, 01 Sep 2022 11:24:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7iNwr4uJyOPmcMxcotCDjz4ARgXiaGDih9ap+/PME3N5dosNOOenTMYL3BYtwpvPuAK0I/dw==
X-Received: by 2002:a17:906:847c:b0:73f:d7cf:bf2d with SMTP id
 hx28-20020a170906847c00b0073fd7cfbf2dmr20917867ejc.327.1662056697647; 
 Thu, 01 Sep 2022 11:24:57 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 r20-20020a170906365400b0073dafb227c0sm8703000ejb.161.2022.09.01.11.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/39] target/i386: DPPS rounding fix
Date: Thu,  1 Sep 2022 20:24:04 +0200
Message-Id: <20220901182429.93533-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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

The DPPS (Dot Product) instruction is defined to first sum pairs of
intermediate results, then sum those values to get the final result.
i.e. (A+B)+(C+D)

We incrementally sum the results, i.e. ((A+B)+C)+D, which can result
in incorrect rouding.

For consistency, also change the variable names to the ones used
in the Intel SDM and implement DPPD following the manual.

Based on a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 67 ++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 2524db4c25..b12b271fcd 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1943,56 +1943,59 @@ SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
 void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 {
-    float32 iresult = float32_zero;
+    float32 prod1, prod2, temp2, temp3, temp4;
 
+    /*
+     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
+     * to correctly round the intermediate results
+     */
     if (mask & (1 << 4)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(0), s->ZMM_S(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+    } else {
+        prod1 = float32_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(1), s->ZMM_S(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+    } else {
+        prod2 = float32_zero;
     }
+    temp2 = float32_add(prod1, prod2, &env->sse_status);
     if (mask & (1 << 6)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(2), s->ZMM_S(2),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+    } else {
+        prod1 = float32_zero;
     }
     if (mask & (1 << 7)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(3), s->ZMM_S(3),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    } else {
+        prod2 = float32_zero;
     }
-    d->ZMM_S(0) = (mask & (1 << 0)) ? iresult : float32_zero;
-    d->ZMM_S(1) = (mask & (1 << 1)) ? iresult : float32_zero;
-    d->ZMM_S(2) = (mask & (1 << 2)) ? iresult : float32_zero;
-    d->ZMM_S(3) = (mask & (1 << 3)) ? iresult : float32_zero;
+    temp3 = float32_add(prod1, prod2, &env->sse_status);
+    temp4 = float32_add(temp2, temp3, &env->sse_status);
+
+    d->ZMM_S(0) = (mask & (1 << 0)) ? temp4 : float32_zero;
+    d->ZMM_S(1) = (mask & (1 << 1)) ? temp4 : float32_zero;
+    d->ZMM_S(2) = (mask & (1 << 2)) ? temp4 : float32_zero;
+    d->ZMM_S(3) = (mask & (1 << 3)) ? temp4 : float32_zero;
 }
 
 void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 {
-    float64 iresult = float64_zero;
+    float64 prod1, prod2, temp2;
 
     if (mask & (1 << 4)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(0), s->ZMM_D(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+    } else {
+        prod1 = float64_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(1), s->ZMM_D(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float64_mul(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+    } else {
+        prod2 = float64_zero;
     }
-    d->ZMM_D(0) = (mask & (1 << 0)) ? iresult : float64_zero;
-    d->ZMM_D(1) = (mask & (1 << 1)) ? iresult : float64_zero;
+    temp2 = float64_add(prod1, prod2, &env->sse_status);
+    d->ZMM_D(0) = (mask & (1 << 0)) ? temp2 : float64_zero;
+    d->ZMM_D(1) = (mask & (1 << 1)) ? temp2 : float64_zero;
 }
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.37.2



