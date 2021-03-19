Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1CE3412DA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 03:32:40 +0100 (CET)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN4wJ-0001Iu-JG
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 22:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lN4uG-0000km-Q2
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 22:30:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:41285
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lN4uE-0008Qj-HP
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 22:30:32 -0400
HMM_SOURCE_IP: 172.18.0.48:5542.1285586883
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-de65d07bcb3640c49a8b4ec1eb81fc7b
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 731702800A5;
 Fri, 19 Mar 2021 10:30:21 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id de65d07bcb3640c49a8b4ec1eb81fc7b for
 qemu-devel@nongnu.org; Fri Mar 19 10:30:25 2021
X-Transaction-ID: de65d07bcb3640c49a8b4ec1eb81fc7b
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v1] MAINTAINERS: Fix tests/migration maintainers
Date: Fri, 19 Mar 2021 10:25:13 +0800
Message-Id: <2d8e1deedd754dda36802f26bcdfcbf7adde2679.1616120469.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25fc49d1dc..20e2387c66 100644
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
2.24.3


