Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1CF446460
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:43:17 +0100 (CET)
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizUy-0002Wn-Ed
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizLe-0007HU-B6
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizLb-0008GB-8g
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636119214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUGyp1bFRh4m5FZfvaEWgonOqz1uBSAsiDtklz5Cd48=;
 b=ObD9gc9C43k5yc1Rq26I0ZWcKVGQngmPfRiRqhhDeEO5Y5Wmj3QGsDFySn5iBwDNMf8Eao
 kcMWpXyZhyOL03YVlcf92fkI+Z9bHTVj+l5pbvsKBKwp1dJxbdMtNBUjIvGsi6TV6B3I4J
 NF0W7/R7vFkOuoXj3YQsz7J0JDfx9cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-s03LVsyXP_Oyd-ER_d9XwQ-1; Fri, 05 Nov 2021 09:33:30 -0400
X-MC-Unique: s03LVsyXP_Oyd-ER_d9XwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C590B100CCCF;
 Fri,  5 Nov 2021 13:33:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8182A5DEFA;
 Fri,  5 Nov 2021 13:33:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] meson: drop sphinx_extn_depends
Date: Fri,  5 Nov 2021 17:32:16 +0400
Message-Id: <20211105133222.184722-6-marcandre.lureau@redhat.com>
In-Reply-To: <20211105133222.184722-1-marcandre.lureau@redhat.com>
References: <20211105133222.184722-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Module dependencies is now handled by depfile.py.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build              | 9 +--------
 tests/qapi-schema/meson.build | 1 -
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 19cce670a20d..34fda6853d9e 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -37,13 +37,6 @@ endif
 if build_docs
   SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
 
-  sphinx_extn_depends = [ meson.current_source_dir() / 'sphinx/depfile.py',
-                          meson.current_source_dir() / 'sphinx/hxtool.py',
-                          meson.current_source_dir() / 'sphinx/kerneldoc.py',
-                          meson.current_source_dir() / 'sphinx/kernellog.py',
-                          meson.current_source_dir() / 'sphinx/qapidoc.py',
-                          meson.current_source_dir() / 'sphinx/qmp_lexer.py',
-                          qapi_gen_depends ]
   sphinx_template_files = [ meson.project_source_root() / 'docs/_templates/footer.html' ]
 
   have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
@@ -77,7 +70,7 @@ if build_docs
                 output: 'docs.stamp',
                 input: files('conf.py'),
                 depfile: 'docs.d',
-                depend_files: [ sphinx_extn_depends, sphinx_template_files ],
+                depend_files: [ sphinx_template_files ],
                 command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
                           '-Ddepfile_stamp=@OUTPUT0@',
                           '-b', 'html', '-d', private_dir,
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 3676729fbb06..e505bf709ad3 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -241,7 +241,6 @@ if build_docs
                                output: ['doc-good.txt', 'doc-good.stamp'],
                                input: files('doc-good.json', 'doc-good.rst'),
                                build_by_default: true,
-                               depend_files: sphinx_extn_depends,
                                depfile: 'docs.d',
                                # We use -E to suppress Sphinx's caching, because
                                # we want it to always really run the QAPI doc
-- 
2.33.0.721.g106298f7f9


