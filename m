Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469DC50887E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:50:05 +0200 (CEST)
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9mW-0007aO-AZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e1-0002CQ-LG
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9dy-00043n-Qo
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650458473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gY7FxXxkC1X0zRLnFGAjAA2kO9J4keZNznHr2+7XkvY=;
 b=cRzgR9iEkWYmZOx2AxWfZX/y9g9qvPCkIcfN0YeiCt3io79acaOaxO847WA66RJ3rxz6A3
 dIgZ1GvYfMdWlXGLTrU80oJcNFVhaJnwG1dwtzPMQ4iOVPSndVVL72bYUH01NdQx1mFT1g
 vy2EpENZLxNEIoYLsIi4Rke1Wmzc96c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-UKCcla0HMBWtfLksHMj77Q-1; Wed, 20 Apr 2022 08:41:10 -0400
X-MC-Unique: UKCcla0HMBWtfLksHMj77Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3885E18E0068;
 Wed, 20 Apr 2022 12:41:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E39D440EC005;
 Wed, 20 Apr 2022 12:41:06 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/8] tests/qemu-iotests/meson.build: Improve the indentation
Date: Wed, 20 Apr 2022 14:40:57 +0200
Message-Id: <20220420124104.795836-2-hreitz@redhat.com>
In-Reply-To: <20220420124104.795836-1-hreitz@redhat.com>
References: <20220420124104.795836-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

By using subdir_done(), we can get rid of one level of indentation
in this file. This will make it easier to add more conditions to
skip the iotests in future patches.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220223093840.2515281-3-thuth@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/meson.build | 61 ++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 9747bb68a5..92f09251a6 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -1,30 +1,33 @@
-if have_tools and targetos != 'windows' and not get_option('gprof')
-  qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
-  qemu_iotests_env = {'PYTHON': python.full_path()}
-  qemu_iotests_formats = {
-    'qcow2': 'quick',
-    'raw': 'slow',
-    'qed': 'thorough',
-    'vmdk': 'thorough',
-    'vpc': 'thorough'
-  }
-
-  foreach k, v : emulators
-    if k.startswith('qemu-system-')
-      qemu_iotests_binaries += v
-    endif
-  endforeach
-  foreach format, speed: qemu_iotests_formats
-    if speed == 'quick'
-      suites = 'block'
-    else
-      suites = ['block-' + speed, speed]
-    endif
-    test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
-         depends: qemu_iotests_binaries, env: qemu_iotests_env,
-         protocol: 'tap',
-         suite: suites,
-         timeout: 0,
-         is_parallel: false)
-  endforeach
+if not have_tools or targetos == 'windows' or get_option('gprof')
+  subdir_done()
 endif
+
+qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
+qemu_iotests_env = {'PYTHON': python.full_path()}
+qemu_iotests_formats = {
+  'qcow2': 'quick',
+  'raw': 'slow',
+  'qed': 'thorough',
+  'vmdk': 'thorough',
+  'vpc': 'thorough'
+}
+
+foreach k, v : emulators
+  if k.startswith('qemu-system-')
+    qemu_iotests_binaries += v
+  endif
+endforeach
+
+foreach format, speed: qemu_iotests_formats
+  if speed == 'quick'
+    suites = 'block'
+  else
+    suites = ['block-' + speed, speed]
+  endif
+  test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
+       depends: qemu_iotests_binaries, env: qemu_iotests_env,
+       protocol: 'tap',
+       suite: suites,
+       timeout: 0,
+       is_parallel: false)
+endforeach
-- 
2.35.1


