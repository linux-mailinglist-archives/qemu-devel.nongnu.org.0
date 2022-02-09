Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0A4AEF51
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:33:12 +0100 (CET)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkHf-0007p4-Ck
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:33:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk19-0003CY-10
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk15-0004uZ-Un
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644401763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smtAxOw94clyMYKTLTidPNDlyFBOhRyffFCIsFmx74U=;
 b=Woto8dSbfik7wtlSibw71qW6wDMLA51DbJ2zzal5WGJaq2KDOYSnm3NwPuyZmc7leRCvZg
 vIxXSGTh/bXAYibBUvlhskPUPoQPKGHGWYQ2pxbnMWnxke9HWWjseWYfFlRNxUtB4QkfLy
 lxQ6jK4NEmgZzKStOgPGZjlZ3wXhWeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-ij7d9dCQNQGm7APbFIJGCw-1; Wed, 09 Feb 2022 05:16:00 -0500
X-MC-Unique: ij7d9dCQNQGm7APbFIJGCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27779871101;
 Wed,  9 Feb 2022 10:15:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E91232856C;
 Wed,  9 Feb 2022 10:15:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 3/8] tests/qemu-iotests/meson.build: Improve the indentation
Date: Wed,  9 Feb 2022 11:15:25 +0100
Message-Id: <20220209101530.3442837-4-thuth@redhat.com>
In-Reply-To: <20220209101530.3442837-1-thuth@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By using subdir_done(), we can get rid of one level of indentation
in this file. This will make it easier to add more conditions to
skip the iotests in future patches.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


