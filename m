Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4122B1B31
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:33:48 +0100 (CET)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYGx-00016V-BO
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDN-0005fT-T5
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDL-0002CW-Qg
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605270602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0jBz4ugr5fduVXb5PMNsrrqcUgr2sJyw1ZTcuyAOLGU=;
 b=JTMkE+YS5Oo/HK9Fhocl3wwyCVkwdGEm98fL9wSzYJCz9MaHD9tJCbU6JYxdUno4LrrChc
 D2u51PTLq34upI4NepZO3f1FS2ZcYazr9gPgLjtfNesfPj429578xuer6wgLKGrjS+ppUB
 DddtTi9atoeq44iduZ8f9lcJ+DycGqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-UZgXxgZxPjGfW7fCfxhfxw-1; Fri, 13 Nov 2020 07:30:00 -0500
X-MC-Unique: UZgXxgZxPjGfW7fCfxhfxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753B2801FDE;
 Fri, 13 Nov 2020 12:29:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 347BB5B4A3;
 Fri, 13 Nov 2020 12:29:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7239C9D92; Fri, 13 Nov 2020 13:29:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] hw/usb/Kconfig: Fix USB_XHCI_NEC (depends on USB_XHCI_PCI)
Date: Fri, 13 Nov 2020 13:29:52 +0100
Message-Id: <20201113122955.759-4-kraxel@redhat.com>
In-Reply-To: <20201113122955.759-1-kraxel@redhat.com>
References: <20201113122955.759-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 755fba11fbc and 8ddab8dd3d8 we can not build
USB_XHCI_NEC without USB_XHCI_PCI. Correct the Kconfig
dependency.

Fixes: 755fba11fbc ("usb/hcd-xhci: Move qemu-xhci device to hcd-xhci-pci.c")
Reviewed-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201109135300.2592982-2-philmd@redhat.com

[ kraxel: restore "default y if PCI_DEVICES" because
          "qemu-system-ppc64 -M pseries,usb=on" needs USB_XHCI_NEC=y ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index a674ce4c542e..3b07d9cf6879 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -43,8 +43,7 @@ config USB_XHCI_PCI
 config USB_XHCI_NEC
     bool
     default y if PCI_DEVICES
-    depends on PCI
-    select USB_XHCI
+    select USB_XHCI_PCI
 
 config USB_XHCI_SYSBUS
     bool
-- 
2.27.0


