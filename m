Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD32DFD13
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:54:40 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMa5-0006WN-H1
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0004q8-81
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQz-0007kA-6g
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c5so11286231wrp.6
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iK8F7/bAs7QXNuU28+Jy5Klkp7u+0KvKwi4P7D41jGA=;
 b=sepDO8XwQkkCVkuzbURLhLxsfr0NNeRYLUHj2B0aUkqItM/0ZqpYZrMyTkwX6tHo5D
 F6OlLljyTTqGJjinIKUdUM4k8N84uKkEd+oI9WE/416jY3ytpXPpHBjUKzNGcYM6NNfi
 BnT2dJ91a8kriif6Qx/lq1hQNa5jBmOGzho7RjdNnCxOPDQGN/oRU1rQpoaRmvpGmyHu
 Ym3f8hig5A+mcnzH6rprf2/CsgmieGy8oW/TEV6IUqjqN/6IGF7XsseJKHWKozrbgZL+
 u93YXymsPLxeyI/j4N1oDRx5FurX5L4hj15Iia1dxW593JaL+JawOELueYHkLjbcMyjR
 fH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iK8F7/bAs7QXNuU28+Jy5Klkp7u+0KvKwi4P7D41jGA=;
 b=kVobrQZ9Z+G9t25aqqie3uVFYMYsqMwEkK76ZdX5nR7kk2LOkfeHfvOvo5vsO7/nCz
 pTY9dnn8wa+ehUeUY0iDP35699HVX8BVSPo6aXd5kmtksQRv2LfI0ydYaF4dJdTgTlgV
 X5KSa/ejdV3bD3KS7ZYp0eNuzkzwbcr10edvrEoQkKq+I7FgxgOC6PP9bJ1dGS7XoIoN
 /3MRAQoh8pB6wQaH81zA140iI+3Gx4eKTPrMZV6x/gi94EUz/kXRzejKDyISw6hND6p6
 yAaikAY7FIKBJuxClJrQqeoLxEn/uVkRlLQz8EqXKUX3fDfXBuS8qxYXHTi2PiyVbusy
 M/bA==
X-Gm-Message-State: AOAM530uLGwMQW6DmlGL79ieX5IoBrRoZOC2TNZR5xjZ9Kz66IkGoBqf
 /WtLNk1dfwED3OUKJfvZH1JhFgNbkj8=
X-Google-Smtp-Source: ABdhPJx5qNKXG6AtI8GTtWXCStKbuRvDK6ajNtBVXJX7Qn3wy9kuuqdeSz+gBN4JXiuJgzMCcvY0hw==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr18779860wrq.75.1608561907092; 
 Mon, 21 Dec 2020 06:45:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/55] docs: Add CFI Documentation
Date: Mon, 21 Dec 2020 15:44:12 +0100
Message-Id: <20201221144447.26161-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

Document how to compile with CFI and how to maintain CFI-safe code

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20201204230615.2392-6-dbuono@linux.vnet.ibm.com>
[Make build system section in index.rst and add the new file. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/control-flow-integrity.rst | 137 ++++++++++++++++++++++++++
 docs/devel/index.rst                  |   5 +-
 2 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 docs/devel/control-flow-integrity.rst

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
new file mode 100644
index 0000000000..d89d70733d
--- /dev/null
+++ b/docs/devel/control-flow-integrity.rst
@@ -0,0 +1,137 @@
+============================
+Control-Flow Integrity (CFI)
+============================
+
+This document describes the current control-flow integrity (CFI) mechanism in
+QEMU. How it can be enabled, its benefits and deficiencies, and how it affects
+new and existing code in QEMU
+
+Basics
+------
+
+CFI is a hardening technique that focusing on guaranteeing that indirect
+function calls have not been altered by an attacker.
+The type used in QEMU is a forward-edge control-flow integrity that ensures
+function calls performed through function pointers, always call a "compatible"
+function. A compatible function is a function with the same signature of the
+function pointer declared in the source code.
+
+This type of CFI is entirely compiler-based and relies on the compiler knowing
+the signature of every function and every function pointer used in the code.
+As of now, the only compiler that provides support for CFI is Clang.
+
+CFI is best used on production binaries, to protect against unknown attack
+vectors.
+
+In case of a CFI violation (i.e. call to a non-compatible function) QEMU will
+terminate abruptly, to stop the possible attack.
+
+Building with CFI
+-----------------
+
+NOTE: CFI requires the use of link-time optimization. Therefore, when CFI is
+selected, LTO will be automatically enabled.
+
+To build with CFI, the minimum requirement is Clang 6+. If you
+are planning to also enable fuzzing, then Clang 11+ is needed (more on this
+later).
+
+Given the use of LTO, a version of AR that supports LLVM IR is required.
+The easies way of doing this is by selecting the AR provided by LLVM::
+
+ AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
+
+CFI is enabled on every binary produced.
+
+If desired, an additional flag to increase the verbosity of the output in case
+of a CFI violation is offered (``--enable-debug-cfi``).
+
+Using QEMU built with CFI
+-------------------------
+
+A binary with CFI will work exactly like a standard binary. In case of a CFI
+violation, the binary will terminate with an illegal instruction signal.
+
+Incompatible code with CFI
+--------------------------
+
+As mentioned above, CFI is entirely compiler-based and therefore relies on
+compile-time knowledge of the code. This means that, while generally supported
+for most code, some specific use pattern can break CFI compatibility, and
+create false-positives. The two main patterns that can cause issues are:
+
+* Just-in-time compiled code: since such code is created at runtime, the jump
+  to the buffer containing JIT code will fail.
+
+* Libraries loaded dynamically, e.g. with dlopen/dlsym, since the library was
+  not known at compile time.
+
+Current areas of QEMU that are not entirely compatible with CFI are:
+
+1. TCG, since the idea of TCG is to pre-compile groups of instructions at
+   runtime to speed-up interpretation, quite similarly to a JIT compiler
+
+2. TCI, where the interpreter has to interpret the generic *call* operation
+
+3. Plugins, since a plugin is implemented as an external library
+
+4. Modules, since they are implemented as an external library
+
+5. Directly calling signal handlers from the QEMU source code, since the
+   signal handler may have been provided by an external library or even plugged
+   at runtime.
+
+Disabling CFI for a specific function
+-------------------------------------
+
+If you are working on function that is performing a call using an
+incompatible way, as described before, you can selectively disable CFI checks
+for such function by using the decorator ``QEMU_DISABLE_CFI`` at function
+definition, and add an explanation on why the function is not compatible
+with CFI. An example of the use of ``QEMU_DISABLE_CFI`` is provided here::
+
+	/*
+	 * Disable CFI checks.
+	 * TCG creates binary blobs at runtime, with the transformed code.
+	 * A TB is a blob of binary code, created at runtime and called with an
+	 * indirect function call. Since such function did not exist at compile time,
+	 * the CFI runtime has no way to verify its signature and would fail.
+	 * TCG is not considered a security-sensitive part of QEMU so this does not
+	 * affect the impact of CFI in environment with high security requirements
+	 */
+	QEMU_DISABLE_CFI
+	static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
+
+NOTE: CFI needs to be disabled at the **caller** function, (i.e. a compatible
+cfi function that calls a non-compatible one), since the check is performed
+when the function call is performed.
+
+CFI and fuzzing
+---------------
+
+There is generally no advantage of using CFI and fuzzing together, because
+they target different environments (production for CFI, debug for fuzzing).
+
+CFI could be used in conjunction with fuzzing to identify a broader set of
+bugs that may not end immediately in a segmentation fault or triggering
+an assertion. However, other sanitizers such as address and ub sanitizers
+can identify such bugs in a more precise way than CFI.
+
+There is, however, an interesting use case in using CFI in conjunction with
+fuzzing, that is to make sure that CFI is not triggering any false positive
+in remote-but-possible parts of the code.
+
+CFI can be enabled with fuzzing, but with some caveats:
+1. Fuzzing relies on the linker performing function wrapping at link-time.
+The standard BFD linker does not support function wrapping when LTO is
+also enabled. The workaround is to use LLVM's lld linker.
+2. Fuzzing also relies on a custom linker script, which is only supported by
+lld with version 11+.
+
+In other words, to compile with fuzzing and CFI, clang 11+ is required, and
+lld needs to be used as a linker::
+
+ AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
+                           -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
+
+and then, compile the fuzzers as usual.
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f10ed77e4c..ea0e1e17ae 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -15,14 +15,15 @@ Contents:
 
    build-system
    kconfig
+   testing
+   fuzzing
+   control-flow-integrity
    loads-stores
    memory
    migration
    atomics
    stable-process
-   testing
    qtest
-   fuzzing
    decodetree
    secure-coding-practices
    tcg
-- 
2.29.2



