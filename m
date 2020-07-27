Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2E22E514
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 07:01:36 +0200 (CEST)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzvGZ-0002Gb-AS
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 01:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tianjia.zhang@linux.alibaba.com>)
 id 1jzvFR-0001jq-3i
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 01:00:25 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:13253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tianjia.zhang@linux.alibaba.com>)
 id 1jzvFK-0001FY-Cx
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 01:00:20 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04397;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0U3t3dC6_1595825965; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0U3t3dC6_1595825965) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 27 Jul 2020 12:59:26 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 kraxel@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH] qemu-options.hx: Fix typo for netdev documentation
Date: Mon, 27 Jul 2020 12:59:25 +0800
Message-Id: <20200727045925.29375-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=47.88.44.36;
 envelope-from=tianjia.zhang@linux.alibaba.com;
 helo=out4436.biz.mail.alibaba.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 00:59:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: tianjia.zhang@linux.alibaba.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes the netdev document description typo in qemu-option.hx.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 708583b4ce..92556ed96d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2684,7 +2684,7 @@ SRST
     disable script execution.
 
     If running QEMU as an unprivileged user, use the network helper
-    helper to configure the TAP interface and attach it to the bridge.
+    to configure the TAP interface and attach it to the bridge.
     The default network helper executable is
     ``/path/to/qemu-bridge-helper`` and the default bridge device is
     ``br0``.
-- 
2.17.1


