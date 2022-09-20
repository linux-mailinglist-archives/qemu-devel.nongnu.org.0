Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC345BF03B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:37:27 +0200 (CEST)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalrq-0005is-N6
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah08-0006QP-Ha
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah06-0002AL-2L
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZE0N8PNvqQrTS2RMXVe32gG4ZjMIl14Sabo0b1XCdY=;
 b=Z1nrS935LIUXgIqA6qcNXombVMVAOuzNVoxx+8gcYYiRl8AuRYxg2piHKve28ZuukLqexM
 gjciUwJZwclsDZBCVrtJB+vuif0AdA8bt06kjxkWKof80mly/OyqPU3lIUEy5ICyRJ4qfR
 PCnTEEeHXfSiILSiZaMbEFguj3hKYkY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-yUapoQk7NbC5dge5CUxeDg-1; Tue, 20 Sep 2022 13:25:35 -0400
X-MC-Unique: yUapoQk7NbC5dge5CUxeDg-1
Received: by mail-ej1-f69.google.com with SMTP id
 sb32-20020a1709076da000b0077faea20701so1777578ejc.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GZE0N8PNvqQrTS2RMXVe32gG4ZjMIl14Sabo0b1XCdY=;
 b=QqPPmmIhhvIvhfxxiVsKHeu5NjiN3XikLx4+hdVvuw3o20OlbvUn8+64+P9SN2zzM1
 UXZUd2TFxNqWaXsEE7xSDWZ/1gyY9zNTunoNrgFXi7nMHjp559l4/2uFtcN0doUYcw4w
 mv186adr7Z2nYf5M5AwfjzVTzb3b/rNKKCP7q3w1N4XbRr3tAENZUiGDKRF64lps1qLE
 q2ERNz7TjGkTy69TZRQQRIu4NswiPLUKiFNQk+KsJ7+sakQS6LHfTt9pIO3nZ367eTSI
 reWtTvbg/y9sJsfk1u6OudcYm7MEEnwCpAzS9iEiHGx/BLPEt692cwlD0/K9mhBITZaL
 ZaHg==
X-Gm-Message-State: ACrzQf2IfWFQXNOj78M+KZO6dXd6wb7oCC02v3huS0Fgx7/jpZv7Zrzv
 chx+Rq8spfVaB7WYt8MdK9dxZt1FrBlue5IyFWbTURPGT1zULOt4jL6rWPKk1mbCRdrjWvZ6lUk
 cH7IoOeOGaBRwTo1sVvqAYrbq7I+2Rl5M0TQxz2TMDDhc9/G8TFcw7RkOGmn5tTPta8E=
X-Received: by 2002:a17:907:701:b0:780:2c44:e4dd with SMTP id
 xb1-20020a170907070100b007802c44e4ddmr17654894ejb.589.1663694733239; 
 Tue, 20 Sep 2022 10:25:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ke4OonRd5c+N6/JoXAhjWe9E+29KHweDUJz6t71DjDxwdLZxztDMB3z0O8LhaBcNP5JhZvg==
X-Received: by 2002:a17:907:701:b0:780:2c44:e4dd with SMTP id
 xb1-20020a170907070100b007802c44e4ddmr17654835ejb.589.1663694732249; 
 Tue, 20 Sep 2022 10:25:32 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a056402004500b0044f1e64e9f4sm217059edu.17.2022.09.20.10.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 15/37] target/i386: support operand merging in binary
 scalar helpers
Date: Tue, 20 Sep 2022 19:24:45 +0200
Message-Id: <20220920172507.95568-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
2.37.2


