Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DD100ECA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 23:30:35 +0100 (CET)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWpXW-0003A6-80
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 17:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iWpVE-0001nS-Al
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 17:28:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iWpVA-0006vu-3E
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 17:28:10 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49313
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iWpV9-0006vd-Ti
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 17:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574116087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4itkHR8Go/BDN6vF/27uI1YXhWrNkloPForQl9ZQ3s4=;
 b=OfIlGPTetdRhCYPYzN3U49WhLJSlBwnhEx17O/CDFpF2Rkbc8A/cwg8Yup0fhtX3mbNhHn
 HoDXb4/MenGwpW/Ikg+0liHD/QZvOMLjeQQJU5L0Z7LlLCwYj+06W5/56c6kT22+eWPVmf
 EVocyKxYtoHYMi46GAUJPvk2rRB2hWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-1jTba2gPOlu2KfInRZzodQ-1; Mon, 18 Nov 2019 17:28:06 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09377100550E;
 Mon, 18 Nov 2019 22:28:05 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB3BF6E1;
 Mon, 18 Nov 2019 22:28:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] hw/block/pflash: Remove dynamic field width from trace
 events
Date: Mon, 18 Nov 2019 23:27:45 +0100
Message-Id: <20191118222746.31467-2-philmd@redhat.com>
In-Reply-To: <20191118222746.31467-1-philmd@redhat.com>
References: <20191118222746.31467-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 1jTba2gPOlu2KfInRZzodQ-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since not all trace backends support dynamic field width in
format (dtrace via stap does not), replace by a static field
width instead.

We previously passed to the trace API 'width << 1' as the number
of hex characters to display (the dynamic field width). We don't
need this anymore. Instead, display the size of bytes accessed.

Fixes: e8aa2d95ea (pflash: Simplify trace_pflash_io_read/write)
Fixes: c1474acd5d (pflash: Simplify trace_pflash_data_read/write)
Reported-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3: display size (in byte)
v4: added Fixes/Reviewed-by
---
 hw/block/pflash_cfi01.c | 8 ++++----
 hw/block/pflash_cfi02.c | 8 ++++----
 hw/block/trace-events   | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 566c0acb77..54e6ebd385 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -276,7 +276,7 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwad=
dr offset,
         DPRINTF("BUG in %s\n", __func__);
         abort();
     }
-    trace_pflash_data_read(offset, width << 1, ret);
+    trace_pflash_data_read(offset, width, ret);
     return ret;
 }
=20
@@ -389,7 +389,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr of=
fset,
=20
         break;
     }
-    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->wc=
ycle);
+    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
=20
     return ret;
 }
@@ -414,7 +414,7 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, =
hwaddr offset,
 {
     uint8_t *p =3D pfl->storage;
=20
-    trace_pflash_data_write(offset, width << 1, value, pfl->counter);
+    trace_pflash_data_write(offset, width, value, pfl->counter);
     switch (width) {
     case 1:
         p[offset] =3D value;
@@ -453,7 +453,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offse=
t,
=20
     cmd =3D value;
=20
-    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle);
+    trace_pflash_io_write(offset, width, value, pfl->wcycle);
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
         memory_region_rom_device_set_romd(&pfl->mem, false);
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 4baca701b7..c7d92c3e79 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -260,7 +260,7 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwad=
dr offset,
 {
     uint8_t *p =3D (uint8_t *)pfl->storage + offset;
     uint64_t ret =3D pfl->be ? ldn_be_p(p, width) : ldn_le_p(p, width);
-    trace_pflash_data_read(offset, width << 1, ret);
+    trace_pflash_data_read(offset, width, ret);
     return ret;
 }
=20
@@ -385,7 +385,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset=
, unsigned int width)
         }
         break;
     }
-    trace_pflash_io_read(offset, width, width << 1, ret, pfl->cmd, pfl->wc=
ycle);
+    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
=20
     return ret;
 }
@@ -432,7 +432,7 @@ static void pflash_write(void *opaque, hwaddr offset, u=
int64_t value,
     uint8_t *p;
     uint8_t cmd;
=20
-    trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle);
+    trace_pflash_io_write(offset, width, value, pfl->wcycle);
     cmd =3D value;
     if (pfl->cmd !=3D 0xA0) {
         /* Reset does nothing during chip erase and sector erase. */
@@ -542,7 +542,7 @@ static void pflash_write(void *opaque, hwaddr offset, u=
int64_t value,
                 }
                 goto reset_flash;
             }
-            trace_pflash_data_write(offset, width << 1, value, 0);
+            trace_pflash_data_write(offset, width, value, 0);
             if (!pfl->ro) {
                 p =3D (uint8_t *)pfl->storage + offset;
                 if (pfl->be) {
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 13d1b21dd4..c03e80c2c9 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -8,10 +8,10 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0=
x%02x val 0x%02x"
 # pflash_cfi01.c
 pflash_reset(void) "reset"
 pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
-pflash_io_read(uint64_t offset, int width, int fmt_width, uint32_t value, =
uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x cm=
d:0x%02x wcycle:%u"
-pflash_io_write(uint64_t offset, int width, int fmt_width, uint32_t value,=
 uint8_t wcycle) "offset:0x%04"PRIx64" width:%d value:0x%0*x wcycle:%u"
-pflash_data_read(uint64_t offset, int width, uint32_t value) "data offset:=
0x%04"PRIx64" value:0x%0*x"
-pflash_data_write(uint64_t offset, int width, uint32_t value, uint64_t cou=
nter) "data offset:0x%04"PRIx64" value:0x%0*x counter:0x%016"PRIx64
+pflash_io_read(uint64_t offset, unsigned size, uint32_t value, uint8_t cmd=
, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x cmd:0x%02x wcy=
cle:%u"
+pflash_io_write(uint64_t offset, unsigned size, uint32_t value, uint8_t wc=
ycle) "offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
+pflash_data_read(uint64_t offset, unsigned size, uint32_t value) "data off=
set:0x%04"PRIx64" size:%u value:0x%04x"
+pflash_data_write(uint64_t offset, unsigned size, uint32_t value, uint64_t=
 counter) "data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PR=
Ix64
 pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
 pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
 pflash_device_info(uint64_t offset) "Read Device Information offset:0x%04"=
PRIx64
--=20
2.21.0


