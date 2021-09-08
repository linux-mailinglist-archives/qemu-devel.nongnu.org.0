Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD176403934
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 13:57:23 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwCg-0007qc-Op
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 07:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAZ-0005PC-ED
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:11 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59008
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAU-0005A8-73
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:11 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAN-0009u6-Mk; Wed, 08 Sep 2021 12:55:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  8 Sep 2021 12:54:39 +0100
Message-Id: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/12] qemu-sparc queue 20210908
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit abf7aee72ea66944a62962603e4c2381f5e473e7:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/s390x-pull-request-2021-09-07' into staging (2021-09-07 17:46:13 +0100)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20210908

for you to fetch changes up to 15a2a1a4d1eecc74a87e1552f5cc4e3668375715:

  escc: fix STATUS_SYNC bit in R_STATUS register (2021-09-08 11:09:45 +0100)

----------------------------------------------------------------
qemu-sparc queue

----------------------------------------------------------------
Mark Cave-Ayland (10):
      sun4m: fix setting CPU id when more than one CPU is present
      escc: checkpatch fixes
      escc: reset register values to zero in escc_reset()
      escc: introduce escc_soft_reset_chn() for software reset
      escc: introduce escc_hard_reset_chn() for hardware reset
      escc: implement soft reset as described in the datasheet
      escc: implement hard reset as described in the datasheet
      escc: remove register changes from escc_reset_chn()
      escc: re-use escc_reset_chn() for soft reset
      escc: fix STATUS_SYNC bit in R_STATUS register

Peter Maydell (2):
      target/sparc: Drop use of gen_io_end()
      tcg: Drop gen_io_end()

 docs/devel/tcg-icount.rst |   3 -
 hw/char/escc.c            | 263 +++++++++++++++++++++++++++++++---------------
 hw/char/trace-events      |   2 +
 hw/sparc/sun4m.c          |   2 +-
 include/exec/gen-icount.h |  27 ++---
 target/sparc/translate.c  |  25 ++---
 6 files changed, 202 insertions(+), 120 deletions(-)

