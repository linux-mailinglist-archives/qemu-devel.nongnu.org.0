Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08085233417
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 16:15:32 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k19LG-0003sj-Ur
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 10:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k19Ja-0002C0-Vs
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:13:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57846
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k19JZ-0004MK-8T
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 10:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596118422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=clqOvgg+QZlW1cMCjxq9cz8Ky3H1isCVB9Ujcr0ZdCI=;
 b=Rf9jqt91m1fGlWV/+tLPNprGx2ey3XlBdZKD0iUqzJeEko9n9AaWo1Gxvt8BPhmzOXeaZb
 hsJo+rhREvyoOKtWnj6AAx1jVkXKGsemwRacxiOyvdmDdaKca5BiM2h+ajdZQACZ0656Zu
 VsOdDuBTEsP2ATa6XvtD7LiCnSw9xSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-Buq2kM6JMjGLkM0VnORmcw-1; Thu, 30 Jul 2020 10:13:40 -0400
X-MC-Unique: Buq2kM6JMjGLkM0VnORmcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 544208C3224;
 Thu, 30 Jul 2020 14:13:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 438D77BEBD;
 Thu, 30 Jul 2020 14:13:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/4] tests/acceptance: Disable the rx sash and arm
 cubieboard replay test on Gitlab
Date: Thu, 30 Jul 2020 16:13:24 +0200
Message-Id: <20200730141326.8260-3-thuth@redhat.com>
In-Reply-To: <20200730141326.8260-1-thuth@redhat.com>
References: <20200730141326.8260-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 23:51:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests always time out on Gitlab, not sure what's happening here.
Let's disable them until somebody has enough spare time to debug the
issues.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_rx_gdbsim.py | 4 ++++
 tests/acceptance/replay_kernel.py     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/acceptance/machine_rx_gdbsim.py
index bff63e421d..0c72506028 100644
--- a/tests/acceptance/machine_rx_gdbsim.py
+++ b/tests/acceptance/machine_rx_gdbsim.py
@@ -8,6 +8,9 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+import os
+
+from avocado import skipIf
 from avocado_qemu import Test
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
@@ -42,6 +45,7 @@ class RxGdbSimMachine(Test):
         # FIXME limit baudrate on chardev, else we type too fast
         #exec_command_and_wait_for_pattern(self, 'version', gcc_version)
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_linux_sash(self):
         """
         Boots a Linux kernel and checks that the console is operational.
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 62d2db8c64..b79fc8daf8 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -126,6 +126,7 @@ class ReplayKernel(LinuxKernelTest):
 
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=1)
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
-- 
2.18.1


