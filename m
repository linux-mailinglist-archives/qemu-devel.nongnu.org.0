Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7E58CFBB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:33:48 +0200 (CEST)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLANf-0002JP-UZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1oLAIT-0006NS-88
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:28:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1oLAIN-0000ie-RN
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:28:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id q30so12225710wra.11
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc;
 bh=i7aLZBzX/VueIll13gdwWAufXZi6UvA/3xPKiBV4yhg=;
 b=KFIM3X/OqwWXkiuO/oSPbpudOd0TIk1R4DdpLS/Xp4EP+dZEVeI+Yvona4t5yu1y1l
 Lfs5uZUIrIpl1dDjCq36VZdJqcIbgtkdNw0DpuH3EPnBMr4ip8SAIwRh4Ilwl2whTZxF
 39WDsfRCqlAukD0wyxhAa1xPwQxmMUTYo6u79BiWCJ3BLlAbemkFKKfKXIID5ZrSx1/2
 6OvnKtK2BF/moQTdTh/+BO+rFAcoBBFMXlJK5/IbKsSjfN9QShsTM6yTSE5l7ivSlrmC
 ztxjUoUNtqZnbRq/A9cy961oUZTW4nsbkAL3d+NDIYbJSfcoGxdkULuNqXF4Tv0gd3WJ
 ns6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
 bh=i7aLZBzX/VueIll13gdwWAufXZi6UvA/3xPKiBV4yhg=;
 b=jyl792UHZgmyOCDmlDA1nj3RLcbWNtDJQ5MG9PAU6fXGsXOSIUgpa5MHVKUn4/nisZ
 3BR2a+Oo/ZidFbqCGevmqeAAYjgJkTU4QDmIjRlwuRCMA9fhlndd7Y1bYLfDO1CcF6Px
 r/iy9IpTemUBewW2P7AG+ooC5FPcmomsc48KIEHINz7lMwntT5jvgOjEh1+xWt9b4tHr
 /chAhnKFDio5ikCd5169Rvr2oA1YOC0A3Ui8Y/XhfgqXC4n6FStrdc6nD9jQ+2SOruOT
 LIyYjJG9AQMozDSiuEyEo2uctLvSKx57JGs0ScfjfWrtjQE7uSKWY/Dr7xy88igW6VEz
 QK7g==
X-Gm-Message-State: ACgBeo3skUsNnGq9yuCgvfuaIhAFPSsXzhOCNPaUFEInTpAs8s9VhXuk
 LHLvv3u6FHQ9WILVbnd+m8DCsg==
X-Google-Smtp-Source: AA6agR4DQZ8bkSuxcJF32aGE0rzuknem9jxFkpyGqu+SX71Jlf09Ux9CYHmk/YomBYV4cag9aKPjng==
X-Received: by 2002:adf:d1e8:0:b0:223:bca:8019 with SMTP id
 g8-20020adfd1e8000000b002230bca8019mr2737187wrd.562.1659994097412; 
 Mon, 08 Aug 2022 14:28:17 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk.
 [131.111.5.141]) by smtp.gmail.com with ESMTPSA id
 w15-20020adfec4f000000b0021e6b62fde2sm11996117wrn.59.2022.08.08.14.28.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Aug 2022 14:28:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220808210643.2192602-4-mail@conchuod.ie>
Date: Mon, 8 Aug 2022 22:28:16 +0100
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, qemu-riscv@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4BA66590-3A82-4B5C-829B-67F8B5D5029D@jrtc27.com>
References: <20220808210643.2192602-1-mail@conchuod.ie>
 <20220808210643.2192602-4-mail@conchuod.ie>
To: Conor Dooley <mail@conchuod.ie>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8 Aug 2022, at 22:06, Conor Dooley <mail@conchuod.ie> wrote:
>=20
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The subnodes of the syscon have been added to the incorrect paths.
> Rather than add them as subnodes, they were originally added to "/foo"
> and a later patch moved them to "/soc/foo". Both are incorrect & they
> should have been added as "/soc/test@###/foo" as "/soc/test" is the
> syscon node. Fix both the reboot and poweroff subnodes to avoid errors
> such as:
>=20
> /stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': =
[[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be =
valid under {'type': 'object'}
>        =46rom schema: =
/home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus=
.yaml
> /stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': =
[[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be =
valid under {'type': 'object'}
>        =46rom schema: =
/home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus=
.yaml
>=20
> Reported-by: Rob Herring <robh@kernel.org>
> Link: =
https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.o=
rg/
> Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA =
sockets")
> Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT =
nodes")
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

This breaks FreeBSD=E2=80=99s driver (well, it just won=E2=80=99t =
probe/attach), which
is written to handle syscon-poweroff/reboot existing as a child of a
simplebus not a syscon. Moreover, what is the point of regmap in this
case? Its existence suggests the point is for them to *not* be children
of the syscon, otherwise you wouldn=E2=80=99t need an explicit phandle, =
you=E2=80=99d
just look at the parent. Moving the nodes whilst keeping the property
doesn=E2=80=99t make sense to me.

Jess

> ---
> hw/riscv/virt.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8b2978076e..a98b054545 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -896,7 +896,8 @@ static void create_fdt_reset(RISCVVirtState *s, =
const MemMapEntry *memmap,
>     test_phandle =3D qemu_fdt_get_phandle(mc->fdt, name);
>     g_free(name);
>=20
> -    name =3D g_strdup_printf("/soc/reboot");
> +    name =3D g_strdup_printf("/soc/test@%lx/reboot",
> +        (long)memmap[VIRT_TEST].base);
>     qemu_fdt_add_subnode(mc->fdt, name);
>     qemu_fdt_setprop_string(mc->fdt, name, "compatible", =
"syscon-reboot");
>     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> @@ -904,7 +905,8 @@ static void create_fdt_reset(RISCVVirtState *s, =
const MemMapEntry *memmap,
>     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
>     g_free(name);
>=20
> -    name =3D g_strdup_printf("/soc/poweroff");
> +    name =3D g_strdup_printf("/soc/test@%lx/poweroff",
> +        (long)memmap[VIRT_TEST].base);
>     qemu_fdt_add_subnode(mc->fdt, name);
>     qemu_fdt_setprop_string(mc->fdt, name, "compatible", =
"syscon-poweroff");
>     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
> --=20
> 2.37.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


