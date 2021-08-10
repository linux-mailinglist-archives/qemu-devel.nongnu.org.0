Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A93E58C8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:01:51 +0200 (CEST)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDPW2-0005xh-ST
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDPUm-0005Ab-FH
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDPUl-0002MB-0x
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628593230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nfGs6RmBuC6Twy98XyEHa6zGxYi0Fig97kddRVwpUWs=;
 b=VAu9op6bRSsuL0UY0wZIo43gs0hhMYiMw04rlkYJ/bWa9A4vKwyCwKUV+3+O2qzYkOVF58
 o2vHEu1MOSgOP8w+/S3IDymTFyT/2hVJvImEchaBzK3gVopu+0z5bGWPV04nWXdnnTBpal
 9ZQUQ5iFG/9q4Qsgh/HakAtEsC28280=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-m7IXYd1XOYOeDa0eZudD8Q-1; Tue, 10 Aug 2021 07:00:29 -0400
X-MC-Unique: m7IXYd1XOYOeDa0eZudD8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33D631008064
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 11:00:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E64E90BD;
 Tue, 10 Aug 2021 11:00:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: make sphinx-build be quiet by default
Date: Tue, 10 Aug 2021 12:00:23 +0100
Message-Id: <20210810110023.3923155-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sphinx-build is fairly verbose spitting out pages of output to the
console, which causes errors from other build commands to be scrolled
off the top of the terminal. This can leave the mistaken impression that
the build passed, when in fact there was a failure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 300b134329..29e119a3cc 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -21,7 +21,7 @@ if sphinx_build.found()
   run_command('mkdir', ['-p', tmpdir / 'sphinx'])
   run_command('touch', [tmpdir / 'sphinx/index.rst'])
   sphinx_build_test_out = run_command(SPHINX_ARGS + [
-    '-c', meson.current_source_dir(),
+    '-q', '-c', meson.current_source_dir(),
     '-b', 'html', tmpdir / 'sphinx',
     tmpdir / 'sphinx/out'])
   build_docs = (sphinx_build_test_out.returncode() == 0)
@@ -98,8 +98,9 @@ if build_docs
                               input: this_manual,
                               install: build_docs,
                               install_dir: install_dirs,
-                              command: [SPHINX_ARGS, '-b', 'man', '-d', private_dir,
-                                        input_dir, meson.current_build_dir()])
+                              command: [SPHINX_ARGS, '-q', '-b', 'man',
+                                        '-d', private_dir, input_dir
+                                        meson.current_build_dir()])
 
   alias_target('sphinxdocs', sphinxdocs)
   alias_target('html', sphinxdocs)
-- 
2.31.1


