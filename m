Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C36FE22BE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 20:50:59 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNLii-0000Db-8p
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 14:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKXo-00066Q-P3
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:35:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKXn-0002mM-HD
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:35:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37464
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKXn-0002lu-Bm
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9r30TFYWwWXP6UsNuJpEoLyIN45bJ0sm/8D+1psh3Ds=;
 b=PVdX5HMHFgDYkPKJ+mz2R6LI90N5sIr/eLTPajLz+fLJ6hb2KBu5431saRI8HhY/Eh165/
 HiY8lpIlBW28tGypkQoHgeMB+CuUz2s4Ri+7kh3qlF9xYfQkBxOXauYR8Q9YY6hSltwN2R
 0hhtgA/G0LycRx0Fazp3adyQ1pf7A7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-jJnOoQ9AOZGMIorWMJAh2g-1; Wed, 23 Oct 2019 13:35:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24BFC800D62;
 Wed, 23 Oct 2019 17:35:15 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC8A3100EA05;
 Wed, 23 Oct 2019 17:35:04 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/33] smbus-eeprom: remove PROP_PTR
Date: Wed, 23 Oct 2019 19:31:49 +0200
Message-Id: <20191023173154.30051-29-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: jJnOoQ9AOZGMIorWMJAh2g-1
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead, set the initial data field directly.

(the initial data is an array of 256 bytes. As I don't know if it may
change over time, I keep the pointer to original buffer as is, but it
might be worth to consider to copy it instead)

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/i2c/smbus_eeprom.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index 54c86a0112..533c728b3b 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -44,7 +44,7 @@
 typedef struct SMBusEEPROMDevice {
     SMBusDevice smbusdev;
     uint8_t data[SMBUS_EEPROM_SIZE];
-    void *init_data;
+    uint8_t *init_data;
     uint8_t offset;
     bool accessed;
 } SMBusEEPROMDevice;
@@ -129,14 +129,14 @@ static void smbus_eeprom_reset(DeviceState *dev)
=20
 static void smbus_eeprom_realize(DeviceState *dev, Error **errp)
 {
+    SMBusEEPROMDevice *eeprom =3D SMBUS_EEPROM(dev);
+
     smbus_eeprom_reset(dev);
+    if (eeprom->init_data =3D=3D NULL) {
+        error_setg(errp, "init_data cannot be NULL");
+    }
 }
=20
-static Property smbus_eeprom_properties[] =3D {
-    DEFINE_PROP_PTR("data", SMBusEEPROMDevice, init_data),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void smbus_eeprom_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -146,9 +146,8 @@ static void smbus_eeprom_class_initfn(ObjectClass *klas=
s, void *data)
     dc->reset =3D smbus_eeprom_reset;
     sc->receive_byte =3D eeprom_receive_byte;
     sc->write_data =3D eeprom_write_data;
-    dc->props =3D smbus_eeprom_properties;
     dc->vmsd =3D &vmstate_smbus_eeprom;
-    /* Reason: pointer property "data" */
+    /* Reason: init_data */
     dc->user_creatable =3D false;
 }
=20
@@ -172,7 +171,7 @@ void smbus_eeprom_init_one(I2CBus *smbus, uint8_t addre=
ss, uint8_t *eeprom_buf)
=20
     dev =3D qdev_create((BusState *) smbus, TYPE_SMBUS_EEPROM);
     qdev_prop_set_uint8(dev, "address", address);
-    qdev_prop_set_ptr(dev, "data", eeprom_buf);
+    SMBUS_EEPROM(dev)->init_data =3D eeprom_buf;
     qdev_init_nofail(dev);
 }
=20
--=20
2.23.0.606.g08da6496b6


