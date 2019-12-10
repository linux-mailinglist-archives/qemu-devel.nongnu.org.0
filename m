Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E61196D0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 22:29:24 +0100 (CET)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ien4N-0004P0-53
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 16:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1ien34-0003WA-Fq
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:28:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1ien33-0003HO-CY
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:28:02 -0500
Received: from nwk-aaemail-lapp03.apple.com ([17.151.62.68]:41040)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1ien33-0003Gp-4q
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:28:01 -0500
Received: from pps.filterd (nwk-aaemail-lapp03.apple.com [127.0.0.1])
 by nwk-aaemail-lapp03.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 xBALRqHT034520; Tue, 10 Dec 2019 13:28:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from : to :
 cc : subject : date : message-id : in-reply-to : references : mime-version
 : content-transfer-encoding; s=20180706;
 bh=jPIEe9yV/UBqrsNVx8RICD/Z7elvPKGB+ZDjvjMftUE=;
 b=C3iu/5LfTxR4Z3lKzt7fdoSHlJ21JsAYQBNvwXPE2pUyAcB+gP6InaGzgQ/hUshpmAOh
 k95I3XVH7aY3d2jvWUpnXXKKERcjxHUBBTJ1Ko8MMkMgVKd8Hvn9Ts+zF6qYCVmUldl5
 YwSvQRSBe/7ClsQIvwSnCXxh9CfQD44fNSuqPuY/LAFV0pkAXZuTcCXDzB9DH7YUa94v
 A165q0G+4u9zBnnc1q7Vs/YBTMPdcqpOCN3kU84w1hKK5lcFwWGiwXjgbyPOiJLoUQGq
 PhhlvIBRgNIyXsIoTp/7auopKW0u92F0n4DtgeViOJKVRazqfBcHjPnt+JJFhIgj39KF sg== 
Received: from ma1-mtap-s03.corp.apple.com (ma1-mtap-s03.corp.apple.com
 [17.40.76.7])
 by nwk-aaemail-lapp03.apple.com with ESMTP id 2wrw6nq2er-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 10 Dec 2019 13:28:00 -0800
Received: from nwk-mmpp-sz11.apple.com
 (nwk-mmpp-sz11.apple.com [17.128.115.155]) by ma1-mtap-s03.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q2B007K9FMJH060@ma1-mtap-s03.corp.apple.com>; Tue,
 10 Dec 2019 13:27:55 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz11.apple.com by
 nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q2B00H00EX18400@nwk-mmpp-sz11.apple.com>; Tue,
 10 Dec 2019 13:27:54 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 
X-Va-E-CD: 
X-Va-R-CD: 
X-Va-CD: 0
X-Va-ID: bb0480dc-4ac3-46b0-ba44-3100992be9f7
X-V-A: 
X-V-T-CD: c56cc4374afe9162bf6a337f3d661529
X-V-E-CD: 5c71d95a42745cff93579582368cfa8d
X-V-R-CD: d73b163ae0990c4642f53a5768e8f2cc
X-V-CD: 0
X-V-ID: c80e8310-4e19-460a-b43b-714de728a864
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-12-10_07:,, signatures=0
Received: from pontoon.com (unknown [17.193.42.192]) by nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q2B005WJFMITK00@nwk-mmpp-sz11.apple.com>; Tue,
 10 Dec 2019 13:27:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 1/1] display/bochs-display: fix memory leak
Date: Tue, 10 Dec 2019 13:27:54 -0800
Message-id: <d6c26e68db134c7b0c7ce8b61596ca2e65e01e12.1576013209.git.dirty@apple.com>
X-Mailer: git-send-email 2.24.0
In-reply-to: <cover.1576013209.git.dirty@apple.com>
References: <cover.1576013209.git.dirty@apple.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-10_07:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.151.62.68
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Cameron Esfahani <dirty@apple.com>
From: Cameron Esfahani via <qemu-devel@nongnu.org>

Fix memory leak in bochs_display_update().  Leaks 304 bytes per frame.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 hw/display/bochs-display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index dc1bd1641d..215db9a231 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -252,6 +252,8 @@ static void bochs_display_update(void *opaque)
             dpy_gfx_update(s->con, 0, ys,
                            mode.width, y - ys);
         }
+
+        g_free(snap);
     }
 }
 
-- 
2.24.0


