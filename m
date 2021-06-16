Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B43A95D7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:17:02 +0200 (CEST)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRfR-0000IB-LB
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1ltRbV-0004hK-Uu
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:57 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:57992)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1ltRbS-00048i-ON
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:57 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id B3E2E44A4C;
 Wed, 16 Jun 2021 18:12:50 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (z215167.dynamic.ppp.asahi-net.or.jp [110.4.215.167])
 by sakura.ysato.name (Postfix) with ESMTPSA id D0BA31C0015;
 Wed, 16 Jun 2021 18:12:49 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] renesas_sci update
Date: Wed, 16 Jun 2021 18:12:41 +0900
Message-Id: <20210616091244.33049-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_NONE=0.001,
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

Renesas SH/RX have various SCI in serial interface.
The design of sh_serial is old, so I integrate these SCIs with renesas_sci.

Yoshinori Sato (3):
  hw/char: renesas_sci: Refactor for merge all SCI variant..
  hw/char: renesas_sci Add SCI and SCIF support.
  hw/sh4: sh7750 using renesas_sci.

 include/hw/char/renesas_sci.h |  117 +++-
 include/hw/rx/rx62n.h         |    2 +-
 include/hw/sh4/sh.h           |    8 -
 hw/char/renesas_sci.c         | 1053 +++++++++++++++++++++++++++------
 hw/rx/rx62n.c                 |    2 +-
 hw/sh4/sh7750.c               |   41 ++
 hw/sh4/Kconfig                |    2 +-
 7 files changed, 1025 insertions(+), 200 deletions(-)

-- 
2.20.1


