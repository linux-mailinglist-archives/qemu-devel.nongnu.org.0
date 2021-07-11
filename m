Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D23C3F5F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:03:43 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gc2-0000qW-Nn
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gYx-0006J3-2D
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gYt-0000LU-LI
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l7so21143704wrv.7
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6+oCy6N9DbRMvh6urgyVCCk1HRQVPLMli5DjnYv5Qn0=;
 b=iSLZpN2WF0mrgxjUPIRqeeXRrj2S9WxDofVJln1h5Se+RJnsuey7HkNgS6AdQCigU5
 8gUwqPk3JLJHc6DCmXPyg7EvtpCyYOV0O85EUYM3wO0OSI1jPUxWU0Aup/A6JvQlxk1k
 zYAqTdxFq/Dh2RbNv7LKcy91cJecgezLiPQ2tA7xvRFvagRp3wQ8fffoir2TwLYN2V2x
 mUk8FLS255ZwHe4JucONjskoawfEZuu9D3iWeoVHkrPJL4uMkMcDWOKVm7BeMfNL3e/1
 a5wa2tQPVH6KXkgNPfOWINZCkTd4ODSFViwnr37MOD+EaKV+5crSomekLpHmpfKu7fF5
 dSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6+oCy6N9DbRMvh6urgyVCCk1HRQVPLMli5DjnYv5Qn0=;
 b=JE8iuMiVpA9IUkoRL6D56eAuFo45+7lUJWuh9cAK4Q53I7Or/I5AzDSal+duqvgTlS
 2jNAw/riJi8U5kkTeLtLJr7SJDFVRxif1o6HoI7ztApx1vIE2ql9e/Sf8lXl+i+2RICw
 /qORcoNo4wB5+ocHYid7FqPtV6rfoI2Aqr5C6F8Ro2idAxXtcBmohquy5X5hTFfE9Kk4
 X1d0ldm6Ua26KLvCL9ibOy23jNpGHcUXtvt/oEx8ioALD7ADD7FaywupuE7ZkFr0vp2O
 /MFmFxfvOCtvjL82vINXu25P/WHVypFptyRBdaOre9za/ilL/iUrBXmLjF0W74w095k9
 GBIg==
X-Gm-Message-State: AOAM532ccIceYgVM3Nl3CZd9uUQ0U70vPL9KkSCcn8JgeKXqIbU/EGbG
 NrLNPBBqDy+nwuwTIRUwBp4j+HDoX/2rX4yi
X-Google-Smtp-Source: ABdhPJzDvtE7SWEz648Bf0FqTq31BRQZPQwD4ITmLYzf7PYykfrVTjUkfQCX32hq1V7zM8CCxtRlcw==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr36595819wrg.65.1626037225440; 
 Sun, 11 Jul 2021 14:00:25 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id t11sm12294878wrz.7.2021.07.11.14.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] MIPS patches for 2021-07-11
Date: Sun, 11 Jul 2021 22:59:57 +0200
Message-Id: <20210711210016.2710100-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed79827=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' into =
staging (2021-07-11 14:32:49 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/mips-next-20210711=0D
=0D
for you to fetch changes up to 39d9919f4b4c3e7f230efd7d845439d6d732dc89:=0D
=0D
  dp8393x: don't force 32-bit register access (2021-07-11 22:29:54 +0200)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Rename Raven ASIC PCI bridge, add PCI_IO_BASE_ADDR definition=0D
- Various Toshiba TX79 opcodes implemented=0D
- Rewrite UHI errno_mips() using switch statement=0D
- Few fixes and improvements in the SONIC model (dp8393x)=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (2):=0D
  dp8393x: fix CAM descriptor entry index=0D
  dp8393x: don't force 32-bit register access=0D
=0D
Philippe Mathieu-Daud=C3=A9 (17):=0D
  hw/pci-host: Rename Raven ASIC PCI bridge as raven.c=0D
  hw/pci-host/raven: Add PCI_IO_BASE_ADDR definition=0D
  target/mips/tx79: Introduce PAND/POR/PXOR/PNOR opcodes (parallel=0D
    logic)=0D
  target/mips/tx79: Introduce PSUB* opcodes (Parallel Subtract)=0D
  target/mips/tx79: Introduce PEXTUW (Parallel Extend Upper from Word)=0D
  target/mips/tx79: Introduce PEXTL[BHW] opcodes (Parallel Extend Lower)=0D
  target/mips/tx79: Introduce PCEQ* opcodes (Parallel Compare for Equal)=0D
  target/mips/tx79: Introduce PCGT* (Parallel Compare for Greater Than)=0D
  target/mips/tx79: Introduce PPACW opcode (Parallel Pack to Word)=0D
  target/mips/tx79: Introduce PROT3W opcode (Parallel Rotate 3 Words)=0D
  target/mips/tx79: Introduce LQ opcode (Load Quadword)=0D
  target/mips/tx79: Introduce SQ opcode (Store Quadword)=0D
  target/mips: Rewrite UHI errno_mips() using switch statement=0D
  dp8393x: Replace address_space_rw(is_write=3D1) by address_space_write()=
=0D
  dp8393x: Replace 0x40 magic value by SONIC_REG_COUNT definition=0D
  dp8393x: Store CAM registers as 16-bit=0D
  dp8393x: Rewrite dp8393x_get() / dp8393x_put()=0D
=0D
 target/mips/tcg/tx79.decode        |  34 +++=0D
 hw/net/dp8393x.c                   | 208 +++++++---------=0D
 hw/pci-host/{prep.c =3D> raven.c}    |  11 +-=0D
 target/mips/tcg/sysemu/mips-semi.c |  24 +-=0D
 target/mips/tcg/translate.c        |  16 +-=0D
 target/mips/tcg/tx79_translate.c   | 382 +++++++++++++++++++++++++++++=0D
 MAINTAINERS                        |   2 +-=0D
 hw/pci-host/Kconfig                |   2 +-=0D
 hw/pci-host/meson.build            |   2 +-=0D
 hw/ppc/Kconfig                     |   2 +-=0D
 10 files changed, 526 insertions(+), 157 deletions(-)=0D
 rename hw/pci-host/{prep.c =3D> raven.c} (97%)=0D
=0D
-- =0D
2.31.1=0D
=0D

