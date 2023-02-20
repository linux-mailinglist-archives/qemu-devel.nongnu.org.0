Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B313169C5BF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0Av-0000cN-V1; Mon, 20 Feb 2023 02:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pU0As-0000c8-Lt
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:01:22 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pU0An-0005Xs-Nm
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:01:22 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so109449wmc.5
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 23:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cTzCfYfnJYl7i/IBzY9g8O3EVR8IIcUBkvxWubvfHVo=;
 b=c3JCfbRe2TAky6KZjJA0KSDA5IwZOyfmRUE3V1arujz36L70ULEWLoht50aSqQiMgr
 7BigjAUjIXN9Z6TZPhuZChSx79J0TGkKeLJeJ0jd076pzNDCaN+88q7LbGs6xNYm2Jou
 xIg9uKq6gqPLRsEvZwVw65SRfo5iIJdsz+7nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cTzCfYfnJYl7i/IBzY9g8O3EVR8IIcUBkvxWubvfHVo=;
 b=1Y/6dlRkYg413FTt2VwYoJILD7vGRs+Pjl0nvPHuwqNF0i///PPFHpGUMRltDKLO1U
 I9hTy14pQRtyPPki9zMLQ6piJZZgg1HJpDlWLgVFSo+INKizeykSSR/FPaHnbGSCeSSN
 8k7w3NwtzPzCcfYMfc8AVzGNEbsOt2P9NRXr1oUIR2wmPH6c5U8ZHQI7OdGkNIQ1ZM+V
 4xAUDOPNtbpZG4uPHDLVITbncYFb1CrJjWeMpHblCJl0XYvsXLV+DnR11w88XQClKHKA
 sfI4lcpM+yOwIKFZ2Spfy1akmU4oi0lZv4f1Bq+kO+VWUtPMtyym3PXDC9A4eJB2U+fP
 nWTw==
X-Gm-Message-State: AO0yUKU3jCZw/OUWf/RIfPSHB7xEoTiiWvzhWyRPGmtCp6gk3PEZOW2Z
 r1Iv16g0mkAfy6nAosLmxmPPHEQgN/b+pws8K48=
X-Google-Smtp-Source: AK7set/m2ac4vtOT7zMfbMXisyYSBRSVU0BQhbC/l7wQkkPJf9xQVSKkP5QmFWGa9NrDL3HKFcOC2w==
X-Received: by 2002:a05:600c:3316:b0:3dc:42e7:f626 with SMTP id
 q22-20020a05600c331600b003dc42e7f626mr6063292wmp.26.1676876474129; 
 Sun, 19 Feb 2023 23:01:14 -0800 (PST)
Received: from khadija-virtual-machine.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a7bce8c000000b003daf672a616sm13224021wmj.22.2023.02.19.23.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 23:01:13 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
X-Google-Original-From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, ysato@users.sourceforge.jp, alex.bennee@linaro.org,
 pbonzini@redhat.com, fam@euphon.net, peter.maydell@linaro.org,
 philmd@linaro.org, kwolf@redhat.com, hreitz@redhat.com, armbru@redhat.com
Subject: [PATCH] Updated the FSF address to <https://www.gnu.org/licenses/>
Date: Mon, 20 Feb 2023 07:01:09 +0000
Message-Id: <576ee9203fdac99d7251a98faa66b9ce1e7febc5.1675941486.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The Free Software Foundation moved to a new address and some sources in QEMU referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 contrib/gitdm/filetypes.txt     | 3 +--
 hw/scsi/viosrp.h                | 3 +--
 hw/sh4/sh7750_regs.h            | 3 +--
 include/hw/arm/raspi_platform.h | 3 +--
 include/qemu/uri.h              | 3 +--
 tests/qemu-iotests/022          | 4 +---
 tests/unit/rcutorture.c         | 3 +--
 tests/unit/test-rcu-list.c      | 3 +--
 util/uri.c                      | 3 +--
 9 files changed, 9 insertions(+), 19 deletions(-)

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
index d201c61260..cf8ec70356 100644
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
-- 
2.34.1


