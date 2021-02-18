Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F79E31EC49
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:35:52 +0100 (CET)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmHO-0005AE-PW
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCmBd-0000u5-Uf
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:29:53 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCmBa-00087E-ED
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:29:53 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y25so1642409pfp.5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4WhFq1g4P7jzKsCdmUsv7PzW5rtG8RoG1FZG8QTvuE=;
 b=NHJZkIw1PB2aAmVwRf7FLwOR5uQTMDMDyb7LBP+Fk2DV7/DoHRbEEcYSclisy5f4hf
 +LJ0HC33QSO5bjPeld8/yVJBOmQzfqP1/SRL5AUQLdFpLxeUVaR4GMDAOUhM5mPd3wWh
 FMbVtdkeSDswl5k0q+Or/BMpPAka9Tdo8PFI3mb8IrVynCKEDWjrK2u6JoiIX2zmzOni
 nk5rdktCZiMZW+uG1L6MXwzGUZVHcDF9CE/n6gN2YCpJroIc09MhkmXvweoGXTQHkhNY
 3xOd5yRwLI/d4wvc6hIqjNFrg+6MzuVxNtM+4cQbtEsWd/HdMLIhWRN3jvGNMsMuyWNS
 XxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4WhFq1g4P7jzKsCdmUsv7PzW5rtG8RoG1FZG8QTvuE=;
 b=Ntm2hEUoyCJpzVdUPRkIinS8mXr7ZrqBZOewuuAiVQzHQO6UxE5k/6oyX453Ygsd0R
 gzeYOZzPR7l2/65aaLLY8yWy0folz94ID8SfZR7nZ56yRlp0oKaE0jrO7iC62VDYodvt
 DFo2aJkTy5sbKt8xShyDOK12j1EtppXXx2bz4NWHoIn+8CfWX2dY7ZJ/igHSR6iG1cVV
 R1e61Kl2H0o2a0uYHsW8mNaBRpPfaiPJNKoA6IrQkCqfhhf2hZavuM1Ti0s62/Szt6bB
 qK5QK6wDZeVQrjkVa+ZTHsJZEsfGEZHVgyHVcyYmkDo2T83hLVgiwzRC688CWXaTX/6m
 8D6w==
X-Gm-Message-State: AOAM533LdeETn0S0L1ulQCI2edBLtOyMZpU4QVWAifEa1fV/MGwJkKbu
 fbnsVx3awMVDLR6I5GeysEPuSkEiUMfwhg==
X-Google-Smtp-Source: ABdhPJw/zxb/kBBRgvtn+9DMWySlVO+b3bX2aPkAiHp2luQB0YErvDPM4ZHlHfeZj2nMQe6odhhs1g==
X-Received: by 2002:aa7:93ac:0:b029:1e5:b52e:314f with SMTP id
 x12-20020aa793ac0000b02901e5b52e314fmr4961098pff.45.1613665788868; 
 Thu, 18 Feb 2021 08:29:48 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id k128sm6637956pfd.137.2021.02.18.08.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 08:29:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 35/35] Hexagon build infrastructure
Date: Thu, 18 Feb 2021 08:29:44 -0800
Message-Id: <20210218162944.1756160-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218162944.1756160-1-richard.henderson@linaro.org>
References: <20210218162944.1756160-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Add file to default-configs
Add hexagon to meson.build
Add hexagon to target/meson.build
Add target/hexagon/meson.build
Change scripts/qemu-binfmt-conf.sh

We can build a hexagon-linux-user target and run programs on
the Hexagon scalar core.  With hexagon-linux-clang installed,
"make check-tcg" will pass.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-35-git-send-email-tsimpson@quicinc.com>
[rth: Use top-level python variable]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../targets/hexagon-linux-user.mak            |   1 +
 meson.build                                   |   1 +
 scripts/qemu-binfmt-conf.sh                   |   6 +-
 target/hexagon/meson.build                    | 191 ++++++++++++++++++
 target/meson.build                            |   1 +
 5 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 default-configs/targets/hexagon-linux-user.mak
 create mode 100644 target/hexagon/meson.build

diff --git a/default-configs/targets/hexagon-linux-user.mak b/default-configs/targets/hexagon-linux-user.mak
new file mode 100644
index 0000000000..003ed0a408
--- /dev/null
+++ b/default-configs/targets/hexagon-linux-user.mak
@@ -0,0 +1 @@
+TARGET_ARCH=hexagon
diff --git a/meson.build b/meson.build
index a923f249d8..05a67c20d9 100644
--- a/meson.build
+++ b/meson.build
@@ -1188,6 +1188,7 @@ disassemblers = {
   'arm' : ['CONFIG_ARM_DIS'],
   'avr' : ['CONFIG_AVR_DIS'],
   'cris' : ['CONFIG_CRIS_DIS'],
+  'hexagon' : ['CONFIG_HEXAGON_DIS'],
   'hppa' : ['CONFIG_HPPA_DIS'],
   'i386' : ['CONFIG_I386_DIS'],
   'x86_64' : ['CONFIG_I386_DIS'],
diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 9f1580a91c..7b5d54b887 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -4,7 +4,7 @@
 qemu_target_list="i386 i486 alpha arm armeb sparc sparc32plus sparc64 \
 ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
 sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
-microblaze microblazeel or1k x86_64"
+microblaze microblazeel or1k x86_64 hexagon"
 
 i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
 i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
@@ -136,6 +136,10 @@ or1k_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\
 or1k_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
 or1k_family=or1k
 
+hexagon_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xa4\x00'
+hexagon_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+hexagon_family=hexagon
+
 qemu_get_family() {
     cpu=${HOST_ARCH:-$(uname -m)}
     case "$cpu" in
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
new file mode 100644
index 0000000000..15318a6fa7
--- /dev/null
+++ b/target/hexagon/meson.build
@@ -0,0 +1,191 @@
+##
+##  Copyright(c) 2020-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+##
+##  This program is free software; you can redistribute it and/or modify
+##  it under the terms of the GNU General Public License as published by
+##  the Free Software Foundation; either version 2 of the License, or
+##  (at your option) any later version.
+##
+##  This program is distributed in the hope that it will be useful,
+##  but WITHOUT ANY WARRANTY; without even the implied warranty of
+##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+##  GNU General Public License for more details.
+##
+##  You should have received a copy of the GNU General Public License
+##  along with this program; if not, see <http://www.gnu.org/licenses/>.
+##
+
+hexagon_ss = ss.source_set()
+
+hex_common_py = 'hex_common.py'
+attribs_def = meson.current_source_dir() / 'attribs_def.h.inc'
+gen_tcg_h = meson.current_source_dir() / 'gen_tcg.h'
+
+#
+#  Step 1
+#  We use a C program to create semantics_generated.pyinc
+#
+gen_semantics = executable(
+    'gen_semantics',
+    'gen_semantics.c',
+    native: true, build_by_default: false)
+
+semantics_generated = custom_target(
+    'semantics_generated.pyinc',
+    output: 'semantics_generated.pyinc',
+    input: gen_semantics,
+    command: ['@INPUT@', '@OUTPUT@'],
+)
+hexagon_ss.add(semantics_generated)
+
+#
+# Step 2
+# We use Python scripts to generate the following files
+#     shortcode_generated.h.inc
+#     helper_protos_generated.h.inc
+#     tcg_funcs_generated.c.inc
+#     tcg_func_table_generated.c.inc
+#     helper_funcs_generated.c.inc
+#     printinsn_generated.h.inc
+#     op_regs_generated.h.inc
+#     op_attribs_generated.h.inc
+#     opcodes_def_generated.h.inc
+#
+shortcode_generated = custom_target(
+    'shortcode_generated.h.inc',
+    output: 'shortcode_generated.h.inc',
+    input: 'gen_shortcode.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+)
+hexagon_ss.add(shortcode_generated)
+
+helper_protos_generated = custom_target(
+    'helper_protos_generated.h.inc',
+    output: 'helper_protos_generated.h.inc',
+    input: 'gen_helper_protos.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def, gen_tcg_h],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
+)
+hexagon_ss.add(helper_protos_generated)
+
+tcg_funcs_generated = custom_target(
+    'tcg_funcs_generated.c.inc',
+    output: 'tcg_funcs_generated.c.inc',
+    input: 'gen_tcg_funcs.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def, gen_tcg_h],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
+)
+hexagon_ss.add(tcg_funcs_generated)
+
+tcg_func_table_generated = custom_target(
+    'tcg_func_table_generated.c.inc',
+    output: 'tcg_func_table_generated.c.inc',
+    input: 'gen_tcg_func_table.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+)
+hexagon_ss.add(tcg_func_table_generated)
+
+helper_funcs_generated = custom_target(
+    'helper_funcs_generated.c.inc',
+    output: 'helper_funcs_generated.c.inc',
+    input: 'gen_helper_funcs.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def, gen_tcg_h],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
+)
+hexagon_ss.add(helper_funcs_generated)
+
+printinsn_generated = custom_target(
+    'printinsn_generated.h.inc',
+    output: 'printinsn_generated.h.inc',
+    input: 'gen_printinsn.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+)
+hexagon_ss.add(printinsn_generated)
+
+op_regs_generated = custom_target(
+    'op_regs_generated.h.inc',
+    output: 'op_regs_generated.h.inc',
+    input: 'gen_op_regs.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+)
+hexagon_ss.add(op_regs_generated)
+
+op_attribs_generated = custom_target(
+    'op_attribs_generated.h.inc',
+    output: 'op_attribs_generated.h.inc',
+    input: 'gen_op_attribs.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+)
+hexagon_ss.add(op_attribs_generated)
+
+opcodes_def_generated = custom_target(
+    'opcodes_def_generated.h.inc',
+    output: 'opcodes_def_generated.h.inc',
+    input: 'gen_opcodes_def.py',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py, attribs_def],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+)
+hexagon_ss.add(opcodes_def_generated)
+
+#
+# Step 3
+# We use a C program to create iset.py which is imported into dectree.py
+# to create the decode tree
+#
+gen_dectree_import = executable(
+    'gen_dectree_import',
+    'gen_dectree_import.c', opcodes_def_generated, op_regs_generated,
+    native: true, build_by_default: false)
+
+iset_py = custom_target(
+    'iset.py',
+    output: 'iset.py',
+    input: gen_dectree_import,
+    command: ['@INPUT@', '@OUTPUT@'],
+)
+hexagon_ss.add(iset_py)
+
+#
+# Step 4
+# We use the dectree.py script to generate the decode tree header file
+#
+dectree_generated = custom_target(
+    'dectree_generated.h.inc',
+    output: 'dectree_generated.h.inc',
+    input: 'dectree.py',
+    depends: [iset_py],
+    command: ['PYTHONPATH=' + meson.current_build_dir(), '@INPUT@', '@OUTPUT@'],
+)
+hexagon_ss.add(dectree_generated)
+
+hexagon_ss.add(files(
+    'cpu.c',
+    'translate.c',
+    'op_helper.c',
+    'gdbstub.c',
+    'genptr.c',
+    'reg_fields.c',
+    'decode.c',
+    'iclass.c',
+    'opcodes.c',
+    'printinsn.c',
+    'arch.c',
+    'fma_emu.c',
+    'conv_emu.c',
+))
+
+target_arch += {'hexagon': hexagon_ss}
diff --git a/target/meson.build b/target/meson.build
index 9f0ae93b75..c35c1e9d34 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -2,6 +2,7 @@ subdir('alpha')
 subdir('arm')
 subdir('avr')
 subdir('cris')
+subdir('hexagon')
 subdir('hppa')
 subdir('i386')
 subdir('lm32')
-- 
2.25.1


