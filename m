Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDB04D2DB0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:11:51 +0100 (CET)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuEQ-0000SV-0A
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuBX-00065V-Ds
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:08:52 -0500
Received: from [2001:41c9:1:41f::167] (port=35648
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuBV-0005BJ-9H
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:08:50 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuAl-000CWr-TG; Wed, 09 Mar 2022 11:08:07 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed,  9 Mar 2022 11:08:09 +0000
Message-Id: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/22] q800-updates-for-7.0 queue 20220309
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 9f0369efb0f2a200f18b1aacd2ef493e22da5351:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2022-03-08 22:27:34 +0000)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/q800-updates-for-7.0-20220309

for you to fetch changes up to a7a2208862bee2bc4fe55adfd947dc4a15ad0216:

  esp: recreate ESPState current_req after migration (2022-03-09 09:29:10 +0000)

----------------------------------------------------------------
q800-updates-for-7.0 queue

[MCA: this is the current q800 patch queue for 7.0 which I'm picking up on
behalf of Laurent]

----------------------------------------------------------------
Mark Cave-Ayland (22):
      mos6522: add defines for IFR bit flags
      mac_via: use IFR bit flag constants for VIA1 IRQs
      mac_via: use IFR bit flag constants for VIA2 IRQs
      mos6522: switch over to use qdev gpios for IRQs
      mos6522: remove update_irq() and set_sr_int() methods from MOS6522DeviceClass
      mos6522: use device_class_set_parent_reset() to propagate reset to parent
      mos6522: add register names to register read/write trace events
      mos6522: add "info via" HMP command for debugging
      mos6522: record last_irq_levels in mos6522_set_irq()
      mac_via: make SCSI_DATA (DRQ) bit live rather than latched
      mos6522: implement edge-triggering for CA1/2 and CB1/2 control line IRQs
      macio/pmu.c: remove redundant code
      macfb: add VMStateDescription for MacfbNubusState and MacfbSysBusState
      macfb: don't use special irq_state and irq_mask variables in MacfbState
      macfb: increase number of registers saved in MacfbState
      macfb: add VMStateDescription fields for display type and VBL timer
      macfb: set initial value of mode control registers in macfb_common_realize()
      esp: introduce esp_set_pdma_cb() function
      esp: introduce esp_pdma_cb() function
      esp: convert ESPState pdma_cb from a function pointer to an integer
      esp: include the current PDMA callback in the migration stream
      esp: recreate ESPState current_req after migration

 hmp-commands-info.hx         |  15 +++
 hw/display/macfb.c           |  57 +++++++++--
 hw/m68k/q800.c               |   9 +-
 hw/misc/mac_via.c            |  87 +++++++----------
 hw/misc/macio/cuda.c         |   8 +-
 hw/misc/macio/pmu.c          |  40 +-------
 hw/misc/mos6522.c            | 226 ++++++++++++++++++++++++++++++++++++++++---
 hw/misc/trace-events         |   4 +-
 hw/scsi/esp.c                |  87 +++++++++++++++--
 include/hw/display/macfb.h   |   5 +-
 include/hw/misc/mac_via.h    |  46 ++++-----
 include/hw/misc/macio/pmu.h  |   2 -
 include/hw/misc/mos6522.h    |  46 +++++++--
 include/hw/scsi/esp.h        |  11 ++-
 include/monitor/hmp-target.h |   1 +
 15 files changed, 474 insertions(+), 170 deletions(-)

