Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE032DB01D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:32:33 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCJU-00079D-BY
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC92-0008RE-KB
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8y-0002Rc-7U
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFZ5M1PLz+g6IPxnrKMQ1RGhOqiGT0g4KW6l5NHVNGY=;
 b=dBtQRGDOtpXk/essWUYuv3DZbbrDEJH/1qj3YdDm2BX65n4lmteDBhvSKuUNMSHWt2NKn/
 FNy+j7ko+93GLookwh+xGoT72BkaSuxu6tMylIY6mznhhJ+kkEoizX0LnnLxUC9Z1XJM2l
 Alm1WagEMpkip4Ih0WMQt2YCrkLEaoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-6q8LjmpaP1a4G2B-wzendw-1; Tue, 15 Dec 2020 10:21:32 -0500
X-MC-Unique: 6q8LjmpaP1a4G2B-wzendw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AE06192204B;
 Tue, 15 Dec 2020 15:20:46 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 093D160C17;
 Tue, 15 Dec 2020 15:20:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 23/25] qdev: Make qdev_propinfo_get_uint16() static
Date: Tue, 15 Dec 2020 10:19:40 -0500
Message-Id: <20201215151942.3125089-24-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are no users of the function outside qdev-properties.c.
Make function static and rename it to get_uint16().

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201211220529.2290218-14-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-prop-internal.h | 2 --
 hw/core/qdev-properties.c    | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index 9cf5cc1d51..d7b77844fe 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -20,8 +20,6 @@ void qdev_propinfo_set_default_value_int(ObjectProperty *op,
 void qdev_propinfo_set_default_value_uint(ObjectProperty *op,
                                           const Property *prop);
 
-void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp);
 void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp);
 void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 5e010afdb8..765e916c23 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -278,8 +278,8 @@ const PropertyInfo qdev_prop_uint8 = {
 
 /* --- 16bit integer --- */
 
-void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp)
+static void get_uint16(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
 {
     Property *prop = opaque;
     uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
@@ -304,7 +304,7 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
 
 const PropertyInfo qdev_prop_uint16 = {
     .name  = "uint16",
-    .get   = qdev_propinfo_get_uint16,
+    .get   = get_uint16,
     .set   = set_uint16,
     .set_default_value = qdev_propinfo_set_default_value_uint,
 };
-- 
2.28.0


