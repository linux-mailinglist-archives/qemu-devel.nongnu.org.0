Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD525BAAA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 13:29:10 +0200 (CEST)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhuUf-0008Sl-GO
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 07:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45083)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhuS0-0005ya-VR
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhuRy-0007ci-Ux
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:26:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hhuRw-0007ab-Uk
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:26:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9774988305;
 Mon,  1 Jul 2019 11:26:19 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E1F1B4B0;
 Mon,  1 Jul 2019 11:26:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 13:26:08 +0200
Message-Id: <20190701112612.14758-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 01 Jul 2019 11:26:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 0/4] Kconfig dependencies for some MIPS
 machines
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Express the MIPS machine dependencies with Kconfig.

Various issues prevent to use Kconfig with the Boston and Malta
boards. They will be switched later.

v4:
- dropped Boston (Aleksandar required the ITU to be selectable)
- comment why use 'imply' in Jazz (Thomas)

v3:
- addressed review comments from Thomas and Aleksandar
  (noted in each patch)

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg00887.html
- Do not remove machines from the default config (Thomas)
- Corrected comment about CONFIG_PCI_BONITO (Thomas)

v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg593013.html

$ git backport-diff -u kconfig_mips-v3
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/4:[down] 'hw/mips: Explicit the semi-hosting feature is always requir=
ed'
002/4:[----] [--] 'hw/mips: Express dependencies of the MIPSsim machine w=
ith Kconfig'
003/4:[----] [-C] 'hw/mips: Express dependencies of the Jazz machine with=
 Kconfig'
004/4:[0005] [FC] 'hw/mips: Express dependencies of the r4k platform with=
 Kconfig'

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (4):
  hw/mips: Explicit the semi-hosting feature is always required
  hw/mips: Express dependencies of the MIPSsim machine with Kconfig
  hw/mips: Express dependencies of the Jazz machine with Kconfig
  hw/mips: Express dependencies of the r4k platform with Kconfig

 default-configs/mips-softmmu-common.mak |  7 +++---
 default-configs/mips64-softmmu.mak      |  5 -----
 default-configs/mips64el-softmmu.mak    |  5 -----
 hw/mips/Kconfig                         | 30 +++++++++++++++++++++++++
 4 files changed, 33 insertions(+), 14 deletions(-)

--=20
2.20.1


