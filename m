Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359C3C6868
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 04:12:02 +0200 (CEST)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37tw-0004c1-Rw
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 22:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37pr-0001wB-DX; Mon, 12 Jul 2021 22:07:47 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53757 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37pp-0001lZ-1Y; Mon, 12 Jul 2021 22:07:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP3tg2sdrz9sX5; Tue, 13 Jul 2021 12:07:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626142059;
 bh=9mT1qmIlDem1ffxL13VbuGYHr/yx7hgo25oHZMBEVpg=;
 h=From:To:Cc:Subject:Date:From;
 b=e6X4MqE4K+hRVcC0pUE/liad0kWD+RTyDhBZSNHNY57TOTzvMkDIMGJ4xwnwgDiP+
 4PurXe9SsE+p492bhFsa7zwuZfJmZh9bDS8Acs9Y+QJCFNoIexzXxHROq0K6FwdBn5
 VCIfkBkDJRFdiir1kEGGVpwKXfjljZXywgXtO7nY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 0/3] ppc-for-6.1 queue 20210713
Date: Tue, 13 Jul 2021 12:07:33 +1000
Message-Id: <20210713020736.28960-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c320:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708' into staging (2021-07-12 19:15:11 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210713

for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a1756:

  mv64361: Remove extra break from a switch case (2021-07-13 10:12:17 +1000)

----------------------------------------------------------------
ppc patch queue 2021-07-13

I thought I'd sent the last PR before the 6.1 soft freeze, but
unfortunately I need one more.  This last minute one puts in a SLOF
update, along with a couple of bugfixes.

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

BALATON Zoltan (2):
      ppc/pegasos2: Allow setprop in VOF
      mv64361: Remove extra break from a switch case

 hw/pci-host/mv64361.c |   1 -
 hw/ppc/pegasos2.c     |  10 ++++++++++
 pc-bios/README        |   2 +-
 pc-bios/slof.bin      | Bin 968888 -> 991744 bytes
 roms/SLOF             |   2 +-
 5 files changed, 12 insertions(+), 3 deletions(-)

