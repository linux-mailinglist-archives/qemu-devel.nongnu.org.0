Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62147BB30
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:37:57 +0100 (CET)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZie-00007g-JJ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZE2-00014Z-V3
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:06:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZE1-0002Lm-5k
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmhL4B1sw7EWYu23BvjQMASdSiQuAUqhG9SLwD6Mls0=;
 b=AAqWDDzsnYXbMg1H4LPCGslZNJ7DfCDDcO9w/Py8BnchAORbZOdeCyLTTpe67jj/LjboQK
 alK7NDIRuwzR601gytLnrKYy96S8qN4knc7K2rLW/0YKFVcrmmXih5hYrGVws3ouqeCePJ
 l58PyUclQzRsknWDpe1syF9GlJNU41A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-F1ljuaf5OBObJygweWYwCw-1; Tue, 21 Dec 2021 02:06:13 -0500
X-MC-Unique: F1ljuaf5OBObJygweWYwCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57637344B0;
 Tue, 21 Dec 2021 07:06:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F8A0838E9;
 Tue, 21 Dec 2021 07:05:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/36] build-sys: set glib dependency version
Date: Tue, 21 Dec 2021 10:58:43 +0400
Message-Id: <20211221065855.142578-25-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Further meson configuration tests are to be added based on the glib
version. Also correct the version reporting in the config log.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure   | 1 +
 meson.build | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 8ccfe51673eb..51eae49daf7d 100755
--- a/configure
+++ b/configure
@@ -3694,6 +3694,7 @@ echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
+echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 1c70839bbf17..c37eb92ebeaa 100644
--- a/meson.build
+++ b/meson.build
@@ -404,14 +404,16 @@ endif
 add_project_arguments(config_host['GLIB_CFLAGS'].split(),
                       native: false, language: ['c', 'cpp', 'objc'])
 glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
-                          link_args: config_host['GLIB_LIBS'].split())
+                          link_args: config_host['GLIB_LIBS'].split(),
+                          version: config_host['GLIB_VERSION'])
 # override glib dep with the configure results (for subprojects)
 meson.override_dependency('glib-2.0', glib)
 
 gio = not_found
 if 'CONFIG_GIO' in config_host
   gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
-                           link_args: config_host['GIO_LIBS'].split())
+                           link_args: config_host['GIO_LIBS'].split(),
+                           version: config_host['GLIB_VERSION'])
 endif
 lttng = not_found
 if 'ust' in get_option('trace_backends')
-- 
2.34.1.8.g35151cf07204


