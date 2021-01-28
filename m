Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AB308106
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:20:17 +0100 (CET)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5FeC-00082P-5s
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l5Fbj-0006dB-JY
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:17:43 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35396
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l5Fbh-0000Xf-AT
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:17:43 -0500
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l5Fbq-0003bE-OH; Thu, 28 Jan 2021 22:17:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, cfontana@suse.de,
 philmd@redhat.com
Date: Thu, 28 Jan 2021 22:17:26 +0000
Message-Id: <20210128221728.14887-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/2] utils/fifo8: minor updates
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

This patchset contains a couple of minor updates to QEMU's Fifo8 implementation
conceived whilst working on the next revision of the ESP series.

Patch 1 has already been reviewed on-list whilst patch 2 adds a new
VMSTATE_FIFO8_TEST macro which is required to allow the updated ESP series
to handle incoming migrations from previous QEMU versions.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (2):
  utils/fifo8: change fatal errors from abort() to assert()
  utils/fifo8: add VMSTATE_FIFO8_TEST macro

 include/qemu/fifo8.h | 16 ++++++++++------
 util/fifo8.c         | 16 ++++------------
 2 files changed, 14 insertions(+), 18 deletions(-)

-- 
2.20.1


