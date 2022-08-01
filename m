Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C828B586CD8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:30:27 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWR6-0005qs-V1
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=205475a44=ross.lagerwall@citrix.com>)
 id 1oIWOs-0002bL-6P
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:28:06 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:14610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=205475a44=ross.lagerwall@citrix.com>)
 id 1oIWOo-0003xL-Vk
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1659364082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ARGA0gKIiGBvQSFWk7afGcDlpgI0Qi+VoiklDWhO9TE=;
 b=O+DuN11VJQsE0vvYerqLpctok7W3pg5R1Gi2ngqziNsURnCHDvSuzrk1
 JP9pdMyJ5PkXvAdrXWIoH3rPbkqZr9lQCdefXASvH5+IVRr6NfAjLypMK
 E5FG859Y7mLCuYYDHGwO3MmqL7T/T1RdRZsWOxc8AOANqqbTN5kHZyxAB I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76870313
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YeuF4q7B1XQLpGCHqr7NHAxRtF3HchMFZxGqfqrLsTDasY5as4F+v
 jMYXGDSafuIa2D8Lt10O97n8UoFv5CEmtIxSgQ5+yhnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5K2q4Vv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJG0/AIlBobYrO1hL8
 85CKCw/VUC6hu3jldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESwdIIUxRDJsxkf23j337WzZZtEiUtew85G27IAlZj+a9b4KOI4fiqcN9tUWgl
 GjEvEfAMzYGL/i75ieM11eMv7qa9c/8cN1LT+DpnhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN80jEyoKY78kaDStj7Qg3+vniJolgdUd8WGOo/gDxh0YKNvVzfXDJdCGccNpp276faWADGy
 Hellu7tXGc/7IesTHSvrLeInwjiACkaeDpqiTA/cecV3zXyiNht00OXE4c+SP/dYs7dQm+pn
 W3TxMQqr/BK1JNQif3mlbzSq2j0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AztJcvU/MB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk0Y5xVI2K1P
 heM4mu9AaO/21PzNMdKj3+ZUZx2ncAM6/y/PhwrUja+SscoL1LWlM2fTUWRw3rsgCARrE3LA
 r/CKJ7EJStLVsxaIM+eHbh1PUkDmn9jngs+hPnTk3ya7FZpTCfOEutcbwLRNLtRAWHtiFy9z
 uuz/vCik313ONASqAGNmWLPBTjm9UQGOK0=
IronPort-HdrOrdr: A9a23:JyhBJa+qJXO9+EzcDOVuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+MjztCWE7gr5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslrd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.93,208,1654574400"; d="scan'208";a="76870313"
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
CC: <qemu-devel@nongnu.org>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] tpm_emulator: Avoid double initialization during migration
Date: Mon, 1 Aug 2022 15:27:25 +0100
Message-ID: <20220801142725.815399-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=205475a44=ross.lagerwall@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

When resuming after a migration, the backend sends CMD_INIT to the
emulator from the startup callback, then it sends the migration state
from the vmstate to the emulator, then it sends CMD_INIT again. Skip the
first CMD_INIT during a migration to avoid initializing the TPM twice.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 backends/tpm/tpm_emulator.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 87d061e9bb..9b50c5b3e2 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -32,6 +32,7 @@
 #include "qemu/sockets.h"
 #include "qemu/lockable.h"
 #include "io/channel-socket.h"
+#include "sysemu/runstate.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
 #include "tpm_int.h"
@@ -383,6 +384,15 @@ err_exit:
 
 static int tpm_emulator_startup_tpm(TPMBackend *tb, size_t buffersize)
 {
+    /* TPM startup will be done from post_load hook */
+    if (runstate_check(RUN_STATE_INMIGRATE)) {
+        if (buffersize != 0) {
+            return tpm_emulator_set_buffer_size(tb, buffersize, NULL);
+        }
+
+        return 0;
+    }
+
     return tpm_emulator_startup_tpm_resume(tb, buffersize, false);
 }
 
-- 
2.31.1


