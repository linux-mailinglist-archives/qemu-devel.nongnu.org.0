Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A803B1A50
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:38:41 +0200 (CEST)
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw29Q-0004TS-TC
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lw25M-0008CJ-Ji
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:34:28 -0400
Received: from mail07.asahi-net.or.jp ([202.224.55.47]:40174)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lw25K-0000s1-Hw
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:34:28 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail07.asahi-net.or.jp (Postfix) with ESMTPA id CB87EC1C8F;
 Wed, 23 Jun 2021 21:34:22 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (z215167.dynamic.ppp.asahi-net.or.jp [110.4.215.167])
 by sakura.ysato.name (Postfix) with ESMTPSA id C2CF11C04F4;
 Wed, 23 Jun 2021 21:34:21 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Integrate renesas MCU/SoC timer module
Date: Wed, 23 Jun 2021 21:34:13 +0900
Message-Id: <20210623123416.60038-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.47;
 envelope-from=ysato@users.sourceforge.jp; helo=mail07.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SH4 TMU and RX CMT have simler functions.
Integrate the sh_timer and renesas_cmt.

Yoshinori Sato (3):
  hw/timer: Add renesas_timer.
  hw/rx: rx62n switch renesas_timer.
  hw/sh4: sh7750 switch renesas_timer.

 include/hw/rx/rx62n.h            |   4 +-
 include/hw/timer/renesas_timer.h |  89 ++++++
 hw/sh4/sh7750.c                  |  32 +-
 hw/timer/renesas_timer.c         | 532 +++++++++++++++++++++++++++++++
 hw/rx/Kconfig                    |   2 +-
 hw/sh4/Kconfig                   |   2 +-
 hw/timer/Kconfig                 |   3 +-
 hw/timer/meson.build             |   1 +
 8 files changed, 657 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/timer/renesas_timer.h
 create mode 100644 hw/timer/renesas_timer.c

-- 
2.20.1


