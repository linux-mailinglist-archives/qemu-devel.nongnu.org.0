Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B82035CA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 13:34:53 +0200 (CEST)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnKiy-0001Jq-NM
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 07:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnKds-00035K-4Y
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 07:29:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35320
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnKdo-0008SV-7V
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 07:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592825371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=1Q7npfp7pBdZV5AqIfLpiFnKGUenub9kzRD4QTal6XE=;
 b=Qr4CJhp2ReZ3HGzVfhldFwlagJJDE3dHi0k7jvFY5hqTGJ93KOuh3uTDSlPegqdr5WU0SE
 hFenW4NcUdTnLAoKnYxj4gRU41fhJRN+AS+Vf1AXhjnr4AHkrVGJ7ecnwK5PH2W24T8F/q
 nEEBnbeLJxbQo6PT9mqDjowlW0lDTFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ZB1Zl5xaPx-QjHcwU_Hyqg-1; Mon, 22 Jun 2020 07:29:29 -0400
X-MC-Unique: ZB1Zl5xaPx-QjHcwU_Hyqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97EC7EC1A3;
 Mon, 22 Jun 2020 11:29:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 317277166A;
 Mon, 22 Jun 2020 11:29:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 96F469D7C; Mon, 22 Jun 2020 13:29:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/19] pc_basic_device_init: drop has_pit arg
Date: Mon, 22 Jun 2020 13:29:09 +0200
Message-Id: <20200622112914.30454-15-kraxel@redhat.com>
In-Reply-To: <20200622112914.30454-1-kraxel@redhat.com>
References: <20200622112914.30454-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we pass pcms anyway, we don't need the has_pit arg any more.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/pc.h | 1 -
 hw/i386/pc.c         | 3 +--
 hw/i386/pc_piix.c    | 2 +-
 hw/i386/pc_q35.c     | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9b94926410c0..3512dcfd3d27 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -165,7 +165,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
                           bool no_vmport,
-                          bool has_pit,
                           uint32_t hpet_irqs);
 void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd);
 void pc_cmos_init(PCMachineState *pcms,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9afb003dfc21..dfe8ba07e982 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1181,7 +1181,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
                           bool no_vmport,
-                          bool has_pit,
                           uint32_t hpet_irqs)
 {
     int i;
@@ -1232,7 +1231,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
-    if (!xen_enabled() && has_pit) {
+    if (!xen_enabled() && pcms->pit_enabled) {
         if (kvm_pit_in_kernel()) {
             pit = kvm_pit_init(isa_bus, 0x40);
         } else {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 605252fe7936..1242ed811804 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -236,7 +236,7 @@ static void pc_init1(MachineState *machine,
 
     /* init basic PC hardware */
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
-                         (pcms->vmport != ON_OFF_AUTO_ON), pcms->pit_enabled,
+                         (pcms->vmport != ON_OFF_AUTO_ON),
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e4b15f27227a..25dc40896673 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -276,7 +276,7 @@ static void pc_q35_init(MachineState *machine)
 
     /* init basic PC hardware */
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
-                         (pcms->vmport != ON_OFF_AUTO_ON), pcms->pit_enabled,
+                         (pcms->vmport != ON_OFF_AUTO_ON),
                          0xff0104);
 
     /* connect pm stuff to lpc */
-- 
2.18.4


