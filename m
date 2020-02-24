Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E0169EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 07:43:41 +0100 (CET)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j67St-0007mK-GG
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 01:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <longpeng2@huawei.com>) id 1j67S3-00074C-Id
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <longpeng2@huawei.com>) id 1j67S2-0008OE-CS
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:47 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:56644 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <longpeng2@huawei.com>)
 id 1j67S2-0008F6-19
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:46 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B1D055F4FDEF319EB214;
 Mon, 24 Feb 2020 14:42:39 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.173.228.124) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 14:42:28 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <mst@redhat.com>, <alex.williamson@redhat.com>
Subject: [PATCH RESEND 0/3] fix some warnings by static code scan tool
Date: Mon, 24 Feb 2020 14:42:16 +0800
Message-ID: <20200224064219.1434-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.228.124]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: longpeng2@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 qemu-devel@nongnu.org, weifuqiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

Hi guys,
Our tool find some potential issues in QEMU source code, maybe
they're misreported, hope you could have a look at them.

Longpeng (Mike) (3):
  vfio/pci: fix a null pointer reference in vfio_rom_read
  vhost: fix a null pointer reference of vhost_log
  util/pty: fix a null pointer reference in qemu_openpty_raw

 hw/vfio/pci.c       | 13 ++++++++-----
 hw/virtio/vhost.c   | 19 +++++++++++++++++--
 util/qemu-openpty.c | 10 ++--------
 3 files changed, 27 insertions(+), 15 deletions(-)

--=20
1.8.3.1


