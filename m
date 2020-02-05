Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3E715387D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 19:52:25 +0100 (CET)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izPmi-0007Dc-Q4
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 13:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33947)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jusual@redhat.com>) id 1izPm1-0006mD-Ht
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 13:51:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jusual@redhat.com>) id 1izPm0-0005rY-7s
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 13:51:41 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49429
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jusual@redhat.com>) id 1izPm0-0005nW-3t
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 13:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580928699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OzZGw3pGQJA9fRYahalq5zdPl+c8vv2sD9FXMnrzKb0=;
 b=Y9JtJSW1YT3o9yRYJg9adwz6SUgDv1jdiZKskiUBds8A4MfRNa3tDhzILW1UsS8D9nIAy2
 pba2dgWCrvX3tYPLzK2InkOu/zDeKzkQZsvlVbnxXYdw2xhrj94i1A8FjkVgHLMWzYdtWE
 bkWcjMZVeA1y1sH5K4j/pwgB/+LYLXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-gtjIdYSBO523jTju9qQRZA-1; Wed, 05 Feb 2020 13:51:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03AC310CE782;
 Wed,  5 Feb 2020 18:51:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-204-83.brq.redhat.com
 [10.40.204.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26CAC60C05;
 Wed,  5 Feb 2020 18:51:26 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] hw/pci/pci_bridge: Fix typo in comment
Date: Wed,  5 Feb 2020 19:51:23 +0100
Message-Id: <20200205185123.210209-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gtjIdYSBO523jTju9qQRZA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Julia Suvorova <jusual@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 include/hw/pci/pci_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ba488818d2..99c674e949 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -108,7 +108,7 @@ void pci_bridge_dev_unplug_request_cb(HotplugHandler *h=
otplug_dev,
=20
 /*
  * before qdev initialization(qdev_init()), this function sets bus_name an=
d
- * map_irq callback which are necessry for pci_bridge_initfn() to
+ * map_irq callback which are necessary for pci_bridge_initfn() to
  * initialize bus.
  */
 void pci_bridge_map_irq(PCIBridge *br, const char* bus_name,
--=20
2.24.1


