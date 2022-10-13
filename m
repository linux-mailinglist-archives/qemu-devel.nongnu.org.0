Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBEA5FE525
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:18:08 +0200 (CEST)
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Wc-0006hI-T6
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63G-0002iv-BH
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63E-0005GQ-OZ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/CaNeQ1w3CFkO4CLWwaCNSZW6YsiwflkbB1p4abvQo=;
 b=bh6g0tPkLTQK5LjMeLGHNJgowz5CkQJS7mycKgiYMpbk61wj3gBQuVORXaocYdgP/0huoY
 Qkgc80HPXSljyL/YoHHS76wiPj29cyeVjLWbF6egetqyS0FAl57f8K7mizVjqBAqcJCivR
 5t+e++l7TKnhgDkXAc/STKwPPBTl/ew=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-lnlIBklQNMi6LWkchkPL-g-1; Thu, 13 Oct 2022 17:47:35 -0400
X-MC-Unique: lnlIBklQNMi6LWkchkPL-g-1
Received: by mail-ej1-f72.google.com with SMTP id
 qw17-20020a1709066a1100b0078e25b6a52fso3592ejc.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/CaNeQ1w3CFkO4CLWwaCNSZW6YsiwflkbB1p4abvQo=;
 b=CuUP8rJhfwv1yUZA1NB0DFlBrGTjzlsPr5vY2ABJpX5E2qiDzeBvu167sBq10SZ3yD
 +O2EFCTB8b6Qsg2QSq1avwqEbrNNBLB6xnV2nmjmcg+tPR5VnDFc5OzYEM5eZKuYqc0U
 zSRxBCVqsvMJB40yT5Txe39GoD7necYSQFQDM91YGFw5EZzE+0QmW6Pkm8Jk1YiH94rk
 rapKt+nIR+HhckW6AYfZoWWNcbbVnjya01JnREaKNi4u+PVFlzS4s+5xAalND2mAYeuf
 E6LbURAK+NxGZp54G1F8V8fqYieK5J+LsKKuUBhb25s7kHmW6nGjyLzbLvMl8w9dZw6Y
 Swlg==
X-Gm-Message-State: ACrzQf36JrIbyUxsEqpWKIboTKsVddHfadN9DyOzsiellUIfb661ftkp
 FET5wf6j5ftFDnU78fu5UVh2vSM5z6TzgrJPgmEgSR03XklkpPCTD5csD8fSCcrcNCu1HPw3dr0
 garQs6k/0fl+es6e4jyNH7RQ15m/DI2aJ74PfYdj4jCwaMOTiydKw10gLdbDmMWXEZ+w=
X-Received: by 2002:a05:6402:358e:b0:45c:aa8b:f7e9 with SMTP id
 y14-20020a056402358e00b0045caa8bf7e9mr1538294edc.33.1665697653448; 
 Thu, 13 Oct 2022 14:47:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+OVk3AJl7kauHi1SDxshCFzTq7sGSy8ZbmxTKHuuaLxkUGNz9rPomNZLw6t+JwNLntSCdeQ==
X-Received: by 2002:a05:6402:358e:b0:45c:aa8b:f7e9 with SMTP id
 y14-20020a056402358e00b0045caa8bf7e9mr1538281edc.33.1665697653160; 
 Thu, 13 Oct 2022 14:47:33 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170906540700b0078d9cd0d2d6sm498992ejo.11.2022.10.13.14.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 13/35] target/i386: support operand merging in binary scalar
 helpers
Date: Thu, 13 Oct 2022 23:46:29 +0200
Message-Id: <20221013214651.672114-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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


