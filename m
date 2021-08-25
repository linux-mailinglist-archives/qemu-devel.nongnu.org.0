Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18FE3F7590
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:06:41 +0200 (CEST)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsc4-0005Mi-Uc
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsXt-00066p-Ff
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsXn-0002AU-Ub
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so75291wmi.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4KBgbQ1ClEE4IgR/0AnxcLM9NnJ0UxDiVXSvx2Bdqg=;
 b=ifRuKxH+Yl0aZ8jDA2gN6LQgqf8MUPpkSQTfz3FKWxoA04afqvl/jFSw0NiwM9lZyJ
 YG6LMmqeV7kGYH/8Hv81yjjnYB+ndZ6kUab4Mjuj6X9Psa+c8L/dGWB8VWx+w8Ay2H7a
 zD7TU7spKWrb2K2qt9Lp9H706yvkmHIl3vl6Pgd9+f3QAU64M14uRH+cxr37wEVcmiID
 uQEg169JLe4GB5DCQ3yOj5qrpHLyVNc554Q4PG7g5hJEB43m5Sbcxort7t5p1oh/cXOZ
 jRXVdBG6ePGvoH7cUs1QwLpBMsIbPPfa6di/6NUGGRAMDtd5UsgnUlxjp8i5VD719gB4
 zxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=r4KBgbQ1ClEE4IgR/0AnxcLM9NnJ0UxDiVXSvx2Bdqg=;
 b=eVV+/dy+ObcV8cER6q1LHYeokIbMVYDNvYWDdRg5zu7iIsIsIUbNhAnWH1lIGuaHAX
 u3NAEJW+Xc+LJDpyu2aHqclP0CntyHpWt1SDzjWQ3DJJ8oGqBzXJBDn1SGP3++z8s/eD
 gx+7rhEzdtoB1TiDH3zW1cMR9tWV2+H2iwY0dryaPFcJw6jli36m6ST2NByjsct9y8ix
 vKIeionRf+tUH5UfXTGEtd4Sdpu3aTAf8rogF7+W2jz4EpzFT4n8R40K1Od/VMSPUjh0
 sLg9Q/wTUHfG92fbLwEE2zFQcGrjnWJvTMgJ3zmNT56fvC9v56j2ZW3n227xGz2PNSHo
 3DfQ==
X-Gm-Message-State: AOAM531XMXQ4hnvEmhLVI5QVtlqCDQpGu3A4Pwayi9EPtUYM4e84hKUj
 QDK+hrKtkXFI836y+Ru3/QHo68v+IzI=
X-Google-Smtp-Source: ABdhPJzGUwvylebBih10GOLg8gIrIapHIZQX03+29E5pmuzybPOdEsNPzFg1ccPG8ZzF2aluvRxOgQ==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr8651795wmq.89.1629896533812; 
 Wed, 25 Aug 2021 06:02:13 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c7sm5050577wmq.13.2021.08.25.06.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/28] MIPS patches for 2021-08-25
Date: Wed, 25 Aug 2021 15:01:43 +0200
Message-Id: <20210825130211.1542338-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d42685765653ec155fdf60910662f8830bdb2cef=
:=0D
=0D
  Open 6.2 development tree (2021-08-25 10:25:12 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20210825=0D
=0D
for you to fetch changes up to bf78469cc8ddb117b6db4a353e59fb4664a96de4:=0D
=0D
  target/mips: Replace TARGET_WORDS_BIGENDIAN by cpu_is_bigendian() (2021-0=
8-25 13:02:14 +0200)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- minor simplifications in PREF / JR opcodes=0D
- merge 32-bit/64-bit Release6 decodetree definitions=0D
- converted NEC Vr54xx extension opcodes to decodetree=0D
- housekeeping in gen_helper() macros=0D
- replace TARGET_WORDS_BIGENDIAN #ifdef'ry by cpu_is_bigendian()=0D
- allow Loongson 3A1000 to use up to 48-bit VAddr=0D
=0D
----------------------------------------------------------------=0D
=0D
One false positive because whole target/mips/ is coverd in MAINTAINERS:=0D
=0D
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?=0D
=0D
 MIPS TCG CPUs=0D
 F: target/mips/=0D
=0D
Two style warnings:=0D
=0D
WARNING: line over 80 characters=0D
=0D
Preexisting failure (fixes from John Snow available on the list):=0D
=0D
ERROR:   py36: commands failed=0D
ERROR:   py37: commands failed=0D
ERROR:   py38: commands failed=0D
ERROR:   py39: commands failed=0D
ERROR:   py310: commands failed=0D
make: *** [Makefile:93: check-tox] Error 1=0D
=0D
Philippe Mathieu-Daud=C3=A9 (28):=0D
  target/mips: Remove JR opcode unused arguments=0D
  target/mips: Simplify PREF opcode=0D
  target/mips: Decode vendor extensions before MIPS ISAs=0D
  target/mips: Merge 32-bit/64-bit Release6 decodetree definitions=0D
  target/mips: Rename 'rtype' as 'r'=0D
  target/mips: Introduce generic TRANS() macro for decodetree helpers=0D
  target/mips: Extract NEC Vr54xx helper definitions=0D
  target/mips: Extract NEC Vr54xx helpers to vr54xx_helper.c=0D
  target/mips: Introduce decodetree structure for NEC Vr54xx extension=0D
  target/mips: Convert Vr54xx MACC* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MUL* opcodes to decodetree=0D
  target/mips: Convert Vr54xx MSA* opcodes to decodetree=0D
  target/mips: Document Loongson-3A CPU definitions=0D
  target/mips: Allow Loongson 3A1000 to use up to 48-bit VAddr=0D
  target/mips: Remove duplicated check_cp1_enabled() calls in Loongson=0D
    EXT=0D
  target/mips: Remove gen_helper_0e3i()=0D
  target/mips: Remove gen_helper_1e2i()=0D
  target/mips: Use tcg_constant_i32() in gen_helper_0e2i()=0D
  target/mips: Simplify gen_helper() macros by using tcg_constant_i32()=0D
  target/mips: Inline gen_helper_1e1i() call in op_ld_INSN() macros=0D
  target/mips: Inline gen_helper_0e0i()=0D
  target/mips: Use tcg_constant_i32() in generate_exception_err()=0D
  target/mips: Define gen_helper() macros in translate.h=0D
  target/mips: Call cpu_is_bigendian & inline GET_OFFSET in ld/st=0D
    helpers=0D
  target/mips: Replace GET_LMASK() macro by get_lmask(32) function=0D
  target/mips: Replace GET_LMASK64() macro by get_lmask(64) function=0D
  target/mips: Store CP0_Config0 in DisasContext=0D
  target/mips: Replace TARGET_WORDS_BIGENDIAN by cpu_is_bigendian()=0D
=0D
 target/mips/helper.h                          |  18 +-=0D
 target/mips/tcg/translate.h                   |  27 ++=0D
 target/mips/tcg/vr54xx_helper.h.inc           |  24 ++=0D
 target/mips/tcg/mips64r6.decode               |  27 --=0D
 target/mips/tcg/msa.decode                    |   4 +-=0D
 .../mips/tcg/{mips32r6.decode =3D> rel6.decode} |  17 +-=0D
 target/mips/tcg/tx79.decode                   |  14 +-=0D
 target/mips/tcg/vr54xx.decode                 |  27 ++=0D
 target/mips/tcg/ldst_helper.c                 | 122 +++++----=0D
 target/mips/tcg/msa_translate.c               |   4 +-=0D
 target/mips/tcg/op_helper.c                   | 118 --------=0D
 target/mips/tcg/rel6_translate.c              |  20 +-=0D
 target/mips/tcg/translate.c                   | 258 ++++--------------=0D
 target/mips/tcg/tx79_translate.c              |  62 ++---=0D
 target/mips/tcg/vr54xx_helper.c               | 142 ++++++++++=0D
 target/mips/tcg/vr54xx_translate.c            |  72 +++++=0D
 target/mips/cpu-defs.c.inc                    |   6 +-=0D
 target/mips/tcg/nanomips_translate.c.inc      |  20 +-=0D
 target/mips/tcg/meson.build                   |   6 +-=0D
 19 files changed, 502 insertions(+), 486 deletions(-)=0D
 create mode 100644 target/mips/tcg/vr54xx_helper.h.inc=0D
 delete mode 100644 target/mips/tcg/mips64r6.decode=0D
 rename target/mips/tcg/{mips32r6.decode =3D> rel6.decode} (64%)=0D
 create mode 100644 target/mips/tcg/vr54xx.decode=0D
 create mode 100644 target/mips/tcg/vr54xx_helper.c=0D
 create mode 100644 target/mips/tcg/vr54xx_translate.c=0D
=0D
-- =0D
2.31.1=0D
=0D

