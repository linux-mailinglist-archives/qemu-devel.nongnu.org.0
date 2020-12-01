Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF12CAAE3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:38:58 +0100 (CET)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkAYB-0007Sp-IS
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kkAWd-0006yC-Eh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:37:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kkAWb-0005Fi-1j
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606847835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yA+gJjA7k65lkI61i/SJfinHjgRSacE/Vz5y7r1hKpY=;
 b=Bpwfiik0n/LFYJZyoh4/x9+t067stvybuyVEkcHY9bRyde3hW7oDRfzZ8OGIqdrObt3KE4
 3J5u6i6wt9JyZ5J41s7Z4uR+6FitplxrEasf9lvp5i6GEXUU02AXCoD5axUnkgunbOJVTm
 AhPfKePnYI7R4Urj9d17tbUS3gv4zI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-IgJ_5onwNiaSfgD7v6jCKw-1; Tue, 01 Dec 2020 13:37:13 -0500
X-MC-Unique: IgJ_5onwNiaSfgD7v6jCKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 620C18030D8
 for <qemu-devel@nongnu.org>; Tue,  1 Dec 2020 18:37:12 +0000 (UTC)
Received: from localhost (unknown [10.36.110.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D9AB5D9DC;
 Tue,  1 Dec 2020 18:37:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: set CONFDIR when running sphinx
Date: Tue,  1 Dec 2020 22:37:04 +0400
Message-Id: <20201201183704.299697-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The default configuration path /etc/qemu can be overriden with configure
options, and the generated documentation used to reflect it.

Fixes regression introduced in commit
f8aa24ea9a82da38370470c6bc0eaa393999edfe ("meson: sphinx-build").

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1902537
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/meson.build b/docs/meson.build
index ebd85d59f9..bb8fe4c9e4 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -9,7 +9,7 @@ endif
 # Check if tools are available to build documentation.
 build_docs = false
 if sphinx_build.found()
-  SPHINX_ARGS = [sphinx_build]
+  SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build]
   # If we're making warnings fatal, apply this to Sphinx runs as well
   if get_option('werror')
     SPHINX_ARGS += [ '-W' ]
-- 
2.29.0


