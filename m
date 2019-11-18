Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC627100908
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 17:19:18 +0100 (CET)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWjkC-0002W6-N1
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 11:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iWjiT-0000yB-0p
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:17:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iWjiR-00066i-TU
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:17:28 -0500
Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175]:34714)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iWjiR-00066G-Mt
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:17:27 -0500
Received: from player796.ha.ovh.net (unknown [10.108.57.49])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3EEB6231B68
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 17:17:25 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 283E6C1CB294;
 Mon, 18 Nov 2019 16:17:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.0 0/2] aspeed: rework inter model link properties
Date: Mon, 18 Nov 2019 17:17:10 +0100
Message-Id: <20191118161712.6712-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14128917931172989713
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegiedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.44.175
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Some Aspeed models use links to point to other controllers of the
machine. This series changes the link properties so that they set the
pointer explicitly.

Thanks,

C.

C=C3=A9dric Le Goater (2):
  aspeed: change the "scu" property definition
  aspeed: change the "nic" property definition

 hw/arm/aspeed_ast2600.c  | 13 ++++++-------
 hw/arm/aspeed_soc.c      |  8 ++++----
 hw/net/ftgmac100.c       | 19 +++++++++----------
 hw/timer/aspeed_timer.c  | 17 +++++++++--------
 hw/watchdog/wdt_aspeed.c | 17 ++++++++---------
 5 files changed, 36 insertions(+), 38 deletions(-)

--=20
2.21.0


