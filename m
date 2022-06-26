Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DBF55B33F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:49:56 +0200 (CEST)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WOQ-0004Hu-QI
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKR-0001Nh-VU
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:45:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKP-0008KH-04
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WD1cjEL9fBjOVW6pembKCmEX1x4dHpBP31S1wt1kGLg=; b=v8ZyONRiWJRDKaO5oKmtWLXykH
 DF33Cgyh5eZTotX4iFuifz6UKRWJPwtNbpYQVruHRz18DkCIYikQbq3aeDCRiKwISYDEjMikYnkPl
 CZKu+gsVqWVoreszPbViuzpd4+2VeJQ0GCsMXUBSJ1hdbia+TNQFehQy3cQBgqOEY6VX0sR2v0wpI
 iDDmHfJfczHF9hHHfi/2rJG9Vnkf4ubo97KQrEg+E7Z1Hy85PAQf0faXLl3ka0zcb5eUZpb9J7p81
 7fm0hIuo7Ayk3VoihaSWLrHCqZU2NO9VArB4ZWT08iFXtBQMng4H+9BDusLc9sXb5KBt0+z/wZarf
 jvGPB/jdLBkL0A8pKbpYSRkCGuvp/Om+oYBLIESsFSFDFQ/uZ9HeteydzaIeWvNj6KCdAzqOAL47R
 DR60h0Gd7NmUm+Uz3gEIknMLMX3f/ZSzHieGKM6bpiVgz4Cb7wyO46syA8S3K2hXqr03ynL2r1/Vc
 Ya7fH6xqsDIYR3JF9JgkNhcpgLTm55NBLczpxHyMRfZk35M+vWV3narAWqrx06glbi+k9f6Iv7Djs
 4obfUQhL2cfJsygGcnp3fDJgql+QxTSlU0txlNFF6oiXG5Pn5aFj59E/dHirbj4DQhdjyJVNPR1fP
 DmgHPVmdPnjl25luAYkLON3jL71EOPSAy3nD6saE4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJ9-0007KY-T9; Sun, 26 Jun 2022 18:44:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:36 +0100
Message-Id: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/55] qemu-sparc queue 20220626
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 40d522490714b65e0856444277db6c14c5cc3796:

  Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-06-24 10:52:46 -0700)

are available in the Git repository at:

  https://github.com/mcayland/qemu.git tags/qemu-sparc-20220626

for you to fetch changes up to 39fbaeca096a9bf6cbe2af88572c1cb2aa62aa8c:

  artist: set memory region owners for buffers to the artist device (2022-06-26 18:40:28 +0100)

----------------------------------------------------------------
qemu-sparc queue
- This is the PS2 QOM part 1 series, along with the trivial artist patch

----------------------------------------------------------------
Mark Cave-Ayland (55):
      ps2: checkpatch fixes
      ps2: QOMify PS2State
      ps2: QOMify PS2KbdState
      ps2: QOMify PS2MouseState
      ps2: move QOM type definitions from ps2.c to ps2.h
      ps2: improve function prototypes in ps2.c and ps2.h
      ps2: introduce PS2DeviceClass
      ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon ps2_common_reset()
      ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
      ps2: implement ps2_kbd_realize() and use it to register ps2_keyboard_handler
      ps2: implement ps2_mouse_realize() and use it to register ps2_mouse_handler
      ps2: don't use vmstate_register() in ps2_kbd_init()
      ps2: don't use vmstate_register() in ps2_mouse_init()
      pl050: checkpatch fixes
      pl050: split pl050_update_irq() into separate pl050_set_irq() and pl050_update_irq() functions
      lasips2: spacing fixes
      lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
      pckbd: checkpatch fixes
      pckbd: move KBDState from pckbd.c to i8042.h
      pckbd: move ISAKBDState from pckbd.c to i8042.h
      pckbd: introduce new I8042_MMIO QOM type
      pckbd: implement i8042_mmio_reset() for I8042_MMIO device
      pckbd: add mask qdev property to I8042_MMIO device
      pckbd: add size qdev property to I8042_MMIO device
      pckbd: implement i8042_mmio_realize() function
      pckbd: implement i8042_mmio_init() function
      pckbd: alter i8042_mm_init() to return a I8042_MMIO device
      pckbd: move mapping of I8042_MMIO registers to MIPS magnum machine
      pckbd: more vmstate_register() from i8042_mm_init() to i8042_mmio_realize()
      pckbd: move ps2_kbd_init() and ps2_mouse_init() to i8042_mmio_realize()
      ps2: make ps2_raise_irq() function static
      ps2: use ps2_raise_irq() instead of calling update_irq() directly
      ps2: introduce ps2_lower_irq() instead of calling update_irq() directly
      ps2: add gpio for output IRQ and optionally use it in ps2_raise_irq() and ps2_lower_irq()
      pckbd: replace irq_kbd and irq_mouse with qemu_irq array in KBDState
      pl050: switch over from update_irq() function to PS2 device gpio
      pl050: add QEMU interface comment
      lasips2: QOMify LASIPS2State
      lasips2: move lasips2 QOM types from lasips2.c to lasips2.h
      lasips2: rename lasips2_init() to lasips2_initfn() and update it to return the LASIPS2 device
      lasips2: implement lasips2_init() function
      lasips2: move mapping of LASIPS2 registers to HPPA machine
      lasips2: move initialisation of PS2 ports from lasi_initfn() to lasi_init()
      lasips2: add base property
      lasips2: implement lasips2_realize()
      lasips2: use sysbus IRQ for output IRQ
      lasips2: switch over from update_irq() function to PS2 device gpio
      lasips2: add QEMU interface comment
      pckbd: switch I8042_MMIO device from update_irq() function to PS2 device gpio
      pckbd: add QEMU interface comment for I8042_MMIO device
      pckbd: add i8042_reset() function to I8042 device
      pckbd: switch I8042 device from update_irq() function to PS2 device gpio
      pckbd: add QEMU interface comment for I8042 device
      ps2: remove update_irq() function and update_arg parameter
      artist: set memory region owners for buffers to the artist device

 hw/display/artist.c        |   2 +-
 hw/hppa/machine.c          |  11 +-
 hw/input/lasips2.c         | 123 +++++++----
 hw/input/pckbd.c           | 338 ++++++++++++++++++++----------
 hw/input/pl050.c           |  56 +++--
 hw/input/ps2.c             | 501 ++++++++++++++++++++++++++-------------------
 hw/mips/jazz.c             |  11 +-
 include/hw/input/i8042.h   |  75 ++++++-
 include/hw/input/lasips2.h |  39 +++-
 include/hw/input/ps2.h     |  79 ++++++-
 10 files changed, 846 insertions(+), 389 deletions(-)

