Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E0447C86
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:08:53 +0100 (CET)
Received: from localhost ([::1]:58040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0e2-0001Ja-P9
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:08:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0YR-0007zP-51
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0YO-0002O9-UX
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFuNYvfu1xuFGAdpNEqcj9GR4by1GDQBCYjgTlDla38=;
 b=ZUFdBYQ7hdNBosDb7wK+eHFd6X6GFb6f105qvPW3goWUweNjbQkvqeeMY0PwLQFUL0RVZh
 uUb/4FKUKFgP5Ctvh6kPZ/0WZp/AAaJE/jqj7YbjjQyKS0DMNOF3ZW6JEG+m6w+9n0/JYW
 +3bnRjijzBH94/k2R/kSZ7NctqkI+18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-som2T4CYNVC6lYJk3ltMXw-1; Mon, 08 Nov 2021 04:02:58 -0500
X-MC-Unique: som2T4CYNVC6lYJk3ltMXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCF53804140;
 Mon,  8 Nov 2021 09:02:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6EFC60657;
 Mon,  8 Nov 2021 09:02:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/11] meson: drop sphinx_template_files
Date: Mon,  8 Nov 2021 13:01:50 +0400
Message-Id: <20211108090155.371357-7-marcandre.lureau@redhat.com>
In-Reply-To: <20211108090155.371357-1-marcandre.lureau@redhat.com>
References: <20211108090155.371357-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Static files dependencies is now handled by depfile.py.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 34fda6853d9e..27c6e156fff8 100644
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


