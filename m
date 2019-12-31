Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718C12DAF7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 19:39:34 +0100 (CET)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imMQX-0007Sh-3W
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 13:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43246)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1imMKF-0007g2-R3
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1imMKE-0007uP-Qc
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21363
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1imMKE-0007st-MD
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577817182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXAhfjSLO3aXoXyXTZKRgP1FoH+VJi2UxhjlvOWZwX8=;
 b=QnKPblrwZ3Q5vk6mSpqmvHqhHEm9v3IMJBNGGcdYx8J0Ci6v4Yjn5bn+o1zUASPijo8HmL
 BOPl32u7j5ga7tYRMTTYma1qq7ubFA37GJY4KNkbd9TIxKMwtLVkdDJGLTtv+uOspDkuq0
 uqDK+2lt0oh2f8gnNdwnDC/yiUgaC20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118--jKQVjtiMLWj06ku8NN3NQ-1; Tue, 31 Dec 2019 13:33:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CEBE107ACC4;
 Tue, 31 Dec 2019 18:32:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A146282070;
 Tue, 31 Dec 2019 18:32:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 03/14] hw/i386/Kconfig: Let the MicroVM machine select the
 SERIAL_ISA config
Date: Tue, 31 Dec 2019 19:32:05 +0100
Message-Id: <20191231183216.6781-4-philmd@redhat.com>
In-Reply-To: <20191231183216.6781-1-philmd@redhat.com>
References: <20191231183216.6781-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: -jKQVjtiMLWj06ku8NN3NQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When configured with --without-default-devices, the build fails:

     LINK    x86_64-softmmu/qemu-system-x86_64
  /usr/bin/ld: hw/i386/microvm.o: in function `microvm_devices_init':
  hw/i386/microvm.c:157: undefined reference to `serial_hds_isa_init'
  collect2: error: ld returned 1 exit status
  make[1]: *** [Makefile:206: qemu-system-x86_64] Error 1
  make: *** [Makefile:483: x86_64-softmmu/all] Error 2

While the MicroVM machine only uses the ISA serial port when the
MICROVM_MACHINE_ISA_SERIAL property is set, it has to be linked
with it. Replace the 'imply' Kconfig rule by a 'select'.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Sergio Lopez <slp@redhat.com>
---
 hw/i386/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index e428322a2c..cbcfb1ce81 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -96,7 +96,7 @@ config Q35
=20
 config MICROVM
     bool
-    imply SERIAL_ISA
+    select SERIAL_ISA
     select ISA_BUS
     select APIC
     select IOAPIC
--=20
2.21.0


