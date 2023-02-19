Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339F569BF15
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 09:08:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTejt-0001Lk-2m; Sun, 19 Feb 2023 03:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTejp-0001LI-LL
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 03:08:02 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pTejn-0005hK-US
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 03:08:01 -0500
Received: by mail-lf1-x131.google.com with SMTP id bp6so533359lfb.0
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETierStTdn35K3DoIPL+T7/eChY7wp8RCMdl+jWm4Bc=;
 b=mX4qRIk9Hn8u+gPDSznghU5T6iv9WY1zKgeBo15dHreTVpY1rEVp/tS/DK290rg/Ad
 ZIzwDW1IXGpyOBeKHrs1GyRAXhrJO+MH7xcoMtfa08n5YXvE7sWZpefKYu9K+7NZp6Tb
 cszXbm9wCRgoxQbqPZiCB4TnVvlJlwHJY/0JNd9afXrfkdxO3cqccVN30aOhL02LApOz
 ZgdqfKCBAZl8Kfu0dnYREhcmtD4f6EF6zpQLyv0mJ4FUUP28dsynQGpRhcX55fgNchjm
 es0vvZMYeHhNj1CJ3fy2PTsatscX2sYZ5LMab1kMt543BgPBAUnWR9QIvrHQ+m2usQf8
 9jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETierStTdn35K3DoIPL+T7/eChY7wp8RCMdl+jWm4Bc=;
 b=0jIHKH/OKUiAssuoLH1pksRsPb72NQQ9T+M2yugm4Erg2aadoevPhgzLpjoCjQmwvg
 oFx8EBqXk9/SWDuaQH8IV6qt/OjvxxGpHvGAsGm3euszkf2Yeo/YS6ilVpz5u0rkVGWl
 vV5owJpUxTfrGfm3Xpi+T8Vqu8FFdcaGialqyp61o812t0vZcJBlBbkaNcetXwYvaqwW
 c1hPoVFS8nV9i7xmKkLEarV9ptT/IJce1DikHnrgjNHwvRsWuivhc2paWDzngJvIdNeP
 LOzcqXmOdKovda28enVyAq6Qt7aIcUlE02EfZJABEhvkjyVHRD9uuh7I+oL1VA2RuMMk
 Qhog==
X-Gm-Message-State: AO0yUKWoMj6VjgTJZDT4PA9F7AS9kLfQGvCLl7+XkIvybMQ3TXAR4JL7
 Ua9e4rq5mlMMcdfsVw+UVyMsRPbUX2gugtVP9bY=
X-Google-Smtp-Source: AK7set+qSb6sVhnCVdrvytEg8ehBVNUi++ELetJF4PwrAcFxGRkBmrP1xTRvRb3Ro1XjsETsfB9sx/vAKuuCoA24eKg=
X-Received: by 2002:a05:6512:b08:b0:4dc:8004:7689 with SMTP id
 w8-20020a0565120b0800b004dc80047689mr922758lfu.4.1676794078222; Sun, 19 Feb
 2023 00:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20230218162216.46944-1-slp@redhat.com>
 <20230218162216.46944-2-slp@redhat.com>
In-Reply-To: <20230218162216.46944-2-slp@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 19 Feb 2023 12:07:46 +0400
Message-ID: <CAJ+F1CLZoEnVFkfM69uOyDnd4N5QrLVjCrhh33Zi6CK=+CWbwQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio-input: generalize virtio_input_key_config()
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

On Sat, Feb 18, 2023 at 8:23 PM Sergio Lopez <slp@redhat.com> wrote:
>
> As there are other bitmap-based config properties that need to be dealt i=
n a
> similar fashion as VIRTIO_INPUT_CFG_EV_BITS, generalize the function to
> receive select and subsel as arguments, and rename it to
> virtio_input_extend_config()
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  hw/input/virtio-input-hid.c | 38 ++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
> index a7a244a95d..d28dab69ba 100644
> --- a/hw/input/virtio-input-hid.c
> +++ b/hw/input/virtio-input-hid.c
> @@ -44,30 +44,31 @@ static const unsigned short axismap_abs[INPUT_AXIS__M=
AX] =3D {
>
>  /* ----------------------------------------------------------------- */
>
> -static void virtio_input_key_config(VirtIOInput *vinput,
> -                                    const unsigned short *keymap,
> -                                    size_t mapsize)
> +static void virtio_input_extend_config(VirtIOInput *vinput,
> +                                       const unsigned short *map,
> +                                       size_t mapsize,
> +                                       uint8_t select, uint8_t subsel)
>  {
> -    virtio_input_config keys;
> +    virtio_input_config ext;
>      int i, bit, byte, bmax =3D 0;
>
> -    memset(&keys, 0, sizeof(keys));
> +    memset(&ext, 0, sizeof(ext));
>      for (i =3D 0; i < mapsize; i++) {
> -        bit =3D keymap[i];
> +        bit =3D map[i];
>          if (!bit) {
>              continue;
>          }
>          byte =3D bit / 8;
>          bit  =3D bit % 8;
> -        keys.u.bitmap[byte] |=3D (1 << bit);
> +        ext.u.bitmap[byte] |=3D (1 << bit);
>          if (bmax < byte+1) {
>              bmax =3D byte+1;
>          }
>      }
> -    keys.select =3D VIRTIO_INPUT_CFG_EV_BITS;
> -    keys.subsel =3D EV_KEY;
> -    keys.size   =3D bmax;
> -    virtio_input_add_config(vinput, &keys);
> +    ext.select =3D select;
> +    ext.subsel =3D subsel;
> +    ext.size   =3D bmax;
> +    virtio_input_add_config(vinput, &ext);
>  }
>
>  static void virtio_input_handle_event(DeviceState *dev, QemuConsole *src=
,
> @@ -281,8 +282,9 @@ static void virtio_keyboard_init(Object *obj)
>
>      vhid->handler =3D &virtio_keyboard_handler;
>      virtio_input_init_config(vinput, virtio_keyboard_config);
> -    virtio_input_key_config(vinput, qemu_input_map_qcode_to_linux,
> -                            qemu_input_map_qcode_to_linux_len);
> +    virtio_input_extend_config(vinput, qemu_input_map_qcode_to_linux,
> +                               qemu_input_map_qcode_to_linux_len,
> +                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
>  }
>
>  static const TypeInfo virtio_keyboard_info =3D {
> @@ -373,8 +375,9 @@ static void virtio_mouse_init(Object *obj)
>      virtio_input_init_config(vinput, vhid->wheel_axis
>                               ? virtio_mouse_config_v2
>                               : virtio_mouse_config_v1);
> -    virtio_input_key_config(vinput, keymap_button,
> -                            ARRAY_SIZE(keymap_button));
> +    virtio_input_extend_config(vinput, keymap_button,
> +                               ARRAY_SIZE(keymap_button),
> +                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
>  }
>
>  static const TypeInfo virtio_mouse_info =3D {
> @@ -497,8 +500,9 @@ static void virtio_tablet_init(Object *obj)
>      virtio_input_init_config(vinput, vhid->wheel_axis
>                               ? virtio_tablet_config_v2
>                               : virtio_tablet_config_v1);
> -    virtio_input_key_config(vinput, keymap_button,
> -                            ARRAY_SIZE(keymap_button));
> +    virtio_input_extend_config(vinput, keymap_button,
> +                               ARRAY_SIZE(keymap_button),
> +                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
>  }
>
>  static const TypeInfo virtio_tablet_info =3D {
> --
> 2.38.1
>
>


--
Marc-Andr=C3=A9 Lureau

