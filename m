Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99632190771
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 09:25:17 +0100 (CET)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGes8-0007J0-Mj
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 04:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGeq8-0005D9-PW
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 04:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGeq7-0004Wx-Ni
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 04:23:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3208 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jGeq7-0004S8-9R; Tue, 24 Mar 2020 04:23:11 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B0E0BCD467D8FD04BD73;
 Tue, 24 Mar 2020 16:23:05 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 24 Mar 2020
 16:22:56 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v4 0/3] redundant code: Fix warnings reported by Clang static
 code analyzer
Date: Tue, 24 Mar 2020 16:22:32 +0800
Message-ID: <20200324082235.27980-1-kuhn.chenqun@huawei.com>
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

Chen Qun (3):
  scsi/esp-pci: Remove redundant statement in esp_pci_io_write()
  display/blizzard: Remove redundant statement in
    blizzard_draw_line16_32()
  timer/exynos4210_mct: Remove redundant statement in
    exynos4210_mct_write()

 hw/display/blizzard.c     | 1 -
 hw/scsi/esp-pci.c         | 1 +
 hw/timer/exynos4210_mct.c | 4 ----
 3 files changed, 1 insertion(+), 5 deletions(-)

--=20
2.23.0



