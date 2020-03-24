Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605C190774
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 09:26:24 +0100 (CET)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGetD-0000A8-5U
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 04:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36005)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGeq8-0005D6-QI
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 04:23:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGeq7-0004Wm-MH
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 04:23:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3209 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jGeq7-0004S6-9M; Tue, 24 Mar 2020 04:23:11 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BA0DD84B4C058BDE2DFB;
 Tue, 24 Mar 2020 16:23:05 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 24 Mar 2020
 16:22:57 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v4 2/3] display/blizzard: Remove redundant statement in
 blizzard_draw_line16_32()
Date: Tue, 24 Mar 2020 16:22:34 +0800
Message-ID: <20200324082235.27980-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200324082235.27980-1-kuhn.chenqun@huawei.com>
References: <20200324082235.27980-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 philmd@redhat.com, laurent@vivier.eu, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang static code analyzer show warning:
  hw/display/blizzard.c:940:9: warning: Value stored to 'data' is never r=
ead
        data >>=3D 5;
        ^        ~
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/blizzard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 359e399c2a..62517bdf75 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -937,7 +937,6 @@ static void blizzard_draw_line16_32(uint32_t *dest,
         g =3D (data & 0x3f) << 2;
         data >>=3D 6;
         r =3D (data & 0x1f) << 3;
-        data >>=3D 5;
         *dest++ =3D rgb_to_pixel32(r, g, b);
     }
 }
--=20
2.23.0



