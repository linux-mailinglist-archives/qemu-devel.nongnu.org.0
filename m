Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD1207236
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:35:28 +0200 (CEST)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3gd-00033G-Qf
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3cE-0004JM-Qk
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44884
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c4-0007ze-Fq
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=pyfsMHzLAMpLmC2/2ZneFx8EwfYzlS6RTEujwUnogmQ=;
 b=WamVScexMk2cJ6xKLQyD/n7nBnOHcqiwmoX0/nik+SdfF67//slyT20Fhx7RlhX+PxM0Ld
 tLeu7VURyX6kU5n0e/NTC69kYvrzkWmGeVgtiPL3+3IJJjXGpR0IQilNc0ZWVxNbaFihea
 zUB1H2j4WhxHITkQQ1GresbAZkYZPas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-T1XX5gT6NmGRHuLqaSCeZg-1; Wed, 24 Jun 2020 07:30:40 -0400
X-MC-Unique: T1XX5gT6NmGRHuLqaSCeZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9983A0BE0;
 Wed, 24 Jun 2020 11:30:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91A6061981;
 Wed, 24 Jun 2020 11:30:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7345131E62; Wed, 24 Jun 2020 13:30:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/20] audio: set default value for pcspk.iobase property
Date: Wed, 24 Jun 2020 13:30:26 +0200
Message-Id: <20200624113026.13343-21-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allows to drop the explicit qdev_prop_set_uint32 call in pcspk_init.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/audio/pcspk.h | 6 +-----
 hw/audio/pcspk.c         | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/hw/audio/pcspk.h b/include/hw/audio/pcspk.h
index 8b485602675f..06cba00b8376 100644
--- a/include/hw/audio/pcspk.h
+++ b/include/hw/audio/pcspk.h
@@ -33,11 +33,7 @@
 
 static inline void pcspk_init(ISADevice *isadev, ISABus *bus, ISADevice *pit)
 {
-    DeviceState *dev;
-
-    dev = DEVICE(isadev);
-    qdev_prop_set_uint32(dev, "iobase", 0x61);
-    object_property_set_link(OBJECT(dev), OBJECT(pit), "pit", NULL);
+    object_property_set_link(OBJECT(isadev), OBJECT(pit), "pit", NULL);
     isa_realize_and_unref(isadev, bus, &error_fatal);
 }
 
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index 4c7e339ac2b5..ea539e7605a8 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -219,7 +219,7 @@ static const VMStateDescription vmstate_spk = {
 
 static Property pcspk_properties[] = {
     DEFINE_AUDIO_PROPERTIES(PCSpkState, card),
-    DEFINE_PROP_UINT32("iobase", PCSpkState, iobase,  -1),
+    DEFINE_PROP_UINT32("iobase", PCSpkState, iobase,  0x61),
     DEFINE_PROP_BOOL("migrate", PCSpkState, migrate,  true),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.18.4


