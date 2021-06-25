Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F4A3B43F9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:03:00 +0200 (CEST)
Received: from localhost ([::1]:40476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlU3-0002L5-22
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwlMe-0007wg-0u
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:55:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwlMb-0004XN-2d
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 08:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624625716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qA5ucowGbStGzmxgQSM1Fyb4WNrMPIx0Ma9164cWGQ=;
 b=WUaT93b+YNIHVpKQRNpLNhBk6z1lWioy1GqFWQNv/JcIT67VySVl5EIBxbzyOfCcwE7Byf
 dgbrkYFHiClqfSt6QkRV2PydGs8himpGCYRrhPumzsQzqojba2Ke5Olh6Cvxd/NOg7ixzX
 JJ1O3u+qvnS+EsWu4yZzfy5bB3XjJ2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-GswKt8vlPsifwx11UN1PGw-1; Fri, 25 Jun 2021 08:55:14 -0400
X-MC-Unique: GswKt8vlPsifwx11UN1PGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C922A5074D;
 Fri, 25 Jun 2021 12:55:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 957CB6091B;
 Fri, 25 Jun 2021 12:55:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] hw/block/fdc: Add description to floppy controllers
Date: Fri, 25 Jun 2021 08:54:41 -0400
Message-Id: <20210625125441.756802-7-jsnow@redhat.com>
In-Reply-To: <20210625125441.756802-1-jsnow@redhat.com>
References: <20210625125441.756802-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Change the '-device help' output from:

  Storage devices:
  name "floppy", bus floppy-bus, desc "virtual floppy drive"
  name "isa-fdc", bus ISA

to:

  Storage devices:
  name "floppy", bus floppy-bus, desc "virtual floppy drive"
  name "isa-fdc", bus ISA, desc "virtual floppy controller"

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210614193220.2007159-7-philmd@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/block/fdc-isa.c    | 1 +
 hw/block/fdc-sysbus.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index 0e22a10732..3bf64e0665 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -282,6 +282,7 @@ static void isabus_fdc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
+    dc->desc = "virtual floppy controller";
     dc->realize = isabus_fdc_realize;
     dc->fw_name = "fdc";
     dc->reset = fdctrl_external_reset_isa;
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index c6308f5300..57fc8773f1 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -205,6 +205,7 @@ static void sysbus_fdc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->desc = "virtual floppy controller";
     device_class_set_props(dc, sysbus_fdc_properties);
 }
 
@@ -230,6 +231,7 @@ static void sun4m_fdc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     sbdc->use_strict_io = true;
+    dc->desc = "virtual floppy controller";
     device_class_set_props(dc, sun4m_fdc_properties);
 }
 
-- 
2.31.1


