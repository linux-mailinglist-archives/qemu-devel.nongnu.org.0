Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8095A009C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:43:55 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuPy-0006GD-GY
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuEG-0001eP-QR
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuE8-0003iU-9m
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XL1/mxTpa96eqdW1Fs92s3tPUnKhpSaLtXS3bi+syw=;
 b=BgljwW2tWb+wpNS5ApJEcfFYceQqocklSQGkCcBGfQJTm2I6tnlgwCwA8z1j679iBXJBlD
 uxJDL4Pz8ttm/Ihs30y5QhJ/4XoOb0oErqas5sEfX2cNZeIpxtEejoLypxTqzWyTHNcrsx
 LJneg1kjsIejTX8PM7qWhczMhKjy3k0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-k93ugxcsMvCwLmdkrFxntw-1; Wed, 24 Aug 2022 13:31:37 -0400
X-MC-Unique: k93ugxcsMvCwLmdkrFxntw-1
Received: by mail-wr1-f72.google.com with SMTP id
 c22-20020adfa316000000b0022574c2dc1aso358106wrb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5XL1/mxTpa96eqdW1Fs92s3tPUnKhpSaLtXS3bi+syw=;
 b=Q92plur0HJOxnuDT+oXMzSOb4rNnEVLZSYbjcOduTOo8DIhYEWa+nZeTM299GwVFdw
 DPNLb7SjgQuQ/fbSU/1kFBe9tB3SXMqUHjR6jUEhC7srYWxPgBOMn78zCVYIKvnQWd77
 ZRt74AG3vEgN0zyJSFfzdMFej2TApv37Wy8LGXGWKx+XbrwtU0FBWMETtA4G9f1WbWca
 GkGXEbNTNPLJd2X2qcNLsdxobiMxV+3wu7HO1ZLPVh0TmM5tdJEaqPDwB9Chyn5dOt3T
 lcCkaCGGNDwJFONNHDEsGizHVDv+eKkOe0NUOhN95AkdWSoc7GPoYIJg01/7F17sFfcz
 sh2w==
X-Gm-Message-State: ACgBeo3Wu6IRSPNR1pldHG6T1cIFGHbUWUdklS5UClxbAIEd1PA9FdNK
 QsE2Ssw/z7GRoatkEc6dkfkpc/mauDwm0D66HUqlMyywysfbkmyQV4w2+29EEswZSdd0fPbmZj1
 zn1ktt2sH+qoM70WNDkXyM6/jzA2YCiIPWcJvvZfMwR/xK/vYdTlbG4Gh+gt5/QAi1U4=
X-Received: by 2002:a1c:cc0f:0:b0:3a5:333:310d with SMTP id
 h15-20020a1ccc0f000000b003a50333310dmr38088wmb.122.1661362295084; 
 Wed, 24 Aug 2022 10:31:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AM6BuX+/LA6SkEzQgZeDS9o04a6p5oytg8pgjJ/2O8xRHSRWnEh87oqidNLqN+7QVzBoEnw==
X-Received: by 2002:a1c:cc0f:0:b0:3a5:333:310d with SMTP id
 h15-20020a1ccc0f000000b003a50333310dmr38075wmb.122.1661362294763; 
 Wed, 24 Aug 2022 10:31:34 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c129200b003a5fa79007fsm2538446wmd.7.2022.08.24.10.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:31:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 06/17] target/i386: add 08-0F, 18-1F opcodes
Date: Wed, 24 Aug 2022 19:31:12 +0200
Message-Id: <20220824173123.232018-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824173123.232018-1-pbonzini@redhat.com>
References: <20220824173123.232018-1-pbonzini@redhat.com>
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

Using operands named "0-7" for fixed registers wasn't a great idea
in retrospect...  It only makes sense for 1-byte INC/DEC, and those
could even use LoBits instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 17 ++++++++++++++++-
 target/i386/tcg/decode-old.c.inc |  2 +-
 target/i386/tcg/emit.c.inc       | 10 ++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 6d0d6a683c..b1e849b332 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -515,9 +515,24 @@ static X86OpEntry A2_00_F7[16][8] = {
 
 static X86OpEntry A2_08_FF[16][8] = {
     {
-        [7] = { .decode = decode_twobyte, .is_decode = true, }
+        X86_OP_ENTRY2(OR, E,b, G,b),
+        X86_OP_ENTRY2(OR, E,v, G,v),
+        X86_OP_ENTRY2(OR, G,b, E,b),
+        X86_OP_ENTRY2(OR, G,v, E,v),
+        X86_OP_ENTRY2(OR, 0,b, I,b),   /* AL, Ib */
+        X86_OP_ENTRY2(OR, 0,v, I,z),   /* rAX, Iz */
+        X86_OP_ENTRYr(PUSH, CS, w, i64),
+        { .decode = decode_twobyte, .is_decode = true, }
     },
     {
+        X86_OP_ENTRY2(SBB, E,b, G,b),
+        X86_OP_ENTRY2(SBB, E,v, G,v),
+        X86_OP_ENTRY2(SBB, G,b, E,b),
+        X86_OP_ENTRY2(SBB, G,v, E,v),
+        X86_OP_ENTRY2(SBB, 0,b, I,b),   /* AL, Ib */
+        X86_OP_ENTRY2(SBB, 0,v, I,z),   /* rAX, Iz */
+        X86_OP_ENTRYr(PUSH, DS, w, i64),
+        X86_OP_ENTRYw(POP, DS, w, i64)
     },
     {
     },
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index fb86855501..937975f69a 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1821,7 +1821,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #else
         use_new &= b <= limit;
 #endif
-        if (use_new && 0) {
+        if (use_new && b <= 0x1f) {
             return disas_insn_new(s, cpu, b);
         }
     case 0x0f:
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 758e468a25..1f799d1f18 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -135,6 +135,11 @@ static void gen_ADD(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_alu_op(s, OP_ADDL, decode->op[0].ot);
 }
 
+static void gen_OR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_ORL, decode->op[0].ot);
+}
+
 static void gen_PUSH(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_push_v(s, decode->op[2].v);
@@ -147,6 +152,11 @@ static void gen_POP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_pop_update(s, ot);
 }
 
+static void gen_SBB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_alu_op(s, OP_SBBL, decode->op[0].ot);
+}
+
 static void gen_writeback(DisasContext *s, X86DecodedOp *op)
 {
     switch (op->alu_op_type) {
-- 
2.37.1



