Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A2340B7C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:16:15 +0100 (CET)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwFq-0005MA-Cn
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lMviH-0003p8-7N
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:41:34 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:33985
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lMviE-0004Cb-TS
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:41:32 -0400
HMM_SOURCE_IP: 172.18.0.92:5213.679474609
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.62?logid-9429aff91a4847df80605013eefa688d
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 58B3C2800C5;
 Fri, 19 Mar 2021 00:41:15 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 9429aff91a4847df80605013eefa688d for
 qemu-devel@nongnu.org; Fri Mar 19 00:41:24 2021
X-Transaction-ID: 9429aff91a4847df80605013eefa688d
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] MAINTAINERS: Fix tests/migration maintainers
Date: Fri, 19 Mar 2021 00:40:53 +0800
Message-Id: <cb6856e3d397ee8f4e1acca33380fca6b4932119.1616085486.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Hyman <huangy81@chinatelecom.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

Signed-off-by: Hyman <huangy81@chinatelecom.cn>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25fc49d..20e2387 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2525,6 +2525,7 @@ M: Cleber Rosa <crosa@redhat.com>
 S: Odd Fixes
 F: scripts/*.py
 F: tests/*.py
+F: tests/migration/
 
 Benchmark util
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
-- 
1.8.3.1


