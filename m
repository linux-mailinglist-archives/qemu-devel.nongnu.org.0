Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7043012DAF0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 19:35:29 +0100 (CET)
Received: from localhost ([::1]:45324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imMMa-0001dj-0W
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 13:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1imMKb-0008FC-Rw
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1imMKa-0000iD-Lu
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49066
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1imMKa-0000hC-Hn
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577817204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfZLXSfyo3Wvv8uUkjIdymg6nDDM0OpyL5RFATQJF6Q=;
 b=D2bFdwYfaJI8IQ1LP8mO2Rebh3K7Z1aGQmOP2KhME5IFhVQ+qRM+RpZjmyzGdD2Wnm6pHS
 eG8SAR22+jGYP+StuwADItmDOtVmvxVfwd6F1t65GmxOWZEjHn2Cw8wbUEwEulcHVektgq
 PgXHYzJObvvsD7CEMBltkF5b0Q6mm1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-t72Ut1XWPZanw2CwLq0stQ-1; Tue, 31 Dec 2019 13:33:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A710F800D4E;
 Tue, 31 Dec 2019 18:33:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A975067673;
 Tue, 31 Dec 2019 18:33:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 05/14] hw/i2c/Kconfig: Add an entry for the SMBus
Date: Tue, 31 Dec 2019 19:32:07 +0100
Message-Id: <20191231183216.6781-6-philmd@redhat.com>
In-Reply-To: <20191231183216.6781-1-philmd@redhat.com>
References: <20191231183216.6781-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: t72Ut1XWPZanw2CwLq0stQ-1
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
Cc: Fam Zheng <fam@euphon.net>, Corey Minyard <cminyard@mvista.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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

The System Management Bus is more or less a derivative of the I2C
bus, thus the Kconfig entry depends of I2C.
Not all boards providing an I2C bus support SMBus.
Use two different Kconfig entries to be able to select I2C without
selecting SMBus.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Corey Minyard <cminyard@mvista.com>
---
 default-configs/mips-softmmu-common.mak | 1 +
 hw/i2c/Kconfig                          | 8 ++++++--
 hw/i2c/Makefile.objs                    | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips=
-softmmu-common.mak
index da29c6c0b2..ac76d944b8 100644
--- a/default-configs/mips-softmmu-common.mak
+++ b/default-configs/mips-softmmu-common.mak
@@ -37,6 +37,7 @@ CONFIG_R4K=3Dy
 CONFIG_MALTA=3Dy
 CONFIG_PCNET_PCI=3Dy
 CONFIG_MIPSSIM=3Dy
+CONFIG_SMBUS=3Dy
 CONFIG_ACPI_SMBUS=3Dy
 CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_TEST_DEVICES=3Dy
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 2bbd395813..09642a6dcb 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -1,9 +1,13 @@
 config I2C
     bool
=20
+config SMBUS
+    bool
+    select I2C
+
 config SMBUS_EEPROM
     bool
-    depends on I2C
+    select SMBUS
=20
 config VERSATILE_I2C
     bool
@@ -11,7 +15,7 @@ config VERSATILE_I2C
=20
 config ACPI_SMBUS
     bool
-    select I2C
+    select SMBUS
=20
 config BITBANG_I2C
     bool
diff --git a/hw/i2c/Makefile.objs b/hw/i2c/Makefile.objs
index d7073a401f..cbbc8507a3 100644
--- a/hw/i2c/Makefile.objs
+++ b/hw/i2c/Makefile.objs
@@ -1,4 +1,5 @@
-common-obj-$(CONFIG_I2C) +=3D core.o smbus_slave.o smbus_master.o
+common-obj-$(CONFIG_I2C) +=3D core.o
+common-obj-$(CONFIG_SMBUS) +=3D smbus_slave.o smbus_master.o
 common-obj-$(CONFIG_SMBUS_EEPROM) +=3D smbus_eeprom.o
 common-obj-$(CONFIG_VERSATILE_I2C) +=3D versatile_i2c.o
 common-obj-$(CONFIG_ACPI_X86_ICH) +=3D smbus_ich9.o
--=20
2.21.0


