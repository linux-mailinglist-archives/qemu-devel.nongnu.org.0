Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E255C33DF07
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 21:41:25 +0100 (CET)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGVI-00084X-Ly
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 16:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMGTw-0007O6-Eu
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:40:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33012
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMGTt-0003GE-Hy
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:40:00 -0400
Received: from host109-156-104-46.range109-156.btcentralplus.com
 ([109.156.104.46] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMGTr-0005Bx-Ls; Tue, 16 Mar 2021 20:40:00 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Tue, 16 Mar 2021 20:39:45 +0000
Message-Id: <20210316203946.21761-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.156.104.46
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/1] qemu-openbios queue 20210316
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

The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-openbios-20210316

for you to fetch changes up to ee2e67da8f882fcdef2c49fcc58e9962aa695f5a:

  Update OpenBIOS images to 4a004110 built from submodule. (2021-03-16 20:03:00 +0000)

----------------------------------------------------------------
qemu-openbios queue

----------------------------------------------------------------
Mark Cave-Ayland (1):
      Update OpenBIOS images to 4a004110 built from submodule.

 pc-bios/openbios-ppc     | Bin 696912 -> 696912 bytes
 pc-bios/openbios-sparc32 | Bin 382048 -> 382048 bytes
 pc-bios/openbios-sparc64 | Bin 1593408 -> 1593408 bytes
 roms/openbios            |   2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)

