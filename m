Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CCBCB392
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 05:47:30 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGEYy-0005Hj-Ry
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 23:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGEVv-0003mt-08
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:44:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGEVt-0001k9-I8
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:44:18 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:2631)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGEVs-0001dC-PZ
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:44:17 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee85d96c000b64-b287d;
 Fri, 04 Oct 2019 11:44:00 +0800 (CST)
X-RM-TRANSID: 2ee85d96c000b64-b287d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.lan (unknown[180.108.8.156])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15d96bff81ac-a1ae6;
 Fri, 04 Oct 2019 11:44:00 +0800 (CST)
X-RM-TRANSID: 2ee15d96bff81ac-a1ae6
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] some fix in tests/migration
Date: Fri,  4 Oct 2019 11:43:45 +0800
Message-Id: <cover.1570159624.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
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

v3->v2:
p1: 
- replace malloc with g_malloc   [Laurent Vivier]
p3:
- change stressone type to void and stree return value
  to -1 to make the path of 'if (stress(ramsizeGB, ncpus) < 0)'
  can be reached.                [Laurent Vivier]
- update the commit message.

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

 tests/migration/stress.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

-- 
2.17.1




