Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456D68EAC6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:15:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgXJ-0003NU-9y; Wed, 08 Feb 2023 04:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXB-0003Lt-CL
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:33 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgX8-0007my-OQ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TdfxPAUtdQeyYjt8hn6b5dRbQOPprWO17ynnsSw7D0k=; b=a4XqQQ9o5Xpm1pZg7cY+VWb31m
 YJE9Sgdio/6DQx30c9NRR+4LqBRuygVzlM+/xg4pLZDr36DWp9ofw+3W/xXGGe+whYcNDiudEe1xL
 CO4GVaPKA8gZBH0MqYFrecIWzHK3vCt2tk+S6vY+dhs1+yladndW2TbhX0zrRscbZrcc=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/12] tricore queue
Date: Wed,  8 Feb 2023 10:14:10 +0100
Message-Id: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778816, da=163456732, mc=11, sc=0,
 hc=11, sp=0, fso=778816, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.90317, AntiVirus-Engine: 5.97.0,
 AntiVirus-Data: 2023.2.8.5970000
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 969d09c3a6186c0a4bc8a41db0c1aba1c76081fc:

  Merge tag 'pull-aspeed-20230207' of https://github.com/legoater/qemu into staging (2023-02-07 20:13:38 +0000)

are available in the Git repository at:

  https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20230208

for you to fetch changes up to 6e34f54d88184b25db4fbc4dd1665d9be1a9e21c:

  tests/tcg/tricore: Add test for ld.h (2023-02-08 10:02:46 +0100)

----------------------------------------------------------------
tricore insn bugfixes for qemu 8.0

----------------------------------------------------------------
Anton Kochkov (1):
      target/tricore: Fix OPC1_16_SRO_LD_H translation

Bastian Koppelmann (11):
      target/tricore: Fix OPC2_32_RCRW_IMASK translation
      tests/tcg/tricore: Add test for OPC2_32_RCRW_IMASK
      target/tricore: Fix OPC2_32_RCRW_INSERT translation
      tests/tcg/tricore: Add test for OPC2_32_RCRW_INSERT
      target/tricore: Fix RRPW_DEXTR
      tests/tcg/tricore: Add tests for RRPW_DEXTR
      target/tricore: Fix OPC2_32_RRRR_DEXTR
      tests/tcg/tricore: Add OPC2_32_RRRR_DEXTR tests
      target/tricore: Fix OPC2_32_BO_LD_BU_PREINC
      tests/tcg/tricore: Add LD.BU tests
      tests/tcg/tricore: Add test for ld.h

 target/tricore/translate.c                | 41 +++++++++--------
 tests/tcg/tricore/Makefile.softmmu-target |  5 ++
 tests/tcg/tricore/macros.h                | 76 +++++++++++++++++++++++++++++--
 tests/tcg/tricore/test_dextr.S            | 75 ++++++++++++++++++++++++++++++
 tests/tcg/tricore/test_imask.S            | 10 ++++
 tests/tcg/tricore/test_insert.S           |  9 ++++
 tests/tcg/tricore/test_ld_bu.S            | 15 ++++++
 tests/tcg/tricore/test_ld_h.S             | 15 ++++++
 8 files changed, 223 insertions(+), 23 deletions(-)
 create mode 100644 tests/tcg/tricore/test_dextr.S
 create mode 100644 tests/tcg/tricore/test_imask.S
 create mode 100644 tests/tcg/tricore/test_insert.S
 create mode 100644 tests/tcg/tricore/test_ld_bu.S
 create mode 100644 tests/tcg/tricore/test_ld_h.S

