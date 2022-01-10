Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C547F489297
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:47:05 +0100 (CET)
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pOS-0001qJ-Q9
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:47:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n6ozz-00046s-W3
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:21:50 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:12288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n6ozw-0002Ta-UR
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:21:47 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20A7Ew8R025366;
 Mon, 10 Jan 2022 15:14:58 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 10 Jan
 2022 15:21:27 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] Aspeed I3C device model
Date: Mon, 10 Jan 2022 15:21:23 +0800
Message-ID: <20220110072125.1886683-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20A7Ew8R025366
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

This series of patch introduce a dummy implemenation of aspeed i3c
model, and it provide just enough information for guest machine.
However, the driver probing is still failed, but it will not cause
kernel panic.

v2:
- Split i3c model into i3c and i3c_device
- Create 6x i3c devices
- Using register fields macro
- Rebase to mainline QEMU

Troy Lee (2):
  hw/misc: Implementating dummy AST2600 I3C model
  hw/arm/aspeed_ast2600: create i3c instance

 hw/arm/aspeed_ast2600.c      |  19 +-
 hw/misc/aspeed_i3c.c         | 410 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 hw/misc/trace-events         |   6 +
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_i3c.h |  57 +++++
 6 files changed, 495 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_i3c.c
 create mode 100644 include/hw/misc/aspeed_i3c.h

-- 
2.25.1


