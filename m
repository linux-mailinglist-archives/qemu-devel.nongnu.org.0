Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA42520C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:39:23 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAemw-0000xB-JG
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWz-0001Y1-A4
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWx-0006IE-Ec
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpUdXIYBN+c71Zx0Thee68/jq9dVIOxyPTQmNz6rlaU=;
 b=T9XuLvQlB02jPXeORCiv7NdaxVUoxZ52tQYi1nDKZDhvPsf8PZP2ci7y33SGrcUb170grS
 xGxrjRogj6x6BfQDk5xKs7fVdGRHAwbRY1TiLM68/9y23kZjDNOf8LtBoHS+TNfXhWenZd
 QMtW2wKdandpeO4ie7qY6xyX0bsD/Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-Ng2TgE16PaqwGbE32pX11g-1; Tue, 25 Aug 2020 15:22:49 -0400
X-MC-Unique: Ng2TgE16PaqwGbE32pX11g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0215185B67B;
 Tue, 25 Aug 2020 19:22:48 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DC3010013C2;
 Tue, 25 Aug 2020 19:22:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 43/74] nubus: Rename class type checking macros
Date: Tue, 25 Aug 2020 15:20:39 -0400
Message-Id: <20200825192110.3528606-44-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the existing class type checking macros to be consistent
with the type name and instance type checking macro.  Use a
NUBUS_MACFB prefix instead of MACFB_NUBUS.

This will make future conversion to OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v2 -> v3: new patch added in series v3

---
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
---
 include/hw/display/macfb.h | 4 ++--
 hw/display/macfb.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index 26367ae2c4..347871b623 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -40,9 +40,9 @@ typedef struct {
     MacfbState macfb;
 } MacfbSysBusState;
 
-#define MACFB_NUBUS_DEVICE_CLASS(class) \
+#define NUBUS_MACFB_CLASS(class) \
     OBJECT_CLASS_CHECK(MacfbNubusDeviceClass, (class), TYPE_NUBUS_MACFB)
-#define MACFB_NUBUS_GET_CLASS(obj) \
+#define NUBUS_MACFB_GET_CLASS(obj) \
     OBJECT_GET_CLASS(MacfbNubusDeviceClass, (obj), TYPE_NUBUS_MACFB)
 
 typedef struct MacfbNubusDeviceClass {
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index b68faff4bb..ff8bdb846b 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -391,7 +391,7 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
 {
     NubusDevice *nd = NUBUS_DEVICE(dev);
     MacfbNubusState *s = NUBUS_MACFB(dev);
-    MacfbNubusDeviceClass *ndc = MACFB_NUBUS_GET_CLASS(dev);
+    MacfbNubusDeviceClass *ndc = NUBUS_MACFB_GET_CLASS(dev);
     MacfbState *ms = &s->macfb;
 
     ndc->parent_realize(dev, errp);
@@ -443,7 +443,7 @@ static void macfb_sysbus_class_init(ObjectClass *klass, void *data)
 static void macfb_nubus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    MacfbNubusDeviceClass *ndc = MACFB_NUBUS_DEVICE_CLASS(klass);
+    MacfbNubusDeviceClass *ndc = NUBUS_MACFB_CLASS(klass);
 
     device_class_set_parent_realize(dc, macfb_nubus_realize,
                                     &ndc->parent_realize);
-- 
2.26.2


