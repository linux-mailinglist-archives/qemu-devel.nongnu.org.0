Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D01D25B68B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:44:40 +0200 (CEST)
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbUd-000272-CT
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTZ-0000ih-Bu
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:33 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55046
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbTX-0008EN-PW
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKJS2c3qqU2sF1anLoTfBPzSiM1NGzfjuKynHVZktj0=;
 b=M9mlz7tzAVarwSkzXtJ2G4lvD0a+5GNz44dvAHWTdc+XBfw29KJv5Km63O6HeRRpWkamjm
 flW7UC25u/xbma2/hOefUp+4W73PiuFr+giy6+00ztKk2h3JrekYKjtrdxDgu92LYXIWy9
 yFzLge0AdB73tJKkHhZX4teaU4ZSqYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-EY9SSBwPNqmZN0w8VdUfiA-1; Wed, 02 Sep 2020 18:43:29 -0400
X-MC-Unique: EY9SSBwPNqmZN0w8VdUfiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A36D11DE04;
 Wed,  2 Sep 2020 22:43:28 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4C6C7E313;
 Wed,  2 Sep 2020 22:43:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/63] chardev: Rename TYPE_BRAILLE_CHARDEV to
 TYPE_BAUM_CHARDEV
Date: Wed,  2 Sep 2020 18:42:11 -0400
Message-Id: <20200902224311.1321159-4-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 17:27:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
---
 chardev/baum.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index d6c9f698c1..0cae8373f4 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -104,9 +104,9 @@ struct BaumChardev {
 };
 typedef struct BaumChardev BaumChardev;
 
-#define TYPE_BRAILLE_CHARDEV "chardev-braille"
+#define TYPE_BAUM_CHARDEV "chardev-braille"
 DECLARE_INSTANCE_CHECKER(BaumChardev, BAUM_CHARDEV,
-                         TYPE_BRAILLE_CHARDEV)
+                         TYPE_BAUM_CHARDEV)
 
 /* Let's assume NABCC by default */
 enum way {
@@ -674,7 +674,7 @@ static void char_braille_class_init(ObjectClass *oc, void *data)
 }
 
 static const TypeInfo char_braille_type_info = {
-    .name = TYPE_BRAILLE_CHARDEV,
+    .name = TYPE_BAUM_CHARDEV,
     .parent = TYPE_CHARDEV,
     .instance_size = sizeof(BaumChardev),
     .instance_finalize = char_braille_finalize,
-- 
2.26.2


