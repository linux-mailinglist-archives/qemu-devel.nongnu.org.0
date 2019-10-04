Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44BBCC1D1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 19:37:50 +0200 (CEST)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGRWX-0001EJ-4D
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 13:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGRSO-0007mh-Bz
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 13:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGRSK-0006Yd-0c
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 13:33:29 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2082)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iGRSG-0006Rl-7Y
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 13:33:26 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35d97824d100-b8ecc;
 Sat, 05 Oct 2019 01:33:03 +0800 (CST)
X-RM-TRANSID: 2ee35d97824d100-b8ecc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.lan (unknown[180.108.8.156])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea5d978248272-cd7e8;
 Sat, 05 Oct 2019 01:33:03 +0800 (CST)
X-RM-TRANSID: 2eea5d978248272-cd7e8
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] some fix in tests/migration
Date: Sat,  5 Oct 2019 01:32:47 +0800
Message-Id: <cover.1570208781.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.79
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

v4-v3:
p1:
- remove redundant g_malloc return value judgment.
                                 [Laurent Vivier]
p3:
- always use exit_failure() as the exit function of main().
                                 [Laurent Vivier] 
- update the commit message.

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

 tests/migration/stress.c | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

-- 
2.17.1




