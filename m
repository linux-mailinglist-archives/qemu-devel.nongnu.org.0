Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3E5B51C4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:06:13 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW1k-0001cs-EF
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwL-0004xk-ST
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwJ-0006P0-HW
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0QutVkQWh3O0i0W03jJrxQ1aHn2WdaciPl0ofdtkKFo=;
 b=WJLi/Ssl3LlPU8JncLjaRcXPix/MHBnccDuIAFSOczE/UHBLf31mksdXnHEBuQnip4VK/2
 wmsF64j72oHBC7nHCP20Q6lHp+bMHK56JUP4Zy+7Dco4Tq1zBjXxeqpfLjGdAtYUkEM1A+
 5wSK+S7fI7CTDTlnJ/OsoGi0IsGDEMI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-LY-tCYyrM3C30G65BoFypA-1; Sun, 11 Sep 2022 19:00:33 -0400
X-MC-Unique: LY-tCYyrM3C30G65BoFypA-1
Received: by mail-ed1-f70.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so4940181edc.13
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0QutVkQWh3O0i0W03jJrxQ1aHn2WdaciPl0ofdtkKFo=;
 b=W90TTw+gC4MYK5AqDLbipCIL4+dX5tfRPjX4V8qT62npveDoKwdZclpLdkO2UfBojB
 ArgG3fOmG6yHXO570X99Sv9xByCXRDFDFPCx4xdV/c/ahAihlfBSqkyFQWYInGULXK2I
 g69PPi0AzfAfIDPRQAgA3XK5K6BUiQMl5B6mRdZdttcYNbIAZUGebVN3KVDp2ViuVVX4
 snIanKx0w40nKXHSBVrQZQq56nG61Ja0cszOxlzb7ZxfArhU4ttYBAK63U3AX2/eHSgL
 VCLMX+r9K6GZlJsHmnjYE/RC0UpiZpNH+BZopJxlzLkgbJTqfgLcNjPAuDWLhgLByyWq
 5ycQ==
X-Gm-Message-State: ACgBeo0IuHsGH7pMfVX1x/h77tBDj1kX/iwtorc+VDdB5dPL5mqgRmKG
 l0eTXaLgUzluLMY0UGPBxZV8Xvo2gqzBuBYx2DkWulJ6IgvU3RJxRhQRiU0eEwRfwgDaI/nhRbw
 ANdoNvg9JuPzK2l0q9LP5SPtLz0xcFKWI8rZfUuRzR3CKmDaU/Q8tPIyPjeu8GA3KtCc=
X-Received: by 2002:a17:907:2724:b0:779:7545:5df6 with SMTP id
 d4-20020a170907272400b0077975455df6mr10036164ejl.325.1662937231885; 
 Sun, 11 Sep 2022 16:00:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6K1GHrn2hOOZXspEHyQXmhIjvAMhBZchmg1nNSprG7uYoQ6F3Cbe7ufseUCY7ZJ1IszF6XkQ==
X-Received: by 2002:a17:907:2724:b0:779:7545:5df6 with SMTP id
 d4-20020a170907272400b0077975455df6mr10036132ejl.325.1662937231352; 
 Sun, 11 Sep 2022 16:00:31 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a1709060acd00b0077d371a8f29sm1007697ejf.204.2022.09.11.16.00.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:00:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] tests/tcg: remove old SSE tests
Date: Mon, 12 Sep 2022 01:00:14 +0200
Message-Id: <20220911230014.340601-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230014.340601-1-pbonzini@redhat.com>
References: <20220911230014.340601-1-pbonzini@redhat.com>
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

The new testsuite is much more comprehensive, so remove the old one;
it is also buggy (the pinsrw test uses incorrect constraints, with =
instead of +, and the golden output for the fxsave tests differs depending
on how the C library uses SSE and AVX instructions).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/test-i386.c | 573 -------------------------------------
 1 file changed, 573 deletions(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index e6b308a2c0..864c4e620d 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -34,15 +34,8 @@
 #endif
 //#define LINUX_VM86_IOPL_FIX
 //#define TEST_P4_FLAGS
-#ifdef __SSE__
-#define TEST_SSE
 #define TEST_CMOV  1
 #define TEST_FCOMI 1
-#else
-#undef TEST_SSE
-#define TEST_CMOV  1
-#define TEST_FCOMI 1
-#endif
 
 #if defined(__x86_64__)
 #define FMT64X "%016lx"
@@ -2104,568 +2097,6 @@ static void test_enter(void)
     TEST_ENTER("w", uint16_t, 31);
 }
 
-#ifdef TEST_SSE
-
-typedef int __m64 __attribute__ ((vector_size(8)));
-typedef float __m128 __attribute__ ((vector_size(16)));
-
-typedef union {
-    double d[2];
-    float s[4];
-    uint32_t l[4];
-    uint64_t q[2];
-    __m128 dq;
-} XMMReg;
-
-static uint64_t __attribute__((aligned(16))) test_values[4][2] = {
-    { 0x456723c698694873, 0xdc515cff944a58ec },
-    { 0x1f297ccd58bad7ab, 0x41f21efba9e3e146 },
-    { 0x007c62c2085427f8, 0x231be9e8cde7438d },
-    { 0x0f76255a085427f8, 0xc233e9e8c4c9439a },
-};
-
-#define SSE_OP(op)\
-{\
-    asm volatile (#op " %2, %0" : "=x" (r.dq) : "0" (a.dq), "x" (b.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " b=" FMT64X "" FMT64X " r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           b.q[1], b.q[0],\
-           r.q[1], r.q[0]);\
-}
-
-#define SSE_OP2(op)\
-{\
-    int i;\
-    for(i=0;i<2;i++) {\
-    a.q[0] = test_values[2*i][0];\
-    a.q[1] = test_values[2*i][1];\
-    b.q[0] = test_values[2*i+1][0];\
-    b.q[1] = test_values[2*i+1][1];\
-    SSE_OP(op);\
-    }\
-}
-
-#define MMX_OP2(op)\
-{\
-    int i;\
-    for(i=0;i<2;i++) {\
-    a.q[0] = test_values[2*i][0];\
-    b.q[0] = test_values[2*i+1][0];\
-    asm volatile (#op " %2, %0" : "=y" (r.q[0]) : "0" (a.q[0]), "y" (b.q[0]));\
-    printf("%-9s: a=" FMT64X " b=" FMT64X " r=" FMT64X "\n",\
-           #op,\
-           a.q[0],\
-           b.q[0],\
-           r.q[0]);\
-    }\
-    SSE_OP2(op);\
-}
-
-#define SHUF_OP(op, ib)\
-{\
-    a.q[0] = test_values[0][0];\
-    a.q[1] = test_values[0][1];\
-    b.q[0] = test_values[1][0];\
-    b.q[1] = test_values[1][1];\
-    asm volatile (#op " $" #ib ", %2, %0" : "=x" (r.dq) : "0" (a.dq), "x" (b.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " b=" FMT64X "" FMT64X " ib=%02x r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           b.q[1], b.q[0],\
-           ib,\
-           r.q[1], r.q[0]);\
-}
-
-#define PSHUF_OP(op, ib)\
-{\
-    int i;\
-    for(i=0;i<2;i++) {\
-    a.q[0] = test_values[2*i][0];\
-    a.q[1] = test_values[2*i][1];\
-    asm volatile (#op " $" #ib ", %1, %0" : "=x" (r.dq) : "x" (a.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " ib=%02x r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           ib,\
-           r.q[1], r.q[0]);\
-    }\
-}
-
-#define SHIFT_IM(op, ib)\
-{\
-    int i;\
-    for(i=0;i<2;i++) {\
-    a.q[0] = test_values[2*i][0];\
-    a.q[1] = test_values[2*i][1];\
-    asm volatile (#op " $" #ib ", %0" : "=x" (r.dq) : "0" (a.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " ib=%02x r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           ib,\
-           r.q[1], r.q[0]);\
-    }\
-}
-
-#define SHIFT_OP(op, ib)\
-{\
-    int i;\
-    SHIFT_IM(op, ib);\
-    for(i=0;i<2;i++) {\
-    a.q[0] = test_values[2*i][0];\
-    a.q[1] = test_values[2*i][1];\
-    b.q[0] = ib;\
-    b.q[1] = 0;\
-    asm volatile (#op " %2, %0" : "=x" (r.dq) : "0" (a.dq), "x" (b.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " b=" FMT64X "" FMT64X " r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           b.q[1], b.q[0],\
-           r.q[1], r.q[0]);\
-    }\
-}
-
-#define MOVMSK(op)\
-{\
-    int i, reg;\
-    for(i=0;i<2;i++) {\
-    a.q[0] = test_values[2*i][0];\
-    a.q[1] = test_values[2*i][1];\
-    asm volatile (#op " %1, %0" : "=r" (reg) : "x" (a.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " r=%08x\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           reg);\
-    }\
-}
-
-#define SSE_OPS(a) \
-SSE_OP(a ## ps);\
-SSE_OP(a ## ss);
-
-#define SSE_OPD(a) \
-SSE_OP(a ## pd);\
-SSE_OP(a ## sd);
-
-#define SSE_COMI(op, field)\
-{\
-    unsigned long eflags;\
-    XMMReg a, b;\
-    a.field[0] = a1;\
-    b.field[0] = b1;\
-    asm volatile (#op " %2, %1\n"\
-        "pushf\n"\
-        "pop %0\n"\
-        : "=rm" (eflags)\
-        : "x" (a.dq), "x" (b.dq));\
-    printf("%-9s: a=%f b=%f cc=%04lx\n",\
-           #op, a1, b1,\
-           eflags & (CC_C | CC_P | CC_Z | CC_S | CC_O | CC_A));\
-}
-
-void test_sse_comi(double a1, double b1)
-{
-    SSE_COMI(ucomiss, s);
-    SSE_COMI(ucomisd, d);
-    SSE_COMI(comiss, s);
-    SSE_COMI(comisd, d);
-}
-
-#define CVT_OP_XMM(op)\
-{\
-    asm volatile (#op " %1, %0" : "=x" (r.dq) : "x" (a.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           r.q[1], r.q[0]);\
-}
-
-/* Force %xmm0 usage to avoid the case where both register index are 0
-   to test instruction decoding more extensively */
-#define CVT_OP_XMM2MMX(op)\
-{\
-    asm volatile (#op " %1, %0" : "=y" (r.q[0]) : "x" (a.dq) \
-                  : "%xmm0"); \
-    asm volatile("emms\n"); \
-    printf("%-9s: a=" FMT64X "" FMT64X " r=" FMT64X "\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           r.q[0]);\
-}
-
-#define CVT_OP_MMX2XMM(op)\
-{\
-    asm volatile (#op " %1, %0" : "=x" (r.dq) : "y" (a.q[0]));\
-    asm volatile("emms\n"); \
-    printf("%-9s: a=" FMT64X " r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.q[0],\
-           r.q[1], r.q[0]);\
-}
-
-#define CVT_OP_REG2XMM(op)\
-{\
-    asm volatile (#op " %1, %0" : "=x" (r.dq) : "r" (a.l[0]));\
-    printf("%-9s: a=%08x r=" FMT64X "" FMT64X "\n",\
-           #op,\
-           a.l[0],\
-           r.q[1], r.q[0]);\
-}
-
-#define CVT_OP_XMM2REG(op)\
-{\
-    asm volatile (#op " %1, %0" : "=r" (r.l[0]) : "x" (a.dq));\
-    printf("%-9s: a=" FMT64X "" FMT64X " r=%08x\n",\
-           #op,\
-           a.q[1], a.q[0],\
-           r.l[0]);\
-}
-
-struct fpxstate {
-    uint16_t fpuc;
-    uint16_t fpus;
-    uint16_t fptag;
-    uint16_t fop;
-    uint32_t fpuip;
-    uint16_t cs_sel;
-    uint16_t dummy0;
-    uint32_t fpudp;
-    uint16_t ds_sel;
-    uint16_t dummy1;
-    uint32_t mxcsr;
-    uint32_t mxcsr_mask;
-    uint8_t fpregs1[8 * 16];
-    uint8_t xmm_regs[8 * 16];
-    uint8_t dummy2[224];
-};
-
-static struct fpxstate fpx_state __attribute__((aligned(16)));
-static struct fpxstate fpx_state2 __attribute__((aligned(16)));
-
-void test_fxsave(void)
-{
-    struct fpxstate *fp = &fpx_state;
-    struct fpxstate *fp2 = &fpx_state2;
-    int i, nb_xmm;
-    XMMReg a, b;
-    a.q[0] = test_values[0][0];
-    a.q[1] = test_values[0][1];
-    b.q[0] = test_values[1][0];
-    b.q[1] = test_values[1][1];
-
-    asm("movdqa %2, %%xmm0\n"
-        "movdqa %3, %%xmm7\n"
-#if defined(__x86_64__)
-        "movdqa %2, %%xmm15\n"
-#endif
-        " fld1\n"
-        " fldpi\n"
-        " fldln2\n"
-        " fxsave %0\n"
-        " fxrstor %0\n"
-        " fxsave %1\n"
-        " fninit\n"
-        : "=m" (*(uint32_t *)fp2), "=m" (*(uint32_t *)fp)
-        : "m" (a), "m" (b));
-    printf("fpuc=%04x\n", fp->fpuc);
-    printf("fpus=%04x\n", fp->fpus);
-    printf("fptag=%04x\n", fp->fptag);
-    for(i = 0; i < 3; i++) {
-        printf("ST%d: " FMT64X " %04x\n",
-               i,
-               *(uint64_t *)&fp->fpregs1[i * 16],
-               *(uint16_t *)&fp->fpregs1[i * 16 + 8]);
-    }
-    printf("mxcsr=%08x\n", fp->mxcsr & 0x1f80);
-#if defined(__x86_64__)
-    nb_xmm = 16;
-#else
-    nb_xmm = 8;
-#endif
-    for(i = 0; i < nb_xmm; i++) {
-        printf("xmm%d: " FMT64X "" FMT64X "\n",
-               i,
-               *(uint64_t *)&fp->xmm_regs[i * 16],
-               *(uint64_t *)&fp->xmm_regs[i * 16 + 8]);
-    }
-}
-
-void test_sse(void)
-{
-    XMMReg r, a, b;
-    int i;
-
-    MMX_OP2(punpcklbw);
-    MMX_OP2(punpcklwd);
-    MMX_OP2(punpckldq);
-    MMX_OP2(packsswb);
-    MMX_OP2(pcmpgtb);
-    MMX_OP2(pcmpgtw);
-    MMX_OP2(pcmpgtd);
-    MMX_OP2(packuswb);
-    MMX_OP2(punpckhbw);
-    MMX_OP2(punpckhwd);
-    MMX_OP2(punpckhdq);
-    MMX_OP2(packssdw);
-    MMX_OP2(pcmpeqb);
-    MMX_OP2(pcmpeqw);
-    MMX_OP2(pcmpeqd);
-
-    MMX_OP2(paddq);
-    MMX_OP2(pmullw);
-    MMX_OP2(psubusb);
-    MMX_OP2(psubusw);
-    MMX_OP2(pminub);
-    MMX_OP2(pand);
-    MMX_OP2(paddusb);
-    MMX_OP2(paddusw);
-    MMX_OP2(pmaxub);
-    MMX_OP2(pandn);
-
-    MMX_OP2(pmulhuw);
-    MMX_OP2(pmulhw);
-
-    MMX_OP2(psubsb);
-    MMX_OP2(psubsw);
-    MMX_OP2(pminsw);
-    MMX_OP2(por);
-    MMX_OP2(paddsb);
-    MMX_OP2(paddsw);
-    MMX_OP2(pmaxsw);
-    MMX_OP2(pxor);
-    MMX_OP2(pmuludq);
-    MMX_OP2(pmaddwd);
-    MMX_OP2(psadbw);
-    MMX_OP2(psubb);
-    MMX_OP2(psubw);
-    MMX_OP2(psubd);
-    MMX_OP2(psubq);
-    MMX_OP2(paddb);
-    MMX_OP2(paddw);
-    MMX_OP2(paddd);
-
-    MMX_OP2(pavgb);
-    MMX_OP2(pavgw);
-
-    asm volatile ("pinsrw $1, %1, %0" : "=y" (r.q[0]) : "r" (0x12345678));
-    printf("%-9s: r=" FMT64X "\n", "pinsrw", r.q[0]);
-
-    asm volatile ("pinsrw $5, %1, %0" : "=x" (r.dq) : "r" (0x12345678));
-    printf("%-9s: r=" FMT64X "" FMT64X "\n", "pinsrw", r.q[1], r.q[0]);
-
-    a.q[0] = test_values[0][0];
-    a.q[1] = test_values[0][1];
-    asm volatile ("pextrw $1, %1, %0" : "=r" (r.l[0]) : "y" (a.q[0]));
-    printf("%-9s: r=%08x\n", "pextrw", r.l[0]);
-
-    asm volatile ("pextrw $5, %1, %0" : "=r" (r.l[0]) : "x" (a.dq));
-    printf("%-9s: r=%08x\n", "pextrw", r.l[0]);
-
-    asm volatile ("pmovmskb %1, %0" : "=r" (r.l[0]) : "y" (a.q[0]));
-    printf("%-9s: r=%08x\n", "pmovmskb", r.l[0]);
-
-    asm volatile ("pmovmskb %1, %0" : "=r" (r.l[0]) : "x" (a.dq));
-    printf("%-9s: r=%08x\n", "pmovmskb", r.l[0]);
-
-    {
-        r.q[0] = -1;
-        r.q[1] = -1;
-
-        a.q[0] = test_values[0][0];
-        a.q[1] = test_values[0][1];
-        b.q[0] = test_values[1][0];
-        b.q[1] = test_values[1][1];
-        asm volatile("maskmovq %1, %0" :
-                     : "y" (a.q[0]), "y" (b.q[0]), "D" (&r)
-                     : "memory");
-        printf("%-9s: r=" FMT64X " a=" FMT64X " b=" FMT64X "\n",
-               "maskmov",
-               r.q[0],
-               a.q[0],
-               b.q[0]);
-        asm volatile("maskmovdqu %1, %0" :
-                     : "x" (a.dq), "x" (b.dq), "D" (&r)
-                     : "memory");
-        printf("%-9s: r=" FMT64X "" FMT64X " a=" FMT64X "" FMT64X " b=" FMT64X "" FMT64X "\n",
-               "maskmov",
-               r.q[1], r.q[0],
-               a.q[1], a.q[0],
-               b.q[1], b.q[0]);
-    }
-
-    asm volatile ("emms");
-
-    SSE_OP2(punpcklqdq);
-    SSE_OP2(punpckhqdq);
-    SSE_OP2(andps);
-    SSE_OP2(andpd);
-    SSE_OP2(andnps);
-    SSE_OP2(andnpd);
-    SSE_OP2(orps);
-    SSE_OP2(orpd);
-    SSE_OP2(xorps);
-    SSE_OP2(xorpd);
-
-    SSE_OP2(unpcklps);
-    SSE_OP2(unpcklpd);
-    SSE_OP2(unpckhps);
-    SSE_OP2(unpckhpd);
-
-    SHUF_OP(shufps, 0x78);
-    SHUF_OP(shufpd, 0x02);
-
-    PSHUF_OP(pshufd, 0x78);
-    PSHUF_OP(pshuflw, 0x78);
-    PSHUF_OP(pshufhw, 0x78);
-
-    SHIFT_OP(psrlw, 7);
-    SHIFT_OP(psrlw, 16);
-    SHIFT_OP(psraw, 7);
-    SHIFT_OP(psraw, 16);
-    SHIFT_OP(psllw, 7);
-    SHIFT_OP(psllw, 16);
-
-    SHIFT_OP(psrld, 7);
-    SHIFT_OP(psrld, 32);
-    SHIFT_OP(psrad, 7);
-    SHIFT_OP(psrad, 32);
-    SHIFT_OP(pslld, 7);
-    SHIFT_OP(pslld, 32);
-
-    SHIFT_OP(psrlq, 7);
-    SHIFT_OP(psrlq, 32);
-    SHIFT_OP(psllq, 7);
-    SHIFT_OP(psllq, 32);
-
-    SHIFT_IM(psrldq, 16);
-    SHIFT_IM(psrldq, 7);
-    SHIFT_IM(pslldq, 16);
-    SHIFT_IM(pslldq, 7);
-
-    MOVMSK(movmskps);
-    MOVMSK(movmskpd);
-
-    /* FPU specific ops */
-
-    {
-        uint32_t mxcsr;
-        asm volatile("stmxcsr %0" : "=m" (mxcsr));
-        printf("mxcsr=%08x\n", mxcsr & 0x1f80);
-        asm volatile("ldmxcsr %0" : : "m" (mxcsr));
-    }
-
-    test_sse_comi(2, -1);
-    test_sse_comi(2, 2);
-    test_sse_comi(2, 3);
-    test_sse_comi(2, q_nan.d);
-    test_sse_comi(q_nan.d, -1);
-
-    for(i = 0; i < 2; i++) {
-        a.s[0] = 2.7;
-        a.s[1] = 3.4;
-        a.s[2] = 4;
-        a.s[3] = -6.3;
-        b.s[0] = 45.7;
-        b.s[1] = 353.4;
-        b.s[2] = 4;
-        b.s[3] = 56.3;
-        if (i == 1) {
-            a.s[0] = q_nan.d;
-            b.s[3] = q_nan.d;
-        }
-
-        SSE_OPS(add);
-        SSE_OPS(mul);
-        SSE_OPS(sub);
-        SSE_OPS(min);
-        SSE_OPS(div);
-        SSE_OPS(max);
-        SSE_OPS(sqrt);
-        SSE_OPS(cmpeq);
-        SSE_OPS(cmplt);
-        SSE_OPS(cmple);
-        SSE_OPS(cmpunord);
-        SSE_OPS(cmpneq);
-        SSE_OPS(cmpnlt);
-        SSE_OPS(cmpnle);
-        SSE_OPS(cmpord);
-
-
-        a.d[0] = 2.7;
-        a.d[1] = -3.4;
-        b.d[0] = 45.7;
-        b.d[1] = -53.4;
-        if (i == 1) {
-            a.d[0] = q_nan.d;
-            b.d[1] = q_nan.d;
-        }
-        SSE_OPD(add);
-        SSE_OPD(mul);
-        SSE_OPD(sub);
-        SSE_OPD(min);
-        SSE_OPD(div);
-        SSE_OPD(max);
-        SSE_OPD(sqrt);
-        SSE_OPD(cmpeq);
-        SSE_OPD(cmplt);
-        SSE_OPD(cmple);
-        SSE_OPD(cmpunord);
-        SSE_OPD(cmpneq);
-        SSE_OPD(cmpnlt);
-        SSE_OPD(cmpnle);
-        SSE_OPD(cmpord);
-    }
-
-    /* float to float/int */
-    a.s[0] = 2.7;
-    a.s[1] = 3.4;
-    a.s[2] = 4;
-    a.s[3] = -6.3;
-    CVT_OP_XMM(cvtps2pd);
-    CVT_OP_XMM(cvtss2sd);
-    CVT_OP_XMM2MMX(cvtps2pi);
-    CVT_OP_XMM2MMX(cvttps2pi);
-    CVT_OP_XMM2REG(cvtss2si);
-    CVT_OP_XMM2REG(cvttss2si);
-    CVT_OP_XMM(cvtps2dq);
-    CVT_OP_XMM(cvttps2dq);
-
-    a.d[0] = 2.6;
-    a.d[1] = -3.4;
-    CVT_OP_XMM(cvtpd2ps);
-    CVT_OP_XMM(cvtsd2ss);
-    CVT_OP_XMM2MMX(cvtpd2pi);
-    CVT_OP_XMM2MMX(cvttpd2pi);
-    CVT_OP_XMM2REG(cvtsd2si);
-    CVT_OP_XMM2REG(cvttsd2si);
-    CVT_OP_XMM(cvtpd2dq);
-    CVT_OP_XMM(cvttpd2dq);
-
-    /* sse/mmx moves */
-    CVT_OP_XMM2MMX(movdq2q);
-    CVT_OP_MMX2XMM(movq2dq);
-
-    /* int to float */
-    a.l[0] = -6;
-    a.l[1] = 2;
-    a.l[2] = 100;
-    a.l[3] = -60000;
-    CVT_OP_MMX2XMM(cvtpi2ps);
-    CVT_OP_MMX2XMM(cvtpi2pd);
-    CVT_OP_REG2XMM(cvtsi2ss);
-    CVT_OP_REG2XMM(cvtsi2sd);
-    CVT_OP_XMM(cvtdq2ps);
-    CVT_OP_XMM(cvtdq2pd);
-
-    /* XXX: test PNI insns */
-#if 0
-    SSE_OP2(movshdup);
-#endif
-    asm volatile ("emms");
-}
-
-#endif
-
 #define TEST_CONV_RAX(op)\
 {\
     unsigned long a, r;\
@@ -2756,9 +2187,5 @@ int main(int argc, char **argv)
 #endif
     test_enter();
     test_conv();
-#ifdef TEST_SSE
-    test_sse();
-    test_fxsave();
-#endif
     return 0;
 }
-- 
2.37.2


