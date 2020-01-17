Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57261404B5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 08:57:53 +0100 (CET)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isMVs-0007Ac-Bn
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 02:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1isMUG-0005Np-Oh
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 02:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1isMUF-0006Z6-Cj
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 02:56:12 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2737 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1isMUF-0006WP-1G
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 02:56:11 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8C49159F839AFF91A5C2;
 Fri, 17 Jan 2020 15:56:06 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 17 Jan 2020 15:55:53 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>, <pbonzini@redhat.com>, <fam@euphon.net>
Subject: [PATCH 0/2] delete virtio queues in virtio_scsi_unrealize
Date: Fri, 17 Jan 2020 15:55:45 +0800
Message-ID: <20200117075547.60864-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

This serie patch fix memleaks when detaching virtio-scsi device.=20
1. use old virtio_del_queue to fix memleaks, it's easier for stable branc=
hes to merge.
   As the discussion in https://lists.nongnu.org/archive/html/qemu-devel/=
2020-01/msg02903.html

2. replace virtio_del_queue to virtio_delete_queue to make it more clear.

Pan Nengyuan (2):
  virtio-scsi: delete vqs in unrealize to avoid memleaks
  virtio-scsi: convert to new virtio_delete_queue

 hw/scsi/virtio-scsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

--=20
2.21.0.windows.1



