Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6F13422F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 13:50:48 +0100 (CET)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipAnP-00027m-9q
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 07:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ipAl4-0000HM-6O
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ipAl2-0006DI-3q
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:48:22 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46080)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ipAl1-0006CC-Rz
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:48:20 -0500
Received: by mail-wr1-x443.google.com with SMTP id z7so3172860wrl.13
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 04:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7W9jnaICn9jcn78Ds5jl+Th7mUM4BHMLfBXhL3z8GUU=;
 b=dCKBZwG8lkW+J3fLZcQgbZcWcg70JELnB0ov9Wo4lXmSjoehj7cpW1zQtt6oZk/hEY
 ADa/Imo+kcjrKVw0Y+gvQDZgM36Ss7hxhEYuhaRlyRMUYsoa/QQKOI80jCS9yVzXXICQ
 RJT0Pwp4KdU3X0Mqz2BJcOfAyWrIncP/2tHy+CGvvlxt2Q/TtPR2XskkR431krjVk3D1
 R7m9CKsvrqBxVPLKyJbJRMVs1BoKRIcvRGR70xTtpgq4WqZE3bHxiHnLbMkppfrQqQlx
 MErMPjqrVojinDkTS3tEVL/QcoRcaWWYVduj7EWFj6UCcLLxcc9SRtweJ9F6TojwIy9j
 lT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7W9jnaICn9jcn78Ds5jl+Th7mUM4BHMLfBXhL3z8GUU=;
 b=gQsPYvXme94Mbh5+5WaKZyFcWUqwn3y+4t5oOhSawbHgk1tFrH1aVWXXzBj6d+BE3a
 wvdiNPvaqyJDZtRvdjsDfVl6CcEcChQCGRJ872AsiFHYU+AGMQdmD1+oA9wk7Ls6dw7q
 GSbQN2tFcncjceykT/b4ApodNsP4ahThfjfbGvh/lJCyGqsIprIOqdBkrrJHbFwwz8tC
 mj9J29oBLLZrST848WElSTlxjF10TUyFqC4/Fh1aBTUY8vEqj/h3pSHu4wOcHTZvZSL0
 9GhD6Fui5vck8TqVNcahcaUC9NtryN7jfQE1buxWw8aD9obxSRquqfVZRpsDrnkHPHx6
 i0RA==
X-Gm-Message-State: APjAAAUJEg8Nd8BYJZ/N/MzQIBdJO5OiF0/fzKkPoRcJfsxD2OHURkRy
 lKGUpLTz9R0jxSlBWdTllGbOtE+ekgHFv1PrOIo=
X-Google-Smtp-Source: APXvYqwpPtUWGQuLLZ1Pus7lQEhOex1+RW4EeFklrWAtTzTO6oRaVFu+CLDhF5YQbn8TwrbS3/uxF9LCiHFiixY9bTU=
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr4338301wrq.396.1578487698059; 
 Wed, 08 Jan 2020 04:48:18 -0800 (PST)
MIME-Version: 1.0
References: <5245e15fbb05c85112b6c818b0de8c66c8f8b6b3.1578482882.git.tgolembi@redhat.com>
In-Reply-To: <5245e15fbb05c85112b6c818b0de8c66c8f8b6b3.1578482882.git.tgolembi@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Jan 2020 16:48:05 +0400
Message-ID: <CAJ+F1C+gNqyUAA84yS4g0y_4H2Y43iOpCCNXV2a4svuA7QKFUg@mail.gmail.com>
Subject: Re: [PATCH v7] qga: add command guest-get-devices for reporting
 VirtIO devices
To: =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Jan 8, 2020 at 3:30 PM Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@=
redhat.com> wrote:
>
> Add command for reporting devices on Windows guest. The intent is not so
> much to report the devices but more importantly the driver (and its
> version) that is assigned to the device. This gives caller the
> information whether VirtIO drivers are installed and/or whether
> inadequate driver is used on a device (e.g. QXL device with base VGA
> driver).
>
> Example:
> [
>     {
>       "driver-date": "2019-08-12",
>       "driver-name": "Red Hat VirtIO SCSI controller",
>       "driver-version": "100.80.104.17300",
>       "address": {
>         "type": "pci",
>         "data": {
>           "device-id": 4162,
>           "vendor-id": 6900
>         }
>       }
>     },
>     ...
> ]
>
> Signed-off-by: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
> ---
> I forgot to ammend the patch before publishing the last version.
>
> Changes in v7:
> - fix compilation errors
> - fix incorrect use of optional fields
>
>  qga/commands-posix.c |   9 ++
>  qga/commands-win32.c | 216 ++++++++++++++++++++++++++++++++++++++++++-
>  qga/qapi-schema.json |  51 ++++++++++
>  3 files changed, 275 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 1c1a165dae..efcd9174a8 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2758,6 +2758,8 @@ GList *ga_command_blacklist_init(GList *blacklist)
>      blacklist =3D g_list_append(blacklist, g_strdup("guest-fstrim"));
>  #endif
>
> +    blacklist =3D g_list_append(blacklist, g_strdup("guest-get-devices")=
);
> +
>      return blacklist;
>  }
>
> @@ -2978,3 +2980,10 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
>
>      return info;
>  }
> +
> +GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +
> +    return NULL;
> +}
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 55ba5b263a..b473675553 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -21,10 +21,11 @@
>  #ifdef CONFIG_QGA_NTDDSCSI
>  #include <winioctl.h>
>  #include <ntddscsi.h>
> +#endif
>  #include <setupapi.h>
>  #include <cfgmgr32.h>
>  #include <initguid.h>
> -#endif
> +#include <devpropdef.h>
>  #include <lm.h>
>  #include <wtsapi32.h>
>  #include <wininet.h>
> @@ -38,6 +39,36 @@
>  #include "qemu/host-utils.h"
>  #include "qemu/base64.h"
>
> +/*
> + * The following should be in devpkey.h, but it isn't. The key names wer=
e
> + * prefixed to avoid (future) name clashes. Once the definitions get int=
o
> + * mingw the following lines can be removed.
> + */
> +DEFINE_DEVPROPKEY(qga_DEVPKEY_NAME, 0xb725f130, 0x47ef, 0x101a, 0xa5,
> +    0xf1, 0x02, 0x60, 0x8c, 0x9e, 0xeb, 0xac, 10);
> +    /* DEVPROP_TYPE_STRING */
> +DEFINE_DEVPROPKEY(qga_DEVPKEY_Device_HardwareIds, 0xa45c254e, 0xdf1c,
> +    0x4efd, 0x80, 0x20, 0x67, 0xd1, 0x46, 0xa8, 0x50, 0xe0, 3);
> +    /* DEVPROP_TYPE_STRING_LIST */
> +DEFINE_DEVPROPKEY(qga_DEVPKEY_Device_DriverDate, 0xa8b865dd, 0x2e3d,
> +    0x4094, 0xad, 0x97, 0xe5, 0x93, 0xa7, 0xc, 0x75, 0xd6, 2);
> +    /* DEVPROP_TYPE_FILETIME */
> +DEFINE_DEVPROPKEY(qga_DEVPKEY_Device_DriverVersion, 0xa8b865dd, 0x2e3d,
> +    0x4094, 0xad, 0x97, 0xe5, 0x93, 0xa7, 0xc, 0x75, 0xd6, 3);
> +    /* DEVPROP_TYPE_STRING */
> +/* The following shoud be in cfgmgr32.h, but it isn't */
> +#ifndef CM_Get_DevNode_Property
> +CMAPI CONFIGRET WINAPI CM_Get_DevNode_PropertyW(
> +    DEVINST          dnDevInst,
> +    CONST DEVPROPKEY * PropertyKey,
> +    DEVPROPTYPE      * PropertyType,
> +    PBYTE            PropertyBuffer,
> +    PULONG           PropertyBufferSize,
> +    ULONG            ulFlags
> +);
> +#define CM_Get_DevNode_Property CM_Get_DevNode_PropertyW
> +#endif
> +
>  #ifndef SHTDN_REASON_FLAG_PLANNED
>  #define SHTDN_REASON_FLAG_PLANNED 0x80000000
>  #endif
> @@ -92,6 +123,8 @@ static OpenFlags guest_file_open_modes[] =3D {
>      g_free(suffix); \
>  } while (0)
>
> +G_DEFINE_AUTOPTR_CLEANUP_FUNC(GuestDeviceInfo, qapi_free_GuestDeviceInfo=
)
> +
>  static OpenFlags *find_open_flag(const char *mode_str)
>  {
>      int mode;
> @@ -2234,3 +2267,184 @@ GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
>
>      return info;
>  }
> +
> +/*
> + * Safely get device property. Returned strings are using wide character=
s.
> + * Caller is responsible for freeing the buffer.
> + */
> +static LPBYTE cm_get_property(DEVINST devInst, const DEVPROPKEY *propNam=
e,
> +    PDEVPROPTYPE propType)
> +{
> +    CONFIGRET cr;
> +    g_autofree LPBYTE buffer =3D NULL;
> +    ULONG buffer_len =3D 0;
> +
> +    /* First query for needed space */
> +    cr =3D CM_Get_DevNode_PropertyW(devInst, propName, propType,
> +        buffer, &buffer_len, 0);
> +    if (cr !=3D CR_SUCCESS && cr !=3D CR_BUFFER_SMALL) {
> +
> +        slog("failed to get property size, error=3D0x%lx", cr);
> +        return NULL;
> +    }
> +    buffer =3D g_new0(BYTE, buffer_len + 1);
> +    cr =3D CM_Get_DevNode_PropertyW(devInst, propName, propType,
> +        buffer, &buffer_len, 0);
> +    if (cr !=3D CR_SUCCESS) {
> +        slog("failed to get device property, error=3D0x%lx", cr);
> +        return NULL;
> +    }
> +    return g_steal_pointer(&buffer);
> +}
> +
> +static GStrv ga_get_hardware_ids(DEVINST devInstance)
> +{
> +    GStrv hw_ids =3D NULL;
> +    GArray *values =3D NULL;
> +    DEVPROPTYPE cm_type;
> +    LPWSTR id;
> +    g_autofree LPWSTR property =3D (LPWSTR)cm_get_property(devInstance,
> +        &qga_DEVPKEY_Device_HardwareIds, &cm_type);
> +    if (property =3D=3D NULL) {
> +        slog("failed to get hardware IDs");
> +        return NULL;
> +    }
> +    if (*property =3D=3D '\0') {
> +        /* empty list */
> +        return NULL;
> +    }
> +    values =3D g_array_new(TRUE, TRUE, sizeof(gchar *));
> +    for (id =3D property; '\0' !=3D *id; id +=3D lstrlenW(id) + 1) {
> +        gchar *id8 =3D g_utf16_to_utf8(id, -1, NULL, NULL, NULL);
> +        g_array_append_val(values, id8);
> +    }
> +    hw_ids =3D (GStrv)g_array_free(values, FALSE);
> +    values =3D NULL;

not required
you could directly return (GStrv)g_array_free(values, FALSE);

> +    return hw_ids;
> +}
> +
> +/*
> + * https://docs.microsoft.com/en-us/windows-hardware/drivers/install/ide=
ntifiers-for-pci-devices
> + */
> +#define DEVICE_PCI_RE "PCI\\\\VEN_(1AF4|1B36)&DEV_([0-9A-B]{4})(&|$)"
> +
> +GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
> +{
> +    GuestDeviceInfoList *head =3D NULL, *cur_item =3D NULL, *item =3D NU=
LL;
> +    HDEVINFO dev_info =3D INVALID_HANDLE_VALUE;
> +    SP_DEVINFO_DATA dev_info_data;
> +    int i, j;
> +    GError *gerr =3D NULL;
> +    g_autoptr(GRegex) device_pci_re =3D NULL;
> +    DEVPROPTYPE cm_type;
> +
> +    device_pci_re =3D g_regex_new(DEVICE_PCI_RE,
> +        G_REGEX_ANCHORED | G_REGEX_OPTIMIZE, 0,
> +        &gerr);
> +    g_assert(device_pci_re !=3D NULL);
> +
> +    dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
> +    dev_info =3D SetupDiGetClassDevs(0, 0, 0, DIGCF_PRESENT | DIGCF_ALLC=
LASSES);
> +    if (dev_info =3D=3D INVALID_HANDLE_VALUE) {
> +        error_setg(errp, "failed to get device tree");
> +        return NULL;
> +    }
> +
> +    slog("enumerating devices");
> +    for (i =3D 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i+=
+) {
> +        bool skip =3D true;
> +        SYSTEMTIME utc_date;
> +        g_autofree LPWSTR name =3D NULL;
> +        g_autofree LPFILETIME date =3D NULL;
> +        g_autofree LPWSTR version =3D NULL;
> +        g_auto(GStrv) hw_ids =3D NULL;
> +        g_autoptr(GuestDeviceInfo) device =3D g_new0(GuestDeviceInfo, 1)=
;
> +        g_autofree char *vendor_id =3D NULL;
> +        g_autofree char *device_id =3D NULL;
> +
> +        name =3D (LPWSTR)cm_get_property(dev_info_data.DevInst,
> +            &qga_DEVPKEY_NAME, &cm_type);
> +        if (name =3D=3D NULL) {
> +            slog("failed to get device description");
> +            continue;
> +        }
> +        device->driver_name =3D g_utf16_to_utf8(name, -1, NULL, NULL, NU=
LL);
> +        if (device->driver_name =3D=3D NULL) {
> +            error_setg(errp, "conversion to utf8 failed (driver name)");
> +            goto out;
> +        }
> +        slog("querying device: %s", device->driver_name);
> +        hw_ids =3D ga_get_hardware_ids(dev_info_data.DevInst);
> +        if (hw_ids =3D=3D NULL) {
> +            continue;
> +        }
> +        for (j =3D 0; hw_ids[j] !=3D NULL; j++) {
> +            GMatchInfo *match_info;
> +            GuestDeviceAddressPCI *address;
> +            if (!g_regex_match(device_pci_re, hw_ids[j], 0, &match_info)=
) {
> +                continue;
> +            }
> +            skip =3D false;
> +
> +            address =3D g_new0(GuestDeviceAddressPCI, 1);
> +            vendor_id =3D g_match_info_fetch(match_info, 1);
> +            device_id =3D g_match_info_fetch(match_info, 2);
> +            address->vendor_id =3D g_ascii_strtoull(vendor_id, NULL, 16)=
;
> +            address->device_id =3D g_ascii_strtoull(device_id, NULL, 16)=
;
> +
> +            device->address =3D g_new0(GuestDeviceAddress,1);
> +            device->has_address =3D true;
> +            device->address->type =3D GUEST_DEVICE_ADDRESS_KIND_PCI;
> +            device->address->u.pci.data =3D address;
> +
> +            g_match_info_free(match_info);
> +            break;
> +        }
> +        if (skip) {
> +            continue;
> +        }
> +
> +        version =3D (LPWSTR)cm_get_property(dev_info_data.DevInst,
> +            &qga_DEVPKEY_Device_DriverVersion, &cm_type);
> +        if (version =3D=3D NULL) {
> +            slog("failed to get driver version");
> +            continue;
> +        }
> +        device->driver_version =3D g_utf16_to_utf8(version, -1, NULL,
> +            NULL, NULL);
> +        if (device->driver_version =3D=3D NULL) {
> +            error_setg(errp, "conversion to utf8 failed (driver version)=
");

shouldn't it continue?

> +            goto out;
> +        }
> +        device->has_driver_version =3D true;
> +
> +        date =3D (LPFILETIME)cm_get_property(dev_info_data.DevInst,
> +            &qga_DEVPKEY_Device_DriverDate, &cm_type);
> +        if (date =3D=3D NULL) {
> +            slog("failed to get driver date");
> +            continue;
> +        }
> +        FileTimeToSystemTime(date, &utc_date);
> +        device->driver_date =3D g_strdup_printf("%04d-%02d-%02d",
> +            utc_date.wYear, utc_date.wMonth, utc_date.wDay);
> +        device->has_driver_date =3D true;
> +
> +        slog("driver: %s\ndriver version: %s,%s\n", device->driver_name,
> +            device->driver_date, device->driver_version);
> +        item =3D g_new0(GuestDeviceInfoList, 1);
> +        item->value =3D g_steal_pointer(&device);
> +        if (!cur_item) {
> +            head =3D cur_item =3D item;
> +        } else {
> +            cur_item->next =3D item;
> +            cur_item =3D item;
> +        }
> +        continue;
> +    }
> +
> +out:
> +    if (dev_info !=3D INVALID_HANDLE_VALUE) {
> +        SetupDiDestroyDeviceInfoList(dev_info);
> +    }
> +    return head;
> +}
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index fb4605cc19..92ed76c419 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1242,3 +1242,54 @@
>  ##
>  { 'command': 'guest-get-osinfo',
>    'returns': 'GuestOSInfo' }
> +
> +##
> +# @GuestDeviceAddressPCI:
> +#
> +# @vendor-id: vendor ID
> +# @device-id: device ID
> +#
> +# Since: 5.0
> +##
> +{ 'struct': 'GuestDeviceAddressPCI',
> +  'data': { 'vendor-id': 'uint16', 'device-id': 'uint16' } }
> +
> +##
> +# @GuestDeviceAddress:
> +#
> +# Address of the device
> +# - @pci: address of PCI device, since: 5.0
> +#
> +# Since: 5.0
> +##
> +{ 'union': 'GuestDeviceAddress',
> +  'data': { 'pci': 'GuestDeviceAddressPCI' } }
> +
> +##
> +# @GuestDeviceInfo:
> +#
> +# @driver-name: name of the associated driver
> +# @driver-date: driver release date in format YYYY-MM-DD
> +# @driver-version: driver version
> +#
> +# Since: 5.0
> +##
> +{ 'struct': 'GuestDeviceInfo',
> +  'data': {
> +      'driver-name': 'str',
> +      '*driver-date': 'str',
> +      '*driver-version': 'str',
> +      '*address': 'GuestDeviceAddress'
> +  } }
> +
> +##
> +# @guest-get-devices:
> +#
> +# Retrieve information about device drivers in Windows guest
> +#
> +# Returns: @GuestDeviceInfo
> +#
> +# Since: 5.0
> +##
> +{ 'command': 'guest-get-devices',
> +  'returns': ['GuestDeviceInfo'] }
> --
> 2.24.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

