Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149828BF44
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 19:55:45 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS22y-0002k4-HR
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 13:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS20Q-0000YY-1t; Mon, 12 Oct 2020 13:53:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:34890 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS20O-0008DV-HL; Mon, 12 Oct 2020 13:53:05 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kS1zS-0047iC-7N; Mon, 12 Oct 2020 20:52:06 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com, fam@euphon.net,
 stefanha@redhat.com, armbru@redhat.com, jsnow@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v11 11/13] stream: mark backing-file argument as deprecated
Date: Mon, 12 Oct 2020 20:43:23 +0300
Message-Id: <1602524605-481160-12-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602524605-481160-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1602524605-481160-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 13:44:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

Whereas the block-stream job starts using a backing file name of the
base node overlay after the block-stream job completes, mark the QMP
'backing-file' argument as deprecated.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 docs/system/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 8b3ab5b..7491fcf 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -285,6 +285,12 @@ details.
 The ``query-events`` command has been superseded by the more powerful
 and accurate ``query-qmp-schema`` command.
 
+``block-stream`` argument ``backing-file`` (since 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The argument ``backing-file`` is deprecated. QEMU uses a backing file
+name of the base node overlay after the block-stream job completes.
+
 chardev client socket with ``wait`` option (since 4.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
-- 
1.8.3.1


