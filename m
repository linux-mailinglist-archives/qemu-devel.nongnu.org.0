Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E9AEA10
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 14:13:30 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7f1V-0007W4-QK
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 08:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyN-0006EO-10
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyI-0006FX-1C
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:14 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:4343)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyH-0006CV-BI
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:09 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25d77928ab16-e24b7;
 Tue, 10 Sep 2019 20:09:47 +0800 (CST)
X-RM-TRANSID: 2ee25d77928ab16-e24b7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35d7792822a8-7d7da;
 Tue, 10 Sep 2019 20:09:46 +0800 (CST)
X-RM-TRANSID: 2ee35d7792822a8-7d7da
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 20:09:24 +0800
Message-Id: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] [PATCH 0/3] some fix in tests/migration
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
Cc: tony.nguyen@bt.com, armbru@redhat.com,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset mainly fixes memory leak, typo and return
value of stress function in stress test.

Cc: armbru@redhat.com
Cc: laurent@vivier.eu
Cc: tony.nguyen@bt.com

Mao Zhongyi (3):
  tests/migration: mem leak fix
  tests/migration: fix a typo in comment
  tests/migration：fix unreachable path in stress test

 tests/migration/stress.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.17.1




