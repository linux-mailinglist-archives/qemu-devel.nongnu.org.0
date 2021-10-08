Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB342736E
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 00:10:25 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYy4L-0006cR-7Q
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 18:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy1C-0000BA-Ux
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy1B-0003vm-AB
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633730824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W5zHA8hCrgyhLO494iRJBti75d+iM5jvjC+7puKx8gQ=;
 b=Bmmwy39gjH3nsKvEFoO9CM6T7yKlMGRD9ju27vfLyYc5i0ubgipLcVxHrgIoUF2Qo/gV45
 90Ao3H9HGEERALxNXvBtCgFV9mt0xW5XE0r896YH8iIF4aDGZX1+bPD1Qc3dtTb3ju1n83
 hPADdUJnRaN8vmOZ/2HzKJOLTdUOPLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-WBl8yzaqOTaLaLuWn2scXw-1; Fri, 08 Oct 2021 18:07:01 -0400
X-MC-Unique: WBl8yzaqOTaLaLuWn2scXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E325100F943;
 Fri,  8 Oct 2021 22:07:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615A919729;
 Fri,  8 Oct 2021 22:06:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] meson: remove explicit extensions dependency file list
Date: Sat,  9 Oct 2021 02:06:18 +0400
Message-Id: <20211008220620.1488179-5-marcandre.lureau@redhat.com>
In-Reply-To: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
References: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is now generated automatically by depfile.py.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/meson.build              | 10 ----------
 tests/qapi-schema/meson.build |  5 ++++-
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index be4dc30f39..6177c967ff 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -37,15 +37,6 @@ endif
 if build_docs
   SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
 
-  sphinx_extn_depends = [ meson.current_source_dir() / 'sphinx/depfile.py',
-                          meson.current_source_dir() / 'sphinx/hxtool.py',
-                          meson.current_source_dir() / 'sphinx/kerneldoc.py',
-                          meson.current_source_dir() / 'sphinx/kernellog.py',
-                          meson.current_source_dir() / 'sphinx/qapidoc.py',
-                          meson.current_source_dir() / 'sphinx/qmp_lexer.py',
-                          qapi_gen_depends ]
-  sphinx_template_files = [ meson.project_source_root() / 'docs/_templates/footer.html' ]
-
   have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
 
   man_pages = {
@@ -77,7 +68,6 @@ if build_docs
                 output: 'docs.stamp',
                 input: files('conf.py'),
                 depfile: 'docs.d',
-                depend_files: [ sphinx_extn_depends, sphinx_template_files ],
                 command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
                           '-Ddepfile_stamp=@OUTPUT0@',
                           '-b', 'html', '-d', private_dir,
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index df5acfd08b..a5eae6253f 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -241,7 +241,8 @@ if build_docs
                                output: ['doc-good.txt'],
                                input: files('doc-good.json', 'doc-good.rst'),
                                build_by_default: true,
-                               depend_files: sphinx_extn_depends,
+                               output: 'docs.stamp',
+                               depfile: 'docs.d',
                                # We use -E to suppress Sphinx's caching, because
                                # we want it to always really run the QAPI doc
                                # generation code. It also means we don't
@@ -250,6 +251,8 @@ if build_docs
                                          '-b', 'text', '-E',
                                          '-c', meson.project_source_root() / 'docs',
                                          '-D', 'master_doc=doc-good',
+                                         '-Ddepfile=@DEPFILE@',
+                                         '-Ddepfile_stamp=@OUTPUT0@',
                                          meson.current_source_dir(),
                                          meson.current_build_dir()])
 
-- 
2.33.0.721.g106298f7f9


