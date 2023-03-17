Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33E6BE28F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:05:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd55V-0002c3-TD; Fri, 17 Mar 2023 04:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd55T-0002bI-4j
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:05:20 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd55R-0002HC-JQ
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:05:18 -0400
Received: by mail-lf1-x129.google.com with SMTP id s8so5187709lfr.8
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679040316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRDC1jvr30yglDQzwL1K4BCN76xQldCFXY3DgkhmpAM=;
 b=h6iTDuVFuSFy4ru8KSE/dF93gE/NNvmGG0xzTfZ8zAf3jW4lzs5zTJ/u5DhuRDk2vK
 +fL+4a+a3xdXV6p/hbnBErUwFfT3I1QhHI4X+XXnZ+tUoZDGQpj187CJEmfYZd8RV7id
 pAUKJUr6v2PWwGGdRZLtSoacwrfugJLh9/av07K2N54Zne/nKwyn0FDns2tk8/BpyPFI
 MpZpVqQSFEK/I6p/XHjWrdylXooI3HIayg1RIa9D7ER+a0KOyM2OCn4klqJV4DE/4baB
 990xUgKHeN10QeaUDKVcwf5s4hagCqFnrxkFU0Nm/89lQSSsyeJ8dCiTtYfzDxEGMwcJ
 hBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679040316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRDC1jvr30yglDQzwL1K4BCN76xQldCFXY3DgkhmpAM=;
 b=W6eCygGhu7BuEWzmQddF8ZRzl4iy0NdqbJ5nQt6fIVUJXIKnBa+UabHuBno8r3P9cI
 wjFHqlPdI+HrCIYZWAFZOxmupGMqud2+Yry5O/UdQ9KLQGud16Mkb/Zkfuk65My6N5zk
 nYB4m9gPFQIVywCfT9ntubdPaoLkfcKMyyLa3y2+igN6950YRzFG765THbcIhG5QLqaS
 ULrPfw15C4CRysMLFz8nXXXziT8owyeqr4q0ccreoSPFpJHNhd2oSYsrdQJ8Bl9UYODL
 mVPg50ua+XC5uM4MfdZzCu3DPOvANHzsNTmWtzbRYiZwxlpcVwMBURp5M1imTac1xS2J
 tV3w==
X-Gm-Message-State: AO0yUKUKLn6kpErzaBobN6EWEnWp6gpYwpTOGtTHktzDN26LfH6dKAJO
 McqbS3fS8vazXUIi8Teuy6SnVOgqr5nImQ1CcpxxStJvTxupkw==
X-Google-Smtp-Source: AK7set8mwNFgRyIPf8aglSZuF7/7A7b3Mrqt1IUkoDmjyGMKcIVTu2mTw8ATnGA6MHVGQO3ih+9IPZm+FO9a8wK696Y=
X-Received: by 2002:ac2:4c3c:0:b0:4dd:fd4e:5a21 with SMTP id
 u28-20020ac24c3c000000b004ddfd4e5a21mr4108089lfq.11.1679040315751; Fri, 17
 Mar 2023 01:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230316120624.46410-1-slp@redhat.com>
 <20230316120624.46410-5-slp@redhat.com>
In-Reply-To: <20230316120624.46410-5-slp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Mar 2023 12:05:04 +0400
Message-ID: <CAJ+F1CK=3rdaTO=ToCCDdgkTQ_tg-uLu=5cr5cnYbd9RR0R+SQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] virtio-input-pci: add virtio-multitouch-pci
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 16, 2023 at 4:07=E2=80=AFPM Sergio Lopez <slp@redhat.com> wrote=
:
>
> Add virtio-multitouch-pci, a Multitouch-capable input device, to the
> list of devices that can be provided by virtio-input-pci.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/virtio/virtio-input-pci.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
> index a9d0992389..a53edf46c4 100644
> --- a/hw/virtio/virtio-input-pci.c
> +++ b/hw/virtio/virtio-input-pci.c
> @@ -25,10 +25,11 @@ struct VirtIOInputPCI {
>      VirtIOInput vdev;
>  };
>
> -#define TYPE_VIRTIO_INPUT_HID_PCI "virtio-input-hid-pci"
> -#define TYPE_VIRTIO_KEYBOARD_PCI  "virtio-keyboard-pci"
> -#define TYPE_VIRTIO_MOUSE_PCI     "virtio-mouse-pci"
> -#define TYPE_VIRTIO_TABLET_PCI    "virtio-tablet-pci"
> +#define TYPE_VIRTIO_INPUT_HID_PCI  "virtio-input-hid-pci"
> +#define TYPE_VIRTIO_KEYBOARD_PCI   "virtio-keyboard-pci"
> +#define TYPE_VIRTIO_MOUSE_PCI      "virtio-mouse-pci"
> +#define TYPE_VIRTIO_TABLET_PCI     "virtio-tablet-pci"
> +#define TYPE_VIRTIO_MULTITOUCH_PCI "virtio-multitouch-pci"
>  OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHIDPCI, VIRTIO_INPUT_HID_PCI)
>
>  struct VirtIOInputHIDPCI {
> @@ -102,6 +103,14 @@ static void virtio_tablet_initfn(Object *obj)
>                                  TYPE_VIRTIO_TABLET);
>  }
>
> +static void virtio_multitouch_initfn(Object *obj)
> +{
> +    VirtIOInputHIDPCI *dev =3D VIRTIO_INPUT_HID_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VIRTIO_MULTITOUCH);
> +}
> +
>  static const TypeInfo virtio_input_pci_info =3D {
>      .name          =3D TYPE_VIRTIO_INPUT_PCI,
>      .parent        =3D TYPE_VIRTIO_PCI,
> @@ -140,6 +149,13 @@ static const VirtioPCIDeviceTypeInfo virtio_tablet_p=
ci_info =3D {
>      .instance_init =3D virtio_tablet_initfn,
>  };
>
> +static const VirtioPCIDeviceTypeInfo virtio_multitouch_pci_info =3D {
> +    .generic_name  =3D TYPE_VIRTIO_MULTITOUCH_PCI,
> +    .parent        =3D TYPE_VIRTIO_INPUT_HID_PCI,
> +    .instance_size =3D sizeof(VirtIOInputHIDPCI),
> +    .instance_init =3D virtio_multitouch_initfn,
> +};
> +
>  static void virtio_pci_input_register(void)
>  {
>      /* Base types: */
> @@ -150,6 +166,7 @@ static void virtio_pci_input_register(void)
>      virtio_pci_types_register(&virtio_keyboard_pci_info);
>      virtio_pci_types_register(&virtio_mouse_pci_info);
>      virtio_pci_types_register(&virtio_tablet_pci_info);
> +    virtio_pci_types_register(&virtio_multitouch_pci_info);
>  }
>
>  type_init(virtio_pci_input_register)
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

