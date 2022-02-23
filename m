Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038554C0FE5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:12:36 +0100 (CET)
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nModP-0002Gg-2w
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:12:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo6o-0003Xa-21
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo6l-0006pn-8Z
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645609129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+M0BmWF8bea2l7F8zRQrObS6TxZzlrMNsawAIKkn0g8=;
 b=AR6ebKPqonGPmFO42H3410z52DF2oKmTkwuJJJEkKdlUAhgp+drkTpT6QijF9TQWh+IcOJ
 pBKVi+PYxK+t7yi284lY7MZjznzDSS+8YuG5Zdi589OucDL1Pj0lr2jSzeS5ZsnrLIrJf+
 JMxNyjfvBgV9rvnOviGALGrq3DQ7pmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-OE63LHwHN8GA1F1niBK0tg-1; Wed, 23 Feb 2022 04:38:48 -0500
X-MC-Unique: OE63LHwHN8GA1F1niBK0tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A037C824FA7;
 Wed, 23 Feb 2022 09:38:47 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 899057A3EE;
 Wed, 23 Feb 2022 09:38:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v3 2/4] tests/qemu-iotests/meson.build: Improve the indentation
Date: Wed, 23 Feb 2022 10:38:38 +0100
Message-Id: <20220223093840.2515281-3-thuth@redhat.com>
In-Reply-To: <20220223093840.2515281-1-thuth@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0


