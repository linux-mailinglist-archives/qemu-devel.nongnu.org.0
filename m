Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814CF370DDE
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:19:33 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEoe-00072I-HU
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEl0-00056r-8t
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:15:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEky-0007Ch-1f
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:15:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x5so3065940wrv.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y5oYQ1kO7CAsr0AsEunuCviOL1tqJrATq5Z4ir95GjQ=;
 b=B3YPln6XWWMPY9St45PRPB+8qS5zbvanQ65kYT5hHWGKNXEXlSrIU6YodY+Vcphx1k
 YsG6HZR2Y28smEz/vm0/h3ylvJSMQQvhdsP8IWJ0f1DeT3XDPh0PWEb2P0ibytPbQ12H
 CpAC06nqxw398msr6tKKANIR+WKH2kk6As7Wv/w4NVeZQn+gYcwOUPvuRj+AIJYesxRp
 l3IyYcO/mi7oL114fwrjlFdibx9E1BKZCa13VKpO5SosaXg2YkK+TDFnPEYWbsAxYvFU
 j/lVAUJVNKBMFy5VKMaaB3IqzyhsSx3FSrPPLM0yLMkabAr9NYoWicPZ5fWB23yPFJuG
 MdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Y5oYQ1kO7CAsr0AsEunuCviOL1tqJrATq5Z4ir95GjQ=;
 b=aY5CDOVB4v2jo5bTdrHDhJ6UlJ1i3ldrQkvRK+JSpKV+46hGTIJDHGdxdtPnNkAUjK
 aYGg+fqJunk3YsQTfXGsbJcpQ+EvnuBJOeFhpF7fet8i7g+dcaqAs+EmRRb0d2W2Bb/e
 O8hsjJLSzeELLsOpl4ldu+Qe4i6Kd7bj9MbmZeJPYEAXnNg/ql6CqCa9dLF5iuBvvVKP
 0PRS7xDveGmhXFzyS5XV2FT5bWmTBnuHUw2HVOBKRwTw76EMd4inZZBZ1iRFEVWfrWMo
 4zj4BPS0pZ4pRGBsilozB9tjm9JjO5sXh7nC3WG0fyy3rDTnBg36EoVt/stOzxlZO3R4
 z/Zw==
X-Gm-Message-State: AOAM533HtMlLVNC7UE4MbNpaJNpvHxUG5DlzYZTh3Sf8p4rsXD35tiP2
 XzBFZE+xuMzF6JQJqVcVRvnqul4Gx3thkAvg
X-Google-Smtp-Source: ABdhPJyFB7nHGdxtasDpff8aZgvju+8gGFGly/+nOu0o087j6d8kwV+Z4dmQUlalF2fg4kM/Vez/GA==
X-Received: by 2002:a5d:6daa:: with SMTP id u10mr19591536wrs.119.1619972140937; 
 Sun, 02 May 2021 09:15:40 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y15sm9650295wrh.8.2021.05.02.09.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:15:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/36] MIPS patches for 2021-05-02
Date: Sun,  2 May 2021 18:15:02 +0200
Message-Id: <20210502161538.534038-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' =
into staging (2021-05-02 12:02:46 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20210502=0D
=0D
for you to fetch changes up to 1c13514449439b5ff1f746ed0bf73b298da39cf0:=0D
=0D
  gitlab-ci: Add KVM mips64el cross-build jobs (2021-05-02 16:49:35 +0200)=
=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Fix CACHEE opcode=0D
- Add missing CP0 checks to nanoMIPS RDPGPR / WRPGPR opcodes=0D
- Remove isa_get_irq() call in PIIX4 south bridge=0D
- Add various missing fields to the MIPS CPU migration vmstate=0D
- Lot of code moved around to allow TCG or KVM only builds=0D
- Restrict non-virtualized machines to TCG=0D
- Add KVM mips64el cross-build jobs to gitlab-ci=0D
=0D
=0D
scripts/checkpatch.pl false positive in patch 31=0D
"Move TLB management helpers to tcg/sysemu/tlb_helper.c":=0D
=0D
4 checkpatch errors:=0D
=0D
  ERROR: space prohibited after that '&' (ctx:WxW)=0D
  #414: FILE: target/mips/tcg/sysemu/tlb_helper.c:71:=0D
  +    tlb->XI0 =3D (env->CP0_EntryLo0 >> CP0EnLo_XI) & 1;=0D
                                                    ^=0D
=0D
  ERROR: space prohibited after that '&' (ctx:WxW)=0D
  #415: FILE: target/mips/tcg/sysemu/tlb_helper.c:72:=0D
  +    tlb->RI0 =3D (env->CP0_EntryLo0 >> CP0EnLo_RI) & 1;=0D
                                                    ^=0D
=0D
  ERROR: space prohibited after that '&' (ctx:WxW)=0D
  #420: FILE: target/mips/tcg/sysemu/tlb_helper.c:77:=0D
  +    tlb->XI1 =3D (env->CP0_EntryLo1 >> CP0EnLo_XI) & 1;=0D
                                                    ^=0D
=0D
  ERROR: space prohibited after that '&' (ctx:WxW)=0D
  #421: FILE: target/mips/tcg/sysemu/tlb_helper.c:78:=0D
  +    tlb->RI1 =3D (env->CP0_EntryLo1 >> CP0EnLo_RI) & 1;=0D
                                                    ^=0D
=0D
  total: 4 errors, 0 warnings, 688 lines checked=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (36):=0D
  hw/isa/piix4: Use qdev_get_gpio_in_named() to get ISA IRQ=0D
  target/mips: Fix CACHEE opcode (CACHE using EVA addressing)=0D
  target/mips: Add missing CP0 check to nanoMIPS RDPGPR / WRPGPR opcodes=0D
  target/mips: Remove spurious LOG_UNIMP of MTHC0 opcode=0D
  target/mips: Migrate missing CPU fields=0D
  target/mips: Make check_cp0_enabled() return a boolean=0D
  target/mips: Simplify meson TCG rules=0D
  target/mips: Move IEEE rounding mode array to new source file=0D
  target/mips: Move msa_reset() to new source file=0D
  target/mips: Make CPU/FPU regnames[] arrays global=0D
  target/mips: Optimize CPU/FPU regnames[] arrays=0D
  target/mips: Restrict mips_cpu_dump_state() to cpu.c=0D
  target/mips: Turn printfpr() macro into a proper function=0D
  target/mips: Declare mips_env_set_pc() inlined in "internal.h"=0D
  target/mips: Merge do_translate_address into=0D
    cpu_mips_translate_address=0D
  target/mips: Extract load/store helpers to ldst_helper.c=0D
  meson: Introduce meson_user_arch source set for arch-specific=0D
    user-mode=0D
  target/mips: Introduce tcg-internal.h for TCG specific declarations=0D
  target/mips: Add simple user-mode mips_cpu_do_interrupt()=0D
  target/mips: Add simple user-mode mips_cpu_tlb_fill()=0D
  target/mips: Move cpu_signal_handler definition around=0D
  target/mips: Move sysemu specific files under sysemu/ subfolder=0D
  target/mips: Move physical addressing code to sysemu/physaddr.c=0D
  target/mips: Restrict cpu_mips_get_random() / update_pagemask() to TCG=0D
  target/mips: Move sysemu TCG-specific code to tcg/sysemu/ subfolder=0D
  target/mips: Restrict mmu_init() to TCG=0D
  target/mips: Move tlb_helper.c to tcg/sysemu/=0D
  target/mips: Restrict CPUMIPSTLBContext::map_address() handlers scope=0D
  target/mips: Move Special opcodes to tcg/sysemu/special_helper.c=0D
  target/mips: Move helper_cache() to tcg/sysemu/special_helper.c=0D
  target/mips: Move TLB management helpers to tcg/sysemu/tlb_helper.c=0D
  target/mips: Move exception management code to exception.c=0D
  target/mips: Move CP0 helpers to sysemu/cp0.c=0D
  target/mips: Move TCG source files under tcg/ sub directory=0D
  hw/mips: Restrict non-virtualized machines to TCG=0D
  gitlab-ci: Add KVM mips64el cross-build jobs=0D
=0D
 meson.build                                  |    6 +=0D
 target/mips/helper.h                         |  183 +--=0D
 target/mips/internal.h                       |  105 +-=0D
 target/mips/tcg/tcg-internal.h               |   64 +=0D
 target/mips/translate.h                      |    7 +-=0D
 target/mips/{ =3D> tcg}/msa_helper.h.inc       |    0=0D
 target/mips/tcg/sysemu_helper.h.inc          |  185 +++=0D
 target/mips/{ =3D> tcg}/mips32r6.decode        |    0=0D
 target/mips/{ =3D> tcg}/mips64r6.decode        |    0=0D
 target/mips/{ =3D> tcg}/msa32.decode           |    0=0D
 target/mips/{ =3D> tcg}/msa64.decode           |    0=0D
 target/mips/{ =3D> tcg}/tx79.decode            |    0=0D
 hw/isa/piix4.c                               |    5 +-=0D
 target/mips/cpu.c                            |  311 ++---=0D
 target/mips/fpu.c                            |   25 +=0D
 target/mips/msa.c                            |   60 +=0D
 target/mips/op_helper.c                      | 1210 ------------------=0D
 target/mips/{ =3D> sysemu}/addr.c              |    0=0D
 target/mips/sysemu/cp0.c                     |  123 ++=0D
 target/mips/{ =3D> sysemu}/cp0_timer.c         |    0=0D
 target/mips/{ =3D> sysemu}/machine.c           |   21 +-=0D
 target/mips/sysemu/physaddr.c                |  257 ++++=0D
 target/mips/{ =3D> tcg}/dsp_helper.c           |    0=0D
 target/mips/tcg/exception.c                  |  167 +++=0D
 target/mips/{ =3D> tcg}/fpu_helper.c           |    8 -=0D
 target/mips/tcg/ldst_helper.c                |  288 +++++=0D
 target/mips/{ =3D> tcg}/lmmi_helper.c          |    0=0D
 target/mips/{ =3D> tcg}/msa_helper.c           |   36 -=0D
 target/mips/{ =3D> tcg}/msa_translate.c        |    0=0D
 target/mips/{ =3D> tcg}/mxu_translate.c        |    0=0D
 target/mips/tcg/op_helper.c                  |  420 ++++++=0D
 target/mips/{ =3D> tcg}/rel6_translate.c       |    0=0D
 target/mips/{ =3D> tcg/sysemu}/cp0_helper.c    |    0=0D
 target/mips/{ =3D> tcg/sysemu}/mips-semi.c     |    0=0D
 target/mips/tcg/sysemu/special_helper.c      |  173 +++=0D
 target/mips/{ =3D> tcg/sysemu}/tlb_helper.c    |  623 +++++----=0D
 target/mips/{ =3D> tcg}/translate.c            |  115 +-=0D
 target/mips/{ =3D> tcg}/translate_addr_const.c |    0=0D
 target/mips/{ =3D> tcg}/tx79_translate.c       |    0=0D
 target/mips/{ =3D> tcg}/txx9_translate.c       |    0=0D
 target/mips/tcg/user/tlb_helper.c            |   64 +=0D
 .gitlab-ci.d/crossbuilds.yml                 |    8 +=0D
 MAINTAINERS                                  |    3 +-=0D
 hw/mips/meson.build                          |   11 +-=0D
 target/mips/meson.build                      |   55 +-=0D
 target/mips/sysemu/meson.build               |    7 +=0D
 target/mips/tcg/meson.build                  |   35 +=0D
 target/mips/tcg/sysemu/meson.build           |    6 +=0D
 target/mips/tcg/user/meson.build             |    3 +=0D
 49 files changed, 2426 insertions(+), 2158 deletions(-)=0D
 create mode 100644 target/mips/tcg/tcg-internal.h=0D
 rename target/mips/{ =3D> tcg}/msa_helper.h.inc (100%)=0D
 create mode 100644 target/mips/tcg/sysemu_helper.h.inc=0D
 rename target/mips/{ =3D> tcg}/mips32r6.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/mips64r6.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/msa32.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/msa64.decode (100%)=0D
 rename target/mips/{ =3D> tcg}/tx79.decode (100%)=0D
 create mode 100644 target/mips/fpu.c=0D
 create mode 100644 target/mips/msa.c=0D
 delete mode 100644 target/mips/op_helper.c=0D
 rename target/mips/{ =3D> sysemu}/addr.c (100%)=0D
 create mode 100644 target/mips/sysemu/cp0.c=0D
 rename target/mips/{ =3D> sysemu}/cp0_timer.c (100%)=0D
 rename target/mips/{ =3D> sysemu}/machine.c (94%)=0D
 create mode 100644 target/mips/sysemu/physaddr.c=0D
 rename target/mips/{ =3D> tcg}/dsp_helper.c (100%)=0D
 create mode 100644 target/mips/tcg/exception.c=0D
 rename target/mips/{ =3D> tcg}/fpu_helper.c (99%)=0D
 create mode 100644 target/mips/tcg/ldst_helper.c=0D
 rename target/mips/{ =3D> tcg}/lmmi_helper.c (100%)=0D
 rename target/mips/{ =3D> tcg}/msa_helper.c (99%)=0D
 rename target/mips/{ =3D> tcg}/msa_translate.c (100%)=0D
 rename target/mips/{ =3D> tcg}/mxu_translate.c (100%)=0D
 create mode 100644 target/mips/tcg/op_helper.c=0D
 rename target/mips/{ =3D> tcg}/rel6_translate.c (100%)=0D
 rename target/mips/{ =3D> tcg/sysemu}/cp0_helper.c (100%)=0D
 rename target/mips/{ =3D> tcg/sysemu}/mips-semi.c (100%)=0D
 create mode 100644 target/mips/tcg/sysemu/special_helper.c=0D
 rename target/mips/{ =3D> tcg/sysemu}/tlb_helper.c (76%)=0D
 rename target/mips/{ =3D> tcg}/translate.c (99%)=0D
 rename target/mips/{ =3D> tcg}/translate_addr_const.c (100%)=0D
 rename target/mips/{ =3D> tcg}/tx79_translate.c (100%)=0D
 rename target/mips/{ =3D> tcg}/txx9_translate.c (100%)=0D
 create mode 100644 target/mips/tcg/user/tlb_helper.c=0D
 create mode 100644 target/mips/sysemu/meson.build=0D
 create mode 100644 target/mips/tcg/meson.build=0D
 create mode 100644 target/mips/tcg/sysemu/meson.build=0D
 create mode 100644 target/mips/tcg/user/meson.build=0D
=0D
-- =0D
2.26.3=0D
=0D

