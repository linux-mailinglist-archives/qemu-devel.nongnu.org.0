Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA142EF39
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:00:21 +0200 (CEST)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKwm-0004Tk-Ni
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKrH-0004tL-Ir
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKrE-0004vw-S6
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mwnk2JukZA8wj6tB5Cmi9xDx966CcvrvLu+K1CqWjVo=;
 b=XATKNtCSOYAMBpoNATeUO1OKNzUKDEPQwEzZ70bq6Oo8ZdP6aykrCB/XJDtFaFONmxTuCp
 pfz0JSGHfxKLCRlggpkdle0EMl+zFtdpbaDHw0fE0wW5Fk2v5uyIa/fB+7tcl+hWm39QQb
 jeBm0Hz4XaEofuewUuGfET3FA28uw5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-KjcbHZz8MuSB3tSrX7CPaw-1; Fri, 15 Oct 2021 06:54:31 -0400
X-MC-Unique: KjcbHZz8MuSB3tSrX7CPaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37EF5802C87;
 Fri, 15 Oct 2021 10:54:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8617160C05;
 Fri, 15 Oct 2021 10:54:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] meson: drop sphinx_extn_depends
Date: Fri, 15 Oct 2021 14:53:41 +0400
Message-Id: <20211015105344.152591-6-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Module dependencies is now handled by depfile.py.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/meson.build              | 9 +--------
 tests/qapi-schema/meson.build | 1 -
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 19cce670a2..34fda6853d 100644
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
index 3676729fbb..e505bf709a 100644
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


