Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9899B5D814
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 00:31:57 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiRJc-0007WQ-1Y
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 18:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6x-0006s0-UR
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6v-0002kO-UP
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:51 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:44560
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR6r-0002EI-MI
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:47 -0400
Received: from host109-146-132-17.range109-146.btcentralplus.com
 ([109.146.132.17] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR3n-0004bu-9m; Tue, 02 Jul 2019 23:15:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 23:16:00 +0100
Message-Id: <20190702221606.21600-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
X-SA-Exim-Connect-IP: 109.146.132.17
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PULL 0/6] qemu-sparc queue 20190702
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 506179e42112be77bfd071f050b15762d3b2cd43:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190702' into staging (2019-07-02 18:56:44 +0100)

are available in the git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20190702

for you to fetch changes up to 09340f497e96a62d076b2f223e7b16a7358cfecb:

  sunhme: ensure that RX descriptor ring overflow is indicated to client driver (2019-07-02 22:49:08 +0100)

----------------------------------------------------------------
qemu-sparc queue

----------------------------------------------------------------
Mark Cave-Ayland (6):
      sun4m: set default display type to TCX
      sunhme: add trace event for logging PCI IRQ
      sunhme: fix incorrect constant in sunhme_can_receive()
      sunhme: flush any queued packets when HME_MAC_RXCFG_ENABLE bit is raised
      sunhme: fix return values from sunhme_receive() during receive packet processing
      sunhme: ensure that RX descriptor ring overflow is indicated to client driver

 hw/net/sunhme.c     | 29 +++++++++++++++++++++++++----
 hw/net/trace-events |  2 ++
 hw/sparc/sun4m.c    |  9 +++++++++
 3 files changed, 36 insertions(+), 4 deletions(-)

