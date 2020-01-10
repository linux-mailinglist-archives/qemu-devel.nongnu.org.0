Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D211E136976
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 10:20:19 +0100 (CET)
Received: from localhost ([::1]:42846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipqSo-0003YD-Rc
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 04:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR5-00029H-J3
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR4-0004tb-Eh
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 04:18:31 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:58484 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ipqR4-0004dd-3B; Fri, 10 Jan 2020 04:18:30 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1633287B7610E0E9B43E;
 Fri, 10 Jan 2020 17:18:26 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 10 Jan 2020 17:18:15 +0800
From: <pannengyuan@huawei.com>
To: <pbonzini@redhat.com>, <mdroth@linux.vnet.ibm.com>
Subject: [PATCH v2 0/2] fix mismatches between g_strsplit and g_free
Date: Fri, 10 Jan 2020 17:17:08 +0800
Message-ID: <20200110091710.53424-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: qemu-trivial@nongnu.org, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

v1: fix a mismatch in vl.c
v2: fix mismatch in vl.c and qga/main.c

Pan Nengyuan (2):
  vl: Don't mismatch g_strsplit()/g_free()
  qga/main: Don't mismatch g_strsplit/g_free in split_list()

 qga/main.c | 2 +-
 vl.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.21.0.windows.1



