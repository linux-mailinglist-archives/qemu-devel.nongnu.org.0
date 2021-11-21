Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41954582DB
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 11:02:27 +0100 (CET)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mojg1-0003gA-I3
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 05:02:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mojdg-0001dI-E9
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 05:00:00 -0500
Received: from [2001:41c9:1:41f::167] (port=47638
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mojde-0001DO-NC
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 05:00:00 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1mojdS-00055A-Ju
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 09:59:50 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org
Date: Sun, 21 Nov 2021 09:59:31 +0000
Message-Id: <20211121095933.28174-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/2] qemu-sparc queue 20211121
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 8627edfb3f1fca24a96a0954148885c3241c10f8:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-11-19 17:16:57 +0100)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20211121

for you to fetch changes up to 319e89cdc32096432b578152a47d0d156033b711:

  escc: update the R_SPEC register SPEC_ALLSENT bit when writing to W_TXCTRL1 (2021-11-21 09:56:52 +0000)

----------------------------------------------------------------
qemu-sparc queue
  - contains fixes for ESCC reset issues with Sun PROM and OpenBSD on SPARC32

----------------------------------------------------------------
Mark Cave-Ayland (2):
      escc: always set STATUS_TXEMPTY in R_STATUS on device reset
      escc: update the R_SPEC register SPEC_ALLSENT bit when writing to W_TXCTRL1

 hw/char/escc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

