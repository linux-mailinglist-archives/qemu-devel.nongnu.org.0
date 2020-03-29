Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E3196B67
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Mar 2020 07:03:24 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIQ6V-0000Tb-Iw
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 01:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5M-00086B-5U
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5L-0005Ui-14
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:11 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:10347)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jIQ5K-000596-Ed
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 01:02:10 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65e802bb4ab0-f3935;
 Sun, 29 Mar 2020 13:01:40 +0800 (CST)
X-RM-TRANSID: 2ee65e802bb4ab0-f3935
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.localdomain (unknown[117.136.46.37])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e802baee64-267a6;
 Sun, 29 Mar 2020 13:01:40 +0800 (CST)
X-RM-TRANSID: 2ee65e802baee64-267a6
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Improved reporting for migrate parameters
Date: Sun, 29 Mar 2020 13:01:28 +0800
Message-Id: <20200329050131.26864-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series mainly improve the report message of migrate parameters
to make it easier to read.

Cc: quintela@redhat.com
Cc: dgilbert@redhat.com

Mao Zhongyi (3):
  migration/migration: improve error reporting for migrate parameters
  monitor/hmp-cmds: add hmp_handle_error() for hmp_migrate_set_speed()
  migration: move the units of migrate parameters from milliseconds to
    ms.

 migration/migration.c | 17 +++++++++--------
 monitor/hmp-cmds.c    | 13 ++++++++-----
 2 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.17.1




