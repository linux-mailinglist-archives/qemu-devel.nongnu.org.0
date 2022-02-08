Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C734AD56A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:18:17 +0100 (CET)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNZg-0002AD-2I
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:18:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNV0-0006Z0-1O
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNUy-0003Vd-1q
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644315203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ECeRVpveuPMX4p72u5tRSTxGkzUVUk35XAc2P2iljA=;
 b=N/83bT+uwFxdUL5GrOytuW4gzvpCbmJUY4fXSZt6Dmaio1OB7369mdld3uzaJcpUxsIcn4
 ZhBGLRGgYup3ulvwU/A02by6LWbYk8nuxYkK0mL6C6cX32Y4nG0o2qJutwAv6lGyUmDHhK
 7MGPxX112TfG1AvSybuOaNjAfVPq5gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-5VNm4nGBM_qIvosl1mEPRA-1; Tue, 08 Feb 2022 05:13:20 -0500
X-MC-Unique: 5VNm4nGBM_qIvosl1mEPRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73CA11091DA1;
 Tue,  8 Feb 2022 10:13:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8BCA2856D;
 Tue,  8 Feb 2022 10:13:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 2/6] tests/qemu-iotests/meson.build: Improve the indentation
Date: Tue,  8 Feb 2022 11:13:07 +0100
Message-Id: <20220208101311.1511083-3-thuth@redhat.com>
In-Reply-To: <20220208101311.1511083-1-thuth@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By using subdir_done(), we can get rid of one level of indentation
in this file. This will make it easier to add more conditions to
skip the iotests in future patches.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/meson.build | 61 ++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 5be3c74127..e1832c90e0 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -1,30 +1,33 @@
-if have_tools and targetos != 'windows'
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
+if not have_tools or targetos == 'windows'
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
2.27.0


