Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F6A6C6461
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:03:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfHmD-0004dy-K0; Thu, 23 Mar 2023 06:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439de8c1e=anthony.perard@citrix.com>)
 id 1pfHmA-0004cj-TT
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:02:30 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439de8c1e=anthony.perard@citrix.com>)
 id 1pfHm5-00083q-Mg
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679565745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HFJfjY+7Yv5H02XdjFQjPRId4jK6+CedrGe5J2SnQbA=;
 b=TnbXXfYmQdxyD4xeoa/2O04zu0UJYjHi0zv4igquNYFPNmpt6jAxo9bw
 Usq9iPvrEtRvTKPfJOxvEuAPO0X9d6DOpyLL2rvHm0oEKGpQ5N4L3c3lH
 8mCf0TrhJ8GzM1VyoIACOCKxlEYWLrst+wCcmzM28mhG8T3+/Tb+uRNs/ M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101904701
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:PR3FGqv2H4YJQZrJdYYc0VV42+fnVDpeMUV32f8akzHdYApBsoF/q
 tZmKT+CP/eKZDenf4wkPt6+9xxSu5Xdn9Q2QQZppChmEC4R+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdj9TNS26h+WK45m4Zvtmvd4PIdvqI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zqfrjylXUlDXDCZ4TWs6THvjdTvpzPUVYVDSYPn9NF6uXTGkwT/DzVJDADm8JFVkHWWQt9aN
 gkY9zQjqYA080qkSMS7WAe3yFaIoRsDc9NVGv897keGzezJ4G6k6nMsF2AbLoZ87YlvGGJsj
 wXS9z/0OdBxmOOaFymgz7eTkRCZOgQHJ1QYSSIWTBRQtrEPv7oPYgLzosdLSfDq34arRGGpm
 FhmvwBl2exN0JdjO7GTuAme3mny/sWhohsdvF2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAYlRuvBCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hCC5FoJvcUJbCTxBUOSX25WI5pC8EQdPY69CqC8giRmO/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTPtA+U0yUPw9pBLvHr91+eZylkgDKZb7GMmTI+KPiuHFOhZ4iN4tbTOzUwzOxPjZ/ViFo
 oYEbJTiJtc2eLSWXxQ7OLU7dTgiRUXXz7iswyCLXoZv+jZbJVw=
IronPort-HdrOrdr: A9a23:imErSaqxYbAQKPYvS3m2HWEaV5oveYIsimQD101hICG9JPbo8/
 xG/c566faasl0ssR0b8+xoW5PgfZq/z/FICNIqTNKftWDd0QOVxedZgLcKqAePJ8SRzIJgPQ
 gLSdkYNDVdZ2IK7voTQWODYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; d="scan'208";a="101904701"
To: <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 1/1] accel/xen: Fix DM state change notification in dm_restrict
 mode
Date: Thu, 23 Mar 2023 10:02:00 +0000
Message-ID: <20230323100200.12986-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230323100200.12986-1-anthony.perard@citrix.com>
References: <20230323100200.12986-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=prvs=439de8c1e=anthony.perard@citrix.com;
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


