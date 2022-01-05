Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E24E485904
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:17:07 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5BmU-00036W-Ab
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5Bdz-00056P-1h
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:08:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5Bdw-0001hZ-G4
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641409694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m+nqggG0rL8HhYsj/YcdpvJS1y85maipQse/a3UKvmk=;
 b=DX09fYn8lAcUt6BGjbgcv6EGrwkBOpXEkiUEqjOWn6a3EfRPpEjnuPvQMgybgRo3Vw2f94
 rt+T1fZnq7MwNkN9URAJPyUcC3GKzjKB7TD3CKgNQP0qsEAdeBVl31kqQTCnPZIhTT/i+i
 1rLZeS0TshXaKOvjFHhXi4+U5ueV9JA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-LzLJ0rJQP8yuEgJf6AW8Kw-1; Wed, 05 Jan 2022 14:08:10 -0500
X-MC-Unique: LzLJ0rJQP8yuEgJf6AW8Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90911006AA3;
 Wed,  5 Jan 2022 19:08:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C46A10013C1;
 Wed,  5 Jan 2022 19:08:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson.build: Print gtk version in the summary info
Date: Wed,  5 Jan 2022 20:08:04 +0100
Message-Id: <20220105190804.649316-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "gtk" variable is re-declared as "dependencies: [gtk, gtkx11]",
so there is just a "YES" in the summary info if gtk has been found.
Let's use the info from the library detection instead so that the
library version is printed in the summary instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 82769749db..798811dfbb 100644
--- a/meson.build
+++ b/meson.build
@@ -1058,11 +1058,11 @@ gtk = not_found
 gtkx11 = not_found
 vte = not_found
 if not get_option('gtk').auto() or (have_system and not cocoa.found())
-  gtk = dependency('gtk+-3.0', version: '>=3.22.0',
-                   method: 'pkg-config',
-                   required: get_option('gtk'),
-                   kwargs: static_kwargs)
-  if gtk.found()
+  libgtk = dependency('gtk+-3.0', version: '>=3.22.0',
+                      method: 'pkg-config',
+                      required: get_option('gtk'),
+                      kwargs: static_kwargs)
+  if libgtk.found()
     gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
                         method: 'pkg-config',
                         required: false,
@@ -3410,7 +3410,7 @@ if targetos == 'darwin'
 endif
 summary_info += {'SDL support':       sdl}
 summary_info += {'SDL image support': sdl_image}
-summary_info += {'GTK support':       gtk}
+summary_info += {'GTK support':       libgtk}
 summary_info += {'pixman':            pixman}
 summary_info += {'VTE support':       vte}
 summary_info += {'slirp support':     slirp_opt == 'internal' ? slirp_opt : slirp}
-- 
2.27.0


