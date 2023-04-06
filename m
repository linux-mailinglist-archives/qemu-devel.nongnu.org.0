Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12926DA27E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 22:19:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkW4g-00076F-Lg; Thu, 06 Apr 2023 16:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkW4e-000760-ON; Thu, 06 Apr 2023 16:19:12 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pkW4c-0005mt-85; Thu, 06 Apr 2023 16:19:12 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-536af432ee5so761884667b3.0; 
 Thu, 06 Apr 2023 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680812349;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QW7iVzywVli8sxVgWsjUGFQia6PRWzEb61XhKSuAwXU=;
 b=Ipa7UR9IbtiQOaGVjGzLdq0mgojZ3lKSgOJnxAMFMRmMOkQKF4s2qA9DEj+URwDbmh
 7WDkMbo1URDz5mXEfZW0hCgAxyz3yZy2ri6bTOIKM+YPKuRh6Ndm0jFCNKq3/u9+xTso
 aTWisEYikgv7WgECJSfihbU0OReb9sWxn13ajdqryXrbQbFe2vF3dabzLrAkYblFr4+d
 OCOlob3ZW9BODfx43DT7QpMidudO61JhMw2MIh2Qjdn26AGg2d8AxaUweTsyqqg9qhTF
 Dl4X1QAOJ1gjbEXl9B7B4j3AZ734prwDFYAvHZbhXco52fybf8+bKD2JNkG3vJoCnu7Y
 Ie5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680812349;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QW7iVzywVli8sxVgWsjUGFQia6PRWzEb61XhKSuAwXU=;
 b=UUGpVGKo1EaCEslctjb5vVImEo5T/gjPnOh2BRI9v3OpskiRPQvTrK27LM0yVy3/vf
 FclEEJZ+cJih+KiCUU3dV2sGgICruCKpnw9SBC9R+6GPo5JoEwHafZ2GmV4xR+pLzD+S
 A1fjPvbNXK0BjxMtijDbJAH0T33BfOFM6811x+kB+1XaaXfyyQ5/w7AdnzRBXHu0cQa8
 dcc2Gd/AIf+b7FRuZMyJL9Yc8dqBGa7i83u1m+0p4whsfvaXh4rBRx30mXJD0nHffLcg
 qm6Hvq/xZyZWX0mGAxb9fn8hhSbatD7o6+ylPpUrZo5JfQf2OmCjuOHMeSnDu2Hh5IQf
 pK3Q==
X-Gm-Message-State: AAQBX9fsqk/L2WJjuLYHUSfvGYT6F2b6z3vxJZdIIad9QmNkYSge0DKx
 +G/8oBLtNdu3KjvdpV2IZq1uJ+ofQR4euhpcyl4=
X-Google-Smtp-Source: AKy350aaTuiWkiSkply0Fe9LIO5K+z1OOvszEIHQ4sc+3Bvn1lf3oOu6Q0cgIR39//Xhs90LrSOTKo5QbkSbpwHA/oQ=
X-Received: by 2002:a81:e545:0:b0:545:4133:fc40 with SMTP id
 c5-20020a81e545000000b005454133fc40mr6345551ywm.9.1680812348810; Thu, 06 Apr
 2023 13:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230328054654.18620-1-qianfanguijin@163.com>
 <20230328054654.18620-8-qianfanguijin@163.com>
In-Reply-To: <20230328054654.18620-8-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 6 Apr 2023 22:18:57 +0200
Message-ID: <CAPan3Wpm6KqrXrdtrSqQPGAQGwJpiraUj0n3FKJOAoSrR1c71w@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] hw: sd: allwinner-sdhost: Add sun50i-a64 SoC
 support
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fc2a9005f8b09ee2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000fc2a9005f8b09ee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 7:47=E2=80=AFAM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> A64's sd register was similar to H3, and it introduced a new register
> named SAMP_DL_REG location at 0x144. The dma descriptor buffer size of
> mmc2 is only 8K and the other mmc controllers has 64K.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/sd/allwinner-sdhost.c         | 70 ++++++++++++++++++++++++++++++--
>  include/hw/sd/allwinner-sdhost.h |  9 ++++
>  2 files changed, 76 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> index 51e5e90830..38e7844399 100644
> --- a/hw/sd/allwinner-sdhost.c
> +++ b/hw/sd/allwinner-sdhost.c
> @@ -77,6 +77,7 @@ enum {
>      REG_SD_DATA1_CRC  =3D 0x12C, /* CRC Data 1 from card/eMMC */
>      REG_SD_DATA0_CRC  =3D 0x130, /* CRC Data 0 from card/eMMC */
>      REG_SD_CRC_STA    =3D 0x134, /* CRC status from card/eMMC during wri=
te
> */
> +    REG_SD_SAMP_DL    =3D 0x144, /* Sample Delay Control (sun50i-a64) */
>      REG_SD_FIFO       =3D 0x200, /* Read/Write FIFO */
>  };
>
> @@ -158,6 +159,7 @@ enum {
>      REG_SD_RES_CRC_RST      =3D 0x0,
>      REG_SD_DATA_CRC_RST     =3D 0x0,
>      REG_SD_CRC_STA_RST      =3D 0x0,
> +    REG_SD_SAMPLE_DL_RST    =3D 0x00002000,
>      REG_SD_FIFO_RST         =3D 0x0,
>  };
>
> @@ -438,6 +440,7 @@ static uint64_t allwinner_sdhost_read(void *opaque,
> hwaddr offset,
>  {
>      AwSdHostState *s =3D AW_SDHOST(opaque);
>      AwSdHostClass *sc =3D AW_SDHOST_GET_CLASS(s);
> +    bool out_of_bounds =3D false;
>      uint32_t res =3D 0;
>
>      switch (offset) {
> @@ -556,13 +559,24 @@ static uint64_t allwinner_sdhost_read(void *opaque,
> hwaddr offset,
>      case REG_SD_FIFO:      /* Read/Write FIFO */
>          res =3D allwinner_sdhost_fifo_read(s);
>          break;
> +    case REG_SD_SAMP_DL: /* Sample Delay */
>
Sample Delay Control


> +        if (sc->can_calibrate) {
> +            res =3D s->sample_delay;
> +        } else {
> +            out_of_bounds =3D true;
> +        }
> +        break;
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +        out_of_bounds =3D true;
>          res =3D 0;
>          break;
>      }
>
> +    if (out_of_bounds) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
> +                      HWADDR_PRIx"\n", __func__, offset);
> +    }
> +
>      trace_allwinner_sdhost_read(offset, res, size);
>      return res;
>  }
> @@ -581,6 +595,7 @@ static void allwinner_sdhost_write(void *opaque,
> hwaddr offset,
>  {
>      AwSdHostState *s =3D AW_SDHOST(opaque);
>      AwSdHostClass *sc =3D AW_SDHOST_GET_CLASS(s);
> +    bool out_of_bounds =3D false;
>
>      trace_allwinner_sdhost_write(offset, value, size);
>
> @@ -704,10 +719,21 @@ static void allwinner_sdhost_write(void *opaque,
> hwaddr offset,
>      case REG_SD_DATA0_CRC: /* CRC Data 0 from card/eMMC */
>      case REG_SD_CRC_STA:   /* CRC status from card/eMMC in write
> operation */
>          break;
> +    case REG_SD_SAMP_DL: /* Sample delay control */
> +        if (sc->can_calibrate) {
> +            s->sample_delay =3D value;
> +        } else {
> +            out_of_bounds =3D true;
> +        }
> +        break;
>      default:
> +        out_of_bounds =3D true;
> +        break;
> +    }
> +
> +    if (out_of_bounds) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
>                        HWADDR_PRIx"\n", __func__, offset);
> -        break;
>      }
>  }
>
> @@ -756,6 +782,7 @@ static const VMStateDescription
> vmstate_allwinner_sdhost =3D {
>          VMSTATE_UINT32(response_crc, AwSdHostState),
>          VMSTATE_UINT32_ARRAY(data_crc, AwSdHostState, 8),
>          VMSTATE_UINT32(status_crc, AwSdHostState),
> +        VMSTATE_UINT32(sample_delay, AwSdHostState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -794,6 +821,7 @@ static void allwinner_sdhost_realize(DeviceState *dev=
,
> Error **errp)
>  static void allwinner_sdhost_reset(DeviceState *dev)
>  {
>      AwSdHostState *s =3D AW_SDHOST(dev);
> +    AwSdHostClass *sc =3D AW_SDHOST_GET_CLASS(s);
>
>      s->global_ctl =3D REG_SD_GCTL_RST;
>      s->clock_ctl =3D REG_SD_CKCR_RST;
> @@ -834,6 +862,10 @@ static void allwinner_sdhost_reset(DeviceState *dev)
>      }
>
>      s->status_crc =3D REG_SD_CRC_STA_RST;
> +
> +    if (sc->can_calibrate) {
> +        s->sample_delay =3D REG_SD_SAMPLE_DL_RST;
> +    }
>  }
>
>  static void allwinner_sdhost_bus_class_init(ObjectClass *klass, void
> *data)
> @@ -867,6 +899,24 @@ static void
> allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
>      sc->is_sun4i =3D false;
>  }
>
> +static void allwinner_sdhost_sun50i_a64_class_init(ObjectClass *klass,
> +                                                   void *data)
> +{
> +    AwSdHostClass *sc =3D AW_SDHOST_CLASS(klass);
> +    sc->max_desc_size =3D 64 * KiB;
> +    sc->is_sun4i =3D false;
> +    sc->can_calibrate =3D true;
>

perhaps in the other two existing _init() functions for sun4i/sun5i, we
should also explicitly set the new can_calibrate value to false,
to avoid the risk of using uninitialized data in the other machines/socs.


> +}
> +
> +static void allwinner_sdhost_sun50i_a64_emmc_class_init(ObjectClass
> *klass,
> +                                                        void *data)
> +{
> +    AwSdHostClass *sc =3D AW_SDHOST_CLASS(klass);
> +    sc->max_desc_size =3D 8 * KiB;
> +    sc->is_sun4i =3D false;
> +    sc->can_calibrate =3D true;
> +}
> +
>  static const TypeInfo allwinner_sdhost_info =3D {
>      .name          =3D TYPE_AW_SDHOST,
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
> @@ -889,6 +939,18 @@ static const TypeInfo allwinner_sdhost_sun5i_info =
=3D {
>      .class_init    =3D allwinner_sdhost_sun5i_class_init,
>  };
>
> +static const TypeInfo allwinner_sdhost_sun50i_a64_info =3D {
> +    .name          =3D TYPE_AW_SDHOST_SUN50I_A64,
> +    .parent        =3D TYPE_AW_SDHOST,
> +    .class_init    =3D allwinner_sdhost_sun50i_a64_class_init,
> +};
> +
> +static const TypeInfo allwinner_sdhost_sun50i_a64_emmc_info =3D {
> +    .name          =3D TYPE_AW_SDHOST_SUN50I_A64_EMMC,
> +    .parent        =3D TYPE_AW_SDHOST,
> +    .class_init    =3D allwinner_sdhost_sun50i_a64_emmc_class_init,
> +};
> +
>  static const TypeInfo allwinner_sdhost_bus_info =3D {
>      .name =3D TYPE_AW_SDHOST_BUS,
>      .parent =3D TYPE_SD_BUS,
> @@ -901,6 +963,8 @@ static void allwinner_sdhost_register_types(void)
>      type_register_static(&allwinner_sdhost_info);
>      type_register_static(&allwinner_sdhost_sun4i_info);
>      type_register_static(&allwinner_sdhost_sun5i_info);
> +    type_register_static(&allwinner_sdhost_sun50i_a64_info);
> +    type_register_static(&allwinner_sdhost_sun50i_a64_emmc_info);
>      type_register_static(&allwinner_sdhost_bus_info);
>  }
>
> diff --git a/include/hw/sd/allwinner-sdhost.h
> b/include/hw/sd/allwinner-sdhost.h
> index 30c1e60404..1b951177dd 100644
> --- a/include/hw/sd/allwinner-sdhost.h
> +++ b/include/hw/sd/allwinner-sdhost.h
> @@ -38,6 +38,12 @@
>  /** Allwinner sun5i family and newer (A13, H2+, H3, etc) */
>  #define TYPE_AW_SDHOST_SUN5I TYPE_AW_SDHOST "-sun5i"
>
> +/** Allwinner sun50i-a64 */
> +#define TYPE_AW_SDHOST_SUN50I_A64 TYPE_AW_SDHOST "-sun50i-a64"
> +
> +/** Allwinner sun50i-a64 emmc */
> +#define TYPE_AW_SDHOST_SUN50I_A64_EMMC  TYPE_AW_SDHOST "-sun50i-a64-emmc=
"
> +
>  /** @} */
>
>  /**
> @@ -110,6 +116,7 @@ struct AwSdHostState {
>      uint32_t startbit_detect;   /**< eMMC DDR Start Bit Detection Contro=
l
> */
>      uint32_t response_crc;      /**< Response CRC */
>      uint32_t data_crc[8];       /**< Data CRC */
> +    uint32_t sample_delay;      /**< Sample delay control */
>      uint32_t status_crc;        /**< Status CRC */
>
>      /** @} */
> @@ -132,6 +139,8 @@ struct AwSdHostClass {
>      size_t max_desc_size;
>      bool   is_sun4i;
>
> +    /** does the IP block support autocalibration? */
> +    bool can_calibrate;
>  };
>
>  #endif /* HW_SD_ALLWINNER_SDHOST_H */
> --
> 2.25.1
>
>
In this patch, I don't see any update to the new allwinner-r40.c file.
If you make the required changes to allwinner-r40.c in this patch, you can
also avoid having patch 08.

Regards,
Niek

--=20
Niek Linnenbank

--000000000000fc2a9005f8b09ee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 28, 2023 at 7:47=E2=80=AF=
AM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfanguijin@163.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" target=3D"_blank"=
>qianfanguijin@163.com</a>&gt;<br>
<br>
A64&#39;s sd register was similar to H3, and it introduced a new register<b=
r>
named SAMP_DL_REG location at 0x144. The dma descriptor buffer size of<br>
mmc2 is only 8K and the other mmc controllers has 64K.<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br>
---<br>
=C2=A0hw/sd/allwinner-sdhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 70 ++++++=
++++++++++++++++++++++++--<br>
=C2=A0include/hw/sd/allwinner-sdhost.h |=C2=A0 9 ++++<br>
=C2=A02 files changed, 76 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c<br>
index 51e5e90830..38e7844399 100644<br>
--- a/hw/sd/allwinner-sdhost.c<br>
+++ b/hw/sd/allwinner-sdhost.c<br>
@@ -77,6 +77,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_DATA1_CRC=C2=A0 =3D 0x12C, /* CRC Data 1 from ca=
rd/eMMC */<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_DATA0_CRC=C2=A0 =3D 0x130, /* CRC Data 0 from ca=
rd/eMMC */<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_CRC_STA=C2=A0 =C2=A0 =3D 0x134, /* CRC status fr=
om card/eMMC during write */<br>
+=C2=A0 =C2=A0 REG_SD_SAMP_DL=C2=A0 =C2=A0 =3D 0x144, /* Sample Delay Contr=
ol (sun50i-a64) */<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_FIFO=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x200, /* Rea=
d/Write FIFO */<br>
=C2=A0};<br>
<br>
@@ -158,6 +159,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_RES_CRC_RST=C2=A0 =C2=A0 =C2=A0 =3D 0x0,<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_DATA_CRC_RST=C2=A0 =C2=A0 =C2=A0=3D 0x0,<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_CRC_STA_RST=C2=A0 =C2=A0 =C2=A0 =3D 0x0,<br>
+=C2=A0 =C2=A0 REG_SD_SAMPLE_DL_RST=C2=A0 =C2=A0 =3D 0x00002000,<br>
=C2=A0 =C2=A0 =C2=A0REG_SD_FIFO_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
0,<br>
=C2=A0};<br>
<br>
@@ -438,6 +440,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwa=
ddr offset,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState *s =3D AW_SDHOST(opaque);<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostClass *sc =3D AW_SDHOST_GET_CLASS(s);<br>
+=C2=A0 =C2=A0 bool out_of_bounds =3D false;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t res =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (offset) {<br>
@@ -556,13 +559,24 @@ static uint64_t allwinner_sdhost_read(void *opaque, h=
waddr offset,<br>
=C2=A0 =C2=A0 =C2=A0case REG_SD_FIFO:=C2=A0 =C2=A0 =C2=A0 /* Read/Write FIF=
O */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D allwinner_sdhost_fifo_read(s);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case REG_SD_SAMP_DL: /* Sample Delay */<br></blockquote><div=
>Sample Delay Control<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sc-&gt;can_calibrate) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D s-&gt;sample_delay;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_of_bounds =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: out-o=
f-bounds offset %&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 HWADDR_PRIx&quot;\n&quot;, __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out_of_bounds =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (out_of_bounds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: out-o=
f-bounds offset %&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 HWADDR_PRIx&quot;\n&quot;, __func__, offset);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0trace_allwinner_sdhost_read(offset, res, size);<br>
=C2=A0 =C2=A0 =C2=A0return res;<br>
=C2=A0}<br>
@@ -581,6 +595,7 @@ static void allwinner_sdhost_write(void *opaque, hwaddr=
 offset,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState *s =3D AW_SDHOST(opaque);<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostClass *sc =3D AW_SDHOST_GET_CLASS(s);<br>
+=C2=A0 =C2=A0 bool out_of_bounds =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_allwinner_sdhost_write(offset, value, size);<br>
<br>
@@ -704,10 +719,21 @@ static void allwinner_sdhost_write(void *opaque, hwad=
dr offset,<br>
=C2=A0 =C2=A0 =C2=A0case REG_SD_DATA0_CRC: /* CRC Data 0 from card/eMMC */<=
br>
=C2=A0 =C2=A0 =C2=A0case REG_SD_CRC_STA:=C2=A0 =C2=A0/* CRC status from car=
d/eMMC in write operation */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case REG_SD_SAMP_DL: /* Sample delay control */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sc-&gt;can_calibrate) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sample_delay =3D value;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out_of_bounds =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 out_of_bounds =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (out_of_bounds) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
out-of-bounds offset %&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0HWADDR_PRIx&quot;\n&quot;, __func__, offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -756,6 +782,7 @@ static const VMStateDescription vmstate_allwinner_sdhos=
t =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT32(response_crc, AwSdHostStat=
e),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT32_ARRAY(data_crc, AwSdHostSt=
ate, 8),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT32(status_crc, AwSdHostState)=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(sample_delay, AwSdHostState),<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST()<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
@@ -794,6 +821,7 @@ static void allwinner_sdhost_realize(DeviceState *dev, =
Error **errp)<br>
=C2=A0static void allwinner_sdhost_reset(DeviceState *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState *s =3D AW_SDHOST(dev);<br>
+=C2=A0 =C2=A0 AwSdHostClass *sc =3D AW_SDHOST_GET_CLASS(s);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;global_ctl =3D REG_SD_GCTL_RST;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;clock_ctl =3D REG_SD_CKCR_RST;<br>
@@ -834,6 +862,10 @@ static void allwinner_sdhost_reset(DeviceState *dev)<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;status_crc =3D REG_SD_CRC_STA_RST;<br>
+<br>
+=C2=A0 =C2=A0 if (sc-&gt;can_calibrate) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sample_delay =3D REG_SD_SAMPLE_DL_RST;<b=
r>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void allwinner_sdhost_bus_class_init(ObjectClass *klass, void =
*data)<br>
@@ -867,6 +899,24 @@ static void allwinner_sdhost_sun5i_class_init(ObjectCl=
ass *klass, void *data)<br>
=C2=A0 =C2=A0 =C2=A0sc-&gt;is_sun4i =3D false;<br>
=C2=A0}<br>
<br>
+static void allwinner_sdhost_sun50i_a64_class_init(ObjectClass *klass,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *data)<br>
+{<br>
+=C2=A0 =C2=A0 AwSdHostClass *sc =3D AW_SDHOST_CLASS(klass);<br>
+=C2=A0 =C2=A0 sc-&gt;max_desc_size =3D 64 * KiB;<br>
+=C2=A0 =C2=A0 sc-&gt;is_sun4i =3D false;<br>
+=C2=A0 =C2=A0 sc-&gt;can_calibrate =3D true;<br></blockquote><div><br></di=
v><div>perhaps in the other two existing _init() functions for sun4i/sun5i,=
 we should also explicitly set the new can_calibrate value to false,</div><=
div>to avoid the risk of using uninitialized data in the other machines/soc=
s.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+}<br>
+<br>
+static void allwinner_sdhost_sun50i_a64_emmc_class_init(ObjectClass *klass=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data)<br>
+{<br>
+=C2=A0 =C2=A0 AwSdHostClass *sc =3D AW_SDHOST_CLASS(klass);<br>
+=C2=A0 =C2=A0 sc-&gt;max_desc_size =3D 8 * KiB;<br>
+=C2=A0 =C2=A0 sc-&gt;is_sun4i =3D false;<br>
+=C2=A0 =C2=A0 sc-&gt;can_calibrate =3D true;<br>
+}<br>
+<br>
=C2=A0static const TypeInfo allwinner_sdhost_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_SDH=
OST,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
@@ -889,6 +939,18 @@ static const TypeInfo allwinner_sdhost_sun5i_info =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D allwinner_sdhost_sun5i_cla=
ss_init,<br>
=C2=A0};<br>
<br>
+static const TypeInfo allwinner_sdhost_sun50i_a64_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_SDHOST_S=
UN50I_A64,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_SDHOST,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_sdhost_sun50i_a64_cla=
ss_init,<br>
+};<br>
+<br>
+static const TypeInfo allwinner_sdhost_sun50i_a64_emmc_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_SDHOST_S=
UN50I_A64_EMMC,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_SDHOST,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_sdhost_sun50i_a64_emm=
c_class_init,<br>
+};<br>
+<br>
=C2=A0static const TypeInfo allwinner_sdhost_bus_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name =3D TYPE_AW_SDHOST_BUS,<br>
=C2=A0 =C2=A0 =C2=A0.parent =3D TYPE_SD_BUS,<br>
@@ -901,6 +963,8 @@ static void allwinner_sdhost_register_types(void)<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;allwinner_sdhost_info);<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;allwinner_sdhost_sun4i_info);=
<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;allwinner_sdhost_sun5i_info);=
<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_sdhost_sun50i_a64_info);=
<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_sdhost_sun50i_a64_emmc_i=
nfo);<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;allwinner_sdhost_bus_info);<b=
r>
=C2=A0}<br>
<br>
diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdh=
ost.h<br>
index 30c1e60404..1b951177dd 100644<br>
--- a/include/hw/sd/allwinner-sdhost.h<br>
+++ b/include/hw/sd/allwinner-sdhost.h<br>
@@ -38,6 +38,12 @@<br>
=C2=A0/** Allwinner sun5i family and newer (A13, H2+, H3, etc) */<br>
=C2=A0#define TYPE_AW_SDHOST_SUN5I TYPE_AW_SDHOST &quot;-sun5i&quot;<br>
<br>
+/** Allwinner sun50i-a64 */<br>
+#define TYPE_AW_SDHOST_SUN50I_A64 TYPE_AW_SDHOST &quot;-sun50i-a64&quot;<b=
r>
+<br>
+/** Allwinner sun50i-a64 emmc */<br>
+#define TYPE_AW_SDHOST_SUN50I_A64_EMMC=C2=A0 TYPE_AW_SDHOST &quot;-sun50i-=
a64-emmc&quot;<br>
+<br>
=C2=A0/** @} */<br>
<br>
=C2=A0/**<br>
@@ -110,6 +116,7 @@ struct AwSdHostState {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t startbit_detect;=C2=A0 =C2=A0/**&lt; eMMC DDR =
Start Bit Detection Control */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t response_crc;=C2=A0 =C2=A0 =C2=A0 /**&lt; Resp=
onse CRC */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t data_crc[8];=C2=A0 =C2=A0 =C2=A0 =C2=A0/**&lt;=
 Data CRC */<br>
+=C2=A0 =C2=A0 uint32_t sample_delay;=C2=A0 =C2=A0 =C2=A0 /**&lt; Sample de=
lay control */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t status_crc;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**&lt;=
 Status CRC */<br>
<br>
=C2=A0 =C2=A0 =C2=A0/** @} */<br>
@@ -132,6 +139,8 @@ struct AwSdHostClass {<br>
=C2=A0 =C2=A0 =C2=A0size_t max_desc_size;<br>
=C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0is_sun4i;<br>
<br>
+=C2=A0 =C2=A0 /** does the IP block support autocalibration? */<br>
+=C2=A0 =C2=A0 bool can_calibrate;<br>
=C2=A0};<br>
<br>
=C2=A0#endif /* HW_SD_ALLWINNER_SDHOST_H */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><div><br></div><div>In this patch, I don&#39;t see any u=
pdate to the new allwinner-r40.c file.</div><div>If you make the required c=
hanges to allwinner-r40.c in this patch, you can also avoid having patch 08=
.</div><div><br></div><div>Regards,</div><div>Niek<br></div><br><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div></=
div>

--000000000000fc2a9005f8b09ee2--

