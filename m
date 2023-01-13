Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B2C66990F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:51:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKRf-0006WC-4Y; Fri, 13 Jan 2023 08:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKQa-0005jg-VD
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:49:11 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKQU-0006xy-Cl
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:49:03 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a184so16203836pfa.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vpu0rgoBlqyTmhTIG+RK1EP8Jt6BASvZW1YYXrzT4ks=;
 b=BEwERWM3w+AMu6Gh31h/DyR+TXQbHwJGy3mVE1ELIP29lCDWJmadvkDnjw0KqJT+2n
 bxZyxPrFN5MAuAxX5LceFbz45xVMLXyoC22DpHpFOV/hs2MCkwmGyR2WZSvJTNJ4DAqA
 Ltcq4SRUPbJgG+BunGyyNlzLMz7ifc227iThoPo24g4g7t7AThXZZxvMOH6uvaK8bTSY
 eMICuE5LEg4rQul/R+kSL8plqyDbmo83mqeH3gfWpi93Ji2HGytI2N7yhOQKMzxjX3W+
 xdacq4kTWGrqiIOl1kp3JqG6dXYVmCu4pyFlEHIpme45pCyG09ZaYht7M9/STB5OyzhP
 O3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpu0rgoBlqyTmhTIG+RK1EP8Jt6BASvZW1YYXrzT4ks=;
 b=lXz2j8Bhy0n3Q4qTCtp2B5YvBfsDD/bUF9G5FdWtYSdtfGkYRGn0BKwTdJIhRgh7V8
 Jn7QP+CQ6stqHeOt8/3VIs0T7MvtwcC+NY8ILrI+yEyyGDJpNhRbt9tzXulmrLUEuAFv
 VDQ02Psdmh27DpBlYm3rntL7ZJWpMkFfkhZicJu4ElRhDy4UcY/DdYQbMivnxN7dM5Kz
 9JmT63HivtpzfMGPvYSFajF8lJWyGY45txVChkNPQZbOU+HItFMtrhEH0KGZHrctYpbM
 BUqmxTznOHikmvnWum4HAKp9MN5M05EPg8quJ/n6Vt6G7A3b54aH+aZDMpiJFU66UF+r
 9Tgw==
X-Gm-Message-State: AFqh2kq9TFEwmDTyHLVjlmBJKSko6dgIrehJUZaFYsAfZI1uZMOky60S
 7JsDmKPYswSg+fPShxBJcNHbx3l/CdDZGJUNWlmSoQ==
X-Google-Smtp-Source: AMrXdXsK/cCcFyUFIVR1BWWSH3U6yQwSJDaria9RPDeEXnl0caz6rVYXaDelyDrFSfJVgGRAWeNnR6LAoV0gXXYidQs=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1402792pgd.192.1673617736743; Fri, 13
 Jan 2023 05:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-13-philmd@linaro.org>
In-Reply-To: <20230109120833.3330-13-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:48:45 +0000
Message-ID: <CAFEAcA9dd7Ygasn-vjh+5ZDrayCUw1Hh-u7cS9t3HsfAeeLXAw@mail.gmail.com>
Subject: Re: [PATCH v2 12/21] hw/arm/musicpal: Open-code
 pflash_cfi02_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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

On Mon, 9 Jan 2023 at 12:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
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
>  hw/arm/musicpal.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 73e2b7e4ce..b5f2b9d9de 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1278,12 +1278,21 @@ static void musicpal_init(MachineState *machine)
>           * 0xFF800000 (if there is 8 MB flash). So remap flash access if=
 the
>           * image is smaller than 32 MB.
>           */
> -        pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
> -                              "musicpal.flash", flash_size,
> -                              blk, FLASH_SECTOR_SIZE,
> -                              MP_FLASH_SIZE_MAX / flash_size,
> -                              2, 0x00BF, 0x236D, 0x0000, 0x0000,
> -                              0x5555, 0x2AAA, 0);
> +        dev =3D qdev_new(TYPE_PFLASH_CFI02);
> +        qdev_prop_set_string(dev, "name", "musicpal.flash");
> +        qdev_prop_set_drive(dev, "drive", blk);
> +        qdev_prop_set_uint32(dev, "num-blocks", flash_size / FLASH_SECTO=
R_SIZE);
> +        qdev_prop_set_uint32(dev, "sector-length", FLASH_SECTOR_SIZE);
> +        qdev_prop_set_uint8(dev, "device-width", 2);
> +        qdev_prop_set_uint8(dev, "mappings", MP_FLASH_SIZE_MAX / flash_s=
ize);
> +        qdev_prop_set_uint8(dev, "big-endian", false);
> +        qdev_prop_set_uint16(dev, "id0", 0x00bf);
> +        qdev_prop_set_uint16(dev, "id1", 0x236d);
> +        qdev_prop_set_uint16(dev, "unlock-addr0", 0x5555);
> +        qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aaa);
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
> +                        0x100000000ULL - MP_FLASH_SIZE_MAX);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

