Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D1134635
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 16:29:20 +0100 (CET)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipDGo-0002B2-W8
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 10:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tgolembi@redhat.com>) id 1ipDFw-0001Y9-El
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 10:28:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tgolembi@redhat.com>) id 1ipDFq-0001tT-Gc
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 10:28:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39599
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tgolembi@redhat.com>) id 1ipDFq-0001t9-BA
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 10:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578497297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gCCLBLR18XV2/dkUX91dMp/Y1B8tspTuX29wKdbRq6s=;
 b=dUr7XTndAvHgU6+pSAFUG2GomhFSwteBzss1xa36xR/O0LDDZW3u9aeo3n3Wm0sFAWhrjW
 +Uqcavy6uAsDIH8TYhvnKTwm+2RWf+2jbuphoEeUDDV1F+K5JcdRZ0BqidVS/wDNGOJ01V
 Sbo6/5eQ4iCjFBKlbUY5qMm4WNR/E9g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-c-61lT5KON6HQL3-6-KWMg-1; Wed, 08 Jan 2020 10:28:16 -0500
Received: by mail-wr1-f71.google.com with SMTP id j13so1558337wrr.20
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 07:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rSLwKrBgu/nsBQuSDUOxWH34TY6S4golx50JP8lmfYc=;
 b=T2Fls+OeXNLqnGvXuB5H18SDG6PUCOoiq8gSg8za06pvX6G1NayPOvQF22v0yut6u9
 toJ0wiM1sev1I17LcBnxg2H0k+mkwV/dHnSV+eWLOIELUAjhinlbnffBHRMsviwxdPSm
 SoXW/3dlMv+e8K/IAMEYTc84QPe235qvkGJaYPjsZjjYL6rBuwn6rA+45cDfxEzD/R7B
 v52R9aJEka1SmvQGh1qDTGQ3jdxN5NfXRYZNti3ao9W5MO2lsSraGNzJS86Cohdlkqqb
 lOJ55IanJz3wf9EC8RixDrLQGIjanPKO5kAw+z0mQFHgv1HtaVHmjBkwn619Nj12bMzw
 QAwA==
X-Gm-Message-State: APjAAAWK+/3UdioykVF350O7u4Qj5rBgWWEkZTe3NjacfFfLPXgxhoel
 SxlvXDvxT3ge93VdL3hJofaSo/18cawL9xUQv2YeObnQ29j+rnOnXbSXDgN3W+HgCgc01STeHNr
 bjjPmRPPVYeC/dew=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr5260956wrs.184.1578497294475; 
 Wed, 08 Jan 2020 07:28:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqylwsIOyOwHwiQD59ikHEVdRSQ2hPH0UHw8NhTb6DzO2WbfrCb93ofpCT1BrKm+z7YI7gvB8Q==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr5260920wrs.184.1578497294118; 
 Wed, 08 Jan 2020 07:28:14 -0800 (PST)
Received: from auriga.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z21sm3991650wml.5.2020.01.08.07.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 07:28:13 -0800 (PST)
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8] qga: add command guest-get-devices for reporting VirtIO
 devices
Date: Wed,  8 Jan 2020 16:28:12 +0100
Message-Id: <642f73c78a99258dc134e3879a0287db8ef176c0.1578497245.git.tgolembi@redhat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-MC-Unique: c-61lT5KON6HQL3-6-KWMg-1
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add command for reporting devices on Windows guest. The intent is not so
much to report the devices but more importantly the driver (and its
version) that is assigned to the device. This gives caller the
information whether VirtIO drivers are installed and/or whether
inadequate driver is used on a device (e.g. QXL device with base VGA
driver).

Example:
[
    {
      "driver-date": "2019-08-12",
      "driver-name": "Red Hat VirtIO SCSI controller",
      "driver-version": "100.80.104.17300",
      "address": {
        "type": "pci",
        "data": {
          "device-id": 4162,
          "vendor-id": 6900
        }
      }
    },
    ...
]

Signed-off-by: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
---
changes in v8:
- fixed coding style problem
- Marc's suggestions

 qga/commands-posix.c |   9 ++
 qga/commands-win32.c | 214 ++++++++++++++++++++++++++++++++++++++++++-
 qga/qapi-schema.json |  51 +++++++++++
 3 files changed, 273 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 1c1a165dae..efcd9174a8 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2758,6 +2758,8 @@ GList *ga_command_blacklist_init(GList *blacklist)
     blacklist =3D g_list_append(blacklist, g_strdup("guest-fstrim"));
 #endif
=20
+    blacklist =3D g_list_append(blacklist, g_strdup("guest-get-devices"));
+
     return blacklist;
 }
=20
@@ -2978,3 +2980,10 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
=20
     return info;
 }
+
+GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+
+    return NULL;
+}
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 55ba5b263a..4d37a4a0e1 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -21,10 +21,11 @@
 #ifdef CONFIG_QGA_NTDDSCSI
 #include <winioctl.h>
 #include <ntddscsi.h>
+#endif
 #include <setupapi.h>
 #include <cfgmgr32.h>
 #include <initguid.h>
-#endif
+#include <devpropdef.h>
 #include <lm.h>
 #include <wtsapi32.h>
 #include <wininet.h>
@@ -38,6 +39,36 @@
 #include "qemu/host-utils.h"
 #include "qemu/base64.h"
=20
+/*
+ * The following should be in devpkey.h, but it isn't. The key names were
+ * prefixed to avoid (future) name clashes. Once the definitions get into
+ * mingw the following lines can be removed.
+ */
+DEFINE_DEVPROPKEY(qga_DEVPKEY_NAME, 0xb725f130, 0x47ef, 0x101a, 0xa5,
+    0xf1, 0x02, 0x60, 0x8c, 0x9e, 0xeb, 0xac, 10);
+    /* DEVPROP_TYPE_STRING */
+DEFINE_DEVPROPKEY(qga_DEVPKEY_Device_HardwareIds, 0xa45c254e, 0xdf1c,
+    0x4efd, 0x80, 0x20, 0x67, 0xd1, 0x46, 0xa8, 0x50, 0xe0, 3);
+    /* DEVPROP_TYPE_STRING_LIST */
+DEFINE_DEVPROPKEY(qga_DEVPKEY_Device_DriverDate, 0xa8b865dd, 0x2e3d,
+    0x4094, 0xad, 0x97, 0xe5, 0x93, 0xa7, 0xc, 0x75, 0xd6, 2);
+    /* DEVPROP_TYPE_FILETIME */
+DEFINE_DEVPROPKEY(qga_DEVPKEY_Device_DriverVersion, 0xa8b865dd, 0x2e3d,
+    0x4094, 0xad, 0x97, 0xe5, 0x93, 0xa7, 0xc, 0x75, 0xd6, 3);
+    /* DEVPROP_TYPE_STRING */
+/* The following shoud be in cfgmgr32.h, but it isn't */
+#ifndef CM_Get_DevNode_Property
+CMAPI CONFIGRET WINAPI CM_Get_DevNode_PropertyW(
+    DEVINST          dnDevInst,
+    CONST DEVPROPKEY * PropertyKey,
+    DEVPROPTYPE      * PropertyType,
+    PBYTE            PropertyBuffer,
+    PULONG           PropertyBufferSize,
+    ULONG            ulFlags
+);
+#define CM_Get_DevNode_Property CM_Get_DevNode_PropertyW
+#endif
+
 #ifndef SHTDN_REASON_FLAG_PLANNED
 #define SHTDN_REASON_FLAG_PLANNED 0x80000000
 #endif
@@ -92,6 +123,8 @@ static OpenFlags guest_file_open_modes[] =3D {
     g_free(suffix); \
 } while (0)
=20
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(GuestDeviceInfo, qapi_free_GuestDeviceInfo)
+
 static OpenFlags *find_open_flag(const char *mode_str)
 {
     int mode;
@@ -2234,3 +2267,182 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
=20
     return info;
 }
+
+/*
+ * Safely get device property. Returned strings are using wide characters.
+ * Caller is responsible for freeing the buffer.
+ */
+static LPBYTE cm_get_property(DEVINST devInst, const DEVPROPKEY *propName,
+    PDEVPROPTYPE propType)
+{
+    CONFIGRET cr;
+    g_autofree LPBYTE buffer =3D NULL;
+    ULONG buffer_len =3D 0;
+
+    /* First query for needed space */
+    cr =3D CM_Get_DevNode_PropertyW(devInst, propName, propType,
+        buffer, &buffer_len, 0);
+    if (cr !=3D CR_SUCCESS && cr !=3D CR_BUFFER_SMALL) {
+
+        slog("failed to get property size, error=3D0x%lx", cr);
+        return NULL;
+    }
+    buffer =3D g_new0(BYTE, buffer_len + 1);
+    cr =3D CM_Get_DevNode_PropertyW(devInst, propName, propType,
+        buffer, &buffer_len, 0);
+    if (cr !=3D CR_SUCCESS) {
+        slog("failed to get device property, error=3D0x%lx", cr);
+        return NULL;
+    }
+    return g_steal_pointer(&buffer);
+}
+
+static GStrv ga_get_hardware_ids(DEVINST devInstance)
+{
+    GStrv hw_ids =3D NULL;
+    GArray *values =3D NULL;
+    DEVPROPTYPE cm_type;
+    LPWSTR id;
+    g_autofree LPWSTR property =3D (LPWSTR)cm_get_property(devInstance,
+        &qga_DEVPKEY_Device_HardwareIds, &cm_type);
+    if (property =3D=3D NULL) {
+        slog("failed to get hardware IDs");
+        return NULL;
+    }
+    if (*property =3D=3D '\0') {
+        /* empty list */
+        return NULL;
+    }
+    values =3D g_array_new(TRUE, TRUE, sizeof(gchar *));
+    for (id =3D property; '\0' !=3D *id; id +=3D lstrlenW(id) + 1) {
+        gchar *id8 =3D g_utf16_to_utf8(id, -1, NULL, NULL, NULL);
+        g_array_append_val(values, id8);
+    }
+    return (GStrv)g_array_free(values, FALSE);
+}
+
+/*
+ * https://docs.microsoft.com/en-us/windows-hardware/drivers/install/ident=
ifiers-for-pci-devices
+ */
+#define DEVICE_PCI_RE "PCI\\\\VEN_(1AF4|1B36)&DEV_([0-9A-B]{4})(&|$)"
+
+GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
+{
+    GuestDeviceInfoList *head =3D NULL, *cur_item =3D NULL, *item =3D NULL=
;
+    HDEVINFO dev_info =3D INVALID_HANDLE_VALUE;
+    SP_DEVINFO_DATA dev_info_data;
+    int i, j;
+    GError *gerr =3D NULL;
+    g_autoptr(GRegex) device_pci_re =3D NULL;
+    DEVPROPTYPE cm_type;
+
+    device_pci_re =3D g_regex_new(DEVICE_PCI_RE,
+        G_REGEX_ANCHORED | G_REGEX_OPTIMIZE, 0,
+        &gerr);
+    g_assert(device_pci_re !=3D NULL);
+
+    dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
+    dev_info =3D SetupDiGetClassDevs(0, 0, 0, DIGCF_PRESENT | DIGCF_ALLCLA=
SSES);
+    if (dev_info =3D=3D INVALID_HANDLE_VALUE) {
+        error_setg(errp, "failed to get device tree");
+        return NULL;
+    }
+
+    slog("enumerating devices");
+    for (i =3D 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i++)=
 {
+        bool skip =3D true;
+        SYSTEMTIME utc_date;
+        g_autofree LPWSTR name =3D NULL;
+        g_autofree LPFILETIME date =3D NULL;
+        g_autofree LPWSTR version =3D NULL;
+        g_auto(GStrv) hw_ids =3D NULL;
+        g_autoptr(GuestDeviceInfo) device =3D g_new0(GuestDeviceInfo, 1);
+        g_autofree char *vendor_id =3D NULL;
+        g_autofree char *device_id =3D NULL;
+
+        name =3D (LPWSTR)cm_get_property(dev_info_data.DevInst,
+            &qga_DEVPKEY_NAME, &cm_type);
+        if (name =3D=3D NULL) {
+            slog("failed to get device description");
+            continue;
+        }
+        device->driver_name =3D g_utf16_to_utf8(name, -1, NULL, NULL, NULL=
);
+        if (device->driver_name =3D=3D NULL) {
+            error_setg(errp, "conversion to utf8 failed (driver name)");
+            continue;
+        }
+        slog("querying device: %s", device->driver_name);
+        hw_ids =3D ga_get_hardware_ids(dev_info_data.DevInst);
+        if (hw_ids =3D=3D NULL) {
+            continue;
+        }
+        for (j =3D 0; hw_ids[j] !=3D NULL; j++) {
+            GMatchInfo *match_info;
+            GuestDeviceAddressPCI *address;
+            if (!g_regex_match(device_pci_re, hw_ids[j], 0, &match_info)) =
{
+                continue;
+            }
+            skip =3D false;
+
+            address =3D g_new0(GuestDeviceAddressPCI, 1);
+            vendor_id =3D g_match_info_fetch(match_info, 1);
+            device_id =3D g_match_info_fetch(match_info, 2);
+            address->vendor_id =3D g_ascii_strtoull(vendor_id, NULL, 16);
+            address->device_id =3D g_ascii_strtoull(device_id, NULL, 16);
+
+            device->address =3D g_new0(GuestDeviceAddress, 1);
+            device->has_address =3D true;
+            device->address->type =3D GUEST_DEVICE_ADDRESS_KIND_PCI;
+            device->address->u.pci.data =3D address;
+
+            g_match_info_free(match_info);
+            break;
+        }
+        if (skip) {
+            continue;
+        }
+
+        version =3D (LPWSTR)cm_get_property(dev_info_data.DevInst,
+            &qga_DEVPKEY_Device_DriverVersion, &cm_type);
+        if (version =3D=3D NULL) {
+            slog("failed to get driver version");
+            continue;
+        }
+        device->driver_version =3D g_utf16_to_utf8(version, -1, NULL,
+            NULL, NULL);
+        if (device->driver_version =3D=3D NULL) {
+            error_setg(errp, "conversion to utf8 failed (driver version)")=
;
+            continue;
+        }
+        device->has_driver_version =3D true;
+
+        date =3D (LPFILETIME)cm_get_property(dev_info_data.DevInst,
+            &qga_DEVPKEY_Device_DriverDate, &cm_type);
+        if (date =3D=3D NULL) {
+            slog("failed to get driver date");
+            continue;
+        }
+        FileTimeToSystemTime(date, &utc_date);
+        device->driver_date =3D g_strdup_printf("%04d-%02d-%02d",
+            utc_date.wYear, utc_date.wMonth, utc_date.wDay);
+        device->has_driver_date =3D true;
+
+        slog("driver: %s\ndriver version: %s,%s\n", device->driver_name,
+            device->driver_date, device->driver_version);
+        item =3D g_new0(GuestDeviceInfoList, 1);
+        item->value =3D g_steal_pointer(&device);
+        if (!cur_item) {
+            head =3D cur_item =3D item;
+        } else {
+            cur_item->next =3D item;
+            cur_item =3D item;
+        }
+        continue;
+    }
+
+out:
+    if (dev_info !=3D INVALID_HANDLE_VALUE) {
+        SetupDiDestroyDeviceInfoList(dev_info);
+    }
+    return head;
+}
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index fb4605cc19..92ed76c419 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1242,3 +1242,54 @@
 ##
 { 'command': 'guest-get-osinfo',
   'returns': 'GuestOSInfo' }
+
+##
+# @GuestDeviceAddressPCI:
+#
+# @vendor-id: vendor ID
+# @device-id: device ID
+#
+# Since: 5.0
+##
+{ 'struct': 'GuestDeviceAddressPCI',
+  'data': { 'vendor-id': 'uint16', 'device-id': 'uint16' } }
+
+##
+# @GuestDeviceAddress:
+#
+# Address of the device
+# - @pci: address of PCI device, since: 5.0
+#
+# Since: 5.0
+##
+{ 'union': 'GuestDeviceAddress',
+  'data': { 'pci': 'GuestDeviceAddressPCI' } }
+
+##
+# @GuestDeviceInfo:
+#
+# @driver-name: name of the associated driver
+# @driver-date: driver release date in format YYYY-MM-DD
+# @driver-version: driver version
+#
+# Since: 5.0
+##
+{ 'struct': 'GuestDeviceInfo',
+  'data': {
+      'driver-name': 'str',
+      '*driver-date': 'str',
+      '*driver-version': 'str',
+      '*address': 'GuestDeviceAddress'
+  } }
+
+##
+# @guest-get-devices:
+#
+# Retrieve information about device drivers in Windows guest
+#
+# Returns: @GuestDeviceInfo
+#
+# Since: 5.0
+##
+{ 'command': 'guest-get-devices',
+  'returns': ['GuestDeviceInfo'] }
--=20
2.24.1


