Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C047E7836
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 19:16:33 +0100 (CET)
Received: from localhost ([::1]:40638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP9Z8-0000Ki-Dj
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 14:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iP80Y-0002us-PN
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iP80W-0008B7-Q2
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53846
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iP80W-00089i-Mb
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572280600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCTIRdFiH4uf08N1aCQiObLT3mS4637DLQTQTbUuYyw=;
 b=Ee3krbCvIMIV5/upjZDdx1YeQ4+1SzD+PKUMe0OGFS8UCNOnYblJl+7paaftxEdB2Edhp/
 97sJ9aj1FGUST7GsVhdTrGXMyAhYx/455gvM5YCfOx0p+zLHN0K9jX6UCSzbineczHDgXv
 JabiOukejJhjfl5iUzOsuETYgapkkzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-FAAXsg9ZNyyv2vgESG3QJA-1; Mon, 28 Oct 2019 12:36:37 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEBAC8017CC;
 Mon, 28 Oct 2019 16:36:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-87.brq.redhat.com [10.40.204.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12DAA1C941;
 Mon, 28 Oct 2019 16:36:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] hw/pci-host/piix: Fix code style issues
Date: Mon, 28 Oct 2019 17:34:44 +0100
Message-Id: <20191028163447.18541-18-philmd@redhat.com>
In-Reply-To: <20191028163447.18541-1-philmd@redhat.com>
References: <20191028163447.18541-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: FAAXsg9ZNyyv2vgESG3QJA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will move this code, fix its style first.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/pci-host/piix.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 95b04122fa..1544c4726b 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -133,9 +133,10 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *=
opaque, int pci_intx);
 static void piix3_write_config_xen(PCIDevice *dev,
                                uint32_t address, uint32_t val, int len);
=20
-/* return the global irq number corresponding to a given device irq
-   pin. We could also use the bus number to have a more precise
-   mapping. */
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
 static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 {
     int slot_addend;
--=20
2.21.0


