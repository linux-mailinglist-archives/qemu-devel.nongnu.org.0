Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D65C42EF38
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:00:09 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKwa-0004BI-Cf
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKrO-0004zD-7W
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKrL-00051E-Lt
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CIliXDje/nFjeRHTEUCIoUvovSyRYuKgP357WwOFtD8=;
 b=Q/Ke+A6gCb9Rzgjau3ugNv0UhnUvZTIviwU+vynIGMtn3ppMd3B9Aen2W/QrEz/BU1X18R
 nLuM9Sp4JEpIH6loGYgx/x/fZSadR2L0ELb6ZTGI90Kih9wSA0FlG45c9Va6PhkLPcQIDv
 axj7eP4c3SPwWkhs11YJ37+skWqVhEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1--oFxOrzHMYWLEeKv6U7gjQ-1; Fri, 15 Oct 2021 06:54:41 -0400
X-MC-Unique: -oFxOrzHMYWLEeKv6U7gjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 920598042A5;
 Fri, 15 Oct 2021 10:54:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74E015DEFA;
 Fri, 15 Oct 2021 10:54:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] meson: drop sphinx_template_files
Date: Fri, 15 Oct 2021 14:53:42 +0400
Message-Id: <20211015105344.152591-7-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Static files dependencies is now handled by depfile.py.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/meson.build | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 34fda6853d..27c6e156ff 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -37,8 +37,6 @@ endif
 if build_docs
   SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
 
-  sphinx_template_files = [ meson.project_source_root() / 'docs/_templates/footer.html' ]
-
   have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
 
   man_pages = {
@@ -70,7 +68,6 @@ if build_docs
                 output: 'docs.stamp',
                 input: files('conf.py'),
                 depfile: 'docs.d',
-                depend_files: [ sphinx_template_files ],
                 command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
                           '-Ddepfile_stamp=@OUTPUT0@',
                           '-b', 'html', '-d', private_dir,
-- 
2.33.0.721.g106298f7f9


