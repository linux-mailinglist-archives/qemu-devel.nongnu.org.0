Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C683300B3
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 13:11:59 +0100 (CET)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIsGL-0001lj-7J
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 07:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsDh-0000Cp-VJ
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:14 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43550
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsDg-0007SM-7X
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 07:09:13 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lIsDZ-0002V5-6q; Sun, 07 Mar 2021 12:09:10 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Sun,  7 Mar 2021 12:08:08 +0000
Message-Id: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/42] qemu-sparc queue 20210307
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

The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20210307

for you to fetch changes up to 7aa6baee7c8a54473f28c6fa1e980a9ff7989036:

  esp: add support for unaligned accesses (2021-03-07 10:39:05 +0000)

----------------------------------------------------------------
qemu-sparc queue

----------------------------------------------------------------
Mark Cave-Ayland (42):
      esp: checkpatch fixes
      esp: rename existing ESP QOM type to SYSBUS_ESP
      esp: QOMify the internal ESP device state
      esp: add vmstate_esp version to embedded ESPState
      esp: add trace event when receiving a TI command
      esp: fix esp_reg_read() trace event
      esp: add PDMA trace events
      esp: determine transfer direction directly from SCSI phase
      esp: introduce esp_get_tc() and esp_set_tc()
      esp: introduce esp_get_stc()
      esp: apply transfer length adjustment when STC is zero at TC load time
      esp: remove dma_counter from ESPState
      esp: remove dma_left from ESPState
      esp: remove minlen restriction in handle_ti
      esp: introduce esp_pdma_read() and esp_pdma_write() functions
      esp: use pdma_origin directly in esp_pdma_read()/esp_pdma_write()
      esp: move pdma_len and TC logic into esp_pdma_read()/esp_pdma_write()
      esp: accumulate SCSI commands for PDMA transfers in cmdbuf instead of pdma_buf
      esp: remove buf parameter from do_cmd()
      esp: remove the buf and buflen parameters from get_cmd()
      esp: remove redundant pdma_start from ESPState
      esp: move PDMA length adjustments into esp_pdma_read()/esp_pdma_write()
      esp: use ti_wptr/ti_rptr to manage the current FIFO position for PDMA
      esp: use in-built TC to determine PDMA transfer length
      esp: remove CMD pdma_origin
      esp: rename get_cmd_cb() to esp_select()
      esp: fix PDMA target selection
      esp: use FIFO for PDMA transfers between initiator and device
      esp: remove pdma_origin from ESPState
      esp: add 4 byte PDMA read and write transfers
      esp: implement FIFO flush command
      esp: latch individual bits in ESP_RINTR register
      esp: defer command completion interrupt on incoming data transfers
      esp: remove old deferred command completion mechanism
      esp: raise interrupt after every non-DMA byte transferred to the FIFO
      esp: add maxlen parameter to get_cmd()
      esp: transition to message out phase after SATN and stop command
      esp: convert ti_buf from array to Fifo8
      esp: convert cmdbuf from array to Fifo8
      esp: add trivial implementation of the ESP_RFLAGS register
      esp: implement non-DMA transfers in PDMA mode
      esp: add support for unaligned accesses

 hw/dma/sparc32_dma.c  |   4 +-
 hw/m68k/q800.c        |   4 +-
 hw/mips/jazz.c        |   4 +-
 hw/scsi/esp-pci.c     |  53 ++-
 hw/scsi/esp.c         | 975 ++++++++++++++++++++++++++++++++++----------------
 hw/scsi/trace-events  |   5 +
 hw/sparc/sun4m.c      |   2 +-
 include/hw/scsi/esp.h |  52 +--
 8 files changed, 748 insertions(+), 351 deletions(-)

