Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690172B111F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:14:20 +0100 (CET)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKrC-0006dY-HL
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQY-0007rp-U3
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQX-0003f2-2s
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qi/zfVz1M40pnEprIV3M8fmvBwq9LUvwFczHJz+Xazo=;
 b=QARq28wyxjFb/fT5i4XeA8j9JlrsQZ5Yu+cO8hrxcdmTud3IPsjYkpsvpPPfXK5VWZujLa
 8k1is1gh85vbfEtqPR9Dg/GXY3RyqJN/ZL3yuw77bT2BG4NSVjtL6hDoHsWWrHdYFsIsnr
 Bslrjp0tq2gekyaS7JyXTxIf490FZ/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-Qq9Qzm0GNR-bs8XyseLi3Q-1; Thu, 12 Nov 2020 16:46:42 -0500
X-MC-Unique: Qq9Qzm0GNR-bs8XyseLi3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8F94237F;
 Thu, 12 Nov 2020 21:46:41 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF7C60C13;
 Thu, 12 Nov 2020 21:46:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 37/53] qdev: Remove ArrayElementProperty.propname field
Date: Thu, 12 Nov 2020 16:43:34 -0500
Message-Id: <20201112214350.872250-38-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we don't save the property name in Property.name
anymore, we don't need the to keep the property name string alive
after the property was registered.

We can remove the ArrayElementProperty.propname field, and free
the string immediately after registering the property.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v2 of the series
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index ad08c80e67..2ab1c9688a 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -529,7 +529,6 @@ const PropertyInfo prop_info_size32 = {
  */
 typedef struct {
     struct Property prop;
-    char *propname;
     ObjectPropertyRelease *release;
 } ArrayElementProperty;
 
@@ -543,7 +542,6 @@ static void array_element_release(Object *obj, const char *name, void *opaque)
     if (p->release) {
         p->release(obj, name, opaque);
     }
-    g_free(p->propname);
     g_free(p);
 }
 
@@ -587,11 +585,10 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
      */
     *arrayptr = eltptr = g_malloc0(*alenptr * prop->arrayfieldsize);
     for (i = 0; i < *alenptr; i++, eltptr += prop->arrayfieldsize) {
-        char *propname = g_strdup_printf("%s[%d]", arrayname, i);
+        g_autofree char *propname = g_strdup_printf("%s[%d]", arrayname, i);
         ArrayElementProperty *arrayprop = g_new0(ArrayElementProperty, 1);
         ObjectProperty *elmop;
         arrayprop->release = prop->arrayinfo->release;
-        arrayprop->propname = propname;
         arrayprop->prop.info = prop->arrayinfo;
         /* This ugly piece of pointer arithmetic sets up the offset so
          * that when the underlying get/set hooks call qdev_get_prop_ptr
-- 
2.28.0


