Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080D014BB7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 16:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNeWL-0002SI-FS
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 10:23:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNeUE-00010h-0Q
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNeUC-0004Jy-26
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:20:57 -0400
Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171]:59949)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hNeUA-0004E8-Gi
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:20:55 -0400
Received: from player779.ha.ovh.net (unknown [10.108.54.9])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 0C7FA5E6CD
	for <qemu-devel@nongnu.org>; Mon,  6 May 2019 16:20:51 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id F1BC855A9826;
	Mon,  6 May 2019 14:20:45 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  6 May 2019 16:20:39 +0200
Message-Id: <20190506142042.28096-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4810688827171834641
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.49.171
Subject: [Qemu-devel] [PATCH v2 0/3] aspeed: cleanups and extensions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Here is a series adding a couple of cleanups to the Aspeed SoCs to
prepare ground for extensions and new SoCs.

Thanks,

C.

Changes since v1:

 - moved enum defining the Aspeed controller names under aspeed_soc.h
 - removed AspeedSoCInfo 'sdram_base' field
 - fixed clang compilation

C=C3=A9dric Le Goater (3):
  aspeed: add a per SoC mapping for the interrupt space
  aspeed: add a per SoC mapping for the memory space
  aspeed: use sysbus_init_child_obj() to initialize children

 include/hw/arm/aspeed_soc.h |  40 ++++++-
 hw/arm/aspeed.c             |   8 +-
 hw/arm/aspeed_soc.c         | 226 ++++++++++++++++++++++--------------
 3 files changed, 184 insertions(+), 90 deletions(-)

--=20
2.20.1


