Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C401526AC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 08:10:13 +0100 (CET)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izEpA-00025l-1g
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 02:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1izEn6-0001DH-Id
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1izEn3-0008KU-Ei
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:58668 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1izEn3-0007jR-24
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:01 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 30247FF6F8568CA0DB9E;
 Wed,  5 Feb 2020 15:07:53 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 5 Feb 2020 15:07:43 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH 0/3] delay timer_new to avoid memleaks
Date: Wed, 5 Feb 2020 15:06:56 +0800
Message-ID: <20200205070659.22488-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
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
Cc: Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

This series delay timer_new into realize() to fix some memleaks when we c=
all 'device-list-properties'.

Pan Nengyuan (3):
  armv7m_systick: delay timer_new to avoid memleaks
  stm32f2xx_timer: delay timer_new to avoid memleaks
  stellaris: delay timer_new to avoid memleaks

 hw/arm/stellaris.c         | 7 ++++++-
 hw/timer/armv7m_systick.c  | 6 ++++++
 hw/timer/stm32f2xx_timer.c | 5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

--=20
2.21.0.windows.1



