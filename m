Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61596C80EC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfiqM-00077N-GQ; Fri, 24 Mar 2023 10:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfiqJ-00074T-1S
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:56:35 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfiqE-0008LX-Tb
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679669790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HFJfjY+7Yv5H02XdjFQjPRId4jK6+CedrGe5J2SnQbA=;
 b=iizwg2Wxfkmdty7WbSxww+xgRL/TXNoMR56nRwdHz/tOnwCXwCUxc8kd
 5VXaisIUn/tfOOSwE35YyBO8czoLTVmE1ySzEKzQGUFqWbVcmY3oq9Bp6
 rk6DhOGVuCgzTaM058wIB8bozNPwYD0NOD6MCFCpZFPpZNjJvkHOjZZcz M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102115404
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+OuY3qkVJxTHPNcABYYSqvfo5gz6JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWW6FaKmIYmv9KIx1bY+z8BwEsMTdzNY3GQRuqnw8HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eAJFBIJVTqvu8u7/KmYTu53guQFLsa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A/
 DufojihXnn2MvTc9xqrqWyzn9bXvjj3YplMM5Hp8vhD1Qj7Kms7V0RNCArTTeOCokKhXs13I
 kkd6C0o66M1slGoJvHkUhil5XKJoBMYc9xXFeI89UeK0KW8yx6UGmUeCDtIedArsMseQT0s3
 0WO2dTzClRSXKa9ECzHsO3O9HXrZHZTdDVZDcMZcecby8XynKM3tTjjcv9uLLWWitruHRHWw
 T/f+UDSmI4vYd43O7STpA6Y0mzy+8KSFmbZ9S2MADv7s1oRiJqNItXxtAOFtasowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWN4umsWyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4u0C6GKM4IXPMYtHONiwM2JTRD44owQuBJ0zfFX1
 WmzKK5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOLEDFbMEOdtDbd7RrxhhE9yiFmPo
 ok32grj40k3bdASlQGMqdRJcgtacyNrbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:P1VrC6jmCPymcYfvrj1PyClvlnBQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqKRIdcK+7Scu9qB/nm6KdgrN8AV7BZmnbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; d="scan'208";a="102115404"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, David Woodhouse
 <dwmw@amazon.co.uk>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 1/2] accel/xen: Fix DM state change notification in dm_restrict
 mode
Date: Fri, 24 Mar 2023 14:56:12 +0000
Message-ID: <20230324145613.41502-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324145613.41502-1-anthony.perard@citrix.com>
References: <20230324145613.41502-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=prvs=440da7b32=anthony.perard@citrix.com;
 helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

When dm_restrict is set, QEMU isn't permitted to update the XenStore node
to indicate its running status. Previously, the xs_write() call would fail
but the failure was ignored.

However, in refactoring to allow for emulated XenStore operations, a new
call to xs_open() was added. That one didn't fail gracefully, causing a
fatal error when running in dm_restrict mode.

Partially revert the offending patch, removing the additional call to
xs_open() because the global 'xenstore' variable is still available; it
just needs to be used with qemu_xen_xs_write() now instead of directly
with the xs_write() libxenstore function.

Also make the whole thing conditional on !xen_domid_restrict. There's no
point even registering the state change handler to attempt to update the
XenStore node when we know it's destined to fail.

Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
Reported-by: Jason Andryuk <jandryuk@gmail.com>
Co-developed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
Message-Id: <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 accel/xen/xen-all.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 00221e23c5..5ff0cb8bd9 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -32,28 +32,13 @@ xendevicemodel_handle *xen_dmod;
 
 static void xenstore_record_dm_state(const char *state)
 {
-    struct xs_handle *xs;
     char path[50];
 
-    /* We now have everything we need to set the xenstore entry. */
-    xs = xs_open(0);
-    if (xs == NULL) {
-        fprintf(stderr, "Could not contact XenStore\n");
-        exit(1);
-    }
-
     snprintf(path, sizeof (path), "device-model/%u/state", xen_domid);
-    /*
-     * This call may fail when running restricted so don't make it fatal in
-     * that case. Toolstacks should instead use QMP to listen for state changes.
-     */
-    if (!xs_write(xs, XBT_NULL, path, state, strlen(state)) &&
-            !xen_domid_restrict) {
+    if (!qemu_xen_xs_write(xenstore, XBT_NULL, path, state, strlen(state))) {
         error_report("error recording dm state");
         exit(1);
     }
-
-    xs_close(xs);
 }
 
 
@@ -111,7 +96,15 @@ static int xen_init(MachineState *ms)
         xc_interface_close(xen_xc);
         return -1;
     }
-    qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+
+    /*
+     * The XenStore write would fail when running restricted so don't attempt
+     * it in that case. Toolstacks should instead use QMP to listen for state
+     * changes.
+     */
+    if (!xen_domid_restrict) {
+        qemu_add_vm_change_state_handler(xen_change_state_handler, NULL);
+    }
     /*
      * opt out of system RAM being allocated by generic code
      */
-- 
Anthony PERARD


