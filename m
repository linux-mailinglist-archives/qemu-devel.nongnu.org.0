Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378863735A9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:37:35 +0200 (CEST)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leC6A-0000mX-6u
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4X-0007XR-V7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57674
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4Q-00021z-82
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:51 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4N-0000OI-8c; Wed, 05 May 2021 08:35:43 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:28 +0100
Message-Id: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/10] qemu-sparc queue 20210505
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

The following changes since commit 3e13d8e34b53d8f9a3421a816ccfbdc5fa874e98:

  Merge remote-tracking branch 'remotes/bsdimp/tags/pull-bsd-user-20210430' into staging (2021-05-04 10:58:56 +0100)

are available in the Git repository at:

  git://github.com/mcayland/qemu.git tags/qemu-sparc-20210505

for you to fetch changes up to 10fb1340b161682d64320a5976f88f68472410bf:

  hw/sparc*: Move cpu_check_irqs() to target/sparc/ (2021-05-04 22:45:53 +0100)

----------------------------------------------------------------
qemu-sparc queue

----------------------------------------------------------------
Philippe Mathieu-Daudé (10):
      hw/sparc/sun4m: Have sun4m machines inherit new TYPE_SUN4M_MACHINE
      hw/sparc/sun4m: Introduce Sun4mMachineClass
      hw/sparc/sun4m: Factor out sun4m_machine_class_init()
      hw/sparc/sun4m: Register machine types in sun4m_machine_types[]
      hw/sparc/sun4m: Fix code style for checkpatch.pl
      hw/sparc/sun4m: Move each sun4m_hwdef definition in its class_init
      hw/sparc: Allow building without the leon3 machine
      hw/sparc64: Remove unused "hw/char/serial.h" header
      hw/sparc64: Fix code style for checkpatch.pl
      hw/sparc*: Move cpu_check_irqs() to target/sparc/

 hw/sparc/leon3.c            |  37 +++-
 hw/sparc/sun4m.c            | 491 +++++++++++++++++---------------------------
 hw/sparc/trace-events       |   4 +-
 hw/sparc64/sparc64.c        |  63 ------
 hw/sparc64/trace-events     |   4 -
 target/sparc/cpu.h          |   6 -
 target/sparc/int32_helper.c |  70 +++----
 target/sparc/int64_helper.c |  66 ++++++
 target/sparc/trace-events   |  12 +-
 9 files changed, 331 insertions(+), 422 deletions(-)

