Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB5B669932
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:57:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKXL-0001PD-2x; Fri, 13 Jan 2023 08:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKXJ-0001P5-9R
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:56:01 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKXH-00009e-Mg
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:56:01 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so27072738pjk.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMKxo6pcsBGPdG4+orzoDPMtBuWrfIp+blSc44PYE6Y=;
 b=SiSEDm2c6XTPDny55hAn5FeYrROEtrZnguUFmiFTI3auv5qJwcuo6F2Av76QPe7XzU
 zdfFHZc3S9FD1uZh2adv0J0Hh0J43w1ACgJZn3VcKhSTepAa45NrUbpWSeOTB/EswW77
 aaM36pGxSDRo0aXSvoBPkkcZp12fK2eeOyGTPe8wHDkkLPaxNx84+TdaqlNcTq/NBVu8
 0P4Y+e2YrryLuaMyZRwQ+Ttx4uQcPH2AmmZs+Qxn9so5m1SsDK1Ck/bRqtE5dU+nE4Hd
 XoinBvO4Vg6YKmkJYF6AuAXtHbQ91120DGcRoxJF7lKctQVnSAkAkPG5pAeDeHZCzWqa
 OUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMKxo6pcsBGPdG4+orzoDPMtBuWrfIp+blSc44PYE6Y=;
 b=A9Uao8kJg9hz3XlwyubEtRz7VoUV9GNzOJlzbFNNmwoNrpT/e7mzth0Yes6rjFeniq
 EaKwp9evt3eTicSkyT8nGT7I3xUrfY+a72n+oK5sWAadmFikOmcnyMorwBr1OQaBrffZ
 oAyuwgRQZu7LqE0GzaNhDzyPMTr3ROn3p/m+nTceyiKUXaEQraAPc3cElIVbmhaAG1bO
 1WxfJ7cCoEr412AvrYKfU0q0qFPII78g27gg9rHPbzI0jPAT7dcPtiHgBhMoaBYPaLjJ
 ywvNQOA6Qty9FKlYvRAFVJp3BDJqGChEKp3wTgiY8smLTnSMTAIZuP5eNA8/9XJNE71x
 /G+w==
X-Gm-Message-State: AFqh2kocJmLHBYC3VOhpp8ImD9PuP2bfAmEk+ipwC0M5fpS+6nU/CEKB
 dx6t+Dcugx+S6joxoxcVnhjEgIgUM0fR3Eqrh/dfNg==
X-Google-Smtp-Source: AMrXdXtTgOZye371KZuh7zAFcwbLbTtEI3FVHW+yhkWpVlOGCDdwd7AuKUsjxzo+srmMfkPG42ImSSzshaLgjjbkxtc=
X-Received: by 2002:a17:902:b287:b0:192:ff91:98b6 with SMTP id
 u7-20020a170902b28700b00192ff9198b6mr1712960plr.90.1673618157853; Fri, 13 Jan
 2023 05:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-14-philmd@linaro.org>
In-Reply-To: <20230109120833.3330-14-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:55:46 +0000
Message-ID: <CAFEAcA9ytyFkSczBzUggphfToXoybU0bPHdS4qcFP_irj=YAbQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/21] hw/arm/xilinx_zynq: Open-code
 pflash_cfi02_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 9 Jan 2023 at 12:20, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> pflash_cfi02_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove pflash_cfi02_register() from the pflash API, open-code it
> as a qdev creation call followed by an explicit sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 3190cc0b8d..201ca697ec 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -218,11 +218,21 @@ static void zynq_init(MachineState *machine)
>      DriveInfo *dinfo =3D drive_get(IF_PFLASH, 0, 0);
>
>      /* AMD */
> -    pflash_cfi02_register(0xe2000000, "zynq.pflash", FLASH_SIZE,
> -                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> -                          FLASH_SECTOR_SIZE, 1,
> -                          1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2=
aa,
> -                          0);
> +    dev =3D qdev_new(TYPE_PFLASH_CFI02);
> +    qdev_prop_set_string(dev, "name", "zynq.pflash");
> +    qdev_prop_set_drive(dev, "drive",
> +                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
> +    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / FLASH_SECTOR_SI=
ZE);
> +    qdev_prop_set_uint32(dev, "sector-length", FLASH_SECTOR_SIZE);
> +    qdev_prop_set_uint8(dev, "device-width", 1);
> +    qdev_prop_set_uint8(dev, "mappings", 1);
> +    qdev_prop_set_uint8(dev, "big-endian", false);
> +    qdev_prop_set_uint16(dev, "id0", 0x0066);
> +    qdev_prop_set_uint16(dev, "id1", 0x0022);
> +    qdev_prop_set_uint16(dev, "unlock-addr0", 0x555);
> +    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xe2000000);

What's the difference between setting "mappings" to 0 vs 1?

I was expecting that this could leave the "mappings" property
unset and at its default value, but the default is 0, not 1.
I think if I'm reading the cfi02 code right that the device
treats both 0 and 1 identically, though (meaning "don't set up
the mappings that repeat mirrors of the device across
the memory region"). If that's the case then we could just
drop the setting of 'mappings' here and add a note in the
commit message that 0 (the default) and 1 behave the same
so we don't need to explicitly set the property.

(I think this is the only use which sets mappings to 1,
and no users set it to 0.)

Either way
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

