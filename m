Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5B05789AF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:43:33 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDViO-0001y0-EU
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZ4-0007bs-SO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:33:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZ3-0005Uv-2D
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ka/qwllZGByVVdc+G4yfl8TioQJP/dkdgKiwId+8L9E=; b=uDFoaY9EwpDDNAaq5h5So4YfTg
 FQWfP/IafPObdWQNJxaCbgre8qg/lQWguOqwR7gd5rvVMbw05fFd1Kcn8/de08tgbvNxAemOAPK8v
 XX9Ufa3E72LWB535NWZXQyACZCTgBOenXiMwoAldN82RTYzdPdD3o+lcIWjR9RVBRZz/7bhkgGneD
 fqU48MUDzWpRGNhkQqaVflmgdPHT8srK/P716TWP/N4MbKWwlwmm/zmKLzQQsMtExe6/a89qQ+NdP
 IH1mwPOZE3DVfvNv2B10KF+SFA7lOxRw4sZrScwAdzS20vnGPkLVKwNrjA4RtVBldu5h/CtQ4G5ce
 5GuRQWBozmbIodkAsl7vSnjclifq/4sSiVobX2dE2CIrzDxOJcX6TKpTodQ9+TWZ/xfeCFA5f7f5s
 SPfUS6/yiUUJolbHu/lq3t9UMIzBM8PF3eXXlExNedI/W0lJrR/fNCnga2S24kMIgbdbbDmVpwIPl
 WkXQPxIWQZSCSONsULI+iswapY/LPOCeDjDq/HMX/B1OuJOdWbs/p6vU28cQSzdxJkIxXKB/6qClM
 RBctDRpt0AWBik40MoVClTgo/kFfp2jHBpl9F0Zf3/dP9iC1/PXPMBzuIiklAwjcyPEF6nJwLlOQW
 41BfepFQENHW5lNJT7YatCUbjhNUZsSqCoXpYj6hI=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVXg-000B51-Ii; Mon, 18 Jul 2022 19:32:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:32:59 +0100
Message-Id: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/40] qemu-sparc queue 20220718
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

The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:

  Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)

are available in the Git repository at:

  https://github.com/mcayland/qemu.git tags/qemu-sparc-20220718

for you to fetch changes up to b704d63d094cc757c20c186ff40d692deb5e30de:

  pckbd: remove legacy i8042_mm_init() function (2022-07-18 19:28:46 +0100)

----------------------------------------------------------------
qemu-sparc queue
- This is the second half of the PS2 QOMification patchset

----------------------------------------------------------------
Mark Cave-Ayland (40):
      pl050: move PL050State from pl050.c to new pl050.h header file
      pl050: rename pl050_keyboard_init() to pl050_kbd_init()
      pl050: change PL050State dev pointer from void to PS2State
      pl050: introduce new PL050_KBD_DEVICE QOM type
      pl050: introduce new PL050_MOUSE_DEVICE QOM type
      pl050: move logic from pl050_realize() to pl050_init()
      pl050: introduce PL050DeviceClass for the PL050 device
      pl050: introduce pl050_kbd_class_init() and pl050_kbd_realize()
      pl050: introduce pl050_mouse_class_init() and pl050_mouse_realize()
      pl050: don't use legacy ps2_kbd_init() function
      pl050: don't use legacy ps2_mouse_init() function
      lasips2: don't use vmstate_register() in lasips2_realize()
      lasips2: remove the qdev base property and the lasips2_properties array
      lasips2: remove legacy lasips2_initfn() function
      lasips2: change LASIPS2State dev pointer from void to PS2State
      lasips2: QOMify LASIPS2Port
      lasips2: introduce new LASIPS2_KBD_PORT QOM type
      lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
      lasips2: move keyboard port initialisation to new lasips2_kbd_port_init() function
      lasips2: move mouse port initialisation to new lasips2_mouse_port_init() function
      lasips2: introduce lasips2_kbd_port_class_init() and lasips2_kbd_port_realize()
      lasips2: introduce lasips2_mouse_port_class_init() and lasips2_mouse_port_realize()
      lasips2: rename LASIPS2Port irq field to birq
      lasips2: introduce port IRQ and new lasips2_port_init() function
      lasips2: introduce LASIPS2PortDeviceClass for the LASIPS2_PORT device
      lasips2: add named input gpio to port for downstream PS2 device IRQ
      lasips2: add named input gpio to handle incoming port IRQs
      lasips2: switch to using port-based IRQs
      lasips2: rename LASIPS2Port parent pointer to lasips2
      lasips2: standardise on lp name for LASIPS2Port variables
      lasips2: switch register memory region to DEVICE_BIG_ENDIAN
      lasips2: don't use legacy ps2_kbd_init() function
      lasips2: don't use legacy ps2_mouse_init() function
      lasips2: update VMStateDescription for LASIPS2 device
      pckbd: introduce new vmstate_kbd_mmio VMStateDescription for the I8042_MMIO device
      pckbd: don't use legacy ps2_kbd_init() function
      ps2: remove unused legacy ps2_kbd_init() function
      pckbd: don't use legacy ps2_mouse_init() function
      ps2: remove unused legacy ps2_mouse_init() function
      pckbd: remove legacy i8042_mm_init() function

 hw/hppa/machine.c          |   7 +-
 hw/input/lasips2.c         | 320 +++++++++++++++++++++++++++++++--------------
 hw/input/pckbd.c           |  82 +++++++-----
 hw/input/pl050.c           | 112 +++++++++++-----
 hw/input/ps2.c             |  26 ----
 hw/input/trace-events      |   2 -
 hw/mips/jazz.c             |  13 +-
 include/hw/input/i8042.h   |   7 +-
 include/hw/input/lasips2.h |  57 +++++---
 include/hw/input/pl050.h   |  59 +++++++++
 include/hw/input/ps2.h     |   2 -
 11 files changed, 466 insertions(+), 221 deletions(-)
 create mode 100644 include/hw/input/pl050.h

