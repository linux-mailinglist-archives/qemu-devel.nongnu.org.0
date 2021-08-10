Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1E3E5927
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:33:17 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQ0S-0003Ab-LW
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDPzL-0001rP-Kc
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDPzK-0008Ro-2Z
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628595125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m7u4WIIYAEzDey4ZMc6FB5UR51mJ8+JPPsCl6YJ/wcI=;
 b=FnrJkW59zQ8ESb/UbTwscNlFgsjmWGJfsiQ9nj2F9aDpPc8Wk3hjBXR61RrhWFazQGiAZ7
 0wrxspOqei/rvLUBZZz0meQjD+lD9TXk1lV9Z3z+RBnLUAUB9/Z26DT+C6RD93W0xtDGGU
 z4gF4qsabi95+8rKMVvwJj33PbrDIEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Jxi5kHyQNruxbFwP9jb7tg-1; Tue, 10 Aug 2021 07:32:04 -0400
X-MC-Unique: Jxi5kHyQNruxbFwP9jb7tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 533C787D541
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 11:32:03 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 712AC5C25A;
 Tue, 10 Aug 2021 11:32:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs: make sphinx-build be quiet by default
Date: Tue, 10 Aug 2021 12:32:01 +0100
Message-Id: <20210810113201.3957815-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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

In v2:

 - This time with the extra trailing ',' actually committed

 docs/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 300b134329..42d7555bc4 100644
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
+                                        '-d', private_dir, input_dir,
+                                        meson.current_build_dir()])
 
   alias_target('sphinxdocs', sphinxdocs)
   alias_target('html', sphinxdocs)
-- 
2.31.1


