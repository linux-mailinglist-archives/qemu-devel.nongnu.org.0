Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151395A9F6C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:51:27 +0200 (CEST)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpHi-0003Vs-6k
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosK-0007py-SF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos7-0008KD-N8
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYDsviyTrRbGXJ9IZrqQ9yOXfcOaNrCAF/kU6Sl0RJg=;
 b=PyadFciiX6qLvHSSFWtPXxyEkO7Fwy+TfqGwj0bO2yIk3zbZpYAezUOmSPjhhn86lI6aTZ
 F2JAeQUB7pEoabXTirIXH/L8cK8x2ayFXOJs9jp3iM8idxWFmgp6pLeDaEO7L1M5mzuw4g
 pZYDhTdNLsH6+xZHn6a+fvamOpR6jhU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-v8KdeounNf2TyNBM-JIS7A-1; Thu, 01 Sep 2022 14:24:57 -0400
X-MC-Unique: v8KdeounNf2TyNBM-JIS7A-1
Received: by mail-ej1-f69.google.com with SMTP id
 qa35-20020a17090786a300b0073d4026a97dso7232245ejc.9
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PYDsviyTrRbGXJ9IZrqQ9yOXfcOaNrCAF/kU6Sl0RJg=;
 b=VZAc82aZ3Lu7lyiOBh4up3tdJBUF0UBF6Z6jLx7R2kW0KwLAPl9CVimE2Fq2owND11
 3hmyGQ08Lt0PamVwp6eiKCa/3o/vdycQb23ygTmpHMEYorskrXhx9mVccUx61B1HKhOB
 R43MG1yIUH1y0mbCVdQ/gL1XgRSzkFJO9LKg7hDFIneQAqFtMxx4GS6llLTCpDTy9dC3
 yDB+kSc8+F4Mil+HPnCblmxBCU832Hrt0yHBFVWM9+OVoDq8etU9X4WsinGCzhJwS54Y
 PiWbbImN63x6Rt2ccZ1+weY3MPA+0Y7hESIBjosgf5UhpstZ43e+vKtFYjmhrWM8K3Ul
 ix3A==
X-Gm-Message-State: ACgBeo0FPgX2ia5ZHsm8LjmSXTgV6MkKx9KJsuMlX0GLGGNzmdocou9R
 DlG9Vg7Kjj/dBzojSgzxO/cY7x0C9tltQ8u1HqN51lgN1M4WYr5vUl0H7Ent+FzxVeQxEm0n6Bi
 rpZhGvJNs6WgqorcuTTxyKX1uu0NgtsYqbBJxEpZ+XnyrShh0ZMAr16KaRXOLP6MyTQo=
X-Received: by 2002:a17:907:2722:b0:731:201a:df9c with SMTP id
 d2-20020a170907272200b00731201adf9cmr24928543ejl.149.1662056696516; 
 Thu, 01 Sep 2022 11:24:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR700xUzOminTWoQ/0x4AnKdFHydTG9+i8oOzN/16tZnsoVGT2DGW2nvouYlIX/lknX+X06q3A==
X-Received: by 2002:a17:907:2722:b0:731:201a:df9c with SMTP id
 d2-20020a170907272200b00731201adf9cmr24928532ejl.149.1662056696233; 
 Thu, 01 Sep 2022 11:24:56 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b0073cdeedf56fsm5917067ejg.57.2022.09.01.11.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/39] target/i386: fix PHSUB* instructions with dest=src
Date: Thu,  1 Sep 2022 20:24:03 +0200
Message-Id: <20220901182429.93533-14-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The computation must not overwrite neither the destination
nor the source before the last element has been computed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 49 +++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 535440f882..2524db4c25 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1528,34 +1528,43 @@ void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 
 void glue(helper_phsubw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->W(0) = (int16_t)d->W(0) - (int16_t)d->W(1);
-    d->W(1) = (int16_t)d->W(2) - (int16_t)d->W(3);
-    XMM_ONLY(d->W(2) = (int16_t)d->W(4) - (int16_t)d->W(5));
-    XMM_ONLY(d->W(3) = (int16_t)d->W(6) - (int16_t)d->W(7));
-    d->W((2 << SHIFT) + 0) = (int16_t)s->W(0) - (int16_t)s->W(1);
-    d->W((2 << SHIFT) + 1) = (int16_t)s->W(2) - (int16_t)s->W(3);
-    XMM_ONLY(d->W(6) = (int16_t)s->W(4) - (int16_t)s->W(5));
-    XMM_ONLY(d->W(7) = (int16_t)s->W(6) - (int16_t)s->W(7));
+    Reg r;
+
+    r.W(0) = (int16_t)d->W(0) - (int16_t)d->W(1);
+    r.W(1) = (int16_t)d->W(2) - (int16_t)d->W(3);
+    XMM_ONLY(r.W(2) = (int16_t)d->W(4) - (int16_t)d->W(5));
+    XMM_ONLY(r.W(3) = (int16_t)d->W(6) - (int16_t)d->W(7));
+    r.W((2 << SHIFT) + 0) = (int16_t)s->W(0) - (int16_t)s->W(1);
+    r.W((2 << SHIFT) + 1) = (int16_t)s->W(2) - (int16_t)s->W(3);
+    XMM_ONLY(r.W(6) = (int16_t)s->W(4) - (int16_t)s->W(5));
+    XMM_ONLY(r.W(7) = (int16_t)s->W(6) - (int16_t)s->W(7));
+    MOVE(*d, r);
 }
 
 void glue(helper_phsubd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->L(0) = (int32_t)d->L(0) - (int32_t)d->L(1);
-    XMM_ONLY(d->L(1) = (int32_t)d->L(2) - (int32_t)d->L(3));
-    d->L((1 << SHIFT) + 0) = (int32_t)s->L(0) - (int32_t)s->L(1);
-    XMM_ONLY(d->L(3) = (int32_t)s->L(2) - (int32_t)s->L(3));
+    Reg r;
+
+    r.L(0) = (int32_t)d->L(0) - (int32_t)d->L(1);
+    XMM_ONLY(r.L(1) = (int32_t)d->L(2) - (int32_t)d->L(3));
+    r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) - (int32_t)s->L(1);
+    XMM_ONLY(r.L(3) = (int32_t)s->L(2) - (int32_t)s->L(3));
+    MOVE(*d, r);
 }
 
 void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    d->W(0) = satsw((int16_t)d->W(0) - (int16_t)d->W(1));
-    d->W(1) = satsw((int16_t)d->W(2) - (int16_t)d->W(3));
-    XMM_ONLY(d->W(2) = satsw((int16_t)d->W(4) - (int16_t)d->W(5)));
-    XMM_ONLY(d->W(3) = satsw((int16_t)d->W(6) - (int16_t)d->W(7)));
-    d->W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) - (int16_t)s->W(1));
-    d->W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) - (int16_t)s->W(3));
-    XMM_ONLY(d->W(6) = satsw((int16_t)s->W(4) - (int16_t)s->W(5)));
-    XMM_ONLY(d->W(7) = satsw((int16_t)s->W(6) - (int16_t)s->W(7)));
+    Reg r;
+
+    r.W(0) = satsw((int16_t)d->W(0) - (int16_t)d->W(1));
+    r.W(1) = satsw((int16_t)d->W(2) - (int16_t)d->W(3));
+    XMM_ONLY(r.W(2) = satsw((int16_t)d->W(4) - (int16_t)d->W(5)));
+    XMM_ONLY(r.W(3) = satsw((int16_t)d->W(6) - (int16_t)d->W(7)));
+    r.W((2 << SHIFT) + 0) = satsw((int16_t)s->W(0) - (int16_t)s->W(1));
+    r.W((2 << SHIFT) + 1) = satsw((int16_t)s->W(2) - (int16_t)s->W(3));
+    XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) - (int16_t)s->W(5)));
+    XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) - (int16_t)s->W(7)));
+    MOVE(*d, r);
 }
 
 #define FABSB(_, x) (x > INT8_MAX  ? -(int8_t)x : x)
-- 
2.37.2



