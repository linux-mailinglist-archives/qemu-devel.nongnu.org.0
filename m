Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8000D3AE8B6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:05:15 +0200 (CEST)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvIfy-00038T-II
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcZ-00008e-7v
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcV-0001L7-Qm
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624276899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IK8bIQ+SZaIvILAPUoChvvPjtRjyWSDUkZF/qxkO3ls=;
 b=OM43EdHANnoQspfNSVF1eETy2AM8hNFUWG/ZIGifrbT0UWKGeGHiPdEbRKmwpdkCEeqnFL
 OCUhtGZjg51k88vFvGCmvw86MRf6USCfhqyE1/m/euU9cR0PDs6Yj6I+xgI1nY8ciNY4Wm
 XQOcFq3j5Wc1d1bEaNqOv73sgJO8tB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-R0jeTYV5N6-n-57LX47lkw-1; Mon, 21 Jun 2021 08:01:36 -0400
X-MC-Unique: R0jeTYV5N6-n-57LX47lkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC4ED1018728;
 Mon, 21 Jun 2021 12:01:35 +0000 (UTC)
Received: from thuth.com (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 162E819C46;
 Mon, 21 Jun 2021 12:01:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/7] Remove leading underscores from QEMU defines
Date: Mon, 21 Jun 2021 14:01:23 +0200
Message-Id: <20210621120125.116377-6-thuth@redhat.com>
In-Reply-To: <20210621120125.116377-1-thuth@redhat.com>
References: <20210621120125.116377-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ahmed Abouzied <email@aabouzied.com>

Leading underscores followed by a capital letter or underscore are
reserved by the C standard.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
Message-Id: <20210605174938.13782-1-email@aabouzied.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/fpu/softfloat-helpers.h             | 4 ++--
 include/hw/usb/dwc2-regs.h                  | 4 ++--
 include/hw/usb/xlnx-usb-subsystem.h         | 4 ++--
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 4 ++--
 include/qemu/plugin-memory.h                | 4 ++--
 include/qemu/selfmap.h                      | 4 ++--
 include/user/syscall-trace.h                | 4 ++--
 plugins/plugin.h                            | 4 ++--
 tests/qtest/fuzz/qos_fuzz.h                 | 4 ++--
 tests/tcg/minilib/minilib.h                 | 4 ++--
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 34f4cf92ae..a98d759cd3 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -48,8 +48,8 @@ this code that are retained.
 ===============================================================================
 */
 
-#ifndef _SOFTFLOAT_HELPERS_H_
-#define _SOFTFLOAT_HELPERS_H_
+#ifndef SOFTFLOAT_HELPERS_H
+#define SOFTFLOAT_HELPERS_H
 
 #include "fpu/softfloat-types.h"
 
diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
index 40af23a0ba..a7eb531485 100644
--- a/include/hw/usb/dwc2-regs.h
+++ b/include/hw/usb/dwc2-regs.h
@@ -39,8 +39,8 @@
  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#ifndef __DWC2_HW_H__
-#define __DWC2_HW_H__
+#ifndef DWC2_HW_H
+#define DWC2_HW_H
 
 #define HSOTG_REG(x)	(x)
 
diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
index 739bef7f45..999e423951 100644
--- a/include/hw/usb/xlnx-usb-subsystem.h
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef _XLNX_VERSAL_USB_SUBSYSTEM_H_
-#define _XLNX_VERSAL_USB_SUBSYSTEM_H_
+#ifndef XLNX_VERSAL_USB_SUBSYSTEM_H
+#define XLNX_VERSAL_USB_SUBSYSTEM_H
 
 #include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
 #include "hw/usb/hcd-dwc3.h"
diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
index 975a717627..b76dce0419 100644
--- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
+++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
@@ -23,8 +23,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef _XLNX_USB2_REGS_H_
-#define _XLNX_USB2_REGS_H_
+#ifndef XLNX_USB2_REGS_H
+#define XLNX_USB2_REGS_H
 
 #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
 
diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
index fbbe99474b..b36def27d7 100644
--- a/include/qemu/plugin-memory.h
+++ b/include/qemu/plugin-memory.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _PLUGIN_MEMORY_H_
-#define _PLUGIN_MEMORY_H_
+#ifndef PLUGIN_MEMORY_H
+#define PLUGIN_MEMORY_H
 
 struct qemu_plugin_hwaddr {
     bool is_io;
diff --git a/include/qemu/selfmap.h b/include/qemu/selfmap.h
index 8382c4c779..80cf920fba 100644
--- a/include/qemu/selfmap.h
+++ b/include/qemu/selfmap.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _SELFMAP_H_
-#define _SELFMAP_H_
+#ifndef SELFMAP_H
+#define SELFMAP_H
 
 typedef struct {
     unsigned long start;
diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index 42e3b48b03..614cfacfa5 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -7,8 +7,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _SYSCALL_TRACE_H_
-#define _SYSCALL_TRACE_H_
+#ifndef SYSCALL_TRACE_H
+#define SYSCALL_TRACE_H
 
 #include "trace/trace-root.h"
 
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 55017e3581..b13677d0dc 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -9,8 +9,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _PLUGIN_INTERNAL_H_
-#define _PLUGIN_INTERNAL_H_
+#ifndef PLUGIN_INTERNAL_H
+#define PLUGIN_INTERNAL_H
 
 #include <gmodule.h>
 #include "qemu/qht.h"
diff --git a/tests/qtest/fuzz/qos_fuzz.h b/tests/qtest/fuzz/qos_fuzz.h
index 477f11b02b..63d8459b71 100644
--- a/tests/qtest/fuzz/qos_fuzz.h
+++ b/tests/qtest/fuzz/qos_fuzz.h
@@ -10,8 +10,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef _QOS_FUZZ_H_
-#define _QOS_FUZZ_H_
+#ifndef QOS_FUZZ_H
+#define QOS_FUZZ_H
 
 #include "tests/qtest/fuzz/fuzz.h"
 #include "tests/qtest/libqos/qgraph.h"
diff --git a/tests/tcg/minilib/minilib.h b/tests/tcg/minilib/minilib.h
index e23361380a..17d0f2f314 100644
--- a/tests/tcg/minilib/minilib.h
+++ b/tests/tcg/minilib/minilib.h
@@ -9,8 +9,8 @@
  * SPDX-License-Identifier: GPL-2.0-only
  */
 
-#ifndef _MINILIB_H_
-#define _MINILIB_H_
+#ifndef MINILIB_H
+#define MINILIB_H
 
 /*
  * Provided by the individual arch
-- 
2.27.0


