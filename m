Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839768EF59
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjvv-0002SO-EI; Wed, 08 Feb 2023 07:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pPjvs-0002LZ-Gh
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:52:16 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pPjvo-0002hc-2e
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:52:15 -0500
Received: by mail-ej1-x632.google.com with SMTP id m1so8480887ejx.7
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 04:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:signed-off-by:resolves:mime-version
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tKbiGzD1wt9NXwAFlkk1MPndL9uKdEfag9s3xCIJwg=;
 b=L9CZDe7GyAYRZJrpGQH5vMSMQfnwgRpW8U4i+/YIelRjB18tOcMD5XNDybnVAWzqJy
 F2l1wOjqyTd4BrwFNzTs6E0s6uG9thuqsFE80/F2riPlfULofEOeLnKTC3DP3cixg2ZU
 N11bgeAIdRWsyHux39tpuQgm0fTifTBeErvLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:signed-off-by:resolves:mime-version
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7tKbiGzD1wt9NXwAFlkk1MPndL9uKdEfag9s3xCIJwg=;
 b=s9RcryQ6FCrMXLt0Jx/laf1cE1NZBkPtl7kisNrwXDH71Yr5xVoBf06DqQN0q2Q382
 ZUJFwnwMBflK6ufv3hNH+c8KQwLSHin3mx5TZdoRcHx8TX1i+R0n2dlQsBD7YzxGVyVp
 z2YXmX+S0xZ4sbBbIs4/1VwQmXlldZ3xTQX2+1vcj58xj6B5WpxwDi+Pe+5Pw8GTeXBE
 WdMQYhIQJiITwscU0mJBiS9bJf416x8r+NwTXpDB2FNh9Cd1hw3MCPJGJOpllsxrTwng
 1DvIiuCFrdFelGVhc8vCJsyYHkpfz0jEC3CDZ1HFIATr1k1riozfT4tLiRq54zdcbeNl
 jWNA==
X-Gm-Message-State: AO0yUKXvxUw/dnXffZkq5sN6gNC7TefvewFPrWgi4KGZUgQKlqemvUf7
 QwARFu4/zoF9iJAecb6BYfxCttsAVe76NWbZ
X-Google-Smtp-Source: AK7set9iTUxr+HGZYmuln49moG37Cby78TjMAE1nkwRdfQrfTMgvOv7Qf54Ef+3QFnVS650JRAHKHw==
X-Received: by 2002:a17:906:1c05:b0:88a:b6ca:7d3d with SMTP id
 k5-20020a1709061c0500b0088ab6ca7d3dmr7439473ejg.8.1675860721011; 
 Wed, 08 Feb 2023 04:52:01 -0800 (PST)
Received: from khadija-virtual-machine.localdomain ([39.41.99.62])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7c04a000000b0049e09105705sm7746003edo.62.2023.02.08.04.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 04:52:00 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, ysato@users.sourceforge.jp, alex.bennee@linaro.org,
 pbonzini@redhat.com, fam@euphon.net, peter.maydell@linaro.org,
 philmd@linaro.org, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH] Updated the FSF address to <https://www.gnu.org/licenses/>
Date: Wed,  8 Feb 2023 12:51:56 +0000
Message-Id: <d1500fe9389a1f6964a2b132466d5be2a44d205f.1675858906.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/379
Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-ej1-x632.google.com
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


