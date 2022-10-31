Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84C613EC8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbBp-0007X1-EB; Mon, 31 Oct 2022 16:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBk-0007W7-1x; Mon, 31 Oct 2022 16:15:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBg-0000dW-NO; Mon, 31 Oct 2022 16:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hTCg4/pbhrZRXuCZNh2MLFVNZXdveHWVfGlzo8Dev6g=; b=OAmiGbbmXI35EzGlbKqiF0yQFm
 8BOm6AIZGv6H+Qb4BvVEeIbL2b1cdeOSU4SIQ+/NMl48mXJOnCzBTx+zvpVL3RQULZUiv2t0j3pnR
 YN7mzevGgaGCoSDf928mohQX44fivO4UFU30wIAbSwCzk6WOKB80Y8ETf5STFVsU8mBqOokCpnoRJ
 7g3S0A0tvryTt0eQcVJqwLGlaOJNMs0XpKanuKM2lFWp4sd3LMfmCwTnL2UE8gR9QXI1CdoL4z0q7
 GA1k/lFSOpyQ/iiQ8i70ikfmqCmUvoGLaRysqADN3RDbjXsaJZyJPV7hYJCWGjKH0Ft57/KxNhL89
 yHsbnMsewRPhJI06MySiFm2oGwa+UhGIoEBF9h59xaSkKZyGvGDTbhTEDRT/ztAB5znT8Vg6s5G3f
 gD5qVsbZsrTQE4zSP8WpTrMetgobHfLtZ4zlc+GqhsC9KR1cSraq8bSYQzNjyIi2cOA8yrxOqKgQy
 70E61iOwC7KSlIm6Uj8Poj8vqlCtAltz+pxLPtVyBMPvyraHJuP4b8iOWLfMM5Hqnxnw1KFiIAds2
 U2ER5LHP0iQga5o7D513awjRpT23rXg/CiFIluUWdfPzesdfr1OaJ/EdfRnJuGsHH9TUsgPnX00xE
 Fe1F2NEd0794MWgJxynHkLk+XfbbF7ZATxlFU4pro=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBX-0003Dd-0f; Mon, 31 Oct 2022 20:15:06 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:21 +0000
Message-Id: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/14] qemu-macppc queue 20221031
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 5107fd3effb1cfec3b96d9e819f1605048640e31:

  net/vhost-vdpa.c: Fix clang compilation failure (2022-10-31 13:01:31 -0400)

are available in the Git repository at:

  https://github.com/mcayland/qemu.git tags/qemu-macppc-20221031

for you to fetch changes up to 53cb552daeb57e0a35f648e42fb28fa38842bd0c:

  mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum (2022-10-31 18:48:23 +0000)

----------------------------------------------------------------
qemu-macppc updates for 7.2

----------------------------------------------------------------
BALATON Zoltan (14):
      mac_newworld: Drop some variables
      mac_oldworld: Drop some more variables
      mac_{old|new}world: Set tbfreq at declaration
      mac_{old|new}world: Avoid else branch by setting default value
      mac_newworld: Clean up creation of Uninorth devices
      mac_{old|new}world: Reduce number of QOM casts
      hw/ppc/mac.h: Move newworld specific parts out from shared header
      hw/ppc/mac.h: Move macio specific parts out from shared header
      hw/ppc/mac.h: Move grackle-pcihost type declaration out to a header
      hw/ppc/mac.h: Move PROM and KERNEL defines to board code
      hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
      mac_nvram: Use NVRAM_SIZE constant
      mac_{old|new}world: Code style fix adding missing braces to if-s
      mac_newworld: Turn CORE99_VIA_CONFIG defines into an enum

 MAINTAINERS                   |   2 +
 hw/ide/macio.c                |   1 -
 hw/intc/heathrow_pic.c        |   1 -
 hw/intc/openpic.c             |   1 -
 hw/misc/macio/cuda.c          |   1 -
 hw/misc/macio/gpio.c          |   1 -
 hw/misc/macio/macio.c         |   8 +-
 hw/misc/macio/pmu.c           |   1 -
 hw/nvram/mac_nvram.c          |   2 +-
 hw/pci-host/grackle.c         |  15 +--
 hw/pci-host/uninorth.c        |   1 -
 hw/ppc/mac.h                  | 105 --------------------
 hw/ppc/mac_newworld.c         | 226 ++++++++++++++++++++----------------------
 hw/ppc/mac_oldworld.c         | 113 ++++++++++-----------
 include/hw/misc/macio/macio.h |  23 ++++-
 include/hw/nvram/mac_nvram.h  |  51 ++++++++++
 include/hw/pci-host/grackle.h |  44 ++++++++
 17 files changed, 285 insertions(+), 311 deletions(-)
 delete mode 100644 hw/ppc/mac.h
 create mode 100644 include/hw/nvram/mac_nvram.h
 create mode 100644 include/hw/pci-host/grackle.h

