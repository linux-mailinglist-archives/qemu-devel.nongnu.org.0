Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3556A40D1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:39:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpM-0006nP-4V; Mon, 27 Feb 2023 06:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboY-0005uP-Un
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboV-0005j7-Jk
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ji+x3y23XY9GVQQduchoQVQW517GHQaaoai3iTDDbo=;
 b=Mzek+O3/3c6cl014JqPYNVTZY9yBcHwZIDFgWuswm1btzpWa7m0PYEm5BvjPc4hi2khxZv
 vGUMnTwaCF03Hd1D5xO1lK148MkKoCWpVMpTtwYv6AUrpZwP19oCBzmGfS70PFtN6tM1hT
 g7YCF46K/vYRGjw5yGNk9vidziFyEyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-m41dpo0vMOex2_4eAdYpVg-1; Mon, 27 Feb 2023 06:36:56 -0500
X-MC-Unique: m41dpo0vMOex2_4eAdYpVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35E1285CBE2;
 Mon, 27 Feb 2023 11:36:56 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E53311121314;
 Mon, 27 Feb 2023 11:36:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 27/33] Updated the FSF address to
 <https://www.gnu.org/licenses/>
Date: Mon, 27 Feb 2023 12:36:15 +0100
Message-Id: <20230227113621.58468-28-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>

The Free Software Foundation moved to a new address and some
sources in QEMU referred to their old location.
The address should be updated and replaced by a pointer to
<https://www.gnu.org/licenses/>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379
Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Message-Id: <576ee9203fdac99d7251a98faa66b9ce1e7febc5.1675941486.git.kkamran.bese16seecs@seecs.edu.pk>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/scsi/viosrp.h                | 3 +--
 hw/sh4/sh7750_regs.h            | 3 +--
 include/hw/arm/raspi_platform.h | 3 +--
 include/qemu/uri.h              | 3 +--
 tests/unit/rcutorture.c         | 3 +--
 tests/unit/test-rcu-list.c      | 3 +--
 util/uri.c                      | 3 +--
 contrib/gitdm/filetypes.txt     | 3 +--
 tests/qemu-iotests/022          | 4 +---
 9 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
index e5f9768e8f..58c29aa925 100644
--- a/hw/scsi/viosrp.h
+++ b/hw/scsi/viosrp.h
@@ -16,8 +16,7 @@
 /* GNU General Public License for more details.                              */
 /*                                                                           */
 /* You should have received a copy of the GNU General Public License         */
-/* along with this program; if not, write to the Free Software               */
-/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA */
+/* along with this program. If not, see <https://www.gnu.org/licenses/>.     */
 /*                                                                           */
 /*                                                                           */
 /* This file contains structures and definitions for IBM RPA (RS/6000        */
diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
index beb571d5e9..94043431e6 100644
--- a/hw/sh4/sh7750_regs.h
+++ b/hw/sh4/sh7750_regs.h
@@ -22,8 +22,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  * General Public License for more details. You should have received
  * a copy of the GNU General Public License along with RTEMS; see
- * file COPYING. If not, write to the Free Software Foundation, 675
- * Mass Ave, Cambridge, MA 02139, USA.
+ * file COPYING. If not, see <https://www.gnu.org/licenses/>.
  *
  * As a special exception, including RTEMS header files in a file,
  * instantiating RTEMS generics or templates, or linking other files
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index e0e6c8ce94..4a56dd4b89 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -18,8 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ * along with this program. If not, see <https://www.gnu.org/licenses/>.
  *
  * Various undocumented addresses and names come from Herman Hermitage's VC4
  * documentation:
diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index db5218c39e..3ad211d676 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -41,8 +41,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
+ * License along with this library. If not, see <https://www.gnu.org/licenses/>.
  *
  * Authors:
  *    Richard W.M. Jones <rjones@redhat.com>
diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c
index 495a4e6f42..7662081683 100644
--- a/tests/unit/rcutorture.c
+++ b/tests/unit/rcutorture.c
@@ -50,8 +50,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ * along with this program. If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
  */
diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
index 64b81ae058..9964171da4 100644
--- a/tests/unit/test-rcu-list.c
+++ b/tests/unit/test-rcu-list.c
@@ -14,8 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ * along with this program. If not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2013 Mike D. Day, IBM Corporation.
  */
diff --git a/util/uri.c b/util/uri.c
index ff72c6005f..dcb3305236 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -43,8 +43,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
+ * License along with this library. If not, see <https://www.gnu.org/licenses/>.
  *
  * Authors:
  *    Richard W.M. Jones <rjones@redhat.com>
diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
index d2d6f6db8d..b1d01c0992 100644
--- a/contrib/gitdm/filetypes.txt
+++ b/contrib/gitdm/filetypes.txt
@@ -12,8 +12,7 @@
 # GNU Library General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# along with this program. If not, see <https://www.gnu.org/licenses/>.
 #
 # Authors : Gregorio Robles <grex@gsyc.escet.urjc.es>
 # Authors : Germán Póo-Caamaño <gpoo@gnome.org>
diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
index a116cfe255..d98d1ea90f 100755
--- a/tests/qemu-iotests/022
+++ b/tests/qemu-iotests/022
@@ -16,9 +16,7 @@
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
-# USA
+# along with this program. If not, see <https://www.gnu.org/licenses/>.
 #
 
 # creator
-- 
2.31.1


