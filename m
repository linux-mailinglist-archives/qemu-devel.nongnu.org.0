Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2D92F4F9E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:13:47 +0100 (CET)
Received: from localhost ([::1]:43776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzimI-0004j7-Pd
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikH-00034r-Jw; Wed, 13 Jan 2021 11:11:41 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39938
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikF-0001JN-M2; Wed, 13 Jan 2021 11:11:41 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzikJ-0001mR-1Y; Wed, 13 Jan 2021 16:11:47 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Wed, 13 Jan 2021 16:11:21 +0000
Message-Id: <20210113161128.3156-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/7] qemu-macppc queue 20210113
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99bc0:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210112-1' into staging (2021-01-12 21:23:25 +0000)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-macppc-20210113

for you to fetch changes up to 7b3180f9110e1cee00e9acb36cb4d16bd7efabee:

  macio: don't set user_creatable to false (2021-01-13 12:21:21 +0000)

----------------------------------------------------------------
qemu-macppc updates

----------------------------------------------------------------
Mark Cave-Ayland (7):
      mac_oldworld: remove duplicate bus check for PPC_INPUT(env)
      mac_oldworld: move initialisation of grackle before heathrow
      macio: move heathrow PIC inside macio-oldworld device
      mac_newworld: delay wiring of PCI IRQs in New World machine
      macio: move OpenPIC inside macio-newworld device
      macio: wire macio GPIOs to OpenPIC using sysbus IRQs
      macio: don't set user_creatable to false

 hw/misc/macio/gpio.c          | 24 +++-----------
 hw/misc/macio/macio.c         | 53 +++++++++++++++---------------
 hw/ppc/mac_newworld.c         | 71 +++++++++++++++++++++-------------------
 hw/ppc/mac_oldworld.c         | 76 +++++++++++++++++++------------------------
 include/hw/misc/macio/gpio.h  |  2 --
 include/hw/misc/macio/macio.h |  4 +--
 6 files changed, 104 insertions(+), 126 deletions(-)

