Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD642473990
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:32:19 +0100 (CET)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvjv-0008KW-1A
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve1-0007qJ-OW
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:13 -0500
Received: from [2607:f8b0:4864:20::1031] (port=42964
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwvdx-0005R1-5M
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:13 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so14725217pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rx8o1uDxj4/J/lwyknM0buEGf3Zbqh5qXdTGD5dLKVI=;
 b=eB78219GHNjz30kjvr68sNiO5gTXuWEwp8fFYkpTpUWlQbeBc6XFeE8LAJIa6T1Y9L
 xzrXbZKT+o4+Dfan6erhFErZsFVrbBWLXuNDlZu77FcTIavnJk9iMnO349UjoLdnjLii
 2ATifGLurkl1oBTXpWWmiUgYkQPwoVkVhn8Ip6mOf6wa0GlvDK2nxZ+Wyd1c+71ViCF/
 II4nbenBvug8G+g0uUADPy7UwUnx+iUje9utwLIpO4vEHlV+CFlA4HBjr3vHoinu2wfh
 42OjmicSXLNHdkb55Z8eBXqCPr7Xb3dvvVnsoynQUI4l15rXNtPFPGRHdN4039UWtuUZ
 wYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rx8o1uDxj4/J/lwyknM0buEGf3Zbqh5qXdTGD5dLKVI=;
 b=hP+5jJZyunnkuY5kN6lBffsnl7YwPG1nWkEZYfdqt2X45/8VWp0GfTpm2fXQIPwN64
 l3jrI46fLCC1H2sMaR/lZP75vEiuNJsSq9M/KZE323VvClCuTj/Ghj0TkaaLbAXXuly/
 OtGfz7wQdFgUJRY17oR1bnNHRJ7lkuaQZDh3gHQg9jTzp4E7RLitIpKIs0GY0f24e8RK
 wJ40gMBoFqV4buAlxxa7S4dBO/SGEF6TRXDotXazRRh0bzhKO/0k81/bJP2LBybhvN0W
 u4M7E4Mg9TKyn8yYP0A3sewS9+z2JH/Hv/KuQJ+iFSlled9KcPrxuzniNRJoGKdEtbEK
 7FLQ==
X-Gm-Message-State: AOAM5304o7Mko+ieZB3913WQbUUs4RA95cDmKEbT13qTOf8ypzI77rAr
 Oq81sCHL07KoyCWdxRQOjtwEKuLq1OBFyg==
X-Google-Smtp-Source: ABdhPJz8zsQHR+HP3h+PhNmjMkjmUt2HOX+0YZfY2lo8el2HZ5kb6PA9YyPYIUCsNDPIyn/49OhcpA==
X-Received: by 2002:a17:90a:e389:: with SMTP id
 b9mr1771291pjz.235.1639441567373; 
 Mon, 13 Dec 2021 16:26:07 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/15] linux-user: Untabify all safe-syscall.inc.S
Date: Mon, 13 Dec 2021 16:25:50 -0800
Message-Id: <20211214002604.161983-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Warner Losh <imp@bsdimp.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/aarch64/safe-syscall.inc.S | 110 +++++++-------
 linux-user/host/arm/safe-syscall.inc.S     | 134 ++++++++---------
 linux-user/host/i386/safe-syscall.inc.S    | 158 ++++++++++-----------
 linux-user/host/ppc64/safe-syscall.inc.S   | 134 ++++++++---------
 linux-user/host/riscv/safe-syscall.inc.S   | 114 +++++++--------
 linux-user/host/s390x/safe-syscall.inc.S   | 140 +++++++++---------
 linux-user/host/x86_64/safe-syscall.inc.S  |   2 +-
 7 files changed, 396 insertions(+), 396 deletions(-)

diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host/aarch64/safe-syscall.inc.S
index bc1f5a9792..e2e726ef55 100644
--- a/linux-user/host/aarch64/safe-syscall.inc.S
+++ b/linux-user/host/aarch64/safe-syscall.inc.S
@@ -10,66 +10,66 @@
  * See the COPYING file in the top-level directory.
  */
 
-	.global safe_syscall_base
-	.global safe_syscall_start
-	.global safe_syscall_end
-	.type	safe_syscall_base, #function
-	.type	safe_syscall_start, #function
-	.type	safe_syscall_end, #function
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, #function
+        .type   safe_syscall_start, #function
+        .type   safe_syscall_end, #function
 
-	/* This is the entry point for making a system call. The calling
-	 * convention here is that of a C varargs function with the
-	 * first argument an 'int *' to the signal_pending flag, the
-	 * second one the system call number (as a 'long'), and all further
-	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
-	 */
+        /* This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         * We return a long which is the syscall's return value, which
+         * may be negative-errno on failure. Conversion to the
+         * -1-and-errno-set convention is done by the calling wrapper.
+         */
 safe_syscall_base:
-	.cfi_startproc
-	/* The syscall calling convention isn't the same as the
-	 * C one:
-	 * we enter with x0 == *signal_pending
-	 *               x1 == syscall number
-	 *               x2 ... x7, (stack) == syscall arguments
-	 *               and return the result in x0
-	 * and the syscall instruction needs
-	 *               x8 == syscall number
-	 *               x0 ... x6 == syscall arguments
-	 *               and returns the result in x0
-	 * Shuffle everything around appropriately.
-	 */
-	mov	x9, x0		/* signal_pending pointer */
-	mov	x8, x1		/* syscall number */
-	mov	x0, x2		/* syscall arguments */
-	mov	x1, x3
-	mov	x2, x4
-	mov	x3, x5
-	mov	x4, x6
-	mov	x5, x7
-	ldr	x6, [sp]
+        .cfi_startproc
+        /* The syscall calling convention isn't the same as the
+         * C one:
+         * we enter with x0 == *signal_pending
+         *               x1 == syscall number
+         *               x2 ... x7, (stack) == syscall arguments
+         *               and return the result in x0
+         * and the syscall instruction needs
+         *               x8 == syscall number
+         *               x0 ... x6 == syscall arguments
+         *               and returns the result in x0
+         * Shuffle everything around appropriately.
+         */
+        mov     x9, x0          /* signal_pending pointer */
+        mov     x8, x1          /* syscall number */
+        mov     x0, x2          /* syscall arguments */
+        mov     x1, x3
+        mov     x2, x4
+        mov     x3, x5
+        mov     x4, x6
+        mov     x5, x7
+        ldr     x6, [sp]
 
-	/* This next sequence of code works in conjunction with the
-	 * rewind_if_safe_syscall_function(). If a signal is taken
-	 * and the interrupted PC is anywhere between 'safe_syscall_start'
-	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
-	 * The code sequence must therefore be able to cope with this, and
-	 * the syscall instruction must be the final one in the sequence.
-	 */
+        /* This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
 safe_syscall_start:
-	/* if signal_pending is non-zero, don't do the call */
-	ldr	w10, [x9]
-	cbnz	w10, 0f 
-	svc	0x0
+        /* if signal_pending is non-zero, don't do the call */
+        ldr     w10, [x9]
+        cbnz    w10, 0f
+        svc     0x0
 safe_syscall_end:
-	/* code path for having successfully executed the syscall */
-	ret
+        /* code path for having successfully executed the syscall */
+        ret
 
 0:
-	/* code path when we didn't execute the syscall */
-	mov	x0, #-TARGET_ERESTARTSYS
-	ret
-	.cfi_endproc
+        /* code path when we didn't execute the syscall */
+        mov     x0, #-TARGET_ERESTARTSYS
+        ret
+        .cfi_endproc
 
-	.size	safe_syscall_base, .-safe_syscall_base
+        .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/linux-user/host/arm/safe-syscall.inc.S
index 88c4958504..1f1ee8327b 100644
--- a/linux-user/host/arm/safe-syscall.inc.S
+++ b/linux-user/host/arm/safe-syscall.inc.S
@@ -10,81 +10,81 @@
  * See the COPYING file in the top-level directory.
  */
 
-	.global safe_syscall_base
-	.global safe_syscall_start
-	.global safe_syscall_end
-	.type	safe_syscall_base, %function
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, %function
 
-	.cfi_sections	.debug_frame
+        .cfi_sections   .debug_frame
 
-	.text
-	.syntax unified
-	.arm
-	.align 2
+        .text
+        .syntax unified
+        .arm
+        .align 2
 
-	/* This is the entry point for making a system call. The calling
-	 * convention here is that of a C varargs function with the
-	 * first argument an 'int *' to the signal_pending flag, the
-	 * second one the system call number (as a 'long'), and all further
-	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
-	 */
+        /* This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         * We return a long which is the syscall's return value, which
+         * may be negative-errno on failure. Conversion to the
+         * -1-and-errno-set convention is done by the calling wrapper.
+         */
 safe_syscall_base:
-	.fnstart
-	.cfi_startproc
-	mov	r12, sp			/* save entry stack */
-	push	{ r4, r5, r6, r7, r8, lr }
-	.save	{ r4, r5, r6, r7, r8, lr }
-	.cfi_adjust_cfa_offset 24
-	.cfi_rel_offset r4, 0
-	.cfi_rel_offset r5, 4
-	.cfi_rel_offset r6, 8
-	.cfi_rel_offset r7, 12
-	.cfi_rel_offset r8, 16
-	.cfi_rel_offset lr, 20
+        .fnstart
+        .cfi_startproc
+        mov     r12, sp                 /* save entry stack */
+        push    { r4, r5, r6, r7, r8, lr }
+        .save   { r4, r5, r6, r7, r8, lr }
+        .cfi_adjust_cfa_offset 24
+        .cfi_rel_offset r4, 0
+        .cfi_rel_offset r5, 4
+        .cfi_rel_offset r6, 8
+        .cfi_rel_offset r7, 12
+        .cfi_rel_offset r8, 16
+        .cfi_rel_offset lr, 20
 
-	/* The syscall calling convention isn't the same as the C one:
-	 * we enter with r0 == *signal_pending
-	 *               r1 == syscall number
-	 *               r2, r3, [sp+0] ... [sp+12] == syscall arguments
-	 *               and return the result in r0
-	 * and the syscall instruction needs
-	 *               r7 == syscall number
-	 *               r0 ... r6 == syscall arguments
-	 *               and returns the result in r0
-	 * Shuffle everything around appropriately.
-	 * Note the 16 bytes that we pushed to save registers.
-	 */
-	mov	r8, r0			/* copy signal_pending */
-	mov	r7, r1			/* syscall number */
-	mov	r0, r2			/* syscall args */
-	mov	r1, r3
-	ldm	r12, { r2, r3, r4, r5, r6 }
+        /* The syscall calling convention isn't the same as the C one:
+         * we enter with r0 == *signal_pending
+         *               r1 == syscall number
+         *               r2, r3, [sp+0] ... [sp+12] == syscall arguments
+         *               and return the result in r0
+         * and the syscall instruction needs
+         *               r7 == syscall number
+         *               r0 ... r6 == syscall arguments
+         *               and returns the result in r0
+         * Shuffle everything around appropriately.
+         * Note the 16 bytes that we pushed to save registers.
+         */
+        mov     r8, r0                  /* copy signal_pending */
+        mov     r7, r1                  /* syscall number */
+        mov     r0, r2                  /* syscall args */
+        mov     r1, r3
+        ldm     r12, { r2, r3, r4, r5, r6 }
 
-	/* This next sequence of code works in conjunction with the
-	 * rewind_if_safe_syscall_function(). If a signal is taken
-	 * and the interrupted PC is anywhere between 'safe_syscall_start'
-	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
-	 * The code sequence must therefore be able to cope with this, and
-	 * the syscall instruction must be the final one in the sequence.
-	 */
+        /* This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
 safe_syscall_start:
-	/* if signal_pending is non-zero, don't do the call */
-	ldr	r12, [r8]		/* signal_pending */
-	tst	r12, r12
-	bne	1f
-	swi	0
+        /* if signal_pending is non-zero, don't do the call */
+        ldr     r12, [r8]               /* signal_pending */
+        tst     r12, r12
+        bne     1f
+        swi     0
 safe_syscall_end:
-	/* code path for having successfully executed the syscall */
-	pop	{ r4, r5, r6, r7, r8, pc }
+        /* code path for having successfully executed the syscall */
+        pop     { r4, r5, r6, r7, r8, pc }
 
 1:
-	/* code path when we didn't execute the syscall */
-	ldr	r0, =-TARGET_ERESTARTSYS
-	pop	{ r4, r5, r6, r7, r8, pc }
-	.fnend
-	.cfi_endproc
+        /* code path when we didn't execute the syscall */
+        ldr     r0, =-TARGET_ERESTARTSYS
+        pop     { r4, r5, r6, r7, r8, pc }
+        .fnend
+        .cfi_endproc
 
-	.size	safe_syscall_base, .-safe_syscall_base
+        .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/linux-user/host/i386/safe-syscall.inc.S
index 9e58fc6504..e425aa54d8 100644
--- a/linux-user/host/i386/safe-syscall.inc.S
+++ b/linux-user/host/i386/safe-syscall.inc.S
@@ -10,91 +10,91 @@
  * See the COPYING file in the top-level directory.
  */
 
-	.global safe_syscall_base
-	.global safe_syscall_start
-	.global safe_syscall_end
-	.type	safe_syscall_base, @function
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
 
-	/* This is the entry point for making a system call. The calling
-	 * convention here is that of a C varargs function with the
-	 * first argument an 'int *' to the signal_pending flag, the
-	 * second one the system call number (as a 'long'), and all further
-	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
-	 */
+        /* This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         * We return a long which is the syscall's return value, which
+         * may be negative-errno on failure. Conversion to the
+         * -1-and-errno-set convention is done by the calling wrapper.
+         */
 safe_syscall_base:
-	.cfi_startproc
-	push	%ebp
-	.cfi_adjust_cfa_offset 4
-	.cfi_rel_offset ebp, 0
-	push	%esi
-	.cfi_adjust_cfa_offset 4
-	.cfi_rel_offset esi, 0
-	push	%edi
-	.cfi_adjust_cfa_offset 4
-	.cfi_rel_offset edi, 0
-	push	%ebx
-	.cfi_adjust_cfa_offset 4
-	.cfi_rel_offset ebx, 0
+        .cfi_startproc
+        push    %ebp
+        .cfi_adjust_cfa_offset 4
+        .cfi_rel_offset ebp, 0
+        push    %esi
+        .cfi_adjust_cfa_offset 4
+        .cfi_rel_offset esi, 0
+        push    %edi
+        .cfi_adjust_cfa_offset 4
+        .cfi_rel_offset edi, 0
+        push    %ebx
+        .cfi_adjust_cfa_offset 4
+        .cfi_rel_offset ebx, 0
 
-	/* The syscall calling convention isn't the same as the C one:
-	 * we enter with 0(%esp) == return address
-	 *               4(%esp) == *signal_pending
-	 *               8(%esp) == syscall number
-	 *               12(%esp) ... 32(%esp) == syscall arguments
-	 *               and return the result in eax
-	 * and the syscall instruction needs
-	 *               eax == syscall number
-	 *               ebx, ecx, edx, esi, edi, ebp == syscall arguments
-	 *               and returns the result in eax
-	 * Shuffle everything around appropriately.
-	 * Note the 16 bytes that we pushed to save registers.
-	 */
-	mov	12+16(%esp), %ebx	/* the syscall arguments */
-	mov	16+16(%esp), %ecx
-	mov	20+16(%esp), %edx
-	mov	24+16(%esp), %esi
-	mov	28+16(%esp), %edi
-	mov	32+16(%esp), %ebp
+        /* The syscall calling convention isn't the same as the C one:
+         * we enter with 0(%esp) == return address
+         *               4(%esp) == *signal_pending
+         *               8(%esp) == syscall number
+         *               12(%esp) ... 32(%esp) == syscall arguments
+         *               and return the result in eax
+         * and the syscall instruction needs
+         *               eax == syscall number
+         *               ebx, ecx, edx, esi, edi, ebp == syscall arguments
+         *               and returns the result in eax
+         * Shuffle everything around appropriately.
+         * Note the 16 bytes that we pushed to save registers.
+         */
+        mov     12+16(%esp), %ebx       /* the syscall arguments */
+        mov     16+16(%esp), %ecx
+        mov     20+16(%esp), %edx
+        mov     24+16(%esp), %esi
+        mov     28+16(%esp), %edi
+        mov     32+16(%esp), %ebp
 
-	/* This next sequence of code works in conjunction with the
-	 * rewind_if_safe_syscall_function(). If a signal is taken
-	 * and the interrupted PC is anywhere between 'safe_syscall_start'
-	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
-	 * The code sequence must therefore be able to cope with this, and
-	 * the syscall instruction must be the final one in the sequence.
-	 */
+        /* This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
 safe_syscall_start:
-	/* if signal_pending is non-zero, don't do the call */
-	mov	4+16(%esp), %eax	/* signal_pending */
-	cmpl	$0, (%eax)
-	jnz	1f
-	mov	8+16(%esp), %eax	/* syscall number */
-	int	$0x80
+        /* if signal_pending is non-zero, don't do the call */
+        mov     4+16(%esp), %eax        /* signal_pending */
+        cmpl    $0, (%eax)
+        jnz     1f
+        mov     8+16(%esp), %eax        /* syscall number */
+        int     $0x80
 safe_syscall_end:
-	/* code path for having successfully executed the syscall */
-	pop	%ebx
-	.cfi_remember_state
-	.cfi_adjust_cfa_offset -4
-	.cfi_restore ebx
-	pop	%edi
-	.cfi_adjust_cfa_offset -4
-	.cfi_restore edi
-	pop	%esi
-	.cfi_adjust_cfa_offset -4
-	.cfi_restore esi
-	pop	%ebp
-	.cfi_adjust_cfa_offset -4
-	.cfi_restore ebp
-	ret
+        /* code path for having successfully executed the syscall */
+        pop     %ebx
+        .cfi_remember_state
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore ebx
+        pop     %edi
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore edi
+        pop     %esi
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore esi
+        pop     %ebp
+        .cfi_adjust_cfa_offset -4
+        .cfi_restore ebp
+        ret
 
 1:
-	/* code path when we didn't execute the syscall */
-	.cfi_restore_state
-	mov	$-TARGET_ERESTARTSYS, %eax
-	jmp	safe_syscall_end
-	.cfi_endproc
+        /* code path when we didn't execute the syscall */
+        .cfi_restore_state
+        mov     $-TARGET_ERESTARTSYS, %eax
+        jmp     safe_syscall_end
+        .cfi_endproc
 
-	.size	safe_syscall_base, .-safe_syscall_base
+        .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/linux-user/host/ppc64/safe-syscall.inc.S
index 875133173b..4b57440585 100644
--- a/linux-user/host/ppc64/safe-syscall.inc.S
+++ b/linux-user/host/ppc64/safe-syscall.inc.S
@@ -10,87 +10,87 @@
  * See the COPYING file in the top-level directory.
  */
 
-	.global safe_syscall_base
-	.global safe_syscall_start
-	.global safe_syscall_end
-	.type	safe_syscall_base, @function
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
 
-	.text
+        .text
 
-	/* This is the entry point for making a system call. The calling
-	 * convention here is that of a C varargs function with the
-	 * first argument an 'int *' to the signal_pending flag, the
-	 * second one the system call number (as a 'long'), and all further
-	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
-	 */
+        /* This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         * We return a long which is the syscall's return value, which
+         * may be negative-errno on failure. Conversion to the
+         * -1-and-errno-set convention is done by the calling wrapper.
+         */
 #if _CALL_ELF == 2
 safe_syscall_base:
-	.cfi_startproc
-	.localentry safe_syscall_base,0
+        .cfi_startproc
+        .localentry safe_syscall_base,0
 #else
-	.section ".opd","aw"
-	.align	3
+        .section ".opd","aw"
+        .align  3
 safe_syscall_base:
-	.quad	.L.safe_syscall_base,.TOC.@tocbase,0
-	.previous
+        .quad   .L.safe_syscall_base,.TOC.@tocbase,0
+        .previous
 .L.safe_syscall_base:
-	.cfi_startproc
+        .cfi_startproc
 #endif
-	/* We enter with r3 == *signal_pending
-	 *               r4 == syscall number
-	 *               r5 ... r10 == syscall arguments
-	 *               and return the result in r3
-	 * and the syscall instruction needs
-	 *               r0 == syscall number
-	 *               r3 ... r8 == syscall arguments
-	 *               and returns the result in r3
-	 * Shuffle everything around appropriately.
-	 */
-	std     14, 16(1) /* Preserve r14 in SP+16 */
-	.cfi_offset 14, 16
-	mr	14, 3	/* signal_pending */
-	mr	0, 4	/* syscall number */
-	mr	3, 5	/* syscall arguments */
-	mr	4, 6
-	mr	5, 7
-	mr	6, 8
-	mr	7, 9
-	mr	8, 10
+        /* We enter with r3 == *signal_pending
+         *               r4 == syscall number
+         *               r5 ... r10 == syscall arguments
+         *               and return the result in r3
+         * and the syscall instruction needs
+         *               r0 == syscall number
+         *               r3 ... r8 == syscall arguments
+         *               and returns the result in r3
+         * Shuffle everything around appropriately.
+         */
+        std     14, 16(1) /* Preserve r14 in SP+16 */
+        .cfi_offset 14, 16
+        mr      14, 3   /* signal_pending */
+        mr      0, 4    /* syscall number */
+        mr      3, 5    /* syscall arguments */
+        mr      4, 6
+        mr      5, 7
+        mr      6, 8
+        mr      7, 9
+        mr      8, 10
 
-	/* This next sequence of code works in conjunction with the
-	 * rewind_if_safe_syscall_function(). If a signal is taken
-	 * and the interrupted PC is anywhere between 'safe_syscall_start'
-	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
-	 * The code sequence must therefore be able to cope with this, and
-	 * the syscall instruction must be the final one in the sequence.
-	 */
+        /* This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
 safe_syscall_start:
-	/* if signal_pending is non-zero, don't do the call */
-	lwz	12, 0(14)
-	cmpwi	0, 12, 0
-	bne-	0f
-	sc
+        /* if signal_pending is non-zero, don't do the call */
+        lwz     12, 0(14)
+        cmpwi   0, 12, 0
+        bne-    0f
+        sc
 safe_syscall_end:
-	/* code path when we did execute the syscall */
-	ld 14, 16(1) /* restore r14 to its original value */
-	bnslr+
+        /* code path when we did execute the syscall */
+        ld 14, 16(1) /* restore r14 to its original value */
+        bnslr+
 
-	/* syscall failed; return negative errno */
-	neg	3, 3
-	blr
+        /* syscall failed; return negative errno */
+        neg     3, 3
+        blr
 
-	/* code path when we didn't execute the syscall */
-0:	addi	3, 0, -TARGET_ERESTARTSYS
-	ld 14, 16(1) /* restore r14 to its original value */
-	blr
-	.cfi_endproc
+        /* code path when we didn't execute the syscall */
+0:      addi    3, 0, -TARGET_ERESTARTSYS
+        ld 14, 16(1) /* restore r14 to its original value */
+        blr
+        .cfi_endproc
 
 #if _CALL_ELF == 2
-	.size	safe_syscall_base, .-safe_syscall_base
+        .size   safe_syscall_base, .-safe_syscall_base
 #else
-	.size	safe_syscall_base, .-.L.safe_syscall_base
-	.size	.L.safe_syscall_base, .-.L.safe_syscall_base
+        .size   safe_syscall_base, .-.L.safe_syscall_base
+        .size   .L.safe_syscall_base, .-.L.safe_syscall_base
 #endif
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/linux-user/host/riscv/safe-syscall.inc.S
index 9ca3fbfd1e..95c4832de2 100644
--- a/linux-user/host/riscv/safe-syscall.inc.S
+++ b/linux-user/host/riscv/safe-syscall.inc.S
@@ -10,68 +10,68 @@
  * See the COPYING file in the top-level directory.
  */
 
-	.global safe_syscall_base
-	.global safe_syscall_start
-	.global safe_syscall_end
-	.type	safe_syscall_base, @function
-	.type	safe_syscall_start, @function
-	.type	safe_syscall_end, @function
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
+        .type   safe_syscall_start, @function
+        .type   safe_syscall_end, @function
 
-	/*
-	 * This is the entry point for making a system call. The calling
-	 * convention here is that of a C varargs function with the
-	 * first argument an 'int *' to the signal_pending flag, the
-	 * second one the system call number (as a 'long'), and all further
-	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
-	 */
+        /*
+         * This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         * We return a long which is the syscall's return value, which
+         * may be negative-errno on failure. Conversion to the
+         * -1-and-errno-set convention is done by the calling wrapper.
+         */
 safe_syscall_base:
-	.cfi_startproc
-	/*
-	 * The syscall calling convention is nearly the same as C:
-	 * we enter with a0 == *signal_pending
-	 *               a1 == syscall number
-	 *               a2 ... a7 == syscall arguments
-	 *               and return the result in a0
-	 * and the syscall instruction needs
-	 *               a7 == syscall number
-	 *               a0 ... a5 == syscall arguments
-	 *               and returns the result in a0
-	 * Shuffle everything around appropriately.
-	 */
-	mv	t0, a0		/* signal_pending pointer */
-	mv	t1, a1		/* syscall number */
-	mv	a0, a2		/* syscall arguments */
-	mv	a1, a3
-	mv	a2, a4
-	mv	a3, a5
-	mv	a4, a6
-	mv	a5, a7
-	mv	a7, t1
+        .cfi_startproc
+        /*
+         * The syscall calling convention is nearly the same as C:
+         * we enter with a0 == *signal_pending
+         *               a1 == syscall number
+         *               a2 ... a7 == syscall arguments
+         *               and return the result in a0
+         * and the syscall instruction needs
+         *               a7 == syscall number
+         *               a0 ... a5 == syscall arguments
+         *               and returns the result in a0
+         * Shuffle everything around appropriately.
+         */
+        mv      t0, a0          /* signal_pending pointer */
+        mv      t1, a1          /* syscall number */
+        mv      a0, a2          /* syscall arguments */
+        mv      a1, a3
+        mv      a2, a4
+        mv      a3, a5
+        mv      a4, a6
+        mv      a5, a7
+        mv      a7, t1
 
-	/*
-	 * This next sequence of code works in conjunction with the
-	 * rewind_if_safe_syscall_function(). If a signal is taken
-	 * and the interrupted PC is anywhere between 'safe_syscall_start'
-	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
-	 * The code sequence must therefore be able to cope with this, and
-	 * the syscall instruction must be the final one in the sequence.
-	 */
+        /*
+         * This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
 safe_syscall_start:
-	/* If signal_pending is non-zero, don't do the call */
-	lw	t1, 0(t0)
-	bnez	t1, 0f
-	scall
+        /* If signal_pending is non-zero, don't do the call */
+        lw      t1, 0(t0)
+        bnez    t1, 0f
+        scall
 safe_syscall_end:
-	/* code path for having successfully executed the syscall */
-	ret
+        /* code path for having successfully executed the syscall */
+        ret
 
 0:
-	/* code path when we didn't execute the syscall */
-	li	a0, -TARGET_ERESTARTSYS
-	ret
-	.cfi_endproc
+        /* code path when we didn't execute the syscall */
+        li      a0, -TARGET_ERESTARTSYS
+        ret
+        .cfi_endproc
 
-	.size	safe_syscall_base, .-safe_syscall_base
+        .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/linux-user/host/s390x/safe-syscall.inc.S
index 414b44ad38..d97d27458e 100644
--- a/linux-user/host/s390x/safe-syscall.inc.S
+++ b/linux-user/host/s390x/safe-syscall.inc.S
@@ -10,81 +10,81 @@
  * See the COPYING file in the top-level directory.
  */
 
-	.global safe_syscall_base
-	.global safe_syscall_start
-	.global safe_syscall_end
-	.type	safe_syscall_base, @function
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
 
-	/* This is the entry point for making a system call. The calling
-	 * convention here is that of a C varargs function with the
-	 * first argument an 'int *' to the signal_pending flag, the
-	 * second one the system call number (as a 'long'), and all further
-	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
-	 */
+        /* This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         * We return a long which is the syscall's return value, which
+         * may be negative-errno on failure. Conversion to the
+         * -1-and-errno-set convention is done by the calling wrapper.
+         */
 safe_syscall_base:
-	.cfi_startproc
-	stmg	%r6,%r15,48(%r15)	/* save all call-saved registers */
-	.cfi_offset %r15,-40
-	.cfi_offset %r14,-48
-	.cfi_offset %r13,-56
-	.cfi_offset %r12,-64
-	.cfi_offset %r11,-72
-	.cfi_offset %r10,-80
-	.cfi_offset %r9,-88
-	.cfi_offset %r8,-96
-	.cfi_offset %r7,-104
-	.cfi_offset %r6,-112
-	lgr	%r1,%r15
-	lg	%r0,8(%r15)		/* load eos */
-	aghi	%r15,-160
-	.cfi_adjust_cfa_offset 160
-	stg	%r1,0(%r15)		/* store back chain */
-	stg	%r0,8(%r15)		/* store eos */
+        .cfi_startproc
+        stmg    %r6,%r15,48(%r15)       /* save all call-saved registers */
+        .cfi_offset %r15,-40
+        .cfi_offset %r14,-48
+        .cfi_offset %r13,-56
+        .cfi_offset %r12,-64
+        .cfi_offset %r11,-72
+        .cfi_offset %r10,-80
+        .cfi_offset %r9,-88
+        .cfi_offset %r8,-96
+        .cfi_offset %r7,-104
+        .cfi_offset %r6,-112
+        lgr     %r1,%r15
+        lg      %r0,8(%r15)             /* load eos */
+        aghi    %r15,-160
+        .cfi_adjust_cfa_offset 160
+        stg     %r1,0(%r15)             /* store back chain */
+        stg     %r0,8(%r15)             /* store eos */
 
-	/* The syscall calling convention isn't the same as the
-	 * C one:
-	 * we enter with r2 == *signal_pending
-	 *               r3 == syscall number
-	 *               r4, r5, r6, (stack) == syscall arguments
-	 *               and return the result in r2
-	 * and the syscall instruction needs
-	 *               r1 == syscall number
-	 *               r2 ... r7 == syscall arguments
-	 *               and returns the result in r2
-	 * Shuffle everything around appropriately.
-	 */
-	lgr	%r8,%r2			/* signal_pending pointer */
-	lgr	%r1,%r3			/* syscall number */
-	lgr	%r2,%r4			/* syscall args */
-	lgr	%r3,%r5
-	lgr	%r4,%r6
-	lmg	%r5,%r7,320(%r15)
+        /* The syscall calling convention isn't the same as the
+         * C one:
+         * we enter with r2 == *signal_pending
+         *               r3 == syscall number
+         *               r4, r5, r6, (stack) == syscall arguments
+         *               and return the result in r2
+         * and the syscall instruction needs
+         *               r1 == syscall number
+         *               r2 ... r7 == syscall arguments
+         *               and returns the result in r2
+         * Shuffle everything around appropriately.
+         */
+        lgr     %r8,%r2                 /* signal_pending pointer */
+        lgr     %r1,%r3                 /* syscall number */
+        lgr     %r2,%r4                 /* syscall args */
+        lgr     %r3,%r5
+        lgr     %r4,%r6
+        lmg     %r5,%r7,320(%r15)
 
-	/* This next sequence of code works in conjunction with the
-	 * rewind_if_safe_syscall_function(). If a signal is taken
-	 * and the interrupted PC is anywhere between 'safe_syscall_start'
-	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
-	 * The code sequence must therefore be able to cope with this, and
-	 * the syscall instruction must be the final one in the sequence.
-	 */
+        /* This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
 safe_syscall_start:
-	/* if signal_pending is non-zero, don't do the call */
-	icm	%r0,15,0(%r8)
-	jne	2f
-	svc	0
+        /* if signal_pending is non-zero, don't do the call */
+        icm     %r0,15,0(%r8)
+        jne     2f
+        svc     0
 safe_syscall_end:
 
-1:	lg	%r15,0(%r15)		/* load back chain */
-	.cfi_remember_state
-	.cfi_adjust_cfa_offset -160
-	lmg	%r6,%r15,48(%r15)	/* load saved registers */
-	br	%r14
-	.cfi_restore_state
-2:	lghi	%r2, -TARGET_ERESTARTSYS
-	j	1b
-	.cfi_endproc
+1:      lg      %r15,0(%r15)            /* load back chain */
+        .cfi_remember_state
+        .cfi_adjust_cfa_offset -160
+        lmg     %r6,%r15,48(%r15)       /* load saved registers */
+        br      %r14
+        .cfi_restore_state
+2:      lghi    %r2, -TARGET_ERESTARTSYS
+        j       1b
+        .cfi_endproc
 
-	.size	safe_syscall_base, .-safe_syscall_base
+        .size   safe_syscall_base, .-safe_syscall_base
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/linux-user/host/x86_64/safe-syscall.inc.S
index f36992daa3..158225553e 100644
--- a/linux-user/host/x86_64/safe-syscall.inc.S
+++ b/linux-user/host/x86_64/safe-syscall.inc.S
@@ -67,7 +67,7 @@ safe_syscall_base:
          */
 safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
-        cmpl	$0, (%rbp)
+        cmpl    $0, (%rbp)
         jnz     1f
         syscall
 safe_syscall_end:
-- 
2.25.1


