Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91D2D854D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 10:10:08 +0100 (CET)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko0uk-0006mT-Df
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 04:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ko0tb-0006Lx-DE
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 04:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ko0tX-0007Tp-4U
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 04:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607764128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4xLvyo1LNSxc3hkw5+WtidlvkTPunE/z2DRaYAqteXs=;
 b=CH6h82tRLsLrOzToaerc4Ac1jMb38loXc6qb2dlZqaWoIY3e3CwiBs0gZvpf+6sHJ7viH2
 6C2OKwgNUpmacILjF8wwB9IEWZKyKI9y9r6au95uXmAaG8zowOGNWFqMj4FklMcNrzh7Bg
 AolW2o/7q8mZunKDKVmiRkcUaSTq4qI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-1Hw3ZBsXPRO6dRVJ_1Vlsw-1; Sat, 12 Dec 2020 04:08:46 -0500
X-MC-Unique: 1Hw3ZBsXPRO6dRVJ_1Vlsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAFAD10054FF;
 Sat, 12 Dec 2020 09:08:44 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3397C60BE5;
 Sat, 12 Dec 2020 09:08:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] libvhost-user: add a link-static option
Date: Sat, 12 Dec 2020 13:08:34 +0400
Message-Id: <20201212090834.1126274-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fix linking vhost-user binaries with with ./configure -static.

Fixes: 0df750e9d3a5fea5e1 ("libvhost-user: make it a meson subproject")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                                   | 1 +
 subprojects/libvhost-user/meson.build       | 3 ++-
 subprojects/libvhost-user/meson_options.txt | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 subprojects/libvhost-user/meson_options.txt

diff --git a/configure b/configure
index 18c26e0389..465f7bb150 100755
--- a/configure
+++ b/configure
@@ -7014,6 +7014,7 @@ NINJA=$ninja $meson setup \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
+        -Dlibvhost-user:link-static=$(if test "$static" = yes; then echo true; else echo false; fi) \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index c5d85c11d7..5a9cc8675e 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -2,7 +2,8 @@ project('libvhost-user', 'c',
         license: 'GPL-2.0-or-later',
         default_options: ['c_std=gnu99'])
 
-glib = dependency('glib-2.0')
+link_static = get_option('link-static')
+glib = dependency('glib-2.0', static: link_static)
 inc = include_directories('../../include', '../../linux-headers')
 
 vhost_user = static_library('vhost-user',
diff --git a/subprojects/libvhost-user/meson_options.txt b/subprojects/libvhost-user/meson_options.txt
new file mode 100644
index 0000000000..03fe088e36
--- /dev/null
+++ b/subprojects/libvhost-user/meson_options.txt
@@ -0,0 +1,5 @@
+option('link-static',
+  type: 'boolean',
+  value: false,
+)
+
-- 
2.29.0


