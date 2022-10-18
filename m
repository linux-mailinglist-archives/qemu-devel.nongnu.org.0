Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EDF602E8F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:33:40 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknez-0006hB-M7
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004RR-8f
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhs-0005G5-UO
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/CaNeQ1w3CFkO4CLWwaCNSZW6YsiwflkbB1p4abvQo=;
 b=fSH6g43zrsZue9Svf1Rw8dlwhPiQuK6wG0Y8SejmwzU9mdJdHVxQ1/3KtbCDvU/G6hkZuc
 fzZDBxPJSjl+v8OJy2MGolyguG8963My9/xlRbyEShCnEL3lYfApvDzob/aZGgbJK732Pi
 Od457AwoT3SLjnvMhbkVKPyKST99k+g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-AHF8yoTfPeuD_bVxr4Q_tQ-1; Tue, 18 Oct 2022 09:32:29 -0400
X-MC-Unique: AHF8yoTfPeuD_bVxr4Q_tQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w20-20020a05640234d400b0045d0d1afe8eso10133333edc.15
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/CaNeQ1w3CFkO4CLWwaCNSZW6YsiwflkbB1p4abvQo=;
 b=5jdMyph4yxQoqbG4jhwh+mNhjw31JouXYBXKbwX30e0mMkeOwScCTlbbZha5Z7escy
 pmcwjOEbDzvQseuPbsf575ldjRlQVyFOJpUkIAHDTRdt8hpA/9nPDEwC5pyyV1EhHdCG
 slH7aK/gvGKmEBOIyWav3qfeFmo3n9czr6KvUSLwlVWlKOOHEvVuvY2ez9zxXp7qpM2V
 ES75bSar8giPitGdtMplLnY81dx4+qZCJrFm0GoHn6chl5dh+vjvdZE0JZGw0kp3ri8k
 Sa+g7rZ9PpF2afhNgVfs1fgCxN8HYmR5xstNjUB8TpFC+X/UH4zU9eFf2zgwoYAzGQGw
 WZ7Q==
X-Gm-Message-State: ACrzQf0xUve+tE6swWFMtg44V7Q1eYYrKAfbDOAcRcaQfJCsokTXQpuj
 hO8vvIPntxn13MIZUJyOeH1mmoFpPYzFzx7fh7m/Tpqt7K9Gi5vCZhUv0OYb/JM54dcrAL5S+ZK
 5nsc/h0vg+QTGpIdE84mHnJicZq90SRPMEcdAvM5GBM0HdZdynxZPmo/Qo33pHNlnEZs=
X-Received: by 2002:a17:907:2c59:b0:78d:8e03:134 with SMTP id
 hf25-20020a1709072c5900b0078d8e030134mr2380647ejc.310.1666099947719; 
 Tue, 18 Oct 2022 06:32:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EnODfvR+gshFx9ijevknWiyh4ErC6wNOEjGlF14EFtkKhcmJ2MSYvQWwVNkcMIYCK4aATqQ==
X-Received: by 2002:a17:907:2c59:b0:78d:8e03:134 with SMTP id
 hf25-20020a1709072c5900b0078d8e030134mr2380625ejc.310.1666099947406; 
 Tue, 18 Oct 2022 06:32:27 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a056402359000b004589da5e5cesm9120727edc.41.2022.10.18.06.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 31/53] target/i386: support operand merging in binary scalar
 helpers
Date: Tue, 18 Oct 2022 15:30:20 +0200
Message-Id: <20221018133042.856368-32-pbonzini@redhat.com>
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

Compared to Paul's implementation, the new decoder will use a different approach
to implement AVX's merging of dst with src1 on scalar operations.  Adjust the
helpers to provide this functionality.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 5f0ee9db52..ddedc46f36 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -557,12 +557,20 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
                                                                         \
     void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
+        int i;                                                          \
         d->ZMM_S(0) = F(32, v->ZMM_S(0), s->ZMM_S(0));                  \
+        for (i = 1; i < 2 << SHIFT; i++) {                              \
+            d->ZMM_L(i) = v->ZMM_L(i);                                  \
+        }                                                               \
     }                                                                   \
                                                                         \
     void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)\
     {                                                                   \
+        int i;                                                          \
         d->ZMM_D(0) = F(64, v->ZMM_D(0), s->ZMM_D(0));                  \
+        for (i = 1; i < 1 << SHIFT; i++) {                              \
+            d->ZMM_Q(i) = v->ZMM_Q(i);                                  \
+        }                                                               \
     }
 
 #else
@@ -1027,12 +1035,20 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
     SSE_HELPER_CMP_P(name, F, C)                                            \
     void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
     {                                                                       \
+        int i;                                                              \
         d->ZMM_L(0) = C(F(32, v->ZMM_S(0), s->ZMM_S(0))) ? -1 : 0;          \
+        for (i = 1; i < 2 << SHIFT; i++) {                                  \
+            d->ZMM_L(i) = v->ZMM_L(i);                                      \
+        }                                                                   \
     }                                                                       \
                                                                             \
     void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *v, Reg *s)    \
     {                                                                       \
+        int i;                                                              \
         d->ZMM_Q(0) = C(F(64, v->ZMM_D(0), s->ZMM_D(0))) ? -1 : 0;          \
+        for (i = 1; i < 1 << SHIFT; i++) {                                  \
+            d->ZMM_Q(i) = v->ZMM_Q(i);                                      \
+        }                                                                   \
     }
 
 #define FPU_EQ(x) (x == float_relation_equal)
-- 
2.37.3


