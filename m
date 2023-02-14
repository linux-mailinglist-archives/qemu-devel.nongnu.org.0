Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81571696CF7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:30:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS03U-0004QZ-L5; Tue, 14 Feb 2023 13:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pS03O-0004Pw-Dm; Tue, 14 Feb 2023 13:29:22 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pS03M-0002JG-Cp; Tue, 14 Feb 2023 13:29:22 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 1A248628A4;
 Tue, 14 Feb 2023 21:29:08 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 oSoib20RiCg1-QH49m7hG; Tue, 14 Feb 2023 21:29:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676399347; bh=oExmEnSydmDOONxPlt35TWtK39AcIsPYu1VStQpqN5E=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=Mw96FRDT1aSRRD/a3+RR9ds6YGCHyzl5ftqlnGbmxrgb/Akme5HJR3Cp79BCLmiEZ
 27GxHwFu0CLeWtToa7gahOfUW1dOPjZCxJpVAnOq+CV06woh5b/Ktjv9lZ/oBubbVP
 WmXUDfdbzcS04thsUnPcOX1ETiQvSAPCsT/UVddM=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@openvz.org, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, alexander.ivanov@virtuozzo.com,
 vsementsov@yandex-team.ru
Subject: [PATCH] MAINTAINERS: drop Vladimir from parallels block driver
Date: Tue, 14 Feb 2023 21:28:48 +0300
Message-Id: <20230214182848.1564714-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I have to admit this is out of my scope now. Still feel free to Cc me
directly if my help is needed :)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..12bc96f52a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3580,13 +3580,11 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
 F: block/parallels-ext.c
 F: docs/interop/parallels.txt
-T: git https://gitlab.com/vsementsov/qemu.git block
 
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.34.1


