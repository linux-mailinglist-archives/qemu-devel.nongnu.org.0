Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326561ECB2A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 10:12:45 +0200 (CEST)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgOVw-0005Al-8u
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 04:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1jgOTC-0000YK-CC
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:09:54 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:55315)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jgOTA-0000EG-8I
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:09:54 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75ed75ab282d-8b290;
 Wed, 03 Jun 2020 16:09:23 +0800 (CST)
X-RM-TRANSID: 2ee75ed75ab282d-8b290
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee85ed75aae43e-61010;
 Wed, 03 Jun 2020 16:09:23 +0800 (CST)
X-RM-TRANSID: 2ee85ed75aae43e-61010
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] monitor/hmp-cmds: small improvements for migration
Date: Wed,  3 Jun 2020 16:08:55 +0800
Message-Id: <20200603080904.997083-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=221.176.66.80;
 envelope-from=maozhongyi@cmss.chinamobile.com; helo=cmccmta2.chinamobile.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 04:09:39
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

patch1 ~ patch4 have been r-b, here rebase to HEAD.
patch5 ~ patch9 mainly decorate some statistics
and minor logic changes of migration, because they
all involve migration, so merged into a patchset.

Cc: dgilbert@redhat.com
Cc: quintela@redhat.com

Mao Zhongyi (9):
  tests/migration: mem leak fix
  tests/migration: fix unreachable path in stress test
  monitor/hmp-cmds: add units for migrate_parameters
  monitor/hmp-cmds: don't silently output when running
    'migrate_set_downtime' fails
  monitor/hmp-cmds: delete redundant Error check before invoke
    hmp_handle_error()
  monitor/hmp-cmds: add 'goto end' to reduce duplicate code.
  monitor/hmp-cmds: improvements for the 'info migrate'
  docs/xbzrle: update 'cache miss rate' and 'encoding rate' to docs
  migration/ram: calculate un/encoded_size only when needed.

 docs/xbzrle.txt          |  8 +++++---
 migration/ram.c          |  9 +++++----
 monitor/hmp-cmds.c       | 30 ++++++++++++++++--------------
 tests/migration/stress.c | 34 +++++++---------------------------
 4 files changed, 33 insertions(+), 48 deletions(-)

-- 
2.17.1




