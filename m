Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E838602E0E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:13:44 +0200 (CEST)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknLe-0007rb-WE
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004Rn-Az
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiK-0005Oi-6Z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+rs1/WmHEQ070rb0qOWPUYpr19R9HQxlkUYPKI4/gTE=;
 b=Qziu+07xHuW0eqRKATqF2WLXfHhsFRtMPzm25M/fdBGyGAwid/yXq9Qqiqyn3HkllZ3bD3
 VMD75tuMNLsdkWf5ZxP+Q3AY9hm1Rnxkyrqz1Nfl8aUIIWaMzIqUyLsUgNrLsMH/DP05pE
 7o9nczgIWtD0FLNHuXvNsvXYYNFQhlk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-FeQNZ2PoOwqtLJ6FGbySbQ-1; Tue, 18 Oct 2022 09:32:58 -0400
X-MC-Unique: FeQNZ2PoOwqtLJ6FGbySbQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hc43-20020a17090716ab00b0078e28567ffbso4750232ejc.15
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rs1/WmHEQ070rb0qOWPUYpr19R9HQxlkUYPKI4/gTE=;
 b=2rs8Z48m+HzdLnACKxqSTUx5DYsle55y91pZd+lkGuKIwlYf9Q7+fkt8mhsC+qKuzc
 xuL2V2HizPeCYH049B5+HZRccYjnI39mURTOEPEruxhrhVYhMmDrHxdp4xwfOoqX8eOi
 gx7AeDExXeTGjhTE3FEL+Xf9gaEWzzrPxstuttVuEY6w7VJMyMbykE2LahDnchoJodrf
 G1kwTWfz3K9WE/ziEum/aK9daTiNF3wGChJEQX0DdjGmB+a6NDPjoOoAl8w6AsFV4Wu7
 iP2+t+M4jMortJP7///Vl1dpn3OsC5TFJuB0qlRadbl/L0Ul8Tv3g620d+BdZ54YFOdd
 aGYg==
X-Gm-Message-State: ACrzQf2IQ3i3i4taiJ7AlPYEGPaEr3SlIGMmyT2Z2DAs9FA+Z9/sBsJk
 eCGtIJrHZOCV7ZepU0lNeTCZF36f61tc0NWtHE0hlQHjQ4F1uCB0J3gRSAV3/lNuwpiNcJEILO4
 1YkV8kSjlDNNmtyGnfDLeNptDaQFfpbk23sImC29R6L1yTbftAuyA/YPSiMvRHoKZJ20=
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr2406316ejc.208.1666099976739; 
 Tue, 18 Oct 2022 06:32:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Xh2+IWGaWKenm3wPOF8mMwEBHUUSDvif0etJMGykTxlgAf+bNjyJGZzTAolTn3OBgUXL/zg==
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr2406293ejc.208.1666099976428; 
 Tue, 18 Oct 2022 06:32:56 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170906715400b0073ddff7e432sm7695141ejj.14.2022.10.18.06.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 41/53] target/i386: clarify (un)signedness of immediates from
 0F3Ah opcodes
Date: Tue, 18 Oct 2022 15:30:30 +0200
Message-Id: <20221018133042.856368-42-pbonzini@redhat.com>
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

Three-byte opcodes from the 0F3Ah area all have an immediate byte which
is usually unsigned.  Clarify in the helper code that it is unsigned;
the new decoder treats immediates as signed by default, and seeing
an intN_t in the prototype might give the wrong impression that one
can use decode->immediate directly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 8 ++++----
 target/i386/ops_sse_header.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 090ba013b3..e7830ff277 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1605,17 +1605,17 @@ SSE_HELPER_W(helper_psignw, FSIGNW)
 SSE_HELPER_L(helper_psignd, FSIGNL)
 
 void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
-                                  int32_t shift)
+                                  uint32_t imm)
 {
     int i;
 
     /* XXX could be checked during translation */
-    if (shift >= (SHIFT ? 32 : 16)) {
+    if (imm >= (SHIFT ? 32 : 16)) {
         for (i = 0; i < (1 << SHIFT); i++) {
             d->Q(i) = 0;
         }
     } else {
-        shift <<= 3;
+        int shift = imm * 8;
 #define SHR(v, i) (i < 64 && i > -64 ? i > 0 ? v >> (i) : (v << -(i)) : 0)
 #if SHIFT == 0
         d->Q(0) = SHR(s->Q(0), shift - 0) |
@@ -2093,7 +2093,7 @@ static inline int pcmp_val(Reg *r, uint8_t ctrl, int i)
 }
 
 static inline unsigned pcmpxstrx(CPUX86State *env, Reg *d, Reg *s,
-                                 int8_t ctrl, int valids, int validd)
+                                 uint8_t ctrl, int valids, int validd)
 {
     unsigned int res = 0;
     int v;
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 440f1c0e78..98178be148 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -335,7 +335,7 @@ DEF_HELPER_4(glue(pshufb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignd, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, s32)
+DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, i32)
 
 /* SSE4.1 op helpers */
 #if SHIFT >= 1
-- 
2.37.3


