Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0276D67F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:54:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjizD-0002M9-Hp; Tue, 04 Apr 2023 11:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjizB-0002LZ-FR
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:54:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjiz9-0005Oh-Bg
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:54:17 -0400
Received: by mail-ed1-x533.google.com with SMTP id h8so132574850ede.8
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7uN3p4wwSGCEqw4iaI9GVBzbptRL9e8O3Et6SZgxKw=;
 b=tgFYX01ADPRskN/UQEXeGyefwrH+5K2Hb7IoJ6hS4nNVri87/pLqMvEiBUmKm0/qNO
 UKuAKGCiDWQ/Q0gIgYTdLSAJmYMsXQ5JVw9eVLJ31WGqUJ8XCGnNQqSFUYQMbM/NmqHi
 THZXKcAHBi+OlwHaylinBhNK0rRnJ9FUYEU/t0R77AniBoQRCTQUo9DgD9hOJ/sR8LjO
 V9bD/RlrjxQRmQ3Xpf+74W9pbN5mpqAjS3D+9I/bJ3Mh2tZCmAKg0floIMlzH9c8Pg6o
 ed3fRE3Mh6QSwBwAzU165ThkiGvoNGWvJ2OxPL9v+mqQ7yE73iLJx/BF1oZTiGURv/Mt
 Cl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7uN3p4wwSGCEqw4iaI9GVBzbptRL9e8O3Et6SZgxKw=;
 b=Luj16dzbf3bHgiWmp8I/K1PSdj20ycH7+URgAtsFnNKhoYAyyKZ+m2Y61C70C6dRdf
 2mYCVfxYB6d9XNfaIkRrhZ8QQKEWWF+hwZH9YrtoMEoNpHpIydTIl7Z4RubizUetF+Vs
 ufATMq+yWQoIh/3VydxWfqBEn5lirSBhvM+QvolGCiCprBRiO7j6CMw6vlTX6BRpnMox
 aqlGj7g13ZtAzckeTejt/QMu5wDrNsV6MXrH3/dE2yxuHTaew8LPYnIgAoTtvtDcLqik
 PM+bDAEMmxcp1xFJrjLvCzyLgBmx9xKUf40OcQU2+SdrmDpyYIEYCWnoTP6zvtKunUKP
 dlrA==
X-Gm-Message-State: AAQBX9dVWcStXCG/qPocNnpHxnGGPHS4n0cS78rrdAelBoZzNOV+fTuc
 T0cdvHRP25eiSkKKyz572piEnasI96is7YCCjrUBig==
X-Google-Smtp-Source: AKy350Y4HnJ4uK9TyP36Lzh5GoGEBq4RjcpKh7UtoU+Tf0fnwyXRYxX9nbMpZwLgzHOSHn1rDpkBS8xYPcpYCow1Qb8=
X-Received: by 2002:a05:6402:a47:b0:502:3e65:44f7 with SMTP id
 bt7-20020a0564020a4700b005023e6544f7mr12059156edb.3.1680623653341; Tue, 04
 Apr 2023 08:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220714154456.2565189-1-clg@kaod.org>
 <20220714154456.2565189-11-clg@kaod.org>
In-Reply-To: <20220714154456.2565189-11-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 16:54:02 +0100
Message-ID: <CAFEAcA_yYuWgsSKc9N7PvHeAWjtSqWwM1z+qJQ1swv3cwCghPg@mail.gmail.com>
Subject: Re: [PULL 10/19] aspeed: fby35: Add a bootrom for the BMC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Delevoryas <peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 14 Jul 2022 at 16:45, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The BMC boots from the first flash device by fetching instructions
> from the flash contents. Add an alias region on 0x0 for this
> purpose. There are currently performance issues with this method (TBs
> being flushed too often), so as a faster alternative, install the
> flash contents as a ROM in the BMC memory space.
>
> See commit 1a15311a12fa ("hw/arm/aspeed: add a 'execute-in-place'
> property to boot directly from CE0")
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> [ clg: blk_pread() fixes ]
> Message-Id: <20220705191400.41632-8-peter@pjd.dev>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Hi; Coverity has noticed a trivial "memory leak" (CID 1508061) in this code=
:

>  static void fby35_bmc_init(Fby35State *s)
>  {
> +    DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
> +
>      memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_M=
AX);
>      memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
>                             FBY35_BMC_RAM_SIZE, &error_abort);
> @@ -48,6 +86,28 @@ static void fby35_bmc_init(Fby35State *s)
>      qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
>
>      aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
> +
> +    /* Install first FMC flash content as a boot rom. */
> +    if (drive0) {
> +        AspeedSMCFlash *fl =3D &s->bmc.fmc.flashes[0];
> +        MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);

Here we allocate a new MemoryRegion...

> +        uint64_t size =3D memory_region_size(&fl->mmio);
> +
> +        if (s->mmio_exec) {
> +            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
> +                                     &fl->mmio, 0, size);
> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWA=
RE_ADDR,
> +                                        boot_rom);
> +        } else {
> +
> +            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
> +                                   size, &error_abort);
> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWA=
RE_ADDR,
> +                                        boot_rom);
> +            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWAR=
E_ADDR,
> +                                     size, &error_abort);
> +        }

...but we never keep a pointer to it anywhere, so Coverity classes
this as a "memory leak". (It's not really one, because the memory
has to stay live for the whole of QEMU's execution anyway.)

The easy fix is not to allocate a new MR, but instead use
a MemoryRegion field in the Fby35State struct, the way we
do for all the other MRs this function sets up. Conveniently,
there already is a "MemoryRegion bmc_boot_rom" in the struct
which is currently completely unused :-)

thanks
-- PMM

