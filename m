Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA12BC607
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 15:29:09 +0100 (CET)
Received: from localhost ([::1]:57742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgqMW-0000oM-Ex
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 09:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kgqLF-0008Hu-Eg
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 09:27:49 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60988
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kgqL9-00024E-GC
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 09:27:49 -0500
Received: from host86-179-247-26.range86-179.btcentralplus.com
 ([86.179.247.26] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kgqLQ-0005bM-MJ; Sun, 22 Nov 2020 14:28:01 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 22 Nov 2020 14:27:35 +0000
Message-Id: <20201122142736.18368-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.247.26
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/1] qemu-sparc queue 20201122
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

The following changes since commit e3a232cccd2445e5d9e607a65a78cdbc33ff8a0f:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-11-20 22:30:51 +0000)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20201122

for you to fetch changes up to 48e5c7f34c557afe49396a00169629d24dc3342d:

  hw/display/tcx: add missing 64-bit access for framebuffer blitter (2020-11-22 10:43:30 +0000)

----------------------------------------------------------------
qemu-sparc queue

----------------------------------------------------------------
Mark Cave-Ayland (1):
      hw/display/tcx: add missing 64-bit access for framebuffer blitter

 hw/display/tcx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

