Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E963D39BC8C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:06:35 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCLC-0004i3-VC
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8h-0003JE-Fg
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8f-0000BZ-7u
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id u7so4356061wrs.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PvoZ38UPnJd1eKmSeIml7qGU1C99SJRJFwjVwPNmxyQ=;
 b=WhDJQAnY3k93ah2JXs8svrOJqarM9rzDCIGg2lCLXaLb1MB+qwEKlXbJUck6ARlEMU
 xkxDelggXdNRmv7U9pZciDXaJ7AHDQMSSuYUsEGQzxwtAoOz1L0n+U5WuI1LZ2pEMK0s
 AALde1wF1pJG+vxWOF0dTy7glllusqHIxpV+u0gpMNkmljll/GsDgiYTeEJ8xVQIrKDa
 LhpH98TFSn/UFhGsUlpc+28UClrKMaNcIvyYKXc/Tejf3BCk98VOaY5AMImwgvZqutk8
 zVtBQKwwtZcA6tjJbioIbqEfkvrqxW/gQMA1UaIwkyi6gR7sQ4jQeFgvHrRdp89q+gpZ
 Z+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PvoZ38UPnJd1eKmSeIml7qGU1C99SJRJFwjVwPNmxyQ=;
 b=Rn0dp0UJd4ZPgqUJ881yRw6AyKhL+SUr4JfBFubELlZ4BYGLXvABvKEehEZgAVv5kN
 w+B6q/F4RjX96nzc3ZPfS+RBtUg8Kc+vTFAVuCE7VWXArMumv3zeZlPpCtx/NPs0Obft
 +Ja7wNRJH2MYlKi1yeg8wvQ9tWUpIlC1ZPW+FxYQuILK55RYaq5l7KO4lBvjf5LuIbC2
 EDAvhgHCNY0G7B+823XqXvZzxNad/kI3ZbpbRi+gIH0rfrp/uQ/uf+k39Lp8Tnx3RIFI
 wGBCgTS0NYDdgW9xTl8ssXbFZ0yWdgUTFFETD41lpTJ3fEvIXM6ETRY6MAGkVinCCLlT
 xYPA==
X-Gm-Message-State: AOAM530ZK52WGdQ/pFsxZXObiQdXNxdYj4z5nBe/Nriufy5wg7V5EGhG
 CVtxHBhjkNQlLil76hGuoK+9kg==
X-Google-Smtp-Source: ABdhPJzd71KTg8NS+O7HlSHid/SqIqWQggSrjeGg4w0PjiY2HoSfVdHKWbTz/EXFKyI+FjMphwLZkw==
X-Received: by 2002:a5d:50ca:: with SMTP id f10mr4460353wrt.411.1622822015734; 
 Fri, 04 Jun 2021 08:53:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k5sm7410470wrv.85.2021.06.04.08.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B8701FFE8;
 Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 77/99] target/arm: arch_dump: restrict ELFCLASS64 to
 AArch64
Date: Fri,  4 Jun 2021 16:52:50 +0100
Message-Id: <20210604155312.15902-78-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

this will allow us to restrict more code to TARGET_AARCH64

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v16
  - fix conflict now notes in arm_sysemu_ops
---
 target/arm/arch_dump.c | 12 +++++++-----
 target/arm/cpu.c       |  2 ++
 roms/u-boot            |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..9cc75a6fda 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -23,6 +23,8 @@
 #include "elf.h"
 #include "sysemu/dump.h"
 
+#ifdef TARGET_AARCH64
+
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
     uint64_t regs[31];
@@ -141,7 +143,6 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
     return 0;
 }
 
-#ifdef TARGET_AARCH64
 static off_t sve_zreg_offset(uint32_t vq, int n)
 {
     off_t off = sizeof(struct aarch64_user_sve_header);
@@ -229,7 +230,6 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 
     return 0;
 }
-#endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
@@ -272,15 +272,15 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
         return ret;
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = aarch64_write_elf64_sve(f, env, cpuid, s);
     }
-#endif
 
     return ret;
 }
 
+#endif /* TARGET_AARCH64 */
+
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
 struct arm_user_regs {
     uint32_t regs[17];
@@ -449,12 +449,14 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     size_t note_size;
 
     if (class == ELFCLASS64) {
+#ifdef TARGET_AARCH64
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
-#ifdef TARGET_AARCH64
         if (cpu_isar_feature(aa64_sve, cpu)) {
             note_size += AARCH64_SVE_NOTE_SIZE(&cpu->env);
         }
+#else
+        return -1; /* unsupported */
 #endif
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0b20faaca0..b297d0e6aa 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1380,7 +1380,9 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
     .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
+#ifdef TARGET_AARCH64
     .write_elf64_note = arm_cpu_write_elf64_note,
+#endif
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
diff --git a/roms/u-boot b/roms/u-boot
index b46dd116ce..d3689267f9 160000
--- a/roms/u-boot
+++ b/roms/u-boot
@@ -1 +1 @@
-Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
+Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff
-- 
2.20.1


