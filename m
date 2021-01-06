Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA32EBD72
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:07:49 +0100 (CET)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7bQ-0005uH-6C
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7ZU-0004af-7z
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:05:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57824
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7ZS-00026u-BH
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:05:47 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7ZS-0006Sn-Pg; Wed, 06 Jan 2021 12:05:51 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  6 Jan 2021 12:05:22 +0000
Message-Id: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/4] qemu-sparc queue 20210106
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2e0b5bbe813930021b2baab03c9d424c1c52d18b:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20210104' into staging (2021-01-05 21:06:42 +0000)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20210106

for you to fetch changes up to a879306ca14de576d3a5dd51f830ebf89753e223:

  sun4m: don't connect two qemu_irqs directly to the same input (2021-01-06 11:41:37 +0000)

----------------------------------------------------------------
qemu-sparc queue

----------------------------------------------------------------
Mark Cave-Ayland (1):
      sun4m: don't connect two qemu_irqs directly to the same input

Peter Maydell (2):
      hw/sparc: Make grlib-irqmp device handle its own inbound IRQ lines
      include/hw/sparc/grlib.h: Remove unused set_pil_in_fn typedef

Philippe Mathieu-Daudé (1):
      hw/timer/slavio_timer: Allow 64-bit accesses

 hw/intc/grlib_irqmp.c    |  5 ++++-
 hw/sparc/Kconfig         |  1 +
 hw/sparc/leon3.c         | 21 +++++++++------------
 hw/sparc/sun4m.c         | 24 +++++++++++++++++++-----
 hw/timer/slavio_timer.c  |  4 ++++
 include/hw/sparc/grlib.h |  4 ----
 6 files changed, 37 insertions(+), 22 deletions(-)

