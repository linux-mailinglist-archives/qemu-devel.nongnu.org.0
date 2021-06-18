Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A87E3AC2C1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:05:40 +0200 (CEST)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6hH-0004MR-3u
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6XD-0005In-4h
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6XA-0004Az-Pl
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMG26To2HhIsReHw8mY+AHfK8bISyekAm9NisM1uWFU=;
 b=g1A6p1hdA8aF1c5hrOZpd1TYL2QYw8DMADQ7+jY1OUA7sYfPHlAQTENE5pRtkDModI1R5v
 CoB8EVp7BtcqP8FD7Wu1QTh3b5jl/Wc7gPfrNsziLrzJHrKxiK6NAkFcvS73zFMt63H1ZI
 ie+i0orK+agjKUH8s+RaY1+NgsEkVjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-kAr5gjwTMvy_gE4jxQm9Rw-1; Fri, 18 Jun 2021 00:55:10 -0400
X-MC-Unique: kAr5gjwTMvy_gE4jxQm9Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44BE41922964;
 Fri, 18 Jun 2021 04:55:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0614860917;
 Fri, 18 Jun 2021 04:54:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A30E1803544; Fri, 18 Jun 2021 06:53:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/24] modules: add ui module annotations
Date: Fri, 18 Jun 2021 06:53:39 +0200
Message-Id: <20210618045353.2510174-11-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
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


