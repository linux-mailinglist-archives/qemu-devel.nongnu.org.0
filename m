Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C26293641
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 09:55:58 +0200 (CEST)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUmUv-0003LY-6x
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 03:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUmOK-00058t-5E
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 03:49:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUmOE-0001oG-ES
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 03:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603180137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsKQ3oWwNtNTg3Wc2O1XvFakQW3Ra/VRPnj5TrWSXJU=;
 b=QFDMaCtwj3LTby6bkfdvm6bEgbGgebNhBTMpzXH5a0q8zUZ15Svu2LzKihPEEPrSQipafn
 Prr6kBcN0X2Xbys2EZ1aL5w8rmDvN6Spw/jOhkc0Ca75zcpKzrRPG/mnZxk3AqEFQFpRBN
 bAYTL3Bcd0ZNFDHmfM4SJpz1L1Da6AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-d1yjuLNwOa-Jy7kG6kOcwg-1; Tue, 20 Oct 2020 03:48:56 -0400
X-MC-Unique: d1yjuLNwOa-Jy7kG6kOcwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6CB8049D9;
 Tue, 20 Oct 2020 07:48:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EB7E60C47;
 Tue, 20 Oct 2020 07:48:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5583E9D5A; Tue, 20 Oct 2020 09:48:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] usb/xhci: fixup xhci kconfig deps
Date: Tue, 20 Oct 2020 09:48:38 +0200
Message-Id: <20201020074844.5304-5-kraxel@redhat.com>
In-Reply-To: <20201020074844.5304-1-kraxel@redhat.com>
References: <20201020074844.5304-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

USB_XHCI does not depend on PCI any more.
USB_XHCI_SYSBUS must select USB_XHCI not USB.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 4dd2ba9630cb..a674ce4c542e 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -32,8 +32,6 @@ config USB_EHCI_SYSBUS
 
 config USB_XHCI
     bool
-    default y if PCI_DEVICES
-    depends on PCI
     select USB
 
 config USB_XHCI_PCI
@@ -50,8 +48,8 @@ config USB_XHCI_NEC
 
 config USB_XHCI_SYSBUS
     bool
-    default y if USB_XHCI
-    select USB
+    default y
+    select USB_XHCI
 
 config USB_MUSB
     bool
-- 
2.27.0


