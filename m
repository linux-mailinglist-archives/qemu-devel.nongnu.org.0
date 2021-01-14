Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093C2F666F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:55:46 +0100 (CET)
Received: from localhost ([::1]:54956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05uT-0008J2-Io
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05ML-0003Sx-FO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:29 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05MF-0000Fm-Dd
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w5so6368365wrm.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BoE7fv6RyoTXm5bqnk7ux6Wn+UP6UE4omssExkDcLz0=;
 b=azP1gxDnLG7kVwaFwcUZUrivNqV8f6U+Jm1zRFRAgfQMTnk8NDkXVvVGIiV7+TNhGc
 NyqmE42oPfz/93O8jfPhXrpjXSOjdJBM8RoEMPK6LZMlcJJ+50h/iNuwTuDR0yNLlbxy
 oQeeVkdK/VgkEM2Vh4F0GgqoDnDYCw54bRri7WgR3toDjVLn/K0oyD//JUsZFjOhOHgw
 fi8PJaEiiHjmAwGj9QvVM8aPobUykqrh7WyYO3qIaCBmXs/FVNHuLsr6mw/lVwKkuKgd
 9Qw8fllPpKjxNmgplceQJ8Dm42i6PRVihboQz62g1z3petyxEUj/e2+B1buPgJbI2593
 s5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BoE7fv6RyoTXm5bqnk7ux6Wn+UP6UE4omssExkDcLz0=;
 b=LSvwjma99W9JDjDX9GmQX4tOmTc9rOu1/G986yxLGAlGejEZnu6M5qMFiZb1IfhqoD
 gVzikwSr2XrXH5TY2VTQRHYlQ6C6TPNBK4zV/x1ppK7V6nRPd8VZsGAoWkNxyUbM/K4T
 V4UyK8JmfHlrGYenGtKznJzgkeXBPBUKs47BAF6x2i8h7b52GlwBd8hwQKhEUo7oSvUs
 0aSgqPJotkA3iLrjKyncuVhx9NvN0gWwJDJVb+BE+9JeMmmRYlFibc3qMWjSRRsrVCiX
 rLNzwLG78JuRtJivD/vGBs0y+8MxUwXrJdAH2XzqqjXrgcKb5+QAjltzzSKI6xVEffVv
 rzEg==
X-Gm-Message-State: AOAM530vAM05AU7zw4UsrYBN9Q0mG1Tjz9gEBWZPkpIj5AOQ2NWqH3wc
 ysV1YZUpoj/WoY0VBTq8DuB23BiTK1c=
X-Google-Smtp-Source: ABdhPJy6n8MyPIGR7COExles9v/Q3cW1yC0kdsIWzKfDI/wWWXbLXFurXj9ELnVdJXo54OK65H90dA==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr8401356wrq.178.1610641220164; 
 Thu, 14 Jan 2021 08:20:20 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s63sm9297190wms.18.2021.01.14.08.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 00/69] MIPS patches for 2021-01-14
Date: Thu, 14 Jan 2021 17:19:59 +0100
Message-Id: <20210114162016.2901557-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resending the MIPS pull request from MIPS patches from last week=0D
(2021-01-07) now than the "decodetree: Open files with encoding=3D'utf-8'"=
=0D
patch got merged (commit 4cacecaaa2b).=0D
=0D
Pre-existing checkpatch warnings in patch 23=0D
(target/mips: Move common helpers from helper.c to cpu.c):=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #52: FILE: target/mips/cpu.c:53:=0D
    +    cu =3D (v >> CP0St_CU0) & 0xf;=0D
                               ^=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #53: FILE: target/mips/cpu.c:54:=0D
    +    mx =3D (v >> CP0St_MX) & 0x1;=0D
                              ^=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #54: FILE: target/mips/cpu.c:55:=0D
    +    ksu =3D (v >> CP0St_KSU) & 0x3;=0D
                                ^=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #81: FILE: target/mips/cpu.c:82:=0D
    +        uint32_t ksux =3D (1 << CP0St_KX) & val;=0D
                                             ^=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #89: FILE: target/mips/cpu.c:90:=0D
    +        mask &=3D ~(((1 << CP0St_SR) | (1 << CP0St_NMI)) & val);=0D
                                                            ^=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #116: FILE: target/mips/cpu.c:117:=0D
    +        mask &=3D ~((1 << CP0Ca_WP) & val);=0D
                                       ^=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #121: FILE: target/mips/cpu.c:122:=0D
    +    if ((old ^ env->CP0_Cause) & (1 << CP0Ca_DC)) {=0D
                                    ^=0D
=0D
    ERROR: space prohibited after that '&' (ctx:WxW)=0D
    #131: FILE: target/mips/cpu.c:132:=0D
    +        if ((old ^ env->CP0_Cause) & (1 << (CP0Ca_IP + i))) {=0D
                                        ^=0D
=0D
    total: 8 errors, 0 warnings, 433 lines checked=0D
=0D
The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef6867d=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210113' =
into staging (2021-01-14 09:54:29 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/mips-20210114=0D
=0D
for you to fetch changes up to cd669e20516fad3d8154629f67d4b6caede9b381:=0D
=0D
  docs/system: Remove deprecated 'fulong2e' machine alias (2021-01-14 17:13=
:54 +0100)=0D
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
Philippe Mathieu-Daud=C3=A9 (68):=0D
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
  target/mips: Declare generic FPU / Coprocessor functions in=0D
    translate.h=0D
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
  target/mips: Remove CPU_R5900 definition=0D
  target/mips: Remove CPU_NANOMIPS32 definition=0D
  target/mips: Remove vendor specific CPU definitions=0D
  docs/system: Remove deprecated 'fulong2e' machine alias=0D
=0D
 docs/system/deprecated.rst                    |    5 -=0D
 docs/system/removed-features.rst              |    5 +=0D
 target/mips/cpu.h                             |   23 +-=0D
 target/mips/fpu_helper.h                      |   59 +=0D
 target/mips/helper.h                          |  436 +-=0D
 target/mips/internal.h                        |   64 +-=0D
 target/mips/mips-defs.h                       |   56 +-=0D
 target/mips/translate.h                       |  177 +=0D
 target/mips/msa_helper.h.inc                  |  443 ++=0D
 target/mips/mips32r6.decode                   |   36 +=0D
 target/mips/mips64r6.decode                   |   27 +=0D
 target/mips/msa32.decode                      |   29 +=0D
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
 target/mips/translate.c                       | 3860 ++++-------------=0D
 target/mips/translate_addr_const.c            |   61 +=0D
 .../{translate_init.c.inc =3D> cpu-defs.c.inc}  |  128 +-=0D
 target/mips/meson.build                       |   21 +-=0D
 33 files changed, 4757 insertions(+), 4433 deletions(-)=0D
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

