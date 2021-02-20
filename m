Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93A320566
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:44:52 +0100 (CET)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRcx-00073L-Ix
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUJ-0007Bt-RY; Sat, 20 Feb 2021 07:35:55 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:48171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUF-0003NH-2R; Sat, 20 Feb 2021 07:35:55 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmD2M-1le0sH03yC-00iCfr; Sat, 20 Feb 2021 13:35:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] Fix SPDX-License-Identifier typos
Date: Sat, 20 Feb 2021 13:35:16 +0100
Message-Id: <20210220123525.1353731-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KOZ0nVRzrcJleXtU6EFPiPB9DPTpkqdtohovAcyiPr/Vx909Fqq
 rMgMFY2Ip6/9KQfOUCKhWxjAM9hEbfQBmKN/D11zf0R9iCI0ISweaaA13fi2CXCJAUGLxG9
 XXPJo5SylvODqlChy4hUN1F+V+vV9u8HKZpMsh5bOqzqyx6hcNoCnroiu9fbNXwm7JmjmJE
 NCLTj1wGzvMPd6zSm/VoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nGHONEtvAoo=:+NjN4ox90M5jpPpZmDIgux
 Vm3HS79XnWY1H3DUMOhlfbT3LKXhu+xGjo5oHXvuVWfrA5eoFeB3lM29H41OUJ3DyO305/J2d
 0+Yp+qwydoyliA3bOnXSEFs/M3CRT8niTuvxZtLGJDodUFePlkwGMQ99iG9126gemy0IFFbB7
 69eIyCjr1QGuDkcm8e+Zg6lcGpnPBm4HAtiDY90W0mvxpCbyFVhaQy/0tLkCRBtAxGhgNx3rg
 bVj41JURQlma9A2ogGMAyXZX9UsSn6iC5PSbBLm3fwTAcKK+PSak/k6QA8oSU6DwqCjAqvuye
 zlIbX7QZnWD60KjRc3nCJcUZgK2Rq8/MwHM3otHXCkPvrkjm0d74i6gGkvUPPPfq25ZXLTfyj
 tYSrJcLlrEkFKCdFjxypBWWciSxLCW3qzKjttjwrfIt+cpJZFFJGqcqhR31tggET63c/NopOb
 kaVmjFHZMQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Ryan Finnie <ryan@finnie.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ryan Finnie <ryan@finnie.org>

Several SPDX headers contain "SPDX-License-Identifer" (note the
missing "i" before "er"); fix these typos.

Signed-off-by: Ryan Finnie <ryan@finnie.org>
Cc: qemu-trivial@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210201200147.211914-1-ryan@finnie.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/aspeed_xdma.c         | 2 +-
 hw/misc/sbsa_ec.c             | 2 +-
 hw/sd/aspeed_sdhci.c          | 2 +-
 include/hw/misc/aspeed_xdma.h | 2 +-
 include/hw/sd/aspeed_sdhci.h  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
index dca5585a7566..533d237e3ce2 100644
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
index 9a7d7f914a97..83020fe9ac9b 100644
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
index 4f24b7d2f942..3299844de6dc 100644
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
index 9869ef472895..a2dea96984f3 100644
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
index b093d1b86123..057bc5f3d139 100644
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
2.29.2


