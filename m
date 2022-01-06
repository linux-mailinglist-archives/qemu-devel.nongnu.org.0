Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBB486DA1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 00:18:54 +0100 (CET)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5c21-0004SU-6c
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 18:18:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wHbXYQYKCiEQFQRPODLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--titusr.bounces.google.com>)
 id 1n5bz6-0001ee-An
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:15:52 -0500
Received: from [2607:f8b0:4864:20::44a] (port=56010
 helo=mail-pf1-x44a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wHbXYQYKCiEQFQRPODLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--titusr.bounces.google.com>)
 id 1n5bz3-00063e-J0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 18:15:52 -0500
Received: by mail-pf1-x44a.google.com with SMTP id
 n4-20020aa79044000000b004bcd447b6easo2570372pfo.22
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 15:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=vW4Xo7g4Y3w1c48JyjTkubYnaRSDR0XM7VsJM/RJjGE=;
 b=pKKXdDQJb544tOHDI8mINAGzVuxbozTjstb7q2gUfk8Ul9HUP98vBG8yz6xTeldAs+
 l7IhnNTeNZRqV9XGczB+Kcsa9qIGmQ13c4S49Kq6qFia5V9xywTsiTr5Dklx/eO5amXQ
 xGsq1ZHMOzQCH6cieqmzrMaEOcqLXd3O/NT1q1kyhYoA45jlUaivUC5TqgrvHd/UVDzV
 344XjjIxtzgydNx30n18lfREOIfXK24p98hzALkN32msPpttehVdyYyy3DuVzogTG8Xu
 xtwzvuSvVI8ul+ZILWqxutg7qNKV0t3WsiLna7EtRma7RbPbt0Rt4f7FJ5C+kZOA3QsV
 UhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=vW4Xo7g4Y3w1c48JyjTkubYnaRSDR0XM7VsJM/RJjGE=;
 b=3vJcF8XVFZLjdX3a3h1k1GcKqVzEFUYaQeCn/KvlJgi9SjXcF5IuVcui/oP5Lk4/xX
 a1vGXGXAkkVGQnfkgWobNWgPukXqkys1XXxVG0uRWdPCenXdLnu5kEXWVegJuziei9+W
 2zjp2JnywbrHQRFqfyoatgRZInD8ExgXxHwr676Kedr/gea+vf1dyonw3E61C2A42puX
 1TH6j561PDyEhg9hXtdZaNAMhthDaQ3eMelrYUO7dJHRCFCHGU29LlRMAh8Qgycc1Xxc
 eQZX8Cr1BoijQmeIpC1QzRxb7Qqig1eude7o5ZCZuPTmoQCwtX3aumu4zhXMoBAk3opL
 V//Q==
X-Gm-Message-State: AOAM532VXnJZO2tGpy2Q7TN0Q1Lh0BkJkES7gvuLzIePLEsDXcpNKaa6
 LW0I8r2y8uQM+ilOSL6XfE5u+y1+zis=
X-Google-Smtp-Source: ABdhPJynMwybMm1qzQoRKlu1bQVKZAMoDQWg5pTDezH2/XcPDMXVl49vO51lhrRjGbtHKT2k0+FpunYYISc=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6102:3f55:: with SMTP id
 l21mr4209104vsv.67.1641510592976; Thu, 06 Jan 2022 15:09:52 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:32 +0000
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
Message-Id: <20220106230936.417020-2-titusr@google.com>
Mime-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 1/5] hw/i2c: pmbus updates
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::44a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3wHbXYQYKCiEQFQRPODLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--titusr.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  - add vout min register
  - add PEC unsupported warning to pmbus_device class
  - guard against out of range pmbus page accesses

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 MAINTAINERS                   | 12 ++++-
 hw/i2c/pmbus_device.c         | 88 +++++++++++++++++++++++++++++++----
 include/hw/i2c/pmbus_device.h |  3 ++
 3 files changed, 92 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..6349e3da1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2790,7 +2790,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
-R: Darren Kenny <darren.kenny@oracle.com>=20
+R: Darren Kenny <darren.kenny@oracle.com>
 R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
@@ -3029,6 +3029,16 @@ F: include/hw/i2c/smbus_master.h
 F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
=20
+PMBus
+M: Titus Rwantare <titusr@google.com>
+S: Maintained
+F: hw/i2c/pmbus_device.c
+F: hw/sensor/adm1272.c
+F: hw/sensor/max34451.c
+F: include/hw/i2c/pmbus_device.h
+F: tests/qtest/adm1272-test.c
+F: tests/qtest/max34451-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 24f8f522d9..3beb02afad 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -89,16 +89,16 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *=
data)
 }
=20
=20
-static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
+static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
     uint64_t ret =3D 0;
=20
     /* Exclude command code from return value */
-    buf++;
-    len--;
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
=20
-    for (int i =3D len - 1; i >=3D 0; i--) {
-        ret =3D ret << 8 | buf[i];
+    for (int i =3D pmdev->in_buf_len - 1; i >=3D 0; i--) {
+        ret =3D ret << 8 | pmdev->in_buf[i];
     }
     return ret;
 }
@@ -110,7 +110,7 @@ uint8_t pmbus_receive8(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 1 byte, got %d bytes\=
n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint16_t pmbus_receive16(PMBusDevice *pmdev)
@@ -120,7 +120,7 @@ uint16_t pmbus_receive16(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 2 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint32_t pmbus_receive32(PMBusDevice *pmdev)
@@ -130,7 +130,7 @@ uint32_t pmbus_receive32(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 4 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint64_t pmbus_receive64(PMBusDevice *pmdev)
@@ -140,7 +140,7 @@ uint64_t pmbus_receive64(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 8 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
@@ -243,18 +243,47 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
=20
+/* assert the status_cml error upon receipt of malformed command */
+static void pmbus_cml_error(PMBusDevice *pmdev)
+{
+    for (int i =3D 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].status_word |=3D PMBUS_STATUS_CML;
+        pmdev->pages[i].status_cml |=3D PB_CML_FAULT_INVALID_CMD;
+    }
+}
+
 static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 {
     PMBusDevice *pmdev =3D PMBUS_DEVICE(smd);
     PMBusDeviceClass *pmdc =3D PMBUS_DEVICE_GET_CLASS(pmdev);
     uint8_t ret =3D 0xFF;
-    uint8_t index =3D pmdev->page;
+    uint8_t index;
=20
     if (pmdev->out_buf_len !=3D 0) {
         ret =3D pmbus_out_buf_pop(pmdev);
         return ret;
     }
=20
+    /*
+     * Reading from all pages will return the value from page 0,
+     * this is unspecified behaviour in general.
+     */
+    if (pmdev->page =3D=3D PB_ALL_PAGES) {
+        index =3D 0;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: tried to read from all pages\n",
+                      __func__);
+        pmbus_cml_error(pmdev);
+    } else if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: page %d is out of range\n",
+                      __func__, pmdev->page);
+        pmbus_cml_error(pmdev);
+        return -1;
+    } else {
+        index =3D pmdev->page;
+    }
+
     switch (pmdev->code) {
     case PMBUS_PAGE:
         pmbus_send8(pmdev, pmdev->page);
@@ -278,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
=20
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
=20
     case PMBUS_VOUT_MODE:                 /* R/W byte */
@@ -368,6 +402,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
=20
+    case PMBUS_VOUT_MIN:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_min);
+        } else {
+            goto passthough;
+        }
+        break;
+
     /* TODO: implement coefficients support */
=20
     case PMBUS_POUT_MAX:                  /* R/W word */
@@ -708,6 +750,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         pmbus_send8(pmdev, pmdev->pages[index].status_other);
         break;
=20
+    case PMBUS_STATUS_MFR_SPECIFIC:       /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].status_mfr_specific);
+        break;
+
     case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
         if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
             pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
@@ -1026,6 +1072,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t=
 *buf, uint8_t len)
         pmdev->page =3D pmbus_receive8(pmdev);
         return 0;
     }
+
     /* loop through all the pages when 0xFF is received */
     if (pmdev->page =3D=3D PB_ALL_PAGES) {
         for (int i =3D 0; i < pmdev->num_pages; i++) {
@@ -1036,6 +1083,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_=
t *buf, uint8_t len)
         return 0;
     }
=20
+    if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: page %u is out of range\n",
+                        __func__, pmdev->page);
+        pmdev->page =3D 0; /* undefined behaviour - reset to page 0 */
+        pmbus_cml_error(pmdev);
+        return -1;
+    }
+
     index =3D pmdev->page;
=20
     switch (pmdev->code) {
@@ -1149,6 +1205,14 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_=
t *buf, uint8_t len)
         }
         break;
=20
+    case PMBUS_VOUT_MIN:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmdev->pages[index].vout_min =3D pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
     case PMBUS_POUT_MAX:                  /* R/W word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmdev->pages[index].pout_max =3D pmbus_receive16(pmdev);
@@ -1482,6 +1546,10 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_=
t *buf, uint8_t len)
         pmdev->pages[index].status_other =3D pmbus_receive8(pmdev);
         break;
=20
+    case PMBUS_STATUS_MFR_SPECIFIC:        /* R/W byte */
+        pmdev->pages[index].status_mfr_specific =3D pmbus_receive8(pmdev);
+        break;
+
     case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
     case PMBUS_CAPABILITY:                /* Read-Only byte */
     case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 62bd38c83f..72c0483149 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -43,6 +43,7 @@ enum pmbus_registers {
     PMBUS_VOUT_DROOP                =3D 0x28, /* R/W word */
     PMBUS_VOUT_SCALE_LOOP           =3D 0x29, /* R/W word */
     PMBUS_VOUT_SCALE_MONITOR        =3D 0x2A, /* R/W word */
+    PMBUS_VOUT_MIN                  =3D 0x2B, /* R/W word */
     PMBUS_COEFFICIENTS              =3D 0x30, /* Read-only block 5 bytes *=
/
     PMBUS_POUT_MAX                  =3D 0x31, /* R/W word */
     PMBUS_MAX_DUTY                  =3D 0x32, /* R/W word */
@@ -255,6 +256,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_TEMP3               BIT_ULL(42)
 #define PB_HAS_TEMP_RATING         BIT_ULL(43)
 #define PB_HAS_MFR_INFO            BIT_ULL(50)
+#define PB_HAS_STATUS_MFR_SPECIFIC BIT_ULL(51)
=20
 struct PMBusDeviceClass {
     SMBusDeviceClass parent_class;
@@ -295,6 +297,7 @@ typedef struct PMBusPage {
     uint16_t vout_droop;               /* R/W word */
     uint16_t vout_scale_loop;          /* R/W word */
     uint16_t vout_scale_monitor;       /* R/W word */
+    uint16_t vout_min;                 /* R/W word */
     uint8_t coefficients[5];           /* Read-only block 5 bytes */
     uint16_t pout_max;                 /* R/W word */
     uint16_t max_duty;                 /* R/W word */
--=20
2.34.1.448.ga2b2bfdf31-goog


