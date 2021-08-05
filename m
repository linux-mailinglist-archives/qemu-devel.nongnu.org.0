Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62CE3E1E15
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 23:48:34 +0200 (CEST)
Received: from localhost ([::1]:38090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBlE9-0004EY-CI
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 17:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBlDO-0003Nc-NI
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 17:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBlDM-0001qW-Ci
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 17:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628200062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vdxTM4C0KO7pi9l+swDUMHkW24uAfawxkVhRlCdFyjU=;
 b=Kr2yQo5OsZMZE39Pr9jocHPGBgbwNOT4D7EeYelkWKXY8LeOLWMh9nnyw2rUEdCuHAVQq6
 GKwI4gFPoR1Le9c6qEvMo7Zq5kx/hSAnQLO795U6pNFbAzn5WS7hSfF4omd+GyDe5iwaSt
 8txespJO7ovJdjPLco2e96g9gBdeSck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-c0Tl6f90MkWxmTbHPH8JXg-1; Thu, 05 Aug 2021 17:47:42 -0400
X-MC-Unique: c0Tl6f90MkWxmTbHPH8JXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A97DB93924;
 Thu,  5 Aug 2021 21:47:40 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4802C26FD4;
 Thu,  5 Aug 2021 21:47:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] bcm2836: Remove redundant typedef and macros
Date: Thu,  5 Aug 2021 17:47:39 -0400
Message-Id: <20210805214739.390613-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit 58b350280e97 ("hw/arm/bcm2836: Restrict BCM283XInfo
declaration to C source") didn't just move the struct
BCM283XClass definition to bcm2836.c.  It also introduced a
typedef (BCM283XClass) and two type checking macros
(BCM283X_CLASS, BCM283X_GET_CLASS).

The typedef and macros duplicate what is already defined by the
OBJECT_DECLARE_TYPE declaration at bcm2836.h.  Remove the
redundant declarations.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Luc Michel <luc.michel@greensocs.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2836.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 24354338cad..f894338fc6a 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -16,7 +16,7 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
 
-typedef struct BCM283XClass {
+struct BCM283XClass {
     /*< private >*/
     DeviceClass parent_class;
     /*< public >*/
@@ -26,12 +26,7 @@ typedef struct BCM283XClass {
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
-} BCM283XClass;
-
-#define BCM283X_CLASS(klass) \
-    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
-#define BCM283X_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
+};
 
 static Property bcm2836_enabled_cores_property =
     DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus, 0);
-- 
2.31.1


