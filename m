Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D026C21CA9C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jul 2020 19:18:25 +0200 (CEST)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jufcO-0003mY-UO
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 13:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufbP-0002jJ-QW; Sun, 12 Jul 2020 13:17:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:52512 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufbL-00063r-VM; Sun, 12 Jul 2020 13:17:23 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jufb9-0005DF-T4; Sun, 12 Jul 2020 20:17:07 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/3] scripts/simplebench: add bench_write_req.py test
Date: Sun, 12 Jul 2020 20:17:11 +0300
Message-Id: <1594574234-73535-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/12 13:17:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The script 'bench_write_req.py' allows comparing performances of write request for two
qemu-img binary files. If you made a change in QEMU code and want to check the write
requests performance, you will want to build two qemu-img binary files with and without
your change. Then you specify paths to those binary files and put them as parameters to
the bench_write_req.py script. You may see other supported parameters in the USAGE help.

v3: Based on the Vladimir's review
  01: The test results were amended in the patch description.
  02: The python format string syntax changed to the newer one f''.
  03: The 'empty_disk' test parameter fixed to True.
  04: The function bench_write_req() was supplied with commentary.
  05: The subprocess.call() was replaced with subprocess.run().
  06: The exception handling was improved.
  07: The v2 only patch was split into three in the series.

Andrey Shinkevich (3):
  scripts/simplebench: compare write request performance
  scripts/simplebench: allow writing to non-empty image
  scripts/simplebench: add unaligned data case to bench_write_req

 scripts/simplebench/bench_write_req.py | 206 +++++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100755 scripts/simplebench/bench_write_req.py

-- 
1.8.3.1


