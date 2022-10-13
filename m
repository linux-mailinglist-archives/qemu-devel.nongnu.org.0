Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76455FE4ED
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:01:29 +0200 (CEST)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Ge-0000YA-Ly
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63P-0002jw-7h
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63N-0005HF-5W
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJCZ+hmRZX0Jpm2zSyk7ySgDbKMl90N7cMnNG1VhTh0=;
 b=a/rOZohfXAUy+jTOuNt0PAyEHcw3JMNNN117oMBolvZGFDEoClyD+F6tIQbv1cLDvoBz9q
 ksYXq40YdpjA8YI8t+PlUh5cT8WphJCX4CSmoLl/qh0jWdZPKSNxGbByK5SLIIpMNrGTo4
 6pbI5i4hLTC/5ogJXsZCqHmt6UopRCY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-5vA-dh0kPSKW9EapJtSHeA-1; Thu, 13 Oct 2022 17:47:43 -0400
X-MC-Unique: 5vA-dh0kPSKW9EapJtSHeA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b8-20020a056402278800b0045c948cc65fso2324009ede.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJCZ+hmRZX0Jpm2zSyk7ySgDbKMl90N7cMnNG1VhTh0=;
 b=wvCQ3pFc8mTOyor8wBGeXQIj1inRNUuyUuWrRLp9FZq4i4MSNW9CccCFCoNLNd3U+3
 wQyM9irV71DkVwktTPjH5pzoKDTrwwDxlwgLJA8cdsTIb8O4HWK0U3K08ZlOKk6gNugo
 oMIykhN85mb5UXn07cwIhc1Ul7y31+BhDL8zsh1Jqxe5lgenq/AiLdxSXxER1qxthtEc
 a2uRAxTOpRau0f4BtlXEzuhQQr5y44uPYNspcqndf5vBXpdJEc2+VanG3v5FWnhjmuiQ
 ucWmLEoaT+Wyse6gFRrJmCMbMf0pSEun/IgiOYfJJLh135hXF1+gmQKp4wpFyL2EAA+k
 Ev8w==
X-Gm-Message-State: ACrzQf20auR8R++rNMxoITUsxr3dxVrFlG+C4Mzq1tjiR06RLVMtOjuT
 wnqKzo/EFlR/Ava9+D9oo3kbvkhVCEOp3YENfjLUkRoAM0TXlxzZsADo9VT8/3ID8PJSViGJ6/F
 OTySUmvPycPU9HpeaHoOi6XnO1QRnPsdUyvJqnwPZ/ofagCG0gy2T/ltaDdw3rK1mQrY=
X-Received: by 2002:a05:6402:496:b0:443:a5f5:d3b with SMTP id
 k22-20020a056402049600b00443a5f50d3bmr1560103edv.331.1665697661777; 
 Thu, 13 Oct 2022 14:47:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CNQvbbR/osrZgRk6q9yNmOtmofz8toBl3JtVDcGhGaRUqxNygCBfnLrxM6sZQInOIVbufTw==
X-Received: by 2002:a05:6402:496:b0:443:a5f5:d3b with SMTP id
 k22-20020a056402049600b00443a5f50d3bmr1560090edv.331.1665697661546; 
 Thu, 13 Oct 2022 14:47:41 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h24-20020aa7c958000000b0045920b019a9sm474763edt.95.2022.10.13.14.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 16/35] target/i386: Introduce 256-bit vector helpers
Date: Thu, 13 Oct 2022 23:46:32 +0200
Message-Id: <20221013214651.672114-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


