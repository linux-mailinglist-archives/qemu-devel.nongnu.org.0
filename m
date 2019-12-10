Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E756E119411
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 22:15:35 +0100 (CET)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iemr0-0006th-Uz
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 16:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1iempG-0005ba-D9
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:13:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1iempF-0006Qp-83
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:13:46 -0500
Received: from nwk-aaemail-lapp03.apple.com ([17.151.62.68]:38398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1iempE-0006QI-VR
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 16:13:45 -0500
Received: from pps.filterd (nwk-aaemail-lapp03.apple.com [127.0.0.1])
 by nwk-aaemail-lapp03.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 xBALCWvO011713; Tue, 10 Dec 2019 13:13:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from : to :
 cc : subject : date : message-id : in-reply-to : references : mime-version
 : content-transfer-encoding; s=20180706;
 bh=KPjbCp1OvqehkCp81h5VXZCGtc1SO1oIyELFlH+fSrI=;
 b=ehm4JxcxsWFgbRsjtsKhX5X4pgs+Ea4sEdG6jhorr9qT4tt3i8p+We4Ovj0FQLpFPDfl
 71AVM7P49QgXg6zY55Ew8iBOAoEh8f+sojQ6e/WKa3jQayjDZw+9DhVtvIQbpwgKHial
 EF+bAtGlyhGrJqQyvk0VovMRVl2ypI51LMeGCDmOCs4pHMP2kyI+3/j+HA2PNeBFV2P/
 m1fBNxvQHChxCmlzu895v2MGf0yQ5XKgSKLlqQwx4bQOMdTYubb96ratwgMPuIIxXUdT
 MT8U4CXgdEQUL1WOT83q0P5tLklWeAFPbGYzW9mLT/yf8pHX1m046+RvuhVFcjzTjC6k bw== 
Received: from ma1-mtap-s02.corp.apple.com (ma1-mtap-s02.corp.apple.com
 [17.40.76.6])
 by nwk-aaemail-lapp03.apple.com with ESMTP id 2wrw6npu80-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 10 Dec 2019 13:13:44 -0800
Received: from nwk-mmpp-sz11.apple.com
 (nwk-mmpp-sz11.apple.com [17.128.115.155]) by ma1-mtap-s02.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q2B005D4EYV5VB0@ma1-mtap-s02.corp.apple.com>; Tue,
 10 Dec 2019 13:13:43 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz11.apple.com by
 nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q2B00H00EX78K00@nwk-mmpp-sz11.apple.com>; Tue,
 10 Dec 2019 13:13:43 -0800 (PST)
X-Va-A: 
X-Va-T-CD: c56cc4374afe9162bf6a337f3d661529
X-Va-E-CD: ef3ff8fdaaa2c382af0c9bcc3d4602d3
X-Va-R-CD: b4360681af8d1dcbc2ef0561702d4cc2
X-Va-CD: 0
X-Va-ID: 5b3ce04b-e018-43b1-be2e-231b8e60e41a
X-V-A: 
X-V-T-CD: c56cc4374afe9162bf6a337f3d661529
X-V-E-CD: ef3ff8fdaaa2c382af0c9bcc3d4602d3
X-V-R-CD: b4360681af8d1dcbc2ef0561702d4cc2
X-V-CD: 0
X-V-ID: 0225c88f-4a33-4e63-94a4-887860fb58b0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-12-10_07:,, signatures=0
Received: from pontoon.com (unknown [17.193.42.192]) by nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q2B0058KEYSTK00@nwk-mmpp-sz11.apple.com>; Tue,
 10 Dec 2019 13:13:40 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 1/1] display/bochs-display: fix memory leak
Date: Tue, 10 Dec 2019 13:13:40 -0800
Message-id: <88b8cdfd7c4e9794256f52669a0d2e8b2cd6ffdd.1576012190.git.dirty@apple.com>
X-Mailer: git-send-email 2.24.0
In-reply-to: <cover.1576012190.git.dirty@apple.com>
References: <cover.1576012190.git.dirty@apple.com>
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


