Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925858FCDE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 09:58:45 +0200 (CEST)
Received: from localhost ([::1]:51102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyX8G-0003Yg-18
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 03:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjj-0006dS-38
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjc-0000Ey-CL
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:33:20 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.236]:40679)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWio-0008Is-Ny; Fri, 16 Aug 2019 03:32:27 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A009ED65.bt.com (10.187.98.35) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 16 Aug 2019 08:28:31 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:32:24 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:32:24 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 17/42] hw/char: Declare device little or
 big endian
Thread-Index: AQHVVAS/MEVTyvOxxkaaWGWKyfz7nA==
Date: Fri, 16 Aug 2019 07:32:24 +0000
Message-ID: <1565940743566.34044@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.236
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v7 17/42] hw/char: Declare device little or big
 endian
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, atar4qemu@gmail.com, minyard@acm.org, sw@weilnetz.de,
 yuval.shaia@oracle.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org,
 i.mitsyanko@gmail.com, cohuck@redhat.com, philmd@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/char/cadence_uart.c   | 2 +-
 hw/char/escc.c           | 2 +-
 hw/char/etraxfs_ser.c    | 2 +-
 hw/char/grlib_apbuart.c  | 2 +-
 hw/char/imx_serial.c     | 2 +-
 hw/char/lm32_uart.c      | 2 +-
 hw/char/milkymist-uart.c | 2 +-
 hw/char/pl011.c          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fa25fe2..6c7b904 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -457,7 +457,7 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void cadence_uart_reset(DeviceState *dev)
diff --git a/hw/char/escc.c b/hw/char/escc.c
index 8ddbb4b..36182d9 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -574,7 +574,7 @@ static uint64_t escc_mem_read(void *opaque, hwaddr addr=
,
 static const MemoryRegionOps escc_mem_ops =3D {
     .read =3D escc_mem_read,
     .write =3D escc_mem_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 1,
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 9745bca..cda687b 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -155,7 +155,7 @@ ser_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ser_ops =3D {
     .read =3D ser_read,
     .write =3D ser_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index c2bb3ac..119fc84 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -237,7 +237,7 @@ static void grlib_apbuart_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps grlib_apbuart_ops =3D {
     .write      =3D grlib_apbuart_write,
     .read       =3D grlib_apbuart_read,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 0655a95..7c66551 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -332,7 +332,7 @@ static void imx_event(void *opaque, int event)
 static const struct MemoryRegionOps imx_serial_ops =3D {
     .read =3D imx_serial_read,
     .write =3D imx_serial_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void imx_serial_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index d047a44..2fe5f60 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -205,7 +205,7 @@ static void uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops =3D {
     .read =3D uart_read,
     .write =3D uart_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index 8a78fcc..bdb8282 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -156,7 +156,7 @@ static const MemoryRegionOps uart_mmio_ops =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
     },
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_BIG_ENDIAN,
 };

 static void uart_rx(void *opaque, const uint8_t *buf, int size)
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c1ae2f3..5fb95d2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -287,7 +287,7 @@ static void pl011_event(void *opaque, int event)
 static const MemoryRegionOps pl011_ops =3D {
     .read =3D pl011_read,
     .write =3D pl011_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_pl011 =3D {
--
1.8.3.1

?

