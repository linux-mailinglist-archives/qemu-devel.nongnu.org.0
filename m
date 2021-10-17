Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D337430CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:58:04 +0200 (CEST)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF6R-0002kH-Lr
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1d-00034p-Rs
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1P-0008Dd-1W
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so8600508wmd.5
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EubozS6eorePaHNWwSNiJgdqz/TZNbw8GbHpGk8Sesg=;
 b=EFgXvloVkA5Ef0wLekX4j+skYSRy4iK4+lF8Wycng58WXX3BDeBHI1MgcooK6V1i3l
 z/JfDznKcC0XAwRde7F09q+Qbw6QbSa/ZlU82wstb7hXvUw9iNGo/nx3b8oeuVLLvx9w
 LjuRo6T2aj870g2wMGamGArvxEHJWYViggMCaoLUq0gQcavUw1CqB2hH6Y2Pl42kAILg
 WtfvirFHaIfW7xeu4u4d0G5L7rreT5bABUjhdRio2xOHnl8/4Du/ZQ/IPAwaKlzkAarh
 yDSXs+uqn0xfvPCZcZmpIo9VC+Iz/jGSC9hku74G3AblTchcliXUev3kxedNX7XR/ggl
 c/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EubozS6eorePaHNWwSNiJgdqz/TZNbw8GbHpGk8Sesg=;
 b=09EUusbt8+dxbmAGOWF9NcsR8y+ZIlReZvAIbl7v09Y3+uuEcWV43zBpmoKjoxm1Tc
 cZiq/Fl3ZqHKG0Oq1W9RmH7mNXcG2cgXojr+iCzhb8EWEglD8m3ldbWSkooKKTRLmS71
 HDg6B/URPigo4EJSkqCJ3kAqA3hlPBwTD+ee0ff1xI3prNfFYXd8prp+jhETPiHlpY5q
 foppVH4D9Oput8cNzhgPHDoT1s82EgEUg1k9eCnbm+X2VxsWoxRgDOJr+D7MyGu21dDN
 6y0ylmMOSQ+H23ciGp6ZQEAxBHoetpN9iKk5QLCh2wPOdN/yQoGYMMebHEKelH3p0VwP
 m8KQ==
X-Gm-Message-State: AOAM531muyYXamp2nUSuD7suYQ48dj8xAq/gqm4xUar3/rOL/KquW51p
 vRtf2eyzmmjWrzesZsdvL3178krw8zY=
X-Google-Smtp-Source: ABdhPJxnfw7pYvAzdBtdLgsKzQG7ecldoo94ra5eK+AVfVGfVHQZlcYBto5S4iErUHfJHlOSdHNSNA==
X-Received: by 2002:a1c:6a11:: with SMTP id f17mr27346391wmc.132.1634511168216; 
 Sun, 17 Oct 2021 15:52:48 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k22sm10947852wrd.59.2021.10.17.15.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:52:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] MIPS patches for 2021-10-18
Date: Mon, 18 Oct 2021 00:52:28 +0200
Message-Id: <20211017225245.2618892-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c148a0572130ff485cd2249fbdd1a3260d5e10a4=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211016' into st=
aging (2021-10-16 11:16:28 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-20211018=0D
=0D
for you to fetch changes up to 2792cf20ca7eed0e354a0ed731422411faca4908:=0D
=0D
  via-ide: Avoid using isa_get_irq() (2021-10-18 00:41:36 +0200)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
Hardware emulation:=0D
- Generate FDT blob for Boston machine (Jiaxun)=0D
- VIA chipset cleanups (Zoltan)=0D
=0D
TCG:=0D
- Use tcg_constant() in Compact branch and MSA opcodes=0D
- Restrict nanoMIPS DSP MULT[U] opcode accumulator to Rel6=0D
- Fix DEXTRV_S.H DSP opcode=0D
- Remove unused TCG temporary for some DSP opcodes=0D
=0D
----------------------------------------------------------------=0D
=0D
BALATON Zoltan (4):=0D
  via-ide: Set user_creatable to false=0D
  vt82c686: Move common code to via_isa_realize=0D
  vt82c686: Add a method to VIA_ISA to raise ISA interrupts=0D
  via-ide: Avoid using isa_get_irq()=0D
=0D
Jiaxun Yang (3):=0D
  hw/mips/boston: Massage memory map information=0D
  hw/mips/boston: Allow loading elf kernel and dtb=0D
  hw/mips/boston: Add FDT generator=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  target/mips: Check nanoMIPS DSP MULT[U] accumulator with Release 6=0D
  target/mips: Remove unused register from MSA 2R/2RF instruction format=0D
  target/mips: Use tcg_constant_i32() in gen_msa_elm_df()=0D
  target/mips: Use tcg_constant_i32() in gen_msa_2rf()=0D
  target/mips: Use tcg_constant_i32() in gen_msa_2r()=0D
  target/mips: Use tcg_constant_i32() in gen_msa_3rf()=0D
  target/mips: Use explicit extract32() calls in gen_msa_i5()=0D
  target/mips: Use tcg_constant_tl() in gen_compute_compact_branch()=0D
  target/mips: Fix DEXTRV_S.H DSP opcode=0D
  target/mips: Remove unused TCG temporary in gen_mipsdsp_accinsn()=0D
=0D
 include/hw/isa/vt82c686.h                |   4 +=0D
 hw/ide/via.c                             |   7 +-=0D
 hw/isa/vt82c686.c                        |  75 +++--=0D
 hw/mips/boston.c                         | 371 +++++++++++++++++++++--=0D
 target/mips/tcg/msa_translate.c          |  51 ++--=0D
 target/mips/tcg/translate.c              |  11 +-=0D
 target/mips/tcg/nanomips_translate.c.inc |   6 +=0D
 7 files changed, 415 insertions(+), 110 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

