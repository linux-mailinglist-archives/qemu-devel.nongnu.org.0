Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8325A1621
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:52:43 +0200 (CEST)
Received: from localhost ([::1]:45224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRF9v-0001kZ-3D
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRF6J-0007aW-SR
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRF6E-0000lj-UE
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661442534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RiGRSpKGsaGUcaiJ6hSHB2EoVAp011jAGO9i/zy3mzA=;
 b=TTtnHlASH5CY/YSq3mtyJEEpdqN5FvUerdzSWcEpej6LllojidTns5jCrdbVAgKviPY9KF
 xg8BzbAv9VA2iKqhjSJEVmaDe0FtSLbS/l115JtqhXHgl6MCHBTSfFEf1QDu3Ar6DFVoBG
 zQixHH5xh9RaKSGXyUmFpNyKR30kXhc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-bK7BtGoGOW2ptPlsW8j1hA-1; Thu, 25 Aug 2022 11:48:52 -0400
X-MC-Unique: bK7BtGoGOW2ptPlsW8j1hA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t12-20020adfa2cc000000b00224f577fad1so3504830wra.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=RiGRSpKGsaGUcaiJ6hSHB2EoVAp011jAGO9i/zy3mzA=;
 b=R1TVYsfjWcb2afzTP2RyLD8uSgHmxLMLcN1HhrAP8REiMcoTTROovm+SyzmBIcIcZG
 LEkzZUUI1pGkDJlb5Z7RbYhnA54Vpgc95xRNnuLx0broNgIj4YtZIvmaOnGbmubBuqmi
 sf6Ss2Y+fkCiVBOqF1IcG7c2jRBdcX+p2I5yW6r6pwS0XEHhiqXGYON/edubHCLkwmJ3
 HA6WQMq6cXyvsqCqOcYSKpjwFzkKMvqL+ledjc54cDGxEZaaKnl08KDJqmaOl6MCu5Cj
 HiBWO8rGUxHhbawf4GOV4CFGgarpMxmQQ2RHTu1SkD9QlhsjnJ4HTEHiU777KyU+qd0d
 40nA==
X-Gm-Message-State: ACgBeo37VMqjMF783PSig7VR5lODDi/MVFyKpIHIEVPCxWRhL55vlsak
 3RlgMWZgceG735k44l82u2kpW/Dvd7lQtAVOwFQY29ajzi8X+6PAc4Co7m6eFjUDnb4YkyXcTq/
 NbH/H+xzaEYQrqwI79Fbt6wPhTcKF/l8OKhUf7vNaBna+QebOVTX1WaarYZ3QG7YOxkk=
X-Received: by 2002:adf:bc50:0:b0:225:2d85:dd4a with SMTP id
 a16-20020adfbc50000000b002252d85dd4amr2659345wrh.232.1661442531068; 
 Thu, 25 Aug 2022 08:48:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR58IkOg/sGq0iEr3d+7jssxFC6aF4DLwis8fLv11sb2NYrM7v0/xdsD1B+y+FVGabQ9VamteQ==
X-Received: by 2002:adf:bc50:0:b0:225:2d85:dd4a with SMTP id
 a16-20020adfbc50000000b002252d85dd4amr2659325wrh.232.1661442530557; 
 Thu, 25 Aug 2022 08:48:50 -0700 (PDT)
Received: from goa-sendmail ([93.56.170.129]) by smtp.gmail.com with ESMTPSA id
 l28-20020a056000023c00b00225213fd4a9sm19865964wrz.33.2022.08.25.08.48.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:48:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: fix PHSUB* instructions with dest=src
Date: Thu, 25 Aug 2022 17:48:47 +0200
Message-Id: <20220825154847.364806-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
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

The computation must not overwrite neither the destination
nor the source before the last element has been computed.

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
2.37.1


