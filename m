Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4B5A1C23
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:20:38 +0200 (CEST)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLDJ-0004hw-Gy
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7J-0007Ua-Rc
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7E-0002i5-Sq
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hv5VEf61RzTeuzgfj43vn3qCYdhmPZ1BWjH8zNjtBXk=;
 b=RpLOgNEwWSXEu0If/1MqQFj4983/rY7PpPzBZ9HHRfvwLEyh1OLdEMW1iNummCdwGAbR1x
 7IWhZfh+dQZO6G+foYwvDsslk33HyOdEqlq4jUofOmbKD6iQjjrKGT+qgGibEFbnGG/OBg
 T5KwhgmpHDTlEh8SH8K5JZAMBWMKDxw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-59fU5p1zM8GNqRCHY3GhBA-1; Thu, 25 Aug 2022 18:14:18 -0400
X-MC-Unique: 59fU5p1zM8GNqRCHY3GhBA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so11496683wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Hv5VEf61RzTeuzgfj43vn3qCYdhmPZ1BWjH8zNjtBXk=;
 b=ql68e40+rE6nBdlcIODHeVpu2OX5phRAXlhQiTnFwVRhQoErH+fY5ykqn0R5/dVgX/
 xONCcFcSHRT3WaRZZpIFYdLO7Xj6etE/TNfwnM927muqcLqKFPUZe5Yq7UfZ7DlW5BS+
 1ORoyugpmM3xdjjodTchuTCo4FbtleSEbrT0pPyCOhGjKiANjPmfLDHOhfHrf1TG7OPF
 p5KyzBsSuFr2ILOzOfM2spskdaKM+Nr1Fi+/A3C1w+t/HZXUIGANKhuPL56cqZA/k6BJ
 OeKrmRrbM+ZIzKtpnolFC6f8T5S63I1gQn5tGlNMG+pfgUKgfCntP7ryez6pD7VfuVif
 2Mvg==
X-Gm-Message-State: ACgBeo1P6vRm+rOm4zReBGFfjeFxfuoDgJNqljJZxYpdtRRtKGjR8gmQ
 o1vFKUr2b+O/f06S45xHMzWnQxAqkupPoRBMt2HEmshQM2lvkL5tNELf2GZZvr8GRoSO+BG2re9
 BCT3twsN5QIULw9FOnE1JfOavcb/s0Ewlpa/52XdxTSHOarUv3Gthh7e0kSySsHo2I7Q=
X-Received: by 2002:adf:e4d0:0:b0:225:2947:3a5f with SMTP id
 v16-20020adfe4d0000000b0022529473a5fmr3311871wrm.387.1661465657086; 
 Thu, 25 Aug 2022 15:14:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5dA6h5rArurnVE5VrXh7C8EZy9KCN+cHAAC0JqKwdIdSW5BiK/9fhmapNIAFHogI0d66jdKA==
X-Received: by 2002:adf:e4d0:0:b0:225:2947:3a5f with SMTP id
 v16-20020adfe4d0000000b0022529473a5fmr3311861wrm.387.1661465656722; 
 Thu, 25 Aug 2022 15:14:16 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 az41-20020a05600c602900b003a60bc8ae8fsm519253wmb.21.2022.08.25.15.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 02/18] i386: Rework sse_op_table6/7
Date: Fri, 26 Aug 2022 00:13:55 +0200
Message-Id: <20220825221411.35122-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Add a flags field each row in sse_op_table6 and sse_op_table7.

Initially this is only used as a replacement for the magic
SSE41_SPECIAL pointer.  The other flags will become relevant
as the rest of the avx implementation is built out.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-6-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 230 ++++++++++++++++++++----------------
 1 file changed, 131 insertions(+), 99 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7fec582358..5335b86c01 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2977,7 +2977,6 @@ static const struct SSEOpHelper_table1 sse_op_table1[256] = {
 #undef SSE_SPECIAL
 
 #define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
-#define SSE_SPECIAL_FN ((void *)1)
 
 static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
     [0 + 2] = MMX_OP2(psrlw),
@@ -3061,113 +3060,134 @@ static const SSEFunc_0_epp sse_op_table5[256] = {
     [0xbf] = gen_helper_pavgb_mmx /* pavgusb */
 };
 
-struct SSEOpHelper_epp {
+struct SSEOpHelper_table6 {
     SSEFunc_0_epp op[2];
     uint32_t ext_mask;
+    int flags;
 };
 
-struct SSEOpHelper_eppi {
+struct SSEOpHelper_table7 {
     SSEFunc_0_eppi op[2];
     uint32_t ext_mask;
+    int flags;
 };
 
-#define SSSE3_OP(x) { MMX_OP2(x), CPUID_EXT_SSSE3 }
-#define SSE41_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE41 }
-#define SSE42_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE42 }
-#define SSE41_SPECIAL { { NULL, SSE_SPECIAL_FN }, CPUID_EXT_SSE41 }
-#define PCLMULQDQ_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, \
-        CPUID_EXT_PCLMULQDQ }
-#define AESNI_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_AES }
+#define gen_helper_special_xmm NULL
 
-static const struct SSEOpHelper_epp sse_op_table6[256] = {
-    [0x00] = SSSE3_OP(pshufb),
-    [0x01] = SSSE3_OP(phaddw),
-    [0x02] = SSSE3_OP(phaddd),
-    [0x03] = SSSE3_OP(phaddsw),
-    [0x04] = SSSE3_OP(pmaddubsw),
-    [0x05] = SSSE3_OP(phsubw),
-    [0x06] = SSSE3_OP(phsubd),
-    [0x07] = SSSE3_OP(phsubsw),
-    [0x08] = SSSE3_OP(psignb),
-    [0x09] = SSSE3_OP(psignw),
-    [0x0a] = SSSE3_OP(psignd),
-    [0x0b] = SSSE3_OP(pmulhrsw),
-    [0x10] = SSE41_OP(pblendvb),
-    [0x14] = SSE41_OP(blendvps),
-    [0x15] = SSE41_OP(blendvpd),
-    [0x17] = SSE41_OP(ptest),
-    [0x1c] = SSSE3_OP(pabsb),
-    [0x1d] = SSSE3_OP(pabsw),
-    [0x1e] = SSSE3_OP(pabsd),
-    [0x20] = SSE41_OP(pmovsxbw),
-    [0x21] = SSE41_OP(pmovsxbd),
-    [0x22] = SSE41_OP(pmovsxbq),
-    [0x23] = SSE41_OP(pmovsxwd),
-    [0x24] = SSE41_OP(pmovsxwq),
-    [0x25] = SSE41_OP(pmovsxdq),
-    [0x28] = SSE41_OP(pmuldq),
-    [0x29] = SSE41_OP(pcmpeqq),
-    [0x2a] = SSE41_SPECIAL, /* movntqda */
-    [0x2b] = SSE41_OP(packusdw),
-    [0x30] = SSE41_OP(pmovzxbw),
-    [0x31] = SSE41_OP(pmovzxbd),
-    [0x32] = SSE41_OP(pmovzxbq),
-    [0x33] = SSE41_OP(pmovzxwd),
-    [0x34] = SSE41_OP(pmovzxwq),
-    [0x35] = SSE41_OP(pmovzxdq),
-    [0x37] = SSE42_OP(pcmpgtq),
-    [0x38] = SSE41_OP(pminsb),
-    [0x39] = SSE41_OP(pminsd),
-    [0x3a] = SSE41_OP(pminuw),
-    [0x3b] = SSE41_OP(pminud),
-    [0x3c] = SSE41_OP(pmaxsb),
-    [0x3d] = SSE41_OP(pmaxsd),
-    [0x3e] = SSE41_OP(pmaxuw),
-    [0x3f] = SSE41_OP(pmaxud),
-    [0x40] = SSE41_OP(pmulld),
-    [0x41] = SSE41_OP(phminposuw),
-    [0xdb] = AESNI_OP(aesimc),
-    [0xdc] = AESNI_OP(aesenc),
-    [0xdd] = AESNI_OP(aesenclast),
-    [0xde] = AESNI_OP(aesdec),
-    [0xdf] = AESNI_OP(aesdeclast),
+#define OP(name, op, flags, ext, mmx_name) \
+    {{mmx_name, gen_helper_ ## name ## _xmm}, CPUID_EXT_ ## ext, flags}
+#define BINARY_OP_MMX(name, ext) \
+    OP(name, op2, SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
+#define BINARY_OP(name, ext, flags) \
+    OP(name, op2, flags, ext, NULL)
+#define UNARY_OP_MMX(name, ext) \
+    OP(name, op1, SSE_OPF_V0 | SSE_OPF_MMX, ext, gen_helper_ ## name ## _mmx)
+#define UNARY_OP(name, ext, flags) \
+    OP(name, op1, SSE_OPF_V0 | flags, ext, NULL)
+#define BLENDV_OP(name, ext, flags) OP(name, op3, SSE_OPF_BLENDV, ext, NULL)
+#define CMP_OP(name, ext) OP(name, op1, SSE_OPF_CMP | SSE_OPF_V0, ext, NULL)
+#define SPECIAL_OP(ext) OP(special, op1, SSE_OPF_SPECIAL, ext, NULL)
+
+/* prefix [66] 0f 38 */
+static const struct SSEOpHelper_table6 sse_op_table6[256] = {
+    [0x00] = BINARY_OP_MMX(pshufb, SSSE3),
+    [0x01] = BINARY_OP_MMX(phaddw, SSSE3),
+    [0x02] = BINARY_OP_MMX(phaddd, SSSE3),
+    [0x03] = BINARY_OP_MMX(phaddsw, SSSE3),
+    [0x04] = BINARY_OP_MMX(pmaddubsw, SSSE3),
+    [0x05] = BINARY_OP_MMX(phsubw, SSSE3),
+    [0x06] = BINARY_OP_MMX(phsubd, SSSE3),
+    [0x07] = BINARY_OP_MMX(phsubsw, SSSE3),
+    [0x08] = BINARY_OP_MMX(psignb, SSSE3),
+    [0x09] = BINARY_OP_MMX(psignw, SSSE3),
+    [0x0a] = BINARY_OP_MMX(psignd, SSSE3),
+    [0x0b] = BINARY_OP_MMX(pmulhrsw, SSSE3),
+    [0x10] = BLENDV_OP(pblendvb, SSE41, SSE_OPF_MMX),
+    [0x14] = BLENDV_OP(blendvps, SSE41, 0),
+    [0x15] = BLENDV_OP(blendvpd, SSE41, 0),
+    [0x17] = CMP_OP(ptest, SSE41),
+    [0x1c] = UNARY_OP_MMX(pabsb, SSSE3),
+    [0x1d] = UNARY_OP_MMX(pabsw, SSSE3),
+    [0x1e] = UNARY_OP_MMX(pabsd, SSSE3),
+    [0x20] = UNARY_OP(pmovsxbw, SSE41, SSE_OPF_MMX),
+    [0x21] = UNARY_OP(pmovsxbd, SSE41, SSE_OPF_MMX),
+    [0x22] = UNARY_OP(pmovsxbq, SSE41, SSE_OPF_MMX),
+    [0x23] = UNARY_OP(pmovsxwd, SSE41, SSE_OPF_MMX),
+    [0x24] = UNARY_OP(pmovsxwq, SSE41, SSE_OPF_MMX),
+    [0x25] = UNARY_OP(pmovsxdq, SSE41, SSE_OPF_MMX),
+    [0x28] = BINARY_OP(pmuldq, SSE41, SSE_OPF_MMX),
+    [0x29] = BINARY_OP(pcmpeqq, SSE41, SSE_OPF_MMX),
+    [0x2a] = SPECIAL_OP(SSE41), /* movntqda */
+    [0x2b] = BINARY_OP(packusdw, SSE41, SSE_OPF_MMX),
+    [0x30] = UNARY_OP(pmovzxbw, SSE41, SSE_OPF_MMX),
+    [0x31] = UNARY_OP(pmovzxbd, SSE41, SSE_OPF_MMX),
+    [0x32] = UNARY_OP(pmovzxbq, SSE41, SSE_OPF_MMX),
+    [0x33] = UNARY_OP(pmovzxwd, SSE41, SSE_OPF_MMX),
+    [0x34] = UNARY_OP(pmovzxwq, SSE41, SSE_OPF_MMX),
+    [0x35] = UNARY_OP(pmovzxdq, SSE41, SSE_OPF_MMX),
+    [0x37] = BINARY_OP(pcmpgtq, SSE41, SSE_OPF_MMX),
+    [0x38] = BINARY_OP(pminsb, SSE41, SSE_OPF_MMX),
+    [0x39] = BINARY_OP(pminsd, SSE41, SSE_OPF_MMX),
+    [0x3a] = BINARY_OP(pminuw, SSE41, SSE_OPF_MMX),
+    [0x3b] = BINARY_OP(pminud, SSE41, SSE_OPF_MMX),
+    [0x3c] = BINARY_OP(pmaxsb, SSE41, SSE_OPF_MMX),
+    [0x3d] = BINARY_OP(pmaxsd, SSE41, SSE_OPF_MMX),
+    [0x3e] = BINARY_OP(pmaxuw, SSE41, SSE_OPF_MMX),
+    [0x3f] = BINARY_OP(pmaxud, SSE41, SSE_OPF_MMX),
+    [0x40] = BINARY_OP(pmulld, SSE41, SSE_OPF_MMX),
+    [0x41] = UNARY_OP(phminposuw, SSE41, 0),
+    [0xdb] = UNARY_OP(aesimc, AES, 0),
+    [0xdc] = BINARY_OP(aesenc, AES, 0),
+    [0xdd] = BINARY_OP(aesenclast, AES, 0),
+    [0xde] = BINARY_OP(aesdec, AES, 0),
+    [0xdf] = BINARY_OP(aesdeclast, AES, 0),
 };
 
-static const struct SSEOpHelper_eppi sse_op_table7[256] = {
-    [0x08] = SSE41_OP(roundps),
-    [0x09] = SSE41_OP(roundpd),
-    [0x0a] = SSE41_OP(roundss),
-    [0x0b] = SSE41_OP(roundsd),
-    [0x0c] = SSE41_OP(blendps),
-    [0x0d] = SSE41_OP(blendpd),
-    [0x0e] = SSE41_OP(pblendw),
-    [0x0f] = SSSE3_OP(palignr),
-    [0x14] = SSE41_SPECIAL, /* pextrb */
-    [0x15] = SSE41_SPECIAL, /* pextrw */
-    [0x16] = SSE41_SPECIAL, /* pextrd/pextrq */
-    [0x17] = SSE41_SPECIAL, /* extractps */
-    [0x20] = SSE41_SPECIAL, /* pinsrb */
-    [0x21] = SSE41_SPECIAL, /* insertps */
-    [0x22] = SSE41_SPECIAL, /* pinsrd/pinsrq */
-    [0x40] = SSE41_OP(dpps),
-    [0x41] = SSE41_OP(dppd),
-    [0x42] = SSE41_OP(mpsadbw),
-    [0x44] = PCLMULQDQ_OP(pclmulqdq),
-    [0x60] = SSE42_OP(pcmpestrm),
-    [0x61] = SSE42_OP(pcmpestri),
-    [0x62] = SSE42_OP(pcmpistrm),
-    [0x63] = SSE42_OP(pcmpistri),
-    [0xdf] = AESNI_OP(aeskeygenassist),
+/* prefix [66] 0f 3a */
+static const struct SSEOpHelper_table7 sse_op_table7[256] = {
+    [0x08] = UNARY_OP(roundps, SSE41, 0),
+    [0x09] = UNARY_OP(roundpd, SSE41, 0),
+    [0x0a] = UNARY_OP(roundss, SSE41, SSE_OPF_SCALAR),
+    [0x0b] = UNARY_OP(roundsd, SSE41, SSE_OPF_SCALAR),
+    [0x0c] = BINARY_OP(blendps, SSE41, 0),
+    [0x0d] = BINARY_OP(blendpd, SSE41, 0),
+    [0x0e] = BINARY_OP(pblendw, SSE41, SSE_OPF_MMX),
+    [0x0f] = BINARY_OP_MMX(palignr, SSSE3),
+    [0x14] = SPECIAL_OP(SSE41), /* pextrb */
+    [0x15] = SPECIAL_OP(SSE41), /* pextrw */
+    [0x16] = SPECIAL_OP(SSE41), /* pextrd/pextrq */
+    [0x17] = SPECIAL_OP(SSE41), /* extractps */
+    [0x20] = SPECIAL_OP(SSE41), /* pinsrb */
+    [0x21] = SPECIAL_OP(SSE41), /* insertps */
+    [0x22] = SPECIAL_OP(SSE41), /* pinsrd/pinsrq */
+    [0x40] = BINARY_OP(dpps, SSE41, 0),
+    [0x41] = BINARY_OP(dppd, SSE41, 0),
+    [0x42] = BINARY_OP(mpsadbw, SSE41, SSE_OPF_MMX),
+    [0x44] = BINARY_OP(pclmulqdq, PCLMULQDQ, 0),
+    [0x60] = CMP_OP(pcmpestrm, SSE42),
+    [0x61] = CMP_OP(pcmpestri, SSE42),
+    [0x62] = CMP_OP(pcmpistrm, SSE42),
+    [0x63] = CMP_OP(pcmpistri, SSE42),
+    [0xdf] = UNARY_OP(aeskeygenassist, AES, 0),
 };
 
+#undef OP
+#undef BINARY_OP_MMX
+#undef BINARY_OP
+#undef UNARY_OP_MMX
+#undef UNARY_OP
+#undef BLENDV_OP
+#undef SPECIAL_OP
+
 static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     target_ulong pc_start)
 {
     int b1, op1_offset, op2_offset, is_xmm, val;
     int modrm, mod, rm, reg;
     struct SSEOpHelper_table1 sse_op;
+    struct SSEOpHelper_table6 op6;
+    struct SSEOpHelper_table7 op7;
     SSEFunc_0_epp sse_fn_epp;
-    SSEFunc_0_eppi sse_fn_eppi;
     SSEFunc_0_ppi sse_fn_ppi;
     SSEFunc_0_eppt sse_fn_eppt;
     MemOp ot;
@@ -3828,12 +3848,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             mod = (modrm >> 6) & 3;
 
             assert(b1 < 2);
-            sse_fn_epp = sse_op_table6[b].op[b1];
-            if (!sse_fn_epp) {
+            op6 = sse_op_table6[b];
+            if (op6.ext_mask == 0) {
                 goto unknown_op;
             }
-            if (!(s->cpuid_ext_features & sse_op_table6[b].ext_mask))
+            if (!(s->cpuid_ext_features & op6.ext_mask)) {
                 goto illegal_op;
+            }
 
             if (b1) {
                 op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
@@ -3870,6 +3891,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     }
                 }
             } else {
+                if ((op6.flags & SSE_OPF_MMX) == 0) {
+                    goto unknown_op;
+                }
                 op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
                 if (mod == 3) {
                     op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
@@ -3879,13 +3903,13 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_ldq_env_A0(s, op2_offset);
                 }
             }
-            if (sse_fn_epp == SSE_SPECIAL_FN) {
-                goto unknown_op;
+            if (!op6.op[b1]) {
+                goto illegal_op;
             }
 
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            op6.op[b1](cpu_env, s->ptr0, s->ptr1);
 
             if (b == 0x17) {
                 set_cc_op(s, CC_OP_EFLAGS);
@@ -4256,16 +4280,21 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             mod = (modrm >> 6) & 3;
 
             assert(b1 < 2);
-            sse_fn_eppi = sse_op_table7[b].op[b1];
-            if (!sse_fn_eppi) {
+            op7 = sse_op_table7[b];
+            if (op7.ext_mask == 0) {
                 goto unknown_op;
             }
-            if (!(s->cpuid_ext_features & sse_op_table7[b].ext_mask))
+            if (!(s->cpuid_ext_features & op7.ext_mask)) {
                 goto illegal_op;
+            }
 
             s->rip_offset = 1;
 
-            if (sse_fn_eppi == SSE_SPECIAL_FN) {
+            if (op7.flags & SSE_OPF_SPECIAL) {
+                /* None of the "special" ops are valid on mmx registers */
+                if (b1 == 0) {
+                    goto illegal_op;
+                }
                 ot = mo_64_32(s->dflag);
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3)
@@ -4410,6 +4439,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_ldo_env_A0(s, op2_offset);
                 }
             } else {
+                if ((op7.flags & SSE_OPF_MMX) == 0) {
+                    goto illegal_op;
+                }
                 op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
                 if (mod == 3) {
                     op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
@@ -4432,7 +4464,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_eppi(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            op7.op[b1](cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
             break;
 
         case 0x33a:
-- 
2.37.1



