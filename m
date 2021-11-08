Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C4447C7B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:04:47 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0a6-0001PF-29
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:04:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0YG-0007jq-Oe
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0YE-0002NF-7r
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sY5IQ56LlaXS9OcoiGSCiXHST33pJUyjiYVTiC2D9m8=;
 b=JqzpFfnBX1QTlR6ojNWY6iYhYFsW+hvwvts610GZGg89pxWZFY4bc7qvAC9OXCo5FEJKP8
 sGcCz8+DWelMTqF7xxYrV4MAVaDUrhRKX0EMCT5FhhK67ZgjxJEvMKXxmB+y1rfM67zwz5
 YLORXMcKdunI2vxB5L2TXrqJRDm+SlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-r5YeUzFrN2eNoMCAwoLoUQ-1; Mon, 08 Nov 2021 04:02:45 -0500
X-MC-Unique: r5YeUzFrN2eNoMCAwoLoUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD79D18D6A25;
 Mon,  8 Nov 2021 09:02:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D37DA1017E27;
 Mon,  8 Nov 2021 09:02:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/11] tests/qapi-schema/meson: add depfile to sphinx doc
Date: Mon,  8 Nov 2021 13:01:48 +0400
Message-Id: <20211108090155.371357-5-marcandre.lureau@redhat.com>
In-Reply-To: <20211108090155.371357-1-marcandre.lureau@redhat.com>
References: <20211108090155.371357-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qapi-schema/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index df5acfd08b6b..d91d972af25e 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -242,6 +242,7 @@ if build_docs
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
+                                         '-Ddepfile_stamp=doc-good.stamp',
                                          meson.current_source_dir(),
                                          meson.current_build_dir()])
 
-- 
2.33.0.721.g106298f7f9


