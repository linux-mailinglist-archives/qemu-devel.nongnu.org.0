Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FDB2AF411
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:52:39 +0100 (CET)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrUE-0004Ak-Ex
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcrRe-0002WF-I9
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcrRZ-0001qZ-JU
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKe3oBQLm2a+hOtqxx/wc/SsMEvmYRw16qPBLjKNppk=;
 b=Ud8CqM/OJqR7LcT4FaAKjXAtmeiF3b/lvYPDHTIzjFRnMWREUcF3f5bsAdy4ZWQMPP2kJv
 KtNGaHHoiXZHB+j2Ya/AMkP22TvNglxSwYt1HdYE7Ab/dgT8mWd/Q3IJjUIDdgBaBV9LvG
 yBteitiBnzgTskTL5fUJe720fnuryzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-WHiTyUUaM6OCX2fdVLWHUA-1; Wed, 11 Nov 2020 09:49:49 -0500
X-MC-Unique: WHiTyUUaM6OCX2fdVLWHUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AECB1891E8A;
 Wed, 11 Nov 2020 14:49:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 267645B4C4;
 Wed, 11 Nov 2020 14:49:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] pvpanic: Advertise the PVPANIC_CRASHLOADED event support
Date: Wed, 11 Nov 2020 09:49:46 -0500
Message-Id: <20201111144946.1213713-2-pbonzini@redhat.com>
In-Reply-To: <20201111144946.1213713-1-pbonzini@redhat.com>
References: <20201111144946.1213713-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Advertise both types of events as supported when the guest OS
queries the pvpanic device.  Currently only PVPANIC_PANICKED is
exposed; PVPANIC_CRASHLOADED must also be advertised, but only on
new machine types.

Fixes: 7dc58deea79a ("pvpanic: implement crashloaded event handling")
Reported-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c          | 1 +
 hw/misc/pvpanic.c          | 5 ++++-
 tests/qtest/pvpanic-test.c | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 98b87f76cb..d0408049b5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "virtio-blk-device", "num-queues", "1"},
     { "virtio-scsi-device", "num_queues", "1"},
     { "nvme", "use-intel-id", "on"},
+    { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
 };
 const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
 
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 598d5471a4..35d6797831 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -61,12 +61,14 @@ struct PVPanicState {
 
     MemoryRegion io;
     uint16_t ioport;
+    uint8_t events;
 };
 
 /* return supported events on read */
 static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
 {
-    return PVPANIC_PANICKED;
+    PVPanicState *pvp = opaque;
+    return pvp->events;
 }
 
 static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val,
@@ -112,6 +114,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
 
 static Property pvpanic_isa_properties[] = {
     DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicState, ioport, 0x505),
+    DEFINE_PROP_UINT8("events", PVPanicState, events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/tests/qtest/pvpanic-test.c b/tests/qtest/pvpanic-test.c
index 0657de797f..016b32ebee 100644
--- a/tests/qtest/pvpanic-test.c
+++ b/tests/qtest/pvpanic-test.c
@@ -20,7 +20,7 @@ static void test_panic(void)
     qts = qtest_init("-device pvpanic");
 
     val = qtest_inb(qts, 0x505);
-    g_assert_cmpuint(val, ==, 1);
+    g_assert_cmpuint(val, ==, 3);
 
     qtest_outb(qts, 0x505, 0x1);
 
-- 
2.26.2


