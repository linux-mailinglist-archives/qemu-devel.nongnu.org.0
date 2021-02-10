Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3E31628A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:42:48 +0100 (CET)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9m1H-0000Z7-Ek
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1l9lpM-0005wi-Bz
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:30:28 -0500
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1l9lp7-0007OL-6p
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QkLgEZyHbFP6NgtSdyn1vV5V5ewLBxEOkgaLaO2o0ic=; b=cMAH2E/w8DfJr5oNDZgp3zw10s
 WqMU5+irQPbpI/g0sjCtXTDY+ZjdltDZaDio5JuWhNklEJdH5lQinlDZxUmzFIoblkt/etzIkzmRJ
 JLT6zqhUYFHFjB0XVmPGZDozQCF9IsZcHxUsZwK5dvZIrCUs0m9H99IwUvaWIxMAYSiI=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: peter.maydell@linaro.org
Subject: [PULL 0/1] tricore queue
Date: Wed, 10 Feb 2021 10:29:54 +0100
Message-Id: <20210210092955.124757-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.2.10.92117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=28586788, da=100558469,
 mc=462, sc=4, hc=458, sp=0, fso=28586788, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kbastian@mail.upb.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1214d55d1c41fbab3a9973a05085b8760647e411:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-02-09 13:24:37 +0000)

are available in the Git repository at:

  https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20210210

for you to fetch changes up to 52be63523e80bc92b8192a1e445fe499650085ac:

  tricore: added triboard with tc27x_soc (2021-02-10 10:26:38 +0100)

----------------------------------------------------------------
added triboard with tc27x_soc

----------------------------------------------------------------
Andreas Konopik (1):
      tricore: added triboard with tc27x_soc

 default-configs/devices/tricore-softmmu.mak |   2 +-
 hw/tricore/Kconfig                          |   8 +
 hw/tricore/meson.build                      |   2 +
 hw/tricore/tc27x_soc.c                      | 246 ++++++++++++++++++++++++++++
 hw/tricore/triboard.c                       |  98 +++++++++++
 include/hw/tricore/tc27x_soc.h              | 129 +++++++++++++++
 include/hw/tricore/triboard.h               |  50 ++++++
 7 files changed, 534 insertions(+), 1 deletion(-)
 create mode 100644 hw/tricore/tc27x_soc.c
 create mode 100644 hw/tricore/triboard.c
 create mode 100644 include/hw/tricore/tc27x_soc.h
 create mode 100644 include/hw/tricore/triboard.h

