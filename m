Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D281B1D3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 10:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ6F7-0008NB-9M
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 04:23:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Ad-0004ed-62
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Ab-0007e0-85
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQ6Aa-0007d1-Vj
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:49 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D293882F0
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F9017500
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E50AF113306F; Mon, 13 May 2019 10:18:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 10:18:43 +0200
Message-Id: <20190513081844.26699-9-armbru@redhat.com>
In-Reply-To: <20190513081844.26699-1-armbru@redhat.com>
References: <20190513081844.26699-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 13 May 2019 08:18:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 8/9] Normalize header guard symbol definition.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We commonly define the header guard symbol without an explicit value.
Normalize the exceptions.

Done with scripts/clean-header-guards.pl.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190315145123.28030-8-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/m48t59-internal.h    | 3 ++-
 include/disas/capstone.h      | 2 +-
 include/hw/scsi/emulation.h   | 2 +-
 include/qemu/stats64.h        | 2 +-
 include/qemu/sys_membarrier.h | 2 +-
 include/qemu/systemd.h        | 2 +-
 include/scsi/utils.h          | 2 +-
 include/ui/kbd-state.h        | 3 ++-
 scsi/pr-helper.h              | 3 ++-
 target/i386/hvf/x86.h         | 2 +-
 target/i386/hvf/x86_decode.h  | 2 +-
 target/i386/hvf/x86_descr.h   | 2 +-
 12 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/timer/m48t59-internal.h b/hw/timer/m48t59-internal.h
index d0f0caf3c7..4d4f2a6fed 100644
--- a/hw/timer/m48t59-internal.h
+++ b/hw/timer/m48t59-internal.h
@@ -22,8 +22,9 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
  * THE SOFTWARE.
  */
+
 #ifndef HW_M48T59_INTERNAL_H
-#define HW_M48T59_INTERNAL_H 1
+#define HW_M48T59_INTERNAL_H
=20
 #define M48T59_DEBUG 0
=20
diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index 84e214956d..e29068dd97 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -1,5 +1,5 @@
 #ifndef QEMU_CAPSTONE_H
-#define QEMU_CAPSTONE_H 1
+#define QEMU_CAPSTONE_H
=20
 #ifdef CONFIG_CAPSTONE
=20
diff --git a/include/hw/scsi/emulation.h b/include/hw/scsi/emulation.h
index 09fba1ff39..9521704326 100644
--- a/include/hw/scsi/emulation.h
+++ b/include/hw/scsi/emulation.h
@@ -1,5 +1,5 @@
 #ifndef HW_SCSI_EMULATION_H
-#define HW_SCSI_EMULATION_H 1
+#define HW_SCSI_EMULATION_H
=20
 typedef struct SCSIBlockLimits {
     bool wsnz;
diff --git a/include/qemu/stats64.h b/include/qemu/stats64.h
index 4a357b3e9d..19a5ac4c56 100644
--- a/include/qemu/stats64.h
+++ b/include/qemu/stats64.h
@@ -10,7 +10,7 @@
  */
=20
 #ifndef QEMU_STATS64_H
-#define QEMU_STATS64_H 1
+#define QEMU_STATS64_H
=20
 #include "qemu/atomic.h"
=20
diff --git a/include/qemu/sys_membarrier.h b/include/qemu/sys_membarrier.=
h
index 316e3dc4a2..b5bfa21d52 100644
--- a/include/qemu/sys_membarrier.h
+++ b/include/qemu/sys_membarrier.h
@@ -7,7 +7,7 @@
  */
=20
 #ifndef QEMU_SYS_MEMBARRIER_H
-#define QEMU_SYS_MEMBARRIER_H 1
+#define QEMU_SYS_MEMBARRIER_H
=20
 #ifdef CONFIG_MEMBARRIER
 /* Only block reordering at the compiler level in the performance-critic=
al
diff --git a/include/qemu/systemd.h b/include/qemu/systemd.h
index e6a877e5c6..f0ea1266d5 100644
--- a/include/qemu/systemd.h
+++ b/include/qemu/systemd.h
@@ -11,7 +11,7 @@
  */
=20
 #ifndef QEMU_SYSTEMD_H
-#define QEMU_SYSTEMD_H 1
+#define QEMU_SYSTEMD_H
=20
 #define FIRST_SOCKET_ACTIVATION_FD 3 /* defined by systemd ABI */
=20
diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index 4b705f5e0f..9351b21ead 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -1,5 +1,5 @@
 #ifndef SCSI_UTILS_H
-#define SCSI_UTILS_H 1
+#define SCSI_UTILS_H
=20
 #ifdef CONFIG_LINUX
 #include <scsi/sg.h>
diff --git a/include/ui/kbd-state.h b/include/ui/kbd-state.h
index d87833553a..eb9067dd53 100644
--- a/include/ui/kbd-state.h
+++ b/include/ui/kbd-state.h
@@ -3,8 +3,9 @@
  * (at your option) any later version.  See the COPYING file in the
  * top-level directory.
  */
+
 #ifndef QEMU_UI_KBD_STATE_H
-#define QEMU_UI_KBD_STATE_H 1
+#define QEMU_UI_KBD_STATE_H
=20
 #include "qapi/qapi-types-ui.h"
=20
diff --git a/scsi/pr-helper.h b/scsi/pr-helper.h
index 096d1f1df6..e26e104ec7 100644
--- a/scsi/pr-helper.h
+++ b/scsi/pr-helper.h
@@ -23,8 +23,9 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
  * IN THE SOFTWARE.
  */
+
 #ifndef QEMU_PR_HELPER_H
-#define QEMU_PR_HELPER_H 1
+#define QEMU_PR_HELPER_H
=20
 #define PR_HELPER_CDB_SIZE     16
 #define PR_HELPER_SENSE_SIZE   96
diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
index 103ec0976c..c95d5b2116 100644
--- a/target/i386/hvf/x86.h
+++ b/target/i386/hvf/x86.h
@@ -17,7 +17,7 @@
  */
=20
 #ifndef HVF_X86_H
-#define HVF_X86_H 1
+#define HVF_X86_H
=20
 typedef struct x86_register {
     union {
diff --git a/target/i386/hvf/x86_decode.h b/target/i386/hvf/x86_decode.h
index ef4bcab310..bc574a7a44 100644
--- a/target/i386/hvf/x86_decode.h
+++ b/target/i386/hvf/x86_decode.h
@@ -16,7 +16,7 @@
  */
=20
 #ifndef HVF_X86_DECODE_H
-#define HVF_X86_DECODE_H 1
+#define HVF_X86_DECODE_H
=20
 #include "cpu.h"
 #include "x86.h"
diff --git a/target/i386/hvf/x86_descr.h b/target/i386/hvf/x86_descr.h
index 25a2b1731c..049ef9a417 100644
--- a/target/i386/hvf/x86_descr.h
+++ b/target/i386/hvf/x86_descr.h
@@ -17,7 +17,7 @@
  */
=20
 #ifndef HVF_X86_DESCR_H
-#define HVF_X86_DESCR_H 1
+#define HVF_X86_DESCR_H
=20
 #include "x86.h"
=20
--=20
2.17.2


