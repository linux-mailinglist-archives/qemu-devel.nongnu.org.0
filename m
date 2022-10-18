Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A6602DD1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:03:19 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknBc-0007p5-LZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004RV-3Q
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiA-0005HJ-Q7
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJCZ+hmRZX0Jpm2zSyk7ySgDbKMl90N7cMnNG1VhTh0=;
 b=glBOOOTsTzvBn9sdsilQPFbNFljw0bSo5xFwKos0xnvtK/8vD97jHqLVA/H+ZHiKbxYapH
 z+OnQdHw9vDCPFKtx/wLervlyj5oCn7MSCSbw8+3RMVNII72eygzHqW2y5ftD+kZNDSE//
 CxsHUSCyZon5DZIcKhiNRi5vfPXqK2I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-uVA50_DvOFaVd7PFow1s-g-1; Tue, 18 Oct 2022 09:32:37 -0400
X-MC-Unique: uVA50_DvOFaVd7PFow1s-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 b8-20020a056402278800b0045d410dec69so7568474ede.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJCZ+hmRZX0Jpm2zSyk7ySgDbKMl90N7cMnNG1VhTh0=;
 b=Zn1+rAUb2+8E1FLenznETAG8YQkLTf8eHq9Awfs2iABCly7lZaebAdctS1BG5UwHwl
 i93cp0Ij9GgFKJdeNaUrnvMjjAzXn93bgVQEmmWHztAdFr1+gdoRMYVktQt4gclbE2p4
 rmr0Zz3vU+5Mj/3ehMlQpnwHssdM9S5wVmQg/RH31RviPIAaVlAnINbyUbq5+LHJLoGg
 KXfdaca9l6y5e1I+N6iAo9dCZGdq2kj8EklXbT3T08Dnl7/oR8o2UhqsFLuHXGxDvPtH
 bgG1dyRcUUcQw3I5/jjkKhBz865cRCPJb1jpV0lk5Vt1cDKVKHXJ9ZEKOhvKtuYtip9+
 5oBQ==
X-Gm-Message-State: ACrzQf3pRzClOuo+MMnMgb1muUU8wQA6PFUEEqG2gvL0m4OiaqVEgKAT
 Brc/EllzmcFKBYVaX3VgnG1yz2l7xPn9SAtYgceLpShoVXC2NUVWpV01/3Xigqc+Kk2KRULLDll
 C3R2/pXlb+mvzWiImEMrFfmNILba0RpEOBq5ajqMmhKqBEzU36H6LHRz7CJd7glKcIDQ=
X-Received: by 2002:a17:906:a4a:b0:782:686d:a1b6 with SMTP id
 x10-20020a1709060a4a00b00782686da1b6mr2407407ejf.232.1666099955808; 
 Tue, 18 Oct 2022 06:32:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7h3Ua28AwzepuaNJfCDjdLu7Nkz1RwdpTn2SnQOG2iTwH2XxAOx445X7vPJIMzw2DAv/8FAQ==
X-Received: by 2002:a17:906:a4a:b0:782:686d:a1b6 with SMTP id
 x10-20020a1709060a4a00b00782686da1b6mr2407386ejf.232.1666099955550; 
 Tue, 18 Oct 2022 06:32:35 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 de13-20020a1709069bcd00b0078d957e65b6sm7517487ejc.23.2022.10.18.06.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 34/53] target/i386: Introduce 256-bit vector helpers
Date: Tue, 18 Oct 2022 15:30:23 +0200
Message-Id: <20221018133042.856368-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The new implementation of SSE will cover AVX from the get go, because
all the work for the helper functions is already done.  We just need to
build them.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.h         | 2 ++
 target/i386/ops_sse.h        | 5 +++++
 target/i386/ops_sse_header.h | 4 ++++
 target/i386/tcg/fpu_helper.c | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 39a3c24182..a2c2c085a3 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -218,6 +218,8 @@ DEF_HELPER_3(movq, void, env, ptr, ptr)
 #include "ops_sse_header.h"
 #define SHIFT 1
 #include "ops_sse_header.h"
+#define SHIFT 2
+#include "ops_sse_header.h"
 
 DEF_HELPER_3(rclb, tl, env, tl, tl)
 DEF_HELPER_3(rclw, tl, env, tl, tl)
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 18d217ebf5..090ba013b3 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -35,7 +35,11 @@
 #define W(n) ZMM_W(n)
 #define L(n) ZMM_L(n)
 #define Q(n) ZMM_Q(n)
+#if SHIFT == 1
 #define SUFFIX _xmm
+#else
+#define SUFFIX _ymm
+#endif
 #endif
 
 #define LANE_WIDTH (SHIFT ? 16 : 8)
@@ -2379,6 +2383,7 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 
 #undef SSE_HELPER_S
 
+#undef LANE_WIDTH
 #undef SHIFT
 #undef XMM_ONLY
 #undef Reg
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index e7866a8395..440f1c0e78 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -21,7 +21,11 @@
 #define SUFFIX _mmx
 #else
 #define Reg ZMMReg
+#if SHIFT == 1
 #define SUFFIX _xmm
+#else
+#define SUFFIX _ymm
+#endif
 #endif
 
 #define dh_alias_Reg ptr
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 9b59026e37..5f3f7a1085 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3065,3 +3065,6 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 
 #define SHIFT 1
 #include "ops_sse.h"
+
+#define SHIFT 2
+#include "ops_sse.h"
-- 
2.37.3


