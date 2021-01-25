Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDDC3023C7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:42:53 +0100 (CET)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zKe-0007Vr-28
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l3zIj-0006Rc-KS
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:40:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l3zIf-0002Z2-Q1
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611571248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4wtn3IdGtDyS0l/jFY/TkkgQ5MmuTKZ8UXwdNg25+g=;
 b=bHlieG/N2yor7pFedWzaWRJymc/EPBBPFV5AA07WTY4q3JuTkJwFnWl80A2pQY3cKSP2jN
 aJY3zp8Kgd6ebB6AGc4hwWMNUImf1WFxGAcACFkhalfgyFNW/xDolXKpggtNme4jCwVINA
 r5TCTnpzPeG+Gddu7dpRd4cHk5ZUQdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-rd-baxQtMde7a5ELi1aedQ-1; Mon, 25 Jan 2021 05:40:46 -0500
X-MC-Unique: rd-baxQtMde7a5ELi1aedQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9958F806672
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 10:40:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE2AE10021B3;
 Mon, 25 Jan 2021 10:40:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 25AA818003B1; Mon, 25 Jan 2021 11:40:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Revert "vnc: move initialization to
 framebuffer_update_request"
Date: Mon, 25 Jan 2021 11:40:40 +0100
Message-Id: <20210125104041.495274-2-kraxel@redhat.com>
In-Reply-To: <20210125104041.495274-1-kraxel@redhat.com>
References: <20210125104041.495274-1-kraxel@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 9e1632ad07ca49de99da4bb231e9e2f22f2d8df5.

Older gtk-vnc versions can't deal with non-incremental update
requests sending pseudo-encodings, so trying to send full server
state (including desktop size, cursor etc. which is done using
pseudo-encodings) doesn't fly.  Return to old behavior to send
those only for new connects and when changes happen.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 66f7c1b9361e..2622f82a5a9f 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -687,6 +687,10 @@ static void vnc_desktop_resize(VncState *vs)
                             !vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT))) {
         return;
     }
+    if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
+        vs->client_height == pixman_image_get_height(vs->vd->server)) {
+        return;
+    }
 
     assert(pixman_image_get_width(vs->vd->server) < 65536 &&
            pixman_image_get_width(vs->vd->server) >= 0);
@@ -2042,10 +2046,6 @@ static void framebuffer_update_request(VncState *vs, int incremental,
     } else {
         vs->update = VNC_STATE_UPDATE_FORCE;
         vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
-        vnc_colordepth(vs);
-        vnc_desktop_resize(vs);
-        vnc_led_state_change(vs);
-        vnc_cursor_define(vs);
     }
 }
 
@@ -2189,7 +2189,10 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             break;
         }
     }
+    vnc_desktop_resize(vs);
     check_pointer_type_change(&vs->mouse_mode_notifier, NULL);
+    vnc_led_state_change(vs);
+    vnc_cursor_define(vs);
 }
 
 static void set_pixel_conversion(VncState *vs)
-- 
2.29.2


