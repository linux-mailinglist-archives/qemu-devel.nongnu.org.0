Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CF05A00BD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:52:10 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuXw-0006Px-O6
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuEV-0001o0-12
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oQuE9-0003ie-4D
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661362300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QT+/tnbwcKr0FvhYYSVIPF3FNhS5k+vOlXhs6LQbIXw=;
 b=Y0QlEX8p8sfPMDjCKEeTr2md8eDST1tZShHtLN/By3I8a5MZQn5TBSkPNAXxoxGoTHjlvT
 D8tOeot2x0mdfxXiou8p9voOkX4RzcFff4iKyciCbPqwAx+3nrL8fBMn6Q70ChE0P2tPgq
 jeiND3K7sVpMXxvJQmpmh9UNFSjuXXY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-yllxivdZOdm31wna1lWYJA-1; Wed, 24 Aug 2022 13:31:35 -0400
X-MC-Unique: yllxivdZOdm31wna1lWYJA-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003a6271a9718so9429764wmb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QT+/tnbwcKr0FvhYYSVIPF3FNhS5k+vOlXhs6LQbIXw=;
 b=hic/nLCxun6w1/Z96rFK9PzzabjlfN/wdrdIWrKfrtGCOMi/K4OetSn0rF3aV6dqM4
 yh4kEaHZVVCsZVhsulEdJJZYV/yAeSs3vkAxtxu9Y8bt7TqkVBbNKXji55AV1/8vM/5z
 fI2SOYgPo1KvBiv1lTuJr4jYotHkaQVFWCZyFzsBNGC9kO3vjrdO3sffbSGO6kWO+6uO
 d7FlkmstXMY9Ehttbb3PO30Rd6CizXTQoJ2DknJPhSd4MbkLz0Tt0gldL8Sv2psOygZw
 EBAApOyX/DasvRFwLXVom/4Hnjd2C7K+63MzDNaaEIUi2nQp5CMALheFXNum6MtJJTDU
 Q+nQ==
X-Gm-Message-State: ACgBeo0hn9tJibC2l4z2E5HFUHsKBHLEtMPl7nRbSDrrgOw6/5lr6Hj9
 dB2aMtJM+VF99zPUkhgeB3KVbdF36Nx4vwUyXASVCjSbmrvKPHiAv6ItrDge17m5DGQtdav10al
 GnceQZ/26HQzDSYkNm4+K4sqT+PJVgSmoaYI0qZcBpr8Qc0X6YYrE3pz3MXXBOSsPYQM=
X-Received: by 2002:adf:fa8a:0:b0:225:20ab:642b with SMTP id
 h10-20020adffa8a000000b0022520ab642bmr140578wrr.615.1661362288988; 
 Wed, 24 Aug 2022 10:31:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+rQ4YZZSXhpygxVE7OoerU+0+rEQ9VV5UiTp0Gr7CgW0OoskAa2yJu0zHy9832PnT1tsIBQ==
X-Received: by 2002:adf:fa8a:0:b0:225:20ab:642b with SMTP id
 h10-20020adffa8a000000b0022520ab642bmr140503wrr.615.1661362287080; 
 Wed, 24 Aug 2022 10:31:27 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 w3-20020adfde83000000b002253af82fa7sm17864212wrl.9.2022.08.24.10.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:31:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 01/17] target/i386: extract old decoder to a separate file
Date: Wed, 24 Aug 2022 19:31:07 +0200
Message-Id: <20220824173123.232018-2-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

To have a better idea of which functions are helpers to emit TCG ops
and which implement the decode tree, extract the latter to a separate
file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-old.c.inc | 5712 +++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      | 5715 +-----------------------------
 2 files changed, 5713 insertions(+), 5714 deletions(-)
 create mode 100644 target/i386/tcg/decode-old.c.inc

diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
new file mode 100644
index 0000000000..61448ab7c9
--- /dev/null
+++ b/target/i386/tcg/decode-old.c.inc
@@ -0,0 +1,5712 @@
+/* For a switch indexed by MODRM, match all memory operands for a given OP.  */
+#define CASE_MODRM_MEM_OP(OP) \
+    case (0 << 6) | (OP << 3) | 0 ... (0 << 6) | (OP << 3) | 7: \
+    case (1 << 6) | (OP << 3) | 0 ... (1 << 6) | (OP << 3) | 7: \
+    case (2 << 6) | (OP << 3) | 0 ... (2 << 6) | (OP << 3) | 7
+
+#define CASE_MODRM_OP(OP) \
+    case (0 << 6) | (OP << 3) | 0 ... (0 << 6) | (OP << 3) | 7: \
+    case (1 << 6) | (OP << 3) | 0 ... (1 << 6) | (OP << 3) | 7: \
+    case (2 << 6) | (OP << 3) | 0 ... (2 << 6) | (OP << 3) | 7: \
+    case (3 << 6) | (OP << 3) | 0 ... (3 << 6) | (OP << 3) | 7
+
+typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
+typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
+typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
+typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
+typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
+typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv_i32 val);
+typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
+typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                               TCGv val);
+
+#define SSE_SPECIAL ((void *)1)
+#define SSE_DUMMY ((void *)2)
+
+#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
+#define SSE_FOP(x) { gen_helper_ ## x ## ps, gen_helper_ ## x ## pd, \
+                     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, }
+
+static const SSEFunc_0_epp sse_op_table1[256][4] = {
+    /* 3DNow! extensions */
+    [0x0e] = { SSE_DUMMY }, /* femms */
+    [0x0f] = { SSE_DUMMY }, /* pf... */
+    /* pure SSE operations */
+    [0x10] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
+    [0x11] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
+    [0x12] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movlps, movlpd, movsldup, movddup */
+    [0x13] = { SSE_SPECIAL, SSE_SPECIAL },  /* movlps, movlpd */
+    [0x14] = { gen_helper_punpckldq_xmm, gen_helper_punpcklqdq_xmm },
+    [0x15] = { gen_helper_punpckhdq_xmm, gen_helper_punpckhqdq_xmm },
+    [0x16] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd, movshdup */
+    [0x17] = { SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd */
+
+    [0x28] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
+    [0x29] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
+    [0x2a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtpi2ps, cvtpi2pd, cvtsi2ss, cvtsi2sd */
+    [0x2b] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movntps, movntpd, movntss, movntsd */
+    [0x2c] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
+    [0x2d] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
+    [0x2e] = { gen_helper_ucomiss, gen_helper_ucomisd },
+    [0x2f] = { gen_helper_comiss, gen_helper_comisd },
+    [0x50] = { SSE_SPECIAL, SSE_SPECIAL }, /* movmskps, movmskpd */
+    [0x51] = SSE_FOP(sqrt),
+    [0x52] = { gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL },
+    [0x53] = { gen_helper_rcpps, NULL, gen_helper_rcpss, NULL },
+    [0x54] = { gen_helper_pand_xmm, gen_helper_pand_xmm }, /* andps, andpd */
+    [0x55] = { gen_helper_pandn_xmm, gen_helper_pandn_xmm }, /* andnps, andnpd */
+    [0x56] = { gen_helper_por_xmm, gen_helper_por_xmm }, /* orps, orpd */
+    [0x57] = { gen_helper_pxor_xmm, gen_helper_pxor_xmm }, /* xorps, xorpd */
+    [0x58] = SSE_FOP(add),
+    [0x59] = SSE_FOP(mul),
+    [0x5a] = { gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
+               gen_helper_cvtss2sd, gen_helper_cvtsd2ss },
+    [0x5b] = { gen_helper_cvtdq2ps, gen_helper_cvtps2dq, gen_helper_cvttps2dq },
+    [0x5c] = SSE_FOP(sub),
+    [0x5d] = SSE_FOP(min),
+    [0x5e] = SSE_FOP(div),
+    [0x5f] = SSE_FOP(max),
+
+    [0xc2] = SSE_FOP(cmpeq),
+    [0xc6] = { (SSEFunc_0_epp)gen_helper_shufps,
+               (SSEFunc_0_epp)gen_helper_shufpd }, /* XXX: casts */
+
+    /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
+    [0x38] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
+    [0x3a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
+
+    /* MMX ops and their SSE extensions */
+    [0x60] = MMX_OP2(punpcklbw),
+    [0x61] = MMX_OP2(punpcklwd),
+    [0x62] = MMX_OP2(punpckldq),
+    [0x63] = MMX_OP2(packsswb),
+    [0x64] = MMX_OP2(pcmpgtb),
+    [0x65] = MMX_OP2(pcmpgtw),
+    [0x66] = MMX_OP2(pcmpgtl),
+    [0x67] = MMX_OP2(packuswb),
+    [0x68] = MMX_OP2(punpckhbw),
+    [0x69] = MMX_OP2(punpckhwd),
+    [0x6a] = MMX_OP2(punpckhdq),
+    [0x6b] = MMX_OP2(packssdw),
+    [0x6c] = { NULL, gen_helper_punpcklqdq_xmm },
+    [0x6d] = { NULL, gen_helper_punpckhqdq_xmm },
+    [0x6e] = { SSE_SPECIAL, SSE_SPECIAL }, /* movd mm, ea */
+    [0x6f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, , movqdu */
+    [0x70] = { (SSEFunc_0_epp)gen_helper_pshufw_mmx,
+               (SSEFunc_0_epp)gen_helper_pshufd_xmm,
+               (SSEFunc_0_epp)gen_helper_pshufhw_xmm,
+               (SSEFunc_0_epp)gen_helper_pshuflw_xmm }, /* XXX: casts */
+    [0x71] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftw */
+    [0x72] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftd */
+    [0x73] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftq */
+    [0x74] = MMX_OP2(pcmpeqb),
+    [0x75] = MMX_OP2(pcmpeqw),
+    [0x76] = MMX_OP2(pcmpeql),
+    [0x77] = { SSE_DUMMY }, /* emms */
+    [0x78] = { NULL, SSE_SPECIAL, NULL, SSE_SPECIAL }, /* extrq_i, insertq_i */
+    [0x79] = { NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r },
+    [0x7c] = { NULL, gen_helper_haddpd, NULL, gen_helper_haddps },
+    [0x7d] = { NULL, gen_helper_hsubpd, NULL, gen_helper_hsubps },
+    [0x7e] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movd, movd, , movq */
+    [0x7f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, movdqu */
+    [0xc4] = { SSE_SPECIAL, SSE_SPECIAL }, /* pinsrw */
+    [0xc5] = { SSE_SPECIAL, SSE_SPECIAL }, /* pextrw */
+    [0xd0] = { NULL, gen_helper_addsubpd, NULL, gen_helper_addsubps },
+    [0xd1] = MMX_OP2(psrlw),
+    [0xd2] = MMX_OP2(psrld),
+    [0xd3] = MMX_OP2(psrlq),
+    [0xd4] = MMX_OP2(paddq),
+    [0xd5] = MMX_OP2(pmullw),
+    [0xd6] = { NULL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
+    [0xd7] = { SSE_SPECIAL, SSE_SPECIAL }, /* pmovmskb */
+    [0xd8] = MMX_OP2(psubusb),
+    [0xd9] = MMX_OP2(psubusw),
+    [0xda] = MMX_OP2(pminub),
+    [0xdb] = MMX_OP2(pand),
+    [0xdc] = MMX_OP2(paddusb),
+    [0xdd] = MMX_OP2(paddusw),
+    [0xde] = MMX_OP2(pmaxub),
+    [0xdf] = MMX_OP2(pandn),
+    [0xe0] = MMX_OP2(pavgb),
+    [0xe1] = MMX_OP2(psraw),
+    [0xe2] = MMX_OP2(psrad),
+    [0xe3] = MMX_OP2(pavgw),
+    [0xe4] = MMX_OP2(pmulhuw),
+    [0xe5] = MMX_OP2(pmulhw),
+    [0xe6] = { NULL, gen_helper_cvttpd2dq, gen_helper_cvtdq2pd, gen_helper_cvtpd2dq },
+    [0xe7] = { SSE_SPECIAL , SSE_SPECIAL },  /* movntq, movntq */
+    [0xe8] = MMX_OP2(psubsb),
+    [0xe9] = MMX_OP2(psubsw),
+    [0xea] = MMX_OP2(pminsw),
+    [0xeb] = MMX_OP2(por),
+    [0xec] = MMX_OP2(paddsb),
+    [0xed] = MMX_OP2(paddsw),
+    [0xee] = MMX_OP2(pmaxsw),
+    [0xef] = MMX_OP2(pxor),
+    [0xf0] = { NULL, NULL, NULL, SSE_SPECIAL }, /* lddqu */
+    [0xf1] = MMX_OP2(psllw),
+    [0xf2] = MMX_OP2(pslld),
+    [0xf3] = MMX_OP2(psllq),
+    [0xf4] = MMX_OP2(pmuludq),
+    [0xf5] = MMX_OP2(pmaddwd),
+    [0xf6] = MMX_OP2(psadbw),
+    [0xf7] = { (SSEFunc_0_epp)gen_helper_maskmov_mmx,
+               (SSEFunc_0_epp)gen_helper_maskmov_xmm }, /* XXX: casts */
+    [0xf8] = MMX_OP2(psubb),
+    [0xf9] = MMX_OP2(psubw),
+    [0xfa] = MMX_OP2(psubl),
+    [0xfb] = MMX_OP2(psubq),
+    [0xfc] = MMX_OP2(paddb),
+    [0xfd] = MMX_OP2(paddw),
+    [0xfe] = MMX_OP2(paddl),
+};
+
+static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
+    [0 + 2] = MMX_OP2(psrlw),
+    [0 + 4] = MMX_OP2(psraw),
+    [0 + 6] = MMX_OP2(psllw),
+    [8 + 2] = MMX_OP2(psrld),
+    [8 + 4] = MMX_OP2(psrad),
+    [8 + 6] = MMX_OP2(pslld),
+    [16 + 2] = MMX_OP2(psrlq),
+    [16 + 3] = { NULL, gen_helper_psrldq_xmm },
+    [16 + 6] = MMX_OP2(psllq),
+    [16 + 7] = { NULL, gen_helper_pslldq_xmm },
+};
+
+static const SSEFunc_0_epi sse_op_table3ai[] = {
+    gen_helper_cvtsi2ss,
+    gen_helper_cvtsi2sd
+};
+
+#ifdef TARGET_X86_64
+static const SSEFunc_0_epl sse_op_table3aq[] = {
+    gen_helper_cvtsq2ss,
+    gen_helper_cvtsq2sd
+};
+#endif
+
+static const SSEFunc_i_ep sse_op_table3bi[] = {
+    gen_helper_cvttss2si,
+    gen_helper_cvtss2si,
+    gen_helper_cvttsd2si,
+    gen_helper_cvtsd2si
+};
+
+#ifdef TARGET_X86_64
+static const SSEFunc_l_ep sse_op_table3bq[] = {
+    gen_helper_cvttss2sq,
+    gen_helper_cvtss2sq,
+    gen_helper_cvttsd2sq,
+    gen_helper_cvtsd2sq
+};
+#endif
+
+static const SSEFunc_0_epp sse_op_table4[8][4] = {
+    SSE_FOP(cmpeq),
+    SSE_FOP(cmplt),
+    SSE_FOP(cmple),
+    SSE_FOP(cmpunord),
+    SSE_FOP(cmpneq),
+    SSE_FOP(cmpnlt),
+    SSE_FOP(cmpnle),
+    SSE_FOP(cmpord),
+};
+
+static const SSEFunc_0_epp sse_op_table5[256] = {
+    [0x0c] = gen_helper_pi2fw,
+    [0x0d] = gen_helper_pi2fd,
+    [0x1c] = gen_helper_pf2iw,
+    [0x1d] = gen_helper_pf2id,
+    [0x8a] = gen_helper_pfnacc,
+    [0x8e] = gen_helper_pfpnacc,
+    [0x90] = gen_helper_pfcmpge,
+    [0x94] = gen_helper_pfmin,
+    [0x96] = gen_helper_pfrcp,
+    [0x97] = gen_helper_pfrsqrt,
+    [0x9a] = gen_helper_pfsub,
+    [0x9e] = gen_helper_pfadd,
+    [0xa0] = gen_helper_pfcmpgt,
+    [0xa4] = gen_helper_pfmax,
+    [0xa6] = gen_helper_movq, /* pfrcpit1; no need to actually increase precision */
+    [0xa7] = gen_helper_movq, /* pfrsqit1 */
+    [0xaa] = gen_helper_pfsubr,
+    [0xae] = gen_helper_pfacc,
+    [0xb0] = gen_helper_pfcmpeq,
+    [0xb4] = gen_helper_pfmul,
+    [0xb6] = gen_helper_movq, /* pfrcpit2 */
+    [0xb7] = gen_helper_pmulhrw_mmx,
+    [0xbb] = gen_helper_pswapd,
+    [0xbf] = gen_helper_pavgb_mmx /* pavgusb */
+};
+
+struct SSEOpHelper_epp {
+    SSEFunc_0_epp op[2];
+    uint32_t ext_mask;
+};
+
+struct SSEOpHelper_eppi {
+    SSEFunc_0_eppi op[2];
+    uint32_t ext_mask;
+};
+
+#define SSSE3_OP(x) { MMX_OP2(x), CPUID_EXT_SSSE3 }
+#define SSE41_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE41 }
+#define SSE42_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE42 }
+#define SSE41_SPECIAL { { NULL, SSE_SPECIAL }, CPUID_EXT_SSE41 }
+#define PCLMULQDQ_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, \
+        CPUID_EXT_PCLMULQDQ }
+#define AESNI_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_AES }
+
+static const struct SSEOpHelper_epp sse_op_table6[256] = {
+    [0x00] = SSSE3_OP(pshufb),
+    [0x01] = SSSE3_OP(phaddw),
+    [0x02] = SSSE3_OP(phaddd),
+    [0x03] = SSSE3_OP(phaddsw),
+    [0x04] = SSSE3_OP(pmaddubsw),
+    [0x05] = SSSE3_OP(phsubw),
+    [0x06] = SSSE3_OP(phsubd),
+    [0x07] = SSSE3_OP(phsubsw),
+    [0x08] = SSSE3_OP(psignb),
+    [0x09] = SSSE3_OP(psignw),
+    [0x0a] = SSSE3_OP(psignd),
+    [0x0b] = SSSE3_OP(pmulhrsw),
+    [0x10] = SSE41_OP(pblendvb),
+    [0x14] = SSE41_OP(blendvps),
+    [0x15] = SSE41_OP(blendvpd),
+    [0x17] = SSE41_OP(ptest),
+    [0x1c] = SSSE3_OP(pabsb),
+    [0x1d] = SSSE3_OP(pabsw),
+    [0x1e] = SSSE3_OP(pabsd),
+    [0x20] = SSE41_OP(pmovsxbw),
+    [0x21] = SSE41_OP(pmovsxbd),
+    [0x22] = SSE41_OP(pmovsxbq),
+    [0x23] = SSE41_OP(pmovsxwd),
+    [0x24] = SSE41_OP(pmovsxwq),
+    [0x25] = SSE41_OP(pmovsxdq),
+    [0x28] = SSE41_OP(pmuldq),
+    [0x29] = SSE41_OP(pcmpeqq),
+    [0x2a] = SSE41_SPECIAL, /* movntqda */
+    [0x2b] = SSE41_OP(packusdw),
+    [0x30] = SSE41_OP(pmovzxbw),
+    [0x31] = SSE41_OP(pmovzxbd),
+    [0x32] = SSE41_OP(pmovzxbq),
+    [0x33] = SSE41_OP(pmovzxwd),
+    [0x34] = SSE41_OP(pmovzxwq),
+    [0x35] = SSE41_OP(pmovzxdq),
+    [0x37] = SSE42_OP(pcmpgtq),
+    [0x38] = SSE41_OP(pminsb),
+    [0x39] = SSE41_OP(pminsd),
+    [0x3a] = SSE41_OP(pminuw),
+    [0x3b] = SSE41_OP(pminud),
+    [0x3c] = SSE41_OP(pmaxsb),
+    [0x3d] = SSE41_OP(pmaxsd),
+    [0x3e] = SSE41_OP(pmaxuw),
+    [0x3f] = SSE41_OP(pmaxud),
+    [0x40] = SSE41_OP(pmulld),
+    [0x41] = SSE41_OP(phminposuw),
+    [0xdb] = AESNI_OP(aesimc),
+    [0xdc] = AESNI_OP(aesenc),
+    [0xdd] = AESNI_OP(aesenclast),
+    [0xde] = AESNI_OP(aesdec),
+    [0xdf] = AESNI_OP(aesdeclast),
+};
+
+static const struct SSEOpHelper_eppi sse_op_table7[256] = {
+    [0x08] = SSE41_OP(roundps),
+    [0x09] = SSE41_OP(roundpd),
+    [0x0a] = SSE41_OP(roundss),
+    [0x0b] = SSE41_OP(roundsd),
+    [0x0c] = SSE41_OP(blendps),
+    [0x0d] = SSE41_OP(blendpd),
+    [0x0e] = SSE41_OP(pblendw),
+    [0x0f] = SSSE3_OP(palignr),
+    [0x14] = SSE41_SPECIAL, /* pextrb */
+    [0x15] = SSE41_SPECIAL, /* pextrw */
+    [0x16] = SSE41_SPECIAL, /* pextrd/pextrq */
+    [0x17] = SSE41_SPECIAL, /* extractps */
+    [0x20] = SSE41_SPECIAL, /* pinsrb */
+    [0x21] = SSE41_SPECIAL, /* insertps */
+    [0x22] = SSE41_SPECIAL, /* pinsrd/pinsrq */
+    [0x40] = SSE41_OP(dpps),
+    [0x41] = SSE41_OP(dppd),
+    [0x42] = SSE41_OP(mpsadbw),
+    [0x44] = PCLMULQDQ_OP(pclmulqdq),
+    [0x60] = SSE42_OP(pcmpestrm),
+    [0x61] = SSE42_OP(pcmpestri),
+    [0x62] = SSE42_OP(pcmpistrm),
+    [0x63] = SSE42_OP(pcmpistri),
+    [0xdf] = AESNI_OP(aeskeygenassist),
+};
+
+static void gen_sse(CPUX86State *env, DisasContext *s, int b,
+                    target_ulong pc_start)
+{
+    int b1, op1_offset, op2_offset, is_xmm, val;
+    int modrm, mod, rm, reg;
+    SSEFunc_0_epp sse_fn_epp;
+    SSEFunc_0_eppi sse_fn_eppi;
+    SSEFunc_0_ppi sse_fn_ppi;
+    SSEFunc_0_eppt sse_fn_eppt;
+    MemOp ot;
+
+    b &= 0xff;
+    if (s->prefix & PREFIX_DATA)
+        b1 = 1;
+    else if (s->prefix & PREFIX_REPZ)
+        b1 = 2;
+    else if (s->prefix & PREFIX_REPNZ)
+        b1 = 3;
+    else
+        b1 = 0;
+    sse_fn_epp = sse_op_table1[b][b1];
+    if (!sse_fn_epp) {
+        goto unknown_op;
+    }
+    if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
+        is_xmm = 1;
+    } else {
+        if (b1 == 0) {
+            /* MMX case */
+            is_xmm = 0;
+        } else {
+            is_xmm = 1;
+        }
+    }
+    /* simple MMX/SSE operation */
+    if (s->flags & HF_TS_MASK) {
+        gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+        return;
+    }
+    if (s->flags & HF_EM_MASK) {
+    illegal_op:
+        gen_illegal_opcode(s);
+        return;
+    }
+    if (is_xmm
+        && !(s->flags & HF_OSFXSR_MASK)
+        && (b != 0x38 && b != 0x3a)) {
+        goto unknown_op;
ptimize by storing fptt and fptags in
+       the static cpu state) */
+    if (!is_xmm) {
+        gen_helper_enter_mmx(cpu_env);
+    }
+
+    modrm = x86_ldub_code(env, s);
+    reg = ((modrm >> 3) & 7);
+    if (is_xmm) {
+        reg |= REX_R(s);
+    }
+    mod = (modrm >> 6) & 3;
+    if (sse_fn_epp == SSE_SPECIAL) {
+        b |= (b1 << 8);
+        switch(b) {
+        case 0x0e7: /* movntq */
+            if (mod == 3) {
+                goto illegal_op;
+            }
+            gen_lea_modrm(env, s, modrm);
+            gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
+            break;
+        case 0x1e7: /* movntdq */
+        case 0x02b: /* movntps */
+        case 0x12b: /* movntps */
+            if (mod == 3)
+                goto illegal_op;
+            gen_lea_modrm(env, s, modrm);
+            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            break;
+        case 0x3f0: /* lddqu */
+            if (mod == 3)
+                goto illegal_op;
+            gen_lea_modrm(env, s, modrm);
+            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            break;
+        case 0x22b: /* movntss */
+        case 0x32b: /* movntsd */
+            if (mod == 3)
+                goto illegal_op;
+            gen_lea_modrm(env, s, modrm);
+            if (b1 & 1) {
+                gen_stq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+            } else {
+                tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
+                    xmm_regs[reg].ZMM_L(0)));
+                gen_op_st_v(s, MO_32, s->T0, s->A0);
+            }
+            break;
+        case 0x6e: /* movd mm, ea */
+#ifdef TARGET_X86_64
+            if (s->dflag == MO_64) {
+                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
+                tcg_gen_st_tl(s->T0, cpu_env,
+                              offsetof(CPUX86State, fpregs[reg].mmx));
+            } else
+#endif
+            {
+                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                                 offsetof(CPUX86State,fpregs[reg].mmx));
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                gen_helper_movl_mm_T0_mmx(s->ptr0, s->tmp2_i32);
+            }
+            break;
+        case 0x16e: /* movd xmm, ea */
+#ifdef TARGET_X86_64
+            if (s->dflag == MO_64) {
+                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                                 offsetof(CPUX86State,xmm_regs[reg]));
+                gen_helper_movq_mm_T0_xmm(s->ptr0, s->T0);
+            } else
+#endif
+            {
+                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                                 offsetof(CPUX86State,xmm_regs[reg]));
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                gen_helper_movl_mm_T0_xmm(s->ptr0, s->tmp2_i32);
+            }
+            break;
+        case 0x6f: /* movq mm, ea */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
+            } else {
+                rm = (modrm & 7);
+                tcg_gen_ld_i64(s->tmp1_i64, cpu_env,
+                               offsetof(CPUX86State,fpregs[rm].mmx));
+                tcg_gen_st_i64(s->tmp1_i64, cpu_env,
+                               offsetof(CPUX86State,fpregs[reg].mmx));
+            }
+            break;
+        case 0x010: /* movups */
+        case 0x110: /* movupd */
+        case 0x028: /* movaps */
+        case 0x128: /* movapd */
+        case 0x16f: /* movdqa xmm, ea */
+        case 0x26f: /* movdqu xmm, ea */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
+                            offsetof(CPUX86State,xmm_regs[rm]));
+            }
+            break;
+        case 0x210: /* movss xmm, ea */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_op_ld_v(s, MO_32, s->T0, s->A0);
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
+                tcg_gen_movi_tl(s->T0, 0);
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)));
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
+            }
+            break;
+        case 0x310: /* movsd xmm, ea */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+                tcg_gen_movi_tl(s->T0, 0);
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+            }
+            break;
+        case 0x012: /* movlps */
+        case 0x112: /* movlpd */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+            } else {
+                /* movhlps */
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(1)));
+            }
+            break;
+        case 0x212: /* movsldup */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(2)));
+            }
+            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
+                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
+            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
+                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(2)));
+            break;
+        case 0x312: /* movddup */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+            }
+            gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                        offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+            break;
+        case 0x016: /* movhps */
+        case 0x116: /* movhpd */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(1)));
+            } else {
+                /* movlhps */
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+            }
+            break;
+        case 0x216: /* movshdup */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(1)));
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(3)));
+            }
+            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
+                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(1)));
+            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
+                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(3)));
+            break;
+        case 0x178:
+        case 0x378:
+            {
+                int bit_index, field_length;
+
+                if (b1 == 1 && reg != 0)
+                    goto illegal_op;
+                field_length = x86_ldub_code(env, s) & 0x3F;
+                bit_index = x86_ldub_code(env, s) & 0x3F;
+                tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                    offsetof(CPUX86State,xmm_regs[reg]));
+                if (b1 == 1)
+                    gen_helper_extrq_i(cpu_env, s->ptr0,
+                                       tcg_const_i32(bit_index),
+                                       tcg_const_i32(field_length));
+                else
+                    gen_helper_insertq_i(cpu_env, s->ptr0,
+                                         tcg_const_i32(bit_index),
+                                         tcg_const_i32(field_length));
+            }
+            break;
+        case 0x7e: /* movd ea, mm */
+#ifdef TARGET_X86_64
+            if (s->dflag == MO_64) {
+                tcg_gen_ld_i64(s->T0, cpu_env,
+                               offsetof(CPUX86State,fpregs[reg].mmx));
+                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 1);
+            } else
+#endif
+            {
+                tcg_gen_ld32u_tl(s->T0, cpu_env,
+                                 offsetof(CPUX86State,fpregs[reg].mmx.MMX_L(0)));
+                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
+            }
+            break;
+        case 0x17e: /* movd ea, xmm */
+#ifdef TARGET_X86_64
+            if (s->dflag == MO_64) {
+                tcg_gen_ld_i64(s->T0, cpu_env,
+                               offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 1);
+            } else
+#endif
+            {
+                tcg_gen_ld32u_tl(s->T0, cpu_env,
+                                 offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
+                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
+            }
+            break;
+        case 0x27e: /* movq xmm, ea */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_ldq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+            }
+            gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
+            break;
+        case 0x7f: /* movq ea, mm */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
+            } else {
+                rm = (modrm & 7);
+                gen_op_movq(s, offsetof(CPUX86State, fpregs[rm].mmx),
+                            offsetof(CPUX86State,fpregs[reg].mmx));
+            }
+            break;
+        case 0x011: /* movups */
+        case 0x111: /* movupd */
+        case 0x029: /* movaps */
+        case 0x129: /* movapd */
+        case 0x17f: /* movdqa ea, xmm */
+        case 0x27f: /* movdqu ea, xmm */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
+                            offsetof(CPUX86State,xmm_regs[reg]));
+            }
+            break;
+        case 0x211: /* movss ea, xmm */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                tcg_gen_ld32u_tl(s->T0, cpu_env,
+                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
+                gen_op_st_v(s, MO_32, s->T0, s->A0);
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
+                            offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
+            }
+            break;
+        case 0x311: /* movsd ea, xmm */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_stq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+            }
+            break;
+        case 0x013: /* movlps */
+        case 0x113: /* movlpd */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_stq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+            } else {
+                goto illegal_op;
+            }
+            break;
+        case 0x017: /* movhps */
+        case 0x117: /* movhpd */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_stq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(1)));
+            } else {
+                goto illegal_op;
+            }
+            break;
+        case 0x71: /* shift mm, im */
+        case 0x72:
+        case 0x73:
+        case 0x171: /* shift xmm, im */
+        case 0x172:
+        case 0x173:
+            val = x86_ldub_code(env, s);
+            if (is_xmm) {
+                tcg_gen_movi_tl(s->T0, val);
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
+                tcg_gen_movi_tl(s->T0, 0);
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, xmm_t0.ZMM_L(1)));
+                op1_offset = offsetof(CPUX86State,xmm_t0);
+            } else {
+                tcg_gen_movi_tl(s->T0, val);
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, mmx_t0.MMX_L(0)));
+                tcg_gen_movi_tl(s->T0, 0);
+                tcg_gen_st32_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State, mmx_t0.MMX_L(1(modrm & 7) | REX_B(s);
+                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+            } else {
+                rm = (modrm & 7);
+                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+            }
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op1_offset);
+            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            break;
+        case 0x050: /* movmskps */
+            rm = (modrm & 7) | REX_B(s);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                             offsetof(CPUX86State,xmm_regs[rm]));
+            gen_helper_movmskps(s->tmp2_i32, cpu_env, s->ptr0);
+            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
+            break;
+        case 0x150: /* movmskpd */
+            rm = (modrm & 7) | REX_B(s);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                             offsetof(CPUX86State,xmm_regs[rm]));
+            gen_helper_movmskpd(s->tmp2_i32, cpu_env, s->ptr0);
+            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
+            break;
+        case 0x02a: /* cvtpi2ps */
+        case 0x12a: /* cvtpi2pd */
+            gen_helper_enter_mmx(cpu_env);
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                op2_offset = offsetof(CPUX86State,mmx_t0);
+                gen_ldq_env_A0(s, op2_offset);
+            } else {
+                rm = (modrm & 7);
+                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+            }
+            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            switch(b >> 8) {
+            case 0x0:
+                gen_helper_cvtpi2ps(cpu_env, s->ptr0, s->ptr1);
+                break;
+            default:
+            case 0x1:
+                gen_helper_cvtpi2pd(cpu_env, s->ptr0, s->ptr1);
+                break;
+            }
+            break;
+        case 0x22a: /* cvtsi2ss */
+        case 0x32a: /* cvtsi2sd */
+            ot = mo_64_32(s->dflag);
+            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            if (ot == MO_32) {
+                SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                sse_fn_epi(cpu_env, s->ptr0, s->tmp2_i32);
+            } else {
+#ifdef TARGET_X86_64
+                SSEFunc_0_epl sse_fn_epl = sse_op_table3aq[(b >> 8) & 1];
+                sse_fn_epl(cpu_env, s->ptr0, s->T0);
+#else
+                goto illegal_op;
+#endif
+            }
+            break;
+        case 0x02c: /* cvttps2pi */
+        case 0x12c: /* cvttpd2pi */
+        case 0x02d: /* cvtps2pi */
+        case 0x12d: /* cvtpd2pi */
+            gen_helper_enter_mmx(cpu_env);
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                op2_offset = offsetof(CPUX86State,xmm_t0);
+                gen_ldo_env_A0(s, op2_offset);
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+            }
+            op1_offset = offsetof(CPUX86State,fpregs[reg & 7].mmx);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            switch(b) {
+            case 0x02c:
+                gen_helper_cvttps2pi(cpu_env, s->ptr0, s->ptr1);
+                break;
+            case 0x12c:
+                gen_helper_cvttpd2pi(cpu_env, s->ptr0, s->ptr1);
+                break;
+            case 0x02d:
+                gen_helper_cvtps2pi(cpu_env, s->ptr0, s->ptr1);
+                break;
+            case 0x12d:
+                gen_helper_cvtpd2pi(cpu_env, s->ptr0, s->ptr1);
+                break;
+            }
+            break;
+        case 0x22c: /* cvttss2si */
+        case 0x32c: /* cvttsd2si */
+        case 0x22d: /* cvtss2si */
+        case 0x32d: /* cvtsd2si */
+            ot = mo_64_32(s->dflag);
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                if ((b >> 8) & 1) {
+                    gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_Q(0)));
+                } else {
+                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
+                    tcg_gen_st32_tl(s->T0, cpu_env,
+                                    offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
+                }
+                op2_offset = offsetof(CPUX86State,xmm_t0);
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+            }
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
+            if (ot == MO_32) {
+                SSEFunc_i_ep sse_fn_i_ep =
+                    sse_op_table3bi[((b >> 7) & 2) | (b & 1)];
+                sse_fn_i_ep(s->tmp2_i32, cpu_env, s->ptr0);
+                tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+            } else {
+#ifdef TARGET_X86_64
+                SSEFunc_l_ep sse_fn_l_ep =
+                    sse_op_table3bq[((b >> 7) & 2) | (b & 1)];
+                sse_fn_l_ep(s->T0, cpu_env, s->ptr0);
+#else
+                goto illegal_op;
+#endif
+            }
+            gen_op_mov_reg_v(s, ot, reg, s->T0);
+            break;
+        case 0xc4: /* pinsrw */
+        case 0x1c4:
+            s->rip_offset = 1;
+            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            val = x86_ldub_code(env, s);
+            if (b1) {
+                val &= 7;
+                tcg_gen_st16_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State,xmm_regs[reg].ZMM_W(val)));
+            } else {
+                val &= 3;
+                tcg_gen_st16_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
+            }
+            break;
+        case 0xc5: /* pextrw */
+        case 0x1c5:
+            if (mod != 3)
+                goto illegal_op;
+            ot = mo_64_32(s->dflag);
+            val = x86_ldub_code(env, s);
+            if (b1) {
+                val &= 7;
+                rm = (modrm & 7) | REX_B(s);
+                tcg_gen_ld16u_tl(s->T0, cpu_env,
+                                 offsetof(CPUX86State,xmm_regs[rm].ZMM_W(val)));
+            } else {
+                val &= 3;
+                rm = (modrm & 7);
+                tcg_gen_ld16u_tl(s->T0, cpu_env,
+                                offsetof(CPUX86State,fpregs[rm].mmx.MMX_W(val)));
+            }
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            gen_op_mov_reg_v(s, ot, reg, s->T0);
+            break;
+        case 0x1d6: /* movq ea, xmm */
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_stq_env_A0(s, offsetof(CPUX86State,
+                                           xmm_regs[reg].ZMM_Q(0)));
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
+                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
+                gen_op_movq_env_0(s,
+                                  offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(1)));
+            }
+            break;
+        case 0x2d6: /* movq2dq */
+            gen_helper_enter_mmx(cpu_env);
+            rm = (modrm & 7);
+            gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
+                        offsetof(CPUX86State,fpregs[rm].mmx));
+            gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
+            break;
+        case 0x3d6: /* movdq2q */
+            gen_helper_enter_mmx(cpu_env);
+            rm = (modrm & 7) | REX_B(s);
+            gen_op_movq(s, offsetof(CPUX86State, fpregs[reg & 7].mmx),
+                        offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+            break;
+        case 0xd7: /* pmovmskb */
+        case 0x1d7:
+            if (mod != 3)
+                goto illegal_op;
+            if (b1) {
+                rm = (modrm & 7) | REX_B(s);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                                 offsetof(CPUX86State, xmm_regs[rm]));
+                gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
+            } else {
+                rm = (modrm & 7);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env,
+                                 offsetof(CPUX86State, fpregs[rm].mmx));
+                gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, s->ptr0);
+            }
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
+            break;
+
+        case 0x138:
+        case 0x038:
+            b = modrm;
+            if ((b & 0xf0) == 0xf0) {
+                goto do_0f_38_fx;
+            }
+            modrm = x86_ldub_code(env, s);
+            rm = modrm & 7;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            mod = (modrm >> 6) & 3;
+
+            assert(b1 < 2);
+            sse_fn_epp = sse_op_table6[b].op[b1];
+            if (!sse_fn_epp) {
+                goto unknown_op;
+            }
+            if (!(s->cpuid_ext_features & sse_op_table6[b].ext_mask))
+                goto illegal_op;
+
+            if (b1) {
+                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+                if (mod == 3) {
+                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
+                } else {
+                    op2_offset = offsetof(CPUX86State,xmm_t0);
+                    gen_lea_modrm(env, s, modrm);
+                    switch (b) {
+                    case 0x20: case 0x30: /* pmovsxbw, pmovzxbw */
+                    case 0x23: case 0x33: /* pmovsxwd, pmovzxwd */
+                    case 0x25: case 0x35: /* pmovsxdq, pmovzxdq */
+                        gen_ldq_env_A0(s, op2_offset +
+                                        offsetof(ZMMReg, ZMM_Q(0)));
+                        break;
+                    case 0x21: case 0x31: /* pmovsxbd, pmovzxbd */
+                    case 0x24: case 0x34: /* pmovsxwq, pmovzxwq */
+                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                            s->mem_index, MO_LEUL);
+                        tcg_gen_st_i32(s->tmp2_i32, cpu_env, op2_offset +
+                                        offsetof(ZMMReg, ZMM_L(0)));
+                        break;
+                    case 0x22: case 0x32: /* pmovsxbq, pmovzxbq */
+                        tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
+                                           s->mem_index, MO_LEUW);
+                        tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
+                                        offsetof(ZMMReg, ZMM_W(0)));
+                        break;
+                    case 0x2a:            /* movntqda */
+                        gen_ldo_env_A0(s, op1_offset);
+                        return;
+                    default:
+                        gen_ldo_env_A0(s, op2_offset);
+                    }
+                }
+            } else {
+                op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
+                if (mod == 3) {
+                    op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+                } else {
+                    op2_offset = offsetof(CPUX86State,mmx_t0);
+                    gen_lea_modrm(env, s, modrm);
+                    gen_ldq_env_A0(s, op2_offset);
+                }
+            }
+            if (sse_fn_epp == SSE_SPECIAL) {
+                goto unknown_op;
+            }
+
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+
+            if (b == 0x17) {
+                set_cc_op(s, CC_OP_EFLAGS);
+            }
+            break;
+
+        case 0x238:
+        case 0x338:
+        do_0f_38_fx:
+            /* Various integer extensions at 0f 38 f[0-f].  */
+            b = modrm | (b1 << 8);
+            modrm = x86_ldub_code(env, s);
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+
+            switch (b) {
+            case 0x3f0: /* crc32 Gd,Eb */
+            case 0x3f1: /* crc32 Gd,Ey */
+            do_crc32:
+                if (!(s->cpuid_ext_features & CPUID_EXT_SSE42)) {
+                    goto illegal_op;
+                }
+                if ((b & 0xff) == 0xf0) {
+                    ot = MO_8;
+                } else if (s->dflag != MO_64) {
+                    ot = (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
+                } else {
+                    ot = MO_64;
+                }
+
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[reg]);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                gen_helper_crc32(s->T0, s->tmp2_i32,
+                                 s->T0, tcg_const_i32(8 << ot));
+
+                ot = mo_64_32(s->dflag);
+                gen_op_mov_reg_v(s, ot, reg, s->T0);
+                break;
+
+            case 0x1f0: /* crc32 or movbe */
+            case 0x1f1:
+                /* For these insns, the f3 prefix is supposed to have priority
+                   over the 66 prefix, but that's not what we implement above
+                   setting b1.  */
+                if (s->prefix & PREFIX_REPNZ) {
+                    goto do_crc32;
+                }
+                /* FALLTHRU */
+            case 0x0f0: /* movbe Gy,My */
+            case 0x0f1: /* movbe My,Gy */
+                if (!(s->cpuid_ext_features & CPUID_EXT_MOVBE)) {
+                    goto illegal_op;
+                }
+                if (s->dflag != MO_64) {
+                    ot = (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
+                } else {
+                    ot = MO_64;
+                }
+
+                gen_lea_modrm(env, s, modrm);
+                if ((b & 1) == 0) {
+                    tcg_gen_qemu_ld_tl(s->T0, s->A0,
+                                       s->mem_index, ot | MO_BE);
+                    gen_op_mov_reg_v(s, ot, reg, s->T0);
+                } else {
+                    tcg_gen_qemu_st_tl(cpu_regs[reg], s->A0,
+                                       s->mem_index, ot | MO_BE);
+                }
+                break;
+
+            case 0x0f2: /* andn Gy, By, Ey */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                tcg_gen_andc_tl(s->T0, s->T0, cpu_regs[s->vex_v]);
+                gen_op_mov_reg_v(s, ot, reg, s->T0);
+                gen_op_update1_cc(s);
+                set_cc_op(s, CC_OP_LOGICB + ot);
+                break;
+
+            case 0x0f7: /* bextr Gy, Ey, By */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                {
+                    TCGv bound, zero;
+
+                    gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                    /* Extract START, and shift the operand.
+                       Shifts larger than operand size get zeros.  */
+                    tcg_gen_ext8u_tl(s->A0, cpu_regs[s->vex_v]);
+                    tcg_gen_shr_tl(s->T0, s->T0, s->A0);
+
+                    bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
+                    zero = tcg_c8);
+                    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound,
+                                       s->A0, bound);
+                    tcg_temp_free(bound);
+                    tcg_gen_movi_tl(s->T1, 1);
+                    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
+                    tcg_gen_subi_tl(s->T1, s->T1, 1);
+                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+
+                    gen_op_mov_reg_v(s, ot, reg, s->T0);
+                    gen_op_update1_cc(s);
+                    set_cc_op(s, CC_OP_LOGICB + ot);
+                }
+                break;
+
+            case 0x0f5: /* bzhi Gy, Ey, By */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
+                {
+                    TCGv bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
+                    /* Note that since we're using BMILG (in order to get O
+                       cleared) we need to store the inverse into C.  */
+                    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src,
+                                       s->T1, bound);
+                    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1,
+                                       bound, bound, s->T1);
+                    tcg_temp_free(bound);
+                }
+                tcg_gen_movi_tl(s->A0, -1);
+                tcg_gen_shl_tl(s->A0, s->A0, s->T1);
+                tcg_gen_andc_tl(s->T0, s->T0, s->A0);
+                gen_op_mov_reg_v(s, ot, reg, s->T0);
+                gen_op_update1_cc(s);
+                set_cc_op(s, CC_OP_BMILGB + ot);
+                break;
+
+            case 0x3f6: /* mulx By, Gy, rdx, Ey */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                switch (ot) {
+                default:
+                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                    tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EDX]);
+                    tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
+                                      s->tmp2_i32, s->tmp3_i32);
+                    tcg_gen_extu_i32_tl(cpu_regs[s->vex_v], s->tmp2_i32);
+                    tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp3_i32);
+                    break;
+#ifdef TARGET_X86_64
+                case MO_64:
+                    tcg_gen_mulu2_i64(s->T0, s->T1,
+                                      s->T0, cpu_regs[R_EDX]);
+                    tcg_gen_mov_i64(cpu_regs[s->vex_v], s->T0);
+                    tcg_gen_mov_i64(cpu_regs[reg], s->T1);
+                    break;
+#endif
+                }
+                break;
+
+            case 0x3f5: /* pdep Gy, By, Ey */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                /* Note that by zero-extending the source operand, we
+                   automatically handle zero-extending the result.  */
+                if (ot == MO_64) {
+                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
+                } else {
+                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
+                }
+                gen_helper_pdep(cpu_regs[reg], s->T1, s->T0);
+                break;
+
+            case 0x2f5: /* pext Gy, By, Ey */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                /* Note that by zero-extending the source operand, we
+                   automatically handle zero-extending the result.  */
+                if (ot == MO_64) {
+                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
+                } else {
+                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
+                }
+                gen_helper_pext(cpu_regs[reg], s->T1, s->T0);
+                break;
+
+            case 0x1f6: /* adcx Gy, Ey */
+            case 0x2f6: /* adox Gy, Ey */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX)) {
+                    goto illegal_op;
+                } else {
+                    TCGv carry_in, carry_out, zero;
+                    int end_op;
+
+                    ot = mo_64_32(s->dflag);
+                    gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+
+                    /* Re-use the carry-out from a previous round.  */
+                    carry_in = NULL;
+                    carry_out = (b == 0x1f6 ? cpu_cc_dst : cpu_cc_src2);
+                    switch (s->cc_op) {
+                    case CC_OP_ADCX:
+                        if (b == 0x1f6) {
+                            carry_in = cpu_cc_dst;
+                            end_op = CC_OP_ADCX;
+                        } else {
+                            end_op = CC_OP_ADCOX;
+                        }
+                        break;
+                    case CC_OP_ADOX:
+                        if (b == 0x1f6) {
+                            end_op = CC_OP_ADCOX;
+                        } else {
+                            carry_in = cpu_cc_src2;
+                            end_op = CC_OP_ADOX;
+                        }
+                        break;
+                    case CC_OP_ADCOX:
+                        end_op = CC_OP_ADCOX;
+                        carry_in = carry_out;
+                        break;
+                    default:
+                        end_op = (b == 0x1f6 ? CC_OP_ADCX : CC_OP_ADOX);
+                        break;
+                    }
+                    /* If we can't reuse carry-out, get it out of EFLAGS.  */
+                    if (!carry_in) {
+                        if (s->cc_op != CC_OP_ADCX && s->cc_op != CC_OP_ADOX) {
+                            gen_compute_eflags(s);
+                        }
+                        carry_in = s->tmp0;
+                        tcg_gen_extract_tl(carry_in, cpu_cc_src,
+                                           ctz32(b == 0x1f6 ? CC_C : CC_O), 1);
+                    }
+
+                    switch (ot) {
+#ifdef TARGET_X86_64
+                    case MO_32:
+                        /* If we know TL is 64-bit, and we want a 32-bit
+                           result, just do everything in 64-bit arithmetic.  */
+                        tcg_gen_ext32u_i64(cpu_regs[reg], cpu_regs[reg]);
+                        tcg_gen_ext32u_i64(s->T0, s->T0);
+                        tcg_gen_add_i64(s->T0, s->T0, cpu_regs[reg]);
+                        tcg_gen_add_i64(s->T0, s->T0, carry_in);
+                        tcg_gen_ext32u_i64(cpu_regs[reg], s->T0);
+                        tcg_gen_shri_i64(carry_out, s->T0, 32);
+                        break;
+#endif
+                    default:
+                        /* Otherwise compute the carry-out in two steps.  */
+                        zero = tcg_const_tl(0);
+                        tcg_gen_add2_tl(s->T0, carry_out,
+                                        s->T0, zero,
+                                        carry_in, zero);
+                        tcg_gen_add2_tl(cpu_regs[reg], carry_out,
+                                        cpu_regs[reg], carry_out,
+                                        s->T0, zero);
+                        tcg_temp_free(zero);
+                        break;
+                    }
+                    set_cc_op(s, end_op);
+                }
+                break;
+
+            case 0x1f7: /* shlx Gy, Ey, By */
+            case 0x2f7: /* sarx Gy, Ey, By */
+            case 0x3f7: /* shrx Gy, Ey, By */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                if (ot == MO_64) {
+                    tcg_gen_andi_tl(s->T1, cpu_regs[s->vex_v], 63);
+                } else {
+                    tcg_gen_andi_tl(s->T1, cpu_regs[s->vex_v], 31);
+                }
+                if (b == 0x1f7) {
+                    tcg_gen_shl_tl(s->T0, s->T0, s->T1);
+                } else if (b == 0x2f7) {
+                    if (ot != MO_64) {
+                        tcg_gen_ext32s_tl(s->T0, s->T0);
+                    }
+                    tcg_gen_sar_tl(s->T0, s->T0, s->T1);
+                } else {
+                    if (ot != MO_64) {
+                        tcg_gen_ext32u_tl(s->T0, s->T0);
+                    }
+                    tcg_gen_shr_tl(s->T0, s->T0, s->T1);
+                }
+                gen_op_mov_reg_v(s, ot, reg, s->T0);
+                break;
+
+            case 0x0f3:
+            case 0x1f3:
+            case 0x2f3:
+            case 0x3f3: /* Group 17 */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+
+                tcg_gen_mov_tl(cpu_cc_src, s->T0);
+                switch (reg & 7) {
+                case 1: /* blsr By,Ey */
+                    tcg_gen_subi_tl(s->T1, s->T0, 1);
+                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+                    break;
+                case 2: /* blsmsk By,Ey */
+                    tcg_gen_subi_tl(s->T1, s->T0, 1);
+                    tcg_gen_xor_tl(s->T0, s->T0, s->T1);
+                    break;
+                case 3: /* blsi By, Ey */
+                    tcg_gen_neg_tl(s->T1, s->T0);
+                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
+                    break;
+                default:
+                    goto unknown_op;
+                }
+                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+                gen_op_mov_reg_v(s, ot, s->vex_v, s->T0);
+                set_cc_op(s, CC_OP_BMILGB + ot);
+                break;
+
+            default:
+                goto unknown_op;
+            }
+            break;
+
+        case 0x03a:
+        case 0x13a:
+            b = modrm;
+            modrm = x86_ldub_code(env, s);
+            rm = modrm & 7;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            mod = (modrm >> 6) & 3;
+
+            assert(b1 < 2);
+            sse_fn_eppi = sse_op_table7[b].op[b1];
+            if (!sse_fn_eppi) {
+                goto unknown_op;
+            }
+            if (!(s->cpuid_ext_features & sse_op_table7[b].ext_mask))
+                goto illegal_op;
+
+            s->rip_offset = 1;
+
+            if (sse_fn_eppi == SSE_SPECIAL) {
+                ot = mo_64_32(s->dflag);
+                rm = (modrm & 7) | REX_B(s);
+                if (mod != 3)
+                    gen_lea_modrm(env, s, modrm);
+                reg = ((modrm >> 3) & 7) | REX_R(s);
+                val = x86_ldub_code(env, s);
+                switch (b) {
+                case 0x14: /* pextrb */
+                    tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State,
+                                            xmm_regs[reg].ZMM_B(val & 15)));
+                    if (mod == 3) {
+                        gen_op_mov_reg_v(s, ot, rm, s->T0);
+                    } else {
+                        tcg_gen_qemu_st_tl(s->T0, s->A0,
+                                           s->mem_index, MO_UB);
+                    }
+                    break;
+                case 0x15: /* pextrw */
+                    tcg_gen_ld16u_tl(s->T0, cpu_env, offsetof(CPUX86State,
+                                            xmm_regs[reg].ZMM_W(val & 7)));
+                    if (mod == 3) {
+                        gen_op_mov_reg_v(s, ot, rm, s->T0);
+                    } else {
+                        tcg_gen_qemu_st_tl(s->T0, s->A0,
+                                           s->mem_index, MO_LEUW);
+                    }
+                    break;
+                case 0x16:
+                    if (ot == MO_32) { /* pextrd */
+                        tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                                        offsetof(CPUX86State,
+                                                xmm_regs[reg].ZMM_L(val & 3)));
+                        if (mod == 3) {
+                            tcg_gen_extu_i32_tl(cpu_regs[rm], s->tmp2_i32);
+                        } else {
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                        }
+                    } else { /* pextrq */
+#ifdef TARGET_X86_64
+                        tcg_gen_ld_i64(s->tmp1_i64, cpu_env,
+                                        offsetof(CPUX86State,
+                                                xmm_regs[reg].ZMM_Q(val & 1)));
+                        if (mod == 3) {
+                            tcg_gen_mov_i64(cpu_regs[rm], s->tmp1_i64);
+                        } else {
+                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEUQ);
+                        }
+#else
+                        goto illegal_op;
+#endif
+                    }
+                    break;
+                case 0x17: /* extractps */
+                    tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
+                                            xmm_regs[reg].ZMM_L(val & 3)));
+                    if (mod == 3) {
+                        gen_op_mov_reg_v(s, ot, rm, s->T0);
+                    } else {
+                        tcg_gen_qemu_st_tl(s->T0, s->A0,
+                                           s->mem_index, MO_LEUL);
+                    }
+                    break;
+                case 0x20: /* pinsrb */
+                    if (mod == 3) {
+                        gen_op_mov_v_reg(s, MO_32, s->T0, rm);
+                    } else {
+                        tcg_gen_qemu_ld_tl(s->T0, s->A0,
+                                           s->mem_index, MO_UB);
+                    }
+                    tcg_gen_st8_tl(s->T0, cpu_env, offsetof(CPUX86State,
+                                            xmm_regs[reg].ZMM_B(val & 15)));
+                    break;
+                case 0x21: /* insertps */
+                    if (mod == 3) {
+                        tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                                        offsetof(CPUX86State,xmm_regs[rm]
+                                                .ZMM_L((val >> 6) & 3)));
+                    } else {
+                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                            s->mem_index, MO_LEUL);
+                    }
+                    tcg_gen_st_i32(s->tmp2_i32, cpu_env,
+                                    offsetof(CPUX86State,xmm_regs[reg]
+                                            .ZMM_L((val >> 4) & 3)));
+                    if ((val >> 0) & 1)
+                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/)                          xmm_regs[reg].ZMM_L(1)));
+                    if ((val >> 2) & 1)
+                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
+                                        cpu_env, offsetof(CPUX86State,
+                                                xmm_regs[reg].ZMM_L(2)));
+                    if ((val >> 3) & 1)
+                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
+                                        cpu_env, offsetof(CPUX86State,
+                                                xmm_regs[reg].ZMM_L(3)));
+                    break;
+                case 0x22:
+                    if (ot == MO_32) { /* pinsrd */
+                        if (mod == 3) {
+                            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[rm]);
+                        } else {
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                        }
+                        tcg_gen_st_i32(s->tmp2_i32, cpu_env,
+                                        offsetof(CPUX86State,
+                                                xmm_regs[reg].ZMM_L(val & 3)));
+                    } else { /* pinsrq */
+#ifdef TARGET_X86_64
+                        if (mod == 3) {
+                            gen_op_mov_v_reg(s, ot, s->tmp1_i64, rm);
+                        } else {
+                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEUQ);
+                        }
+                        tcg_gen_st_i64(s->tmp1_i64, cpu_env,
+                                        offsetof(CPUX86State,
+                                                xmm_regs[reg].ZMM_Q(val & 1)));
+#else
+                        goto illegal_op;
+#endif
+                    }
+                    break;
+                }
+                return;
+            }
+
+            if (b1) {
+                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+                if (mod == 3) {
+                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
+                } else {
+                    op2_offset = offsetof(CPUX86State,xmm_t0);
+                    gen_lea_modrm(env, s, modrm);
+                    gen_ldo_env_A0(s, op2_offset);
+                }
+            } else {
+                op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
+                if (mod == 3) {
+                    op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+                } else {
+                    op2_offset = offsetof(CPUX86State,mmx_t0);
+                    gen_lea_modrm(env, s, modrm);
+                    gen_ldq_env_A0(s, op2_offset);
+                }
+            }
+            val = x86_ldub_code(env, s);
+
+            if ((b & 0xfc) == 0x60) { /* pcmpXstrX */
+                set_cc_op(s, CC_OP_EFLAGS);
+
+                if (s->dflag == MO_64) {
+                    /* The helper must use entire 64-bit gp registers */
+                    val |= 1 << 8;
+                }
+            }
+
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            sse_fn_eppi(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            break;
+
+        case 0x33a:
+            /* Various integer extensions at 0f 3a f[0-f].  */
+            b = modrm | (b1 << 8);
+            modrm = x86_ldub_code(env, s);
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+
+            switch (b) {
+            case 0x3f0: /* rorx Gy,Ey, Ib */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
+                    || !(s->prefix & PREFIX_VEX)
+                    || s->vex_l != 0) {
+                    goto illegal_op;
+                }
+                ot = mo_64_32(s->dflag);
+                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+                b = x86_ldub_code(env, s);
+                if (ot == MO_64) {
+                    tcg_gen_rotri_tl(s->T0, s->T0, b & 63);
+                } else {
+                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                    tcg_gen_rotri_i32(s->tmp2_i32, s->tmp2_i32, b & 31);
+                    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+                }
+                gen_op_mov_reg_v(s, ot, reg, s->T0);
+                break;
+
+            default:
+                goto unknown_op;
+            }
+            break;
+
+        default:
+        unknown_op:
+            gen_unknown_opcode(env, s);
+            return;
+        }
+    } else {
+        /* generic MMX or SSE operation */
+        switch(b) {
+        case 0x70: /* pshufx insn */
+        case 0xc6: /* pshufx insn */
+        case 0xc2: /* compare insns */
+            s->rip_offset = 1;
+            break;
+        default:
+            break;
+        }
+        if (is_xmm) {
+            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
+            if (mod != 3) {
+                int sz = 4;
+
+                gen_lea_modrm(env, s, modrm);
+                op2_offset = offsetof(CPUX86State,xmm_t0);
+
+                switch (b) {
+                case 0x50 ... 0x5a:
+                case 0x5c ... 0x5f:
+                case 0xc2:
+                    /* Most sse scalar operations.  */
+                    if (b1 == 2) {
+                        sz = 2;
+                    } else if (b1 == 3) {
+                        sz = 3;
+                    }
+                    break;
+
+                case 0x2e:  /* ucomis[sd] */
+                case 0x2f:  /* comis[sd] */
+                    if (b1 == 0) {
+                        sz = 2;
+                    } else {
+                        sz = 3;
+                    }
+                    break;
+                }
+
+                switch (sz) {
+                case 2:
+                    /* 32 bit access */
+                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
+                    tcg_gen_st32_tl(s->T0, cpu_env,
+                                    offsetof(CPUX86State,xmm_t0.ZMM_L(0)));
+                    break;
+                case 3:
+                    /* 64 bit access */
+                    gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
+                    break;
+                default:
+                    /* 128 bit access */
+                    gen_ldo_env_A0(s, op2_offset);
+                    break;
+                }
+            } else {
+                rm = (modrm & 7) | REX_B(s);
+                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
+            }
+        } else {
+            op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                op2_offset = offsetof(CPUX86State,mmx_t0);
+                gen_ldq_env_A0(s, op2_offset);
+            } else {
+                rm = (modrm & 7);
+                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+            }
+        }
+        switch(b) {
+        case 0x0f: /* 3DNow! data insns */
+            val = x86_ldub_code(env, s);
+            sse_fn_epp = sse_op_table5[val];
+            if (!sse_fn_epp) {
+                goto unknown_op;
+            }
+            if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
+                goto illegal_op;
+            }
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            break;
+        case 0x70: /* pshufx insn */
+        case 0xc6: /* pshufx insn */
+            val = x86_ldub_code(env, s);
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            /* XXX: introduce a new table? */
+            sse_fn_ppi = (SSEFunc_0_ppi)sse_fn_epp;
+            sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
+            break;
+        case 0xc2:
+            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
+            val = x86_ldub_code(env, s) & 7;
+            sse_fn_epp = sse_op_table4[val][b1];
+
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            break;
+        case 0xf7:
+            /* maskmov : we must prepare A0 */
+            if (mod != 3)
+                goto illegal_op;
+            tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
+            gen_extu(s->aflag, s->A0);
+            gen_add_A0_ds_seg(s);
+
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            /* XXX: introduce a new table? */
+            sse_fn_eppt = (SSEFunc_0_eppt)sse_fn_epp;
+            sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
+            break;
+        default:
+            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+            break;
+        }
+        if (b == 0x2e || b == 0x2f) {
+            set_cc_op(s, CC_OP_EFLAGS);
+        }
+    }
+}
+
+/* convert one instruction. s->base.is_jmp is set if the translation must
+   be stopped. Return the next pc value */
+static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
+{
+    CPUX86State *env = cpu->env_ptr;
+    int b, prefixes;
+    int shift;
+    MemOp ot, aflag, dflag;
+    int modrm, reg, rm, mod, op, opreg, val;
+    target_ulong next_eip, tval;
+    target_ulong pc_start = s->base.pc_next;
+
+    s->pc_start = s->pc = pc_start;
+    s->override = -1;
+#ifdef TARGET_X86_64
+    s->rex_w = false;
+    s->rex_r = 0;
+    s->rex_x = 0;
+    s->rex_b = 0;
+#endif
+    s->rip_offset = 0; /* for relative ip address */
+    s->vex_l = 0;
+    s->vex_v = 0;
+    if (sigsetjmp(s->jmpbuf, 0) != 0) {
+        gen_exception_gpf(s);
+        return s->pc;
+    }
+
+    prefixes = 0;
+
+ next_byte:
+    b = x86_ldub_code(env, s);
+    /* Collect prefixes.  */
+    switch (b) {
+    case 0xf3:
+        prefixes |= PREFIX_REPZ;
+        goto next_byte;
+    case 0xf2:
+        prefixes |= PREFIX_REPNZ;
+        goto next_byte;
+    case 0xf0:
+        prefixes |= PREFIX_LOCK;
+        goto next_byte;
+    case 0x2e:
+        s->override = R_CS;
+        goto next_byte;
+    case 0x36:
+        s->override = R_SS;
+        goto next_byte;
+    case 0x3e:
+        s->override = R_DS;
+        goto next_byte;
+    case 0x26:
+        s->override = R_ES;
+        goto next_byte;
+    case 0x64:
+        s->override = R_FS;
+        goto next_byte;
+    case 0x65:
+        s->override = R_GS;
+        goto next_byte;
+    case 0x66:
+        prefixes |= PREFIX_DATA;
+        goto next_byte;
+    case 0x67:
+        prefixes |= PREFIX_ADR;
+        goto next_byte;
+#ifdef TARGET_X86_64
+    case 0x40 ... 0x4f:
+        if (CODE64(s)) {
+            /* REX prefix */
+            prefixes |= PREFIX_REX;
+            s->rex_w = (b >> 3) & 1;
+            s->rex_r = (b & 0x4) << 1;
+            s->rex_x = (b & 0x2) << 2;
+            s->rex_b = (b & 0x1) << 3;
+            goto next_byte;
+        }
+        break;
+#endif
+    case 0xc5: /* 2-byte VEX */
+    case 0xc4: /* 3-byte VEX */
+        /* VEX prefixes cannot be used except in 32-bit mode.
+           Otherwise the instruction is LES or LDS.  */
+        if (CODE32(s) && !VM86(s)) {
+            static const int pp_prefix[4] = {
+                0, PREFIX_DATA, PREFIX_REPZ, PREFIX_REPNZ
+            };
+            int vex3, vex2 = x86_ldub_code(env, s);
+
+            if (!CODE64(s) && (vex2 & 0xc0) != 0xc0) {
+                /* 4.1.4.6: In 32-bit mode, bits [7:6] must be 11b,
+                   otherwise the instruction is LES or LDS.  */
+                s->pc--; /* rewind the advance_pc() x86_ldub_code() did */
+                break;
+            }
+
+            /* 4.1.1-4.1.3: No preceding lock, 66, f2, f3, or rex prefixes. */
+            if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ
+                            | PREFIX_LOCK | PREFIX_DATA | PREFIX_REX)) {
+                goto illegal_op;
+            }
+#ifdef TARGET_X86_64
+            s->rex_r = (~vex2 >> 4) & 8;
+#endif
+            if (b == 0xc5) {
+                /* 2-byte VEX prefix: RVVVVlpp, implied 0f leading opcode byte */
+                vex3 = vex2;
+                b = x86_ldub_code(env, s) | 0x100;
+            } else {
+                /* 3-byte VEX prefix: RXBmmmmm wVVVVlpp */
+                vex3 = x86_ldub_code(env, s);
+#ifdef TARGET_X86_64
+                s->rex_x = (~vex2 >> 3) & 8;
+                s->rex_b = (~vex2 >> 2) & 8;
+                s->rex_w = (vex3 >> 7) & 1;
+#endif
+                switch (vex2 & 0x1f) {
+                case 0x01: /* Implied 0f leading opcode bytes.  */
+                    b = x86_ldub_code(env, s) | 0x100;
+                    break;
+                case 0x02: /* Implied 0f 38 leading opcode bytes.  */
+                    b = 0x138;
+                    break;
+                case 0x03: /* Implied 0f 3a leading opcode bytes.  */
+                    b = 0x13a;
+                    break;
+                default:   /* Reserved for future use.  */
+                    goto unknown_op;
+                }
+            }
+            s->vex_v = (~vex3 >> 3) & 0xf;
+            s->vex_l = (vex3 >> 2) & 1;
+            prefixes |= pp_prefix[vex3 & 3] | PREFIX_VEX;
+        }
+        break;
+    }
+
+    /* Post-process prefixes.  */
+    if (CODE64(s)) {
+        /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
+           data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
+           over 0x66 if both are present.  */
+        dflag = (REX_W(s) ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO_32);
+        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
+        aflag = (prefixes & PREFIX_ADR ? MO_32 : MO_64);
+    } else {
+        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
+        if (CODE32(s) ^ ((prefixes & PREFIX_DATA) != 0)) {
+            dflag = MO_32;
+        } else {
+            dflag = MO_16;
+        }
+        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
+        if (CODE32(s) ^ ((prefixes & PREFIX_ADR) != 0)) {
+            aflag = MO_32;
+        }  else {
+            aflag = MO_16;
+        }
+    }
+
+    s->prefix = prefixes;
+    s->aflag = aflag;
+    s->dflag = dflag;
+
+    /* now check op code */
+ reswitch:
+    switch(b) {
+    case 0x0f:
+        /**************************/
+        /* extended op code */
+        b = x86_ldub_code(env, s) | 0x100;
+        goto reswitch;
+
+        /**************************/
+        /* arith & logic */
+    case 0x00 ... 0x05:
+    case 0x08 ... 0x0d:
+    case 0x10 ... 0x15:
+    case 0x18 ... 0x1d:
+    case 0x20 ... 0x25:
+    case 0x28 ... 0x2d:
+    case 0x30 ... 0x35:
+    case 0x38 ... 0x3d:
+        {
+            int op, f, val;
+            op = (b >> 3) & 7;
+            f = (b >> 1) & 3;
+
+            ot = mo_b_d(b, dflag);
+
+            switch(f) {
+            case 0: /* OP Ev, Gv */
+                modrm = x86_ldub_code(env, s);
+                reg = ((modrm >> 3) & 7) | REX_R(s);
+                mod = (modrm >> 6) & 3;
+                rm = (modrm & 7) | REX_B(s);
+                if (mod != 3) {
+                    gen_lea_modrm(env, s, modrm);
+                    opreg = OR_TMP0;
+                } else if (op == OP_XORL && rm == reg) {
+                xor_zero:
+                    /* xor reg, reg optimisation */
+                    set_cc_op(s, CC_OP_CLR);
+                    tcg_gen_movi_tl(s->T0, 0);
+                    gen_op_mov_   rm = (modrm & 7) | REX_B(s);
+                if (mod != 3) {
+                    gen_lea_modrm(env, s, modrm);
+                    gen_op_ld_v(s, ot, s->T1, s->A0);
+                } else if (op == OP_XORL && rm == reg) {
+                    goto xor_zero;
+                } else {
+                    gen_op_mov_v_reg(s, ot, s->T1, rm);
+                }
+                gen_op(s, op, ot, reg);
+                break;
+            case 2: /* OP A, Iv */
+                val = insn_get(env, s, ot);
+                tcg_gen_movi_tl(s->T1, val);
+                gen_op(s, op, ot, OR_EAX);
+                break;
+            }
+        }
+        break;
+
+    case 0x82:
+        if (CODE64(s))
+            goto illegal_op;
+        /* fall through */
+    case 0x80: /* GRP1 */
+    case 0x81:
+    case 0x83:
+        {
+            int val;
+
+            ot = mo_b_d(b, dflag);
+
+            modrm = x86_ldub_code(env, s);
+            mod = (modrm >> 6) & 3;
+            rm = (modrm & 7) | REX_B(s);
+            op = (modrm >> 3) & 7;
+
+            if (mod != 3) {
+                if (b == 0x83)
+                    s->rip_offset = 1;
+                else
+                    s->rip_offset = insn_const_size(ot);
+                gen_lea_modrm(env, s, modrm);
+                opreg = OR_TMP0;
+            } else {
+                opreg = rm;
+            }
+
+            switch(b) {
+            default:
+            case 0x80:
+            case 0x81:
+            case 0x82:
+                val = insn_get(env, s, ot);
+                break;
+            case 0x83:
+                val = (int8_t)insn_get(env, s, MO_8);
+                break;
+            }
+            tcg_gen_movi_tl(s->T1, val);
+            gen_op(s, op, ot, opreg);
+        }
+        break;
+
+        /**************************/
+        /* inc, dec, and other misc arith */
+    case 0x40 ... 0x47: /* inc Gv */
+        ot = dflag;
+        gen_inc(s, ot, OR_EAX + (b & 7), 1);
+        break;
+    case 0x48 ... 0x4f: /* dec Gv */
+        ot = dflag;
+        gen_inc(s, ot, OR_EAX + (b & 7), -1);
+        break;
+    case 0xf6: /* GRP3 */
+    case 0xf7:
+        ot = mo_b_d(b, dflag);
+
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        rm = (modrm & 7) | REX_B(s);
+        op = (modrm >> 3) & 7;
+        if (mod != 3) {
+            if (op == 0) {
+                s->rip_offset = insn_const_size(ot);
+            }
+            gen_lea_modrm(env, s, modrm);
+            /* For those below that handle locked memory, don't load here.  */
+            if (!(s->prefix & PREFIX_LOCK)
+                || op != 2) {
+                gen_op_ld_v(s, ot, s->T0, s->A0);
+            }
+        } else {
+            gen_op_mov_v_reg(s, ot, s->T0, rm);
+        }
+
+        switch(op) {
+        case 0: /* test */
+            val = insn_get(env, s, ot);
+            tcg_gen_movi_tl(s->T1, val);
+            gen_op_testl_T0_T1_cc(s);
+            set_cc_op(s, CC_OP_LOGICB + ot);
+            break;
+        case 2: /* not */
+            if (s->prefix & PREFIX_LOCK) {
+                if (mod == 3) {
+                    goto illegal_op;
+                }
+                tcg_gen_movi_tl(s->T0, ~0);
+                tcg_gen_atomic_xor_fetch_tl(s->T0, s->A0, s->T0,
+                                            s->mem_index, ot | MO_LE);
+            } else {
+                tcg_gen_not_tl(s->T0, s->T0);
+                if (mod != 3) {
+                    gen_op_st_v(s, ot, s->T0, s->A0);
+                } else {
+                    gen_op_mov_reg_v(s, ot, rm, s->T0);
+                }
+            }
+            break;
+        case 3: /* neg */
+            if (s->prefix & PREFIX_LOCK) {
+                TCGLabel *label1;
+                TCGv a0, t0, t1, t2;
+
+                if (mod == 3) {
+                    goto illegal_op;
+                }
+                a0 = tcg_temp_local_new();
+                t0 = tcg_temp_local_new();
+                label1 = gen_new_label();
+
+                tcg_gen_mov_tl(a0, s->A0);
+                tcg_gen_mov_tl(t0, s->T0);
+
+                gen_set_label(label1);
+                t1 = tcg_temp_new();
+                t2 = tcg_temp_new();
+                tcg_gen_mov_tl(t2, t0);
+                tcg_gen_neg_tl(t1, t0);
+                tcg_gen_atomic_cmpxchg_tl(t0, a0, t0, t1,
+                                          s->mem_index, ot | MO_LE);
+                tcg_temp_free(t1);
+                tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
+
+                tcg_temp_free(t2);
+                tcg_temp_free(a0);
+                tcg_gen_mov_tl(s->T0, t0);
+                tcg_temp_free(t0);
+            } else {
+                tcg_gen_neg_tl(s->T0, s->T0);
+                if (mod != 3) {
+                    gen_op_st_v(s, ot, s->T0, s->A0);
+                } else {
+                    gen_op_mov_reg_v(s, ot, rm, s->T0);
+                }
+            }
+            gen_op_update_neg_cc(s);
+            set_cc_op(s, CC_OP_SUBB + ot);
+            break;
+        case 4: /* mul */
+            switch(ot) {
+            case MO_8:
+                gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
+                tcg_gen_ext8u_tl(s->T0, s->T0);
+                tcg_gen_ext8u_tl(s->T1, s->T1);
+                /* XXX: use 32 bit mul which could be faster */
+                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
+                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+                tcg_gen_andi_tl(cpu_cc_src, s->T0, 0xff00);
+                set_cc_op(s, CC_OP_MULB);
+                break;
+            case MO_16:
+                gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
+                tcg_gen_ext16u_tl(s->T0, s->T0);
+                tcg_gen_ext16u_tl(s->T1, s->T1);
+                /* XXX: use 32 bit mul which could be faster */
+                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
+                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+                tcg_gen_shri_tl(s->T0, s->T0, 16);
+                gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
+                tcg_gen_mov_tl(cpu_cc_src, s->T0);
+                set_cc_op(s, CC_OP_MULW);
+                break;
+            default:
+            case MO_32:
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EAX]);
+                tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
+                                  s->tmp2_i32, s->tmp3_i32);
+                tcg_gen_extu_i32_tl(cpu_regs[R_EAX], s->tmp2_i32);
+                tcg_gen_extu_i32_tl(cpu_regs[R_EDX], s->tmp3_i32);
+                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
+                tcg_gen_mov_tl(cpu_cc_src, cpu_regs[R_EDX]);
+                set_cc_op(s, CC_OP_MULL);
+                break;
+#ifdef TARGET_X86_64
+            case MO_64:
+                tcg_gen_mulu2_i64(cpu_regs[R_EAX], cpu_regs[R_EDX],
+                                  s->T0, cpu_regs[R_EAX]);
+                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
+                tcg_gen_mov_tl(cpu_cc_src, cpu_regs[R_EDX]);
+                set_cc_op(s, CC_OP_MULQ);
+                break;
+#endif
+            }
+            break;
+        case 5: /* imul */
+            switch(ot) {
+            case MO_8:
+                gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
+                tcg_gen_ext8s_tl(s->T0, s->T0);
+                tcg_gen_ext8s_tl(s->T1, s->T1);
+                /* XXX: use 32 bit mul which could be faster */
+                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
+                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+                tcg_gen_ext8s_tl(s->tmp0, s->T0);
+                tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
+                set_cc_op(s, CC_OP_MULB);
+                break;
+            case MO_16:
+                gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
+                tcg_gen_ext16s_tl(s->T0, s->T0);
+                tcg_gen_ext16s_tl(s->T1, s->T1);
+                /* XXX: use 32 bit mul which could be faster */
+                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
+                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+                tcg_gen_ext16s_tl(s->tmp0, s->T0);
+                tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
+                tcg_gen_shri_tl(s->T0, s->T0, 16);
+                gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
+                set_cc_op(s, CC_OP_MULW);
+                break;
+            default:
+            case MO_32:
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EAX]);
+                tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
+                                  s->tmp2_i32, s->tmp3_i32);
+                tcg_gen_extu_i32_tl(cpu_regs[R_EAX], s->tmp2_i32);
+                tcg_gen_extu_i32_tl(cpu_regs[R_EDX], s->tmp3_i32);
+                tcg_gen_sari_i32(s->tmp2_i32, s->tmp2_i32, 31);
+                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
+                tcg_gen_sub_i32(s->tmp2_i32, s->tmp2_i32, s->tmp3_i32);
+                tcg_gen_extu_i32_tl(cpu_cc_src, s->tmp2_i32);
+                set_cc_op(s, CC_OP_MULL);
+                break;
+#ifdef TARGET_X86_64
+            case MO_64:
+                tcg_gen_muls2_i64(cpu_regs[R_EAX], cpu_regs[R_EDX],
+                                  s->T0, cpu_regs[R_EAX]);
+                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
+                tcg_gen_sari_tl(cpu_cc_src, cpu_regs[R_EAX], 63);
+                tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, cpu_regs[R_EDX]);
+                set_cc_op(s, CC_OP_MULQ);
+                break;
+#endif
+            }
+            break;
+        case 6: /* div */
+            switch(ot) {
+            case MO_8:
+                gen_helper_divb_AL(cpu_env, s->T0);
+                break;
+            case MO_16:
+                gen_helper_divw_AX(cpu_env, s->T0);
+                break;
+            default:
+            case MO_32:
+                gen_helper_divl_EAX(cpu_env, s->T0);
+                break;
+#ifdef TARGET_X86_64
+            case MO_64:
+                gen_helper_divq_EAX(cpu_env, s->T0);
+                break;
+#endif
+            }
+            break;
+        case 7: /* idiv */
+            switch(ot) {
+            case MO_8:
+                gen_helper_idivb_AL(cpu_env, s->T0);
+                break;
+            case MO_16:
+                gen_helper_idivw_AX(cpu_env, s->T0);
+                break;
+            default:
+            case MO_32:
+                gen_helper_idivl_EAX(cpu_env, s->T0);
+                break;
+#ifdef TARGET_X86_64
+            case MO_64:
+                gen_helper_idivq_EAX(cpu_env, s->T0);
+                break;
+#endif
+            }
+            break;
+        default:
+            goto unknown_op;
+        }
+        break;
+
+    case 0xfe: /* GRP4 */
+    case 0xff: /* GRP5 */
+        ot = mo_b_d(b, dflag);
+
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        rm = (modrm & 7) | REX_B(s);
+        op = (modrm >> 3) & 7;
+        if (op >= 2 && b == 0xfe) {
+            goto unknown_op;
+        }
+        if (CODE64(s)) {
+            if (op == 2 || op == 4) {
+                /* operand size for jumps is 64 bit */
+                ot = MO_64;
+            } else if (op == 3 || op == 5) {
+                ot = dflag != MO_16 ? MO_32 + REX_W(s) : MO_16;
+            } else if (op == 6) {
+                /* default push size is 64 bit */
+                ot = mo_pushpop(s, dflag);
+            }
+        }
+        if (mod != 3) {
+            gen_lea_modrm(env, s, modrm);
+            if (op >= 2 && op != 3 && op != 5)
+                gen_op_ld_v(s, ot, s->T0, s->A0);
+        } else {
+            gen_op_mov_v_reg(s, ot, s->T0, rm);
+        }
+
+        switch(op) {
+        case 0: /* inc Ev */
+            if (mod != 3)
+                opreg = OR_TMP0;
+            else
+                opreg = rm;
+            gen_inc(s, ot, opreg, 1);
+            break;
+        case 1: /* dec Ev */
+            if (mod != 3)
+                opreg = OR_TMP0;
+            else
+                opreg = rm;
+            gen_inc(s, ot, opreg, -1);
+            break;
+        case 2: /* call Ev */
+            /* XXX: optimize if memory (no 'and' is necessary) */
+            if (dflag == MO_16) {
+                tcg_gen_ext16u_tl(s->T0, s->T0);
+            }
+            next_eip = s->pc - s->cs_base;
+            tcg_gen_movi_tl(s->T1, next_eip);
+            gen_push_v(s, s->T1);
+            gen_op_jmp_v(s->T0);
+            gen_bnd_jmp(s);
+            gen_jr(s, s->T0);
+            break;
+        case 3: /* lcall Ev */
+            if (mod == 3) {
+                goto illegal_op;
+            }
+            gen_op_ld_v(s, ot, s->T1, s->A0);
+            gen_add_A0_im(s, 1 << ot);
+            gen_op_ld_v(s, MO_16, s->T0, s->A0);
+        do_lcall:
+            if (PE(s) && !VM86(s)) {
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
+                                           tcg_const_i32(dflag - 1),
+                                           tcg_const_tl(s->pc - s->cs_base));
+            } else {
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
+                                      tcg_const_i32(dflag - 1),
+                                      tcg_const_i32(s->pc - s->cs_base));
+            }
+            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, s->tmp4);
+            break;
+        case 4: /* jmp Ev */
+            if (dflag == MO_16) {
+                tcg_gen_ext16u_tl(s->T0, s->T0);
+            }
+            gen_op_jmp_v(s->T0);
+            gen_bnd_jmp(s);
+            gen_jr(s, s->T0);
+            break;
+        case 5: /* ljmp Ev */
+            if (mod == 3) {
+                goto illegal_op;
+            }
+            gen_op_ld_v(s, ot, s->T1, s->A0);
+            gen_add_A0_im(s, 1 << ot);
+            gen_op_ld_v(s, MO_16, s->T0, s->A0);
+        do_ljmp:
+            if (PE(s) && !VM86(s)) {
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
+                                          tcg_const_tl(s->pc - s->cs_base));
+            } else {
+                gen_op_movl_seg_T0_vm(s, R_CS);
+                gen_op_jmp_v(s->T1);
+            }
+            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
+            gen_jr(s, s->tmp4);
+            break;
+        case 6: /* push Ev */
+            gen_push_v(s, s->T0);
+            break;
+        default:
+            goto unknown_op;
+        }
+        break;
+
+    case 0x84: /* test Ev, Gv */
+    case 0x85:
+        ot = mo_b_d(b, dflag);
+
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+
+        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+        gen_op_mov_v_reg(s, ot, s->T1, reg);
+        gen_op_testl_T0_T1_cc(s);
+        set_cc_op(s, CC_OP_LOGICB + ot);
+        break;
+
+    case 0xa8: /* test eAX, Iv */
+    case 0xa9:
+        ot = mo_b_d(b, dflag);
+        val = insn_get(env, s, ot);
+
+        gen_op_mov_v_reg(s, ot, s->T0, OR_EAX);
+        tcg_gen_movi_tl(s->T1, val);
+        gen_op_testl_T0_T1_cc(s);
+        set_cc_op(s, CC_OP_LOGICB + ot);
+        break;
+
+    case 0x98: /* CWDE/CBW */
+        switch (dflag) {
+#ifdef TARGET_X86_64
+      , MO_8, s->T0, R_EAX);
+            tcg_gen_ext8s_tl(s->T0, s->T0);
+            gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+            break;
+        default:
+            tcg_abort();
+        }
+        break;
+    case 0x99: /* CDQ/CWD */
+        switch (dflag) {
+#ifdef TARGET_X86_64
+        case MO_64:
+            gen_op_mov_v_reg(s, MO_64, s->T0, R_EAX);
+            tcg_gen_sari_tl(s->T0, s->T0, 63);
+            gen_op_mov_reg_v(s, MO_64, R_EDX, s->T0);
+            break;
+#endif
+        case MO_32:
+            gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
+            tcg_gen_ext32s_tl(s->T0, s->T0);
+            tcg_gen_sari_tl(s->T0, s->T0, 31);
+            gen_op_mov_reg_v(s, MO_32, R_EDX, s->T0);
+            break;
+        case MO_16:
+            gen_op_mov_v_reg(s, MO_16, s->T0, R_EAX);
+            tcg_gen_ext16s_tl(s->T0, s->T0);
+            tcg_gen_sari_tl(s->T0, s->T0, 15);
+            gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
+            break;
+        default:
+            tcg_abort();
+        }
+        break;
+    case 0x1af: /* imul Gv, Ev */
+    case 0x69: /* imul Gv, Ev, I */
+    case 0x6b:
+        ot = dflag;
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        if (b == 0x69)
+            s->rip_offset = insn_const_size(ot);
+        else if (b == 0x6b)
+            s->rip_offset = 1;
+        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+        if (b == 0x69) {
+            val = insn_get(env, s, ot);
+            tcg_gen_movi_tl(s->T1, val);
+        } else if (b == 0x6b) {
+            val = (int8_t)insn_get(env, s, MO_8);
+            tcg_gen_movi_tl(s->T1, val);
+        } else {
+            gen_op_mov_v_reg(s, ot, s->T1, reg);
+        }
+        switch (ot) {
+#ifdef TARGET_X86_64
+        case MO_64:
+            tcg_gen_muls2_i64(cpu_regs[reg], s->T1, s->T0, s->T1);
+            tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
+            tcg_gen_sari_tl(cpu_cc_src, cpu_cc_dst, 63);
+            tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, s->T1);
+            break;
+#endif
+        case MO_32:
+            tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+            tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+            tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
+                              s->tmp2_i32, s->tmp3_i32);
+            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
+            tcg_gen_sari_i32(s->tmp2_i32, s->tmp2_i32, 31);
+            tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
+            tcg_gen_sub_i32(s->tmp2_i32, s->tmp2_i32, s->tmp3_i32);
+            tcg_gen_extu_i32_tl(cpu_cc_src, s->tmp2_i32);
+            break;
+        default:
+            tcg_gen_ext16s_tl(s->T0, s->T0);
+            tcg_gen_ext16s_tl(s->T1, s->T1);
+            /* XXX: use 32 bit mul which could be faster */
+            tcg_gen_mul_tl(s->T0, s->T0, s->T1);
+            tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+            tcg_gen_ext16s_tl(s->tmp0, s->T0);
+            tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
+            gen_op_mov_reg_v(s, ot, reg, s->T0);
+            break;
+        }
+        set_cc_op(s, CC_OP_MULB + ot);
+        break;
+    case 0x1c0:
+    case 0x1c1: /* xadd Ev, Gv */
+        ot = mo_b_d(b, dflag);
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        mod = (modrm >> 6) & 3;
+        gen_op_mov_v_reg(s, ot, s->T0, reg);
+        if (mod == 3) {
+            rm = (modrm & 7) | REX_B(s);
+            gen_op_mov_v_reg(s, ot, s->T1, rm);
+            tcg_gen_add_tl(s->T0, s->T0, s->T1);
+            gen_op_mov_reg_v(s, ot, reg, s->T1);
+            gen_op_mov_reg_v(s, ot, rm, s->T0);
+        } else {
+            gen_lea_modrm(env, s, modrm);
+            if (s->prefix & PREFIX_LOCK) {
+                tcg_gen_atomic_fetch_add_tl(s->T1, s->A0, s->T0,
+                                            s->mem_index, ot | MO_LE);
+                tcg_gen_add_tl(s->T0, s->T0, s->T1);
+            } else {
+                gen_op_ld_v(s, ot, s->T1, s->A0);
+                tcg_gen_add_tl(s->T0, s->T0, s->T1);
+                gen_op_st_v(s, ot, s->T0, s->A0);
+            }
+            gen_op_mov_reg_v(s, ot, reg, s->T1);
+        }
+        gen_op_update2_cc(s);
+        set_cc_op(s, CC_OP_ADDB + ot);
+        break;
+    case 0x1b0:
+    case 0x1b1: /* cmpxchg Ev, Gv */
+        {
+            TCGv oldv, newv, cmpv;
+
+            ot = mo_b_d(b, dflag);
+            modrm = x86_ldub_code(env, s);
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            mod = (modrm >> 6) & 3;
+            oldv = tcg_temp_new();
+            newv = tcg_temp_new();
+            cmpv = tcg_temp_new();
+            gen_op_mov_v_reg(s, ot, newv, reg);
+            tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
+
+            if (s->prefix & PREFIX_LOCK) {
+                if (mod == 3) {
+                    goto illegal_op;
+                }
+                gen_lea_modrm(env, s, modrm);
+                tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
+                                          s->mem_index, ot | MO_LE);
+                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+            } else {
+                if (mod == 3) {
+                    rm = (modrm & 7) | REX_B(s);
+                    gen_op_mov_v_reg(s, ot, oldv, rm);
+                } else {
+                    gen_lea_modrm(env, s, modrm);
+                    gen_op_ld_v(s, ot, oldv, s->A0);
+                    rm = 0; /* avoid warning */
+                }
+                gen_extu(ot, oldv);
+                gen_extu(ot, cmpv);
+                /* store value = (old == cmp ? new : old);  */
+                tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
+                if (mod == 3) {
+                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                    gen_op_mov_reg_v(s, ot, rm, newv);
+                } else {
+                    /* Perform an unconditional store cycle like physical cpu;
+                       must be before changing accumulator to ensure
+                       idempotency if the store faults and the instruction
+                       is restarted */
+                    gen_op_st_v(s, ot, newv, s->A0);
+                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                }
+            }
+            tcg_gen_mov_tl(cpu_cc_src, oldv);
+            tcg_gen_mov_tl(s->cc_srcT, cmpv);
+            tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
+            set_cc_op(s, CC_OP_SUBB + ot);
+            tcg_temp_free(oldv);
+            tcg_temp_free(newv);
+            tcg_temp_free(cmpv);
+        }
+        break;
+    case 0x1c7: /* cmpxchg8b */
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        switch ((modrm >> 3) & 7) {
+        case 1: /* CMPXCHG8, CMPXCHG16 */
+            if (mod == 3) {
+                goto illegal_op;
+            }
+#ifdef TARGET_X86_64
+            if (dflag == MO_64) {
+                if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
+                    goto illegal_op;
+                }
+                gen_lea_modrm(env, s, modrm);
+                if ((s->prefix & PREFIX_LOCK) &&
+                    (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+                    gen_helper_cmpxchg16b(cpu_env, s->A0);
+                } else {
+                    gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
+                }
+                set_cc_op(s, CC_OP_EFLAGS);
+                break;
+            }
+#endif        
+            if (!(s->cpuid_features & CPUID_CX8)) {
+                goto illegal_op;
+            }
+            gen_lea_modrm(env, s, modrm);
+            if ((s->prefix & PREFIX_LOCK) &&
+                (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+                gen_helper_cmpxchg8b(cpu_env, s->A0);
+            } else {
+                gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
+            }
+            set_cc_op(s, CC_OP_EFLAGS);
+            break;
+
+        case 7: /* RDSEED */
+        case 6: /* RDRAND */
+            if (mod != 3 ||
+                (s->prefix & (PREFIX_LOCK | PREFIX_REPZ | PREFIX_REPNZ)) ||
+                !(s->cpuid_ext_features & CPUID_EXT_RDRAND)) {
+                goto illegal_op;
+            }
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_start();
+            }
+            gen_helper_rdrand(s->T0, cpu_env);
+            rm = (modrm & 7) | REX_B(s);
+            gen_op_mov_reg_v(s, dflag, rm, s->T0);
+            set_cc_op(s, CC_OP_EFLAGS);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_jmp(s, s->pc - s->cs_base);
+            }
+            break;
+
+        default:
+            goto illegal_op;
+        }
+        break;
+
+        /**************************/
+        /* push/pop */
+    case 0x50 ... 0x57: /* push */
+        gen_op_mov_v_reg(s, MO_32, s->T0, (b & 7) | REX_B(s));
+        gen_push_v(s, s->T0);
+        break;
+    case 0x58 ... 0x5f: /* pop */
+        ot = gen_pop_T0(s);
+        /* NOTE: order is important for pop %sp */
+        gen_pop_update(s, ot);
+        gen_op_mov_reg_v(s, ot, (b & 7) | REX_B(s), s->T0);
+        break;
+    case 0x60: /* pusha */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_pusha(s);
+        break;
+    case 0x61: /* popa */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_popa(s);
+        break;
+    case 0x68: /* push Iv */
+    case 0x6a:
+        ot = mo_pushpop(s, dflag);
+        if (b == 0x68)
+            val = insn_get(env, s, ot);
+        else
+            val = (int8_t)insn_get(env, s, MO_8);
+        tcg_gen_movi_tl(s->T0, val);
+        gen_push_v(s, s->T0);
+        break;
+    case 0x8f: /* pop Ev */
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        ot = gen_pop_T0(s);
+        if (mod == 3) {
+            /* NOTE: order is important for pop %sp */
+            gen_pop_update(s, ot);
+            rm = (modrm & 7) | REX_B(s);
+            gen_op_mov_reg_v(s, ot, rm, s->T0);
+        } else {
+            /* NOTE: order is important too for MMU exceptions */
+            s->popl_esp_hack = 1 << ot;
+            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
+            s->popl_esp_hack = 0;
+            gen_pop_update(s, ot);
+        }
+        break;
+    case 0xc8: /* enter */
+        {
+            int level;
+            val = x86_lduw_code(env, s);
+            level = x86_ldub_code(env, s);
+            gen_enter(s, val, level);
+        }
+        break;
+    case 0xc9: /* leave */
+        gen_leave(s);
+        break;
+    case 0x06: /* push es */
+    case 0x0e: /* push cs */
+    case 0x16: /* push ss */
+    case 0x1e: /* push ds */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_op_movl_T0_seg(s, b >> 3);
+        gen_push_v(s, s->T0);
+        break;
+    case 0x1a0: /* push fs */
+    case 0x1a8: /* push gs */
+        gen_op_movl_T0_seg(s, (b >> 3) & 7);
+        gen_push_v(s, s->T0);
+        break;
+    case 0x07: /* pop es */
+    case 0x17: /* pop ss */
+    case 0x1f: /* pop ds */
+        if (CODE64(s))
+            goto illegal_op;
+        reg = b >> 3;
+        ot = gen_pop_T0(s);
+        gen_movl_seg_T0(s, reg);
+        gen_pop_update(s, ot);
+        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
+        if (s->base.is_jmp) {
+            gen_jmp_im(s, s->pc - s->cs_base);
+            if (reg == R_SS) {
+                s->flags &= ~HF_TF_MASK;
+                gen_eob_inhibit_irq(s, true);
+            } else {
+                gen_eob(s);
+            }
+        }
+        break;
+    case 0x1a1: /* pop fs */
+    case 0x1a9: /* pop gs */
+        ot = gen_pop_T0(s);
+        gen_movl_seg_T0(s, (b >> 3) & 7);
+        gen_pop_update(s, ot);
+        if (s->base.is_jmp) {
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+        }
+        break;
+
+        /**************************/
+        /* mov */
+    case 0x88:
+    case 0x89: /* mov Gv, Ev */
+        ot = mo_b_d(b, dflag);
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+
+        /* generate a generic store */
+        gen_ldst_modrm(env, s, modrm, ot, reg, 1);
+        break;
+    case 0xc6:
+    case 0xc7: /* mov Ev, Iv */
+        ot = mo_b_d(b, dflag);
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        if (mod != 3) {
+            s->rip_offset = insn_const_size(ot);
+            gen_lea_modrm(env, s, modrm);
+        }
+        val = insn_get(env, s, ot);
+        tcg_gen_movi_tl(s->T0, val);
+        if (mod != 3) {
+            gen_op_st_v(s, ot, s->T0, s->A0);
+        } else {
+            gen_op_mov_reg_v(s, ot, (modrm & 7) | REX_B(s), s->T0);
+        }
+        break;
+    case 0x8a:
+    case 0x8b: /* mov Ev, Gv */
+        ot = mo_b_d(b, dflag);
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+
+        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+        gen_op_mov_reg_v(s, ot, reg, s->T0);
+        break;
+    case 0x8e: /* mov seg, Gv */
+        modrm = x86_ldub_code(env, s);
+        reg = (modrm >> 3) & 7;
+        if (reg >= 6 || reg == R_CS)
+            goto illegal_op;
+        gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+        gen_movl_seg_T0(s, reg);
+        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
+        if (s->base.is_jmp) {
+            gen_jmp_im(s, s->pc - s->cs_base);
+            if (reg == R_SS) {
+                s->flags &= ~HF_TF_MASK;
+                gen_eob_inhibit_irq(s, true);
+            } else {
+                gen_eob(s);
+            }
+        }
+        break;
+    case 0x8c: /* mov Gv, seg */
+        modrm = x86_ldub_code(env, s);
+        reg = (modrm >> 3) & 7;
+        mod = (modrm >> 6) & 3;
+        if (reg >= 6)
+            goto illegal_op;
+        gen_op_movl_T0_seg(s, reg);
+        ot = mod == 3 ? dflag : MO_16;
+        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
+        break;
+
+    case 0x1b6: /* movzbS Gv, Eb */
+    case 0x1b7: /* movzwS Gv, Eb */
+    case 0x1be: /* movsbS Gv, Eb */
+    case 0x1bf: /* movswS Gv, Eb */
+        {
+            MemOp d_ot;
+            MemOp s_ot;
+
+            /* d_ot is the size of destination */
+            d_ot = dflag;
+            /* ot is the size of source */
+            ot = (b & 1) + MO_8;
+            /* s_ot is the sign+size of source */
+            s_ot = b & 8 ? MO_SIGN | ot : ot;
+
+            modrm = x86_ldub_code(env, s);
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            mod = (modrm >> 6) & 3;
+            rm = (modrm & 7) | REX_B(s);
+
+            if (mod == 3) {
+                if (s_ot == MO_SB && byte_reg_is_xH(s, rm)) {
+                    tcg_gen_sextract_tl(s->T0, cpu_regs[rm - 4], 8, 8);
+                } else {
+                    gen_op_mov_v_reg(s, ot, s->T0, rm);
+                    switch (s_ot) {
+                    case MO_UB:
+                        tcg_gen_ext8u_tl(s->T0, s->T0);
+                        break;
+                    case MO_SB:
+                        tcg_gen_ext8s_tl(s->T0, s->T0);
+                        break;
+                    case MO_UW:
+                        tcg_gen_ext16u_tl(s->T0, s->T0);
+                        break;
+                    default:
+                    case MO_SW:
+                        tcg_gen_ext16s_tl(s->T0, s->T0);
+                        break;
+                    }
+                }
+                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
+            } else {
+                gen_lea_modrm(env, s, modrm);
+                gen_op_ld_v(s, s_ot, s->T0, s->A0);
+                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
+            }
+        }
+        break;
+
+    case 0xa0: /* mov EAX, Ov */
+    case 0xa1:
+    case 0xa2: /* mov Ov, EAX */
+    case 0xa3:
+        {
+            target_ulong offset_addr;
+
+            ot = mo_b_d(b, dflag);
+            switch (s->aflag) {
+#ifdef TARGET_X86_64
+            case MO_64:
+                offset_addr = x86_ldq_code(env, s);
+                break;
+#endif
+            default:
+                offset_addr = insn_get(env, s, s->aflag);
+                break;
+            }
+            tcg_gen_movi_tl(s->A0, offset_addr);
+            gen_add_A0_ds_seg(s);
+            if ((b & 2) == 0) {
+                gen_op_ld_v(s, ot, s->T0, s->A0);
+                gen_op_mov_reg_v(s, ot, R_EAX, s->T0);
+            } else {
+                gen_op_mov_v_reg(s, ot, s->T0, R_EAX);
+                gen_op_st_v(s, ot, s->T0, s->A0);
+            }
+        }
+        break;
+    case 0xd7: /* xlat */
+        tcg_gen_mov_tl(s->A0, cpu_regs[R_EBX]);
+        tcg_gen_ext8u_tl(s->T0, cpu_regs[R_EAX]);
+        tcg_gen_add_tl(s->A0, s->A0, s->T0);
+        gen_extu(s->aflag, s->A0);
+        gen_add_A0_ds_seg(s);
+        gen_op_ld_v(s, MO_8, s->T0, s->A0);
+        gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
+        break;
+    case 0xb0 ... 0xb7: /* mov R, Ib */
+        val = insn_get(env, s, MO_8);
+        tcg_gen_movi_tl(s->T0, val);
+        gen_op_mov_reg_v(s, MO_8, (b & 7) | REX_B(s), s->T0);
+        break;
+    case 0xb8 ... 0xbf: /* mov R, Iv */
+#ifdef TARGET_X86_64
+        if (dflag == MO_64) {
+            uint64_t tmp;
+            /* 64 bit case */
+            tmp = x86_ldq_code(env, s);
+            reg = (b & 7) | REX_B(s);
+            tcg_gen_movi_tl(s->T0, tmp);
+            gen_op_mov_reg_v(s, MO_64, reg, s->T0);
+        } else
+#endif
+        {
+            ot = dflag;
+            val = insn_get(env, s, ot);
+            reg = (b & 7) | REX_B(s);
+            tcg_gen_movi_tl(s->T0, val);
+            gen_op_mov_reg_v(s, ot, reg, s->T0);
+        }
+        break;
+
+    case 0x91 ... 0x97: /* xchg R, EAX */
+    do_xchg_reg_eax:
+        ot = dflag;
+        reg = (b & 7) | REX_B(s);
+        rm = R_EAX;
+        goto do_xchg_reg;
+    case 0x86:
+    case 0x87: /* xchg Ev, Gv */
+        ot = mo_b_d(b, dflag);
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        mod = (modrm >> 6) & 3;
+        if (mod == 3) {
+            rm = (modrm & 7) | REX_B(s);
+        do_xchg_reg:
+            gen_op_mov_v_reg(s, ot, s->T0, reg);
+            gen_op_mov_v_reg(s, ot, s->T1, rm);
+            gen_op_mov_reg_v(s, ot, rm, s->T0);
+            gen_op_mov_reg_v(s, ot, reg, s->T1);
+        } else {
+            gen_lea_modrm(env, s, modrm);
+            gen_op_mov_v_reg(s, ot, s->T0, reg);
+            /* for xchg, lock is implicit */
+            tcg_gen_atomic_xchg_tl(s->T1, s->A0, s->T0,
+                                   s->mem_index, ot | MO_LE);
+            gen_op_mov_reg_v(s, ot, reg, s->T1);
+        }
+        break;
+    case 0xc4: /* les Gv */
+        /* In CODE64 this is VEX3; see above.  */
+        op = R_ES;
+        goto do_lxx;
+    case 0xc5: /* lds Gv */
+        /* In CODE64 this is VEX2; see above.  */
+        op = R_DS;
+        goto do_lxx;
+    case 0x1b2: /* lss Gv */
+        op = R_SS;
+        goto do_lxx;
+    case 0x1b4: /* lfs Gv */
+        op = R_FS;
+        goto do_lxx;
+    case 0x1b5: /* lgs Gv */
+        op = R_GS;
+    do_lxx:
+        ot = dflag != MO_16 ? MO_32 : MO_16;
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        mod = (modrm >> 6) & 3;
+        if (mod == 3)
+            goto illegal_op;
+        gen_lea_modrm(env, s, modrm);
+        gen_op_ld_v(s, ot, s->T1, s->A0);
+        gen_add_A0_im(s, 1 << ot);
+        /* load the segment first to handle exceptions properly */
+        gen_op_ld_v(s, MO_16, s->T0, s->A0);
+        gen_movl_seg_T0(s, op);
+        /* then put the data */
+        gen_op_mov_reg_v(s, ot, reg, s->T1);
+        if (s->base.is_jmp) {
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+        }
+        break;
+
+        /************************/
+        /* shifts */
+    case 0xc0:
+    case 0xc1:
+        /* shift Ev,Ib */
+        shift = 2;
+    grp2:
+        {
+            ot = mo_b_d(b, dflag);
+            modrm = x86_ldub_code(env, s);
+            mod = (modrm >> 6) & 3;
+            op = (modrm >> 3) & 7;
+
+            if (mod != 3) {
+                if (shift == 2) {
+                    s->rip_offset = 1;
+                }
+                gen_lea_modrm(env, s, modrm);
+                opreg = OR_TMP0;
+            } else {
+                opreg = (modrm & 7) | REX_B(s);
+            }
+
+            /* simpler op */
+            if (shift == 0) {
+                gen_shift(s, op, ot, opreg, OR_ECX);
+            } else {
+                if (shift == 2) {
+                    shift = x86_ldub_code(env, s);
+                }
+                gen_shifti(s, op, ot, opreg, shift);
+            }
+        }
+        break;
+    case 0xd0:
+    case 0xd1:
+        /* shift Ev,1 */
+        shift = 1;
+        goto grp2;
+    case 0xd2:
+    case 0xd3:
+        /* shift Ev,cl */
+        shift = 0;
+        goto grp2;
+
+    case 0x1a4: /* shld imm */
+        op = 0;
+        shift = 1;
+        goto do_shiftd;
+    case 0x1a5: /* shld cl */
+        op = 0;
+        shift = 0;
+        goto do_shiftd;
+    case 0x1ac: /* shrd imm */
+        op = 1;
+        shift = 1;
+        goto do_shiftd;
+    case 0x1ad: /* shrd cl */
+        op = 1;
+        shift = 0;
+    do_shiftd:
+        ot = dflag;
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        rm = (modrm & 7) | REX_B(s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        if (mod != 3) {
+            gen_lea_modrm(env, s, modrm);
+            opreg = OR_TMP0;
+        } else {
+            opreg = rm;
+        }
+        gen_op_mov_v_reg(s, ot, s->T1, reg);
+
+        if (shift) {
+            TCGv imm = tcg_const_tl(x86_ldub_code(env, s));
+            gen_shiftd_rm_T1(s, ot, opreg, op, imm);
+            tcg_temp_free(imm);
+        } else {
+            gen_shiftd_rm_T1(s, ot, opreg, op, cpu_regs[R_ECX]);
+        }
+        break;
+
+        /************************/
+        /* floats */
+    case 0xd8 ... 0xdf:
+        {
+            bool update_fip = true;
+
+            if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
+                /* if CR0.EM or CR0.TS are set, generate an FPU exception */
+                /* XXX: what to do if illegal op ? */
+                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                break;
+            }
+            modrm = x86_ldub_code(env, s);
+            mod = (modrm >> 6) & 3;
+            rm = modrm & 7;
+            op = ((b & 7) << 3) | ((modrm >> 3) & 7);
+            if (mod != 3) {
+                /* memory op */
+                AddressParts a = gen_lea_modrm_0(env, s, modrm);
+                TCGv ea = gen_lea_modrm_1(s, a);
+                TCGv last_addr = tcg_temp_new();
+                bool update_fdp = true;
+
+                tcg_gen_mov_tl(last_addr, ea);
+                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
+
+                switch (op) {
+                case 0x00 ... 0x07: /* fxxxs */
+                case 0x10 ... 0x17: /* fixxxl */
+                case 0x20 ... 0x27: /* fxxxl */
+                case 0x30 ... 0x37: /* fixxx */
+                    {
+                        int op1;
+                        op1 = op & 7;
+
+                        switch (op >> 4) {
+                        case 0:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 1:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 2:
+                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEUQ);
+                            gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
+                            break;
+                        case 3:
+                        default:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LESW);
+                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        }
+
+                        gen_helper_fp_arith_ST0_FT0(op1);
+                        if (op1 == 3) {
+                            /* fcomp needs pop */
+                            gen_helper_fpop(cpu_env);
+                        }
+                    }
+                    break;
+                case 0x08: /* flds */
+                case 0x0a: /* fsts */
+                case 0x0b: /* fstps */
+                case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
+                case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
+                case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
+                    switch (op & 7) {
+                    case 0:
+                        switch (op >> 4) {
+                        case 0:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 1:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 2:
+                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEUQ);
+                            gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
+                            break;
+                        case 3:
+                        default:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LESW);
+                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        }
+                        break;
+                    case 1:
+                        /* XXX: the corresponding CPUID bit must be tested ! */
+                        switch (op >> 4) {
+                        case 1:
+                            gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 2:
+                            gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
+                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEUQ);
+                            break;
+                        case 3:
+                        default:
+                            gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUW);
+                            break;
+                        }
+                        gen_helper_fpop(cpu_env);
+                        break;
+                    default:
+                        switch (op >> 4) {
+                        case 0:
+                            gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 1:
+                            gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 2:
+                            gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
+                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEUQ);
+                            break;
+                        case 3:
+                        default:
+                            gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUW);
+                            break;
+                        }
+                        if ((op & 7) == 3) {
+                            gen_helper_fpop(cpu_env);
+                        }
+                        break;
+                    }
+                    break;
+                case 0x0c: /* fldenv mem */
+                    gen_helper_fldenv(cpu_env, s->A0,
+                                      tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x0d: /* fldcw mem */
+                    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    gen_helper_fldcw(cpu_env, s->tmp2_i32);
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x0e: /* fnstenv mem */
+                    gen_helper_fstenv(cpu_env, s->A0,
+                                      tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x0f: /* fnstcw mem */
+                    gen_helper_fnstcw(s->tmp2_i32, cpu_env);
+                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x1d: /* fldt mem */
+                    gen_helper_fldt_ST0(cpu_env, s->A0);
+                    break;
+                case 0x1f: /* fstpt mem */
+                    gen_helper_fstt_ST0(cpu_env, s->A0);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x2c: /* frstor mem */
+                    gen_helper_frstor(cpu_env, s->A0,
+                                      tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x2e: /* fnsave mem */
+                    gen_helper_fsave(cpu_env, s->A0,
+                                     tcg_const_i32(dflag - 1));
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x2f: /* fnstsw mem */
+                    gen_helper_fnstsw(s->tmp2_i32, cpu_env);
+                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    update_fip = update_fdp = false;
+                    break;
+                case 0x3c: /* fbld */
+                    gen_helper_fbld_ST0(cpu_env, s->A0);
+                    break;
+                case 0x3e: /* fbstp */
+                    gen_helper_fbst_ST0(cpu_env, s->A0);
+                    cpu_env);
+                    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                        s->mem_index, MO_LEUQ);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                default:
+                    goto unknown_op;
+                }
+
+                if (update_fdp) {
+                    int last_seg = s->override >= 0 ? s->override : a.def_seg;
+
+                    tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                                   offsetof(CPUX86State,
+                                            segs[last_seg].selector));
+                    tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
+                                     offsetof(CPUX86State, fpds));
+                    tcg_gen_st_tl(last_addr, cpu_env,
+                                  offsetof(CPUX86State, fpdp));
+                }
+                tcg_temp_free(last_addr);
+            } else {
+                /* register float ops */
+                opreg = rm;
+
+                switch (op) {
+                case 0x08: /* fld sti */
+                    gen_helper_fpush(cpu_env);
+                    gen_helper_fmov_ST0_STN(cpu_env,
+                                            tcg_const_i32((opreg + 1) & 7));
+                    break;
+                case 0x09: /* fxchg sti */
+                case 0x29: /* fxchg4 sti, undocumented op */
+                case 0x39: /* fxchg7 sti, undocumented op */
+                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                    break;
+                case 0x0a: /* grp d9/2 */
+                    switch (rm) {
+                    case 0: /* fnop */
+                        /* check exceptions (FreeBSD FPU probe) */
+                        gen_helper_fwait(cpu_env);
+                        update_fip = false;
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x0c: /* grp d9/4 */
+                    switch (rm) {
+                    case 0: /* fchs */
+                        gen_helper_fchs_ST0(cpu_env);
+                        break;
+                    case 1: /* fabs */
+                        gen_helper_fabs_ST0(cpu_env);
+                        break;
+                    case 4: /* ftst */
+                        gen_helper_fldz_FT0(cpu_env);
+                        gen_helper_fcom_ST0_FT0(cpu_env);
+                        break;
+                    case 5: /* fxam */
+                        gen_helper_fxam_ST0(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x0d: /* grp d9/5 */
+                    {
+                        switch (rm) {
+                        case 0:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fld1_ST0(cpu_env);
+                            break;
+                        case 1:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldl2t_ST0(cpu_env);
+                            break;
+                        case 2:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldl2e_ST0(cpu_env);
+                            break;
+                        case 3:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldpi_ST0(cpu_env);
+                            break;
+                        case 4:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldlg2_ST0(cpu_env);
+                            break;
+                        case 5:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldln2_ST0(cpu_env);
+                            break;
+                        case 6:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldz_ST0(cpu_env);
+                            break;
+                        default:
+                            goto unknown_op;
+                        }
+                    }
+                    break;
+                case 0x0e: /* grp d9/6 */
+                    switch (rm) {
+                    case 0: /* f2xm1 */
+                        gen_helper_f2xm1(cpu_env);
+                        break;
+                    case 1: /* fyl2x */
+                        gen_helper_fyl2x(cpu_env);
+                        break;
+                    case 2: /* fptan */
+                        gen_helper_fptan(cpu_env);
+                        break;
+                    case 3: /* fpatan */
+                        gen_helper_fpatan(cpu_env);
+                        break;
+                    case 4: /* fxtract */
+                        gen_helper_fxtract(cpu_env);
+                        break;
+                    case 5: /* fprem1 */
+                        gen_helper_fprem1(cpu_env);
+                        break;
+                    case 6: /* fdecstp */
+                        gen_helper_fdecstp(cpu_env);
+                        break;
+                    default:
+                    case 7: /* fincstp */
+                        gen_helper_fincstp(cpu_env);
+                        break;
+                    }
+                    break;
+                case 0x0f: /* grp d9/7 */
+                    switch (rm) {
+                    case 0: /* fprem */
+                        gen_helper_fprem(cpu_env);
+                        break;
+                    case 1: /* fyl2xp1 */
+                        gen_helper_fyl2xp1(cpu_env);
+                        break;
+                    case 2: /* fsqrt */
+                        gen_helper_fsqrt(cpu_env);
+                        break;
+                    case 3: /* fsincos */
+                        gen_helper_fsincos(cpu_env);
+                        break;
+                    case 5: /* fscale */
+                        gen_helper_fscale(cpu_env);
+                        break;
+                    case 4: /* frndint */
+                        gen_helper_frndint(cpu_env);
+                        break;
+                    case 6: /* fsin */
+                        gen_helper_fsin(cpu_env);
+                        break;
+                    default:
+                    case 7: /* fcos */
+                        gen_helper_fcos(cpu_env);
+                        break;
+                    }
+                    break;
+                case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
+                case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
+                case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
+                    {
+                        int op1;
+
+                        op1 = op & 7;
+                        if (op >= 0x20) {
+                            gen_helper_fp_arith_STN_ST0(op1, opreg);
+                            if (op >= 0x30) {
+                                gen_helper_fpop(cpu_env);
+                            }
+                        } else {
+                            gen_helper_fmov_FT0_STN(cpu_env,
+                                                    tcg_const_i32(opreg));
+                            gen_helper_fp_arith_ST0_FT0(op1);
+                        }
+                    }
+                    break;
+                case 0x02: /* fcom */
+                case 0x22: /* fcom2, undocumented op */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcom_ST0_FT0(cpu_env);
+                    break;
+                case 0x03: /* fcomp */
+                case 0x23: /* fcomp3, undocumented op */
+                case 0x32: /* fcomp5, undocumented op */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcom_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x15: /* da/5 */
+                    switch (rm) {
+                    case 1: /* fucompp */
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fucom_ST0_FT0(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x1c:
+                    switch (rm) {
+                    case 0: /* feni (287 only, just do nop here) */
+                        break;
+                    case 1: /* fdisi (287 only, just do nop here) */
+                        break;
+                    case 2: /* fclex */
+                        gen_helper_fclex(cpu_env);
+                        update_fip = false;
+                        break;
+                    case 3: /* fninit */
+                        gen_helper_fninit(cpu_env);
+                        update_fip = false;
+                        break;
+                    case 4: /* fsetpm (287 only, just do nop here) */
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x1d: /* fucomi */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucomi_ST0_FT0(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x1e: /* fcomi */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcomi_ST0_FT0(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x28: /* ffree sti */
+                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    break;
+                case 0x2a: /* fst sti */
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    break;
+                case 0x2b: /* fstp sti */
+                case 0x0b: /* fstp1 sti, undocumented op */
+                case 0x3a: /* fstp8 sti, undocumented op */
+                case 0x3b: /* fstp9 sti, undocumented op */
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x2c: /* fucom st(i) */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucom_ST0_FT0(cpu_env);
+                    break;
+                case 0x2d: /* fucomp st(i) */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucom_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x33: /* de/3 */
+                    switch (rm) {
+                    case 1: /* fcompp */
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fcom_ST0_FT0(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x38: /* ffreep sti, undocumented op */
+                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x3c: /* df/4 */
+                    switch (rm) {
+                    case 0:
+                        gen_helper_fnstsw(s->tmp2_i32, cpu_env);
+                        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+                        gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x3d: /* fucomip */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucomi_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x3e: /* fcomip */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcomi_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x10 ... 0x13: /* fcmovxx */
+                case 0x18 ... 0x1b:
+                    {
+                        int op1;
+                        TCGLabel *l1;
+                        static const uint8_t fcmov_cc[8] = {
+                            (JCC_B << 1),
+                            (JCC_Z << 1),
+                            (JCC_BE << 1),
+                            (JCC_P << 1),
+                        };
+
+                        if (!(s->cpuid_features & CPUID_CMOV)) {
+                            goto illegal_op;
+                        }
+                        op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
+                        l1 = gen_new_label();
+                        gen_jcc1_noeob(s, op1, l1);
+                        gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                        gen_set_label(l1);
+                    }
+                    break;
+                default:
+                    goto unknown_op;
+                }
+            }
+
+            if (update_fip) {
+                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, segs[R_CS].selector));
+                tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
+                                 offsetof(CPUX86State, fpcs));
+                tcg_gen_st_tl(tcg_constant_tl(pc_start - s->cs_base),
+                              cpu_env, offsetof(CPUX86State, fpip));
+            }
+        }
+        break;
+        /************************/
+        /* string ops */
+
+    case 0xa4: /* movsS */
+    case 0xa5:
+        ot = mo_b_d(b, dflag);
+        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+            gen_repz_movs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+        } else {
+            gen_movs(s, ot);
+        }
+        break;
+
+    case 0xaa: /* stosS */
+    case 0xab:
+        ot = mo_b_d(b, dflag);
+        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+            gen_repz_stos(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+        } else {
+            gen_stos(s, ot);
+        }
+        break;
+    case 0xac: /* lodsS */
+    case 0xad:
+        ot = mo_b_d(b, dflag);
+        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+            gen_repz_lods(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+        } else {
+            gen_lods(s,             gen_scas(s, ot);
+        }
+        break;
+
+    case 0xa6: /* cmpsS */
+    case 0xa7:
+        ot = mo_b_d(b, dflag);
+        if (prefixes & PREFIX_REPNZ) {
+            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
+        } else if (prefixes & PREFIX_REPZ) {
+            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
+        } else {
+            gen_cmps(s, ot);
+        }
+        break;
+    case 0x6c: /* insS */
+    case 0x6d:
+        ot = mo_b_d32(b, dflag);
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32,
+                          SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
+            break;
+        }
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+            gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            /* jump generated by gen_repz_ins */
+        } else {
+            gen_ins(s, ot);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_jmp(s, s->pc - s->cs_base);
+            }
+        }
+        break;
+    case 0x6e: /* outsS */
+    case 0x6f:
+        ot = mo_b_d32(b, dflag);
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_STR_MASK)) {
+            break;
+        }
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
+            gen_repz_outs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
+            /* jump generated by gen_repz_outs */
+        } else {
+            gen_outs(s, ot);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_jmp(s, s->pc - s->cs_base);
+            }
+        }
+        break;
+
+        /************************/
+        /* port I/O */
+
+    case 0xe4:
+    case 0xe5:
+        ot = mo_b_d32(b, dflag);
+        val = x86_ldub_code(env, s);
+        tcg_gen_movi_i32(s->tmp2_i32, val);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
+            break;
+        }
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        gen_helper_in_func(ot, s->T1, s->tmp2_i32);
+        gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
+        gen_bpt_io(s, s->tmp2_i32, ot);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_jmp(s, s->pc - s->cs_base);
+        }
+        break;
+    case 0xe6:
+    case 0xe7:
+        ot = mo_b_d32(b, dflag);
+        val = x86_ldub_code(env, s);
+        tcg_gen_movi_i32(s->tmp2_i32, val);
+        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
+            break;
+        }
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
+        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+        gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
+        gen_bpt_io(s, s->tmp2_i32, ot);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_jmp(s, s->pc - s->cs_base);
+        }
+        break;
+    case 0xec:
+    case 0xed:
+        ot = mo_b_d32(b, dflag);
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
+            break;
+        }
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        gen_helper_in_func(ot, s->T1, s->tmp2_i32);
+        gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
+        gen_bpt_io(s, s->tmp2_i32, ot);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_jmp(s, s->pc - s->cs_base);
+        }
+        break;
+    case 0xee:
+    case 0xef:
+        ot = mo_b_d32(b, dflag);
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
+            break;
+        }
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
+        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+        gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
+        gen_bpt_io(s, s->tmp2_i32, ot);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_jmp(s, s->pc - s->cs_base);
+        }
+        break;
+
+        /************************/
+        /* control */
+    case 0xc2: /* ret im */
+        val = x86_ldsw_code(env, s);
+        ot = gen_pop_T0(s);
+        gen_stack_update(s, val + (1 << ot));
+        /* Note that gen_pop_T0 uses a zero-extending load.  */
+        gen_op_jmp_v(s->T0);
+        gen_bnd_jmp(s);
+        gen_jr(s, s->T0);
+        break;
+    case 0xc3: /* ret */
+        ot = gen_pop_T0(s);
+        gen_pop_update(s, ot);
+        /* Note that gen_pop_T0 uses a zero-extending load.  */
+        gen_op_jmp_v(s->T0);
+        gen_bnd_jmp(s);
+        gen_jr(s, s->T0);
+        break;
+    case 0xca: /* lret im */
+        val = x86_ldsw_code(env, s);
+    do_lret:
+        if (PE(s) && !VM86(s)) {
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
+                                      tcg_const_i32(val));
+        } else {
+            gen_stack_A0(s);
+            /* pop offset */
+            gen_op_ld_v(s, dflag, s->T0, s->A0);
+            /* NOTE: keeping EIP updated is not a problem in case of
+               exception */
+            gen_op_jmp_v(s->T0);
+            /* pop selector */
+            gen_add_A0_im(s, 1 << dflag);
+            gen_op_ld_v(s, dflag, s->T0, s->A0);
+            gen_op_movl_seg_T0_vm(s, R_CS);
+            /* add stack offset */
+            gen_stack_update(s, val + (2 << dflag));
+        }
+        gen_eob(s);
+        break;
+    case 0xcb: /* lret */
+        val = 0;
+        goto do_lret;
+    case 0xcf: /* iret */
+        gen_svm_check_intercept(s, SVM_EXIT_IRET);
+        if (!PE(s) || VM86(s)) {
+            /* real mode or vm86 mode */
+            if (!check_vm86_iopl(s)) {
+                break;
+            }
+            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
+        } else {
+            gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
+                                      tcg_const_i32(s->pc - s->cs_base));
+        }
+        set_cc_op(s, CC_OP_EFLAGS);
+        gen_eob(s);
+        break;
+    case 0xe8: /* call im */
+        {
+            if (dflag != MO_16) {
+                tval = (int32_t)insn_get(env, s, MO_32);
+            } else {
+                tval = (int16_t)insn_get(env, s, MO_16);
+            }
+            next_eip = s->pc - s->cs_base;
+            tval += next_eip;
+            if (dflag == MO_16) {
+                tval &= 0xffff;
+            } else if (!CODE64(s)) {
+                tval &= 0xffffffff;
+            }
+            tcg_gen_movi_tl(s->T0, next_eip);
+            gen_push_v(s, s->T0);
+            gen_bnd_jmp(s);
+            gen_jmp(s, tval);
+        }
+        break;
+    case 0x9a: /* lcall im */
+        {
+            unsigned int selector, offset;
+
+            if (CODE64(s))
+                goto illegal_op;
+            ot = dflag;
+            offset = insn_get(env, s, ot);
+            selector = insn_get(env, s, MO_16);
+
+            tcg_gen_movi_tl(s->T0, selector);
+            tcg_gen_movi_tl(s->T1, offset);
+        }
+        goto do_lcall;
+    case 0xe9: /* jmp im */
+        if (dflag != MO_16) {
+            tval = (int32_t)insn_get(env, s, MO_32);
+        } else {
+            tval = (int16_t)insn_get(env, s, MO_16);
+        }
+        tval += s->pc - s->cs_base;
+        if (dflag == MO_16) {
+            tval &= 0xffff;
+        } else if (!CODE64(s)) {
+            tval &= 0xffffffff;
+        }
+        gen_bnd_jmp(s);
+        gen_jmp(s, tval);
+        break;
+    case 0xea: /* ljmp im */
+        {
+            unsigned int selector, offset;
+
+            if (CODE64(s))
+                goto illegal_op;
+            ot = dflag;
+            offset = insn_get(env, s, ot);
+            selector = insn_get(env, s, MO_16);
+
+            tcg_gen_movi_tl(s->T0, selector);
+            tcg_gen_movi_tl(s->T1, offset);
+        }
+        goto do_ljmp;
+    case 0xeb: /* jmp Jb */
+        tval = (int8_t)insn_get(env, s, MO_8);
+        tval += s->pc - s->cs_base;
+        if (dflag == MO_16) {
+            tval &= 0xffff;
+        }
+        gen_jmp(s, tval);
+        break;
+    case 0x70 ... 0x7f: /* jcc Jb */
+        tval = (int8_t)insn_get(env, s, MO_8);
+        goto do_jcc;
+    case 0x180 ... 0x18f: /* jcc Jv */
+        if (dflag != MO_16) {
+            tval = (int32_t)insn_get(env, s, MO_32);
+        } else {
+            tval = (int16_t)insn_get(env, s, MO_16);
+        }
+    do_jcc:
+        next_eip = s->pc - s->cs_base;
+        tval += next_eip;
+        if (dflag == MO_16) {
+            tval &= 0xffff;
+        }
+        gen_bnd_jmp(s);
+        gen_jcc(s, b, tval, next_eip);
+        break;
+
+    case 0x190 ... 0x19f: /* setcc Gv */
+        modrm = x86_ldub_code(env, s);
+        gen_setcc1(s, b, s->T0);
+        gen_ldst_modrm(env, s, modrm, MO_8, OR_TMP0, 1);
+        break;
+    case 0x140 ... 0x14f: /* cmov Gv, Ev */
+        if (!(s->cpuid_features & CPUID_CMOV)) {
+            goto illegal_op;
+        }
+        ot = dflag;
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        gen_cmovcc1(env, s, ot, b, modrm, reg);
+        break;
+
+        /************************/
+        /* flags */
+    case 0x9c: /* pushf */
+        gen_svm_check_intercept(s, SVM_EXIT_PUSHF);
+        if (check_vm86_iopl(s)) {
+            gen_update_cc_op(s);
+            gen_helper_read_eflags(s->T0, cpu_env);
+            gen_push_v(s, s->T0);
+        }
+        break;
+    case 0x9d: /* popf */
+        gen_svm_check_intercept(s, SVM_EXIT_POPF);
+        if (check_vm86_iopl(s)) {
+            ot = gen_pop_T0(s);
+            if (CPL(s) == 0) {
+                if (dflag != MO_16) {
+                    gen_helper_write_eflags(cpu_env, s->T0,
+                                            tcg_const_i32((TF_MASK | AC_MASK |
+                                                           ID_MASK | NT_MASK |
+                                                           IF_MASK |
+                                                           IOPL_MASK)));
+                } else {
+                    gen_helper_write_eflags(cpu_env, s->T0,
+                                            tcg_const_i32((TF_MASK | AC_MASK |
+                                                           ID_MASK | NT_MASK |
+                                                           IF_MASK | IOPL_MASK)
+                                                          & 0xffff));
+                }
+            } else {
+                if (CPL(s) <= IOPL(s)) {
+                    if (dflag != MO_16) {
+                        gen_helper_write_eflags(cpu_env, s->T0,
+                                                tcg_const_i32((TF_MASK |
+                                                               AC_MASK |
+                                                               ID_MASK |
+                                                               NT_MASK |
+                                                               IF_MASK)));
+                    } else {
+                        gen_helper_write_eflags(cpu_env, s->T0,
+                                                tcg_const_i32((TF_MASK |
+                                                               AC_MASK |
+                                                               ID_MASK |
+                                                               NT_MASK |
+                                                               IF_MASK)
+                                                              & 0xffff));
+                    }
+                } else {
+                    if (dflag != MO_16) {
+                        gen_helper_write_eflags(cpu_env, s->T0,
+                                           tcg_const_i32((TF_MASK | AC_MASK |
+                                                          ID_MASK | NT_MASK)));
+                    } else {
+                        gen_helper_write_eflags(cpu_env, s->T0,
+                                           tcg_const_i32((TF_MASK | AC_MASK |
+                                                          ID_MASK | NT_MASK)
+                                                         & 0xffff));
+                    }
+                }
+            }
+            gen_pop_update(s, ot);
+            set_cc_op(s, CC_OP_EFLAGS);
+            /* abort translation because TF/AC flag may change */
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+        }
+        break;
+    case 0x9e: /* sahf */
+        if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
+            goto illegal_op;
+        gen_op_mov_v_reg(s, MO_8, s->T0, R_AH);
+        gen_compute_eflags(s);
+        tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, CC_O);
+        tcg_gen_andi_tl(s->T0, s->T0, CC_S | CC_Z | CC_A | CC_P | CC_C);
+        tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, s->T0);
+        break;
+    case 0x9f: /* lahf */
+        if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
+            goto illegal_op;
+        gen_compute_eflags(s);
+        /* Note: gen_compute_eflags() only gives the condition codes */
+        tcg_gen_ori_tl(s->T0, cpu_cc_src, 0x02);
+        gen_op_mov_reg_v(s, MO_8, R_AH, s->T0);
+        break;
+    case 0xf5: /* cmc */
+        gen_compute_eflags(s);
+        tcg_gen_xori_tl(cpu_cc_src, cpu_cc_src, CC_C);
+        break;
+    case 0xf8: /* clc */
+        gen_compute_eflags(s);
+        tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_C);
+        break;
+    case 0xf9: /* stc */
+        gen_compute_eflags(s);
+        tcg_gen_ori_tl(cpu_cc_src, cpu_cc_src, CC_C);
+        break;
+    case 0xfc: /* cld */
+        tcg_gen_movi_i32(s->tmp2_i32, 1);
+        tcg_gen_st_i32(s->tmp2_i32, cpu_env, offsetof(CPUX86State, df));
+        break;
+    case 0xfd: /* std */
+        tcg_gen_movi_i32(s->tmp2_i32, -1);
+        tcg_gen_st_i32(s->tmp2_i32, cpu_env, offsetof(CPUX86State, df));
+        break;
+
+        /************************/
+        /* bit operations */
+    case 0x1ba: /* bt/bts/btr/btc Gv, im */
+        ot = dflag;
+        modrm = x86_ldub_code(env, s);
+        op = (modrm >> 3) & 7;
+        mod = (modrm >> 6) & 3;
+        rm = (modrm & 7) | REX_B(s);
+        if (mod != 3) {
+            s->rip_offset = 1;
+            gen_lea_modrm(env, s, modrm);
+            if (!(s->prefix & PREFIX_LOCK)) {
+                gen_op_ld_v(s, ot, s->T0, s->A0);
+            }
+        } else {
+            gen_op_mov_v_reg(s, ot, s->T0, rm);
+        }
+        /* load shift */
+        val = x86_ldub_code(env, s);
+        tcg_gen_movi_tl(s->T1, val);
+        if (op < 4)
+            goto unknown_op;
+        op -= 4;
+        goto bt_op;
+    case 0x1a3: /* bt Gv, Ev */
+        op = 0;
+        goto do_btx;
+    case 0x1ab: /* bts */
+        op = 1;
+        goto do_btx;
+    case 0x1b3: /* btr */
+        op = 2;
+        goto do_btx;
+    case 0x1bb: /* btc */
+        op = 3;
+    do_btx:
+        ot = dflag;
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+   lea_modrm_1(s, a), s->tmp0);
+            gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
+            if (!(s->prefix & PREFIX_LOCK)) {
+                gen_op_ld_v(s, ot, s->T0, s->A0);
+            }
+        } else {
+            gen_op_mov_v_reg(s, ot, s->T0, rm);
+        }
+    bt_op:
+        tcg_gen_andi_tl(s->T1, s->T1, (1 << (3 + ot)) - 1);
+        tcg_gen_movi_tl(s->tmp0, 1);
+        tcg_gen_shl_tl(s->tmp0, s->tmp0, s->T1);
+        if (s->prefix & PREFIX_LOCK) {
+            switch (op) {
+            case 0: /* bt */
+                /* Needs no atomic ops; we surpressed the normal
+                   memory load for LOCK above so do it now.  */
+                gen_op_ld_v(s, ot, s->T0, s->A0);
+                break;
+            case 1: /* bts */
+                tcg_gen_atomic_fetch_or_tl(s->T0, s->A0, s->tmp0,
+                                           s->mem_index, ot | MO_LE);
+                break;
+            case 2: /* btr */
+                tcg_gen_not_tl(s->tmp0, s->tmp0);
+                tcg_gen_atomic_fetch_and_tl(s->T0, s->A0, s->tmp0,
+                                            s->mem_index, ot | MO_LE);
+                break;
+            default:
+            case 3: /* btc */
+                tcg_gen_atomic_fetch_xor_tl(s->T0, s->A0, s->tmp0,
+                                            s->mem_index, ot | MO_LE);
+                break;
+            }
+            tcg_gen_shr_tl(s->tmp4, s->T0, s->T1);
+        } else {
+            tcg_gen_shr_tl(s->tmp4, s->T0, s->T1);
+            switch (op) {
+            case 0: /* bt */
+                /* Data already loaded; nothing to do.  */
+                break;
+            case 1: /* bts */
+                tcg_gen_or_tl(s->T0, s->T0, s->tmp0);
+                break;
+            case 2: /* btr */
+                tcg_gen_andc_tl(s->T0, s->T0, s->tmp0);
+                break;
+            default:
+            case 3: /* btc */
+                tcg_gen_xor_tl(s->T0, s->T0, s->tmp0);
+                break;
+            }
+            if (op != 0) {
+                if (mod != 3) {
+                    gen_op_st_v(s, ot, s->T0, s->A0);
+                } else {
+                    gen_op_mov_reg_v(s, ot, rm, s->T0);
+                }
+            }
+        }
+
+        /* Delay all CC updates until after the store above.  Note that
+           C is the result of the test, Z is unchanged, and the others
+           are all undefined.  */
+        switch (s->cc_op) {
+        case CC_OP_MULB ... CC_OP_MULQ:
+        case CC_OP_ADDB ... CC_OP_ADDQ:
+        case CC_OP_ADCB ... CC_OP_ADCQ:
+        case CC_OP_SUBB ... CC_OP_SUBQ:
+        case CC_OP_SBBB ... CC_OP_SBBQ:
+        case CC_OP_LOGICB ... CC_OP_LOGICQ:
+        case CC_OP_INCB ... CC_OP_INCQ:
+        case CC_OP_DECB ... CC_OP_DECQ:
+        case CC_OP_SHLB ... CC_OP_SHLQ:
+        case CC_OP_SARB ... CC_OP_SARQ:
+        case CC_OP_BMILGB ... CC_OP_BMILGQ:
+            /* Z was going to be computed from the non-zero status of CC_DST.
+               We can get that same Z value (and the new C value) by leaving
+               CC_DST alone, setting CC_SRC, and using a CC_OP_SAR of the
+               same width.  */
+            tcg_gen_mov_tl(cpu_cc_src, s->tmp4);
+            set_cc_op(s, ((s->cc_op - CC_OP_MULB) & 3) + CC_OP_SARB);
+            break;
+        default:
+            /* Otherwise, generate EFLAGS and replace the C bit.  */
+            gen_compute_eflags(s);
+            tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, s->tmp4,
+                               ctz32(CC_C), 1);
+            break;
+        }
+        break;
+    case 0x1bc: /* bsf / tzcnt */
+    case 0x1bd: /* bsr / lzcnt */
+        ot = dflag;
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+        gen_extu(ot, s->T0);
+
+        /* Note that lzcnt and tzcnt are in different extensions.  */
+        if ((prefixes & PREFIX_REPZ)
+            && (b & 1
+                ? s->cpuid_ext3_features & CPUID_EXT3_ABM
+                : s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)) {
+            int size = 8 << ot;
+            /* For lzcnt/tzcnt, C bit is defined related to the input. */
+            tcg_gen_mov_tl(cpu_cc_src, s->T0);
+            if (b & 1) {
+                /* For lzcnt, reduce the target_ulong result by the
+                   number of zeros that we expect to find at the top.  */
+                tcg_gen_clzi_tl(s->T0, s->T0, TARGET_LONG_BITS);
+                tcg_gen_subi_tl(s->T0, s->T0, TARGET_LONG_BITS - size);
+            } else {
+                /* For tzcnt, a zero input must return the operand size.  */
+                tcg_gen_ctzi_tl(s->T0, s->T0, size);
+            }
+            /* For lzcnt/tzcnt, Z bit is defined related to the result.  */
+            gen_op_update1_cc(s);
+            set_cc_op(s, CC_OP_BMILGB + ot);
+        } else {
+            /* For bsr/bsf, only the Z bit is defined and it is related
+               to the input and not the result.  */
+            tcg_gen_mov_tl(cpu_cc_dst, s->T0);
+            set_cc_op(s, CC_OP_LOGICB + ot);
+
+            /* ??? The manual says that the output is undefined when the
+               input is zero, but real hardware leaves it unchanged, and
+               real programs appear to depend on that.  Accomplish this
+               by passing the output as the value to return upon zero.  */
+            if (b & 1) {
+                /* For bsr, return the bit index of the first 1 bit,
+                   not the count of leading zeros.  */
+                tcg_gen_xori_tl(s->T1, cpu_regs[reg], TARGET_LONG_BITS - 1);
+                tcg_gen_clz_tl(s->T0, s->T0, s->T1);
+                tcg_gen_xori_tl(s->T0, s->T0, TARGET_LONG_BITS - 1);
+            } else {
+                tcg_gen_ctz_tl(s->T0, s->T0, cpu_regs[reg]);
+            }
+        }
+        gen_op_mov_reg_v(s, ot, reg, s->T0);
+        break;
+        /************************/
+        /* bcd */
+    case 0x27: /* daa */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_update_cc_op(s);
+        gen_helper_daa(cpu_env);
+        set_cc_op(s, CC_OP_EFLAGS);
+        break;
+    case 0x2f: /* das */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_update_cc_op(s);
+        gen_helper_das(cpu_env);
+        set_cc_op(s, CC_OP_EFLAGS);
+        break;
+    case 0x37: /* aaa */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_update_cc_op(s);
+        gen_helper_aaa(cpu_env);
+        set_cc_op(s, CC_OP_EFLAGS);
+        break;
+    case 0x3f: /* aas */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_update_cc_op(s);
+        gen_helper_aas(cpu_env);
+        set_cc_op(s, CC_OP_EFLAGS);
+        break;
+    case 0xd4: /* aam */
+        if (CODE64(s))
+            goto illegal_op;
+        val = x86_ldub_code(env, s);
+        if (val == 0) {
+            gen_exception(s, EXCP00_DIVZ, pc_start - s->cs_base);
+        } else {
+            gen_helper_aam(cpu_env, tcg_const_i32(val));
+            set_cc_op(s, CC_OP_LOGICB);
+        }
+        break;
+    case 0xd5: /* aad */
+        if (CODE64(s))
+            goto illegal_op;
+        val = x86_ldub_code(env, s);
+        gen_helper_aad(cpu_env, tcg_const_i32(val));
+        set_cc_op(s, CC_OP_LOGICB);
+        break;
+        /************************/
+        /* misc */
+    case 0x90: /* nop */
+        /* XXX: correct lock test for all insn */
+        if (prefixes & PREFIX_LOCK) {
+            goto illegal_op;
+        }
+        /* If REX_B is set, then this is xchg eax, r8d, not a nop.  */
+        if (REX_B(s)) {
+            goto do_xchg_reg_eax;
+        }
+        if (prefixes & PREFIX_REPZ) {
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - pc_start));
+            s->base.is_jmp = DISAS_NORETURN;
+        }
+        break;
+    case 0x9b: /* fwait */
+        if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
+            (HF_MP_MASK | HF_TS_MASK)) {
+            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+        } else {
+            gen_helper_fwait(cpu_env);
+        }
+        break;
+    case 0xcc: /* int3 */
+        gen_interrupt(s, EXCP03_INT3, pc_start - s->cs_base, s->pc - s->cs_base);
+        break;
+    case 0xcd: /* int N */
+        val = x86_ldub_code(env, s);
+        if (check_vm86_iopl(s)) {
+            gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
+        }
+        break;
+    case 0xce: /* into */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_update_cc_op(s);
+        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_helper_into(cpu_env, tcg_const_i32(s->pc - pc_start));
+        break;
+#ifdef WANT_ICEBP
+    case 0xf1: /* icebp (undocumented, exits to external debugger) */
+        gen_svm_check_intercept(s, SVM_EXIT_ICEBP);
+        gen_debug(s);
+        break;
+#endif
+    case 0xfa: /* cli */
+        if (check_iopl(s)) {
+            gen_helper_cli(cpu_env);
+        }
+        break;
+    case 0xfb: /* sti */
+        if (check_iopl(s)) {
+            gen_helper_sti(cpu_env);
+            /* interruptions are enabled only the first insn after sti */
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob_inhibit_irq(s, true);
+        }
+        break;
+    case 0x62: /* bound */
+        if (CODE64(s))
+            goto illegal_op;
+        ot = dflag;
+        modrm = x86_ldub_code(env, s);
+        reg = (modrm >> 3) & 7;
+        mod = (modrm >> 6) & 3;
+        if (mod == 3)
+            goto illegal_op;
+        gen_op_mov_v_reg(s, ot, s->T0, reg);
+        gen_lea_modrm(env, s, modrm);
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        if (ot == MO_16) {
+            gen_helper_boundw(cpu_env, s->A0, s->tmp2_i32);
+        } else {
+            gen_helper_boundl(cpu_env, s->A0, s->tmp2_i32);
+        }
+        break;
+    case 0x1c8 ... 0x1cf: /* bswap reg */
+        reg = (b & 7) | REX_B(s);
+#ifdef TARGET_X86_64
+        if (dflag == MO_64) {
+            tcg_gen_bswap64_i64(cpu_regs[reg], cpu_regs[reg]);
+            break;
+        }
+#endif
+        tcg_gen_bswap32_tl(cpu_regs[reg], cpu_regs[reg], TCG_BSWAP_OZ);
+        break;
+    case 0xd6: /* salc */
+        if (CODE64(s))
+            goto illegal_op;
+        gen_compute_eflags_c(s, s->T0);
+        tcg_gen_neg_tl(s->T0, s->T0);
+        gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
+        break;
+    case 0xe0: /* loopnz */
+    case 0xe1: /* loopz */
+    case 0xe2: /* loop */
+    case 0xe3: /* jecxz */
+        {
+            TCGLabel *l1, *l2, *l3;
+
+            tval = (int8_t)insn_get(env, s, MO_8);
+            next_eip = s->pc - s->cs_base;
+            tval += next_eip;
+            if (dflag == MO_16) {
+                tval &= 0xffff;
+            }
+
+            l1 = gen_new_label();
+            l2 = gen_new_label();
+            l3 = gen_new_label();
+            gen_update_cc_op(s);
+            b &= 3;
+            switch(b) {
+            case 0: /* loopnz */
+            case 1: /* loopz */
+                gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
+                gen_op_jz_ecx(s, s->aflag, l3);
+                gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
+                break;
+            case 2: /* loop */
+                gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
+                gen_op_jnz_ecx(s, s->aflag, l1);
+                break;
+            default:
+            case 3: /* jcxz */
+                gen_op_jz_ecx(s, s->aflag, l1);
+                break;
+            }
+
+            gen_set_label(l3);
+            gen_jmp_im(s, next_eip);
+            tcg_gen_br(l2);
+
+            gen_set_label(l1);
+            gen_jmp_im(s, tval);
+            gen_set_label(l2);
+            gen_eob(s);
+        }
+        break;
+    case 0x130: /* wrmsr */
+    case 0x132: /* rdmsr */
+        if (check_cpl0(s)) {
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            if (b & 2) {
+                gen_helper_rdmsr(cpu_env);
+            } else {
+                gen_helper_wrmsr(cpu_env);
+                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_eob(s);
+            }
+        }
+        break;
+    case 0x131: /* rdtsc */
+        gen_update_cc_op(s);
+        gen_jmp_im(s, pc_start - s->cs_base);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        gen_helper_rdtsc(cpu_env);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_jmp(s, s->pc - s->cs_base);
+        }
+        break;
+    case 0x133: /* rdpmc */
+        gen_update_cc_op(s);
+        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_helper_rdpmc(cpu_env);
+        s->base.is_jmp = DISAS_NORETURN;
+        break;
+    case 0x134: /* sysenter */
+        /* For Intel SYSENTER is valid on 64-bit */
+        if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
+            goto illegal_op;
+        if (!PE(s)) {
+            gen_exception_gpf(s);
+        } else {
+            gen_helper_sysenter(cpu_env);
+            gen_eob(s);
+        }
+        break;
+    case 0x135: /* sysexit */
+        /* For Intel SYSEXIT is valid on 64-bit */
+        if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
+            goto illegal_op;
+        if (!PE(s)) {
+            gen_exception_gpf(s);
+        } else {
+            gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
+            gen_eob(s);
+        }
+        break;
+#ifdef TARGET_X86_64
+    case 0x105: /* syscall */
+        /* XXX: is it usable in real mode ? */
+        gen_update_cc_op(s);
+        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - pc_start));
+        /* TF handling for the syscall insn is different. The TF bit is  checked
+           after the syscall insn completes. This allows #DB to not be
+           generated after one has entered CPL0 if TF is set in FMASK.  */
+        gen_eob_worker(s, false, true);
+        break;
+    case 0x107: /* sysret */
+        if (!PE(s)) {
+            gen_exception_gpf(s);
+        } else {
+            gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
+            /* condition codes are modified only in long mode */
+            if (LMA(s)) {
+                set_cc_op(s, CC_OP_EFLAGS);
+            }
+            /* TF handling for the sysret insn is different. The TF bit is
+               checked after the sysret insn completes. This allows #DB to be
+               generated "as if" the syscall insn in userspace has just
+               completed.  */
+            gen_eob_worker(s, false, true);
+        }
+        break;
+#endif
+    case 0x1a2: /* cpuid */
+        gen_update_cc_op(s);
+        gen_jmp_im(s, pc_start - s->cs_base);
+        gen_helper_cpuid(cpu_env);
+        break;
+    case 0xf4: /* hlt */
+        if (check_cpl0(s)) {
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
+            s->base.is_jmp = DISAS_NORETURN;
+        }
+        break;
+    case 0x100:
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        op = (modrm >> 3) & 7;
+        switch(op) {
+        case 0: /* sldt */
+            if (!PE(s) || VM86(s))
+                goto illegal_op;
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_LDTR_READ);
+            tcg_gen_ld32u_tl(s->T0, cpu_env,
+                             offsetof(CPUX86State, ldt.sel>tmp2_i32, s->T0);
+                gen_helper_lldt(cpu_env, s->tmp2_i32);
+            }
+            break;
+        case 1: /* str */
+            if (!PE(s) || VM86(s))
+                goto illegal_op;
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_TR_READ);
+            tcg_gen_ld32u_tl(s->T0, cpu_env,
+                             offsetof(CPUX86State, tr.selector));
+            ot = mod == 3 ? dflag : MO_16;
+            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
+            break;
+        case 3: /* ltr */
+            if (!PE(s) || VM86(s))
+                goto illegal_op;
+            if (check_cpl0(s)) {
+                gen_svm_check_intercept(s, SVM_EXIT_TR_WRITE);
+                gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+                gen_helper_ltr(cpu_env, s->tmp2_i32);
+            }
+            break;
+        case 4: /* verr */
+        case 5: /* verw */
+            if (!PE(s) || VM86(s))
+                goto illegal_op;
+            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            gen_update_cc_op(s);
+            if (op == 4) {
+                gen_helper_verr(cpu_env, s->T0);
+            } else {
+                gen_helper_verw(cpu_env, s->T0);
+            }
+            set_cc_op(s, CC_OP_EFLAGS);
+            break;
+        default:
+            goto unknown_op;
+        }
+        break;
+
+    case 0x101:
+        modrm = x86_ldub_code(env, s);
+        switch (modrm) {
+        CASE_MODRM_MEM_OP(0): /* sgdt */
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_GDTR_READ);
+            gen_lea_modrm(env, s, modrm);
+            tcg_gen_ld32u_tl(s->T0,
+                             cpu_env, offsetof(CPUX86State, gdt.limit));
+            gen_op_st_v(s, MO_16, s->T0, s->A0);
+            gen_add_A0_im(s, 2);
+            tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base));
+            if (dflag == MO_16) {
+                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
+            }
+            gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            break;
+
+        case 0xc8: /* monitor */
+            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
+                goto illegal_op;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
+            gen_extu(s->aflag, s->A0);
+            gen_add_A0_ds_seg(s);
+            gen_helper_monitor(cpu_env, s->A0);
+            break;
+
+        case 0xc9: /* mwait */
+            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
+                goto illegal_op;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
+            s->base.is_jmp = DISAS_NORETURN;
+            break;
+
+        case 0xca: /* clac */
+            if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
+                || CPL(s) != 0) {
+                goto illegal_op;
+            }
+            gen_helper_clac(cpu_env);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        case 0xcb: /* stac */
+            if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
+                || CPL(s) != 0) {
+                goto illegal_op;
+            }
+            gen_helper_stac(cpu_env);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        CASE_MODRM_MEM_OP(1): /* sidt */
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_IDTR_READ);
+            gen_lea_modrm(env, s, modrm);
+            tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.limit));
+            gen_op_st_v(s, MO_16, s->T0, s->A0);
+            gen_add_A0_im(s, 2);
+            tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base));
+            if (dflag == MO_16) {
+                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
+            }
+            gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            break;
+
+        case 0xd0: /* xgetbv */
+            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
+                || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
+                                 | PREFIX_REPZ | PREFIX_REPNZ))) {
+                goto illegal_op;
+            }
+            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
+            gen_helper_xgetbv(s->tmp1_i64, cpu_env, s->tmp2_i32);
+            tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], s->tmp1_i64);
+            break;
+
+        case 0xd1: /* xsetbv */
+            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
+                || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
+                                 | PREFIX_REPZ | PREFIX_REPNZ))) {
+                goto illegal_op;
+            }
+            if (!check_cpl0(s)) {
+                break;
+            }
+            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
+                                  cpu_regs[R_EDX]);
+            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
+            gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
+            /* End TB because translation flags may change.  */
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        case 0xd8: /* VMRUN */
+            if (!SVME(s) || !PE(s)) {
+                goto illegal_op;
+            }
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
+                             tcg_const_i32(s->pc - pc_start));
+            tcg_gen_exit_tb(NULL, 0);
+            s->base.is_jmp = DISAS_NORETURN;
+            break;
+
+        case 0xd9: /* VMMCALL */
+            if (!SVME(s)) {
+                goto illegal_op;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_vmmcall(cpu_env);
+            break;
+
+        case 0xda: /* VMLOAD */
+            if (!SVME(s) || !PE(s)) {
+                goto illegal_op;
+            }
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
+            break;
+
+        case 0xdb: /* VMSAVE */
+            if (!SVME(s) || !PE(s)) {
+                goto illegal_op;
+            }
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
+            break;
+
+        case 0xdc: /* STGI */
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+                || !PE(s)) {
+                goto illegal_op;
+            }
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_update_cc_op(s);
+            gen_helper_stgi(cpu_env);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        case 0xdd: /* CLGI */
+            if (!SVME(s) || !PE(s)) {
+                goto illegal_op;
+            }
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_helper_clgi(cpu_env);
+            break;
+
+        case 0xde: /* SKINIT */
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+                || !PE(s)) {
+                goto illegal_op;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_SKINIT);
+            /* If not intercepted, not implemented -- raise #UD. */
+            goto illegal_op;
+
+        case 0xdf: /* INVLPGA */
+            if (!SVME(s) || !PE(s)) {
+                goto illegal_op;
+            }
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_INVLPGA);
+            if (s->aflag == MO_64) {
+                tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
+            } else {
+                tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
+            }
+            gen_helper_flush_page(cpu_env, s->A0);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        CASE_MODRM_MEM_OP(2): /* lgdt */
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_GDTR_WRITE);
+            gen_lea_modrm(env, s, modrm);
+            gen_op_ld_v(s, MO_16, s->T1, s->A0);
+            gen_add_A0_im(s, 2);
+            gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            if (dflag == MO_16) {
+                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
+            }
+            tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base));
+            tcg_gen_st32_tl(s->T1, cpu_env, offsetof(CPUX86State, gdt.limit));
+            break;
+
+        CASE_MODRM_MEM_OP(3): /* lidt */
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_IDTR_WRITE);
+            gen_lea_modrm(env, s, modrm);
+            gen_op_ld_v(s, MO_16, s->T1, s->A0);
+            gen_add_A0_im(s, 2);
+            gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            if (dflag == MO_16) {
+                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
+            }
+            tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base));
+            tcg_gen_st32_tl(s->T1, cpu_env, offsetof(CPUX86State, idt.limit));
+            break;
+
+        CASE_MODRM_OP(4): /* smsw */
+            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_READ_CR0);
+            tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
+            /*
+             * In 32-bit mode, the higher 16 bits of the destination
+             * register are undefined.  In practice CR0[31:0] is stored
+             * just like in 64-bit mode.
+             */
+            mod = (modrm >> 6) & 3;
+            ot = (mod != 3 ? MO_16 : s->dflag);
+            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
+            break;
+        case 0xee: /* rdpkru */
+            if (prefixes & PREFIX_LOCK) {
+                goto illegal_op;
+            }
+            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
+            gen_helper_rdpkru(s->tmp1_i64, cpu_env, s->tmp2_i32);
+            tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], s->tmp1_i64);
+            break;
+        case 0xef: /* wrpkru */
+            if (prefixes & PREFIX_LOCK) {
+                goto illegal_op;
+            }
+            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
+                                  cpu_regs[R_EDX]);
+            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
+            gen_helper_wrpkru(cpu_env, s->tmp2_i32, s->tmp1_i64);
+            break;
+
+        CASE_MODRM_OP(6): /* lmsw */
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
+            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            /*
+             * Only the 4 lower bits of CR0 are modified.
+             * PE cannot be set to zero if already set to one.
+             */
+            tcg_gen_ld_tl(s->T1, cpu_env, offsetof(CPUX86State, cr[0]));
+            tcg_gen_andi_tl(s->T0, s->T0, 0xf);
+            tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
+            tcg_gen_or_tl(s->T0, s->T0, s->T1);
+            gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        CASE_MODRM_MEM_OP(7): /* invlpg */
+            if (!check_cpl0(s)) {
+                break;
+            }
+            gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
+            gen_lea_modrm(env, s, modrm);
+            gen_helper_flush_page(cpu_env, s->A0);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        case 0xf8: /* swapgs */
+#ifdef TARGET_X86_64
+            if (CODE64(s)) {
+                if (check_cpl0(s)) {
+                    tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
+                    tcg_gen_ld_tl(cpu_seg_base[R_GS], cpu_env,
+                                  offsetof(CPUX86State, kernelgsbase));
+                    tcg_gen_st_tl(s->T0, cpu_env,
+                                  offsetof(CPUX86State, kernelgsbase));
+                }
+                break;
+            }
+#endif
+            goto illegal_op;
+
+        case 0xf9: /* rdtscp */
+            if (!(s->cpuid_ext2_features & CPUID_EXT2_RDTSCP)) {
+                goto illegal_op;
+            }
+            gen_update_cc_op(s);
+            gen_jmp_im(s, pc_start - s->cs_base);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_start();
+            }
+            gen_helper_rdtscp(cpu_env);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_jmp(s, s->pc - s->cs_base);
+            }
+            break;
+
+        default:
+            goto unknown_op;
+        }
+        break;
+
+    case 0x108: /* invd */
+    case 0x109: /* wbinvd */
+        if (check_cpl0(s)) {
+            gen_svm_check_intercept(s, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
+            /* nothing to do */
+        }
+        break;
+    case 0x63: /* arpl or movslS (x86_64) */
+#ifdef TARGET_X86_64
+        if (CODE64(s)) {
+            int d_ot;
+            /* d_ot is the size of destination */
+            d_ot = dflag;
+
+            modrm = x86_ldub_code(env, s);
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            mod = (modrm >> 6) & 3;
+            rm = (modrm & 7) | REX_B(s);
+
+            if (mod == 3) {
+                gen_op_mov_v_reg(s, MO_32, s->T0, rm);
+                /* sign extend */
+                if (d_ot == MO_64) {
+                    tcg_gen_ext32s_tl(s->T0, s->T0);
+                }
+                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
+            } else {
+                gen_lea_modrm(env, s, modrm);
+                gen_op_ld_v(s, MO_32 | MO_SIGN, s->T0, s->A0);
+                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
+            }
+        } else
+#endif
+        {
+            TCGLabel *label1;
+            TCGv t0, t1, t2, a0;
+
+            if (!PE(s) || VM86(s))
+                goto illegal_op;
+            t0 = tcg_temp_local_new();
+            t1 = tcg_temp_local_new();
+            t2 = tcg_temp_local_new();
+            ot = MO_16;
+            modrm = x86_ldub_code(env, s);
+            reg = (modrm >> 3) & 7;
+            mod = (modrm >> 6) & 3;
+            rm = modrm & 7;
+            if (mod != 3) {
+                gen_lea_modrm(env, s, modrm);
+                gen_op_ld_v(s, ot, t0, s->A0);
+                a0 = tcg_temp_local_new();
+                tcg_gen_mov_tl(a0, s->A0);
+            } else {
+                gen_op_mov_v_reg(s, ot, t0, rm);
+                a0 = NULL;
+            }
+            gen_op_mov_v_reg(s, ot, t1, reg);
+            tcg a0);
+                tcg_temp_free(a0);
+           } else {
+                gen_op_mov_reg_v(s, ot, rm, t0);
+            }
+            gen_compute_eflags(s);
+            tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_Z);
+            tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, t2);
+            tcg_temp_free(t0);
+            tcg_temp_free(t1);
+            tcg_temp_free(t2);
+        }
+        break;
+    case 0x102: /* lar */
+    case 0x103: /* lsl */
+        {
+            TCGLabel *label1;
+            TCGv t0;
+            if (!PE(s) || VM86(s))
+                goto illegal_op;
+            ot = dflag != MO_16 ? MO_32 : MO_16;
+            modrm = x86_ldub_code(env, s);
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            t0 = tcg_temp_local_new();
+            gen_update_cc_op(s);
+            if (b == 0x102) {
+                gen_helper_lar(t0, cpu_env, s->T0);
+            } else {
+                gen_helper_lsl(t0, cpu_env, s->T0);
+            }
+            tcg_gen_andi_tl(s->tmp0, cpu_cc_src, CC_Z);
+            label1 = gen_new_label();
+            tcg_gen_brcondi_tl(TCG_COND_EQ, s->tmp0, 0, label1);
+            gen_op_mov_reg_v(s, ot, reg, t0);
+            gen_set_label(label1);
+            set_cc_op(s, CC_OP_EFLAGS);
+            tcg_temp_free(t0);
+        }
+        break;
+    case 0x118:
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        op = (modrm >> 3) & 7;
+        switch(op) {
+        case 0: /* prefetchnta */
+        case 1: /* prefetchnt0 */
+        case 2: /* prefetchnt0 */
+        case 3: /* prefetchnt0 */
+            if (mod == 3)
+                goto illegal_op;
+            gen_nop_modrm(env, s, modrm);
+            /* nothing more to do */
+            break;
+        default: /* nop (multi byte) */
+            gen_nop_modrm(env, s, modrm);
+            break;
+        }
+        break;
+    case 0x11a:
+        modrm = x86_ldub_code(env, s);
+        if (s->flags & HF_MPX_EN_MASK) {
+            mod = (modrm >> 6) & 3;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            if (prefixes & PREFIX_REPZ) {
+                /* bndcl */
+                if (reg >= 4
+                    || (prefixes & PREFIX_LOCK)
+                    || s->aflag == MO_16) {
+                    goto illegal_op;
+                }
+                gen_bndck(env, s, modrm, TCG_COND_LTU, cpu_bndl[reg]);
+            } else if (prefixes & PREFIX_REPNZ) {
+                /* bndcu */
+                if (reg >= 4
+                    || (prefixes & PREFIX_LOCK)
+                    || s->aflag == MO_16) {
+                    goto illegal_op;
+                }
+                TCGv_i64 notu = tcg_temp_new_i64();
+                tcg_gen_not_i64(notu, cpu_bndu[reg]);
+                gen_bndck(env, s, modrm, TCG_COND_GTU, notu);
+                tcg_temp_free_i64(notu);
+            } else if (prefixes & PREFIX_DATA) {
+                /* bndmov -- from reg/mem */
+                if (reg >= 4 || s->aflag == MO_16) {
+                    goto illegal_op;
+                }
+                if (mod == 3) {
+                    int reg2 = (modrm & 7) | REX_B(s);
+                    if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
+                        goto illegal_op;
+                    }
+                    if (s->flags & HF_MPX_IU_MASK) {
+                        tcg_gen_mov_i64(cpu_bndl[reg], cpu_bndl[reg2]);
+                        tcg_gen_mov_i64(cpu_bndu[reg], cpu_bndu[reg2]);
+                    }
+                } else {
+                    gen_lea_modrm(env, s, modrm);
+                    if (CODE64(s)) {
+                        tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
+                                            s->mem_index, MO_LEUQ);
+                        tcg_gen_addi_tl(s->A0, s->A0, 8);
+                        tcg_gen_qemu_ld_i64(cpu_bndu[reg], s->A0,
+                                            s->mem_index, MO_LEUQ);
+                    } else {
+                        tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
+                                            s->mem_index, MO_LEUL);
+                        tcg_gen_addi_tl(s->A0, s->A0, 4);
+                        tcg_gen_qemu_ld_i64(cpu_bndu[reg], s->A0,
+                                            s->mem_index, MO_LEUL);
+                    }
+                    /* bnd registers are now in-use */
+                    gen_set_hflag(s, HF_MPX_IU_MASK);
+                }
+            } else if (mod != 3) {
+                /* bndldx */
+                AddressParts a = gen_lea_modrm_0(env, s, modrm);
+                if (reg >= 4
+                    || (prefixes & PREFIX_LOCK)
+                    || s->aflag == MO_16
+                    || a.base < -1) {
+                    goto illegal_op;
+                }
+                if (a.base >= 0) {
+                    tcg_gen_addi_tl(s->A0, cpu_regs[a.base], a.disp);
+                } else {
+                    tcg_gen_movi_tl(s->A0, 0);
+                }
+                gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
+                if (a.index >= 0) {
+                    tcg_gen_mov_tl(s->T0, cpu_regs[a.index]);
+                } else {
+                    tcg_gen_movi_tl(s->T0, 0);
+                }
+                if (CODE64(s)) {
+                    gen_helper_bndldx64(cpu_bndl[reg], cpu_env, s->A0, s->T0);
+                    tcg_gen_ld_i64(cpu_bndu[reg], cpu_env,
+                                   offsetof(CPUX86State, mmx_t0.MMX_Q(0)));
+                } else {
+                    gen_helper_bndldx32(cpu_bndu[reg], cpu_env, s->A0, s->T0);
+                    tcg_gen_ext32u_i64(cpu_bndl[reg], cpu_bndu[reg]);
+                    tcg_gen_shri_i64(cpu_bndu[reg], cpu_bndu[reg], 32);
+                }
+                gen_set_hflag(s, HF_MPX_IU_MASK);
+            }
+        }
+        gen_nop_modrm(env, s, modrm);
+        break;
+    case 0x11b:
+        modrm = x86_ldub_code(env, s);
+        if (s->flags & HF_MPX_EN_MASK) {
+            mod = (modrm >> 6) & 3;
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            if (mod != 3 && (prefixes & PREFIX_REPZ)) {
+                /* bndmk */
+                if (reg >= 4
+                    || (prefixes & PREFIX_LOCK)
+                    || s->aflag == MO_16) {
+                    goto illegal_op;
+                }
+                AddressParts a = gen_lea_modrm_0(env, s, modrm);
+                if (a.base >= 0) {
+                    tcg_gen_extu_tl_i64(cpu_bndl[reg], cpu_regs[a.base]);
+                    if (!CODE64(s)) {
+                        tcg_gen_ext32u_i64(cpu_bndl[reg], cpu_bndl[reg]);
+                    }
+                } else if (a.base == -1) {
+                    /* no base register has lower bound of 0 */
+                    tcg_gen_movi_i64(cpu_bndl[reg], 0);
+                } else {
+                    /* rip-relative generates #ud */
+                    goto illegal_op;
+                }
+                tcg_gen_not_tl(s->A0, gen_lea_modrm_1(s, a));
+                if (!CODE64(s)) {
+                    tcg_gen_ext32u_tl(s->A0, s->A0);
+                }
+                tcg_gen_extu_tl_i64(cpu_bndu[reg], s->A0);
+                /* bnd registers are now in-use */
+                gen_set_hflag(s, HF_MPX_IU_MASK);
+                break;
+            } else if (prefixes & PREFIX_REPNZ) {
+                /* bndcn */
+                if (reg >= 4
+                    || (prefixes & PREFIX_LOCK)
+                    || s->aflag == MO_16) {
+                    goto illegal_op;
+                }
+                gen_bndck(env, s, modrm, TCG_COND_GTU, cpu_bndu[reg]);
+            } else if (prefixes & PREFIX_DATA) {
+                /* bndmov -- to reg/mem */
+                if (reg >= 4 || s->aflag == MO_16) {
+                    goto illegal_op;
+                }
+                if (mod == 3) {
+                    int reg2 = (modrm & 7) | REX_B(s);
+                    if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
+                        goto illegal_op;
+                    }
+                    if (s->flags & HF_MPX_IU_MASK) {
+                        tcg_gen_mov_i64(cpu_bndl[reg2], cpu_bndl[reg]);
+                        tcg_gen_mov_i64(cpu_bndu[reg2], cpu_bndu[reg]);
+                    }
+                } else {
+                    gen_lea_modrm(env, s, modrm);
+                    if (CODE64(s)) {
+                        tcg_gen_qemu_st_i64(cpu_bndl[reg], s->A0,
+                                            s->mem_index, MO_LEUQ);
+                        tcg_gen_addi_tl(s->A0, s->A0, 8);
+                        tcg_gen_qemu_st_i64(cpu_bndu[reg], s->A0,
+                                            s->mem_index, MO_LEUQ);
+                    } else {
+                        tcg_gen_qemu_st_i64(cpu_bndl[reg], s->A0,
+                                            s->mem_index, MO_LEUL);
+                        tcg_gen_addi_tl(s->A0, s->A0, 4);
+                        tcg_gen_qemu_st_i64(cpu_bndu[reg], s->A0,
+                                            s->mem_index, MO_LEUL);
+                    }
+                }
+            } else if (mod != 3) {
+                /* bndstx */
+                AddressParts a = gen_lea_modrm_0(env, s, modrm);
+                if (reg >= 4
+                    || (prefixes & PREFIX_LOCK)
+                    || s->aflag == MO_16
+                    || a.base < -1) {
+                    goto illegal_op;
+                }
+                if (a.base >= 0) {
+                    tcg_gen_addi_tl(s->A0, cpu_regs[a.base], a.disp);
+                } else {
+                    tcg_gen_movi_tl(s->A0, 0);
+                }
+                gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
+                if (a.index >= 0) {
+                    tcg_gen_mov_tl(s->T0, cpu_regs[a.index]);
+                } else {
+                    tcg_gen_movi_tl(s->T0, 0);
+                }
+                if (CODE64(s)) {
+                    gen_helper_bndstx64(cpu_env, s->A0, s->T0,
+                                        cpu_bndl[reg], cpu_bndu[reg]);
+                } else {
+                    gen_helper_bndstx32(cpu_env, s->A0, s->T0,
+                                        cpu_bndl[reg], cpu_bndu[reg]);
+                }
+            }
+        }
+        gen_nop_modrm(env, s, modrm);
+        break;
+    case 0x119: case 0x11c ... 0x11f: /* nop (multi byte) */
+        modrm = x86_ldub_code(env, s);
+        gen_nop_modrm(env, s, modrm);
+        break;
+
+    case 0x120: /* mov reg, crN */
+    case 0x122: /* mov crN, reg */
+        if (!check_cpl0(s)) {
+            break;
+        }
+        modrm = x86_ldub_code(env, s);
+        /*
+         * Ignore the mod bits (assume (modrm&0xc0)==0xc0).
+         * AMD documentation (24594.pdf) and testing of Intel 386 and 486
+         * processors all show that the mod bits are assumed to be 1's,
+         * regardless of actual values.
+         */
+        rm = (modrm & 7) | REX_B(s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        switch (reg) {
+        case 0:
+            if ((prefixes & PREFIX_LOCK) &&
+                (s->cpuid_ext3_features & CPUID_EXT3_CR8LEG)) {
+                reg = 8;
+            }
+            break;
+        case 2:
+        case 3:
+        case 4:
+        case 8:
+            break;
+        default:
+            goto unknown_op;
+        }
+        ot  = (CODE64(s) ? MO_64 : MO_32);
+
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
+        if (b & 2) {
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
+            gen_op_mov_v_reg(s, ot, s->T0, rm);
+            gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+        } else {
+            gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
+            gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
+            gen_op_mov_reg_v(s, ot, rm, s->T0);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_jmp(s, s->pc - s->cs_base);
+            }
+        }
+        break;
+
+    case 0x121: /* mov reg, drN */
+    case 0x123: /* mov drN, reg */
+        if (check_cpl0(s)) {
+            modrm = x86_ldub_code(env, s);
+            /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
+             * AMD documentation (24594.pdf) and testing of
+             * intel 386 and 486 processors all show that the mod bits
+             * are assumed to be 1's, regardless of actual values.
+             */
+            rm = (modrm & 7) | REX_B(s);
+            reg = ((modrm >> 3) & 7) | REX_R(s);
+            if (CODE64(s))
+                ot = MO_64;
+            else
+                ot = MO_32;
+            if (reg >= 8) {
+                goto illegal_op;
+            }
+            if (b & 2) {
+                gen_svm_check_intercept(s, SVM_EXIT_WRITE_DR0 + reg);
+                gen_op_mov_v_reg(s, ot, s->T0, rm);
+                tcg_gen_movi_i32(s->tmp2_i32, reg);
+                gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
+                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_eob(s);
+            } else {
+                gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
+                tcg_gen_movi_i32(s->tmp2_i32, reg);
+                gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
+                gen_op_mov_reg_v(s, ot, rm, s->T0);
+            }
+        }
+        break;
+    case 0x106: /* clts */
+        if (check_cpl0(s)) {
+            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
+            gen_helper_clts(cpu_env);
+            /* abort block because static cpu state changed */
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+        }
+        break;
+    /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
+    case 0x1c3: /* MOVNTI reg, mem */
+        if (!(s->cpuid_features & CPUID_SSE2))
+            goto illegal_op;
+        ot = mo_64_32(dflag);
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        if (mod == 3)
+            goto illegal_op;
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+        /* generate a generic store */
+        gen_ldst_modrm(env, s, modrm, ot, reg, 1);
+        break;
+    case 0x1ae:
+        modrm = x86_ldub_code(env, s);
+        switch (modrm) {
+        CASE_MODRM_MEM_OP(0): /* fxsave */
+            if (!(s->cpuid_features & CPUID_FXSR)
+                || (prefixes & PREFIX_LOCK)) {
+                goto illegal_op;
+            }
+            if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
+                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                break;
+            }
+            gen_lea_modrm(env, s, modrm);
+            gen_helper_fxsave(cpu_env, s->A0);
+            break;
+
+        CASE_MODRM_MEM_OP(1): /* fxrstor */
+            if (!(s->cpuid_features & CPUID_FXSR)
+                || (prefixes & PREFIX_LOCK)) {
+                goto illegal_op;
+            }
+            if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
+                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                break;
+            }
+            gen_lea_modrm(env, s, modrm);
+            gen_helper_fxrstor(cpu_env, s->A0);
+            break;
+
+        CASE_MODRM_MEM_OP(2): /* ldmxcsr */
+            if ((s->flags & HF_EM_MASK) || !(s->flags & HF_OSFXSR_MASK)) {
+                goto illegal_op;
+            }
+            if (s->flags & HF_TS_MASK) {
+                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+                break;
+            }
+            gen_lea_modrm(env, s, modrm);
+            tcg_gen_qemu_->cs_base);
+                break;
+            }
+            gen_helper_update_mxcsr(cpu_env);
+            gen_lea_modrm(env, s, modrm);
+            tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, mxcsr));
+            gen_op_st_v(s, MO_32, s->T0, s->A0);
+            break;
+
+        CASE_MODRM_MEM_OP(4): /* xsave */
+            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
+                || (prefixes & (PREFIX_LOCK | PREFIX_DATA
+                                | PREFIX_REPZ | PREFIX_REPNZ))) {
+                goto illegal_op;
+            }
+            gen_lea_modrm(env, s, modrm);
+            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
+                                  cpu_regs[R_EDX]);
+            gen_helper_xsave(cpu_env, s->A0, s->tmp1_i64);
+            break;
+
+        CASE_MODRM_MEM_OP(5): /* xrstor */
+            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
+                || (prefixes & (PREFIX_LOCK | PREFIX_DATA
+                                | PREFIX_REPZ | PREFIX_REPNZ))) {
+                goto illegal_op;
+            }
+            gen_lea_modrm(env, s, modrm);
+            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
+                                  cpu_regs[R_EDX]);
+            gen_helper_xrstor(cpu_env, s->A0, s->tmp1_i64);
+            /* XRSTOR is how MPX is enabled, which changes how
+               we translate.  Thus we need to end the TB.  */
+            gen_update_cc_op(s);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
+            break;
+
+        CASE_MODRM_MEM_OP(6): /* xsaveopt / clwb */
+            if (prefixes & PREFIX_LOCK) {
+                goto illegal_op;
+            }
+            if (prefixes & PREFIX_DATA) {
+                /* clwb */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLWB)) {
+                    goto illegal_op;
+                }
+                gen_nop_modrm(env, s, modrm);
+            } else {
+                /* xsaveopt */
+                if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
+                    || (s->cpuid_xsave_features & CPUID_XSAVE_XSAVEOPT) == 0
+                    || (prefixes & (PREFIX_REPZ | PREFIX_REPNZ))) {
+                    goto illegal_op;
+                }
+                gen_lea_modrm(env, s, modrm);
+                tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
+                                      cpu_regs[R_EDX]);
+                gen_helper_xsaveopt(cpu_env, s->A0, s->tmp1_i64);
+            }
+            break;
+
+        CASE_MODRM_MEM_OP(7): /* clflush / clflushopt */
+            if (prefixes & PREFIX_LOCK) {
+                goto illegal_op;
+            }
+            if (prefixes & PREFIX_DATA) {
+                /* clflushopt */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLFLUSHOPT)) {
+                    goto illegal_op;
+                }
+            } else {
+                /* clflush */
+                if ((s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))
+                    || !(s->cpuid_features & CPUID_CLFLUSH)) {
+                    goto illegal_op;
+                }
+            }
+            gen_nop_modrm(env, s, modrm);
+            break;
+
+        case 0xc0 ... 0xc7: /* rdfsbase (f3 0f ae /0) */
+        case 0xc8 ... 0xcf: /* rdgsbase (f3 0f ae /1) */
+        case 0xd0 ... 0xd7: /* wrfsbase (f3 0f ae /2) */
+        case 0xd8 ... 0xdf: /* wrgsbase (f3 0f ae /3) */
+            if (CODE64(s)
+                && (prefixes & PREFIX_REPZ)
+                && !(prefixes & PREFIX_LOCK)
+                && (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_FSGSBASE)) {
+                TCGv base, treg, src, dst;
+
+                /* Preserve hflags bits by testing CR4 at runtime.  */
+                tcg_gen_movi_i32(s->tmp2_i32, CR4_FSGSBASE_MASK);
+                gen_helper_cr4_testbit(cpu_env, s->tmp2_i32);
+
+                base = cpu_seg_base[modrm & 8 ? R_GS : R_FS];
+                treg = cpu_regs[(modrm & 7) | REX_B(s)];
+
+                if (modrm & 0x10) {
+                    /* wr*base */
+                    dst = base, src = treg;
+                } else {
+                    /* rd*base */
+                    dst = treg, src = base;
+                }
+
+                if (s->dflag == MO_32) {
+                    tcg_gen_ext32u_tl(dst, src);
+                } else {
+                    tcg_gen_mov_tl(dst, src);
+                }
+                break;
+            }
+            goto unknown_op;
+
+        case 0xf8: /* sfence / pcommit */
+            if (prefixes & PREFIX_DATA) {
+                /* pcommit */
+                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_PCOMMIT)
+                    || (prefixes & PREFIX_LOCK)) {
+                    goto illegal_op;
+                }
+                break;
+            }
+            /* fallthru */
+        case 0xf9 ... 0xff: /* sfence */
+            if (!(s->cpuid_features & CPUID_SSE)
+                || (prefixes & PREFIX_LOCK)) {
+                goto illegal_op;
+            }
+            tcg_gen_mb(TCG_MO_ST_ST | TCG_BAR_SC);
+            break;
+        case 0xe8 ... 0xef: /* lfence */
+            if (!(s->cpuid_features & CPUID_SSE)
+                || (prefixes & PREFIX_LOCK)) {
+                goto illegal_op;
+            }
+            tcg_gen_mb(TCG_MO_LD_LD | TCG_BAR_SC);
+            break;
+        case 0xf0 ... 0xf7: /* mfence */
+            if (!(s->cpuid_features & CPUID_SSE2)
+                || (prefixes & PREFIX_LOCK)) {
+                goto illegal_op;
+            }
+            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+            break;
+
+        default:
+            goto unknown_op;
+        }
+        break;
+
+    case 0x10d: /* 3DNow! prefetch(w) */
+        modrm = x86_ldub_code(env, s);
+        mod = (modrm >> 6) & 3;
+        if (mod == 3)
+            goto illegal_op;
+        gen_nop_modrm(env, s, modrm);
+        break;
+    case 0x1aa: /* rsm */
+        gen_svm_check_intercept(s, SVM_EXIT_RSM);
+        if (!(s->flags & HF_SMM_MASK))
+            goto illegal_op;
+#ifdef CONFIG_USER_ONLY
+        /* we should not be in SMM mode */
+        g_assert_not_reached();
+#else
+        gen_update_cc_op(s);
+        gen_jmp_im(s, s->pc - s->cs_base);
+        gen_helper_rsm(cpu_env);
+#endif /* CONFIG_USER_ONLY */
+        gen_eob(s);
+        break;
+    case 0x1b8: /* SSE4.2 popcnt */
+        if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
+             PREFIX_REPZ)
+            goto illegal_op;
+        if (!(s->cpuid_ext_features & CPUID_EXT_POPCNT))
+            goto illegal_op;
+
+        modrm = x86_ldub_code(env, s);
+        reg = ((modrm >> 3) & 7) | REX_R(s);
+
+        if (s->prefix & PREFIX_DATA) {
+            ot = MO_16;
+        } else {
+            ot = mo_64_32(dflag);
+        }
+
+        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
+        gen_extu(ot, s->T0);
+        tcg_gen_mov_tl(cpu_cc_src, s->T0);
+        tcg_gen_ctpop_tl(s->T0, s->T0);
+        gen_op_mov_reg_v(s, ot, reg, s->T0);
+
+        set_cc_op(s, CC_OP_POPCNT);
+        break;
+    case 0x10e ... 0x10f:
+        /* 3DNow! instructions, ignore prefixes */
+        s->prefix &= ~(PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA);
+        /* fall through */
+    case 0x110 ... 0x117:
+    case 0x128 ... 0x12f:
+    case 0x138 ... 0x13a:
+    case 0x150 ... 0x179:
+    case 0x17c ... 0x17f:
+    case 0x1c2:
+    case 0x1c4 ... 0x1c6:
+    case 0x1d0 ... 0x1fe:
+        gen_sse(env, s, b, pc_start);
+        break;
+    default:
+        goto unknown_op;
+    }
+    return s->pc;
+ illegal_op:
+    gen_illegal_opcode(s);
+    return s->pc;
+ unknown_op:
+    gen_unknown_opcode(env, s);
+    return s->pc;
+}
+
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..d2d6eb89e7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -48,20 +48,6 @@
 # define clztl  clz32
 #endif
 
-/* For a switch indexed by MODRM, match all memory operands for a given OP.  */
-#define CASE_MODRM_MEM_OP(OP) \
-    case (0 << 6) | (OP << 3) | 0 ... (0 << 6) | (OP << 3) | 7: \
-    case (1 << 6) | (OP << 3) | 0 ... (1 << 6) | (OP << 3) | 7: \
-    case (2 << 6) | (OP << 3) | 0 ... (2 << 6) | (OP << 3) | 7
-
-#define CASE_MODRM_OP(OP) \
-    case (0 << 6) | (OP << 3) | 0 ... (0 << 6) | (OP << 3) | 7: \
-    case (1 << 6) | (OP << 3) | 0 ... (1 << 6) | (OP << 3) | 7: \
-    case (2 << 6) | (OP << 3) | 0 ... (2 << 6) | (OP << 3) | 7: \
-    case (3 << 6) | (OP << 3) | 0 ... (3 << 6) | (OP << 3) | 7
-
-//#define MACRO_TEST   1
-
 /* global register indexes */
 static TCGv cpu_cc_dst, cpu_cc_src, cpu_cc_src2;
 static TCGv_i32 cpu_cc_op;
@@ -2776,5706 +2762,7 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
     tcg_gen_movi_i64(s->tmp1_i64, 0);
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
 }
-
-typedef void (*SSEFunc_i_ep)(TCGv_i32 val, TCGv_ptr env, TCGv_ptr reg);
-typedef void (*SSEFunc_l_ep)(TCGv_i64 val, TCGv_ptr env, TCGv_ptr reg);
-typedef void (*SSEFunc_0_epi)(TCGv_ptr env, TCGv_ptr reg, TCGv_i32 val);
-typedef void (*SSEFunc_0_epl)(TCGv_ptr env, TCGv_ptr reg, TCGv_i64 val);
-typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
-typedef void (*SSEFunc_0_eppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                               TCGv_i32 val);
-typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
-typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
-                               TCGv val);
-
-#define SSE_SPECIAL ((void *)1)
-#define SSE_DUMMY ((void *)2)
-
-#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
-#define SSE_FOP(x) { gen_helper_ ## x ## ps, gen_helper_ ## x ## pd, \
-                     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, }
-
-static const SSEFunc_0_epp sse_op_table1[256][4] = {
-    /* 3DNow! extensions */
-    [0x0e] = { SSE_DUMMY }, /* femms */
-    [0x0f] = { SSE_DUMMY }, /* pf... */
-    /* pure SSE operations */
-    [0x10] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
-    [0x11] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
-    [0x12] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movlps, movlpd, movsldup, movddup */
-    [0x13] = { SSE_SPECIAL, SSE_SPECIAL },  /* movlps, movlpd */
-    [0x14] = { gen_helper_punpckldq_xmm, gen_helper_punpcklqdq_xmm },
-    [0x15] = { gen_helper_punpckhdq_xmm, gen_helper_punpckhqdq_xmm },
-    [0x16] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd, movshdup */
-    [0x17] = { SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd */
-
-    [0x28] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
-    [0x29] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
-    [0x2a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtpi2ps, cvtpi2pd, cvtsi2ss, cvtsi2sd */
-    [0x2b] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movntps, movntpd, movntss, movntsd */
-    [0x2c] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
-    [0x2d] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
-    [0x2e] = { gen_helper_ucomiss, gen_helper_ucomisd },
-    [0x2f] = { gen_helper_comiss, gen_helper_comisd },
-    [0x50] = { SSE_SPECIAL, SSE_SPECIAL }, /* movmskps, movmskpd */
-    [0x51] = SSE_FOP(sqrt),
-    [0x52] = { gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL },
-    [0x53] = { gen_helper_rcpps, NULL, gen_helper_rcpss, NULL },
-    [0x54] = { gen_helper_pand_xmm, gen_helper_pand_xmm }, /* andps, andpd */
-    [0x55] = { gen_helper_pandn_xmm, gen_helper_pandn_xmm }, /* andnps, andnpd */
-    [0x56] = { gen_helper_por_xmm, gen_helper_por_xmm }, /* orps, orpd */
-    [0x57] = { gen_helper_pxor_xmm, gen_helper_pxor_xmm }, /* xorps, xorpd */
-    [0x58] = SSE_FOP(add),
-    [0x59] = SSE_FOP(mul),
-    [0x5a] = { gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
-               gen_helper_cvtss2sd, gen_helper_cvtsd2ss },
-    [0x5b] = { gen_helper_cvtdq2ps, gen_helper_cvtps2dq, gen_helper_cvttps2dq },
-    [0x5c] = SSE_FOP(sub),
-    [0x5d] = SSE_FOP(min),
-    [0x5e] = SSE_FOP(div),
-    [0x5f] = SSE_FOP(max),
-
-    [0xc2] = SSE_FOP(cmpeq),
-    [0xc6] = { (SSEFunc_0_epp)gen_helper_shufps,
-               (SSEFunc_0_epp)gen_helper_shufpd }, /* XXX: casts */
-
-    /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
-    [0x38] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
-    [0x3a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
-
-    /* MMX ops and their SSE extensions */
-    [0x60] = MMX_OP2(punpcklbw),
-    [0x61] = MMX_OP2(punpcklwd),
-    [0x62] = MMX_OP2(punpckldq),
-    [0x63] = MMX_OP2(packsswb),
-    [0x64] = MMX_OP2(pcmpgtb),
-    [0x65] = MMX_OP2(pcmpgtw),
-    [0x66] = MMX_OP2(pcmpgtl),
-    [0x67] = MMX_OP2(packuswb),
-    [0x68] = MMX_OP2(punpckhbw),
-    [0x69] = MMX_OP2(punpckhwd),
-    [0x6a] = MMX_OP2(punpckhdq),
-    [0x6b] = MMX_OP2(packssdw),
-    [0x6c] = { NULL, gen_helper_punpcklqdq_xmm },
-    [0x6d] = { NULL, gen_helper_punpckhqdq_xmm },
-    [0x6e] = { SSE_SPECIAL, SSE_SPECIAL }, /* movd mm, ea */
-    [0x6f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, , movqdu */
-    [0x70] = { (SSEFunc_0_epp)gen_helper_pshufw_mmx,
-               (SSEFunc_0_epp)gen_helper_pshufd_xmm,
-               (SSEFunc_0_epp)gen_helper_pshufhw_xmm,
-               (SSEFunc_0_epp)gen_helper_pshuflw_xmm }, /* XXX: casts */
-    [0x71] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftw */
-    [0x72] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftd */
-    [0x73] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftq */
-    [0x74] = MMX_OP2(pcmpeqb),
-    [0x75] = MMX_OP2(pcmpeqw),
-    [0x76] = MMX_OP2(pcmpeql),
-    [0x77] = { SSE_DUMMY }, /* emms */
-    [0x78] = { NULL, SSE_SPECIAL, NULL, SSE_SPECIAL }, /* extrq_i, insertq_i */
-    [0x79] = { NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r },
-    [0x7c] = { NULL, gen_helper_haddpd, NULL, gen_helper_haddps },
-    [0x7d] = { NULL, gen_helper_hsubpd, NULL, gen_helper_hsubps },
-    [0x7e] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movd, movd, , movq */
-    [0x7f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, movdqu */
-    [0xc4] = { SSE_SPECIAL, SSE_SPECIAL }, /* pinsrw */
-    [0xc5] = { SSE_SPECIAL, SSE_SPECIAL }, /* pextrw */
-    [0xd0] = { NULL, gen_helper_addsubpd, NULL, gen_helper_addsubps },
-    [0xd1] = MMX_OP2(psrlw),
-    [0xd2] = MMX_OP2(psrld),
-    [0xd3] = MMX_OP2(psrlq),
-    [0xd4] = MMX_OP2(paddq),
-    [0xd5] = MMX_OP2(pmullw),
-    [0xd6] = { NULL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
-    [0xd7] = { SSE_SPECIAL, SSE_SPECIAL }, /* pmovmskb */
-    [0xd8] = MMX_OP2(psubusb),
-    [0xd9] = MMX_OP2(psubusw),
-    [0xda] = MMX_OP2(pminub),
-    [0xdb] = MMX_OP2(pand),
-    [0xdc] = MMX_OP2(paddusb),
-    [0xdd] = MMX_OP2(paddusw),
-    [0xde] = MMX_OP2(pmaxub),
-    [0xdf] = MMX_OP2(pandn),
-    [0xe0] = MMX_OP2(pavgb),
-    [0xe1] = MMX_OP2(psraw),
-    [0xe2] = MMX_OP2(psrad),
-    [0xe3] = MMX_OP2(pavgw),
-    [0xe4] = MMX_OP2(pmulhuw),
-    [0xe5] = MMX_OP2(pmulhw),
-    [0xe6] = { NULL, gen_helper_cvttpd2dq, gen_helper_cvtdq2pd, gen_helper_cvtpd2dq },
-    [0xe7] = { SSE_SPECIAL , SSE_SPECIAL },  /* movntq, movntq */
-    [0xe8] = MMX_OP2(psubsb),
-    [0xe9] = MMX_OP2(psubsw),
-    [0xea] = MMX_OP2(pminsw),
-    [0xeb] = MMX_OP2(por),
-    [0xec] = MMX_OP2(paddsb),
-    [0xed] = MMX_OP2(paddsw),
-    [0xee] = MMX_OP2(pmaxsw),
-    [0xef] = MMX_OP2(pxor),
-    [0xf0] = { NULL, NULL, NULL, SSE_SPECIAL }, /* lddqu */
-    [0xf1] = MMX_OP2(psllw),
-    [0xf2] = MMX_OP2(pslld),
-    [0xf3] = MMX_OP2(psllq),
-    [0xf4] = MMX_OP2(pmuludq),
-    [l),
-};
-
-static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
-    [0 + 2] = MMX_OP2(psrlw),
-    [0 + 4] = MMX_OP2(psraw),
-    [0 + 6] = MMX_OP2(psllw),
-    [8 + 2] = MMX_OP2(psrld),
-    [8 + 4] = MMX_OP2(psrad),
-    [8 + 6] = MMX_OP2(pslld),
-    [16 + 2] = MMX_OP2(psrlq),
-    [16 + 3] = { NULL, gen_helper_psrldq_xmm },
-    [16 + 6] = MMX_OP2(psllq),
-    [16 + 7] = { NULL, gen_helper_pslldq_xmm },
-};
-
-static const SSEFunc_0_epi sse_op_table3ai[] = {
-    gen_helper_cvtsi2ss,
-    gen_helper_cvtsi2sd
-};
-
-#ifdef TARGET_X86_64
-static const SSEFunc_0_epl sse_op_table3aq[] = {
-    gen_helper_cvtsq2ss,
-    gen_helper_cvtsq2sd
-};
-#endif
-
-static const SSEFunc_i_ep sse_op_table3bi[] = {
-    gen_helper_cvttss2si,
-    gen_helper_cvtss2si,
-    gen_helper_cvttsd2si,
-    gen_helper_cvtsd2si
-};
-
-#ifdef TARGET_X86_64
-static const SSEFunc_l_ep sse_op_table3bq[] = {
-    gen_helper_cvttss2sq,
-    gen_helper_cvtss2sq,
-    gen_helper_cvttsd2sq,
-    gen_helper_cvtsd2sq
-};
-#endif
-
-static const SSEFunc_0_epp sse_op_table4[8][4] = {
-    SSE_FOP(cmpeq),
-    SSE_FOP(cmplt),
-    SSE_FOP(cmple),
-    SSE_FOP(cmpunord),
-    SSE_FOP(cmpneq),
-    SSE_FOP(cmpnlt),
-    SSE_FOP(cmpnle),
-    SSE_FOP(cmpord),
-};
-
-static const SSEFunc_0_epp sse_op_table5[256] = {
-    [0x0c] = gen_helper_pi2fw,
-    [0x0d] = gen_helper_pi2fd,
-    [0x1c] = gen_helper_pf2iw,
-    [0x1d] = gen_helper_pf2id,
-    [0x8a] = gen_helper_pfnacc,
-    [0x8e] = gen_helper_pfpnacc,
-    [0x90] = gen_helper_pfcmpge,
-    [0x94] = gen_helper_pfmin,
-    [0x96] = gen_helper_pfrcp,
-    [0x97] = gen_helper_pfrsqrt,
-    [0x9a] = gen_helper_pfsub,
-    [0x9e] = gen_helper_pfadd,
-    [0xa0] = gen_helper_pfcmpgt,
-    [0xa4] = gen_helper_pfmax,
-    [0xa6] = gen_helper_movq, /* pfrcpit1; no need to actually increase precision */
-    [0xa7] = gen_helper_movq, /* pfrsqit1 */
-    [0xaa] = gen_helper_pfsubr,
-    [0xae] = gen_helper_pfacc,
-    [0xb0] = gen_helper_pfcmpeq,
-    [0xb4] = gen_helper_pfmul,
-    [0xb6] = gen_helper_movq, /* pfrcpit2 */
-    [0xb7] = gen_helper_pmulhrw_mmx,
-    [0xbb] = gen_helper_pswapd,
-    [0xbf] = gen_helper_pavgb_mmx /* pavgusb */
-};
-
-struct SSEOpHelper_epp {
-    SSEFunc_0_epp op[2];
-    uint32_t ext_mask;
-};
-
-struct SSEOpHelper_eppi {
-    SSEFunc_0_eppi op[2];
-    uint32_t ext_mask;
-};
-
-#define SSSE3_OP(x) { MMX_OP2(x), CPUID_EXT_SSSE3 }
-#define SSE41_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE41 }
-#define SSE42_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE42 }
-#define SSE41_SPECIAL { { NULL, SSE_SPECIAL }, CPUID_EXT_SSE41 }
-#define PCLMULQDQ_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, \
-        CPUID_EXT_PCLMULQDQ }
-#define AESNI_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_AES }
-
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
-};
-
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
-};
-
-static void gen_sse(CPUX86State *env, DisasContext *s, int b,
-                    target_ulong pc_start)
-{
-    int b1, op1_offset, op2_offset, is_xmm, val;
-    int modrm, mod, rm, reg;
-    SSEFunc_0_epp sse_fn_epp;
-    SSEFunc_0_eppi sse_fn_eppi;
-    SSEFunc_0_ppi sse_fn_ppi;
-    SSEFunc_0_eppt sse_fn_eppt;
-    MemOp ot;
-
-    b &= 0xff;
-    if (s->prefix & PREFIX_DATA)
-        b1 = 1;
-    else if (s->prefix & PREFIX_REPZ)
-        b1 = 2;
-    else if (s->prefix & PREFIX_REPNZ)
-        b1 = 3;
-    else
-        b1 = 0;
-    sse_fn_epp = sse_op_table1[b][b1];
-    if (!sse_fn_epp) {
-        goto unknown_op;
-    }
-    if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
-        is_xmm = 1;
-    } else {
-        if (b1 == 0) {
-            /* MMX case */
-            is_xmm = 0;
-        } else {
-            is_xmm = 1;
-        }
-    }
-    /* simple MMX/SSE operation */
-    if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-        return;
-    }
-    if (s->flags & HF_EM_MASK) {
-    illegal_op:
-        gen_illegal_opcode(s);
-        return;
-    }
-    if (is_xmm
-        && !(s->flags & HF_OSFXSR_MASK)
-        && (b != 0x38 && b != 0x3a)) {
-        goto unknown_op;
-    }
-    if (b == 0x0e) {
-        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
-            /* If we were fully decoding this we might use illegal_op.  */
-            goto unknown_op;
-        }
-        /* femms */
-        gen_helper_emms(cpu_env);
-        return;
-    }
-    if (b == 0x77) {
-        /* emms */
-        gen_helper_emms(cpu_env);
-        return;
-    }
-    /* prepare MMX state (XXX: optimize by storing fptt and fptags in
-       the static cpu state) */
-    if (!is_xmm) {
-        gen_helper_enter_mmx(cpu_env);
-    }
-
-    modrm = x86_ldub_code(env, s);
-    reg = ((modrm >> 3) & 7);
-    if (is_xmm) {
-        reg |= REX_R(s);
-    }
-    mod = (modrm >> 6) & 3;
-    if (sse_fn_epp == SSE_SPECIAL) {
-        b |= (b1 << 8);
-        switch(b) {
-        case 0x0e7: /* movntq */
-            if (mod == 3) {
-                goto illegal_op;
-            }
-            gen_lea_modrm(env, s, modrm);
-            gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
-            break;
-        case 0x1e7: /* movntdq */
-        case 0x02b: /* movntps */
-        case 0x12b: /* movntps */
-            if (mod == 3)
-                goto illegal_op;
-            gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
-            break;
-        case 0x3f0: /* lddqu */
-            if (mod == 3)
-                goto illegal_op;
-            gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
-            break;
-        case 0x22b: /* movntss */
-        case 0x32b: /* movntsd */
-            if (mod == 3)
-                goto illegal_op;
-            gen_lea_modrm(env, s, modrm);
-            if (b1 & 1) {
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                    xmm_regs[reg].ZMM_L(0)));
-                gen_op_st_v(s, MO_32, s->T0, s->A0);
-            }
-            break;
-        case 0x6e: /* movd mm, ea */
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
-                tcg_gen_st_tl(s->T0, cpu_env,
-                              offsetof(CPUX86State, fpregs[reg].mmx));
-            } else
-#endif
-            {
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,fpregs[reg].mmx));
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_movl_mm_T0_mmx(s->ptr0, s->tmp2_i32);
-            }
-            break;
-        case 0x16e: /* movd xmm, ea */
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
-                gen_helper_movq_mm_T0_xmm(s->ptr0, s->T0);
-            } else
-#endif
-            {
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg]));
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_movl_mm_T0_xmm(s->ptr0, s->tmp2_i32);
-            }
-            break;
-        case 0x6f: /* movq mm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
-            } else {
-                rm = (modrm & 7);
-                tcg_gen_ld_i64(s->tmp1_i64, cpu_env,
-                               offsetof(CPUX86State,fpregs[rm].mmx));
-                tcg_gen_st_i64(s->tmp1_i64, cpu_env,
-                               offsetof(CPUX86State,fpregs[reg].mmx));
-            }
-            break;
-        case 0x010: /* movups */
-        case 0x110: /* movupd */
-        case 0x028: /* movaps */
-        case 0x128: /* movapd */
-        case 0x16f: /* movdqa xmm, ea */
-        case 0x26f: /* movdqu xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
-                            offsetof(CPUX86State,xmm_regs[rm]));
-            }
-            break;
-        case 0x210: /* movss xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_op_ld_v(s, MO_32, s->T0, s->A0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)));
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
-            }
-            break;
-        case 0x310: /* movsd xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)));
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            }
-            break;
-        case 0x012: /* movlps */
-        case 0x112: /* movlpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                /* movhlps */
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(1)));
-            }
-            break;
-        case 0x212: /* movsldup */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(2)));
-            }
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(2)));
-            break;
-        case 0x312: /* movddup */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            }
-            gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-            break;
-        case 0x016: /* movhps */
-        case 0x116: /* movhpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(1)));
-            } else {
-                /* movlhps */
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            }
-            break;
-        case 0x216: _regs[reg].ZMM_L(3)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(3)));
-            }
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(1)));
-            gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(2)),
-                        offsetof(CPUX86State,xmm_regs[reg].ZMM_L(3)));
-            break;
-        case 0x178:
-        case 0x378:
-            {
-                int bit_index, field_length;
-
-                if (b1 == 1 && reg != 0)
-                    goto illegal_op;
-                field_length = x86_ldub_code(env, s) & 0x3F;
-                bit_index = x86_ldub_code(env, s) & 0x3F;
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                    offsetof(CPUX86State,xmm_regs[reg]));
-                if (b1 == 1)
-                    gen_helper_extrq_i(cpu_env, s->ptr0,
-                                       tcg_const_i32(bit_index),
-                                       tcg_const_i32(field_length));
-                else
-                    gen_helper_insertq_i(cpu_env, s->ptr0,
-                                         tcg_const_i32(bit_index),
-                                         tcg_const_i32(field_length));
-            }
-            break;
-        case 0x7e: /* movd ea, mm */
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                tcg_gen_ld_i64(s->T0, cpu_env,
-                               offsetof(CPUX86State,fpregs[reg].mmx));
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 1);
-            } else
-#endif
-            {
-                tcg_gen_ld32u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,fpregs[reg].mmx.MMX_L(0)));
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
-            }
-            break;
-        case 0x17e: /* movd ea, xmm */
-#ifdef TARGET_X86_64
-            if (s->dflag == MO_64) {
-                tcg_gen_ld_i64(s->T0, cpu_env,
-                               offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-                gen_ldst_modrm(env, s, modrm, MO_64, OR_TMP0, 1);
-            } else
-#endif
-            {
-                tcg_gen_ld32u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
-            }
-            break;
-        case 0x27e: /* movq xmm, ea */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_ldq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            }
-            gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
-            break;
-        case 0x7f: /* movq ea, mm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State, fpregs[reg].mmx));
-            } else {
-                rm = (modrm & 7);
-                gen_op_movq(s, offsetof(CPUX86State, fpregs[rm].mmx),
-                            offsetof(CPUX86State,fpregs[reg].mmx));
-            }
-            break;
-        case 0x011: /* movups */
-        case 0x111: /* movupd */
-        case 0x029: /* movaps */
-        case 0x129: /* movapd */
-        case 0x17f: /* movdqa ea, xmm */
-        case 0x27f: /* movdqu ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
-                            offsetof(CPUX86State,xmm_regs[reg]));
-            }
-            break;
-        case 0x211: /* movss ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                tcg_gen_ld32u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
-                gen_op_st_v(s, MO_32, s->T0, s->A0);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_L(0)));
-            }
-            break;
-        case 0x311: /* movsd ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-            }
-            break;
-        case 0x013: /* movlps */
-        case 0x113: /* movlpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                goto illegal_op;
-            }
-            break;
-        case 0x017: /* movhps */
-        case 0x117: /* movhpd */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(1)));
-            } else {
-                goto illegal_op;
-            }
-            break;
-        case 0x71: /* shift mm, im */
-        case 0x72:
-        case 0x73:
-        case 0x171: /* shift xmm, im */
-        case 0x172:
-        case 0x173:
-            val = x86_ldub_code(env, s);
-            if (is_xmm) {
-                tcg_gen_movi_tl(s->T0, val);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, xmm_t0.ZMM_L(1)));
-                op1_offset = offsetof(CPUX86State,xmm_t0);
-            } else {
-                tcg_gen_movi_tl(s->T0, val);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, mmx_t0.MMX_L(0)));
-                tcg_gen_movi_tl(s->T0, 0);
-                tcg_gen_st32_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State, mmx_t0.MMX_L(1)));
-                op1_offset = offsetof(CPUX86State,mmx_t0);
-            }
-            assert(b1 < 2);
-            sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
-                                       (((modrm >> 3)) & 7)][b1];
-            if (!sse_fn_epp) {
-                goto unknown_op;
-            }
-            if (is_xmm) {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
-            } else {
-                rm = (modrm & 7);
-                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-            }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op1_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
-        case 0x050: /* movmskps */
-            rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
-            gen_helper_movmskps(s->tmp2_i32, cpu_env, s->ptr0);
-            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
-            break;
-        case 0x150: /* movmskpd */
-            rm = (modrm & 7) | REX_B(s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                             offsetof(CPUX86State,xmm_regs[rm]));
-            gen_helper_movmskpd(s->tmp2_i32, cpu_env, s->ptr0);
-            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
-            break;
-        case 0x02a: /* cvtpi2ps */
-        case 0x12a: /* cvtpi2pd */
-            gen_helper_enter_mmx(cpu_env);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,mmx_t0);
-                gen_ldq_env_A0(s, op2_offset);
-            } else {
-                rm = (modrm & 7);
-                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-            }
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            switch(b >> 8) {
-            case 0x0:
-                gen_helper_cvtpi2ps(cpu_env, s->ptr0, s->ptr1);
-                break;
-            default:
-            case 0x1:
-                gen_helper_cvtpi2pd(cpu_env, s->ptr0, s->ptr1);
-                break;
-            }
-            break;
-        case 0x22a: /* cvtsi2ss */
-        case 0x32a: /* cvtsi2sd */
-            ot = mo_64_32(s->dflag);
-            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            if (ot == MO_32) {
-                SSEFunc_0_epi sse_fn_epi = sse_op_table3ai[(b >> 8) & 1];
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                sse_fn_epi(cpu_env, s->ptr0, s->tmp2_i32);
-            } else {
-#ifdef TARGET_X86_64
-                SSEFunc_0_epl sse_fn_epl = sse_op_table3aq[(b >> 8) & 1];
-                sse_fn_epl(cpu_env, s->ptr0, s->T0);
-#else
-                goto illegal_op;
-#endif
-            }
-            break;
-        case 0x02c: /* cvttps2pi */
-        case 0x12c: /* cvttpd2pi */
-        case 0x02d: /* cvtps2pi */
-        case 0x12d: /* cvtpd2pi */
-            gen_helper_enter_mmx(cpu_env);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
-                gen_ldo_env_A0(s, op2_offset);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
-            }
-            op1_offset = offsetof(CPUX86State,fpregs[reg & 7].mmx);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            switch(b) {
-            case 0x02c:
-                gen_helper_cvttps2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            case 0x12c:
-                gen_helper_cvttpd2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            case 0x02d:
-                gen_helper_cvtps2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            case 0x12d:
-                gen_helper_cvtpd2pi(cpu_env, s->ptr0, s->ptr1);
-                break;
-            }
-            break;
-        case 0x22c: /* cvttss2si */
-        case 0x32c: /* cvttsd2si */
-        case 0x22d: /* cvtss2si */
-        case 0x32d: /* cvtsd2si */
-            ot = mo_64_32(s->dflag);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                if ((b >> 8) & 1) {
-                    gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_Q(0)));
-                } else {
-                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
-                    tcg_gen_st32_tl(s->T0, cpu_env,
-                                    offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
-                }
-                op2_offset = offsetof(CPUX86State,xmm_t0);
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
-            }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            if (ot == MO_32) {
-                SSEFunc_i_ep sse_fn_i_ep =
-                    sse_op_table3bi[((b >> 7) & 2) | (b & 1)];
-                sse_fn_i_ep(s->tmp2_i32, cpu_env, s->ptr0);
-                tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-            } else {
-#ifdef TARGET_X86_64
-                SSEFunc_l_ep sse_fn_l_ep =
-                    sse_op_table3bq[((b >> 7) & 2) | (b & 1)];
-                sse_fn_l_ep(s->T0, cpu_env, s->ptr0);
-#else
-                goto illegal_op;
-#endif
-            }
-            gen_op_mov_reg_v(s, ot, reg, s->T0);
-            break;
-        case 0xc4: /* pinsrw */
-        case 0x1c4:
-            s->rip_offset = 1;
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            val = x86_ldub_code(env, s);
-            if (b1) {
-                val &= 7;
-                tcg_gen_st16_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,xmm_regs[reg].ZMM_W(val)));
-            } else {
-                val &= 3;
-                tcg_gen_st16_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,fpregs[reg].mmx.MMX_W(val)));
-            }
-            break;
-        case 0xc5: /* pextrw */
-        case 0x1c5:
-            if (mod != 3)
-                goto illegal_op;
-            ot = mo_64_32(s->dflag);
-            val = x86_ldub_code(env, s);
-            if (b1) {
-                val &= 7;
-                rm = (modrm & 7) | REX_B(s);
-                tcg_gen_ld16u_tl(s->T0, cpu_env,
-                                 offsetof(CPUX86State,xmm_regs[rm].ZMM_W(val)));
-            } else {
-                val &= 3;
-                rm = (modrm & 7);
-                tcg_gen_ld16u_tl(s->T0, cpu_env,
-                                offsetof(CPUX86State,fpregs[rm].mmx.MMX_W(val)));
-            }
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            gen_op_mov_reg_v(s, ot, reg, s->T0);
-            break;
-        case 0x1d6: /* movq ea, xmm */
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_stq_env_A0(s, offsetof(CPUX86State,
-                                           xmm_regs[reg].ZMM_Q(0)));
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                gen_op_movq(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[reg].ZMM_Q(0)));
-                gen_op_movq_env_0(s,
-                                  offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(1)));
-            }
-            break;
-        case 0x2d6: /* movq2dq */
-            gen_helper_enter_mmx(cpu_env);
-            rm = (modrm & 7);
-            gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                        offsetof(CPUX86State,fpregs[rm].mmx));
-            gen_op_movq_env_0(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(1)));
-            break;
-        case 0x3d6: /* movdq2q */
-            gen_helper_enter_mmx(cpu_env);
-            rm = (modrm & 7) | REX_B(s);
-            gen_op_movq(s, offsetof(CPUX86State, fpregs[reg & 7].mmx),
-                        offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
-            break;
-        case 0xd7: /* pmovmskb */
-        case 0x1d7:
-            if (mod != 3)
-                goto illegal_op;
-            if (b1) {
-                rm = (modrm & 7) | REX_B(s);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, xmm_regs[rm]));
-                gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr0);
-            } else {
-                rm = (modrm & 7);
-                tcg_gen_addi_ptr(s->ptr0, cpu_env,
-                                 offsetof(CPUX86State, fpregs[rm].mmx));
-                gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, s->ptr0);
-            }
-  ((modrm >> 3) & 7) | REX_R(s);
-            mod = (modrm >> 6) & 3;
-
-            assert(b1 < 2);
-            sse_fn_epp = sse_op_table6[b].op[b1];
-            if (!sse_fn_epp) {
-                goto unknown_op;
-            }
-            if (!(s->cpuid_ext_features & sse_op_table6[b].ext_mask))
-                goto illegal_op;
-
-            if (b1) {
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
-                if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
-                } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    switch (b) {
-                    case 0x20: case 0x30: /* pmovsxbw, pmovzxbw */
-                    case 0x23: case 0x33: /* pmovsxwd, pmovzxwd */
-                    case 0x25: case 0x35: /* pmovsxdq, pmovzxdq */
-                        gen_ldq_env_A0(s, op2_offset +
-                                        offsetof(ZMMReg, ZMM_Q(0)));
-                        break;
-                    case 0x21: case 0x31: /* pmovsxbd, pmovzxbd */
-                    case 0x24: case 0x34: /* pmovsxwq, pmovzxwq */
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        tcg_gen_st_i32(s->tmp2_i32, cpu_env, op2_offset +
-                                        offsetof(ZMMReg, ZMM_L(0)));
-                        break;
-                    case 0x22: case 0x32: /* pmovsxbq, pmovzxbq */
-                        tcg_gen_qemu_ld_tl(s->tmp0, s->A0,
-                                           s->mem_index, MO_LEUW);
-                        tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
-                                        offsetof(ZMMReg, ZMM_W(0)));
-                        break;
-                    case 0x2a:            /* movntqda */
-                        gen_ldo_env_A0(s, op1_offset);
-                        return;
-                    default:
-                        gen_ldo_env_A0(s, op2_offset);
-                    }
-                }
-            } else {
-                op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
-                if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-                } else {
-                    op2_offset = offsetof(CPUX86State,mmx_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldq_env_A0(s, op2_offset);
-                }
-            }
-            if (sse_fn_epp == SSE_SPECIAL) {
-                goto unknown_op;
-            }
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-
-            if (b == 0x17) {
-                set_cc_op(s, CC_OP_EFLAGS);
-            }
-            break;
-
-        case 0x238:
-        case 0x338:
-        do_0f_38_fx:
-            /* Various integer extensions at 0f 38 f[0-f].  */
-            b = modrm | (b1 << 8);
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-
-            switch (b) {
-            case 0x3f0: /* crc32 Gd,Eb */
-            case 0x3f1: /* crc32 Gd,Ey */
-            do_crc32:
-                if (!(s->cpuid_ext_features & CPUID_EXT_SSE42)) {
-                    goto illegal_op;
-                }
-                if ((b & 0xff) == 0xf0) {
-                    ot = MO_8;
-                } else if (s->dflag != MO_64) {
-                    ot = (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
-                } else {
-                    ot = MO_64;
-                }
-
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[reg]);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                gen_helper_crc32(s->T0, s->tmp2_i32,
-                                 s->T0, tcg_const_i32(8 << ot));
-
-                ot = mo_64_32(s->dflag);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            case 0x1f0: /* crc32 or movbe */
-            case 0x1f1:
-                /* For these insns, the f3 prefix is supposed to have priority
-                   over the 66 prefix, but that's not what we implement above
-                   setting b1.  */
-                if (s->prefix & PREFIX_REPNZ) {
-                    goto do_crc32;
-                }
-                /* FALLTHRU */
-            case 0x0f0: /* movbe Gy,My */
-            case 0x0f1: /* movbe My,Gy */
-                if (!(s->cpuid_ext_features & CPUID_EXT_MOVBE)) {
-                    goto illegal_op;
-                }
-                if (s->dflag != MO_64) {
-                    ot = (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
-                } else {
-                    ot = MO_64;
-                }
-
-                gen_lea_modrm(env, s, modrm);
-                if ((b & 1) == 0) {
-                    tcg_gen_qemu_ld_tl(s->T0, s->A0,
-                                       s->mem_index, ot | MO_BE);
-                    gen_op_mov_reg_v(s, ot, reg, s->T0);
-                } else {
-                    tcg_gen_qemu_st_tl(cpu_regs[reg], s->A0,
-                                       s->mem_index, ot | MO_BE);
-                }
-                break;
-
-            case 0x0f2: /* andn Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                tcg_gen_andc_tl(s->T0, s->T0, cpu_regs[s->vex_v]);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                gen_op_update1_cc(s);
-                set_cc_op(s, CC_OP_LOGICB + ot);
-                break;
-
-            case 0x0f7: /* bextr Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                {
-                    TCGv bound, zero;
-
-                    gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                    /* Extract START, and shift the operand.
-                       Shifts larger than operand size get zeros.  */
-                    tcg_gen_ext8u_tl(s->A0, cpu_regs[s->vex_v]);
-                    tcg_gen_shr_tl(s->T0, s->T0, s->A0);
-
-                    bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
-                    zero = tcg_const_tl(0);
-                    tcg_gen_movcond_tl(TCG_COND_LEU, s->T0, s->A0, bound,
-                                       s->T0, zero);
-                    tcg_temp_free(zero);
-
-                    /* Extract the LEN into a mask.  Lengths larger than
-                       operand size get all ones.  */
-                    tcg_gen_extract_tl(s->A0, cpu_regs[s->vex_v], 8, 8);
-                    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound,
-                                       s->A0, bound);
-                    tcg_temp_free(bound);
-                    tcg_gen_movi_tl(s->T1, 1);
-                    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
-                    tcg_gen_subi_tl(s->T1, s->T1, 1);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-
-                    gen_op_mov_reg_v(s, ot, reg, s->T0);
-                    gen_op_update1_cc(s);
-                    set_cc_op(s, CC_OP_LOGICB + ot);
-                }
-                break;
-
-            case 0x0f5: /* bzhi Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
-                {
-                    TCGv bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
-                    /* Note that since we're using BMILG (in order to get O
-                       cleared) we need to store the inverse into C.  */
-                    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src,
-                                       s->T1, bound);
-                    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1,
-                                       bound, bound, s->T1);
-                    tcg_temp_free(bound);
-                }
-                tcg_gen_movi_tl(s->A0, -1);
-                tcg_gen_shl_tl(s->A0, s->A0, s->T1);
-                tcg_gen_andc_tl(s->T0, s->T0, s->A0);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                gen_op_update1_cc(s);
-                set_cc_op(s, CC_OP_BMILGB + ot);
-                break;
-
-            case 0x3f6: /* mulx By, Gy, rdx, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                switch (ot) {
-                default:
-                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                    tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EDX]);
-                    tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
-                                      s->tmp2_i32, s->tmp3_i32);
-                    tcg_gen_extu_i32_tl(cpu_regs[s->vex_v], s->tmp2_i32);
-                    tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp3_i32);
-                    break;
-#ifdef TARGET_X86_64
-                case MO_64:
-                    tcg_gen_mulu2_i64(s->T0, s->T1,
-                                      s->T0, cpu_regs[R_EDX]);
-                    tcg_gen_mov_i64(cpu_regs[s->vex_v], s->T0);
-                    tcg_gen_mov_i64(cpu_regs[reg], s->T1);
-                    break;
-#endif
-                }
-                break;
-
-            case 0x3f5: /* pdep Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the source operand, we
-                   automatically handle zero-extending the result.  */
-                if (ot == MO_64) {
-                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
-                } else {
-                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
-                }
-                gen_helper_pdep(cpu_regs[reg], s->T1, s->T0);
-                break;
-
-            case 0x2f5: /* pext Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the source operand, we
-                   automatically handle zero-extending the result.  */
-                if (ot == MO_64) {
-                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
-                } else {
-                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
-                }
-                gen_helper_pext(cpu_regs[reg], s->T1, s->T0);
-                break;
-
-            case 0x1f6: /* adcx Gy, Ey */
-            case 0x2f6: /* adox Gy, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX)) {
-                    goto illegal_op;
-                } else {
-                    TCGv carry_in, carry_out, zero;
-                    int end_op;
-
-                    ot = mo_64_32(s->dflag);
-                    gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-
-                    /* Re-use the carry-out from a previous round.  */
-                    carry_in = NULL;
-                    carry_out = (b == 0x1f6 ? cpu_cc_dst : cpu_cc_src2);
-                    switch (s->cc_op) {
-                    case CC_OP_ADCX:
-                        if (b == 0x1f6) {
-                            carry_in = cpu_cc_dst;
-                            end_op = CC_OP_ADCX;
-                        } else {
-                            end_op = CC_OP_ADCOX;
-                        }
-                        break;
-                    case CC_OP_ADOX:
-                        if (b == 0x1f6) {
-                            end_op = CC_OP_ADCOX;
-                        } else {
-                            carry_in = cpu_cc_src2;
-                            end_op = CC_OP_ADOX;
-                        }
-                        break;
-                    case CC_OP_ADCOX:
-                        end_op = CC_OP_ADCOX;
-                        carry_in = carry_out;
-                        break;
-                    default:
-                        end_op = (b == 0x1f6 ? CC_OP_ADCX : CC_OP_ADOX);
-                        break;
-                    }
-                    /* If we can't reuse carry-out, get it out of EFLAGS.  */
-                    if (!carry_in) {
-                        if (s->cc_op != CC_OP_ADCX && s->cc_op != CC_OP_ADOX) {
-                            gen_compute_eflags(s);
-                        }
-                        carry_in = s->tmp0;
-                        tcg_gen_extract_tl(carry_in, cpu_cc_src,
-                                           ctz32(b == 0x1f6 ? CC_C : CC_O), 1);
-                    }
-
-                    switch (ot) {
-#ifdef TARGET_X86_64
-                    case MO_32:
-                        /* If we know TL is 64-bit, and we want a 32-bit
-                           result, just do everything in 64-bit arithmetic.  */
-                        tcg_gen_ext32u_i64(cpu_regs[reg], cpu_regs[reg]);
-                        tcg_gen_ext32u_i64(s->T0, s->T0);
-                        tcg_gen_add_i64(s->T0, s->T0, cpu_regs[reg]);
-                        tcg_gen_add_i64(s->T0, s->T0, carry_in);
-                        tcg_gen_ext32u_i64(cpu_regs[reg], s->T0);
-                        tcg_gen_shri_i64(carry_out, s->T0, 32);
-                        break;
-#endif
-                    default:
-                        /* Otherwise compute the carry-out in two steps.  */
-                        zero = tcg_const_tl(0);
-                        tcg_gen_add2_tl(s->T0, carry_out,
-                                        s->T0, zero,
-                                        carry_in, zero);
-                        tcg_gen_add2_tl(cpu_regs[reg], carry_out,
-                                        cpu_regs[reg], carry_out,
-                                        s->T0, zero);
-                        tcg_temp_free(zero);
-                        break;
-                    }
-                    set_cc_op(s, end_op);
-                }
-                break;
-
-            case 0x1f7: /* shlx Gy, Ey, By */
-            case 0x2f7: /* sarx Gy, Ey, By */
-            case 0x3f7: /* shrx Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                if (ot == MO_64) {
-                  tcg_gen_ext32s_tl(s->T0, s->T0);
-                    }
-                    tcg_gen_sar_tl(s->T0, s->T0, s->T1);
-                } else {
-                    if (ot != MO_64) {
-                        tcg_gen_ext32u_tl(s->T0, s->T0);
-                    }
-                    tcg_gen_shr_tl(s->T0, s->T0, s->T1);
-                }
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            case 0x0f3:
-            case 0x1f3:
-            case 0x2f3:
-            case 0x3f3: /* Group 17 */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-
-                tcg_gen_mov_tl(cpu_cc_src, s->T0);
-                switch (reg & 7) {
-                case 1: /* blsr By,Ey */
-                    tcg_gen_subi_tl(s->T1, s->T0, 1);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-                    break;
-                case 2: /* blsmsk By,Ey */
-                    tcg_gen_subi_tl(s->T1, s->T0, 1);
-                    tcg_gen_xor_tl(s->T0, s->T0, s->T1);
-                    break;
-                case 3: /* blsi By, Ey */
-                    tcg_gen_neg_tl(s->T1, s->T0);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-                    break;
-                default:
-                    goto unknown_op;
-                }
-                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-                gen_op_mov_reg_v(s, ot, s->vex_v, s->T0);
-                set_cc_op(s, CC_OP_BMILGB + ot);
-                break;
-
-            default:
-                goto unknown_op;
-            }
-            break;
-
-        case 0x03a:
-        case 0x13a:
-            b = modrm;
-            modrm = x86_ldub_code(env, s);
-            rm = modrm & 7;
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            mod = (modrm >> 6) & 3;
-
-            assert(b1 < 2);
-            sse_fn_eppi = sse_op_table7[b].op[b1];
-            if (!sse_fn_eppi) {
-                goto unknown_op;
-            }
-            if (!(s->cpuid_ext_features & sse_op_table7[b].ext_mask))
-                goto illegal_op;
-
-            s->rip_offset = 1;
-
-            if (sse_fn_eppi == SSE_SPECIAL) {
-                ot = mo_64_32(s->dflag);
-                rm = (modrm & 7) | REX_B(s);
-                if (mod != 3)
-                    gen_lea_modrm(env, s, modrm);
-                reg = ((modrm >> 3) & 7) | REX_R(s);
-                val = x86_ldub_code(env, s);
-                switch (b) {
-                case 0x14: /* pextrb */
-                    tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_B(val & 15)));
-                    if (mod == 3) {
-                        gen_op_mov_reg_v(s, ot, rm, s->T0);
-                    } else {
-                        tcg_gen_qemu_st_tl(s->T0, s->A0,
-                                           s->mem_index, MO_UB);
-                    }
-                    break;
-                case 0x15: /* pextrw */
-                    tcg_gen_ld16u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_W(val & 7)));
-                    if (mod == 3) {
-                        gen_op_mov_reg_v(s, ot, rm, s->T0);
-                    } else {
-                        tcg_gen_qemu_st_tl(s->T0, s->A0,
-                                           s->mem_index, MO_LEUW);
-                    }
-                    break;
-                case 0x16:
-                    if (ot == MO_32) { /* pextrd */
-                        tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(val & 3)));
-                        if (mod == 3) {
-                            tcg_gen_extu_i32_tl(cpu_regs[rm], s->tmp2_i32);
-                        } else {
-                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                        }
-                    } else { /* pextrq */
-#ifdef TARGET_X86_64
-                        tcg_gen_ld_i64(s->tmp1_i64, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_Q(val & 1)));
-                        if (mod == 3) {
-                            tcg_gen_mov_i64(cpu_regs[rm], s->tmp1_i64);
-                        } else {
-                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                        }
-#else
-                        goto illegal_op;
-#endif
-                    }
-                    break;
-                case 0x17: /* extractps */
-                    tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_L(val & 3)));
-                    if (mod == 3) {
-                        gen_op_mov_reg_v(s, ot, rm, s->T0);
-                    } else {
-                        tcg_gen_qemu_st_tl(s->T0, s->A0,
-                                           s->mem_index, MO_LEUL);
-                    }
-                    break;
-                case 0x20: /* pinsrb */
-                    if (mod == 3) {
-                        gen_op_mov_v_reg(s, MO_32, s->T0, rm);
-                    } else {
-                        tcg_gen_qemu_ld_tl(s->T0, s->A0,
-                                           s->mem_index, MO_UB);
-                    }
-                    tcg_gen_st8_tl(s->T0, cpu_env, offsetof(CPUX86State,
-                                            xmm_regs[reg].ZMM_B(val & 15)));
-                    break;
-                case 0x21: /* insertps */
-                    if (mod == 3) {
-                        tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                                        offsetof(CPUX86State,xmm_regs[rm]
-                                                .ZMM_L((val >> 6) & 3)));
-                    } else {
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                    }
-                    tcg_gen_st_i32(s->tmp2_i32, cpu_env,
-                                    offsetof(CPUX86State,xmm_regs[reg]
-                                            .ZMM_L((val >> 4) & 3)));
-                    if ((val >> 0) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(0)));
-                    if ((val >> 1) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(1)));
-                    if ((val >> 2) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(2)));
-                    if ((val >> 3) & 1)
-                        tcg_gen_st_i32(tcg_const_i32(0 /*float32_zero*/),
-                                        cpu_env, offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(3)));
-                    break;
-                case 0x22:
-                    if (ot == MO_32) { /* pinsrd */
-                        if (mod == 3) {
-                            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[rm]);
-                        } else {
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                        }
-                        tcg_gen_st_i32(s->tmp2_i32, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_L(val & 3)));
-                    } else { /* pinsrq */
-#ifdef TARGET_X86_64
-                        if (mod == 3) {
-                            gen_op_mov_v_reg(s, ot, s->tmp1_i64, rm);
-                        } else {
-                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                        }
-                        tcg_gen_st_i64(s->tmp1_i64, cpu_env,
-                                        offsetof(CPUX86State,
-                                                xmm_regs[reg].ZMM_Q(val & 1)));
-#else
-                        goto illegal_op;
-#endif
-                    }
-                    break;
-                }
-                return;
-            }
-
-            if (b1) {
-                op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
-                if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,xmm_regs[rm | REX_B(s)]);
-                } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldo_env_A0(s, op2_offset);
-                }
-            } else {
-                op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
-                if (mod == 3) {
-                    op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-                } else {
-                    op2_offset = offsetof(CPUX86State,mmx_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldq_env_A0(s, op2_offset);
-                }
-            }
-            val = x86_ldub_code(env, s);
-
-            if ((b & 0xfc) == 0x60) { /* pcmpXstrX */
-                set_cc_op(s, CC_OP_EFLAGS);
-
-                if (s->dflag == MO_64) {
-                    /* The helper must use entire 64-bit gp registers */
-                    val |= 1 << 8;
-                }
-            }
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_eppi(cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
-            break;
-
-        case 0x33a:
-            /* Various integer extensions at 0f 3a f[0-f].  */
-            b = modrm | (b1 << 8);
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-
-            switch (b) {
-            case 0x3f0: /* rorx Gy,Ey, Ib */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                b = x86_ldub_code(env, s);
-                if (ot == MO_64) {
-                    tcg_gen_rotri_tl(s->T0, s->T0, b & 63);
-                } else {
-                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                    tcg_gen_rotri_i32(s->tmp2_i32, s->tmp2_i32, b & 31);
-                    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-                }
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            default:
-                goto unknown_op;
-            }
-            break;
-
-        default:
-        unknown_op:
-            gen_unknown_opcode(env, s);
-            return;
-        }
-    } else {
-        /* generic MMX or SSE operation */
-        switch(b) {
-        case 0x70: /* pshufx insn */
-        case 0xc6: /* pshufx insn */
-        case 0xc2: /* compare insns */
-            s->rip_offset = 1;
-            break;
-        default:
-            break;
-        }
-        if (is_xmm) {
-            op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
-            if (mod != 3) {
-                int sz = 4;
-
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
-
-                switch (b) {
-                case 0x50 ... 0x5a:
-                case 0x5c ... 0x5f:
-                case 0xc2:
-                    /* Most sse scalar operations.  */
-                    if (b1 == 2) {
-                        sz = 2;
-                    } else if (b1 == 3) {
-                        sz = 3;
-                    }
-                    break;
-
-                case 0x2e:  /* ucomis[sd] */
-                case 0x2f:  /* comis[sd] */
-                    if (b1 == 0) {
-                        sz = 2;
-                    } else {
-                        sz = 3;
-                    }
-                    break;
-                }
-
-                switch (sz) {
-                case 2:
-                    /* 32 bit access */
-                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
-                    tcg_gen_st32_tl(s->T0, cpu_env,
-                                    offsetof(CPUX86State,xmm_t0.ZMM_L(0)));
-                    break;
-                case 3:
-                    /* 64 bit access */
-                    gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
-                    break;
-                default:
-                    /* 128 bit access */
-                    gen_ldo_env_A0(s, op2_offset);
-                    break;
-                }
-            } else {
-                rm = (modrm & 7) | REX_B(s);
-                op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
-            }
-        } else {
-            op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,mmx_t0);
-                gen_ldq_env_A0(s, op2_offset);
-            } else {
-                rm = (modrm & 7);
-                op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
-            }
-        }
-        switch(b) {
-        case 0x0f: /* 3DNow! data insns */
-            val = x86_ldub_code(env, s);
-            sse_fn_epp = sse_op_table5[val];
-            if (!sse_fn_epp) {
-                goto unknown_op;
-            }
-            if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
-                goto illegal_op;
-            }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
-        case 0x70: /* pshufx insn */
-        case 0xc6: /* pshufx insn */
-            val = x86_ldub_code(env, s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            /* XXX: introduce a new table? */
-            sse_fn_ppi = (SSEFunc_0_ppi)sse_fn_epp;
-            sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
-            break;
-        case 0xc2:
-            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
-            val = x86_ldub_code(env, s) & 7;
-            sse_fn_epp = sse_op_table4[val][b1];
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
-        case 0xf7:
-            /* maskmov : we must prepare A0 */
-            if (mod != 3)
-                goto illegal_op;
-            tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
-            gen_extu(s->aflag, s->A0);
-            gen_add_A0_ds_seg(s);
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s-tr0, s->ptr1);
-            break;
-        }
-        if (b == 0x2e || b == 0x2f) {
-            set_cc_op(s, CC_OP_EFLAGS);
-        }
-    }
-}
-
-/* convert one instruction. s->base.is_jmp is set if the translation must
-   be stopped. Return the next pc value */
-static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
-{
-    CPUX86State *env = cpu->env_ptr;
-    int b, prefixes;
-    int shift;
-    MemOp ot, aflag, dflag;
-    int modrm, reg, rm, mod, op, opreg, val;
-    target_ulong next_eip, tval;
-    target_ulong pc_start = s->base.pc_next;
-
-    s->pc_start = s->pc = pc_start;
-    s->override = -1;
-#ifdef TARGET_X86_64
-    s->rex_w = false;
-    s->rex_r = 0;
-    s->rex_x = 0;
-    s->rex_b = 0;
-#endif
-    s->rip_offset = 0; /* for relative ip address */
-    s->vex_l = 0;
-    s->vex_v = 0;
-    if (sigsetjmp(s->jmpbuf, 0) != 0) {
-        gen_exception_gpf(s);
-        return s->pc;
-    }
-
-    prefixes = 0;
-
- next_byte:
-    b = x86_ldub_code(env, s);
-    /* Collect prefixes.  */
-    switch (b) {
-    case 0xf3:
-        prefixes |= PREFIX_REPZ;
-        goto next_byte;
-    case 0xf2:
-        prefixes |= PREFIX_REPNZ;
-        goto next_byte;
-    case 0xf0:
-        prefixes |= PREFIX_LOCK;
-        goto next_byte;
-    case 0x2e:
-        s->override = R_CS;
-        goto next_byte;
-    case 0x36:
-        s->override = R_SS;
-        goto next_byte;
-    case 0x3e:
-        s->override = R_DS;
-        goto next_byte;
-    case 0x26:
-        s->override = R_ES;
-        goto next_byte;
-    case 0x64:
-        s->override = R_FS;
-        goto next_byte;
-    case 0x65:
-        s->override = R_GS;
-        goto next_byte;
-    case 0x66:
-        prefixes |= PREFIX_DATA;
-        goto next_byte;
-    case 0x67:
-        prefixes |= PREFIX_ADR;
-        goto next_byte;
-#ifdef TARGET_X86_64
-    case 0x40 ... 0x4f:
-        if (CODE64(s)) {
-            /* REX prefix */
-            prefixes |= PREFIX_REX;
-            s->rex_w = (b >> 3) & 1;
-            s->rex_r = (b & 0x4) << 1;
-            s->rex_x = (b & 0x2) << 2;
-            s->rex_b = (b & 0x1) << 3;
-            goto next_byte;
-        }
-        break;
-#endif
-    case 0xc5: /* 2-byte VEX */
-    case 0xc4: /* 3-byte VEX */
-        /* VEX prefixes cannot be used except in 32-bit mode.
-           Otherwise the instruction is LES or LDS.  */
-        if (CODE32(s) && !VM86(s)) {
-            static const int pp_prefix[4] = {
-                0, PREFIX_DATA, PREFIX_REPZ, PREFIX_REPNZ
-            };
-            int vex3, vex2 = x86_ldub_code(env, s);
-
-            if (!CODE64(s) && (vex2 & 0xc0) != 0xc0) {
-                /* 4.1.4.6: In 32-bit mode, bits [7:6] must be 11b,
-                   otherwise the instruction is LES or LDS.  */
-                s->pc--; /* rewind the advance_pc() x86_ldub_code() did */
-                break;
-            }
-
-            /* 4.1.1-4.1.3: No preceding lock, 66, f2, f3, or rex prefixes. */
-            if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ
-                            | PREFIX_LOCK | PREFIX_DATA | PREFIX_REX)) {
-                goto illegal_op;
-            }
-#ifdef TARGET_X86_64
-            s->rex_r = (~vex2 >> 4) & 8;
-#endif
-            if (b == 0xc5) {
-                /* 2-byte VEX prefix: RVVVVlpp, implied 0f leading opcode byte */
-                vex3 = vex2;
-                b = x86_ldub_code(env, s) | 0x100;
-            } else {
-                /* 3-byte VEX prefix: RXBmmmmm wVVVVlpp */
-                vex3 = x86_ldub_code(env, s);
-#ifdef TARGET_X86_64
-                s->rex_x = (~vex2 >> 3) & 8;
-                s->rex_b = (~vex2 >> 2) & 8;
-                s->rex_w = (vex3 >> 7) & 1;
-#endif
-                switch (vex2 & 0x1f) {
-                case 0x01: /* Implied 0f leading opcode bytes.  */
-                    b = x86_ldub_code(env, s) | 0x100;
-                    break;
-                case 0x02: /* Implied 0f 38 leading opcode bytes.  */
-                    b = 0x138;
-                    break;
-                case 0x03: /* Implied 0f 3a leading opcode bytes.  */
-                    b = 0x13a;
-                    break;
-                default:   /* Reserved for future use.  */
-                    goto unknown_op;
-                }
-            }
-            s->vex_v = (~vex3 >> 3) & 0xf;
-            s->vex_l = (vex3 >> 2) & 1;
-            prefixes |= pp_prefix[vex3 & 3] | PREFIX_VEX;
-        }
-        break;
-    }
-
-    /* Post-process prefixes.  */
-    if (CODE64(s)) {
-        /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
-           data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
-           over 0x66 if both are present.  */
-        dflag = (REX_W(s) ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO_32);
-        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
-        aflag = (prefixes & PREFIX_ADR ? MO_32 : MO_64);
-    } else {
-        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
-        if (CODE32(s) ^ ((prefixes & PREFIX_DATA) != 0)) {
-            dflag = MO_32;
-        } else {
-            dflag = MO_16;
-        }
-        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
-        if (CODE32(s) ^ ((prefixes & PREFIX_ADR) != 0)) {
-            aflag = MO_32;
-        }  else {
-            aflag = MO_16;
-        }
-    }
-
-    s->prefix = prefixes;
-    s->aflag = aflag;
-    s->dflag = dflag;
-
-    /* now check op code */
- reswitch:
-    switch(b) {
-    case 0x0f:
-        /**************************/
-        /* extended op code */
-        b = x86_ldub_code(env, s) | 0x100;
-        goto reswitch;
-
-        /**************************/
-        /* arith & logic */
-    case 0x00 ... 0x05:
-    case 0x08 ... 0x0d:
-    case 0x10 ... 0x15:
-    case 0x18 ... 0x1d:
-    case 0x20 ... 0x25:
-    case 0x28 ... 0x2d:
-    case 0x30 ... 0x35:
-    case 0x38 ... 0x3d:
-        {
-            int op, f, val;
-            op = (b >> 3) & 7;
-            f = (b >> 1) & 3;
-
-            ot = mo_b_d(b, dflag);
-
-            switch(f) {
-            case 0: /* OP Ev, Gv */
-                modrm = x86_ldub_code(env, s);
-                reg = ((modrm >> 3) & 7) | REX_R(s);
-                mod = (modrm >> 6) & 3;
-                rm = (modrm & 7) | REX_B(s);
-                if (mod != 3) {
-                    gen_lea_modrm(env, s, modrm);
-                    opreg = OR_TMP0;
-                } else if (op == OP_XORL && rm == reg) {
-                xor_zero:
-                    /* xor reg, reg optimisation */
-                    set_cc_op(s, CC_OP_CLR);
-                    tcg_gen_movi_tl(s->T0, 0);
-                    gen_op_mov_reg_v(s, ot, reg, s->T0);
-                    break;
-                } else {
-                    opreg = rm;
-                }
-                gen_op_mov_v_reg(s, ot, s->T1, reg);
-                gen_op(s, op, ot, opreg);
-                break;
-            case 1: /* OP Gv, Ev */
-                modrm = x86_ldub_code(env, s);
-                mod = (modrm >> 6) & 3;
-                reg = ((modrm >> 3) & 7) | REX_R(s);
-                rm = (modrm & 7) | REX_B(s);
-                if (mod != 3) {
-                    gen_lea_modrm(env, s, modrm);
-                    gen_op_ld_v(s, ot, s->T1, s->A0);
-                } else if (op == OP_XORL && rm == reg) {
-                    goto xor_zero;
-                } else {
-                    gen_op_mov_v_reg(s, ot, s->T1, rm);
-                }
-                gen_op(s, op, ot, reg);
-                break;
-            case 2: /* OP A, Iv */
-                val = insn_get(env, s, ot);
-                tcg_gen_movi_tl(s->T1, val);
-                gen_op(s, op, ot, OR_EAX);
-                break;
-            }
-        }
-        break;
-
-    case 0x82:
-        if (CODE64(s))
-            goto illegal_op;
-        /* fall through */
-    case 0x80: /* GRP1 */
-    case 0x81:
-    case 0x83:
-        {
-            int val;
-
-            ot = mo_b_d(b, dflag);
-
-            modrm = x86_ldub_code(env, s);
-            mod = (modrm >> 6) & 3;
-            rm = (modrm & 7) | REX_B(s);
-            op = (modrm >> 3) & 7;
-
-            if (mod != 3) {
-                if (b == 0x83)
-                    s->rip_offset = 1;
-                else
-                    s->rip_offset = insn_const_size(ot);
-                gen_lea_modrm(env, s, modrm);
-                opreg = OR_TMP0;
-            } else {
-                opreg = rm;
-            }
-
-            switch(b) {
-            default:
-            case 0x80:
-            case 0x81:
-            case 0x82:
-                val = insn_get(env, s, ot);
-                break;
-            case 0x83:
-                val = (int8_t)insn_get(env, s, MO_8);
-                break;
-            }
-            tcg_gen_movi_tl(s->T1, val);
-            gen_op(s, op, ot, opreg);
-        }
-        break;
-
-        /**************************/
-        /* inc, dec, and other misc arith */
-    case 0x40 ... 0x47: /* inc Gv */
-        ot = dflag;
-        gen_inc(s, ot, OR_EAX + (b & 7), 1);
-        break;
-    case 0x48 ... 0x4f: /* dec Gv */
-        ot = dflag;
-        gen_inc(s, ot, OR_EAX + (b & 7), -1);
-        break;
-    case 0xf6: /* GRP3 */
-    case 0xf7:
-        ot = mo_b_d(b, dflag);
-
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        rm = (modrm & 7) | REX_B(s);
-        op = (modrm >> 3) & 7;
-        if (mod != 3) {
-            if (op == 0) {
-                s->rip_offset = insn_const_size(ot);
-            }
-            gen_lea_modrm(env, s, modrm);
-            /* For those below that handle locked memory, don't load here.  */
-            if (!(s->prefix & PREFIX_LOCK)
-                || op != 2) {
-                gen_op_ld_v(s, ot, s->T0, s->A0);
-            }
-        } else {
-            gen_op_mov_v_reg(s, ot, s->T0, rm);
-        }
-
-        switch(op) {
-        case 0: /* test */
-            val = insn_get(env, s, ot);
-            tcg_gen_movi_tl(s->T1, val);
-            gen_op_testl_T0_T1_cc(s);
-            set_cc_op(s, CC_OP_LOGICB + ot);
-            break;
-        case 2: /* not */
-            if (s->prefix & PREFIX_LOCK) {
-                if (mod == 3) {
-                    goto illegal_op;
-                }
-                tcg_gen_movi_tl(s->T0, ~0);
-                tcg_gen_atomic_xor_fetch_tl(s->T0, s->A0, s->T0,
-                                            s->mem_index, ot | MO_LE);
-            } else {
-                tcg_gen_not_tl(s->T0, s->T0);
-                if (mod != 3) {
-                    gen_op_st_v(s, ot, s->T0, s->A0);
-                } else {
-                    gen_op_mov_reg_v(s, ot, rm, s->T0);
-                }
-            }
-            break;
-        case 3: /* neg */
-            if (s->prefix & PREFIX_LOCK) {
-                TCGLabel *label1;
-                TCGv a0, t0, t1, t2;
-
-                if (mod == 3) {
-                    goto illegal_op;
-                }
-                a0 = tcg_temp_local_new();
-                t0 = tcg_temp_local_new();
-                label1 = gen_new_label();
-
-                tcg_gen_mov_tl(a0, s->A0);
-                tcg_gen_mov_tl(t0, s->T0);
-
-                gen_set_label(label1);
-                t1 = tcg_temp_new();
-                t2 = tcg_temp_new();
-                tcg_gen_mov_tl(t2, t0);
-                tcg_gen_neg_tl(t1, t0);
-                tcg_gen_atomic_cmpxchg_tl(t0, a0, t0, t1,
-                                          s->mem_index, ot | MO_LE);
-                tcg_temp_free(t1);
-                tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
-
-                tcg_temp_free(t2);
-                tcg_temp_free(a0);
-                tcg_gen_mov_tl(s->T0, t0);
-                tcg_temp_free(t0);
-            } else {
-                tcg_gen_neg_tl(s->T0, s->T0);
-                if (mod != 3) {
-                    gen_op_st_v(s, ot, s->T0, s->A0);
-                } else {
-                    gen_op_mov_reg_v(s, ot, rm, s->T0);
-                }
-            }
-            gen_op_update_neg_cc(s);
-            set_cc_op(s, CC_OP_SUBB + ot);
-            break;
-        case 4: /* mul */
-            switch(ot) {
-            case MO_8:
-                gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
-                tcg_gen_ext8u_tl(s->T0, s->T0);
-                tcg_gen_ext8u_tl(s->T1, s->T1);
-                /* XXX: use 32 bit mul which could be faster */
-                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
-                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-                tcg_gen_andi_tl(cpu_cc_src, s->T0, 0xff00);
-                set_cc_op(s, CC_OP_MULB);
-                break;
-            case MO_16:
-                gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
-                tcg_gen_ext16u_tl(s->T0, s->T0);
-                tcg_gen_ext16u_tl(s->T1, s->T1);
-                /* XXX: use 32 bit mul which could be faster */
-                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
-                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-                tcg_gen_shri_tl(s->T0, s->T0, 16);
-                gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
-                tcg_gen_mov_tl(cpu_cc_src, s->T0);
-                set_cc_op(s, CC_OP_MULW);
-                break;
-            default:
-            case MO_32:
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EAX]);
-                tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
-                                  s->tmp2_i32, s->tmp3_i32);
-                tcg_gen_extu_i32_tl(cpu_regs[R_EAX], s->tmp2_i32);
-                tcg_gen_extu_i32_tl(cpu_regs[R_EDX], s->tmp3_i32);
-                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
-                tcg_gen_mov_tl(cpu_cc_src, cpu_regs[R_EDX]);
-                set_cc_op(s, CC_OP_MULL);
-                break;
-#ifdef TARGET_X86_64
-            case MO_64:
-                tcg_gen_mulu2_i64(cpu_regs[R_EAX], cpu_regs[R_EDX],
-                                  s->T0, cpu_regs[R_EAX]);
-                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
-                tcg_gen_mov_tl(cpu_cc_src, cpu_regs[R_EDX]);
-                set_cc_op(s, CC_OP_MULQ);
-                break;
-#endif
-            }
-            break;
-        case 5: /* imul */
-            switch(ot) {
-            case MO_8:
-                gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
-                tcg_gen_ext8s_tl(s->T0, s->T0);
-                tcg_gen_ext8s_tl(s->T1, s->T1);
-                /* XXX: use 32 bit mul which could be faster */
-                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
-                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-                tcg_gen_ext8s_tl(s->tmp0, s->T0);
-                tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
-                set_cc_op(s, CC_OP_MULB);
-                break;
-            case MO_16:
-                gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
-                tcg_gen_ext16s_tl(s->T0, s->T0);
-                tcg_gen_ext16s_tl(s->T1, s->T1);
-                /* XXX: use 32 bit mul which could be faster */
-                tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
-                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-                tcg_gen_ext16s_tl(s->tmp0, s->T0);
-                tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
-                tcg_gen_shri_tl(s->T0, s->T0, 16);
-                gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
-                set_cc_op(s, CC_OP_MULW);
-            tcg_gen_sari_i32(s->tmp2_i32, s->tmp2_i32, 31);
-                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
-                tcg_gen_sub_i32(s->tmp2_i32, s->tmp2_i32, s->tmp3_i32);
-                tcg_gen_extu_i32_tl(cpu_cc_src, s->tmp2_i32);
-                set_cc_op(s, CC_OP_MULL);
-                break;
-#ifdef TARGET_X86_64
-            case MO_64:
-                tcg_gen_muls2_i64(cpu_regs[R_EAX], cpu_regs[R_EDX],
-                                  s->T0, cpu_regs[R_EAX]);
-                tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[R_EAX]);
-                tcg_gen_sari_tl(cpu_cc_src, cpu_regs[R_EAX], 63);
-                tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, cpu_regs[R_EDX]);
-                set_cc_op(s, CC_OP_MULQ);
-                break;
-#endif
-            }
-            break;
-        case 6: /* div */
-            switch(ot) {
-            case MO_8:
-                gen_helper_divb_AL(cpu_env, s->T0);
-                break;
-            case MO_16:
-                gen_helper_divw_AX(cpu_env, s->T0);
-                break;
-            default:
-            case MO_32:
-                gen_helper_divl_EAX(cpu_env, s->T0);
-                break;
-#ifdef TARGET_X86_64
-            case MO_64:
-                gen_helper_divq_EAX(cpu_env, s->T0);
-                break;
-#endif
-            }
-            break;
-        case 7: /* idiv */
-            switch(ot) {
-            case MO_8:
-                gen_helper_idivb_AL(cpu_env, s->T0);
-                break;
-            case MO_16:
-                gen_helper_idivw_AX(cpu_env, s->T0);
-                break;
-            default:
-            case MO_32:
-                gen_helper_idivl_EAX(cpu_env, s->T0);
-                break;
-#ifdef TARGET_X86_64
-            case MO_64:
-                gen_helper_idivq_EAX(cpu_env, s->T0);
-                break;
-#endif
-            }
-            break;
-        default:
-            goto unknown_op;
-        }
-        break;
-
-    case 0xfe: /* GRP4 */
-    case 0xff: /* GRP5 */
-        ot = mo_b_d(b, dflag);
-
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        rm = (modrm & 7) | REX_B(s);
-        op = (modrm >> 3) & 7;
-        if (op >= 2 && b == 0xfe) {
-            goto unknown_op;
-        }
-        if (CODE64(s)) {
-            if (op == 2 || op == 4) {
-                /* operand size for jumps is 64 bit */
-                ot = MO_64;
-            } else if (op == 3 || op == 5) {
-                ot = dflag != MO_16 ? MO_32 + REX_W(s) : MO_16;
-            } else if (op == 6) {
-                /* default push size is 64 bit */
-                ot = mo_pushpop(s, dflag);
-            }
-        }
-        if (mod != 3) {
-            gen_lea_modrm(env, s, modrm);
-            if (op >= 2 && op != 3 && op != 5)
-                gen_op_ld_v(s, ot, s->T0, s->A0);
-        } else {
-            gen_op_mov_v_reg(s, ot, s->T0, rm);
-        }
-
-        switch(op) {
-        case 0: /* inc Ev */
-            if (mod != 3)
-                opreg = OR_TMP0;
-            else
-                opreg = rm;
-            gen_inc(s, ot, opreg, 1);
-            break;
-        case 1: /* dec Ev */
-            if (mod != 3)
-                opreg = OR_TMP0;
-            else
-                opreg = rm;
-            gen_inc(s, ot, opreg, -1);
-            break;
-        case 2: /* call Ev */
-            /* XXX: optimize if memory (no 'and' is necessary) */
-            if (dflag == MO_16) {
-                tcg_gen_ext16u_tl(s->T0, s->T0);
-            }
-            next_eip = s->pc - s->cs_base;
-            tcg_gen_movi_tl(s->T1, next_eip);
-            gen_push_v(s, s->T1);
-            gen_op_jmp_v(s->T0);
-            gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
-            break;
-        case 3: /* lcall Ev */
-            if (mod == 3) {
-                goto illegal_op;
-            }
-            gen_op_ld_v(s, ot, s->T1, s->A0);
-            gen_add_A0_im(s, 1 << ot);
-            gen_op_ld_v(s, MO_16, s->T0, s->A0);
-        do_lcall:
-            if (PE(s) && !VM86(s)) {
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
-                                           tcg_const_i32(dflag - 1),
-                                           tcg_const_tl(s->pc - s->cs_base));
-            } else {
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
-                                      tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(s->pc - s->cs_base));
-            }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
-            break;
-        case 4: /* jmp Ev */
-            if (dflag == MO_16) {
-                tcg_gen_ext16u_tl(s->T0, s->T0);
-            }
-            gen_op_jmp_v(s->T0);
-            gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
-            break;
-        case 5: /* ljmp Ev */
-            if (mod == 3) {
-                goto illegal_op;
-            }
-            gen_op_ld_v(s, ot, s->T1, s->A0);
-            gen_add_A0_im(s, 1 << ot);
-            gen_op_ld_v(s, MO_16, s->T0, s->A0);
-        do_ljmp:
-            if (PE(s) && !VM86(s)) {
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
-                                          tcg_const_tl(s->pc - s->cs_base));
-            } else {
-                gen_op_movl_seg_T0_vm(s, R_CS);
-                gen_op_jmp_v(s->T1);
-            }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
-            break;
-        case 6: /* push Ev */
-            gen_push_v(s, s->T0);
-            break;
-        default:
-            goto unknown_op;
-        }
-        break;
-
-    case 0x84: /* test Ev, Gv */
-    case 0x85:
-        ot = mo_b_d(b, dflag);
-
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-
-        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-        gen_op_mov_v_reg(s, ot, s->T1, reg);
-        gen_op_testl_T0_T1_cc(s);
-        set_cc_op(s, CC_OP_LOGICB + ot);
-        break;
-
-    case 0xa8: /* test eAX, Iv */
-    case 0xa9:
-        ot = mo_b_d(b, dflag);
-        val = insn_get(env, s, ot);
-
-        gen_op_mov_v_reg(s, ot, s->T0, OR_EAX);
-        tcg_gen_movi_tl(s->T1, val);
-        gen_op_testl_T0_T1_cc(s);
-        set_cc_op(s, CC_OP_LOGICB + ot);
-        break;
-
-    case 0x98: /* CWDE/CBW */
-        switch (dflag) {
-#ifdef TARGET_X86_64
-        case MO_64:
-            gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
-            tcg_gen_ext32s_tl(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_64, R_EAX, s->T0);
-            break;
-#endif
-        case MO_32:
-            gen_op_mov_v_reg(s, MO_16, s->T0, R_EAX);
-            tcg_gen_ext16s_tl(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_32, R_EAX, s->T0);
-            break;
-        case MO_16:
-            gen_op_mov_v_reg(s, MO_8, s->T0, R_EAX);
-            tcg_gen_ext8s_tl(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
-            break;
-        default:
-            tcg_abort();
-        }
-        break;
-    case 0x99: /* CDQ/CWD */
-        switch (dflag) {
-#ifdef TARGET_X86_64
-        case MO_64:
-            gen_op_mov_v_reg(s, MO_64, s->T0, R_EAX);
-            tcg_gen_sari_tl(s->T0, s->T0, 63);
-            gen_op_mov_reg_v(s, MO_64, R_EDX, s->T0);
-            break;
-#endif
-        case MO_32:
-            gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
-            tcg_gen_ext32s_tl(s->T0, s->T0);
-            tcg_gen_sari_tl(s->T0, s->T0, 31);
-            gen_op_mov_reg_v(s, MO_32, R_EDX, s->T0);
-            break;
-        case MO_16:
-            gen_op_mov_v_reg(s, MO_16, s->T0, R_EAX);
-            tcg_gen_ext16s_tl(s->T0, s->T0);
-            tcg_gen_sari_tl(s->T0, s->T0, 15);
-            gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
-            break;
-        default:
-            tcg_abort();
-        }
-        break;
-    case 0x1af: /* imul Gv, Ev */
-    case 0x69: /* imul Gv, Ev, I */
-    case 0x6b:
-        ot = dflag;
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        if (b == 0x69)
-            s->rip_offset = insn_const_size(ot);
-        else if (b == 0x6b)
-            s->rip_offset = 1;
-        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-        if (b == 0x69) {
-            val = insn_get(env, s, ot);
-            tcg_gen_movi_tl(s->T1, val);
-        } else if (b == 0x6b) {
-            val = (int8_t)insn_get(env, s, MO_8);
-            tcg_gen_movi_tl(s->T1, val);
-        } else {
-            gen_op_mov_v_reg(s, ot, s->T1, reg);
-        }
-        switch (ot) {
-#ifdef TARGET_X86_64
-        case MO_64:
-            tcg_gen_muls2_i64(cpu_regs[reg], s->T1, s->T0, s->T1);
-            tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
-            tcg_gen_sari_tl(cpu_cc_src, cpu_cc_dst, 63);
-            tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, s->T1);
-            break;
-#endif
-        case MO_32:
-            tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-            tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
-            tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
-                              s->tmp2_i32, s->tmp3_i32);
-            tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp2_i32);
-            tcg_gen_sari_i32(s->tmp2_i32, s->tmp2_i32, 31);
-            tcg_gen_mov_tl(cpu_cc_dst, cpu_regs[reg]);
-            tcg_gen_sub_i32(s->tmp2_i32, s->tmp2_i32, s->tmp3_i32);
-            tcg_gen_extu_i32_tl(cpu_cc_src, s->tmp2_i32);
-            break;
-        default:
-            tcg_gen_ext16s_tl(s->T0, s->T0);
-            tcg_gen_ext16s_tl(s->T1, s->T1);
-            /* XXX: use 32 bit mul which could be faster */
-            tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-            tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-            tcg_gen_ext16s_tl(s->tmp0, s->T0);
-            tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
-            gen_op_mov_reg_v(s, ot, reg, s->T0);
-            break;
-        }
-        set_cc_op(s, CC_OP_MULB + ot);
-        break;
-    case 0x1c0:
-    case 0x1c1: /* xadd Ev, Gv */
-        ot = mo_b_d(b, dflag);
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        mod = (modrm >> 6) & 3;
-        gen_op_mov_v_reg(s, ot, s->T0, reg);
-        if (mod == 3) {
-            rm = (modrm & 7) | REX_B(s);
-            gen_op_mov_v_reg(s, ot, s->T1, rm);
-            tcg_gen_add_tl(s->T0, s->T0, s->T1);
-            gen_op_mov_reg_v(s, ot, reg, s->T1);
-            gen_op_mov_reg_v(s, ot, rm, s->T0);
-        } else {
-            gen_lea_modrm(env, s, modrm);
-            if (s->prefix & PREFIX_LOCK) {
-                tcg_gen_atomic_fetch_add_tl(s->T1, s->A0, s->T0,
-                                            s->mem_index, ot | MO_LE);
-                tcg_gen_add_tl(s->T0, s->T0, s->T1);
-            } else {
-                gen_op_ld_v(s, ot, s->T1, s->A0);
-                tcg_gen_add_tl(s->T0, s->T0, s->T1);
-                gen_op_st_v(s, ot, s->T0, s->A0);
-            }
-            gen_op_mov_reg_v(s, ot, reg, s->T1);
-        }
-        gen_op_update2_cc(s);
-        set_cc_op(s, CC_OP_ADDB + ot);
-        break;
-    case 0x1b0:
-    case 0x1b1: /* cmpxchg Ev, Gv */
-        {
-            TCGv oldv, newv, cmpv;
-
-            ot = mo_b_d(b, dflag);
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            mod = (modrm >> 6) & 3;
-            oldv = tcg_temp_new();
-            newv = tcg_temp_new();
-            cmpv = tcg_temp_new();
-            gen_op_mov_v_reg(s, ot, newv, reg);
-            tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
-
-            if (s->prefix & PREFIX_LOCK) {
-                if (mod == 3) {
-                    goto illegal_op;
-                }
-                gen_lea_modrm(env, s, modrm);
-                tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
-                                          s->mem_index, ot | MO_LE);
-                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
-            } else {
-                if (mod == 3) {
-                    rm = (modrm & 7) | REX_B(s);
-                    gen_op_mov_v_reg(s, ot, oldv, rm);
-                } else {
-                    gen_lea_modrm(env, s, modrm);
-                    gen_op_ld_v(s, ot, oldv, s->A0);
-                    rm = 0; /* avoid warning */
-                }
-                gen_extu(ot, oldv);
-                gen_extu(ot, cmpv);
-                /* store value = (old == cmp ? new : old);  */
-                tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
-                if (mod == 3) {
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
-                    gen_op_mov_reg_v(s, ot, rm, newv);
-                } else {
-                    /* Perform an unconditional store cycle like physical cpu;
-                       must be before changing accumulator to ensure
-                       idempotency if the store faults and the instruction
-                       is restarted */
-                    gen_op_st_v(s, ot, newv, s->A0);
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
-                }
-            }
-            tcg_gen_mov_tl(cpu_cc_src, oldv);
-            tcg_gen_mov_tl(s->cc_srcT, cmpv);
-            tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
-            set_cc_op(s, CC_OP_SUBB + ot);
-            tcg_temp_free(oldv);
-            tcg_temp_free(newv);
-            tcg_temp_free(cmpv);
-        }
-        break;
-    case 0x1c7: /* cmpxchg8b */
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        switch ((modrm >> 3) & 7) {
-        case 1: /* CMPXCHG8, CMPXCHG16 */
-            if (mod == 3) {
-                goto illegal_op;
-            }
-#ifdef TARGET_X86_64
-            if (dflag == MO_64) {
-                if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
-                    goto illegal_op;
-                }
-                gen_lea_modrm(env, s, modrm);
-                if ((s->prefix & PREFIX_LOCK) &&
-                    (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                    gen_helper_cmpxchg16b(cpu_env, s->A0);
-                } else {
-                    gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
-                }
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            }
-#endif        
-            if (!(s->cpuid_features & CPUID_CX8)) {
-                goto illegal_op;
-            }
-            gen_lea_modrm(env, s, modrm);
-            if ((s->prefix & PREFIX_LOCK) &&
-                (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                gen_helper_cmpxchg8b(cpu_env, s->A0);
-            } else {
-                gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
-            }
-            set_cc_op(s, CC_OP_EFLAGS);
-            break;
-
-        case 7: /* RDSEED */
-        case 6: /* RDRAND */
-            if (mod != 3 ||
-                (s->prefix & (PREFIX_LOCK | PREFIX_REPZ | PREFIX_REPNZ)) ||
-                !(s->cpuid_ext_features & CPUID_EXT_RDRAND)) {
-                goto illegal_op;
-            }
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_io_start();
-            }
-            gen_helper_rdrand(s->T0, cpu_env);
-            rm = (modrm & 7) | REX_B(s);
-            gen_op_mov_reg_v(s, dflag, rm, s->T0);
-            set_cc_op(s, CC_OP_EFLAGS);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
-            break;
-
-        de_reg_v(s, ot, (b & 7) | REX_B(s), s->T0);
-        break;
-    case 0x60: /* pusha */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_pusha(s);
-        break;
-    case 0x61: /* popa */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_popa(s);
-        break;
-    case 0x68: /* push Iv */
-    case 0x6a:
-        ot = mo_pushpop(s, dflag);
-        if (b == 0x68)
-            val = insn_get(env, s, ot);
-        else
-            val = (int8_t)insn_get(env, s, MO_8);
-        tcg_gen_movi_tl(s->T0, val);
-        gen_push_v(s, s->T0);
-        break;
-    case 0x8f: /* pop Ev */
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        ot = gen_pop_T0(s);
-        if (mod == 3) {
-            /* NOTE: order is important for pop %sp */
-            gen_pop_update(s, ot);
-            rm = (modrm & 7) | REX_B(s);
-            gen_op_mov_reg_v(s, ot, rm, s->T0);
-        } else {
-            /* NOTE: order is important too for MMU exceptions */
-            s->popl_esp_hack = 1 << ot;
-            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
-            s->popl_esp_hack = 0;
-            gen_pop_update(s, ot);
-        }
-        break;
-    case 0xc8: /* enter */
-        {
-            int level;
-            val = x86_lduw_code(env, s);
-            level = x86_ldub_code(env, s);
-            gen_enter(s, val, level);
-        }
-        break;
-    case 0xc9: /* leave */
-        gen_leave(s);
-        break;
-    case 0x06: /* push es */
-    case 0x0e: /* push cs */
-    case 0x16: /* push ss */
-    case 0x1e: /* push ds */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_op_movl_T0_seg(s, b >> 3);
-        gen_push_v(s, s->T0);
-        break;
-    case 0x1a0: /* push fs */
-    case 0x1a8: /* push gs */
-        gen_op_movl_T0_seg(s, (b >> 3) & 7);
-        gen_push_v(s, s->T0);
-        break;
-    case 0x07: /* pop es */
-    case 0x17: /* pop ss */
-    case 0x1f: /* pop ds */
-        if (CODE64(s))
-            goto illegal_op;
-        reg = b >> 3;
-        ot = gen_pop_T0(s);
-        gen_movl_seg_T0(s, reg);
-        gen_pop_update(s, ot);
-        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
-        if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
-            if (reg == R_SS) {
-                s->flags &= ~HF_TF_MASK;
-                gen_eob_inhibit_irq(s, true);
-            } else {
-                gen_eob(s);
-            }
-        }
-        break;
-    case 0x1a1: /* pop fs */
-    case 0x1a9: /* pop gs */
-        ot = gen_pop_T0(s);
-        gen_movl_seg_T0(s, (b >> 3) & 7);
-        gen_pop_update(s, ot);
-        if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-        }
-        break;
-
-        /**************************/
-        /* mov */
-    case 0x88:
-    case 0x89: /* mov Gv, Ev */
-        ot = mo_b_d(b, dflag);
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-
-        /* generate a generic store */
-        gen_ldst_modrm(env, s, modrm, ot, reg, 1);
-        break;
-    case 0xc6:
-    case 0xc7: /* mov Ev, Iv */
-        ot = mo_b_d(b, dflag);
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        if (mod != 3) {
-            s->rip_offset = insn_const_size(ot);
-            gen_lea_modrm(env, s, modrm);
-        }
-        val = insn_get(env, s, ot);
-        tcg_gen_movi_tl(s->T0, val);
-        if (mod != 3) {
-            gen_op_st_v(s, ot, s->T0, s->A0);
-        } else {
-            gen_op_mov_reg_v(s, ot, (modrm & 7) | REX_B(s), s->T0);
-        }
-        break;
-    case 0x8a:
-    case 0x8b: /* mov Ev, Gv */
-        ot = mo_b_d(b, dflag);
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-
-        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-        gen_op_mov_reg_v(s, ot, reg, s->T0);
-        break;
-    case 0x8e: /* mov seg, Gv */
-        modrm = x86_ldub_code(env, s);
-        reg = (modrm >> 3) & 7;
-        if (reg >= 6 || reg == R_CS)
-            goto illegal_op;
-        gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-        gen_movl_seg_T0(s, reg);
-        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
-        if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
-            if (reg == R_SS) {
-                s->flags &= ~HF_TF_MASK;
-                gen_eob_inhibit_irq(s, true);
-            } else {
-                gen_eob(s);
-            }
-        }
-        break;
-    case 0x8c: /* mov Gv, seg */
-        modrm = x86_ldub_code(env, s);
-        reg = (modrm >> 3) & 7;
-        mod = (modrm >> 6) & 3;
-        if (reg >= 6)
-            goto illegal_op;
-        gen_op_movl_T0_seg(s, reg);
-        ot = mod == 3 ? dflag : MO_16;
-        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
-        break;
-
-    case 0x1b6: /* movzbS Gv, Eb */
-    case 0x1b7: /* movzwS Gv, Eb */
-    case 0x1be: /* movsbS Gv, Eb */
-    case 0x1bf: /* movswS Gv, Eb */
-        {
-            MemOp d_ot;
-            MemOp s_ot;
-
-            /* d_ot is the size of destination */
-            d_ot = dflag;
-            /* ot is the size of source */
-            ot = (b & 1) + MO_8;
-            /* s_ot is the sign+size of source */
-            s_ot = b & 8 ? MO_SIGN | ot : ot;
-
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            mod = (modrm >> 6) & 3;
-            rm = (modrm & 7) | REX_B(s);
-
-            if (mod == 3) {
-                if (s_ot == MO_SB && byte_reg_is_xH(s, rm)) {
-                    tcg_gen_sextract_tl(s->T0, cpu_regs[rm - 4], 8, 8);
-                } else {
-                    gen_op_mov_v_reg(s, ot, s->T0, rm);
-                    switch (s_ot) {
-                    case MO_UB:
-                        tcg_gen_ext8u_tl(s->T0, s->T0);
-                        break;
-                    case MO_SB:
-                        tcg_gen_ext8s_tl(s->T0, s->T0);
-                        break;
-                    case MO_UW:
-                        tcg_gen_ext16u_tl(s->T0, s->T0);
-                        break;
-                    default:
-                    case MO_SW:
-                        tcg_gen_ext16s_tl(s->T0, s->T0);
-                        break;
-                    }
-                }
-                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
-            } else {
-                gen_lea_modrm(env, s, modrm);
-                gen_op_ld_v(s, s_ot, s->T0, s->A0);
-                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
-            }
-        }
-        break;
-
-    case 0x8d: /* lea */
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        if (mod == 3)
-            goto illegal_op;
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        {
-            AddressParts a = gen_lea_modrm_0(env, s, modrm);
-            TCGv ea = gen_lea_modrm_1(s, a);
-            gen_lea_v_seg(s, s->aflag, ea, -1, -1);
-            gen_op_mov_reg_v(s, dflag, reg, s->A0);
-        }
-        break;
-
-    case 0xa0: /* mov EAX, Ov */
-    case 0xa1:
-    case 0xa2: /* mov Ov, EAX */
-    case 0xa3:
-        {
-            target_ulong offset_addr;
-
-            ot = mo_b_d(b, dflag);
-            switch (s->aflag) {
-#ifdef TARGET_X86_64
-            case MO_64:
-                offset_addr = x86_ldq_code(env, s);
-                break;
-#endif
-            default:
-                offset_addr = insn_get(env, s, s->aflag);
-                break;
-            }
-            tcg_gen_movi_tl(s->A0, offset_addr);
-            gen_add_A0_ds_seg(s);
-            if ((b & 2) == 0) {
-                gen_op_ld_v(s, ot, s->T0, s->A0);
-                gen_op_mov_reg_v(s, ot, R_EAX, s->T0);
-            } else {
-                gen_op_mov_v_reg(s, ot, s->T0, R_EAX);
-                gen_op_st_v(s, ot, s->T0, s->A0);
-            }
-        }
-        break;
-    case 0xd7: /* xlat */
-        tcg_gen_mov_tl(s->A0, cpu_regs[R_EBX]);
-        tcg_gen_ext8u_tl(s->T0, cpu_regs[R_EAX]);
-        tcg_gen_add_tl(s->A0, s->A0, s->T0);
-        gen_extu(s->aflag, s->A0);
-        gen_add_A0_ds_seg(s);
-        gen_op_ld_v(s, MO_8, s->T0, s->A0);
-        gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
-        break;
-    case 0xb0 ... 0xb7: /* mov R, Ib */
-        val = insn_get(env, s, MO_8);
-        tcg_gen_movi_tl(s->T0, val);
-        gen_op_mov_reg_v(s, MO_8, (b & 7) | REX_B(s), s->T0);
-        break;
-    case 0xb8 ... 0xbf: /* mov R, Iv */
-#ifdef TARGET_X86_64
-        if (dflag == MO_64) {
-            uint64_t tmp;
-            /* 64 bit case */
-            tmp = x86_ldq_code(env, s);
-            reg = (b & 7) | REX_B(s);
-            tcg_gen_movi_tl(s->T0, tmp);
-            gen_op_mov_reg_v(s, MO_64, reg, s->T0);
-        } else
-#endif
-        {
-            ot = dflag;
-            val = insn_get(env, s, ot);
-            reg = (b & 7) | REX_B(s);
-            tcg_gen_movi_tl(s->T0, val);
-            gen_op_mov_reg_v(s, ot, reg, s->T0);
-        }
-        break;
-
-    case 0x91 ... 0x97: /* xchg R, EAX */
-    do_xchg_reg_eax:
-        ot = dflag;
-        reg = (b & 7) | REX_B(s);
-        rm = R_EAX;
-        goto do_xchg_reg;
-    case 0x86:
-    case 0x87: /* xchg Ev, Gv */
-        ot = mo_b_d(b, dflag);
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        mod = (modrm >> 6) & 3;
-        if (mod == 3) {
-            rm = (modrm & 7) | REX_B(s);
-        do_xchg_reg:
-            gen_op_mov_v_reg(s, ot, s->T0, reg);
-            gen_op_mov_v_reg(s, ot, s->T1, rm);
-            gen_op_mov_reg_v(s, ot, rm, s->T0);
-            gen_op_mov_reg_v(s, ot, reg, s->T1);
-        } else {
-            gen_lea_modrm(env, s, modrm);
-            gen_op_mov_v_reg(s, ot, s->T0, reg);
-            /* for xchg, lock is implicit */
-            tcg_gen_atomic_xchg_tl(s->T1, s->A0, s->T0,
-                                   s->mem_index, ot | MO_LE);
-            gen_op_mov_reg_v(s, ot, reg, s->T1);
-        }
-        break;
-    case 0xc4: /* les Gv */
-        /* In CODE64 this is VEX3; see above.  */
-        op = R_ES;
-        goto do_lxx;
-    case 0xc5: /* lds Gv */
-        /* In CODE64 this is VEX2; see above.  */
-        op = R_DS;
-        goto do_lxx;
-    case 0x1b2: /* lss Gv */
-        op = R_SS;
-        goto do_lxx;
-    case 0x1b4: /* lfs Gv */
-        op = R_FS;
-        goto do_lxx;
-    case 0x1b5: /* lgs Gv */
-        op = R_GS;
-    do_lxx:
-        ot = dflag != MO_16 ? MO_32 : MO_16;
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        mod = (modrm >> 6) & 3;
-        if (mod == 3)
-            goto illegal_op;
-        gen_lea_modrm(env, s, modrm);
-        gen_op_ld_v(s, ot, s->T1, s->A0);
-        gen_add_A0_im(s, 1 << ot);
-        /* load the segment first to handle exceptions properly */
-        gen_op_ld_v(s, MO_16, s->T0, s->A0);
-        gen_movl_seg_T0(s, op);
-        /* then put the data */
-        gen_op_mov_reg_v(s, ot, reg, s->T1);
-        if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-        }
-        break;
-
-        /************************/
-        /* shifts */
-    case 0xc0:
-    case 0xc1:
-        /* shift Ev,Ib */
-        shift = 2;
-    grp2:
-        {
-            ot = mo_b_d(b, dflag);
-            modrm = x86_ldub_code(env, s);
-            mod = (modrm >> 6) & 3;
-            op = (modrm >> 3) & 7;
-
-            if (mod != 3) {
-                if (shift == 2) {
-                    s->rip_offset = 1;
-                }
-                gen_lea_modrm(env, s, modrm);
-                opreg = OR_TMP0;
-            } else {
-                opreg = (modrm & 7) | REX_B(s);
-            }
-
-            /* simpler op */
-            if (shift == 0) {
-                gen_shift(s, op, ot, opreg, OR_ECX);
-            } else {
-                if (shift == 2) {
-                    shift = x86_ldub_code(env, s);
-                }
-                gen_shifti(s, op, ot, opreg, shift);
-            }
-        }
-        break;
-    case 0xd0:
-    case 0xd1:
-        /* shift Ev,1 */
-        shift = 1;
-        goto grp2;
-    case 0xd2:
-    case 0xd3:
-        /* shift Ev,cl */
-        shift = 0;
-        goto grp2;
-
-    case 0x1a4: /* shld imm */
-        op = 0;
-        shift = 1;
-        goto do_shiftd;
-    case 0x1a5: /* shld cl */
-        op = 0;
-        shift = 0;
-        goto do_shiftd;
-    case 0x1ac: /* shrd imm */
-        op = 1;
-        shift = 1;
-        goto do_shiftd;
-    case 0x1ad: /* shrd cl */
-        op = 1;
-        shift = 0;
-    do_shiftd:
-        ot = dflag;
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        rm = (modrm & 7) | REX_B(s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        if (mod != 3) {
-            gen_lea_modrm(env, s, modrm);
-            opreg = OR_TMP0;
-        } else {
-            opreg = rm;
-        }
-        gen_op_mov_v_reg(s, ot, s->T1, reg);
-
-        if (shift) {
-            TCGv imm = tcg_const_tl(x86_ldub_code(env, s));
-            gen_shiftd_rm_T1(s, ot, opreg, op, imm);
-            tcg_temp_free(imm);
-        } else {
-            gen_shiftd_rm_T1(s, ot, opreg, op, cpu_regs[R_ECX]);
-        }
-        break;
-
-        /************************/
-        /* floats */
-    case 0xd8 ... 0xdf:
-        {
-            bool update_fip = true;
-
-            if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
-                /* if CR0.EM or CR0.TS are set, generate an FPU exception */
-                /* XXX: what to do if illegal op ? */
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-                break;
-            }
-            modrm = x86_ldub_code(env, s);
-            mod = (modrm >> 6) & 3;
-            rm = modrm & 7;
-            op = ((b & 7) << 3) | ((modrm >> 3) & 7);
-            if (mod != 3) {
-                /* memory op */
-                AddressParts a = gen_lea_modrm_0(env, s, modrm);
-                TCGv ea = gen_lea_modrm_1(s, a);
-                TCGv last_addr = tcg_temp_new();
-                bool update_fdp = true;
-
-                tcg_gen_mov_tl(last_addr, ea);
-                gen_lea_v_seg(s, s->aflag, ea, a.def_seg, s->override);
-
-                switch (op) {
-                case 0x00 ... 0x07: /* fxxxs */
-                case 0x10 ... 0x17: /* fixxxl */
-                case 0x20 ... 0x27: /* fxxxl */
-                case 0x30 ... 0x37: /* fixxx */
-                    {
-                        int op1;
-                        op1 = op & 7;
-
-                        switch (op >> 4) {
-                        case 0:
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                            gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
-                            break;
-                        case 1:
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
-                            break;
-                        case 2:
-                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                            gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
-                            break;
-                        case 3:
-                        default:
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                     case 0x08: /* flds */
-                case 0x0a: /* fsts */
-                case 0x0b: /* fstps */
-                case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
-                case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
-                case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
-                    switch (op & 7) {
-                    case 0:
-                        switch (op >> 4) {
-                        case 0:
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                            gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
-                            break;
-                        case 1:
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
-                            break;
-                        case 2:
-                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                            gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
-                            break;
-                        case 3:
-                        default:
-                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LESW);
-                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
-                            break;
-                        }
-                        break;
-                    case 1:
-                        /* XXX: the corresponding CPUID bit must be tested ! */
-                        switch (op >> 4) {
-                        case 1:
-                            gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
-                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                            break;
-                        case 2:
-                            gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
-                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                            break;
-                        case 3:
-                        default:
-                            gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
-                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUW);
-                            break;
-                        }
-                        gen_helper_fpop(cpu_env);
-                        break;
-                    default:
-                        switch (op >> 4) {
-                        case 0:
-                            gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
-                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                            break;
-                        case 1:
-                            gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
-                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUL);
-                            break;
-                        case 2:
-                            gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
-                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                                s->mem_index, MO_LEUQ);
-                            break;
-                        case 3:
-                        default:
-                            gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
-                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                                s->mem_index, MO_LEUW);
-                            break;
-                        }
-                        if ((op & 7) == 3) {
-                            gen_helper_fpop(cpu_env);
-                        }
-                        break;
-                    }
-                    break;
-                case 0x0c: /* fldenv mem */
-                    gen_helper_fldenv(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
-                    update_fip = update_fdp = false;
-                    break;
-                case 0x0d: /* fldcw mem */
-                    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                        s->mem_index, MO_LEUW);
-                    gen_helper_fldcw(cpu_env, s->tmp2_i32);
-                    update_fip = update_fdp = false;
-                    break;
-                case 0x0e: /* fnstenv mem */
-                    gen_helper_fstenv(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
-                    update_fip = update_fdp = false;
-                    break;
-                case 0x0f: /* fnstcw mem */
-                    gen_helper_fnstcw(s->tmp2_i32, cpu_env);
-                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                        s->mem_index, MO_LEUW);
-                    update_fip = update_fdp = false;
-                    break;
-                case 0x1d: /* fldt mem */
-                    gen_helper_fldt_ST0(cpu_env, s->A0);
-                    break;
-                case 0x1f: /* fstpt mem */
-                    gen_helper_fstt_ST0(cpu_env, s->A0);
-                    gen_helper_fpop(cpu_env);
-                    break;
-                case 0x2c: /* frstor mem */
-                    gen_helper_frstor(cpu_env, s->A0,
-                                      tcg_const_i32(dflag - 1));
-                    update_fip = update_fdp = false;
-                    break;
-                case 0x2e: /* fnsave mem */
-                    gen_helper_fsave(cpu_env, s->A0,
-                                     tcg_const_i32(dflag - 1));
-                    update_fip = update_fdp = false;
-                    break;
-                case 0x2f: /* fnstsw mem */
-                    gen_helper_fnstsw(s->tmp2_i32, cpu_env);
-                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                        s->mem_index, MO_LEUW);
-                    update_fip = update_fdp = false;
-                    break;
-                case 0x3c: /* fbld */
-                    gen_helper_fbld_ST0(cpu_env, s->A0);
-                    break;
-                case 0x3e: /* fbstp */
-                    gen_helper_fbst_ST0(cpu_env, s->A0);
-                    gen_helper_fpop(cpu_env);
-                    break;
-                case 0x3d: /* fildll */
-                    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                        s->mem_index, MO_LEUQ);
-                    gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
-                    break;
-                case 0x3f: /* fistpll */
-                    gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
-                    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                        s->mem_index, MO_LEUQ);
-                    gen_helper_fpop(cpu_env);
-                    break;
-                default:
-                    goto unknown_op;
-                }
-
-                if (update_fdp) {
-                    int last_seg = s->override >= 0 ? s->override : a.def_seg;
-
-                    tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                                   offsetof(CPUX86State,
-                                            segs[last_seg].selector));
-                    tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
-                                     offsetof(CPUX86State, fpds));
-                    tcg_gen_st_tl(last_addr, cpu_env,
-                                  offsetof(CPUX86State, fpdp));
-                }
-                tcg_temp_free(last_addr);
-            } else {
-                /* register float ops */
-                opreg = rm;
-
-                switch (op) {
-                case 0x08: /* fld sti */
-                    gen_helper_fpush(cpu_env);
-                    gen_helper_fmov_ST0_STN(cpu_env,
-                                            tcg_const_i32((opreg + 1) & 7));
-                    break;
-                case 0x09: /* fxchg sti */
-                case 0x29: /* fxchg4 sti, undocumented op */
-                case 0x39: /* fxchg7 sti, undocumented op */
-                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
-                    break;
-                case 0x0a: /* grp d9/2 */
-                    switch (rm) {
-                    case 0: /* fnop */
-                        /* check exceptions (FreeBSD FPU probe) */
-                        gen_helper_fwait(cpu_env);
-                        update_fip = false;
-                        break;
-                    default:
-                        goto unknown_op;
-                    }
-                    break;
-                case 0x0c: /* grp d9/4 */
-                    switch (rm) {
-                    case 0: /* fchs */
-                        gen_helper_fchs_ST0(cpu_env);
-                        break;
-                    case 1: /* fabs */
-                        gen_helper_fabs_ST0(cpu_env);
-                        break;
-                    case 4: /* ftst */
-                        gen_helper_fldz_FT0(cpu_env);
-                        gen_helper_fcom_ST0_FT0(cpu_env);
-                        break;
-                    case 5: /* fxam */
-                        gen_helper_fxam_ST0(cpu_env);
-                        break;
-                    default:
-                        goto unknown_op;
-                    }
-                    break;
-                case 0x0d: /* grp d9/5 */
-                    {
-                        switch (rm) {
-                        case 0:
-                            gen_helper_fpush(cpu_env);
-                            gen_helper_fld1_ST0(cpu_env);
-                            break;
-                        case 1:
-                            gen_helper_fpush(cpu_env);
-                            gen_helper_fldl2t_ST0(cpu_env);
-                            break;
-                        case 2:
-                            gen_helper_fpush(cpu_env);
-                            gen_helper_fldl2e_ST0(cpu_env);
-                            break;
-                        case 3:
-                            gen_helper_fpush(cpu_env);
-                            gen_helper_fldpi_ST0(cpu_env);
-                            break;
-                        case 4:
-                            gen_helper_fpush(cpu_env);
-                            gen_helper_fldlg2_ST0(cpu_env);
-                            break;
-                        case 5:
-                            gen_helper_fpush(cpu_env);
-                            gen_helper_fldln2_ST0(cpu_env);
-                            break;
-                        case 6:
-                            gen_helper_fpush(cpu_env);
-                            gen_helper_fldz_ST0(cpu_env);
-                            break;
-                        default:
-                            goto unknown_op;
-                        }
-                    }
-                    break;
-                case 0x0e: /* grp d9/6 */
-                    switch (rm) {
-                    case 0: /* f2xm1 */
-                        gen_helper_f2xm1(cpu_env);
-                        break;
-                    case 1: /* fyl2x */
-                        gen_helper_fyl2x(cpu_env);
-                        break;
-                    case 2: /* fptan */
-                        gen_helper_fptan(cpu_env);
-                        break;
-                    case 3: /* fpatan */
-                        gen_helper_fpatan(cpu_env);
-                        break;
-                    case 4: /* fxtract */
-                        gen_helper_fxtract(cpu_env);
-                        break;
-                    case 5: /* fprem1 */
-                        gen_helper_fprem1(cpu_env);
-                        break;
-                    case 6: /* fdecstp */
-                        gen_helper_fdecstp(cpu_env);
-                        break;
-                    default:
-                    case 7: /* fincstp */
-                        gen_helper_fincstp(cpu_env);
-                        break;
-                    }
-                    break;
-                case 0x0f: /* grp d9/7 */
-                    switch (rm) {
-                    case 0: /* fprem */
-                        gen_helper_fprem(cpu_env);
-                        break;
-                    case 1: /* fyl2xp1 */
-                        gen_helper_fyl2xp1(cpu_env);
-                        break;
-                    case 2: /* fsqrt */
-                        gen_helper_fsqrt(cpu_env);
-                        break;
-                    case 3: /* fsincos */
-                        gen_helper_fsincos(cpu_env);
-                        break;
-                    case 5: /* fscale */
-                        gen_helper_fscale(cpu_env);
-                        break;
-                    case 4: /* frndint */
-                        gen_helper_frndint(cpu_env);
-                        break;
-                    case 6: /* fsin */
-                        gen_helper_fsin(cpu_env);
-                        break;
-                    default:
-                    case 7: /* fcos */
-                        gen_helper_fcos(cpu_env);
-                        break;
-                    }
-                    break;
-                case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
-                case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
-                case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
-                    {
-                        int op1;
-
-                        op1 = op & 7;
-                        if (op >= 0x20) {
-                            gen_helper_fp_arith_STN_ST0(op1, opreg);
-                            if (op >= 0x30) {
-                                gen_helper_fpop(cpu_env);
-                            }
-                        } else {
-                            gen_helper_fmov_FT0_STN(cpu_env,
-                                                    tcg_const_i32(opreg));
-                            gen_helper_fp_arith_ST0_FT0(op1);
-                        }
-                    }
-                    break;
-                case 0x02: /* fcom */
-                case 0x22: /* fcom2, undocumented op */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fcom_ST0_FT0(cpu_env);
-                    break;
-                case 0x03: /* fcomp */
-                case 0x23: /* fcomp3, undocumented op */
-                case 0x32: /* fcomp5, undocumented op */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fcom_ST0_FT0(cpu_env);
-                    gen_helper_fpop(cpu_env);
-                    break;
-                case 0x15: /* da/5 */
-                    switch (rm) {
-                    case 1: /* fucompp */
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
-                        gen_helper_fucom_ST0_FT0(cpu_env);
-                        gen_helper_fpop(cpu_env);
-                        gen_helper_fpop(cpu_env);
-                        break;
-                    default:
-                        goto unknown_op;
-                    }
-                    break;
-                case 0x1c:
-                    switch (rm) {
-                    case 0: /* feni (287 only, just do nop here) */
-                      gen_helper_fninit(cpu_env);
-                        update_fip = false;
-                        break;
-                    case 4: /* fsetpm (287 only, just do nop here) */
-                        break;
-                    default:
-                        goto unknown_op;
-                    }
-                    break;
-                case 0x1d: /* fucomi */
-                    if (!(s->cpuid_features & CPUID_CMOV)) {
-                        goto illegal_op;
-                    }
-                    gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fucomi_ST0_FT0(cpu_env);
-                    set_cc_op(s, CC_OP_EFLAGS);
-                    break;
-                case 0x1e: /* fcomi */
-                    if (!(s->cpuid_features & CPUID_CMOV)) {
-                        goto illegal_op;
-                    }
-                    gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fcomi_ST0_FT0(cpu_env);
-                    set_cc_op(s, CC_OP_EFLAGS);
-                    break;
-                case 0x28: /* ffree sti */
-                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
-                    break;
-                case 0x2a: /* fst sti */
-                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
-                    break;
-                case 0x2b: /* fstp sti */
-                case 0x0b: /* fstp1 sti, undocumented op */
-                case 0x3a: /* fstp8 sti, undocumented op */
-                case 0x3b: /* fstp9 sti, undocumented op */
-                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fpop(cpu_env);
-                    break;
-                case 0x2c: /* fucom st(i) */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fucom_ST0_FT0(cpu_env);
-                    break;
-                case 0x2d: /* fucomp st(i) */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fucom_ST0_FT0(cpu_env);
-                    gen_helper_fpop(cpu_env);
-                    break;
-                case 0x33: /* de/3 */
-                    switch (rm) {
-                    case 1: /* fcompp */
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
-                        gen_helper_fcom_ST0_FT0(cpu_env);
-                        gen_helper_fpop(cpu_env);
-                        gen_helper_fpop(cpu_env);
-                        break;
-                    default:
-                        goto unknown_op;
-                    }
-                    break;
-                case 0x38: /* ffreep sti, undocumented op */
-                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fpop(cpu_env);
-                    break;
-                case 0x3c: /* df/4 */
-                    switch (rm) {
-                    case 0:
-                        gen_helper_fnstsw(s->tmp2_i32, cpu_env);
-                        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-                        gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
-                        break;
-                    default:
-                        goto unknown_op;
-                    }
-                    break;
-                case 0x3d: /* fucomip */
-                    if (!(s->cpuid_features & CPUID_CMOV)) {
-                        goto illegal_op;
-                    }
-                    gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fucomi_ST0_FT0(cpu_env);
-                    gen_helper_fpop(cpu_env);
-                    set_cc_op(s, CC_OP_EFLAGS);
-                    break;
-                case 0x3e: /* fcomip */
-                    if (!(s->cpuid_features & CPUID_CMOV)) {
-                        goto illegal_op;
-                    }
-                    gen_update_cc_op(s);
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_helper_fcomi_ST0_FT0(cpu_env);
-                    gen_helper_fpop(cpu_env);
-                    set_cc_op(s, CC_OP_EFLAGS);
-                    break;
-                case 0x10 ... 0x13: /* fcmovxx */
-                case 0x18 ... 0x1b:
-                    {
-                        int op1;
-                        TCGLabel *l1;
-                        static const uint8_t fcmov_cc[8] = {
-                            (JCC_B << 1),
-                            (JCC_Z << 1),
-                            (JCC_BE << 1),
-                            (JCC_P << 1),
-                        };
-
-                        if (!(s->cpuid_features & CPUID_CMOV)) {
-                            goto illegal_op;
-                        }
-                        op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
-                        l1 = gen_new_label();
-                        gen_jcc1_noeob(s, op1, l1);
-                        gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
-                        gen_set_label(l1);
-                    }
-                    break;
-                default:
-                    goto unknown_op;
-                }
-            }
-
-            if (update_fip) {
-                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
-                               offsetof(CPUX86State, segs[R_CS].selector));
-                tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
-                                 offsetof(CPUX86State, fpcs));
-                tcg_gen_st_tl(tcg_constant_tl(pc_start - s->cs_base),
-                              cpu_env, offsetof(CPUX86State, fpip));
-            }
-        }
-        break;
-        /************************/
-        /* string ops */
-
-    case 0xa4: /* movsS */
-    case 0xa5:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_movs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
-        } else {
-            gen_movs(s, ot);
-        }
-        break;
-
-    case 0xaa: /* stosS */
-    case 0xab:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_stos(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
-        } else {
-            gen_stos(s, ot);
-        }
-        break;
-    case 0xac: /* lodsS */
-    case 0xad:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_lods(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
-        } else {
-            gen_lods(s, ot);
-        }
-        break;
-    case 0xae: /* scasS */
-    case 0xaf:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & PREFIX_REPNZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
-        } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
-        } else {
-            gen_scas(s, ot);
-        }
-        break;
-
-    case 0xa6: /* cmpsS */
-    case 0xa7:
-        ot = mo_b_d(b, dflag);
-        if (prefixes & PREFIX_REPNZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
-        } else if (prefixes & PREFIX_REPZ) {
-            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
-        } else {
-            gen_cmps(s, ot);
-        }
-        break;
-    case 0x6c: /* insS */
-    case 0x6d:
-        ot = mo_b_d32(b, dflag);
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
-        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
-        if (!gen_check_io(s, ot, s->tmp2_i32,
-                          SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
-            break;
-        }
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
-            /* jump generated by gen_repz_ins */
-        } else {
-            gen_ins(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
-        }
-        break;
-    case 0x6e: /* outsS */
-    case 0x6f:
-        ot = mo_b_d32(b, dflag);
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
-        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
-        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_STR_MASK)) {
-            break;
-        }
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
-            gen_repz_outs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
-            /* jump generated by gen_repz_outs */
-        } else {
-            gen_outs(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
-        }
-        break;
-
-        /************************/
-        /* port I/O */
-
-    case 0xe4:
-    case 0xe5:
-        ot = mo_b_d32(b, dflag);
-        val = x86_ldub_code(env, s);
-        tcg_gen_movi_i32(s->tmp2_i32, val);
-        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
-            break;
-        }
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_helper_in_func(ot, s->T1, s->tmp2_i32);
-        gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
-        gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
-        break;
-    case 0xe6:
-    case 0xe7:
-        ot = mo_b_d32(b, dflag);
-        val = x86_ldub_code(env, s);
-        tcg_gen_movi_i32(s->tmp2_i32, val);
-        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
-            break;
-        }
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
-        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
-        gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
-        gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
-        break;
-    case 0xec:
-    case 0xed:
-        ot = mo_b_d32(b, dflag);
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
-        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
-        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
-            break;
-        }
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_helper_in_func(ot, s->T1, s->tmp2_i32);
-        gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
-        gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
-        break;
-    case 0xee:
-    case 0xef:
-        ot = mo_b_d32(b, dflag);
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
-        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
-        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
-            break;
-        }
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
-        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
-        gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
-        gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
-        break;
-
-        /************************/
-        /* control */
-    case 0xc2: /* ret im */
-        val = x86_ldsw_code(env, s);
-        ot = gen_pop_T0(s);
-        gen_stack_update(s, val + (1 << ot));
-        /* Note that gen_pop_T0 uses a zero-extending load.  */
-        gen_op_jmp_v(s->T0);
-        gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
-        break;
-    case 0xc3: /* ret */
-        ot = gen_pop_T0(s);
-        gen_pop_update(s, ot);
-        /* Note that gen_pop_T0 uses a zero-extending load.  */
-        gen_op_jmp_v(s->T0);
-        gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
-        break;
-    case 0xca: /* lret im */
-        val = x86_ldsw_code(env, s);
-    do_lret:
-        if (PE(s) && !VM86(s)) {
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(val));
-        } else {
-            gen_stack_A0(s);
-            /* pop offset */
-            gen_op_ld_v(s, dflag, s->T0, s->A0);
-            /* NOTE: keeping EIP updated is not a problem in case of
-               exception */
-            gen_op_jmp_v(s->T0);
-            /* pop selector */
-            gen_add_A0_im(s, 1 << dflag);
-            gen_op_ld_v(s, dflag, s->T0, s->A0);
-            gen_op_movl_seg_T0_vm(s, R_CS);
-            /* add stack offset */
-            gen_stack_update(s, val + (2 << dflag));
-        }
-        gen_eob(s);
-        break;
-    case 0xcb: /* lret */
-        val = 0;
-        goto do_lret;
-    case 0xcf: /* iret */
-        gen_svm_check_intercept(s, SVM_EXIT_IRET);
-        if (!PE(s) || VM86(s)) {
-            /* real mode or vm86 mode */
-            if (!check_vm86_iopl(s)) {
-                break;
-            }
-            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
-        } else {
-            gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(s->pc - s->cs_base));
-        }
-        set_cc_op(s, CC_OP_EFLAGS);
-        gen_eob(s);
-        break;
-    case 0xe8: /* call im */
-        {
-            if (dflag != MO_16) {
-                tval = (int32_t)insn_get(env, s, MO_32);
-            } else {
-                tval = (int16_t)insn_get(env, s, MO_16);
-            }
-            next_eip = s->pc - s->cs_base;
-            tval += next_eip;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            } else if (!CODE64(s)) {
-                tval &= 0xffffffff;
-            }
-            tcg_gen_movi_tl(s->T0, next_eip);
-            gen_push_v(s, s->T0);
-            gen_bnd_jmp(s);
-            gen_jmp(s, tval);
-        }
-        break;
-    case 0x9a: /* lcall im */
-        {
-            unsigned int selector, offset;
-
-            if (CODE64(s))
-                goto illegal_op;
-            ot = dflag;
-            offset = insn_get(env, s, ot);
-            selector = insn_get(env, s, MO_16);
-
-            tcg_gen_movi_tl(s->T0, selector);
-            tcg_gen_movi_tl(s->T1, offset);
-        }
-        goto do_lcall;
-    case 0xe9: /* jmp im */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
-        }
-        tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        } else if (!CODE64(s)) {
-            tval &= 0xffffffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jmp(s, tval);
-        break;
-    case 0xea: /* ljmp im */
-        {
-            unsigned int selector, offset;
-
-            if (CODE64(s))
-                goto illegal_op;
-            ot = dflag;
-            offset = insn_get(env, s, ot);
-            selector = insn_get(env, s, MO_16);
-
-            tcg_gen_movi_tl(s->T0, selector);
-            tcg_gen_movi_tl(s->T1, offset);
-        }
-        goto do_ljmp;
-    case 0xeb: /* jmp Jb */
-        tvse {
-            tval = (int16_t)insn_get(env, s, MO_16);
-        }
-    do_jcc:
-        next_eip = s->pc - s->cs_base;
-        tval += next_eip;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jcc(s, b, tval, next_eip);
-        break;
-
-    case 0x190 ... 0x19f: /* setcc Gv */
-        modrm = x86_ldub_code(env, s);
-        gen_setcc1(s, b, s->T0);
-        gen_ldst_modrm(env, s, modrm, MO_8, OR_TMP0, 1);
-        break;
-    case 0x140 ... 0x14f: /* cmov Gv, Ev */
-        if (!(s->cpuid_features & CPUID_CMOV)) {
-            goto illegal_op;
-        }
-        ot = dflag;
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        gen_cmovcc1(env, s, ot, b, modrm, reg);
-        break;
-
-        /************************/
-        /* flags */
-    case 0x9c: /* pushf */
-        gen_svm_check_intercept(s, SVM_EXIT_PUSHF);
-        if (check_vm86_iopl(s)) {
-            gen_update_cc_op(s);
-            gen_helper_read_eflags(s->T0, cpu_env);
-            gen_push_v(s, s->T0);
-        }
-        break;
-    case 0x9d: /* popf */
-        gen_svm_check_intercept(s, SVM_EXIT_POPF);
-        if (check_vm86_iopl(s)) {
-            ot = gen_pop_T0(s);
-            if (CPL(s) == 0) {
-                if (dflag != MO_16) {
-                    gen_helper_write_eflags(cpu_env, s->T0,
-                                            tcg_const_i32((TF_MASK | AC_MASK |
-                                                           ID_MASK | NT_MASK |
-                                                           IF_MASK |
-                                                           IOPL_MASK)));
-                } else {
-                    gen_helper_write_eflags(cpu_env, s->T0,
-                                            tcg_const_i32((TF_MASK | AC_MASK |
-                                                           ID_MASK | NT_MASK |
-                                                           IF_MASK | IOPL_MASK)
-                                                          & 0xffff));
-                }
-            } else {
-                if (CPL(s) <= IOPL(s)) {
-                    if (dflag != MO_16) {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                                tcg_const_i32((TF_MASK |
-                                                               AC_MASK |
-                                                               ID_MASK |
-                                                               NT_MASK |
-                                                               IF_MASK)));
-                    } else {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                                tcg_const_i32((TF_MASK |
-                                                               AC_MASK |
-                                                               ID_MASK |
-                                                               NT_MASK |
-                                                               IF_MASK)
-                                                              & 0xffff));
-                    }
-                } else {
-                    if (dflag != MO_16) {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                           tcg_const_i32((TF_MASK | AC_MASK |
-                                                          ID_MASK | NT_MASK)));
-                    } else {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                           tcg_const_i32((TF_MASK | AC_MASK |
-                                                          ID_MASK | NT_MASK)
-                                                         & 0xffff));
-                    }
-                }
-            }
-            gen_pop_update(s, ot);
-            set_cc_op(s, CC_OP_EFLAGS);
-            /* abort translation because TF/AC flag may change */
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-        }
-        break;
-    case 0x9e: /* sahf */
-        if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
-            goto illegal_op;
-        gen_op_mov_v_reg(s, MO_8, s->T0, R_AH);
-        gen_compute_eflags(s);
-        tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, CC_O);
-        tcg_gen_andi_tl(s->T0, s->T0, CC_S | CC_Z | CC_A | CC_P | CC_C);
-        tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, s->T0);
-        break;
-    case 0x9f: /* lahf */
-        if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
-            goto illegal_op;
-        gen_compute_eflags(s);
-        /* Note: gen_compute_eflags() only gives the condition codes */
-        tcg_gen_ori_tl(s->T0, cpu_cc_src, 0x02);
-        gen_op_mov_reg_v(s, MO_8, R_AH, s->T0);
-        break;
-    case 0xf5: /* cmc */
-        gen_compute_eflags(s);
-        tcg_gen_xori_tl(cpu_cc_src, cpu_cc_src, CC_C);
-        break;
-    case 0xf8: /* clc */
-        gen_compute_eflags(s);
-        tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_C);
-        break;
-    case 0xf9: /* stc */
-        gen_compute_eflags(s);
-        tcg_gen_ori_tl(cpu_cc_src, cpu_cc_src, CC_C);
-        break;
-    case 0xfc: /* cld */
-        tcg_gen_movi_i32(s->tmp2_i32, 1);
-        tcg_gen_st_i32(s->tmp2_i32, cpu_env, offsetof(CPUX86State, df));
-        break;
-    case 0xfd: /* std */
-        tcg_gen_movi_i32(s->tmp2_i32, -1);
-        tcg_gen_st_i32(s->tmp2_i32, cpu_env, offsetof(CPUX86State, df));
-        break;
-
-        /************************/
-        /* bit operations */
-    case 0x1ba: /* bt/bts/btr/btc Gv, im */
-        ot = dflag;
-        modrm = x86_ldub_code(env, s);
-        op = (modrm >> 3) & 7;
-        mod = (modrm >> 6) & 3;
-        rm = (modrm & 7) | REX_B(s);
-        if (mod != 3) {
-            s->rip_offset = 1;
-            gen_lea_modrm(env, s, modrm);
-            if (!(s->prefix & PREFIX_LOCK)) {
-                gen_op_ld_v(s, ot, s->T0, s->A0);
-            }
-        } else {
-            gen_op_mov_v_reg(s, ot, s->T0, rm);
-        }
-        /* load shift */
-        val = x86_ldub_code(env, s);
-        tcg_gen_movi_tl(s->T1, val);
-        if (op < 4)
-            goto unknown_op;
-        op -= 4;
-        goto bt_op;
-    case 0x1a3: /* bt Gv, Ev */
-        op = 0;
-        goto do_btx;
-    case 0x1ab: /* bts */
-        op = 1;
-        goto do_btx;
-    case 0x1b3: /* btr */
-        op = 2;
-        goto do_btx;
-    case 0x1bb: /* btc */
-        op = 3;
-    do_btx:
-        ot = dflag;
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        mod = (modrm >> 6) & 3;
-        rm = (modrm & 7) | REX_B(s);
-        gen_op_mov_v_reg(s, MO_32, s->T1, reg);
-        if (mod != 3) {
-            AddressParts a = gen_lea_modrm_0(env, s, modrm);
-            /* specific case: we need to add a displacement */
-            gen_exts(ot, s->T1);
-            tcg_gen_sari_tl(s->tmp0, s->T1, 3 + ot);
-            tcg_gen_shli_tl(s->tmp0, s->tmp0, ot);
-            tcg_gen_add_tl(s->A0, gen_lea_modrm_1(s, a), s->tmp0);
-            gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
-            if (!(s->prefix & PREFIX_LOCK)) {
-                gen_op_ld_v(s, ot, s->T0, s->A0);
-            }
-        } else {
-            gen_op_mov_v_reg(s, ot, s->T0, rm);
-        }
-    bt_op:
-        tcg_gen_andi_tl(s->T1, s->T1, (1 << (3 + ot)) - 1);
-        tcg_gen_movi_tl(s->tmp0, 1);
-        tcg_gen_shl_tl(s->tmp0, s->tmp0, s->T1);
-        if (s->prefix & PREFIX_LOCK) {
-            switch (op) {
-            case 0: /* bt */
-                /* Needs no atomic ops; we surpressed the normal
-                   memory load for LOCK above so do it now.  */
-                gen_op_ld_v(s, ot, s->T0, s->A0);
-                break;
-            case 1: /* bts */
-                tcg_gen_atomic_fetch_or_tl(s->T0, s->A0, s->tmp0,
-                                           s->mem_index, ot | MO_LE);
-                break;
-            case 2: /* btr */
-                tcg_gen_not_tl(s->tmp0, s->tmp0);
-                tcg_gen_atomic_fetch_and_tl(s->T0, s->A0, s->tmp0,
-                                            s->mem_index, ot | MO_LE);
-                break;
-            default:
-            case 3: /* btc */
-                tcg_gen_atomic_fetch_xor_tl(s->T0, s->A0, s->tmp0,
-                                            s->mem_index, ot | MO_LE);
-                break;
-            }
-            tcg_gen_shr_tl(s->tmp4, s->T0, s->T1);
-        } else {
-            tcg_gen_shr_tl(s->tmp4, s->T0, s->T1);
-            switch (op) {
-            case 0: /* bt */
-                /* Data already loaded; nothing to do.  */
-                break;
-            case 1: /* bts */
-                tcg_gen_or_tl(s->T0, s->T0, s->tmp0);
-                break;
-            case 2: /* btr */
-                tcg_gen_andc_tl(s->T0, s->T0, s->tmp0);
-                break;
-            default:
-            case 3: /* btc */
-                tcg_gen_xor_tl(s->T0, s->T0, s->tmp0);
-                break;
-            }
-            if (op != 0) {
-                if (mod != 3) {
-                    gen_op_st_v(s, ot, s->T0, s->A0);
-                } else {
-                    gen_op_mov_reg_v(s, ot, rm, s->T0);
-                }
-            }
-        }
-
-        /* Delay all CC updates until after the store above.  Note that
-           C is the result of the test, Z is unchanged, and the others
-           are all undefined.  */
-        switch (s->cc_op) {
-        case CC_OP_MULB ... CC_OP_MULQ:
-        case CC_OP_ADDB ... CC_OP_ADDQ:
-        case CC_OP_ADCB ... CC_OP_ADCQ:
-        case CC_OP_SUBB ... CC_OP_SUBQ:
-        case CC_OP_SBBB ... CC_OP_SBBQ:
-        case CC_OP_LOGICB ... CC_OP_LOGICQ:
-        case CC_OP_INCB ... CC_OP_INCQ:
-        case CC_OP_DECB ... CC_OP_DECQ:
-        case CC_OP_SHLB ... CC_OP_SHLQ:
-        case CC_OP_SARB ... CC_OP_SARQ:
-        case CC_OP_BMILGB ... CC_OP_BMILGQ:
-            /* Z was going to be computed from the non-zero status of CC_DST.
-               We can get that same Z value (and the new C value) by leaving
-               CC_DST alone, setting CC_SRC, and using a CC_OP_SAR of the
-               same width.  */
-            tcg_gen_mov_tl(cpu_cc_src, s->tmp4);
-            set_cc_op(s, ((s->cc_op - CC_OP_MULB) & 3) + CC_OP_SARB);
-            break;
-        default:
-            /* Otherwise, generate EFLAGS and replace the C bit.  */
-            gen_compute_eflags(s);
-            tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, s->tmp4,
-                               ctz32(CC_C), 1);
-            break;
-        }
-        break;
-    case 0x1bc: /* bsf / tzcnt */
-    case 0x1bd: /* bsr / lzcnt */
-        ot = dflag;
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-        gen_extu(ot, s->T0);
-
-        /* Note that lzcnt and tzcnt are in different extensions.  */
-        if ((prefixes & PREFIX_REPZ)
-            && (b & 1
-                ? s->cpuid_ext3_features & CPUID_EXT3_ABM
-                : s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)) {
-            int size = 8 << ot;
-            /* For lzcnt/tzcnt, C bit is defined related to the input. */
-            tcg_gen_mov_tl(cpu_cc_src, s->T0);
-            if (b & 1) {
-                /* For lzcnt, reduce the target_ulong result by the
-                   number of zeros that we expect to find at the top.  */
-                tcg_gen_clzi_tl(s->T0, s->T0, TARGET_LONG_BITS);
-                tcg_gen_subi_tl(s->T0, s->T0, TARGET_LONG_BITS - size);
-            } else {
-                /* For tzcnt, a zero input must return the operand size.  */
-                tcg_gen_ctzi_tl(s->T0, s->T0, size);
-            }
-            /* For lzcnt/tzcnt, Z bit is defined related to the result.  */
-            gen_op_update1_cc(s);
-            set_cc_op(s, CC_OP_BMILGB + ot);
-        } else {
-            /* For bsr/bsf, only the Z bit is defined and it is related
-               to the input and not the result.  */
-            tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-            set_cc_op(s, CC_OP_LOGICB + ot);
-
-            /* ??? The manual says that the output is undefined when the
-               input is zero, but real hardware leaves it unchanged, and
-               real programs appear to depend on that.  Accomplish this
-               by passing the output as the value to return upon zero.  */
-            if (b & 1) {
-                /* For bsr, return the bit index of the first 1 bit,
-                   not the count of leading zeros.  */
-                tcg_gen_xori_tl(s->T1, cpu_regs[reg], TARGET_LONG_BITS - 1);
-                tcg_gen_clz_tl(s->T0, s->T0, s->T1);
-                tcg_gen_xori_tl(s->T0, s->T0, TARGET_LONG_BITS - 1);
-            } else {
-                tcg_gen_ctz_tl(s->T0, s->T0, cpu_regs[reg]);
-            }
-        }
-        gen_op_mov_reg_v(s, ot, reg, s->T0);
-        break;
-        /************************/
-        /* bcd */
-    case 0x27: /* daa */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_update_cc_op(s);
-        gen_helper_daa(cpu_env);
-        set_cc_op(s, CC_OP_EFLAGS);
-        break;
-    case 0x2f: /* das */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_update_cc_op(s);
-        gen_helper_das(cpu_env);
-        set_cc_op(s, CC_OP_EFLAGS);
-        break;
-    case 0x37: /* aaa */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_update_cc_op(s);
-        gen_helper_aaa(cpu_env);
-        set_cc_op(s, CC_OP_EFLAGS);
-        break;
-    case 0x3f: /* aas */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_update_cc_op(s);
-        gen_helper_aas(cpu_env);
-        set_cc_op(s, CC_OP_EFLAGS);
-        break;
-    case 0xd4: /* aam */
-        if (CODE64(s))
-            goto illegal_op;
-        val = x86_ldub_code(env, s);
-        if (val == 0) {
-            gen_exception(s, EXCP00_DIVZ, pc_start - s->cs_base);
-        } else {
-            gen_helper_aam(cpu_env, tcg_const_i32(val));
-            set_cc_op(s, CC_OP_LOGICB);
-        }
-        break;
-    case 0xd5: /* aad */
-        if (CODE64(s))
-            goto illegal_op;
-        val = x86_ldub_code(env, s);
-        gen_helper_aad(cpu_env, tcg_const_i32(val));
-        set_cc_op(s, CC_OP_LOGICB);
-        break;
-        /************************/
-        /* misc */
-    case 0x90: /* nop */
-        /* XXX: correct lock test for all insn */
-        if (prefixes & PREFIX_LOCK) {
-            goto illegal_op;
-        }
-        /* If REX_B is set, then this is xchg eax, r8d, not a nop.  */
-        if (REX_B(s)) {
-            goto do_xchg_reg_eax;
-        }
-        if (prefixes & PREFIX_REPZ) {
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - pc_start));
-            s->base.is_jmp = DISAS_NORETURN;
-        }
-        break;
-    case 0x9b: /* fwait */
-        if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
-            (HF_MP_MASK | HF_TS_MASK)) {
-            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-        } else {
-            gen_helper_fwait(cpu_env);
-        }
-        break;
-    case 0xcc: /* int3 */
-        gen_interrupt(s, EXCP03_INT3, pc_start - s->cs_base, s->pc - s->cs_base);
-        break;
-    case 0xcd: /* int N */
-        val = x86_ldub_code(env, s);
-        if (check_vm86_iopl(s)) {
-            gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
-        }
-        break;
-    case 0xce: /* into */
-        if (CODE64(s))
-            goto illegl(s)) {
-            gen_helper_cli(cpu_env);
-        }
-        break;
-    case 0xfb: /* sti */
-        if (check_iopl(s)) {
-            gen_helper_sti(cpu_env);
-            /* interruptions are enabled only the first insn after sti */
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob_inhibit_irq(s, true);
-        }
-        break;
-    case 0x62: /* bound */
-        if (CODE64(s))
-            goto illegal_op;
-        ot = dflag;
-        modrm = x86_ldub_code(env, s);
-        reg = (modrm >> 3) & 7;
-        mod = (modrm >> 6) & 3;
-        if (mod == 3)
-            goto illegal_op;
-        gen_op_mov_v_reg(s, ot, s->T0, reg);
-        gen_lea_modrm(env, s, modrm);
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-        if (ot == MO_16) {
-            gen_helper_boundw(cpu_env, s->A0, s->tmp2_i32);
-        } else {
-            gen_helper_boundl(cpu_env, s->A0, s->tmp2_i32);
-        }
-        break;
-    case 0x1c8 ... 0x1cf: /* bswap reg */
-        reg = (b & 7) | REX_B(s);
-#ifdef TARGET_X86_64
-        if (dflag == MO_64) {
-            tcg_gen_bswap64_i64(cpu_regs[reg], cpu_regs[reg]);
-            break;
-        }
-#endif
-        tcg_gen_bswap32_tl(cpu_regs[reg], cpu_regs[reg], TCG_BSWAP_OZ);
-        break;
-    case 0xd6: /* salc */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_compute_eflags_c(s, s->T0);
-        tcg_gen_neg_tl(s->T0, s->T0);
-        gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
-        break;
-    case 0xe0: /* loopnz */
-    case 0xe1: /* loopz */
-    case 0xe2: /* loop */
-    case 0xe3: /* jecxz */
-        {
-            TCGLabel *l1, *l2, *l3;
-
-            tval = (int8_t)insn_get(env, s, MO_8);
-            next_eip = s->pc - s->cs_base;
-            tval += next_eip;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            }
-
-            l1 = gen_new_label();
-            l2 = gen_new_label();
-            l3 = gen_new_label();
-            gen_update_cc_op(s);
-            b &= 3;
-            switch(b) {
-            case 0: /* loopnz */
-            case 1: /* loopz */
-                gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jz_ecx(s, s->aflag, l3);
-                gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
-                break;
-            case 2: /* loop */
-                gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jnz_ecx(s, s->aflag, l1);
-                break;
-            default:
-            case 3: /* jcxz */
-                gen_op_jz_ecx(s, s->aflag, l1);
-                break;
-            }
-
-            gen_set_label(l3);
-            gen_jmp_im(s, next_eip);
-            tcg_gen_br(l2);
-
-            gen_set_label(l1);
-            gen_jmp_im(s, tval);
-            gen_set_label(l2);
-            gen_eob(s);
-        }
-        break;
-    case 0x130: /* wrmsr */
-    case 0x132: /* rdmsr */
-        if (check_cpl0(s)) {
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            if (b & 2) {
-                gen_helper_rdmsr(cpu_env);
-            } else {
-                gen_helper_wrmsr(cpu_env);
-                gen_jmp_im(s, s->pc - s->cs_base);
-                gen_eob(s);
-            }
-        }
-        break;
-    case 0x131: /* rdtsc */
-        gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_helper_rdtsc(cpu_env);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
-        break;
-    case 0x133: /* rdpmc */
-        gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_rdpmc(cpu_env);
-        s->base.is_jmp = DISAS_NORETURN;
-        break;
-    case 0x134: /* sysenter */
-        /* For Intel SYSENTER is valid on 64-bit */
-        if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
-            goto illegal_op;
-        if (!PE(s)) {
-            gen_exception_gpf(s);
-        } else {
-            gen_helper_sysenter(cpu_env);
-            gen_eob(s);
-        }
-        break;
-    case 0x135: /* sysexit */
-        /* For Intel SYSEXIT is valid on 64-bit */
-        if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
-            goto illegal_op;
-        if (!PE(s)) {
-            gen_exception_gpf(s);
-        } else {
-            gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
-            gen_eob(s);
-        }
-        break;
-#ifdef TARGET_X86_64
-    case 0x105: /* syscall */
-        /* XXX: is it usable in real mode ? */
-        gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - pc_start));
-        /* TF handling for the syscall insn is different. The TF bit is  checked
-           after the syscall insn completes. This allows #DB to not be
-           generated after one has entered CPL0 if TF is set in FMASK.  */
-        gen_eob_worker(s, false, true);
-        break;
-    case 0x107: /* sysret */
-        if (!PE(s)) {
-            gen_exception_gpf(s);
-        } else {
-            gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
-            /* condition codes are modified only in long mode */
-            if (LMA(s)) {
-                set_cc_op(s, CC_OP_EFLAGS);
-            }
-            /* TF handling for the sysret insn is different. The TF bit is
-               checked after the sysret insn completes. This allows #DB to be
-               generated "as if" the syscall insn in userspace has just
-               completed.  */
-            gen_eob_worker(s, false, true);
-        }
-        break;
-#endif
-    case 0x1a2: /* cpuid */
-        gen_update_cc_op(s);
-        gen_jmp_im(s, pc_start - s->cs_base);
-        gen_helper_cpuid(cpu_env);
-        break;
-    case 0xf4: /* hlt */
-        if (check_cpl0(s)) {
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
-            s->base.is_jmp = DISAS_NORETURN;
-        }
-        break;
-    case 0x100:
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        op = (modrm >> 3) & 7;
-        switch(op) {
-        case 0: /* sldt */
-            if (!PE(s) || VM86(s))
-                goto illegal_op;
-            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_LDTR_READ);
-            tcg_gen_ld32u_tl(s->T0, cpu_env,
-                             offsetof(CPUX86State, ldt.selector));
-            ot = mod == 3 ? dflag : MO_16;
-            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
-            break;
-        case 2: /* lldt */
-            if (!PE(s) || VM86(s))
-                goto illegal_op;
-            if (check_cpl0(s)) {
-                gen_svm_check_intercept(s, SVM_EXIT_LDTR_WRITE);
-                gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lldt(cpu_env, s->tmp2_i32);
-            }
-            break;
-        case 1: /* str */
-            if (!PE(s) || VM86(s))
-                goto illegal_op;
-            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_TR_READ);
-            tcg_gen_ld32u_tl(s->T0, cpu_env,
-                             offsetof(CPUX86State, tr.selector));
-            ot = mod == 3 ? dflag : MO_16;
-            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
-            break;
-        case 3: /* ltr */
-            if (!PE(s) || VM86(s))
-                goto illegal_op;
-            if (check_cpl0(s)) {
-                gen_svm_check_intercept(s, SVM_EXIT_TR_WRITE);
-                gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-                tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_ltr(cpu_env, s->tmp2_i32);
-            }
-            break;
-        case 4: /* verr */
-        case 5: /* verw */
-            if (!PE(s) || VM86(s))
-                goto illegal_op;
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            gen_update_cc_op(s);
-            if (op == 4) {
-                gen_helper_verr(cpu_env, s->T0);
-            } else {
-                gen_helper_verw(cpu_env, s->T0);
-            }
-            set_cc_op(s, CC_OP_EFLAGS);
-            break;
-        default:
-            goto unknown_op;
-        }
-        break;
-
-    case 0x101:
-        modrm = x86_ldub_code(env, s);
-        switch (modrm) {
-        CASE_MODRM_MEM_OP(0): /* sgdt */
-            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_GDTR_READ);
-            gen_lea_modrm(env, s, modrm);
-            tcg_gen_ld32u_tl(s->T0,
-                             cpu_env, offsetof(CPUX86State, gdt.limit));
-            gen_op_st_v(s, MO_16, s->T0, s->A0);
-            gen_add_A0_im(s, 2);
-            tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base));
-            if (dflag == MO_16) {
-                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
-            }
-            gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            break;
-
-        case 0xc8: /* monitor */
-            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
-                goto illegal_op;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
-            gen_extu(s->aflag, s->A0);
-            gen_add_A0_ds_seg(s);
-            gen_helper_monitor(cpu_env, s->A0);
-            break;
-
-        case 0xc9: /* mwait */
-            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
-                goto illegal_op;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
-            s->base.is_jmp = DISAS_NORETURN;
-            break;
-
-        case 0xca: /* clac */
-            if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
-                || CPL(s) != 0) {
-                goto illegal_op;
-            }
-            gen_helper_clac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-            break;
-
-        case 0xcb: /* stac */
-            if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
-                || CPL(s) != 0) {
-                goto illegal_op;
-            }
-            gen_helper_stac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-            break;
-
-        CASE_MODRM_MEM_OP(1): /* sidt */
-            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_IDTR_READ);
-            gen_lea_modrm(env, s, modrm);
-            tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.limit));
-            gen_op_st_v(s, MO_16, s->T0, s->A0);
-            gen_add_A0_im(s, 2);
-            tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base));
-            if (dflag == MO_16) {
-                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
-            }
-            gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            break;
-
-        case 0xd0: /* xgetbv */
-            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
-                || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
-                                 | PREFIX_REPZ | PREFIX_REPNZ))) {
-                goto illegal_op;
-            }
-            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
-            gen_helper_xgetbv(s->tmp1_i64, cpu_env, s->tmp2_i32);
-            tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], s->tmp1_i64);
-            break;
-
-        case 0xd1: /* xsetbv */
-            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
-                || (s->prefix & (PREFIX_LOCK | PREFIX_DATA
-                                 | PREFIX_REPZ | PREFIX_REPNZ))) {
-                goto illegal_op;
-            }
-            if (!check_cpl0(s)) {
-                break;
-            }
-            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
-                                  cpu_regs[R_EDX]);
-            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
-            gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
-            /* End TB because translation flags may change.  */
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-            break;
-
-        case 0xd8: /* VMRUN */
-            if (!SVME(s) || !PE(s)) {
-                goto illegal_op;
-            }
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
-                             tcg_const_i32(s->pc - pc_start));
-            tcg_gen_exit_tb(NULL, 0);
-            s->base.is_jmp = DISAS_NORETURN;
-            break;
-
-        case 0xd9: /* VMMCALL */
-            if (!SVME(s)) {
-                goto illegal_op;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_vmmcall(cpu_env);
-            break;
-
-        case 0xda: /* VMLOAD */
-            if (!SVME(s) || !PE(s)) {
-                goto illegal_op;
-            }
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
-            break;
-
-        case 0xdb: /* VMSAVE */
-            if (!SVME(s) || !PE(s)) {
-                goto illegal_op;
-            }
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
-            break;
-
-        case 0xdc: /* STGI */
-            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
-                || !PE(s)) {
-                goto illegal_op;
-            }
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_update_cc_op(s);
-            gen_helper_stgi(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-            break;
-
-        case 0xdd: /* CLGI */
-            if (!SVME(s) || !PE(s)) {
-                goto illegal_op;
-            }
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_clgi(cpu_env);
-            break;
-
-        case 0xde: /* SKINIT */
-            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
-                || !PE(s)) {
-                goto illegal_op;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_SKINIT);
-            /* If not intercepted, not implemented -- raise #UD. */
-            goto illegal_op;
-
-        case 0xdf: /* INVLPGA */
-            if (!SVME(s) || !PE(s)) {
-                goto illegal_op;
-            }
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_INVLPGA);
-            if (s->aflag == MO_64) {
-                tcg_gen_mov_tl(s->A0, cpu_regs[Rdrm(env, s, modrm);
-            gen_op_ld_v(s, MO_16, s->T1, s->A0);
-            gen_add_A0_im(s, 2);
-            gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            if (dflag == MO_16) {
-                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
-            }
-            tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base));
-            tcg_gen_st32_tl(s->T1, cpu_env, offsetof(CPUX86State, gdt.limit));
-            break;
-
-        CASE_MODRM_MEM_OP(3): /* lidt */
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_IDTR_WRITE);
-            gen_lea_modrm(env, s, modrm);
-            gen_op_ld_v(s, MO_16, s->T1, s->A0);
-            gen_add_A0_im(s, 2);
-            gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            if (dflag == MO_16) {
-                tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
-            }
-            tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base));
-            tcg_gen_st32_tl(s->T1, cpu_env, offsetof(CPUX86State, idt.limit));
-            break;
-
-        CASE_MODRM_OP(4): /* smsw */
-            if (s->flags & HF_UMIP_MASK && !check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_READ_CR0);
-            tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
-            /*
-             * In 32-bit mode, the higher 16 bits of the destination
-             * register are undefined.  In practice CR0[31:0] is stored
-             * just like in 64-bit mode.
-             */
-            mod = (modrm >> 6) & 3;
-            ot = (mod != 3 ? MO_16 : s->dflag);
-            gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
-            break;
-        case 0xee: /* rdpkru */
-            if (prefixes & PREFIX_LOCK) {
-                goto illegal_op;
-            }
-            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
-            gen_helper_rdpkru(s->tmp1_i64, cpu_env, s->tmp2_i32);
-            tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], s->tmp1_i64);
-            break;
-        case 0xef: /* wrpkru */
-            if (prefixes & PREFIX_LOCK) {
-                goto illegal_op;
-            }
-            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
-                                  cpu_regs[R_EDX]);
-            tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
-            gen_helper_wrpkru(cpu_env, s->tmp2_i32, s->tmp1_i64);
-            break;
-
-        CASE_MODRM_OP(6): /* lmsw */
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            /*
-             * Only the 4 lower bits of CR0 are modified.
-             * PE cannot be set to zero if already set to one.
-             */
-            tcg_gen_ld_tl(s->T1, cpu_env, offsetof(CPUX86State, cr[0]));
-            tcg_gen_andi_tl(s->T0, s->T0, 0xf);
-            tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
-            tcg_gen_or_tl(s->T0, s->T0, s->T1);
-            gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-            break;
-
-        CASE_MODRM_MEM_OP(7): /* invlpg */
-            if (!check_cpl0(s)) {
-                break;
-            }
-            gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
-            gen_lea_modrm(env, s, modrm);
-            gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-            break;
-
-        case 0xf8: /* swapgs */
-#ifdef TARGET_X86_64
-            if (CODE64(s)) {
-                if (check_cpl0(s)) {
-                    tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
-                    tcg_gen_ld_tl(cpu_seg_base[R_GS], cpu_env,
-                                  offsetof(CPUX86State, kernelgsbase));
-                    tcg_gen_st_tl(s->T0, cpu_env,
-                                  offsetof(CPUX86State, kernelgsbase));
-                }
-                break;
-            }
-#endif
-            goto illegal_op;
-
-        case 0xf9: /* rdtscp */
-            if (!(s->cpuid_ext2_features & CPUID_EXT2_RDTSCP)) {
-                goto illegal_op;
-            }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_io_start();
-            }
-            gen_helper_rdtscp(cpu_env);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
-            break;
-
-        default:
-            goto unknown_op;
-        }
-        break;
-
-    case 0x108: /* invd */
-    case 0x109: /* wbinvd */
-        if (check_cpl0(s)) {
-            gen_svm_check_intercept(s, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
-            /* nothing to do */
-        }
-        break;
-    case 0x63: /* arpl or movslS (x86_64) */
-#ifdef TARGET_X86_64
-        if (CODE64(s)) {
-            int d_ot;
-            /* d_ot is the size of destination */
-            d_ot = dflag;
-
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            mod = (modrm >> 6) & 3;
-            rm = (modrm & 7) | REX_B(s);
-
-            if (mod == 3) {
-                gen_op_mov_v_reg(s, MO_32, s->T0, rm);
-                /* sign extend */
-                if (d_ot == MO_64) {
-                    tcg_gen_ext32s_tl(s->T0, s->T0);
-                }
-                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
-            } else {
-                gen_lea_modrm(env, s, modrm);
-                gen_op_ld_v(s, MO_32 | MO_SIGN, s->T0, s->A0);
-                gen_op_mov_reg_v(s, d_ot, reg, s->T0);
-            }
-        } else
-#endif
-        {
-            TCGLabel *label1;
-            TCGv t0, t1, t2, a0;
-
-            if (!PE(s) || VM86(s))
-                goto illegal_op;
-            t0 = tcg_temp_local_new();
-            t1 = tcg_temp_local_new();
-            t2 = tcg_temp_local_new();
-            ot = MO_16;
-            modrm = x86_ldub_code(env, s);
-            reg = (modrm >> 3) & 7;
-            mod = (modrm >> 6) & 3;
-            rm = modrm & 7;
-            if (mod != 3) {
-                gen_lea_modrm(env, s, modrm);
-                gen_op_ld_v(s, ot, t0, s->A0);
-                a0 = tcg_temp_local_new();
-                tcg_gen_mov_tl(a0, s->A0);
-            } else {
-                gen_op_mov_v_reg(s, ot, t0, rm);
-                a0 = NULL;
-            }
-            gen_op_mov_v_reg(s, ot, t1, reg);
-            tcg_gen_andi_tl(s->tmp0, t0, 3);
-            tcg_gen_andi_tl(t1, t1, 3);
-            tcg_gen_movi_tl(t2, 0);
-            label1 = gen_new_label();
-            tcg_gen_brcond_tl(TCG_COND_GE, s->tmp0, t1, label1);
-            tcg_gen_andi_tl(t0, t0, ~3);
-            tcg_gen_or_tl(t0, t0, t1);
-            tcg_gen_movi_tl(t2, CC_Z);
-            gen_set_label(label1);
-            if (mod != 3) {
-                gen_op_st_v(s, ot, t0, a0);
-                tcg_temp_free(a0);
-           } else {
-                gen_op_mov_reg_v(s, ot, rm, t0);
-            }
-            gen_compute_eflags(s);
-            tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_Z);
-            tcg_gen_or_tl(cpu_cc_src, cpu_cc_src, t2);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
-            tcg_temp_free(t2);
-        }
-        break;
-    case 0x102: /* lar */
-    case 0x103: /* lsl */
-        {
-            TCGLabel *label1;
-            TCGv t0;
-            if (!PE(s) || VM86(s))
-                goto illegal_op;
-            ot = dflag != MO_16 ? MO_32 : MO_16;
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            t0 = tcg_temp_local_new();
-            gen_update_cc_op(s);
-            if (b == 0x102) {
-                gen_helper_lar(t0, cpu_env, s->T0);
-            } else {
-                gen_helper_lsl(t0, cpu_env, s->T0);
-            }
-            tcg_gen_andi_tl(s->tmp0, cpu_cc_src, CC_Z);
-            label1 = gen_new_label();
-            tcg_gen_brcondi_tl(TCG_COND_EQ, s->tmp0, 0, label1);
-            gen_op_mov_reg_v(s, ot, reg, t0);
-            gen_set_label(label1);
-            set_cc_op(s, CC_OP_EFLAGS);
-            tcg_temp_free(t0);
-        }
-        break;
-    case 0x118:
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        op = (modrm >> 3) & 7;
-        switch(op) {
-        case 0: /* prefetchnta */
-        case 1: /* prefetchnt0 */
-        case 2: /* prefetchnt0 */
-        case 3: /* prefetchnt0 */
-            if (mod == 3)
-                goto illegal_op;
-            gen_nop_modrm(env, s, modrm);
-            /* nothing more to do */
-            break;
-        default: /* nop (multi byte) */
-            gen_nop_modrm(env, s, modrm);
-            break;
-        }
-        break;
-    case 0x11a:
-        modrm = x86_ldub_code(env, s);
-        if (s->flags & HF_MPX_EN_MASK) {
-            mod = (modrm >> 6) & 3;
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            if (prefixes & PREFIX_REPZ) {
-                /* bndcl */
-                if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
-                    || s->aflag == MO_16) {
-                    goto illegal_op;
-                }
-                gen_bndck(env, s, modrm, TCG_COND_LTU, cpu_bndl[reg]);
-            } else if (prefixes & PREFIX_REPNZ) {
-                /* bndcu */
-                if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
-                    || s->aflag == MO_16) {
-                    goto illegal_op;
-                }
-                TCGv_i64 notu = tcg_temp_new_i64();
-                tcg_gen_not_i64(notu, cpu_bndu[reg]);
-                gen_bndck(env, s, modrm, TCG_COND_GTU, notu);
-                tcg_temp_free_i64(notu);
-            } else if (prefixes & PREFIX_DATA) {
-                /* bndmov -- from reg/mem */
-                if (reg >= 4 || s->aflag == MO_16) {
-                    goto illegal_op;
-                }
-                if (mod == 3) {
-                    int reg2 = (modrm & 7) | REX_B(s);
-                    if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
-                        goto illegal_op;
-                    }
-                    if (s->flags & HF_MPX_IU_MASK) {
-                        tcg_gen_mov_i64(cpu_bndl[reg], cpu_bndl[reg2]);
-                        tcg_gen_mov_i64(cpu_bndu[reg], cpu_bndu[reg2]);
-                    }
-                } else {
-                    gen_lea_modrm(env, s, modrm);
-                    if (CODE64(s)) {
-                        tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
-                                            s->mem_index, MO_LEUQ);
-                        tcg_gen_addi_tl(s->A0, s->A0, 8);
-                        tcg_gen_qemu_ld_i64(cpu_bndu[reg], s->A0,
-                                            s->mem_index, MO_LEUQ);
-                    } else {
-                        tcg_gen_qemu_ld_i64(cpu_bndl[reg], s->A0,
-                                            s->mem_index, MO_LEUL);
-                        tcg_gen_addi_tl(s->A0, s->A0, 4);
-                        tcg_gen_qemu_ld_i64(cpu_bndu[reg], s->A0,
-                                            s->mem_index, MO_LEUL);
-                    }
-                    /* bnd registers are now in-use */
-                    gen_set_hflag(s, HF_MPX_IU_MASK);
-                }
-            } else if (mod != 3) {
-                /* bndldx */
-                AddressParts a = gen_lea_modrm_0(env, s, modrm);
-                if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
-                    || s->aflag == MO_16
-                    || a.base < -1) {
-                    goto illegal_op;
-                }
-                if (a.base >= 0) {
-                    tcg_gen_addi_tl(s->A0, cpu_regs[a.base], a.disp);
-                } else {
-                    tcg_gen_movi_tl(s->A0, 0);
-                }
-                gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
-                if (a.index >= 0) {
-                    tcg_gen_mov_tl(s->T0, cpu_regs[a.index]);
-                } else {
-                    tcg_gen_movi_tl(s->T0, 0);
-                }
-                if (CODE64(s)) {
-                    gen_helper_bndldx64(cpu_bndl[reg], cpu_env, s->A0, s->T0);
-                    tcg_gen_ld_i64(cpu_bndu[reg], cpu_env,
-                                   offsetof(CPUX86State, mmx_t0.MMX_Q(0)));
-                } else {
-                    gen_helper_bndldx32(cpu_bndu[reg], cpu_env, s->A0, s->T0);
-                    tcg_gen_ext32u_i64(cpu_bndl[reg], cpu_bndu[reg]);
-                    tcg_gen_shri_i64(cpu_bndu[reg], cpu_bndu[reg], 32);
-                }
-                gen_set_hflag(s, HF_MPX_IU_MASK);
-            }
-        }
-        gen_nop_modrm(env, s, modrm);
-        break;
-    case 0x11b:
-        modrm = x86_ldub_code(env, s);
-        if (s->flags & HF_MPX_EN_MASK) {
-            mod = (modrm >> 6) & 3;
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            if (mod != 3 && (prefixes & PREFIX_REPZ)) {
-                /* bndmk */
-                if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
-                    || s->aflag == MO_16) {
-                    goto illegal_op;
-                }
-                AddressParts a = gen_lea_modrm_0(env, s, modrm);
-                if (a.base >= 0) {
-                    tcg_gen_extu_tl_i64(cpu_bndl[reg], cpu_regs[a.base]);
-                    if (!CODE64(s)) {
-                        tcg_gen_ext32u_i64(cpu_bndl[reg], cpu_bndl[reg]);
-                    }
-                } else if (a.base == -1) {
-                    /* no base register has lower bound of 0 */
-                    tcg_gen_movi_i64(cpu_bndl[reg], 0);
-                } else {
-                    /* rip-relative generates #ud */
-                    goto illegal_op;
-                }
-                tcg_gen_not_tl(s->A0, gen_lea_modrm_1(s, a));
-                if (!CODE64(s)) {
-                    tcg_gen_ext32u_tl(s->A0, s->A0);
-                }
-                tcg_gen_extu_tl_i64(cpu_bndu[reg], s->A0);
-                /* bnd registers are now in-use */
-                gen_set_hflag(s, HF_MPX_IU_MASK);
-                break;
-            } else if (prefixes & PREFIX_REPNZ) {
-                /* bndcn */
-                if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
-                    || s->aflag == MO_16) {
-                    goto illegal_op;
-                }
-                gen_bndck(env, s, modrm, TCG_COND_GTU, cpu_bndu[reg]);
-            } else if (prefixes & PREFIX_DATA) {
-                /* bndmov -- to reg/mem */
-                if (reg >= 4 || s->aflag == MO_16) {
-                    goto illegal_op;
-                }
-                if (mod == 3) {
-                    int reg2 = (modrm & 7) | REX_B(s);
-                    if (reg2 >= 4 || (prefixes & PREFIX_LOCK)) {
-                        goto illegal_op;
-                    }
-                    if (s->flags & HF_MPX_IU_MASK) {
-                        tcg_gen_mov_i64(cpu_bndl[reg2], cpu_bndl[reg]);
-                        tcg_gen_mov_i64(cpu_bndu[reg2], cpu_bndu[reg]);
-                    }
-                } else {
-                    gen_lea_modrm(env, s, modrm);
-                    if (CODE64(s)) {
-                        tcg_gen_qemu_st_i64(cpu_bndl[reg], s->A0,
-                                            s->mem_index, MO_LEUQ);
-                        tcg_gen_addi_tl(s->A0, s->A0, 8);
-                        tcg                                           s->mem_index, MO_LEUL);
-                    }
-                }
-            } else if (mod != 3) {
-                /* bndstx */
-                AddressParts a = gen_lea_modrm_0(env, s, modrm);
-                if (reg >= 4
-                    || (prefixes & PREFIX_LOCK)
-                    || s->aflag == MO_16
-                    || a.base < -1) {
-                    goto illegal_op;
-                }
-                if (a.base >= 0) {
-                    tcg_gen_addi_tl(s->A0, cpu_regs[a.base], a.disp);
-                } else {
-                    tcg_gen_movi_tl(s->A0, 0);
-                }
-                gen_lea_v_seg(s, s->aflag, s->A0, a.def_seg, s->override);
-                if (a.index >= 0) {
-                    tcg_gen_mov_tl(s->T0, cpu_regs[a.index]);
-                } else {
-                    tcg_gen_movi_tl(s->T0, 0);
-                }
-                if (CODE64(s)) {
-                    gen_helper_bndstx64(cpu_env, s->A0, s->T0,
-                                        cpu_bndl[reg], cpu_bndu[reg]);
-                } else {
-                    gen_helper_bndstx32(cpu_env, s->A0, s->T0,
-                                        cpu_bndl[reg], cpu_bndu[reg]);
-                }
-            }
-        }
-        gen_nop_modrm(env, s, modrm);
-        break;
-    case 0x119: case 0x11c ... 0x11f: /* nop (multi byte) */
-        modrm = x86_ldub_code(env, s);
-        gen_nop_modrm(env, s, modrm);
-        break;
-
-    case 0x120: /* mov reg, crN */
-    case 0x122: /* mov crN, reg */
-        if (!check_cpl0(s)) {
-            break;
-        }
-        modrm = x86_ldub_code(env, s);
-        /*
-         * Ignore the mod bits (assume (modrm&0xc0)==0xc0).
-         * AMD documentation (24594.pdf) and testing of Intel 386 and 486
-         * processors all show that the mod bits are assumed to be 1's,
-         * regardless of actual values.
-         */
-        rm = (modrm & 7) | REX_B(s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        switch (reg) {
-        case 0:
-            if ((prefixes & PREFIX_LOCK) &&
-                (s->cpuid_ext3_features & CPUID_EXT3_CR8LEG)) {
-                reg = 8;
-            }
-            break;
-        case 2:
-        case 3:
-        case 4:
-        case 8:
-            break;
-        default:
-            goto unknown_op;
-        }
-        ot  = (CODE64(s) ? MO_64 : MO_32);
-
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        if (b & 2) {
-            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
-            gen_op_mov_v_reg(s, ot, s->T0, rm);
-            gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-        } else {
-            gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
-            gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
-            gen_op_mov_reg_v(s, ot, rm, s->T0);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
-        }
-        break;
-
-    case 0x121: /* mov reg, drN */
-    case 0x123: /* mov drN, reg */
-        if (check_cpl0(s)) {
-            modrm = x86_ldub_code(env, s);
-            /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
-             * AMD documentation (24594.pdf) and testing of
-             * intel 386 and 486 processors all show that the mod bits
-             * are assumed to be 1's, regardless of actual values.
-             */
-            rm = (modrm & 7) | REX_B(s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-            if (CODE64(s))
-                ot = MO_64;
-            else
-                ot = MO_32;
-            if (reg >= 8) {
-                goto illegal_op;
-            }
-            if (b & 2) {
-                gen_svm_check_intercept(s, SVM_EXIT_WRITE_DR0 + reg);
-                gen_op_mov_v_reg(s, ot, s->T0, rm);
-                tcg_gen_movi_i32(s->tmp2_i32, reg);
-                gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_jmp_im(s, s->pc - s->cs_base);
-                gen_eob(s);
-            } else {
-                gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
-                tcg_gen_movi_i32(s->tmp2_i32, reg);
-                gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
-                gen_op_mov_reg_v(s, ot, rm, s->T0);
-            }
-        }
-        break;
-    case 0x106: /* clts */
-        if (check_cpl0(s)) {
-            gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
-            gen_helper_clts(cpu_env);
-            /* abort block because static cpu state changed */
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-        }
-        break;
-    /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
-    case 0x1c3: /* MOVNTI reg, mem */
-        if (!(s->cpuid_features & CPUID_SSE2))
-            goto illegal_op;
-        ot = mo_64_32(dflag);
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        if (mod == 3)
-            goto illegal_op;
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-        /* generate a generic store */
-        gen_ldst_modrm(env, s, modrm, ot, reg, 1);
-        break;
-    case 0x1ae:
-        modrm = x86_ldub_code(env, s);
-        switch (modrm) {
-        CASE_MODRM_MEM_OP(0): /* fxsave */
-            if (!(s->cpuid_features & CPUID_FXSR)
-                || (prefixes & PREFIX_LOCK)) {
-                goto illegal_op;
-            }
-            if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-                break;
-            }
-            gen_lea_modrm(env, s, modrm);
-            gen_helper_fxsave(cpu_env, s->A0);
-            break;
-
-        CASE_MODRM_MEM_OP(1): /* fxrstor */
-            if (!(s->cpuid_features & CPUID_FXSR)
-                || (prefixes & PREFIX_LOCK)) {
-                goto illegal_op;
-            }
-            if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-                break;
-            }
-            gen_lea_modrm(env, s, modrm);
-            gen_helper_fxrstor(cpu_env, s->A0);
-            break;
-
-        CASE_MODRM_MEM_OP(2): /* ldmxcsr */
-            if ((s->flags & HF_EM_MASK) || !(s->flags & HF_OSFXSR_MASK)) {
-                goto illegal_op;
-            }
-            if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-                break;
-            }
-            gen_lea_modrm(env, s, modrm);
-            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0, s->mem_index, MO_LEUL);
-            gen_helper_ldmxcsr(cpu_env, s->tmp2_i32);
-            break;
-
-        CASE_MODRM_MEM_OP(3): /* stmxcsr */
-            if ((s->flags & HF_EM_MASK) || !(s->flags & HF_OSFXSR_MASK)) {
-                goto illegal_op;
-            }
-            if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-                break;
-            }
-            gen_helper_update_mxcsr(cpu_env);
-            gen_lea_modrm(env, s, modrm);
-            tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, mxcsr));
-            gen_op_st_v(s, MO_32, s->T0, s->A0);
-            break;
-
-        CASE_MODRM_MEM_OP(4): /* xsave */
-            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
-                || (prefixes & (PREFIX_LOCK | PREFIX_DATA
-                                | PREFIX_REPZ | PREFIX_REPNZ))) {
-                goto illegal_op;
-            }
-            gen_lea_modrm(env, s, modrm);
-            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
-                                  cpu_regs[R_EDX]);
-            gen_helper_xsave(cpu_env, s->A0, s->tmp1_i64);
-            break;
-
-        CASE_MODRM_MEM_OP(5): /* xrstor */
-            if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
-                || (prefixes & (PREFIX_LOCK | PREFIX_DATA
-                                | PREFIX_REPZ | PREFIX_REPNZ))) {
-                goto illegal_op;
-            }
-            gen_lea_modrm(env, s, modrm);
-            tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
-                                  cpu_regs[R_EDX]);
-            gen_helper_xrstor(cpu_env, s->A0, s->tmp1_i64);
-            /* XRSTOR is how MPX is enabled, which changes how
-               we translate.  Thus we need to end the TB.  */
-            gen_update_cc_op(s);
-            gen_jmp_im(s, s->pc - s->cs_base);
-            gen_eob(s);
-            break;
-
-        CASE_MODRM_MEM_OP(6): /* xsaveopt / clwb */
-            if (prefixes & PREFIX_LOCK) {
-                goto illegal_op;
-            }
-            if (prefixes & PREFIX_DATA) {
-                /* clwb */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLWB)) {
-                    goto illegal_op;
-                }
-                gen_nop_modrm(env, s, modrm);
-            } else {
-                /* xsaveopt */
-                if ((s->cpuid_ext_features & CPUID_EXT_XSAVE) == 0
-                    || (s->cpuid_xsave_features & CPUID_XSAVE_XSAVEOPT) == 0
-                    || (prefixes & (PREFIX_REPZ | PREFIX_REPNZ))) {
-                    goto illegal_op;
-                }
-                gen_lea_modrm(env, s, modrm);
-                tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
-                                      cpu_regs[R_EDX]);
-                gen_helper_xsaveopt(cpu_env, s->A0, s->tmp1_i64);
-            }
-            break;
-
-        CASE_MODRM_MEM_OP(7): /* clflush / clflushopt */
-            if (prefixes & PREFIX_LOCK) {
-                goto illegal_op;
-            }
-            if (prefixes & PREFIX_DATA) {
-                /* clflushopt */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_CLFLUSHOPT)) {
-                    goto illegal_op;
-                }
-            } else {
-                /* clflush */
-                if ((s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))
-                    || !(s->cpuid_features & CPUID_CLFLUSH)) {
-                    goto illegal_op;
-                }
-            }
-            gen_nop_modrm(env, s, modrm);
-            break;
-
-        case 0xc0 ... 0xc7: /* rdfsbase (f3 0f ae /0) */
-        case 0xc8 ... 0xcf: /* rdgsbase (f3 0f ae /1) */
-        case 0xd0 ... 0xd7: /* wrfsbase (f3 0f ae /2) */
-        case 0xd8 ... 0xdf: /* wrgsbase (f3 0f ae /3) */
-            if (CODE64(s)
-                && (prefixes & PREFIX_REPZ)
-                && !(prefixes & PREFIX_LOCK)
-                && (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_FSGSBASE)) {
-                TCGv base, treg, src, dst;
-
-                /* Preserve hflags bits by testing CR4 at runtime.  */
-                tcg_gen_movi_i32(s->tmp2_i32, CR4_FSGSBASE_MASK);
-                gen_helper_cr4_testbit(cpu_env, s->tmp2_i32);
-
-                base = cpu_seg_base[modrm & 8 ? R_GS : R_FS];
-                treg = cpu_regs[(modrm & 7) | REX_B(s)];
-
-                if (modrm & 0x10) {
-                    /* wr*base */
-                    dst = base, src = treg;
-                } else {
-                    /* rd*base */
-                    dst = treg, src = base;
-                }
-
-                if (s->dflag == MO_32) {
-                    tcg_gen_ext32u_tl(dst, src);
-                } else {
-                    tcg_gen_mov_tl(dst, src);
-                }
-                break;
-            }
-            goto unknown_op;
-
-        case 0xf8: /* sfence / pcommit */
-            if (prefixes & PREFIX_DATA) {
-                /* pcommit */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_PCOMMIT)
-                    || (prefixes & PREFIX_LOCK)) {
-                    goto illegal_op;
-                }
-                break;
-            }
-            /* fallthru */
-        case 0xf9 ... 0xff: /* sfence */
-            if (!(s->cpuid_features & CPUID_SSE)
-                || (prefixes & PREFIX_LOCK)) {
-                goto illegal_op;
-            }
-            tcg_gen_mb(TCG_MO_ST_ST | TCG_BAR_SC);
-            break;
-        case 0xe8 ... 0xef: /* lfence */
-            if (!(s->cpuid_features & CPUID_SSE)
-                || (prefixes & PREFIX_LOCK)) {
-                goto illegal_op;
-            }
-            tcg_gen_mb(TCG_MO_LD_LD | TCG_BAR_SC);
-            break;
-        case 0xf0 ... 0xf7: /* mfence */
-            if (!(s->cpuid_features & CPUID_SSE2)
-                || (prefixes & PREFIX_LOCK)) {
-                goto illegal_op;
-            }
-            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-            break;
-
-        default:
-            goto unknown_op;
-        }
-        break;
-
-    case 0x10d: /* 3DNow! prefetch(w) */
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        if (mod == 3)
-            goto illegal_op;
-        gen_nop_modrm(env, s, modrm);
-        break;
-    case 0x1aa: /* rsm */
-        gen_svm_check_intercept(s, SVM_EXIT_RSM);
-        if (!(s->flags & HF_SMM_MASK))
-            goto illegal_op;
-#ifdef CONFIG_USER_ONLY
-        /* we should not be in SMM mode */
-        g_assert_not_reached();
-#else
-        gen_update_cc_op(s);
-        gen_jmp_im(s, s->pc - s->cs_base);
-        gen_helper_rsm(cpu_env);
-#endif /* CONFIG_USER_ONLY */
-        gen_eob(s);
-        break;
-    case 0x1b8: /* SSE4.2 popcnt */
-        if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
-             PREFIX_REPZ)
-            goto illegal_op;
-        if (!(s->cpuid_ext_features & CPUID_EXT_POPCNT))
-            goto illegal_op;
-
-        modrm = x86_ldub_code(env, s);
-        reg = ((modrm >> 3) & 7) | REX_R(s);
-
-        if (s->prefix & PREFIX_DATA) {
-            ot = MO_16;
-        } else {
-            ot = mo_64_32(dflag);
-        }
-
-        gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-        gen_extu(ot, s->T0);
-        tcg_gen_mov_tl(cpu_cc_src, s->T0);
-        tcg_gen_ctpop_tl(s->T0, s->T0);
-        gen_op_mov_reg_v(s, ot, reg, s->T0);
-
-        set_cc_op(s, CC_OP_POPCNT);
-        break;
-    case 0x10e ... 0x10f:
-        /* 3DNow! instructions, ignore prefixes */
-        s->prefix &= ~(PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA);
-        /* fall through */
-    case 0x110 ... 0x117:
-    case 0x128 ... 0x12f:
-    case 0x138 ... 0x13a:
-    case 0x150 ... 0x179:
-    case 0x17c ... 0x17f:
-    case 0x1c2:
-    case 0x1c4 ... 0x1c6:
-    case 0x1d0 ... 0x1fe:
-        gen_sse(env, s, b, pc_start);
-        break;
-    default:
-        goto unknown_op;
-    }
-    return s->pc;
- illegal_op:
-    gen_illegal_opcode(s);
-    return s->pc;
- unknown_op:
-    gen_unknown_opcode(env, s);
-    return s->pc;
-}
+#include "decode-old.c.inc"
 
 void tcg_x86_init(void)
 {
-- 
2.37.1



