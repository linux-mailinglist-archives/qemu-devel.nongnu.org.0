Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C306D669905
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:49:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKPE-0004u6-5V; Fri, 13 Jan 2023 08:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKPB-0004sL-Pk
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:47:37 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKP6-0006lS-7D
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:47:37 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so27050732pjk.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sbpsFKFFu6ZGgnZb8YI2F3d/1H2vp2vVd/08wFYCu8=;
 b=YMVTXgsMwDN402buUlIHDgWCewqCkSoL/pUSPZkNi2+pjAs3xW0tC3JrDDFXjDFV4C
 cU6Ql3Bqk61LkJ8y+DupkVcfnXZjmpdw5MzNSb6AlSt3aLxyEq0vI/p87y5pmia5t7Yl
 uz7UWlsq6UlKZVSiZLKtnpYd3mHpnZphZ0feknMz3mA1X1HeCj+Ef2PgjzliOg9CV0Ov
 ucprMlKDDBuf/AxrBJwqkxX5BUEs6bPBCEaqQGraxhBO0Z/pkLKOMrMzgZIMeAVC0MNx
 65ogmV1adj4WawmhTMaboMpNfbnjqNEts2iIcBo0y0EIRZQziDnzJPts6qVaHUHL2fwF
 Nz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sbpsFKFFu6ZGgnZb8YI2F3d/1H2vp2vVd/08wFYCu8=;
 b=gmzX9Ge5wlSzJl69h9fc5BGh28uepvOPkDHd8JFm7+ag0xRBN8cVODGBWW2zKD7ou6
 fzLMQ8itO7pQSDSHvswaquR2pD8vbtmxuHJakc4uo1aiNCT9L/PRpNs55IY5TzTn07kb
 /RLF/us7IAG4k/nT51Z7q5aBuiETAOoHL9p1X0FAxKoAtnuV7w0wsOyqI0sEq4YbGaMU
 HmvjZ0qDCLg5vEEY/Q/nedDGFeT8t4jWq+s/Wul8Zt7RKjQyzE81Pc5xD6/wR/QUfzbs
 Nw5jo40ZvqfB38t8p/ZLv5GDjAuQTC+xVEKg3BfZCljVdWcxjVx8Fmld99flt/d+gcuk
 n9qQ==
X-Gm-Message-State: AFqh2kq1wafueUWvkXkavoXjgx3cdUf+JJ4KpxFIlVj3c6KRNGsju9ts
 lNl4kwGmKx9Us5yZ6gW1QjyOT1isnGGnCsiuw35Ntg==
X-Google-Smtp-Source: AMrXdXsqN01haLx9p7WnjuvsBNJyK+V/+YBXxt5oij5WbdvE0vle58hXisDI/8BOcPEHFyH5jWlcnDxQYs1FFVWRPdw=
X-Received: by 2002:a17:90b:2304:b0:229:189b:6fee with SMTP id
 mt4-20020a17090b230400b00229189b6feemr378649pjb.221.1673617650611; Fri, 13
 Jan 2023 05:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-12-philmd@linaro.org>
In-Reply-To: <20230109120833.3330-12-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:47:18 +0000
Message-ID: <CAFEAcA8d99EHucuroYqRCs_1TRFQ58Hra7h=HFgsA1OjGPOazw@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] hw/arm/digic: Open-code pflash_cfi02_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Mon, 9 Jan 2023 at 12:31, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
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
>  hw/arm/digic_boards.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 4093af09cb..3700f05ecc 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -30,6 +30,7 @@
>  #include "qemu/error-report.h"
>  #include "hw/arm/digic.h"
>  #include "hw/block/flash.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/loader.h"
>  #include "sysemu/qtest.h"
>  #include "qemu/units.h"
> @@ -115,13 +116,26 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s=
, hwaddr addr,
>  {
>  #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
>  #define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
> +    DeviceState *dev;
>
> -    pflash_cfi02_register(addr, "pflash", FLASH_K8P3215UQB_SIZE,
> -                          NULL, FLASH_K8P3215UQB_SECTOR_SIZE,
> -                          DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE,
> -                          4,
> -                          0x00EC, 0x007E, 0x0003, 0x0001,
> -                          0x0555, 0x2aa, 0);
> +    dev =3D qdev_new(TYPE_PFLASH_CFI02);
> +    qdev_prop_set_string(dev, "name", "pflash");
> +    qdev_prop_set_drive(dev, "drive", NULL);
> +    qdev_prop_set_uint32(dev, "num-blocks",
> +                         FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR=
_SIZE);
> +    qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_S=
IZE);
> +    qdev_prop_set_uint8(dev, "device-width",
> +                        DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE);
> +    qdev_prop_set_uint8(dev, "mappings", 4);
> +    qdev_prop_set_uint8(dev, "big-endian", false);
> +    qdev_prop_set_uint16(dev, "id0", 0x00ec);
> +    qdev_prop_set_uint16(dev, "id1", 0x007e);
> +    qdev_prop_set_uint16(dev, "id2", 0x0003);
> +    qdev_prop_set_uint16(dev, "id3", 0x0001);
> +    qdev_prop_set_uint16(dev, "unlock-addr0", 0x555);
> +    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
(give or take whether we choose to rename the 'width' property.)

Not for this patch, but I'm a bit unsure about the
use of DIGIC4_ROM_MAX_SIZE / FLASH_K8P3215UQB_SIZE to
calculate width. This gives us a value of 2, which is
correct given the comment that says it's a 4Mx16 flash,
but maybe it would be clearer just to set the value of
'width' to 2 directly?

thanks
-- PMM

