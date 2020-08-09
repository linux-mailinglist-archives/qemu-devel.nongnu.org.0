Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BDD23FCEE
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Aug 2020 07:44:42 +0200 (CEST)
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k4e8P-00030v-9p
	for lists+qemu-devel@lfdr.de; Sun, 09 Aug 2020 01:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1k4dp7-0006Ox-UB
 for qemu-devel@nongnu.org; Sun, 09 Aug 2020 01:24:45 -0400
Received: from mout.gmx.net ([212.227.17.20]:52893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1k4dp5-0002rB-4u
 for qemu-devel@nongnu.org; Sun, 09 Aug 2020 01:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596950646;
 bh=WOmbPSJ1IovLaHobnoaa9ga8qpoZn56dcothAl1FiBM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Bg0ER1H8oxu+p3fHsl8qZZw5aYk8uT7NXNSich2HvWNwEpVWC+rAU9onFRA0ro7NY
 q806j/rRBmLFGvNeY24hIeT2qUhZCUvDT0kd/4oNRGzWBAktfb83zvt25AaPIHWjrC
 VMPX2/VmuIQS+93AXy2DR7tI2gk5rtiBvLGHmh60=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.185.161]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1kDGlT2dFp-00QiKj; Sun, 09
 Aug 2020 07:24:06 +0200
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 08/12] Revert "hw/display/artist: Avoid drawing line when
 nothing to display"
Date: Sun,  9 Aug 2020 07:23:58 +0200
Message-Id: <20200809052402.31641-9-deller@gmx.de>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200809052402.31641-1-deller@gmx.de>
References: <20200809052402.31641-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nDutxwXwdVKdDZE0nVk0EmY+gCenI8vyf3V6Kvrqv/ZBRIO0w1+
 fIN2Vri5uDYLeDG079wJcwfpFp0O83pAwO9i79owMcEMvlWOAMSIwPdKTa7PpzawIQ0QGv8
 SjUzmAgaqANM2be+qXYAijQlRkUpigv9FSN8OSnilRZaQFqRCtMHAW9r40yu04DCMrKsHti
 jsk7b6uA7rX4RekPj7Eyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xaQv6S+clNk=:GXVRjrqBR+dNr+heoGqF2u
 5RN3BhCiZgwhoRqU6NyBUFfRiEmmmdcnYjQB+Bkz5M+L9oQyqd3yJxWgCVUR4OIV3sfK/dKzk
 2SkozN17naxY6WjUsoGoarPF6Q6OAYZKGIx3Fi6+iCnVGH2UwGixqg6V0oYeZZB6/MviIk2FI
 6+u9UDL5GPS2Q/oY2VQDqibvml3PvJvE4tf6Yv46ejwjJ9UNU8sD4sL+OicogJHPZ5XL8WYTZ
 R0XdbKJZuIhhWpLSNNvUGugNhuINaefZJCDmNGwkzqMdncI3LZVblxwUU/grkKWPiPEdgQQz7
 hVroKi5BhITOlhsCUT4Kio63xEeeYe+LYHvXx0A+/z3H5g8qSjhOULXfZdsZ/LmAL7N8n90mm
 ceZZzt92ztwaJLA9w8kzCi3MKIsBWC2Q4L189Bwbs2JRD/rl/yKu4i3473Rmqc5wfoCl1GaN3
 73e9m/kLmhKc24sshf3dUQL0qaHOvS+koRCgyqWt+BfQvNedGfuB4PpR0D3EDRHYwZm9heSnb
 7BVJFGAH1VTNyeetpCyO3FFRMHMhVyYjn2FfdmJ0Q29LEt5JvvSlNAV/hzXFVIIUUa2Nig0FH
 6GpUpEabwmbIfggofipHPoTC6p/e9ZQbyE+BI+p4yOOpwK9rtkcviw1wkt67ISK4JpZ0woJ5C
 lg1Ale+VgDJMGCX6BetS5ep4yEaTtvywvM7JMjuptibZoi4f4QGHoOSoPYX3xziDRHOK6EpKP
 70p0wctW5ZFMyJnREpkmObB69qj44UJIy6hfNa89P+Moo6z4ocpB3VAEmRoZoAfD+kjIOIp/J
 SuYSH6vuUokj813tzGOXqQvyz2RSKK2AlwurZYOy/ZyZKRlHfVYv2vwS/0sMSNthUAH7Xe3lG
 5pF4IFIJUJL66QYtLtARsQadZ+zQWANixMrxk4tsT7UWNnOOhZ9Hlsz6Wu8tfJRfZBvz6Z9Cx
 8nrCHRWP5QxwIboo90aGK1xsqqKIThDwVWVJzS8S0EMyVCyRGQlQeZX9oTgFt5GO3VP8Cm9H/
 2dVadvhS0pg8iv8QLl78BX5JzSk5tmRTFW56ysK1tCpPDn7uP/v81LxoVuOATwz3sDJPNe/XP
 S9Zup7oWVzqxr5EcsKMD9z4yGFubYqMX7G9IRA1AxzxWMLQk2ltA+fH7xUzBt7BgVH9KCYCDk
 bh92rLkhwMXydNI1CVga9iNpt3eoGLxAftIKXrAi/86GccwE+Bz7vh0irD334y8m8o/c8j2bc
 QaI4Omy8OuWF0ock1
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/09 01:24:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit b0f6455feac97e41045ee394e11c24d92c370f6e.
It's wrong. A line could even be a dot.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 47de17b9e9..f37aa9eb49 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -591,9 +591,6 @@ static void draw_line(ARTISTState *s, int x1, int y1, =
int x2, int y2,
     } else {
         dy =3D y1 - y2;
     }
-    if (!dx || !dy) {
-        return;
-    }

     c1 =3D false;
     if (dy > dx) {
=2D-
2.21.3


