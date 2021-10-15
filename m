Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5542EF34
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:57:20 +0200 (CEST)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKtr-0007DR-8N
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKr5-0004KM-8f
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKr3-0004nt-NU
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNPT+smf6q+C1Yejks/P0fhH0/n/QM999XvIMOlPwlI=;
 b=LW7iuN+GN+HhL00TiU/QDK+XSm5QC7ZvcFzExUowqln/4Rl3VGT2Y+lDCQ64hCHzEAcuLq
 hDBkRFvYuqxV135uBv8GSgZ5hE6od0Sh4rXNghu134P7vvkrMS4+bdI9U8ySzibnvvrWR4
 ZOsFCTvDMpD3MSJb55mMWzpyzB7LGUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-MMGNb2DvMsGKHolBM7U_4A-1; Fri, 15 Oct 2021 06:54:23 -0400
X-MC-Unique: MMGNb2DvMsGKHolBM7U_4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B612A1006AA2;
 Fri, 15 Oct 2021 10:54:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45B47707B6;
 Fri, 15 Oct 2021 10:54:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] tests/qapi-schema/meson: add depfile to sphinx doc
Date: Fri, 15 Oct 2021 14:53:40 +0400
Message-Id: <20211015105344.152591-5-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qapi-schema/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index df5acfd08b..3676729fbb 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -238,10 +238,11 @@ if build_docs
   # fuzzy comparison if future Sphinx versions produce different text,
   # but for now the simple comparison suffices.
   qapi_doc_out = custom_target('QAPI rST doc',
-                               output: ['doc-good.txt'],
+                               output: ['doc-good.txt', 'doc-good.stamp'],
                                input: files('doc-good.json', 'doc-good.rst'),
                                build_by_default: true,
                                depend_files: sphinx_extn_depends,
+                               depfile: 'docs.d',
                                # We use -E to suppress Sphinx's caching, because
                                # we want it to always really run the QAPI doc
                                # generation code. It also means we don't
@@ -250,6 +251,8 @@ if build_docs
                                          '-b', 'text', '-E',
                                          '-c', meson.project_source_root() / 'docs',
                                          '-D', 'master_doc=doc-good',
+                                         '-Ddepfile=@DEPFILE@',
+                                         '-Ddepfile_stamp=@OUTPUT1@',
                                          meson.current_source_dir(),
                                          meson.current_build_dir()])
 
-- 
2.33.0.721.g106298f7f9


