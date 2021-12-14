Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888F14743DE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:51:59 +0100 (CET)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8Dm-00022S-H4
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7qZ-0005vq-9R
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mx7qX-0002vF-Bk
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639488475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQRdAmPuzgkafJ7pRJXHh9SEvPi5BDvWAlprZhdji5k=;
 b=iB2Y/VN5j7A1rV1ejC1CMULuLT91dbLuMOb3vqyr3SpcT6XGuhASxd5IEXhwCL6EjitH/j
 CVHfS/tMdFg0EniZg3A69ElV4R3gdZMHWA10Pl3Tv3LQ2f5FOvF0Qw2VIBCLdHPISG+4HG
 uvXfPVnUF9Cv5WW4MPtmtoZqY1da+6s=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-g1qKR0-2MviDzmKTg9B-tA-1; Tue, 14 Dec 2021 08:27:54 -0500
X-MC-Unique: g1qKR0-2MviDzmKTg9B-tA-1
Received: by mail-pl1-f200.google.com with SMTP id
 j6-20020a17090276c600b0014377d8ede3so5408279plt.21
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eQRdAmPuzgkafJ7pRJXHh9SEvPi5BDvWAlprZhdji5k=;
 b=U9TrF0ayXQSsMjA6HLxq5o3j53rv24vQx55VnX5dPoN1LiqhtPBm6DC51qFPbxjK+2
 yGSzseyDvu/3o8gFZFDImfErxN/Mvguzk8Lc/JZPZ3dXVFwZsr9muLTZoAFiqMhHV5iX
 JD0iCXT6s+7E7k3ksZmn0kSZ8lyR9OiKSdyQ5OdxmaiGYoIrwyROaswnu0V+K8cePbiA
 iqMH7P/8Zvzyjj6snCes+OsirXkzPqa6Adif7Q1SZFh7UESEVP/QIfX8ppbTSs/kkhc7
 DzqN/QcRMx48Z+5XDGB4PtOT3F7Ul4BXLStdhZS5hyZEHXLobjLEmyY1nUIOQCkpk2xP
 dkDw==
X-Gm-Message-State: AOAM530eUgyeYMGado4l/AVPHnfQt35TOEkZhwuYcN17G8s5PtzAPAat
 uALFCoN1cd90KUFGPwDWvYUEjPY7oPfUNcsJnzpzZvBIP1IKNs6i1mkW/Zc6rybbdWfoGQ+c9XR
 9tHEj5DFYoldiWhS4BL70s0OorTOuJ+8=
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr5769999pjb.36.1639488473256; 
 Tue, 14 Dec 2021 05:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX7yv8J3ud0v33CXHS5IIcXwQ7mHdb9BR2p16MJno5hdcp+bKGS36BW1bK2Mi3CsLl09Md51kuv0BVcX3at4k=
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr5769967pjb.36.1639488472952; 
 Tue, 14 Dec 2021 05:27:52 -0800 (PST)
MIME-Version: 1.0
References: <20211214124109.103102-1-konstantin@daynix.com>
 <20211214124109.103102-5-konstantin@daynix.com>
In-Reply-To: <20211214124109.103102-5-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 14 Dec 2021 17:27:41 +0400
Message-ID: <CAMxuvay4emb8imgn16zR-UcmZtDq8UaGVxZqmp_Yk+G=PgiUTQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] gqa-win: get_pci_info: Split logic to separate
 functions
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 4:41 PM Kostiantyn Kostiuk
<konstantin@daynix.com> wrote:
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

thanks!

> ---
>  qga/commands-win32.c | 161 +++++++++++++++++++++++--------------------
>  1 file changed, 87 insertions(+), 74 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index f6de9e2676..8588fa8633 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -512,6 +512,92 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
>          0x2accfe60L, 0xc130, 0x11d2, 0xb0, 0x82,
>          0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);
>
> +static void get_pci_address_for_device(GuestPCIAddress *pci,
> +                                       HDEVINFO dev_info)
> +{
> +    SP_DEVINFO_DATA dev_info_data;
> +    DWORD j;
> +    DWORD size;
> +    bool partial_pci =3D false;
> +
> +    dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
> +
> +    for (j =3D 0;
> +         SetupDiEnumDeviceInfo(dev_info, j, &dev_info_data);
> +         j++) {
> +        DWORD addr, bus, ui_slot, type;
> +        int func, slot;
> +        size =3D sizeof(DWORD);
> +
> +        /*
> +        * There is no need to allocate buffer in the next functions. The
> +        * size is known and ULONG according to
> +        * https://msdn.microsoft.com/en-us/library/windows/hardware/ff54=
3095(v=3Dvs.85).aspx
> +        */
> +        if (!SetupDiGetDeviceRegistryProperty(
> +                dev_info, &dev_info_data, SPDRP_BUSNUMBER,
> +                &type, (PBYTE)&bus, size, NULL)) {
> +            debug_error("failed to get PCI bus");
> +            bus =3D -1;
> +            partial_pci =3D true;
> +        }
> +
> +        /*
> +        * The function retrieves the device's address. This value will b=
e
> +        * transformed into device function and number
> +        */
> +        if (!SetupDiGetDeviceRegistryProperty(
> +                dev_info, &dev_info_data, SPDRP_ADDRESS,
> +                &type, (PBYTE)&addr, size, NULL)) {
> +            debug_error("failed to get PCI address");
> +            addr =3D -1;
> +            partial_pci =3D true;
> +        }
> +
> +        /*
> +        * This call returns UINumber of DEVICE_CAPABILITIES structure.
> +        * This number is typically a user-perceived slot number.
> +        */
> +        if (!SetupDiGetDeviceRegistryProperty(
> +                dev_info, &dev_info_data, SPDRP_UI_NUMBER,
> +                &type, (PBYTE)&ui_slot, size, NULL)) {
> +            debug_error("failed to get PCI slot");
> +            ui_slot =3D -1;
> +            partial_pci =3D true;
> +        }
> +
> +        /*
> +        * SetupApi gives us the same information as driver with
> +        * IoGetDeviceProperty. According to Microsoft:
> +        *
> +        *   FunctionNumber =3D (USHORT)((propertyAddress) & 0x0000FFFF)
> +        *   DeviceNumber =3D (USHORT)(((propertyAddress) >> 16) & 0x0000=
FFFF)
> +        *   SPDRP_ADDRESS is propertyAddress, so we do the same.
> +        *
> +        * https://docs.microsoft.com/en-us/windows/desktop/api/setupapi/=
nf-setupapi-setupdigetdeviceregistrypropertya
> +        */
> +        if (partial_pci) {
> +            pci->domain =3D -1;
> +            pci->slot =3D -1;
> +            pci->function =3D -1;
> +            pci->bus =3D -1;
> +            continue;
> +        } else {
> +            func =3D ((int)addr =3D=3D -1) ? -1 : addr & 0x0000FFFF;
> +            slot =3D ((int)addr =3D=3D -1) ? -1 : (addr >> 16) & 0x0000F=
FFF;
> +            if ((int)ui_slot !=3D slot) {
> +                g_debug("mismatch with reported slot values: %d vs %d",
> +                        (int)ui_slot, slot);
> +            }
> +            pci->domain =3D 0;
> +            pci->slot =3D (int)ui_slot;
> +            pci->function =3D func;
> +            pci->bus =3D (int)bus;
> +            return;
> +        }
> +    }
> +}
> +
>  static GuestPCIAddress *get_pci_info(int number, Error **errp)
>  {
>      HDEVINFO dev_info =3D INVALID_HANDLE_VALUE;
> @@ -522,7 +608,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>      HANDLE dev_file;
>      int i;
>      GuestPCIAddress *pci =3D NULL;
> -    bool partial_pci =3D false;
>
>      pci =3D g_malloc0(sizeof(*pci));
>      pci->domain =3D -1;
> @@ -545,7 +630,6 @@ static GuestPCIAddress *get_pci_info(int number, Erro=
r **errp)
>          STORAGE_DEVICE_NUMBER sdn;
>          char *parent_dev_id =3D NULL;
>          SP_DEVINFO_DATA parent_dev_info_data;
> -        DWORD j;
>          DWORD size =3D 0;
>
>          g_debug("getting device path");
> @@ -672,79 +756,8 @@ static GuestPCIAddress *get_pci_info(int number, Err=
or **errp)
>              goto end;
>          }
>
> -        for (j =3D 0;
> -             SetupDiEnumDeviceInfo(parent_dev_info, j, &parent_dev_info_=
data);
> -             j++) {
> -            DWORD addr, bus, ui_slot, type;
> -            int func, slot;
> +        get_pci_address_for_device(pci, parent_dev_info);
>
> -            /*
> -             * There is no need to allocate buffer in the next functions=
. The
> -             * size is known and ULONG according to
> -             * https://msdn.microsoft.com/en-us/library/windows/hardware=
/ff543095(v=3Dvs.85).aspx
> -             */
> -            if (!SetupDiGetDeviceRegistryProperty(
> -                  parent_dev_info, &parent_dev_info_data, SPDRP_BUSNUMBE=
R,
> -                  &type, (PBYTE)&bus, size, NULL)) {
> -                debug_error("failed to get PCI bus");
> -                bus =3D -1;
> -                partial_pci =3D true;
> -            }
> -
> -            /*
> -             * The function retrieves the device's address. This value w=
ill be
> -             * transformed into device function and number
> -             */
> -            if (!SetupDiGetDeviceRegistryProperty(
> -                    parent_dev_info, &parent_dev_info_data, SPDRP_ADDRES=
S,
> -                    &type, (PBYTE)&addr, size, NULL)) {
> -                debug_error("failed to get PCI address");
> -                addr =3D -1;
> -                partial_pci =3D true;
> -            }
> -
> -            /*
> -             * This call returns UINumber of DEVICE_CAPABILITIES structu=
re.
> -             * This number is typically a user-perceived slot number.
> -             */
> -            if (!SetupDiGetDeviceRegistryProperty(
> -                    parent_dev_info, &parent_dev_info_data, SPDRP_UI_NUM=
BER,
> -                    &type, (PBYTE)&ui_slot, size, NULL)) {
> -                debug_error("failed to get PCI slot");
> -                ui_slot =3D -1;
> -                partial_pci =3D true;
> -            }
> -
> -            /*
> -             * SetupApi gives us the same information as driver with
> -             * IoGetDeviceProperty. According to Microsoft:
> -             *
> -             *   FunctionNumber =3D (USHORT)((propertyAddress) & 0x0000F=
FFF)
> -             *   DeviceNumber =3D (USHORT)(((propertyAddress) >> 16) & 0=
x0000FFFF)
> -             *   SPDRP_ADDRESS is propertyAddress, so we do the same.
> -             *
> -             * https://docs.microsoft.com/en-us/windows/desktop/api/setu=
papi/nf-setupapi-setupdigetdeviceregistrypropertya
> -             */
> -            if (partial_pci) {
> -                pci->domain =3D -1;
> -                pci->slot =3D -1;
> -                pci->function =3D -1;
> -                pci->bus =3D -1;
> -                continue;
> -            } else {
> -                func =3D ((int)addr =3D=3D -1) ? -1 : addr & 0x0000FFFF;
> -                slot =3D ((int)addr =3D=3D -1) ? -1 : (addr >> 16) & 0x0=
000FFFF;
> -                if ((int)ui_slot !=3D slot) {
> -                    g_debug("mismatch with reported slot values: %d vs %=
d",
> -                            (int)ui_slot, slot);
> -                }
> -                pci->domain =3D 0;
> -                pci->slot =3D (int)ui_slot;
> -                pci->function =3D func;
> -                pci->bus =3D (int)bus;
> -                break;
> -            }
> -        }
>          break;
>      }
>
> --
> 2.25.1
>


