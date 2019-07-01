Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E290E25EC2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 09:43:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTLtw-0005Um-2k
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 03:43:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hTLrc-0003x9-Hq
	for qemu-devel@nongnu.org; Wed, 22 May 2019 03:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hTLra-0002Ls-PI
	for qemu-devel@nongnu.org; Wed, 22 May 2019 03:40:40 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:45405)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hTLrZ-00025W-0W
	for qemu-devel@nongnu.org; Wed, 22 May 2019 03:40:38 -0400
Received: from player761.ha.ovh.net (unknown [10.108.54.172])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id E64C519BD0E
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 09:40:26 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 4AFFF609C81E;
	Wed, 22 May 2019 07:40:21 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 22 May 2019 09:40:14 +0200
Message-Id: <20190522074016.10521-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 18224378842708544486
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudduuddguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.63.121
Subject: [Qemu-devel] [PATCH 0/2] spapr/xive: change default interrupt mode
 to 'dual'
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Here is a little series fixing multiple resets when in 'dual'
interrupt mode and changing the default mode to 'dual'.

Thanks,

C.

C=C3=A9dric Le Goater (2):
  spapr/xive: fix multiple resets when using the 'dual' interrupt mode
  spapr: change default interrupt mode to 'dual'

 hw/intc/spapr_xive.c     | 11 +++++------
 hw/intc/spapr_xive_kvm.c |  4 ----
 hw/ppc/spapr.c           |  3 ++-
 3 files changed, 7 insertions(+), 11 deletions(-)

--=20
2.20.1


