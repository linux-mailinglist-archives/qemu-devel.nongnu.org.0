Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BD602EC0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:48:20 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okntD-00048g-1p
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004RJ-UM
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhc-0005Cl-BA
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uab1pag/hyzpxfLXfHWB39awvPjdv3h0bR5JqzUXU6M=;
 b=dvvVu1o2maKrldPqj5BSfa41wN08iwlAkxBJaT9gGSMe1it5zqXVADPWbfQi6/bQHDntv1
 /+MivpAHDDZokUIPxXf9tCoW4LDKonWGBNBBX7XMvg9C9T/aQakEmV7U/KzdV6CI3Om+Q6
 59UdYGTxHqtsUPaL+qCc267uZL1SrBE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-42zI-BKbMPCaQiGHeFkX_w-1; Tue, 18 Oct 2022 09:32:07 -0400
X-MC-Unique: 42zI-BKbMPCaQiGHeFkX_w-1
Received: by mail-ed1-f70.google.com with SMTP id
 v13-20020a056402348d00b0045d36615696so8375414edc.14
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uab1pag/hyzpxfLXfHWB39awvPjdv3h0bR5JqzUXU6M=;
 b=sQwdJKej+7np6MSjOx6jhRf6US+1vOi1ulV88L+Q6Tm5tywrfDd1lijfBawyXdwVkz
 iuvjVnON2fBRmR+uDrefazuq2g43KqEsZRUDnMecYlymX3OodE/IKmBwtk7xGy9n7aly
 VUA+g079dJMBpSQkPaOsEBTmdEoV2g8BLFDxKxVBtnGG5d2mFRTd4+tQ9w7C9Iyo+R0x
 BF140yhxksmrNjebI12Hi6hhrIWOXg7+UEQ6SQjBkj4M/FnxWCei747oRq066ZI0o1bq
 vlU19y2BTSCUaJ2Lra52SMES/1xZQHBwTft0QvBSJNIxYElJKSrsW0JuY3lKe1i4kYfP
 Ni/A==
X-Gm-Message-State: ACrzQf0/smF3yDOqpjpiSnTBJdWasMNw6JxhNk5AP/hr1QZPrB34kdq9
 ktHzNaOmZ1n3/hyZBbrbIdsGkcehOqWRU8QWmWmh9GfhKRDc4g/Duar/TEkZP6hflX/xlXS5rk0
 Dv8vT0xD0tv4iL41RYJwz9+gnAtXAVS3NbWcoFBBGtanDpDl4xb0TTCmovDcN+D1w8PA=
X-Received: by 2002:a17:907:9710:b0:791:8aa6:18bb with SMTP id
 jg16-20020a170907971000b007918aa618bbmr2343184ejc.279.1666099921692; 
 Tue, 18 Oct 2022 06:32:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5fXkaCoGAfRNeOk7cXLFIRaun+4zvFbhlYa5dBE4T2/2a8k0i8LIpJyQw4R3QGvDk5vsESkA==
X-Received: by 2002:a17:907:9710:b0:791:8aa6:18bb with SMTP id
 jg16-20020a170907971000b007918aa618bbmr2342671ejc.279.1666099912496; 
 Tue, 18 Oct 2022 06:31:52 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a056402359000b004589da5e5cesm9119881edc.41.2022.10.18.06.31.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/53] target/i386: make rex_w available even in 32-bit mode
Date: Tue, 18 Oct 2022 15:30:09 +0200
Message-Id: <20221018133042.856368-21-pbonzini@redhat.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

REX.W can be used even in 32-bit mode by AVX instructions, where it is retroactively
renamed to VEX.W.  Make the field available even in 32-bit mode but keep the REX_W()
macro as it was; this way, that the handling of dflag does not use it by mistake and
the AVX code more clearly points at the special VEX behavior of the bit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1b96201685..279e34e0d0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -99,8 +99,8 @@ typedef struct DisasContext {
     uint8_t rex_r;
     uint8_t rex_x;
     uint8_t rex_b;
-    bool rex_w;
 #endif
+    bool vex_w; /* used by AVX even on 32-bit processors */
     bool jmp_opt; /* use direct block chaining for direct jumps */
     bool repz_opt; /* optimize jumps within repz instructions */
     bool cc_op_dirty;
@@ -177,7 +177,7 @@ typedef struct DisasContext {
 
 #ifdef TARGET_X86_64
 #define REX_PREFIX(S)  (((S)->prefix & PREFIX_REX) != 0)
-#define REX_W(S)       ((S)->rex_w)
+#define REX_W(S)       ((S)->vex_w)
 #define REX_R(S)       ((S)->rex_r + 0)
 #define REX_X(S)       ((S)->rex_x + 0)
 #define REX_B(S)       ((S)->rex_b + 0)
@@ -4823,7 +4823,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     s->pc = s->base.pc_next;
     s->override = -1;
 #ifdef TARGET_X86_64
-    s->rex_w = false;
     s->rex_r = 0;
     s->rex_x = 0;
     s->rex_b = 0;
@@ -4831,6 +4830,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     s->rip_offset = 0; /* for relative ip address */
     s->vex_l = 0;
     s->vex_v = 0;
+    s->vex_w = false;
     switch (sigsetjmp(s->jmpbuf, 0)) {
     case 0:
         break;
@@ -4903,7 +4903,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (CODE64(s)) {
             /* REX prefix */
             prefixes |= PREFIX_REX;
-            s->rex_w = (b >> 3) & 1;
+            s->vex_w = (b >> 3) & 1;
             s->rex_r = (b & 0x4) << 1;
             s->rex_x = (b & 0x2) << 2;
             s->rex_b = (b & 0x1) << 3;
@@ -4946,8 +4946,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #ifdef TARGET_X86_64
                 s->rex_x = (~vex2 >> 3) & 8;
                 s->rex_b = (~vex2 >> 2) & 8;
-                s->rex_w = (vex3 >> 7) & 1;
 #endif
+                s->vex_w = (vex3 >> 7) & 1;
                 switch (vex2 & 0x1f) {
                 case 0x01: /* Implied 0f leading opcode bytes.  */
                     b = x86_ldub_code(env, s) | 0x100;
-- 
2.37.3


