Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71632EE873
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:25:10 +0100 (CET)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdiP-0007jO-VH
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgK-0006VJ-8l
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgI-0004WP-4D
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g185so6828243wmf.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CVOh3zHgwfBfd1YKdXDSVA4owP2D+qRdHedUeP9R50U=;
 b=j9p+gJSAIiUrYLg64VSGmdFyNxwbA5nXjEK0O1lI9b4hBwaeeTSvHT3i86e72dHpAi
 WKY+wFe5vPLnuz+y9Z3WOUfn3vZlBNtK3Hj2uCXFmHND6WS6AQ5M7gOauPDY9mA6tokJ
 N4mGOCo7WMeh6146OUhXLIgpYD78CPlL0Rx+Jvjw+Rf2q7DMGyBh4zkKn1CfSjMn0PXo
 NXjEbaZDHB4WVZzklgMPsK5DthHD5Ed4BdMF0BlkMasWkIXGxKbDSWfZqPFPTZbXLYn+
 rdIdrO/ZKfBfIW6It0Cbj7wvoMRb4q/lJJmk8ooflkpDK7oL2OrLVSsqRn3M8rSKlKjW
 JS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CVOh3zHgwfBfd1YKdXDSVA4owP2D+qRdHedUeP9R50U=;
 b=NNXMidb59CYWkJCOOCPLxreb5zzhW91wEASrOHNzBTGn6Co1sKreV9FHao3xJEaIwQ
 qYCVaVKe7IrtYRQPWYtuxBijpZg1YPsEJizFLJV3f/VUI7FpZR6CU20oYNzfybkXnqFh
 Fn7Nrq63TGGgDqkluZufWnoIN1GxgYC3svhho2Gd79jyJe+pKgV9Bo88JEC7e4zFjxHO
 Pd+a+JP46VkFZQ4lD03DcaccpsdRhmy3qzdgFtd5SCkdCBV7+m7zKR/5lkb/HOOdGLUM
 uSidGYcitMD5Im0kfDb1V2osmoWCWTiDuHmLR2zIWggS03u9+Noi9D6UB/At3bJKBDqQ
 qvXA==
X-Gm-Message-State: AOAM533E82YvhTZe408E3oxBWDscuEm2NnXPZ0fCUaJJ7vWKtQlmUw5P
 YPE2XQS2ffpJgff7mIeAvEjUUkd24V0=
X-Google-Smtp-Source: ABdhPJz9HrYiMVU3ybn2w0SEfyu/2liRpw1SQvQFcdd9PtavU0ZgtWeJ3iLLBv5u/q1xHkXrB8WXoA==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr537320wmg.68.1610058175749; 
 Thu, 07 Jan 2021 14:22:55 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id i16sm10175060wrx.89.2021.01.07.14.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:22:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/66] MIPS patches for 2021-01-07
Date: Thu,  7 Jan 2021 23:21:47 +0100
Message-Id: <20210107222253.20382-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 470dd6bd360782f5137f7e3376af6a44658eb1d3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-060121-4'=
 into staging (2021-01-06 22:18:36 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/mips-20210107=0D
=0D
for you to fetch changes up to f97d339d612b86d8d336a11f01719a10893d6707:=0D
=0D
  docs/system: Remove deprecated 'fulong2e' machine alias (2021-01-07 22:57=
:49 +0100)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Simplify CPU/ISA definitions=0D
- Various maintenance code movements in translate.c=0D
- Convert part of the MSA ASE instructions to decodetree=0D
- Convert some instructions removed from Release 6 to decodetree=0D
- Remove deprecated 'fulong2e' machine alias=0D
=0D
----------------------------------------------------------------=0D
=0D
Jiaxun Yang (1):=0D
  target/mips/addr: Add translation helpers for KSEG1=0D
=0D
Philippe Mathieu-Daud=C3=A9 (65):=0D
  target/mips: Add CP0 Config0 register definitions for MIPS3 ISA=0D
  target/mips: Replace CP0_Config0 magic values by proper definitions=0D
  target/mips/mips-defs: Remove USE_HOST_FLOAT_REGS comment=0D
  target/mips/mips-defs: Reorder CPU_MIPS5 definition=0D
  target/mips/mips-defs: Rename CPU_MIPSxx Release 1 as CPU_MIPSxxR1=0D
  target/mips/mips-defs: Introduce CPU_MIPS64 and cpu_type_is_64bit()=0D
  hw/mips/boston: Check 64-bit support with cpu_type_is_64bit()=0D
  target/mips/mips-defs: Use ISA_MIPS32 definition to check Release 1=0D
  target/mips/mips-defs: Use ISA_MIPS32R2 definition to check Release 2=0D
  target/mips/mips-defs: Use ISA_MIPS32R3 definition to check Release 3=0D
  target/mips/mips-defs: Use ISA_MIPS32R5 definition to check Release 5=0D
  target/mips/mips-defs: Use ISA_MIPS32R6 definition to check Release 6=0D
  target/mips/mips-defs: Rename ISA_MIPS32 as ISA_MIPS_R1=0D
  target/mips/mips-defs: Rename ISA_MIPS32R2 as ISA_MIPS_R2=0D
  target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_R3=0D
  target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_R5=0D
  target/mips/mips-defs: Rename ISA_MIPS32R6 as ISA_MIPS_R6=0D
  target/mips: Inline cpu_state_reset() in mips_cpu_reset()=0D
  target/mips: Extract FPU helpers to 'fpu_helper.h'=0D
  target/mips: Add !CONFIG_USER_ONLY comment after #endif=0D
  target/mips: Remove consecutive CONFIG_USER_ONLY ifdefs=0D
  target/mips: Move common helpers from helper.c to cpu.c=0D
  target/mips: Rename helper.c as tlb_helper.c=0D
  target/mips: Fix code style for checkpatch.pl=0D
  target/mips: Move mmu_init() functions to tlb_helper.c=0D
  target/mips: Rename translate_init.c as cpu-defs.c=0D
  target/mips/translate: Extract DisasContext structure=0D
  target/mips/translate: Add declarations for generic code=0D
  target/mips: Replace gen_exception_err(err=3D0) by gen_exception_end()=0D
  target/mips: Replace gen_exception_end(EXCP_RI) by=0D
    gen_rsvd_instruction=0D
  target/mips: Declare generic FPU functions in 'translate.h'=0D
  target/mips: Extract FPU specific definitions to translate.h=0D
  target/mips: Only build TCG code when CONFIG_TCG is set=0D
  target/mips/translate: Extract decode_opc_legacy() from decode_opc()=0D
  target/mips/translate: Expose check_mips_64() to 32-bit mode=0D
  target/mips: Introduce ase_msa_available() helper=0D
  target/mips: Simplify msa_reset()=0D
  target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA=0D
  target/mips: Simplify MSA TCG logic=0D
  target/mips: Remove now unused ASE_MSA definition=0D
  target/mips: Alias MSA vector registers on FPU scalar registers=0D
  target/mips: Extract msa_translate_init() from mips_tcg_init()=0D
  target/mips: Remove CPUMIPSState* argument from gen_msa*() methods=0D
  target/mips: Explode gen_msa_branch() as gen_msa_BxZ_V/BxZ()=0D
  target/mips: Move msa_reset() to msa_helper.c=0D
  target/mips: Extract MSA helpers from op_helper.c=0D
  target/mips: Extract MSA helper definitions=0D
  target/mips: Declare gen_msa/_branch() in 'translate.h'=0D
  target/mips: Extract MSA translation routines=0D
  target/mips: Pass TCGCond argument to MSA gen_check_zero_element()=0D
  target/mips: Introduce decode tree bindings for MSA ASE=0D
  target/mips: Use decode_ase_msa() generated from decodetree=0D
  target/mips: Extract LSA/DLSA translation generators=0D
  target/mips: Introduce decodetree helpers for MSA LSA/DLSA opcodes=0D
  target/mips: Introduce decodetree helpers for Release6 LSA/DLSA=0D
    opcodes=0D
  target/mips: Remove now unreachable LSA/DLSA opcodes code=0D
  target/mips: Convert Rel6 Special2 opcode to decodetree=0D
  target/mips: Convert Rel6 COP1X opcode to decodetree=0D
  target/mips: Convert Rel6 CACHE/PREF opcodes to decodetree=0D
  target/mips: Convert Rel6 LWL/LWR/SWL/SWR opcodes to decodetree=0D
  target/mips: Convert Rel6 LWLE/LWRE/SWLE/SWRE opcodes to decodetree=0D
  target/mips: Convert Rel6 LDL/LDR/SDL/SDR opcodes to decodetree=0D
  target/mips: Convert Rel6 LLD/SCD opcodes to decodetree=0D
  target/mips: Convert Rel6 LL/SC opcodes to decodetree=0D
  docs/system: Remove deprecated 'fulong2e' machine alias=0D
=0D
 docs/system/deprecated.rst                    |    5 -=0D
 docs/system/removed-features.rst              |    5 +=0D
 target/mips/cpu.h                             |   23 +-=0D
 target/mips/fpu_helper.h                      |   59 +=0D
 target/mips/helper.h                          |  436 +-=0D
 target/mips/internal.h                        |   64 +-=0D
 target/mips/mips-defs.h                       |   47 +-=0D
 target/mips/translate.h                       |  168 +=0D
 target/mips/msa_helper.h.inc                  |  443 ++=0D
 target/mips/mips32r6.decode                   |   36 +=0D
 target/mips/mips64r6.decode                   |   26 +=0D
 target/mips/msa32.decode                      |   28 +=0D
 target/mips/msa64.decode                      |   17 +=0D
 hw/mips/boston.c                              |    6 +-=0D
 hw/mips/fuloong2e.c                           |    1 -=0D
 linux-user/mips/cpu_loop.c                    |    7 +-=0D
 target/mips/addr.c                            |   10 +=0D
 target/mips/cp0_helper.c                      |   18 +-=0D
 target/mips/cp0_timer.c                       |    4 +-=0D
 target/mips/cpu.c                             |  255 +-=0D
 target/mips/fpu_helper.c                      |    5 +-=0D
 target/mips/gdbstub.c                         |    1 +=0D
 target/mips/kvm.c                             |   13 +-=0D
 target/mips/machine.c                         |    1 +=0D
 target/mips/msa_helper.c                      |  430 ++=0D
 target/mips/msa_translate.c                   | 2286 ++++++++++=0D
 target/mips/op_helper.c                       |  396 +-=0D
 target/mips/rel6_translate.c                  |   44 +=0D
 target/mips/{helper.c =3D> tlb_helper.c}        |  266 +-=0D
 target/mips/translate.c                       | 3839 +++--------------=0D
 target/mips/translate_addr_const.c            |   61 +=0D
 .../{translate_init.c.inc =3D> cpu-defs.c.inc}  |  114 +-=0D
 target/mips/meson.build                       |   21 +-=0D
 33 files changed, 4727 insertions(+), 4408 deletions(-)=0D
 create mode 100644 target/mips/fpu_helper.h=0D
 create mode 100644 target/mips/translate.h=0D
 create mode 100644 target/mips/msa_helper.h.inc=0D
 create mode 100644 target/mips/mips32r6.decode=0D
 create mode 100644 target/mips/mips64r6.decode=0D
 create mode 100644 target/mips/msa32.decode=0D
 create mode 100644 target/mips/msa64.decode=0D
 create mode 100644 target/mips/msa_translate.c=0D
 create mode 100644 target/mips/rel6_translate.c=0D
 rename target/mips/{helper.c =3D> tlb_helper.c} (87%)=0D
 create mode 100644 target/mips/translate_addr_const.c=0D
 rename target/mips/{translate_init.c.inc =3D> cpu-defs.c.inc} (92%)=0D
=0D
-- =0D
2.26.2=0D
=0D

