Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA616B790
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 03:12:14 +0100 (CET)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Phl-0000J0-37
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 21:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38351)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgM-0006qP-OX
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgL-00084B-DI
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:10:46 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:59810 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgL-0007vo-0L; Mon, 24 Feb 2020 21:10:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 930FC2697C0897E0771B;
 Tue, 25 Feb 2020 10:10:37 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:27 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 00/13]redundant code: Fix warnings reported by Clang static
 code analyzer
Date: Tue, 25 Feb 2020 10:09:24 +0800
Message-ID: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

Hi all, our EulerRobot integrates clang static code analyzer tools and
found a lot of warnings. They are mainly redundant variable assignments.

This series fixes the warnings.

Chen Qun (13):
  block/stream: Remove redundant statement in stream_run()
  block/iscsi:Remove redundant statement in iscsi_open()
  block/file-posix: Remove redundant statement in raw_handle_perm_lock()
  scsi/esp-pci: Remove redundant statement in esp_pci_io_write()
  scsi/scsi-disk: Remove redundant statement in
    scsi_disk_emulate_command()
  display/pxa2xx_lcd: Remove redundant statement in
    pxa2xx_palette_parse()
  display/exynos4210_fimd: Remove redundant statement in
    exynos4210_fimd_update()
  display/blizzard: Remove redundant statement in
    blizzard_draw_line16_32()
  dma/xlnx-zdma: Remove redundant statement in zdma_write_dst()
  migration/vmstate: Remove redundant statement in
    vmstate_save_state_v()
  timer/exynos4210_mct: Remove redundant statement in
    exynos4210_mct_write()
  usb/hcd-ehci: Remove redundant statements
  monitor/hmp-cmds: Remove redundant statement in
    hmp_rocker_of_dpa_groups()

 block/file-posix.c           | 1 -
 block/iscsi.c                | 1 -
 block/stream.c               | 1 -
 hw/display/blizzard.c        | 1 -
 hw/display/exynos4210_fimd.c | 1 -
 hw/display/pxa2xx_lcd.c      | 1 -
 hw/dma/xlnx-zdma.c           | 2 --
 hw/scsi/esp-pci.c            | 1 -
 hw/scsi/scsi-disk.c          | 1 -
 hw/timer/exynos4210_mct.c    | 4 ----
 hw/usb/hcd-ehci.c            | 3 ---
 migration/vmstate.c          | 1 -
 monitor/hmp-cmds.c           | 1 -
 13 files changed, 19 deletions(-)

-- 
2.23.0



