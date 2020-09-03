Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7464D25C878
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 20:07:42 +0200 (CEST)
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDte9-0003io-Ib
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 14:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDtZK-0004Y6-5z
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 14:02:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDtZI-0007Ts-KR
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 14:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599156159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bDwQ1+0PtvkQJU9rqHi5MHZzRgMG86kPPTDKFCaVVU=;
 b=RHxzhyi73p730ZsCf6d099Yyn8mV8fld7EfOafp09S5ff+YSitXnvrbQm6fCyIKjrYcAGS
 Hx2Y4dw7DCuSM+ClCrgYc5P/eLUV77QDX5E3lU7attHpdGUzMZoZMzG9O3hiIHMme93CGT
 HmVCS2rlDUdZLJ8C9m23RGey1FM2uwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-LwNYACRcMO2ttizD8Lc0ag-1; Thu, 03 Sep 2020 14:02:33 -0400
X-MC-Unique: LwNYACRcMO2ttizD8Lc0ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2FD1DE0A;
 Thu,  3 Sep 2020 18:02:32 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E26B19D61;
 Thu,  3 Sep 2020 18:02:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [PATCH 8/8] tusb6010: Rename TUSB to TUSB6010
Date: Thu,  3 Sep 2020 14:01:28 -0400
Message-Id: <20200903180128.1523959-9-ehabkost@redhat.com>
In-Reply-To: <20200903180128.1523959-1-ehabkost@redhat.com>
References: <20200903180128.1523959-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make type checking function name consistent with the TYPE_TUSB6010
constant and QOM type name ("tusb6010").

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: "Daniel P. Berrangé" <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* v1 subject was "tusb6010: Rename TYPE_TUSB6010 to TYPE_TUSB"
* Rename TUSB macro to TUSB6010 instead, to keep it consistent
  with the QOM type name ("tusb6010")
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/usb/tusb6010.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 2bee3ae59f..dd20996d13 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -32,7 +32,7 @@
 
 #define TYPE_TUSB6010 "tusb6010"
 typedef struct TUSBState TUSBState;
-DECLARE_INSTANCE_CHECKER(TUSBState, TUSB,
+DECLARE_INSTANCE_CHECKER(TUSBState, TUSB6010,
                          TYPE_TUSB6010)
 
 struct TUSBState {
@@ -779,7 +779,7 @@ static void tusb6010_irq(void *opaque, int source, int level)
 
 static void tusb6010_reset(DeviceState *dev)
 {
-    TUSBState *s = TUSB(dev);
+    TUSBState *s = TUSB6010(dev);
     int i;
 
     s->test_reset = TUSB_PROD_TEST_RESET_VAL;
@@ -815,7 +815,7 @@ static void tusb6010_reset(DeviceState *dev)
 
 static void tusb6010_realize(DeviceState *dev, Error **errp)
 {
-    TUSBState *s = TUSB(dev);
+    TUSBState *s = TUSB6010(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     s->otg_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tusb_otg_tick, s);
-- 
2.26.2


