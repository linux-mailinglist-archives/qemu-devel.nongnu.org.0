Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795ACAF4B0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 05:33:34 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7tNt-0008QC-IN
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 23:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tM0-00077l-5x
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLz-0003mf-9C
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:36 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:8685)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLy-0003fM-HL
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:35 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75d786a800f3-eb8c6;
 Wed, 11 Sep 2019 11:31:12 +0800 (CST)
X-RM-TRANSID: 2ee75d786a800f3-eb8c6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15d786a7b269-ac9a1;
 Wed, 11 Sep 2019 11:31:12 +0800 (CST)
X-RM-TRANSID: 2ee15d786a7b269-ac9a1
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 11:31:01 +0800
Message-Id: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.80
Subject: [Qemu-devel] [PATCH v2 0/3] some fix in tests/migration
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
Cc: tony.nguyen@bt.com, alex.bennee@linaro.org, armbru@redhat.com,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset mainly fixes memory leak, typo and return
value of stress function in stress test.

v2->v1:
- use g_autofree to release memory automatically instead
  of free().                     [Alex Bennée]
                      
Cc: armbru@redhat.com 
Cc: laurent@vivier.eu 
Cc: tony.nguyen@bt.com
Cc: alex.bennee@linaro.org

Mao Zhongyi (3):
  tests/migration: mem leak fix
  tests/migration: fix a typo in comment
  tests/migration：fix unreachable path in stress test

 tests/migration/stress.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
2.17.1




