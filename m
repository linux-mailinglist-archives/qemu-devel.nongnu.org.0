Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB124AC09
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:19:52 +0200 (CEST)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YJ5-0000Q3-N5
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YD7-0006ET-23
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:13:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27382
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YD5-0002O1-Aq
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llSCwNEXWLo8Fe9VkTjEqpP8JqpOy2uRkKjeyMPSXbo=;
 b=OCAwxtX3okrazkcZIqbZRmADMBZ+iOwiABKfU7jNA0eP3R1IzZsC92VK8j7+Q5y4zna6Rv
 NXlnyzyBUF0NHNNZftZaNyJIgo2/QzQwoAHYxpkuKVXwAgA524dnkL1P9tPFvEQNxDaFMU
 maB51wz+0mtVmWYVW7yzSGNC494bk0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-DWgOULAlMMeoB-BZY4h6-w-1; Wed, 19 Aug 2020 20:13:37 -0400
X-MC-Unique: DWgOULAlMMeoB-BZY4h6-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3243E8030A1
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 00:13:36 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE9987E303;
 Thu, 20 Aug 2020 00:13:35 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/58] platform-bus: Delete macros for non-existing typedef
Date: Wed, 19 Aug 2020 20:12:02 -0400
Message-Id: <20200820001236.1284548-25-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 18:27:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PlatformBusDeviceClass doesn't exist.  This will break when we
automatically convert the code to use OBJECT_DEFINE_TYPE().
Delete the macros that reference the non-existing typedef.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none

---
Cc: qemu-devel@nongnu.org
---
 include/hw/platform-bus.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
index 19e20c57ce..33745a418e 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -29,10 +29,6 @@ typedef struct PlatformBusDevice PlatformBusDevice;
 #define TYPE_PLATFORM_BUS_DEVICE "platform-bus-device"
 #define PLATFORM_BUS_DEVICE(obj) \
      OBJECT_CHECK(PlatformBusDevice, (obj), TYPE_PLATFORM_BUS_DEVICE)
-#define PLATFORM_BUS_DEVICE_CLASS(klass) \
-     OBJECT_CLASS_CHECK(PlatformBusDeviceClass, (klass), TYPE_PLATFORM_BUS_DEVICE)
-#define PLATFORM_BUS_DEVICE_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(PlatformBusDeviceClass, (obj), TYPE_PLATFORM_BUS_DEVICE)
 
 struct PlatformBusDevice {
     /*< private >*/
-- 
2.26.2


