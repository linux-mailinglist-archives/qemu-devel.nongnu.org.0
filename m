Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC215355BB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:41:22 +0200 (CEST)
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLEP-0003CO-AI
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBi-0000OR-LP; Thu, 26 May 2022 17:38:34 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBg-00083Y-O2; Thu, 26 May 2022 17:38:34 -0400
Received: by mail-oi1-x234.google.com with SMTP id w130so3712565oig.0;
 Thu, 26 May 2022 14:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+265CD1fyHd8Dug5PVJEMdPmIWSw1ZOc2XF7Bzxaioc=;
 b=h1g5bnXbeXRc6JRaqvzOh1KPGPEsoQe7bzbGZ3ZQkWB5BjZPD0iq/1QMMfm8s9mS5t
 9jcHerR7Fw7ESTWD/4shW6JVKhGuc7aV8n9oMPj0L7tLyKeZLPrwJzl19trsc136Op5t
 UcyBaXJ/T3OIJO3bKnxpDvmJK/JgJwJgFLHsz1mccEqWyi6DsjCnbkoOFxaQxsP5k4XX
 nZ0w0gjdrBGsJtkI7giPkSHQD8rtMyB3DEQMiqQXzWvjm2C2nHNdlBKWQGC4nKwMH5OU
 7QxqEtrZB4+K5cVxzMZ5OLP6VaDERdFTs7TisFanNEVS5EP1c1ve17ZX3iIZsQIQQj0L
 n6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+265CD1fyHd8Dug5PVJEMdPmIWSw1ZOc2XF7Bzxaioc=;
 b=rhohBczIB2+f0Nie0bt2rMB8wVKGraq4R3Nvz3JrNgA+h0l/4EYKVkzPKanvhvFxi8
 eXWbxuHqZc13Gd6YYqiDYT0+mCAnOQvMg37JXoaZWANyrwjHTjlvFvJ6fxvAgxBbawWZ
 8gVemkGKDZIn61ffmQtiuvBYFo1FUMzp4Icb96uPQHBXlmIbbOsdWc3w+VZWccjCfzwe
 JzOB+b2iIfIF7fW9UwmeHIR9Tn6yIOPynfOfbjkRjiG/sJjopmeJmIxZihj9FOfe3onK
 iGUfltplazYo4mUApXM5SCu+UCOLDL8ILuc05011+F6Ha6dyBtxCT1hHhk8q9O0WLuFV
 3Fzg==
X-Gm-Message-State: AOAM532jrEi1blrEqeWuLOyyt5B6Xv5q4oBPbbzzvh4rG11q/m8N9Hp0
 Ao1NrZEg1M15zNPHpoy6G6otxSH/yVA=
X-Google-Smtp-Source: ABdhPJxPEIIOkEJHizH4HIQLheS/p4OusVM2FSFdhvEo6+G0AmgsTzG+dCA1tB5WYZ70Z4Z9zYf8ng==
X-Received: by 2002:a05:6808:15aa:b0:32b:7fab:3722 with SMTP id
 t42-20020a05680815aa00b0032b7fab3722mr2407104oiw.19.1653601111068; 
 Thu, 26 May 2022 14:38:31 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 00/34] ppc queue
Date: Thu, 26 May 2022 18:37:41 -0300
Message-Id: <20220526213815.92701-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 2417cbd5916d043e0c56408221fbe9935d0bc8da:

  Merge tag 'ak-pull-request' of https://gitlab.com/berrange/qemu into staging (2022-05-26 07:00:04 -0700)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220526

for you to fetch changes up to 96c343cc774b52b010e464a219d13f8e55e1003f:

  linux-user: Add PowerPC ISA 3.1 and MMA to hwcap (2022-05-26 17:11:33 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-05-26:

Most of the changes are enhancements/fixes made in TCG ppc emulation
code. Several bugs fixes were made across the board as well.

Changes include:

- tcg and target/ppc: VSX MMA implementation, fixes in helper
declarations to use call flags, memory ordering, tlbie and others
- pseries: fixed stdout-path setting with -machine graphics=off
- pseries: allow use of elf parser for kernel address
- other assorted fixes and improvements

----------------------------------------------------------------
Alexey Kardashevskiy (2):
      spapr: Use address from elf parser for kernel address
      spapr/docs: Add a few words about x-vof

Bernhard Beschow (1):
      hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE

Frederic Barrat (1):
      pnv/xive2: Don't overwrite PC registers when writing TCTXT registers

Joel Stanley (1):
      linux-user: Add PowerPC ISA 3.1 and MMA to hwcap

Leandro Lupori (1):
      target/ppc: Fix tlbie

Lucas Mateus Castro (alqotel) (7):
      target/ppc: Implement xxm[tf]acc and xxsetaccz
      target/ppc: Implemented xvi*ger* instructions
      target/ppc: Implemented pmxvi*ger* instructions
      target/ppc: Implemented xvf*ger*
      target/ppc: Implemented xvf16ger*
      target/ppc: Implemented pmxvf*ger*
      target/ppc: Implemented [pm]xvbf16ger2*

Matheus Ferst (12):
      target/ppc: declare darn32/darn64 helpers with TCG_CALL_NO_RWG
      target/ppc: use TCG_CALL_NO_RWG in vector helpers without env
      target/ppc: use TCG_CALL_NO_RWG in BCD helpers
      target/ppc: use TCG_CALL_NO_RWG in VSX helpers without env
      target/ppc: Use TCG_CALL_NO_RWG_SE in fsel helper
      target/ppc: declare xscvspdpn helper with call flags
      target/ppc: declare xvxsigsp helper with call flags
      target/ppc: declare xxextractuw and xxinsertw helpers with call flags
      target/ppc: introduce do_va_helper
      target/ppc: declare vmsum[um]bm helpers with call flags
      target/ppc: declare vmsumuh[ms] helper with call flags
      target/ppc: declare vmsumsh[ms] helper with call flags

Murilo Opsfelder Araujo (1):
      mos6522: fix linking error when CONFIG_MOS6522 is not set

Nicholas Piggin (4):
      target/ppc: Fix eieio memory ordering semantics
      tcg/ppc: ST_ST memory ordering is not provided with eieio
      tcg/ppc: Optimize memory ordering generation with lwsync
      target/ppc: Implement lwsync with weaker memory ordering

Paolo Bonzini (1):
      pseries: allow setting stdout-path even on machines with a VGA

Víctor Colombo (3):
      target/ppc: Fix FPSCR.FI bit being cleared when it shouldn't
      target/ppc: Fix FPSCR.FI changing in float_overflow_excp()
      target/ppc: Rename sfprf to sfifprf where it's also used as set fi flag

 docs/system/ppc/pseries.rst         |  29 ++
 hmp-commands-info.hx                |   2 +-
 hw/intc/pnv_xive2.c                 |   3 -
 hw/ppc/e500.c                       |   1 -
 hw/ppc/spapr.c                      |  25 +-
 include/hw/ppc/spapr.h              |   2 +-
 linux-user/elfload.c                |   4 +
 monitor/misc.c                      |   3 +
 target/ppc/cpu.h                    |  19 +-
 target/ppc/cpu_init.c               |  13 +-
 target/ppc/fpu_helper.c             | 571 ++++++++++++++++++++++++++++--------
 target/ppc/helper.h                 | 259 +++++++++-------
 target/ppc/helper_regs.c            |   2 +-
 target/ppc/insn32.decode            |  80 ++++-
 target/ppc/insn64.decode            |  79 +++++
 target/ppc/int_helper.c             | 152 +++++++++-
 target/ppc/internal.h               |  15 +
 target/ppc/machine.c                |   3 +-
 target/ppc/translate.c              |  35 ++-
 target/ppc/translate/fp-impl.c.inc  |  30 +-
 target/ppc/translate/fp-ops.c.inc   |   1 -
 target/ppc/translate/vmx-impl.c.inc |  54 ++--
 target/ppc/translate/vmx-ops.c.inc  |   4 -
 target/ppc/translate/vsx-impl.c.inc | 237 ++++++++++++---
 target/ppc/translate/vsx-ops.c.inc  |   4 -
 tcg/ppc/tcg-target.c.inc            |  12 +-
 26 files changed, 1286 insertions(+), 353 deletions(-)

