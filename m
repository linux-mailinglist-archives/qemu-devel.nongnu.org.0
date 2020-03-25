Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD300191F83
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 04:01:20 +0100 (CET)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGwIB-0002n0-Qc
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 23:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGwGd-00013v-Qs
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGwGc-0004zV-Kr
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 22:59:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3214 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jGwGc-0004wz-96; Tue, 24 Mar 2020 22:59:42 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9871028E5ECC67006711;
 Wed, 25 Mar 2020 10:59:37 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 10:59:26 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v5 0/3] redundant code: Fix warnings reported by Clang static
 code analyzer
Date: Wed, 25 Mar 2020 10:59:16 +0800
Message-ID: <20200325025919.21316-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, philmd@redhat.com,
 zhang.zhanghailiang@huawei.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1->v2:
- Patch1: Add John Snow review comment.
- Patch9: Move the 'dst_type' declaration to while() statement.
- Patch12: Add Philippe Mathieu-Daud=C3=A9 review comment.
- Patch13: Move the 'set' declaration to the for() statement.

v2->v3:
- Patch1: Add Kevin Wolf review comment.
- Patch2: Keep the 'flags' then use it(Base on Kevin's comments).
- Patch3: Add Kevin Wolf review comment.
- Patch9: Add Francisco Iglesias and Alistair Francis review comment.
- Patch10: Juan Quintela has added it to the queue and delete it.
- Patch12->Patch11: Add Philippe Mathieu-Daud=C3=A9 review comment.
- Patch13->Patch12: Add Philippe Mathieu-Daud=C3=A9 review comment.

v3->v4:
- Deleted the patches that have been merged in the v3.
- Modify "scsi/esp-pci" Patch, use g_assert with variable size.

v4->v5:
- Patch1: Add Laurent Vivier review comment and change the subject.
- Patch2: Use extract16() instead of delete bit operation statement.
- Patch3: Add Laurent Vivier review comment.

Chen Qun (3):
  scsi/esp-pci: add g_assert() for fix clang analyzer warning in
    esp_pci_io_write()
  display/blizzard: use extract16() for fix clang analyzer warning in
    blizzard_draw_line16_32()
  timer/exynos4210_mct: Remove redundant statement in
    exynos4210_mct_write()

 hw/display/blizzard.c     | 10 ++++------
 hw/scsi/esp-pci.c         |  1 +
 hw/timer/exynos4210_mct.c |  4 ----
 3 files changed, 5 insertions(+), 10 deletions(-)

--=20
2.23.0



