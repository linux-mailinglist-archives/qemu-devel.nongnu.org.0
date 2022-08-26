Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DD5A2B11
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:25:11 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbCn-0003pM-35
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=230e0beed=ross.lagerwall@citrix.com>)
 id 1oRaUv-0001zx-5g
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:39:49 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:9262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=230e0beed=ross.lagerwall@citrix.com>)
 id 1oRaUc-0008Jn-6m
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1661524770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qOHz7UwiXZ4COUOR8BPF1+HdCeBnln/qDcLQAxAw3J4=;
 b=eVQqb9kHx/xOzgQ1FYEeE2AwfAeV3ityOHPhqH2ES0Jm2+2hj8aI89h1
 CERRdFb8y+36Rj/IG+md0JIKyTNzGpkf43Y3/DFkcVAyXk1kThB7QWNC2
 etM3Lt01niJ2E0qxetpw0zDFm8e+/RpavzzeWwxe8wexZRlpB9d3QRlzH A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78787761
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:P9KyL6PRwz92HoDvrR35l8FynXyQoLVcMsEvi/4bfWQNrUoi0D0Ay
 2cXWmqOb/+Ka2P1ett0boq0o0gHsJWAyNY2Swto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/jd8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP879hRBmYnEbce0dwtDDpfy
 eM8Nj0CO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJ1aw/bJRlGNVoNF5s6mM+jh2Xlci0eo1WQzUYyyzeDk1wuj+a0WDbTUvm1RepHwhy+n
 UGFwHzlXAwRNuCdyRPQpxpAgceQxHimCer+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM/pEN
 0Ea8ywkhawz8lG7CMf7UgH+oXSB+BUbXrJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeVRAH6
 VWujv/TAxdV6rDOWE6C0qmZombnUcQKFlPudRPoXCNcvYe6/NFv1k+XJjpwOPXr14OoQFkc1
 xjP9XFj3OtL0Kbnwo3hpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeODEtYji9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvmgieR02a5ZUIWOBj
 KrvVeR5tfdu0IaCN/crM+pd9exxpUQfKTgVfq+NNYcfCnSAXASG4DtvdSat4owZq2B1yPlXB
 HtuWZzzZZrsIfg4kWHeqiZ0+eND+x3SMkuIFcyhk0n4iub2ibz8Ye5tDWZip9sRtMusyDg5O
 f4FXydW432ziNHDXxQ=
IronPort-HdrOrdr: A9a23:g4QDn6pOm3UCziQ1we6xDgoaV5oleYIsimQD101hICG8cqSj9v
 xG+85rsiMc6QxhIU3I9urwW5VoLUmyyXcX2/h0AV7BZniFhILAFugLhuGOrwEIcxeOkNK1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.93,265,1654574400"; d="scan'208";a="78787761"
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
CC: <qemu-devel@nongnu.org>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] tpm_crb: Avoid backend startup just before shutdown under Xen
Date: Fri, 26 Aug 2022 15:38:41 +0100
Message-ID: <20220826143841.1515326-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=230e0beed=ross.lagerwall@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Ross Lagerwall <ross.lagerwall@citrix.com>
From:  Ross Lagerwall via <qemu-devel@nongnu.org>

When running under Xen and the guest reboots, it boots into a new domain
with a new QEMU process (and a new swtpm process if using the emulator
backend). The existing reset function is triggered just before the old
QEMU process exists which causes QEMU to startup the TPM backend and
then immediately shut it down. This is probably harmless but when using
the emulated backend, it wastes CPU and IO time reloading state, etc.

Fix this by calling the reset function directly from realize() when
running under Xen. During a reboot, this will be called by the QEMU
process for the new domain.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

This conditional logic is ugly. Is there a cleaner way of doing this?

 hw/tpm/tpm_crb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 67db594c48..ea930da545 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -26,6 +26,7 @@
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
 #include "sysemu/reset.h"
+#include "sysemu/xen.h"
 #include "tpm_prop.h"
 #include "tpm_ppi.h"
 #include "trace.h"
@@ -308,7 +309,11 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
                      TPM_PPI_ADDR_BASE, OBJECT(s));
     }
 
-    qemu_register_reset(tpm_crb_reset, dev);
+    if (xen_enabled()) {
+        tpm_crb_reset(dev);
+    } else {
+        qemu_register_reset(tpm_crb_reset, dev);
+    }
 }
 
 static void tpm_crb_class_init(ObjectClass *klass, void *data)
-- 
2.31.1


