Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032A37289
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 13:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYqKq-0004tb-3f
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 07:13:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFL-0000P7-Tk
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 07:07:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYqFI-0003X6-6V
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 07:07:50 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38547)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hYqF6-0003EB-FB; Thu, 06 Jun 2019 07:07:36 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MkIAB-1gokqY1WHJ-00kkA9; Thu, 06 Jun 2019 13:06:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 13:06:17 +0200
Message-Id: <20190606110625.32127-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
References: <20190606110625.32127-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hp5C+eRkhKhZrL9ujfcR5R1twR4hIZGd7hOEgFE+5WIY2q2d8lY
	kN/JEeng4lPu0Ecb53uf5a36SNII/prxc7ozqApBR4wgoSiD282kjxkkuv3171iGM7yuz+r
	hONn0dYWoQi/b5920YVliGTFHcx0mDmfK75CcNl6N3MlE3EcdEwG1ZCC6ecgj9m33FqnDAN
	jSJz3ir0wPZLxcfDxFnTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WFMkMbI5+Qk=:l7BrzmzlCtS/uryTbB9SRq
	UjqIEOfGTswngkSpPUcZpXPwpySk2vU3hbL4UIf8mB5WfpmlQlwPQGwchlNjb8lOnACSxA08F
	db7lwXFr1dnLD4BV0GFXZ1OnNkSFuXdZqzYizIGmh7R9q9qpibg6UOZHtPlzJ00ikH4tFF9sW
	zLAt1MzgY0vxILRJzrsVGA/eriWyAYUfh4FL+qpxqwngkunsk86+PmLmsRgjTGT/9AJxOgj3Y
	3kksLEbdbBxR//IDg6AC2hGCheQ3LPYjQ4I9Lz5uNgchjdntKfhUm8R7LwB0rkqcIAB3jowY6
	CoU4I6jA8iJ39VRflpFyobnM5jV642+W8kyU6YGKHnRbiV2QJJsvzg+V1uTxUmLVSQmF9aRZN
	b48wRQ3TbUFX2UNpbAdb99WR4z8aiq4oaeAw5jZVdocc36+seHz0CqiM/+D1DEw4bYYQZjB8z
	Z5oB7GN5hd13Av/VSaLpG0AjkT5tXYK4oFntOS93kDN6RacwFdD+p5iyg7s5mT8Ur5A77rQvP
	/dhIQPcRxJ/rIe7xQaieAEPDyZ/2f4dXXL2MH78x6aThvfOcc0rvHW/d0IMVQ4KDVnr0AJUZ/
	99+OKSg1ON+mDyPixOqeNQj94jgcU+k1nnfQHT2Uh8aaIihEqRVfdOYNP/Rye0bny4OOgYAFN
	Dg79EVs9kP+U01ZTdjx7HCPrWvLjNLpksR2v+kf2i1dQ9C2L1gZ7Dr8VTcuDYlQnnQLN4zCqo
	yxRFyOPap2hCxh5HggK7PmGcZp9NU16B4+zOrg0ppOewJ+GZCs5ebQoxs1A=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-devel] [PULL 08/16] hw/pci-bridge: Use the QOM BUS() macro to
 access BusState.qbus
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	David Hildenbrand <david@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Rather than looking inside the definition of a BusState with "s->bus.qbus",
use the QOM prefered style: "BUS(&s->bus)".

This patch was generated using the following Coccinelle script:

    // Use BUS() macros to access BusState.qbus
    @use_bus_macro_to_access_qbus@
    expression obj;
    identifier bus;
    @@
    -&obj->bus.qbus
    +BUS(&obj->bus)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20190528164020.32250-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci/pci_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index c6d9ded3203c..8d954885c0a1 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -273,7 +273,7 @@ void pci_bridge_write_config(PCIDevice *d,
     newctl = pci_get_word(d->config + PCI_BRIDGE_CONTROL);
     if (~oldctl & newctl & PCI_BRIDGE_CTL_BUS_RESET) {
         /* Trigger hot reset on 0->1 transition. */
-        qbus_reset_all(&s->sec_bus.qbus);
+        qbus_reset_all(BUS(&s->sec_bus));
     }
 }
 
-- 
2.21.0


