Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAAF3E1638
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:00:25 +0200 (CEST)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdv6-0008CZ-4K
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdsm-0005gw-82
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdsk-0000PO-Qz
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bykDuWmowo5cwOmADbmeEKqhIej2kqyYevtwCdn4GsY=;
 b=du+IzmP52TdwDZVGH74rGqJ+JgH7d0EMBAvSHkIG1Clnm8q0QuksKjHJKsgUUh6xnj6YCy
 +a56yi+GAK7s9EdIzQ3ZYFjtuForLznoFjk5zRF5TGRrNXwyvifL+n0j/JOsakwWm8rfxS
 v1IJqJJMsaMGWiSNMOZzgEENUMGxF7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-ML0DJPA6NI6XaHe5bP14GQ-1; Thu, 05 Aug 2021 09:57:57 -0400
X-MC-Unique: ML0DJPA6NI6XaHe5bP14GQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30E8793921
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:57:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 499CC60CC9;
 Thu,  5 Aug 2021 13:57:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/18] ui/gtk-clipboard: use existing macros
Date: Thu,  5 Aug 2021 17:57:00 +0400
Message-Id: <20210805135715.857938-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hardcoding strings is error prone, use dedicated macros instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk-clipboard.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index bff28d2030..5e817ae55c 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -177,11 +177,11 @@ void gd_clipboard_init(GtkDisplayState *gd)
     qemu_clipboard_peer_register(&gd->cbpeer);
 
     gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =
-        gtk_clipboard_get(gdk_atom_intern("CLIPBOARD", FALSE));
+        gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);
     gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =
-        gtk_clipboard_get(gdk_atom_intern("PRIMARY", FALSE));
+        gtk_clipboard_get(GDK_SELECTION_PRIMARY);
     gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY] =
-        gtk_clipboard_get(gdk_atom_intern("SECONDARY", FALSE));
+        gtk_clipboard_get(GDK_SELECTION_SECONDARY);
 
     g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD],
                      "owner-change", G_CALLBACK(gd_owner_change), gd);
-- 
2.32.0.264.g75ae10bc75


