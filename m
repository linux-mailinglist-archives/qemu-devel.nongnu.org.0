Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940435A9F93
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:08:40 +0200 (CEST)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpYN-0006G5-GY
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosf-0008R8-N5
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosY-00008O-21
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYF/2jeg9DX7T2XSEKn6FxwmBHin8puIzrAdtuoGwRg=;
 b=Vkr2SlWZbEDnJG1DGTFpILzkbgX1pMaj5wEV5gBYyS3bJsIdDSKfknDnG8fOGsM6PIBu5V
 sIPHsMlXml6OBmpw/kJ02YmuIXanM84NeGUQgjo90A6MIq91DSEFqqsuVM0+c2KVGiKoO9
 HhRJqseIKZCVYDa6wQGqMjKS9Y8uPDg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-tWt9veqxPqGaPFqrMu02Ig-1; Thu, 01 Sep 2022 14:25:23 -0400
X-MC-Unique: tWt9veqxPqGaPFqrMu02Ig-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga33-20020a1709070c2100b0074084f48b12so7180882ejc.7
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iYF/2jeg9DX7T2XSEKn6FxwmBHin8puIzrAdtuoGwRg=;
 b=CN3bV/epysKjzWGnbk5Nx//cgusn0J8IqB8AnwBzz5QDmD+3gNaSeqt+qWkYGQYknI
 HZVzL1IGINJXfS77KvaF1Q5vugHANbYUYd8HRbEUul0z3CtRlr1TOnxWGnKXeXUx7bsx
 Z2hv/eMZfgsNGEywZ9JiXOBJak73B5/FsMuJgrXS8aqBn4I5SPK9bq0wqs78jsYynXFV
 qYTOrOWRDMgnV6AnHe/JcgyYFivbb4aeb3++jR19KV1NyxRjmM0ZnwpAxjzku+xmoy/b
 RWz0jvlg6310feK+LdJ5fmyXRjQI4ZAO9cDD5yu9QQdl4qJ7f7Sc0lA/sGt89Sh7I2aE
 MQig==
X-Gm-Message-State: ACgBeo2BwmeS56JbbymXMei6aTROxpzJElliIhN0LkSrYnVCPca8XM0N
 ikXdKJp1rwAREeYqbM6noUbrHgMvOFUtRveBa3uDPMHRSalm97avpnx9mpmQR5EwLUEaKagGQs9
 nSrD3w/+gWFZEqN4VXw79fWrv1Gi+UQQ9Cfup5GO6Mu/rIIVjNxIp2AfnkkMyLhRIJbY=
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr25773349ejc.762.1662056721708; 
 Thu, 01 Sep 2022 11:25:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/54ozvlMVckv2Fg1ldmhnyxx0W9yZAZDgEbJoQVRB+dYILJW4OX1HC4imfG/0fU3LKSp6Nw==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr25773329ejc.762.1662056721326; 
 Thu, 01 Sep 2022 11:25:21 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 et17-20020a170907295100b0073093eaf53esm8818179ejc.131.2022.09.01.11.25.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/39] target/i386: rewrite destructive 3DNow operations
Date: Thu,  1 Sep 2022 20:24:17 +0200
Message-Id: <20220901182429.93533-28-pbonzini@redhat.com>
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

Remove use of the MOVE macro, since it will be purged from
MMX/SSE as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index f603981ab8..2c0090a647 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1327,11 +1327,11 @@ void helper_pf2iw(CPUX86State *env, MMXReg *d, MMXReg *s)
 
 void helper_pfacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    float32 r;
 
-    r.MMX_S(0) = float32_add(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
-    r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    MOVE(*d, r);
+    r = float32_add(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
+    d->MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
+    d->MMX_S(0) = r;
 }
 
 void helper_pfadd(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1392,20 +1392,20 @@ void helper_pfmul(CPUX86State *env, MMXReg *d, MMXReg *s)
 
 void helper_pfnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    float32 r;
 
-    r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
-    r.MMX_S(1) = float32_sub(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    MOVE(*d, r);
+    r = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
+    d->MMX_S(1) = float32_sub(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
+    d->MMX_S(0) = r;
 }
 
 void helper_pfpnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    float32 r;
 
-    r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
-    r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    MOVE(*d, r);
+    r = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
+    d->MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
+    d->MMX_S(0) = r;
 }
 
 void helper_pfrcp(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1438,11 +1438,11 @@ void helper_pfsubr(CPUX86State *env, MMXReg *d, MMXReg *s)
 
 void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    uint32_t r;
 
-    r.MMX_L(0) = s->MMX_L(1);
-    r.MMX_L(1) = s->MMX_L(0);
-    MOVE(*d, r);
+    r = s->MMX_L(0);
+    d->MMX_L(0) = s->MMX_L(1);
+    d->MMX_L(1) = r;
 }
 #endif
 
-- 
2.37.2



