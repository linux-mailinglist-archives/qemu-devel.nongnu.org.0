Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B634172B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 09:13:21 +0100 (CET)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNAG0-00081r-1A
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 04:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lNAF7-0007Sq-E0
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 04:12:25 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:32789
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lNAF3-0001Ga-Iy
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 04:12:24 -0400
HMM_SOURCE_IP: 172.18.0.92:33288.604067201
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-55fc8b48a9eb46b98d05790711d220f1
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 49A09280107;
 Fri, 19 Mar 2021 16:11:58 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 55fc8b48a9eb46b98d05790711d220f1 for
 qemu-devel@nongnu.org; Fri Mar 19 16:12:12 2021
X-Transaction-ID: 55fc8b48a9eb46b98d05790711d220f1
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2] MAINTAINERS: Fix tests/migration maintainers
Date: Fri, 19 Mar 2021 16:07:57 +0800
Message-Id: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

when executing the following scripts, it throw error message:
$ ./scripts/get_maintainer.pl -f tests/migration/guestperf.py
get_maintainer.pl: No maintainers found, printing recent contributors.
get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.

add the tests/migration to the "Migration" section of MAINTAINERS

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25fc49d1dc..d3f3edb47d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2724,6 +2724,7 @@ F: tests/vmstate-static-checker-data/
 F: tests/qtest/migration-test.c
 F: docs/devel/migration.rst
 F: qapi/migration.json
+F: tests/migration/
 
 D-Bus
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
-- 
2.24.3


