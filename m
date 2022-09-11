Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852705B51E6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:26:20 +0200 (CEST)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWLD-00056R-Jy
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0w-0000oD-6R
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0s-0007Do-0v
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmKHaO/r+hE0N0Rf5uQ/ZkbpDUu41y7LeqCjf/WSlvI=;
 b=cE6HO8yFU7Ktthmo6D6B1q/LKohNtgwY24ZsGzeCUxJeZ1xdjO/fNl0ymPE1j5pEYm6A3g
 mHCYTAi6aCOvVcvPhR32mQK/XagfGTabSh8u8zihqcAvRe0Vt499F6SniYj/rOaEOMM86M
 hOp8RebpOdV0sUeZKPiwgGE6+5VDpn0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-FH9NFhIyPeSGdmU4vCpf0g-1; Sun, 11 Sep 2022 19:05:14 -0400
X-MC-Unique: FH9NFhIyPeSGdmU4vCpf0g-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso5053814edc.21
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YmKHaO/r+hE0N0Rf5uQ/ZkbpDUu41y7LeqCjf/WSlvI=;
 b=Vp3enogvInCal7wIjfR+IBTTNPwu8DzSERv3AYBE2AmW3qyV6pX6Xek8BYibczweO/
 BU68PkfwcA0a8knJiuKIid0eNse06LvX4AXhkqPNMSiXNEUeden98HhXZLUjRp86VRLF
 amO/bLXchhP6ZjLLHjOlQdzc6QSQMArHuZerTwhN9wJgJh8WSwSokTy54h2VJZn5sUQM
 OheXewSPTQFJ9UxSUxP7cZw/6QD/pVXcjqmXh82p3r6fPbctLZ7K9OJSFV5+iGuldolm
 7xLNBESa1ztMcHO6ZJSqMsz+Jxxn/sCoHjuhBPy91B+FuC8r4SzekNmnIcP54fsC6Uum
 ClZA==
X-Gm-Message-State: ACgBeo0qANMBWMJaW/r0Zy8lH94WgXSgzN+zuhOshVIGvUJyXI9CbMEE
 2ppnRfDqtCKR+AJjgBrU1lRJRLD2vwHGXrVvRIX9EUC4RToHZvoDMcyu+SFGA94wXsSf8GeazV4
 pKAaFxniWd0psDWReSf0+OaNCtCtNxzPVSW2KCIPmqLNRARsU0nJrkbzKJw2dMxBOWvw=
X-Received: by 2002:a17:907:7b9d:b0:77d:8cd3:ea3a with SMTP id
 ne29-20020a1709077b9d00b0077d8cd3ea3amr1332795ejc.746.1662937512648; 
 Sun, 11 Sep 2022 16:05:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5NEgq/d7P7zcOQwkpEDh6yZhs208ZnXo5J91zkcFp5vOR4B8TChK3HsLyjy6bay3uZcfpO1w==
X-Received: by 2002:a17:907:7b9d:b0:77d:8cd3:ea3a with SMTP id
 ne29-20020a1709077b9d00b0077d8cd3ea3amr1332784ejc.746.1662937512343; 
 Sun, 11 Sep 2022 16:05:12 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906048a00b0073d83f80b05sm3512566eja.94.2022.09.11.16.05.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/37] target/i386: support operand merging in binary scalar
 helpers
Date: Mon, 12 Sep 2022 01:03:56 +0200
Message-Id: <20220911230418.340941-17-pbonzini@redhat.com>
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

Compared to Paul's implementation, the new decoder will use a different approach
to implement AVX's merging of dst with src1 on scalar operations.  Adjust the
helpers to provide this functionality.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fb8733f509..527da59299 100644
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



