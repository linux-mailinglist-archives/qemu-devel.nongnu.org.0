Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00C2922EA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 09:21:51 +0200 (CEST)
Received: from localhost ([::1]:35558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUPUM-0005NF-SC
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 03:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUPTG-0004kP-KQ; Mon, 19 Oct 2020 03:20:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33312
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUPTE-0004vU-GS; Mon, 19 Oct 2020 03:20:42 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUPTD-00067O-Ar; Mon, 19 Oct 2020 08:20:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, atar4qemu@gmail.com
Date: Mon, 19 Oct 2020 08:20:27 +0100
Message-Id: <20201019072027.5965-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL v2 00/13] qemu-macppc queue 20201019
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

The following changes since commit e12ce85b2c79d83a340953291912875c30b3af06:

  Merge remote-tracking branch 'remotes/ehabkost/tags/x86-next-pull-request' into staging (2020-10-16 22:46:28 +0100)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-macppc-20201019

for you to fetch changes up to bb997e5c967b3b6f19f1461811df6317ed37c5ff:

  mac_oldworld: Change PCI address of macio to match real hardware (2020-10-19 08:11:21 +0100)

----------------------------------------------------------------
qemu-macppc updates

----------------------------------------------------------------
BALATON Zoltan (5):
      mac_oldworld: Allow loading binary ROM image
      mac_newworld: Allow loading binary ROM image
      mac_oldworld: Drop a variable, use get_system_memory() directly
      mac_oldworld: Drop some variables
      mac_oldworld: Change PCI address of macio to match real hardware

Mark Cave-Ayland (8):
      macio: don't reference serial_hd() directly within the device
      grackle: use qdev gpios for PCI IRQs
      uninorth: use qdev gpios for PCI IRQs
      m48t59-isa: remove legacy m48t59_init_isa() function
      sun4m: use qdev properties instead of legacy m48t59_init() function
      sun4u: use qdev properties instead of legacy m48t59_init() function
      ppc405_boards: use qdev properties instead of legacy m48t59_init() function
      m48t59: remove legacy m48t59_init() function

 hw/misc/macio/macio.c          |  4 ---
 hw/pci-host/grackle.c          | 19 ++--------
 hw/pci-host/uninorth.c         | 45 +++++-------------------
 hw/ppc/mac.h                   |  2 --
 hw/ppc/mac_newworld.c          | 52 ++++++++++++++++++---------
 hw/ppc/mac_oldworld.c          | 80 ++++++++++++++++++++++++++----------------
 hw/ppc/ppc405_boards.c         | 10 +++++-
 hw/rtc/m48t59-isa.c            | 25 -------------
 hw/rtc/m48t59.c                | 35 ------------------
 hw/sparc/sun4m.c               | 10 ++++--
 hw/sparc64/sun4u.c             |  7 ++--
 include/hw/pci-host/uninorth.h |  2 --
 include/hw/rtc/m48t59.h        |  6 ----
 13 files changed, 118 insertions(+), 179 deletions(-)

