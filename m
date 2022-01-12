Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85548C0B7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:06:38 +0100 (CET)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZaX-0005rs-P8
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Z8s-0008LX-Gj
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:38:03 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:31838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Z8n-0003TA-Po
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:38:02 -0500
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 20C84OIb000107
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 16:04:24 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20C832K4099908;
 Wed, 12 Jan 2022 16:03:02 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 Jan
 2022 16:09:39 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] Supporting AST2600 HACE engine accumulative mode
Date: Wed, 12 Jan 2022 16:09:35 +0800
Message-ID: <20220112080937.366835-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20C832K4099908
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: leetroy@gmail.com, hailin.wu@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series implements ast2600 hace engine with accumulative mode
and unit test against to it.

Changes in v2:
- Coding style
- Add accumulative mode description in comment
- Add unit test cases

Troy Lee (2):
  hw/misc: Supporting AST2600 HACE accumulative mode
  tests/qtest: Add test for Aspeed HACE accumulative mode

 hw/misc/aspeed_hace.c          |  43 ++++++++--
 include/hw/misc/aspeed_hace.h  |   1 +
 tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+), 8 deletions(-)

-- 
2.25.1


