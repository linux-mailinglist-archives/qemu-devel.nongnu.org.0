Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B3559D5D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:30:32 +0200 (CEST)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lGR-0000NI-DI
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4lDf-0004qk-UB
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:27:39 -0400
Received: from mail-108-mta16.mxroute.com ([136.175.108.16]:33141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1o4lDd-0006fl-DT
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:27:39 -0400
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta16.mxroute.com (ZoneMTA) with ESMTPSA id 18196534fc900028a7.002
 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Fri, 24 Jun 2022 15:27:31 +0000
X-Zone-Loop: 46311864f7bb84992b755e2cefb2b5597deac933356d
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lsj4poOhkRXMO+Ri5SPBvoTEDMYzgBAursYt1KkJfpE=; b=aleDj7eV7VADYCVy5DgIhA55Ps
 4OtRzdugITf8vLRpiTQKlISbRNcPC7lX6tcdDpWnZs9sGmmKddIssAgTj3DqshVafIQ/Ulxyw3dij
 YhRRI5NBPLGsi0imYwYCrIziKv9FsRAJDc14XImHlob260n8C07HgUyKW8YChaMWa2AnPfCL8GjYl
 kt8kxUAX9ME1N975GxLRk5o5RB5uwGnfrul5jf0Fks4jepE9n42odcjK/ZoPeB8tDf0uI3MgTGir3
 FQP8499Taf7zk0+9eONINBRtCAxV0pd4/RbwqLQ6x/glxzVOr9GbrPWNyjNb2+zT4JC1j3NbO2dS1
 NnFdwVFA==;
From: MkfsSion <mkfssion@mkfssion.com>
To: qemu-devel@nongnu.org
Cc: MkfsSion <mkfssion@mkfssion.com>, Hongren Zheng <i@zenithal.me>,
 "Canokeys.org" <contact@canokeys.org>
Subject: [PATCH v2 2/2] docs/system/devices/canokey: Document limitations on
 usb-ehci
Date: Fri, 24 Jun 2022 23:26:26 +0800
Message-Id: <20220624152626.11565-2-mkfssion@mkfssion.com>
In-Reply-To: <20220624152626.11565-1-mkfssion@mkfssion.com>
References: <20220624152626.11565-1-mkfssion@mkfssion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
Received-SPF: pass client-ip=136.175.108.16;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta16.mxroute.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Signed-off-by: MkfsSion <mkfssion@mkfssion.com>
---
 docs/system/devices/canokey.rst | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
index 169f99b8eb..650702ad8a 100644
--- a/docs/system/devices/canokey.rst
+++ b/docs/system/devices/canokey.rst
@@ -146,15 +146,9 @@ multiple CanoKey QEMU running, namely you can not
 Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
 can not read one canokey-file at the same time.
 
-Another limitation is that this device is not compatible with ``qemu-xhci``,
-in that this device would hang when there are FIDO2 packets (traffic on
-interrupt endpoints). If you do not use FIDO2 then it works as intended,
-but for full functionality you should use old uhci/ehci bus and attach canokey
-to it, for example
-
-.. parsed-literal::
-
-   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
+Another limitation is that this device is not compatible with ``usb-ehci``
+since we removed high-speed mode support. When a full-speed device attach
+to a high-speed port, ``usb-ehci`` would complain about speed mismatch.
 
 References
 ==========
-- 
2.36.1


