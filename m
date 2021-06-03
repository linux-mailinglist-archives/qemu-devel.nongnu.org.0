Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464843998C7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:58:52 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeVP-0002Kl-DP
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQQ-0008H4-99
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:42 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:49196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQO-0004Y6-Nl
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692419; bh=hxX3lW6G5H4ooVs5K1Wg9MuwXQMZOQOBKRZ+VQtVT+I=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=fQg1AheaLdCnzMAs+MysgIrU5JY8UVq+CUT/+el49UaMYUmsbEVtuV5G9Nj3iZiwU
 dWapvpX6LcnTcWpxYoxSmujDAZNYQNww4Q0h57NqKjeeh71cod5qAGYWQsu7f1VjwM
 6/PLRbthVNM/O/HT5ew4FcepYrwvxMd9Jca81zI+NME1a+OJZFYt0Ujk6HCidcZAfZ
 i5M2Ur/8fDDkZngl/cba/4azq4uQZ0REgQMFmml/jdnVTH2qaXkrPsSBKwsLwhrbWu
 xHDpR63TAdHF1jVChBILfEYERngCvmzyL2h3QCYVF20h1CVBU+XeMD7M8V5Vi2pN+M
 70DocpeSJ9l1Q==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 761F04A03E7;
 Thu,  3 Jun 2021 03:53:39 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 4/8] Make some PCI macros available to other files.  NFC.
Date: Wed,  2 Jun 2021 20:53:13 -0700
Message-Id: <20210603035317.6814-5-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603035317.6814-1-thorpej@me.com>
References: <20210603035317.6814-1-thorpej@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-03=5F01:2021-06-02=5F03,2021-06-03=5F01,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=755
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106030024
Received-SPF: pass client-ip=17.58.23.185; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06011101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Move PCI_DEVFN(), PCI_BUS(), PCI_SLOT(), and PCI_FUNC() to pci.h.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 pci.c | 4 ----
 pci.h | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/pci.c b/pci.c
index 87a101c..ba05adb 100644
--- a/pci.c
+++ b/pci.c
@@ -31,10 +31,6 @@
 #include "pci_regs.h"
 
 
-#define PCI_DEVFN(slot, func)	((((slot) & 0x1f) << 3) | ((func) & 0x07))
-#define PCI_BUS(devfn)		((devfn) >> 8)
-#define PCI_SLOT(devfn)		(((devfn) >> 3) & 0x1f)
-#define PCI_FUNC(devfn)		((devfn) & 0x07)
 #define PCI_SLOT_MAX		32
 #define PCI_FUNC_MAX		8
 #define PCI_REGION_ROM		6
diff --git a/pci.h b/pci.h
index b751c6f..b4a4f80 100644
--- a/pci.h
+++ b/pci.h
@@ -60,6 +60,11 @@ extern void pci_config_maskw(int bdf, int addr, uint16_t off, uint16_t on);
 
 extern int pci_next(int bdf, int *pmax);
 
+#define PCI_DEVFN(slot, func)	((((slot) & 0x1f) << 3) | ((func) & 0x07))
+#define PCI_BUS(devfn)		((devfn) >> 8)
+#define PCI_SLOT(devfn)		(((devfn) >> 3) & 0x1f)
+#define PCI_FUNC(devfn)		((devfn) & 0x07)
+
 #define foreachpci(BDF, MAX)				\
 	for (MAX = 0x0100, BDF = pci_next(0, &MAX);	\
 	     BDF >= 0;					\
-- 
2.30.2


