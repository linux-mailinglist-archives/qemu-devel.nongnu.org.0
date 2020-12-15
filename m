Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0E2DAE4D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:52:54 +0100 (CET)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAl3-0003kI-GO
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgx-0008IB-Pf
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgv-0007HR-8E
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608040116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnFp4mvBEfl1hzYle8wjhfM0GH2mdsC38C/9Z5PtH0I=;
 b=AQEgkSWfzR9LfQMmt21eoQpCzgYKZ5og6Ednl10Uy/fVvsS3IgZ4tlm7rEAr+H33La7Y/O
 /fdMF4V0+wRXC4jGS4FotmoYXip9O0qPQVkHOQV2UVdEHTKM7n5APDPnBpiu+EgHnvCcx/
 pFZ1sQ+msT8PzfRyVekKaklZwvPEG/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-ZUbPn5jvMsGPafvqV49UsA-1; Tue, 15 Dec 2020 08:48:34 -0500
X-MC-Unique: ZUbPn5jvMsGPafvqV49UsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0AFC18C8C01
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 13:48:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E29D6267A;
 Tue, 15 Dec 2020 13:48:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B01629D9B; Tue, 15 Dec 2020 14:48:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] cs4231: Get rid of empty property array
Date: Tue, 15 Dec 2020 14:48:24 +0100
Message-Id: <20201215134826.5504-6-kraxel@redhat.com>
In-Reply-To: <20201215134826.5504-1-kraxel@redhat.com>
References: <20201215134826.5504-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

An empty props array is unnecessary, we can just not call
device_class_set_props().

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-id: 20201211220529.2290218-2-ehabkost@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/cs4231.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
index 8e9554ce9bcd..209c05a0a0d5 100644
--- a/hw/audio/cs4231.c
+++ b/hw/audio/cs4231.c
@@ -160,17 +160,12 @@ static void cs4231_init(Object *obj)
     sysbus_init_irq(dev, &s->irq);
 }
 
-static Property cs4231_properties[] = {
-    {.name = NULL},
-};
-
 static void cs4231_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = cs_reset;
     dc->vmsd = &vmstate_cs4231;
-    device_class_set_props(dc, cs4231_properties);
 }
 
 static const TypeInfo cs4231_info = {
-- 
2.27.0


