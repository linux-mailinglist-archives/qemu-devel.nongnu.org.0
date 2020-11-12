Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493362B0268
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:58:48 +0100 (CET)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9NP-0007WN-Cj
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd9LG-00069Y-91; Thu, 12 Nov 2020 04:56:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46538
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd9LE-0002xh-9V; Thu, 12 Nov 2020 04:56:33 -0500
Received: from host109-155-147-35.range109-155.btcentralplus.com
 ([109.155.147.35] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd9LM-0007d5-Vb; Thu, 12 Nov 2020 09:56:45 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Thu, 12 Nov 2020 09:56:19 +0000
Message-Id: <20201112095620.27372-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.155.147.35
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/1] qemu-macppc queue 20201112
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

The following changes since commit a4c141dca466ed3e9451f147efe6304b1b659ff5:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2020-11-11 19:53:15 +0000)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-macppc-20201112

for you to fetch changes up to 6bfa035ec31f4f5a14499f17e08f62e8f14760cc:

  macio: set user_creatable to false in macio_class_init() (2020-11-12 09:26:20 +0000)

----------------------------------------------------------------
qemu-macppc fix for 5.2

----------------------------------------------------------------
Mark Cave-Ayland (1):
      macio: set user_creatable to false in macio_class_init()

 hw/misc/macio/macio.c | 2 ++
 1 file changed, 2 insertions(+)

