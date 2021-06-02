Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D939852F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:22:44 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN5H-0003oR-6L
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN1M-0003V3-2R
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN1I-0002lM-Vv
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpEJLj/FQD2T6fQ8VnxUoL3Kc5fq+2dnTrS/WXmuuUo=;
 b=VMLzbRauWvv1K9BnyF1AezrvSuE95Ed38/0IE4DrFHUZqV01WBXeKTDpnSksZ/Ep0rxbLM
 1lr1AJ0Jo1Y4hh7/Ci4NFv40kof0M8T0aZQsPclrK0luS1V8qQiPRXASq//hiAMEzwT1cg
 bDfUDLEybSLpqnY2K5XjMIszzStv0kM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-9STh9OVZM8WXH2BYe9d0qA-1; Wed, 02 Jun 2021 05:18:32 -0400
X-MC-Unique: 9STh9OVZM8WXH2BYe9d0qA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD2FBC7443;
 Wed,  2 Jun 2021 09:18:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5235E7C5;
 Wed,  2 Jun 2021 09:18:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EEF431800904; Wed,  2 Jun 2021 11:17:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] ui module annotations
Date: Wed,  2 Jun 2021 11:17:26 +0200
Message-Id: <20210602091727.1023563-9-kraxel@redhat.com>
In-Reply-To: <20210602091727.1023563-1-kraxel@redhat.com>
References: <20210602091727.1023563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/egl-headless.c | 4 ++++
 ui/gtk.c          | 4 ++++
 ui/sdl2.c         | 4 ++++
 ui/spice-app.c    | 3 +++
 ui/spice-core.c   | 4 ++++
 5 files changed, 19 insertions(+)

diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index da377a74af69..bb94deb568c0 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -213,3 +213,7 @@ static void register_egl(void)
 }
 
 type_init(register_egl);
+
+#ifdef CONFIG_OPENGL
+module_dep("chardev-spice");
+#endif
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b9d..0444b3e17171 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2333,3 +2333,7 @@ static void register_gtk(void)
 }
 
 type_init(register_gtk);
+
+#ifdef CONFIG_OPENGL
+module_dep("chardev-spice");
+#endif
diff --git a/ui/sdl2.c b/ui/sdl2.c
index a203cb0239e1..24483e6611fd 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -918,3 +918,7 @@ static void register_sdl1(void)
 }
 
 type_init(register_sdl1);
+
+#ifdef CONFIG_OPENGL
+module_dep("chardev-spice");
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
index 272d19b0c152..a78188042578 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -1037,3 +1037,7 @@ static void spice_register_config(void)
     qemu_add_opts(&qemu_spice_opts);
 }
 opts_init(spice_register_config);
+
+#ifdef CONFIG_OPENGL
+module_dep("chardev-spice");
+#endif
-- 
2.31.1


