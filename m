Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8343B686D29
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 18:35:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNGzy-00076z-2b; Wed, 01 Feb 2023 12:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNGzu-00076W-C1
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:34:14 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pNGzp-0000FA-R3
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:34:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so2061274wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JD4AcBVYJcrPUfgsrPIAestiL4AKuS761Yb18wysirY=;
 b=UK11cwgxoD7oPlupTYk3HQk0PqBXi1NRleoY4v3HO8OhASapmVwlRwG3SIZP9wrg/1
 t42L5I02DansPzawHR7RH/ZJAEZTaZouSrfF5qu/G9rN3anxrnUWPt7ej8hS7xnTlk6R
 1VZr7X4IEqUu8c23ieL+zf2aiVxAidKHfDGnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JD4AcBVYJcrPUfgsrPIAestiL4AKuS761Yb18wysirY=;
 b=n2e1j1e4SvBbfcEpynHqF6zn7dRJSAFN/LBiapCKWrA62/QnmbzWfNjlmWSWpkZxdZ
 ll23+Nvnc+JdADCoDYIhVq43V9rbDgLMjwo+IM8+BWfMt79ITV+ufhR31Q3bXYl2JUx5
 PB/uOc/pwlXxvfqx4ON7Z7kuR2XOZhaGreB5RYjINSrOmUGtvFBs+SR20Qj/Eh7h+GGO
 f9myMIwwmE5m06qKSPmYXNTqUzWooxRclmjpujsyxA2cbNovKSdOQK6qTwOKHnyjwXTV
 kRlZGe4n4UwJDIWRwve+lyhX/jNcBAl2LuhgQmFysLDEXfSVb8H5+DHrm1vfK4z1nR1q
 0b6g==
X-Gm-Message-State: AO0yUKXJ8mr8GsRTASpcKhkmuMC5+P9a3Ghzt4QkvHCHxh9Q8adhi21i
 9F93RnFUzozkdOriq5AYUi5LjPpf/tb5U019nuc=
X-Google-Smtp-Source: AK7set+09aKr21CuEU0DfF0ZqgXezbbS3WkKWb1BPh6Cz4MQLNm8WRF1CbD4l+zXdaydFP65eE5asQ==
X-Received: by 2002:a05:600c:3ba5:b0:3df:9858:c02f with SMTP id
 n37-20020a05600c3ba500b003df9858c02fmr38273wms.4.1675272842013; 
 Wed, 01 Feb 2023 09:34:02 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b002bfc0558ecdsm17558760wrs.113.2023.02.01.09.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:34:01 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, ysato@users.sourceforge.jp, alex.bennee@linaro.org,
 pbonzini@redhat.com, fam@euphon.net, peter.maydell@linaro.org,
 philmd@linaro.org, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
Date: Wed,  1 Feb 2023 22:33:54 +0500
Message-Id: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x332.google.com
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

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 hw/sh4/sh7750_regs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
2.34.1


From 0cbfbd52041b97982d1c8a4dbd94a1b71427bff9 Mon Sep 17 00:00:00 2001
Message-Id: <0cbfbd52041b97982d1c8a4dbd94a1b71427bff9.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:39:24 +0500
Subject: [PATCH 2/9] Updated the FSF address in file contrib/gitdm/filetypes.txt

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 contrib/gitdm/filetypes.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
index d2d6f6db8d..4d26650988 100644
--- a/contrib/gitdm/filetypes.txt
+++ b/contrib/gitdm/filetypes.txt
@@ -12,8 +12,7 @@
 # GNU Library General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# along with this program; if not, see <https://www.gnu.org/licenses/>.
 #
 # Authors : Gregorio Robles <grex@gsyc.escet.urjc.es>
 # Authors : Germán Póo-Caamaño <gpoo@gnome.org>
-- 
2.34.1


From 3c2ceaf1995dfd98c254cf3e2f6d1a68970bb1e8 Mon Sep 17 00:00:00 2001
Message-Id: <3c2ceaf1995dfd98c254cf3e2f6d1a68970bb1e8.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:40:22 +0500
Subject: [PATCH 3/9] Updated the FSF address in file hw/scsi/viosrp.h

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 hw/scsi/viosrp.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
index e5f9768e8f..8b3ac3af56 100644
--- a/hw/scsi/viosrp.h
+++ b/hw/scsi/viosrp.h
@@ -16,8 +16,7 @@
 /* GNU General Public License for more details.                              */
 /*                                                                           */
 /* You should have received a copy of the GNU General Public License         */
-/* along with this program; if not, write to the Free Software               */
-/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA */
+/* along with this program; if not, see <https://www.gnu.org/licenses/>.     */
 /*                                                                           */
 /*                                                                           */
 /* This file contains structures and definitions for IBM RPA (RS/6000        */
-- 
2.34.1


From eeb9c64164a72bcdf77c76d1923ff9d9feeff206 Mon Sep 17 00:00:00 2001
Message-Id: <eeb9c64164a72bcdf77c76d1923ff9d9feeff206.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:41:20 +0500
Subject: [PATCH 4/9] Updated the FSF address in file include/qemu/uri.h

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 include/qemu/uri.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index d201c61260..2c1f6350eb 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -41,8 +41,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
+ * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  *
  * Authors:
  *    Richard W.M. Jones <rjones@redhat.com>
-- 
2.34.1


From 2027b734e65a94bbe59be038e580d55064edca54 Mon Sep 17 00:00:00 2001
Message-Id: <2027b734e65a94bbe59be038e580d55064edca54.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:42:35 +0500
Subject: [PATCH 5/9] Updated the FSF address in file
 include/hw/arm/raspi_platform.h

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 include/hw/arm/raspi_platform.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index e0e6c8ce94..bdeb6012d6 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -18,8 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ * along with this program; if not, see <https://www.gnu.org/licenses/>.
  *
  * Various undocumented addresses and names come from Herman Hermitage's VC4
  * documentation:
-- 
2.34.1


From c9c0f70c68d9fb37eb8cd397bf89a92a31c84ba0 Mon Sep 17 00:00:00 2001
Message-Id: <c9c0f70c68d9fb37eb8cd397bf89a92a31c84ba0.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:43:23 +0500
Subject: [PATCH 6/9] Updated the FSF address in file tests/unit/rcutorture.c

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 tests/unit/rcutorture.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c
index 495a4e6f42..fb02d85ac2 100644
--- a/tests/unit/rcutorture.c
+++ b/tests/unit/rcutorture.c
@@ -50,8 +50,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ * along with this program; if not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
  */
-- 
2.34.1


From 58bb1e1b7c97931620cd21de0b71d9893b66fae7 Mon Sep 17 00:00:00 2001
Message-Id: <58bb1e1b7c97931620cd21de0b71d9893b66fae7.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:44:17 +0500
Subject: [PATCH 7/9] Updated the FSF address in file util/uri.c

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 util/uri.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index ff72c6005f..98164bdb0f 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -43,8 +43,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
+ * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  *
  * Authors:
  *    Richard W.M. Jones <rjones@redhat.com>
-- 
2.34.1


From 16ac94d6761721ffe5e65dbc9f2b6319c880e369 Mon Sep 17 00:00:00 2001
Message-Id: <16ac94d6761721ffe5e65dbc9f2b6319c880e369.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:44:55 +0500
Subject: [PATCH 8/9] Updated the FSF address in tests/unit/test-rcu-list.c

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 tests/unit/test-rcu-list.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
index 64b81ae058..2011a78ed0 100644
--- a/tests/unit/test-rcu-list.c
+++ b/tests/unit/test-rcu-list.c
@@ -14,8 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ * along with this program; if not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2013 Mike D. Day, IBM Corporation.
  */
-- 
2.34.1


From 404c2309c845321a21e2896a151840750ec4fe2e Mon Sep 17 00:00:00 2001
Message-Id: <404c2309c845321a21e2896a151840750ec4fe2e.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675270567.git.kkamran.bese16seecs@seecs.edu.pk>
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Date: Wed, 1 Feb 2023 11:45:36 +0500
Subject: [PATCH 9/9] Updated the FSF address in tests/qemu-iotests/022

The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
 tests/qemu-iotests/022 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
index a116cfe255..52473aefde 100755
--- a/tests/qemu-iotests/022
+++ b/tests/qemu-iotests/022
@@ -16,9 +16,7 @@
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
-# USA
+# along with this program; if not, see <https://www.gnu.org/licenses/>.
 #
 
 # creator
-- 
2.34.1


