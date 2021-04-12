Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A735D315
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:29:27 +0200 (CEST)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW53e-0007oX-Cw
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vd-0002wZ-EO
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44042
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vT-0002cC-42
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:21:02 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4vc-0004Dc-H0; Mon, 12 Apr 2021 23:21:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 12 Apr 2021 23:20:35 +0100
Message-Id: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/13] qemu-sparc queue 20210412
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

The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20210412

for you to fetch changes up to ce94fa7aa646a18e9b9105a32eea2152b202b431:

  tests/qtest: add tests for am53c974 device (2021-04-12 22:37:11 +0100)

----------------------------------------------------------------
qemu-sparc queue

----------------------------------------------------------------
Mark Cave-Ayland (13):
      esp: fix setting of ESPState mig_version_id when launching QEMU with -S option
      esp: always check current_req is not NULL before use in DMA callbacks
      esp: rework write_response() to avoid using the FIFO for DMA transactions
      esp: consolidate esp_cmdfifo_push() into esp_fifo_push()
      esp: consolidate esp_cmdfifo_pop() into esp_fifo_pop()
      esp: introduce esp_fifo_pop_buf() and use it instead of fifo8_pop_buf()
      esp: ensure cmdfifo is not empty and current_dev is non-NULL
      esp: don't underflow cmdfifo in do_cmd()
      esp: don't overflow cmdfifo in get_cmd()
      esp: don't overflow cmdfifo if TC is larger than the cmdfifo size
      esp: don't reset async_len directly in esp_select() if cancelling request
      esp: ensure that do_cmd is set to zero before submitting an ESP select command
      tests/qtest: add tests for am53c974 device

 MAINTAINERS                 |   1 +
 hw/scsi/esp-pci.c           |   1 +
 hw/scsi/esp.c               | 126 ++++++++++++++-----------
 include/hw/scsi/esp.h       |   1 +
 tests/qtest/am53c974-test.c | 218 ++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build     |   1 +
 6 files changed, 293 insertions(+), 55 deletions(-)
 create mode 100644 tests/qtest/am53c974-test.c

