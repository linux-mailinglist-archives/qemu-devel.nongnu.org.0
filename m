Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077D25B690
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:45:59 +0200 (CEST)
Received: from localhost ([::1]:46492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbVu-00053O-6N
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTe-0000t2-55
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46913
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTc-0008Ev-Ge
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHnhCHbaw1UCsbt8aoWDUYk/Wbuw6dsuMInmZzJlL9E=;
 b=Ku1JCUSWfmMpermkhf4saS+j0Wu5mUuRij/Vdf7NMnb+RoR82Qp8v0wyFhH+qzAR/mfvsB
 0dQ9MNUCapZc5CR/UTIjNu9VgROk7u9ajfV4DVg4zpRvesX+QAbvERMnTPHVBjZRe3A98m
 Hq8oU53cCMnkcava1nhGzmq8CdlzzQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-3D0bAbdUM1-1ngosUwCl-A-1; Wed, 02 Sep 2020 18:43:33 -0400
X-MC-Unique: 3D0bAbdUM1-1ngosUwCl-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8273B8030C7
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 22:43:32 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CB0E1002D40;
 Wed,  2 Sep 2020 22:43:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/63] chardev: Rename TYPE_MSMOUSE_CHARDEV to
 TYPE_MOUSE_CHARDEV
Date: Wed,  2 Sep 2020 18:42:12 -0400
Message-Id: <20200902224311.1321159-5-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 16:25:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
---
 chardev/msmouse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 4033ca714d..b39a1b85dd 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -44,9 +44,9 @@ struct MouseChardev {
 };
 typedef struct MouseChardev MouseChardev;
 
-#define TYPE_MSMOUSE_CHARDEV "chardev-msmouse"
+#define TYPE_MOUSE_CHARDEV "chardev-msmouse"
 DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
-                         TYPE_MSMOUSE_CHARDEV)
+                         TYPE_MOUSE_CHARDEV)
 
 static void msmouse_chr_accept_input(Chardev *chr)
 {
@@ -178,7 +178,7 @@ static void char_msmouse_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo char_msmouse_type_info = {
-    .name = TYPE_MSMOUSE_CHARDEV,
+    .name = TYPE_MOUSE_CHARDEV,
     .parent = TYPE_CHARDEV,
     .instance_size = sizeof(MouseChardev),
     .instance_finalize = char_msmouse_finalize,
-- 
2.26.2


