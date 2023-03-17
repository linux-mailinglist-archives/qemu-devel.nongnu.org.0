Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57E6BE27D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:04:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd540-000886-I8; Fri, 17 Mar 2023 04:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd53w-000863-3m
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:03:44 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pd53t-0001sb-Bx
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:03:43 -0400
Received: by mail-lf1-x12f.google.com with SMTP id x17so5466590lfu.5
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679040219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a81L//j8cKxhwxARuK0WrpSzcboxsHtWDA2Mjb+pfgI=;
 b=IF4yM1CJ0N+mWUU6Xk5D/fsMXm+3FyFeAmriERRXkaIBRdpnXRszgVIPUbmFDvybUx
 Rknw8HKExpMAphaO+y6ebosR8zAlPqB9ZT0ER/WFqposZqkBha0Q0pkg0FPgsogfIAiB
 fyXbWb2z7nE/o5IGmx17bc6xgZLydCup56fY5Zfbxr2dP2BzwM1ILCF/peALm3hJ2t6y
 pHWBuz8Q9/e1YkfnVnrBR8yuAixgJ6U1WfGYaYUeRNSvwwKode7K7yw8272YaYIFLlR1
 AkUCUJrBHii+swAymPpeIgQVhW5sV/sYPR10zpepSWd9IJEo2cxSRoMsRM74OCd1x1e1
 eGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679040219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a81L//j8cKxhwxARuK0WrpSzcboxsHtWDA2Mjb+pfgI=;
 b=1+pMgsZG4ZdjfeneW2MmcIFwcBgRSUB4CA01Vt9dwzUmw3dlrx3uK2DdIOcIckLbiX
 zSSgrokh/OovOrTZcUbPFWy4vAbPUNolbLRNOUS9vLRLF/lGAtcpDa/m+/UmJV9rDi1Q
 H7yTvLalWx1EVafpJFvJ6zjAfNnAcpchJKJaixUEDQUVlV7fF8G95udgHTnhnrLwBL6Z
 sl0P6kLpMl+9TzG7rE2/3vFwwpA6NEWF94is/SAIb2RZnRhnMiCe/gEPCCA7ezMz/k2Y
 45PUFpmmUj1I6DIeOse/hGHkRSdrAwa3EIJ3JZuT0qkmu8KZB3lJ4KDWngQ8NQx3x6tu
 TWKA==
X-Gm-Message-State: AO0yUKXeaa7A59tVwRBtAXhVd5DbzLrjWzl0BnmsYy17DKA/eSDmGjez
 85Bi2LqJMeIqLZAZsGBzL8glM/7Mu3tLbDnMKKs=
X-Google-Smtp-Source: AK7set/ODtyfIcooSKvMiZ1hTZvv9NWGsDoN81NcoM+BoPh/NWU53MmsmwsgnUTr5GJ+i1wMstomHfEM9t+FMNHKaG8=
X-Received: by 2002:ac2:562b:0:b0:4e8:426d:123f with SMTP id
 b11-20020ac2562b000000b004e8426d123fmr4050676lff.11.1679040219366; Fri, 17
 Mar 2023 01:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230316120624.46410-1-slp@redhat.com>
 <20230316120624.46410-4-slp@redhat.com>
In-Reply-To: <20230316120624.46410-4-slp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Mar 2023 12:03:27 +0400
Message-ID: <CAJ+F1CJ_Uymhzg9K-eWzp99bMVoKKWFGwapchxPLoP9b+XYCxw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] virtio-input: add a virtio-mulitouch device
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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
> Add a virtio-multitouch device to the family of devices emulated by
> virtio-input implementing the Multi-touch protocol as descripted here:
>
> https://www.kernel.org/doc/html/latest/input/multi-touch-protocol.html?hi=
ghlight=3Dmulti+touch
>
> This patch just add the device itself, without connecting it to any
> backends. The following patches will add a PCI-based multitouch device,
> some helpers in "ui" and will enable the GTK3 backend to transpose
> multi-touch events from the host to the guest.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  hw/input/virtio-input-hid.c      | 118 ++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-input.h |   9 +--
>  2 files changed, 120 insertions(+), 7 deletions(-)
>
> diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
> index d28dab69ba..742235d3fa 100644
> --- a/hw/input/virtio-input-hid.c
> +++ b/hw/input/virtio-input-hid.c
> @@ -16,9 +16,10 @@
>
>  #include "standard-headers/linux/input.h"
>
> -#define VIRTIO_ID_NAME_KEYBOARD "QEMU Virtio Keyboard"
> -#define VIRTIO_ID_NAME_MOUSE    "QEMU Virtio Mouse"
> -#define VIRTIO_ID_NAME_TABLET   "QEMU Virtio Tablet"
> +#define VIRTIO_ID_NAME_KEYBOARD     "QEMU Virtio Keyboard"
> +#define VIRTIO_ID_NAME_MOUSE        "QEMU Virtio Mouse"
> +#define VIRTIO_ID_NAME_TABLET       "QEMU Virtio Tablet"
> +#define VIRTIO_ID_NAME_MULTITOUCH   "QEMU Virtio Multitouch"
>
>  /* ----------------------------------------------------------------- */
>
> @@ -30,6 +31,7 @@ static const unsigned short keymap_button[INPUT_BUTTON_=
_MAX] =3D {
>      [INPUT_BUTTON_WHEEL_DOWN]        =3D BTN_GEAR_DOWN,
>      [INPUT_BUTTON_SIDE]              =3D BTN_SIDE,
>      [INPUT_BUTTON_EXTRA]             =3D BTN_EXTRA,
> +    [INPUT_BUTTON_TOUCH]             =3D BTN_TOUCH,
>  };
>
>  static const unsigned short axismap_rel[INPUT_AXIS__MAX] =3D {
> @@ -42,6 +44,11 @@ static const unsigned short axismap_abs[INPUT_AXIS__MA=
X] =3D {
>      [INPUT_AXIS_Y]                   =3D ABS_Y,
>  };
>
> +static const unsigned short axismap_tch[INPUT_AXIS__MAX] =3D {
> +    [INPUT_AXIS_X]                   =3D ABS_MT_POSITION_X,
> +    [INPUT_AXIS_Y]                   =3D ABS_MT_POSITION_Y,
> +};
> +
>  /* ----------------------------------------------------------------- */
>
>  static void virtio_input_extend_config(VirtIOInput *vinput,
> @@ -81,6 +88,7 @@ static void virtio_input_handle_event(DeviceState *dev,=
 QemuConsole *src,
>      InputKeyEvent *key;
>      InputMoveEvent *move;
>      InputBtnEvent *btn;
> +    InputMultitouchEvent *mtt;
>
>      switch (evt->type) {
>      case INPUT_EVENT_KIND_KEY:
> @@ -137,6 +145,24 @@ static void virtio_input_handle_event(DeviceState *d=
ev, QemuConsole *src,
>          event.value =3D cpu_to_le32(move->value);
>          virtio_input_send(vinput, &event);
>          break;
> +    case INPUT_EVENT_KIND_MTT:
> +        mtt =3D evt->u.mtt.data;
> +        if (mtt->type =3D=3D INPUT_MULTITOUCH_TYPE_DATA) {
> +            event.type  =3D cpu_to_le16(EV_ABS);
> +            event.code  =3D cpu_to_le16(axismap_tch[mtt->axis]);
> +            event.value =3D cpu_to_le32(mtt->value);
> +            virtio_input_send(vinput, &event);
> +        } else {
> +            event.type  =3D cpu_to_le16(EV_ABS);
> +            event.code  =3D cpu_to_le16(ABS_MT_SLOT);
> +            event.value =3D cpu_to_le32(mtt->slot);
> +            virtio_input_send(vinput, &event);
> +            event.type  =3D cpu_to_le16(EV_ABS);
> +            event.code  =3D cpu_to_le16(ABS_MT_TRACKING_ID);
> +            event.value =3D cpu_to_le32(mtt->tracking_id);
> +            virtio_input_send(vinput, &event);
> +        }
> +        break;
>      default:
>          /* keep gcc happy */
>          break;
> @@ -515,12 +541,98 @@ static const TypeInfo virtio_tablet_info =3D {
>
>  /* ----------------------------------------------------------------- */
>
> +static QemuInputHandler virtio_multitouch_handler =3D {
> +    .name  =3D VIRTIO_ID_NAME_MULTITOUCH,
> +    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_MTT,
> +    .event =3D virtio_input_handle_event,
> +    .sync  =3D virtio_input_handle_sync,
> +};
> +
> +static struct virtio_input_config virtio_multitouch_config[] =3D {
> +    {
> +        .select    =3D VIRTIO_INPUT_CFG_ID_NAME,
> +        .size      =3D sizeof(VIRTIO_ID_NAME_MULTITOUCH),
> +        .u.string  =3D VIRTIO_ID_NAME_MULTITOUCH,
> +    },{
> +        .select    =3D VIRTIO_INPUT_CFG_ID_DEVIDS,
> +        .size      =3D sizeof(struct virtio_input_devids),
> +        .u.ids     =3D {
> +            .bustype =3D const_le16(BUS_VIRTUAL),
> +            .vendor  =3D const_le16(0x0627), /* same we use for usb hid =
devices */
> +            .product =3D const_le16(0x0003),
> +            .version =3D const_le16(0x0001),
> +        },
> +    },{
> +        .select    =3D VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    =3D ABS_MT_SLOT,
> +        .size      =3D sizeof(virtio_input_absinfo),
> +        .u.abs.min =3D const_le32(INPUT_EVENT_SLOTS_MIN),
> +        .u.abs.max =3D const_le32(INPUT_EVENT_SLOTS_MAX),
> +    },{
> +        .select    =3D VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    =3D ABS_MT_TRACKING_ID,
> +        .size      =3D sizeof(virtio_input_absinfo),
> +        .u.abs.min =3D const_le32(INPUT_EVENT_SLOTS_MIN),
> +        .u.abs.max =3D const_le32(INPUT_EVENT_SLOTS_MAX),
> +    },{
> +        .select    =3D VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    =3D ABS_MT_POSITION_X,
> +        .size      =3D sizeof(virtio_input_absinfo),
> +        .u.abs.min =3D const_le32(INPUT_EVENT_ABS_MIN),
> +        .u.abs.max =3D const_le32(INPUT_EVENT_ABS_MAX),
> +    },{
> +        .select    =3D VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    =3D ABS_MT_POSITION_Y,
> +        .size      =3D sizeof(virtio_input_absinfo),
> +        .u.abs.min =3D const_le32(INPUT_EVENT_ABS_MIN),
> +        .u.abs.max =3D const_le32(INPUT_EVENT_ABS_MAX),
> +    },
> +    { /* end of list */ },
> +};
> +
> +static void virtio_multitouch_init(Object *obj)
> +{
> +    VirtIOInputHID *vhid =3D VIRTIO_INPUT_HID(obj);
> +    VirtIOInput *vinput =3D VIRTIO_INPUT(obj);
> +    unsigned short abs_props[] =3D {
> +        INPUT_PROP_DIRECT,
> +    };
> +    unsigned short abs_bits[] =3D {
> +        ABS_MT_SLOT,
> +        ABS_MT_TRACKING_ID,
> +        ABS_MT_POSITION_X,
> +        ABS_MT_POSITION_Y,
> +    };
> +
> +    vhid->handler =3D &virtio_multitouch_handler;
> +    virtio_input_init_config(vinput, virtio_multitouch_config);
> +    virtio_input_extend_config(vinput, keymap_button,
> +                               ARRAY_SIZE(keymap_button),
> +                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
> +    virtio_input_extend_config(vinput, abs_props,
> +                               ARRAY_SIZE(abs_props),
> +                               VIRTIO_INPUT_CFG_PROP_BITS, 0);
> +    virtio_input_extend_config(vinput, abs_bits,
> +                               ARRAY_SIZE(abs_bits),
> +                               VIRTIO_INPUT_CFG_EV_BITS, EV_ABS);
> +}
> +
> +static const TypeInfo virtio_multitouch_info =3D {
> +    .name          =3D TYPE_VIRTIO_MULTITOUCH,
> +    .parent        =3D TYPE_VIRTIO_INPUT_HID,
> +    .instance_size =3D sizeof(VirtIOInputHID),
> +    .instance_init =3D virtio_multitouch_init,
> +};
> +
> +/* ----------------------------------------------------------------- */
> +
>  static void virtio_register_types(void)
>  {
>      type_register_static(&virtio_input_hid_info);
>      type_register_static(&virtio_keyboard_info);
>      type_register_static(&virtio_mouse_info);
>      type_register_static(&virtio_tablet_info);
> +    type_register_static(&virtio_multitouch_info);
>  }
>
>  type_init(virtio_register_types)
> diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-=
input.h
> index f2da63d309..08f1591424 100644
> --- a/include/hw/virtio/virtio-input.h
> +++ b/include/hw/virtio/virtio-input.h
> @@ -24,10 +24,11 @@ OBJECT_DECLARE_TYPE(VirtIOInput, VirtIOInputClass,
>  #define VIRTIO_INPUT_GET_PARENT_CLASS(obj) \
>          OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT)
>
> -#define TYPE_VIRTIO_INPUT_HID "virtio-input-hid-device"
> -#define TYPE_VIRTIO_KEYBOARD  "virtio-keyboard-device"
> -#define TYPE_VIRTIO_MOUSE     "virtio-mouse-device"
> -#define TYPE_VIRTIO_TABLET    "virtio-tablet-device"
> +#define TYPE_VIRTIO_INPUT_HID  "virtio-input-hid-device"
> +#define TYPE_VIRTIO_KEYBOARD   "virtio-keyboard-device"
> +#define TYPE_VIRTIO_MOUSE      "virtio-mouse-device"
> +#define TYPE_VIRTIO_TABLET     "virtio-tablet-device"
> +#define TYPE_VIRTIO_MULTITOUCH "virtio-multitouch-device"
>
>  OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHID, VIRTIO_INPUT_HID)
>  #define VIRTIO_INPUT_HID_GET_PARENT_CLASS(obj) \
> --
> 2.38.1
>
>


--
Marc-Andr=C3=A9 Lureau

