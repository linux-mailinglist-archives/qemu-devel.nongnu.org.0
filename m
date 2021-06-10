Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C443A243B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:06:43 +0200 (CEST)
Received: from localhost ([::1]:39748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDpy-0000mt-F1
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDiu-0004Jx-WA
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDir-00020m-CE
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMG26To2HhIsReHw8mY+AHfK8bISyekAm9NisM1uWFU=;
 b=IMO7GtX64kGGiJR09ZgcDlWu3lE2kD8xbsmt1tJMTEVpTYpXjiR8Lv/131MqG5MpvJmoKY
 qMUkTz3lBcfpeVxdHNSl54M1g7T/cJFYWI309uh5goUrv+IWEV4ZwpnGK6hMmJpdLK+kLJ
 91rqSsEczZvDjYxqtf2ntoo9b0vnaNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-vKLz1CgVOe-fOFwwylnm6Q-1; Thu, 10 Jun 2021 01:59:18 -0400
X-MC-Unique: vKLz1CgVOe-fOFwwylnm6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4E40100C663;
 Thu, 10 Jun 2021 05:59:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 918FF10016F4;
 Thu, 10 Jun 2021 05:59:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C16BD18017CE; Thu, 10 Jun 2021 07:57:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/18] modules: add ui module annotations
Date: Thu, 10 Jun 2021 07:57:46 +0200
Message-Id: <20210610055755.538119-10-kraxel@redhat.com>
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/egl-headless.c | 4 ++++
 ui/gtk.c          | 4 ++++
 ui/sdl2.c         | 4 ++++
 ui/spice-app.c    | 3 +++
 ui/spice-core.c   | 5 +++++
 5 files changed, 20 insertions(+)

diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index da377a74af69..75404e0e8700 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -213,3 +213,7 @@ static void register_egl(void)
 }
 
 type_init(register_egl);
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b9d..376b4d528daa 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2333,3 +2333,7 @@ static void register_gtk(void)
 }
 
 type_init(register_gtk);
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
diff --git a/ui/sdl2.c b/ui/sdl2.c
index a203cb0239e1..36d9010cb6c1 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -918,3 +918,7 @@ static void register_sdl1(void)
 }
 
 type_init(register_sdl1);
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
diff --git a/ui/spice-app.c b/ui/spice-app.c
index 4325ac2d9c54..641f4a9d53e3 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -221,3 +221,6 @@ static void register_spice_app(void)
 }
 
 type_init(register_spice_app);
+
+module_dep("ui-spice-core");
+module_dep("chardev-spice");
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 272d19b0c152..86d43783acac 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -1037,3 +1037,8 @@ static void spice_register_config(void)
     qemu_add_opts(&qemu_spice_opts);
 }
 opts_init(spice_register_config);
+module_opts("spice");
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
-- 
2.31.1


