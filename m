Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8026AD81B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:14:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRUV-0006zH-9H; Tue, 07 Mar 2023 02:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTn-0005nl-Qz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTm-0005ss-7y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLatR455SQenKyYVpWh240L3nFv0DcBK5c+gRwnaS90=;
 b=bhiKQV8/W7NQahjZdRJv8TEZWWt3PbHfIuOhSJvy/gvU6Jq6SzAkquoIXk3VLPxhwxQeoz
 YvDMBCorOixTK5YHz1urq1X2Z5bGzUm17dw8JXP7Ca1QK/fnWxprnJ443Hxc6w63yh/hln
 c0c7o2OV7vauK5KDj1p+BhYEP5WBVgM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-2QLa0Ci8M82W98dJh4-tUg-1; Tue, 07 Mar 2023 02:11:17 -0500
X-MC-Unique: 2QLa0Ci8M82W98dJh4-tUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6397B85A588;
 Tue,  7 Mar 2023 07:11:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE6440C10FA;
 Tue,  7 Mar 2023 07:11:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 49/51] hw/net/eepro100: Remove instance
 EEPRO100State::has_extended_tcb_support
Date: Tue,  7 Mar 2023 15:08:14 +0800
Message-Id: <20230307070816.34833-50-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

'has_extended_tcb_support' is accessed read-only and is present
in the class definition. No need to duplicate it in the instance
state. Directly access the class field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/eepro100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index ab20558..d775790 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -292,7 +292,6 @@ struct EEPRO100State {
 
     /* Quasi static device properties (no need to save them). */
     uint16_t stats_size;
-    bool has_extended_tcb_support;
 };
 
 /* Word indices in EEPROM. */
@@ -511,7 +510,6 @@ static void e100_pci_reset(DeviceState *dev)
     pci_set_byte(pci_conf + PCI_MAX_LAT, 0x18);
 
     s->stats_size = info->stats_size;
-    s->has_extended_tcb_support = info->has_extended_tcb_support;
 
     switch (device) {
     case i82550:
@@ -746,6 +744,8 @@ static void read_cb(EEPRO100State *s)
 
 static void tx_command(EEPRO100State *s)
 {
+    EEPRO100Class *ek = EEPRO100_GET_CLASS(s);
+    const E100PCIDeviceInfo *info = ek->info;
     const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint32_t tbd_array = s->tx.tbd_array_addr;
     uint16_t tcb_bytes = s->tx.tcb_bytes & 0x3fff;
@@ -782,7 +782,7 @@ static void tx_command(EEPRO100State *s)
         uint16_t tx_buffer_size;
         uint16_t tx_buffer_el;
 
-        if (s->has_extended_tcb_support && !(s->configuration[6] & BIT(4))) {
+        if (info->has_extended_tcb_support && !(s->configuration[6] & BIT(4))) {
             /* Extended Flexible TCB. */
             for (; tbd_count < 2; tbd_count++) {
                 ldl_le_pci_dma(&s->dev, tbd_address, &tx_buffer_address, attrs);
-- 
2.7.4


