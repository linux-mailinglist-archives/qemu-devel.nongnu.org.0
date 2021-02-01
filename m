Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969F30B134
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 21:03:26 +0100 (CET)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fPx-0008C8-CC
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 15:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ryan@finnie.org>)
 id 1l6fP6-0007gk-3r; Mon, 01 Feb 2021 15:02:32 -0500
Received: from feh.colobox.com ([209.177.154.210]:57842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ryan@finnie.org>)
 id 1l6fP4-0008Fa-0o; Mon, 01 Feb 2021 15:02:31 -0500
Received: from linda.snowman.lan (unknown [IPv6:2600:6c4e:97f:cf46::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by feh.colobox.com (Postfix) with ESMTPSA id 38660440143;
 Mon,  1 Feb 2021 20:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=finnie.org; s=mail;
 t=1612209745; bh=EUY1j1vbrR0wwL9oFyA+kRr0jNraMTLHTnS4DlQEkLU=;
 h=From:To:Cc:Subject:Date:From;
 b=JFhw5S8OSRiCVY0B+G8L82TCF0EXdWeiVDz2eHyXAjPBWGanPKaz0Yo7iIKZj13Vx
 RwZ0N9t+9QrJQVYUMM9DcLsDSketyj5vj3q5skzUke9m3wMjtJ59Y163BRNwaIKE0K
 lnj1cxMol2UvI9MYd5G9271nXMl9Lu9zzu/QnJKAL6JPtZtcwS0u7igiBJ0bBrxe8t
 cnvJ3seqrUn7y898iTwG0HA8Lho1a69oZlqH1zu2EPA8BBOfKmhB6+SIyGOGU/0tvl
 a88jpBprCr7CVw3ZD37GJ2EGHaDLWHXl8j2a+JEQ08FP3gsdHspSeC+gJtm5h6ZECC
 iegvIgPBDU5XA==
From: Ryan Finnie <ryan@finnie.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix SPDX-License-Identifier typos
Date: Mon,  1 Feb 2021 12:01:47 -0800
Message-Id: <20210201200147.211914-1-ryan@finnie.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at feh
X-Virus-Status: Clean
Received-SPF: pass client-ip=209.177.154.210; envelope-from=ryan@finnie.org;
 helo=feh.colobox.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Ryan Finnie <ryan@finnie.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several SPDX headers contain "SPDX-License-Identifer" (note the
missing "i" before "er"); fix these typos.

Signed-off-by: Ryan Finnie <ryan@finnie.org>
Cc: qemu-trivial@nongnu.org
---
 hw/misc/aspeed_xdma.c         | 2 +-
 hw/misc/sbsa_ec.c             | 2 +-
 hw/sd/aspeed_sdhci.c          | 2 +-
 include/hw/misc/aspeed_xdma.h | 2 +-
 include/hw/sd/aspeed_sdhci.h  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
index dca5585a75..533d237e3c 100644
--- a/hw/misc/aspeed_xdma.c
+++ b/hw/misc/aspeed_xdma.c
@@ -3,7 +3,7 @@
  * Eddie James <eajames@linux.ibm.com>
  *
  * Copyright (C) 2019 IBM Corp
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 9a7d7f914a..83020fe9ac 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -7,7 +7,7 @@
  * Copyright (c) 2020 Nuvia Inc
  * Written by Graeme Gregory <graeme@nuviainc.com>
  *
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 4f24b7d2f9..3299844de6 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -3,7 +3,7 @@
  * Eddie James <eajames@linux.ibm.com>
  *
  * Copyright (C) 2019 IBM Corp
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include "qemu/osdep.h"
diff --git a/include/hw/misc/aspeed_xdma.h b/include/hw/misc/aspeed_xdma.h
index 9869ef4728..a2dea96984 100644
--- a/include/hw/misc/aspeed_xdma.h
+++ b/include/hw/misc/aspeed_xdma.h
@@ -3,7 +3,7 @@
  * Eddie James <eajames@linux.ibm.com>
  *
  * Copyright (C) 2019 IBM Corp.
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #ifndef ASPEED_XDMA_H
diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index b093d1b861..057bc5f3d1 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -3,7 +3,7 @@
  * Eddie James <eajames@linux.ibm.com>
  *
  * Copyright (C) 2019 IBM Corp
- * SPDX-License-Identifer: GPL-2.0-or-later
+ * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #ifndef ASPEED_SDHCI_H
-- 
2.25.1


