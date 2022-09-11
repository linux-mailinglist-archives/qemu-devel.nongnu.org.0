Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29E5B51DC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:23:03 +0200 (CEST)
Received: from localhost ([::1]:33582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWI2-0000cr-7R
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0z-0000oc-Qe
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0y-0007KW-60
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9gFNdRiijjkpEaDUBRh1sDu148Og2rZQISI3RnoI30=;
 b=FpGsFHEOgjlhZRlpgXWkpAFeWW7HrZCXs5IjIAL+dskrlkodmxx66NGlqHVQrqZdTwPMPA
 opwPIsNcEt+OebuKKfvbRwwFyzLtO8FTQQNCGnLi2lDfKKqve5+bdX4TBbjKYdskjy62SR
 UccKwWNshxzhAJtJY9IY/0LoMJHwUiw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-399-8utaPWmVNNGugkk2oVxRFw-1; Sun, 11 Sep 2022 19:05:22 -0400
X-MC-Unique: 8utaPWmVNNGugkk2oVxRFw-1
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so2154103edd.10
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=C9gFNdRiijjkpEaDUBRh1sDu148Og2rZQISI3RnoI30=;
 b=NHCw+VHN/MmdXacsMbGstwQ4XW/Pit0ltktfN1jrV5CWaZVH4pe8iYkTvxiTVWiVrh
 45eDXiBib7AqTJm2ZYTEIRhZ2Xw0LwvO3P46WZWC1DE49KUToQuQitzswo2i1Z608prQ
 EieT9K0tWOTs4GnXbeRjA6ETGUSfp8dkjoPJrqIsqQIQKY2Q2+QpdYaGHkl3jGgaMgNC
 WKyJvnwwf1PDKZ3OZsEXWOTSOuplKO615mGmFGUaBc69oQfOohOg11yHFmFpEJ6Aufl9
 NrJNWCUjF2hvmt+SVmLBi0umRe1D+XKYoRsRTbFipPvvehlXTTkbROrox48Pfx/YIxoq
 RRmQ==
X-Gm-Message-State: ACgBeo2ivw7XNqZ4NarsibZmSOmx79+NSNvXzCIq0HA343/5FAi91b0f
 rOmiHhisyEBatPcPPZZKxrO8sL95nQYu8tonsqWv/XJocYHh8XzSrhEq5zu8LTlft4iwaA3+pLs
 8d9txPRRzqDwrLi4YlVorHNDxdGSILcEiVs2zLhL483GuUKW3JX+mtKwuiZA/UABVMO0=
X-Received: by 2002:a17:907:8687:b0:730:7c7b:b9ce with SMTP id
 qa7-20020a170907868700b007307c7bb9cemr16569559ejc.656.1662937520744; 
 Sun, 11 Sep 2022 16:05:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7KEYkSUxSsMjjkKYPfpAYH2oT44Gq3WKQMJ0x742yecMvyF/d8q/eQHSJBa9SGJtDLzO0iZw==
X-Received: by 2002:a17:907:8687:b0:730:7c7b:b9ce with SMTP id
 qa7-20020a170907868700b007307c7bb9cemr16569550ejc.656.1662937520378; 
 Sun, 11 Sep 2022 16:05:20 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 qw32-20020a1709066a2000b007246492658asm3525247ejc.117.2022.09.11.16.05.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/37] target/i386: Introduce 256-bit vector helpers
Date: Mon, 12 Sep 2022 01:03:59 +0200
Message-Id: <20220911230418.340941-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
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

The new implementation of SSE will cover AVX from the get go, because
all the work for the helper functions is already done.  We just need to
build them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.h         | 2 ++
 target/i386/ops_sse.h        | 5 +++++
 target/i386/ops_sse_header.h | 4 ++++
 target/i386/tcg/fpu_helper.c | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..3da5df98b9 100644
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
index 93cee330d2..4f72164c0f 100644
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
index 4bef536edb..4041816945 100644
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
index 48bf0c5cf8..819e920ec6 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3053,3 +3053,6 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 
 #define SHIFT 1
 #include "ops_sse.h"
+
+#define SHIFT 2
+#include "ops_sse.h"
-- 
2.37.2



