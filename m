Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A569A142175
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 02:32:00 +0100 (CET)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itLv4-0004Xp-V9
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 20:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1itLtU-0003cY-SL
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:30:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1itLtT-0004OG-AG
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:30:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:60692 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1itLtS-0004Gf-L6
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:30:19 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 584529DE1B80BC97B4B7;
 Mon, 20 Jan 2020 09:30:11 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 20 Jan 2020 09:30:02 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/2] Adjust some codes about memory hotplug
Date: Mon, 20 Jan 2020 09:27:53 +0800
Message-ID: <20200120012755.44581-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes extra indent and makes some code refactor related to
memory hotplug.

Changelog:

v2 -> v3
 - Addressed Peter's comments.

v1 -> v2
 - Add Igor's R-b.

Keqian Zhu (2):
  hw/acpi: Remove extra indent in ACPI GED hotplug cb
  hw/arm: Use helper function to trigger hotplug handler plug

 hw/acpi/generic_event_device.c | 2 +-
 hw/arm/virt.c                  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

--=20
2.19.1


