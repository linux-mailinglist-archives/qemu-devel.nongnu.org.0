Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578A933A51F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 14:59:44 +0100 (CET)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLRHT-0006NT-Bm
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 09:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF1-00038D-0M
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:11 -0400
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLREy-00030F-GD
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mw+ZLWM0bQqQfZ2U+uApqCFrNOKerXk5nI7UGF8oVdA=; b=oj0gctYTmfKg70mOuz8ITeR64K
 afcsyaa5pOzZ11/VAvB7tACh1B3R/qeAflo7DICCnNi68nTpBw8I7eYTwUajk3VTOU+sPCXe3kuLe
 A/iogq6AXBcFRTv3jdTwcJNnKIZadaUfSYQfb+m5T4opg1JJ9p1iD47eeGz98zBIyZw8=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] tricore queue
Date: Sun, 14 Mar 2021 14:55:06 +0100
Message-Id: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.14.134815, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=31367606, da=103339287,
 mc=561, sc=4, hc=557, sp=0, fso=31367606, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kbastian@mail.uni-paderborn.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8e6bc6cdc82d45f203bc9fc4342c0452214c74fe:

  Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-request' into staging (2021-03-12 18:56:56 +0000)

are available in the Git repository at:

  https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20210314

for you to fetch changes up to a21993c7f98862823280d1eb6d3e93cf6267896f:

  target/tricore: Fix OPC2_32_RRPW_EXTR for width=0 (2021-03-14 14:49:01 +0100)

----------------------------------------------------------------
- Added triboard with tc27x_soc
- Cleaned up get_physical_address()
- Fixed corner case bugs in OPC2_32_RRPW_IMASK and OPC2_32_RRPW_IMASK
  insns

----------------------------------------------------------------
Andreas Konopik (2):
      tricore: added triboard with tc27x_soc
      tricore: fixed faulty conditions for extr and imask

Bastian Koppelmann (2):
      target/tricore: Fix imask OPC2_32_RRPW_IMASK for r3+1 == r2
      target/tricore: Fix OPC2_32_RRPW_EXTR for width=0

Philippe Mathieu-Daudé (3):
      target/tricore: Replace magic value by MMU_DATA_LOAD definition
      target/tricore: Pass MMUAccessType to get_physical_address()
      target/tricore: Remove unused definitions

 default-configs/devices/tricore-softmmu.mak |   2 +-
 hw/tricore/Kconfig                          |   8 +
 hw/tricore/meson.build                      |   2 +
 hw/tricore/tc27x_soc.c                      | 246 ++++++++++++++++++++++++++++
 hw/tricore/triboard.c                       |  98 +++++++++++
 include/hw/tricore/tc27x_soc.h              | 129 +++++++++++++++
 include/hw/tricore/triboard.h               |  50 ++++++
 target/tricore/cpu.h                        |  12 --
 target/tricore/helper.c                     |   9 +-
 target/tricore/translate.c                  |  21 ++-
 10 files changed, 554 insertions(+), 23 deletions(-)
 create mode 100644 hw/tricore/tc27x_soc.c
 create mode 100644 hw/tricore/triboard.c
 create mode 100644 include/hw/tricore/tc27x_soc.h
 create mode 100644 include/hw/tricore/triboard.h

