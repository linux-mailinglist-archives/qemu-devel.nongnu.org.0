Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B863B2C94FF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 03:09:48 +0100 (CET)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjv6x-0001dq-OA
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 21:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv5G-0000LC-Cc; Mon, 30 Nov 2020 21:08:02 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:39320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv5D-0000i8-Ir; Mon, 30 Nov 2020 21:08:02 -0500
Received: by mail-il1-x143.google.com with SMTP id q1so163069ilt.6;
 Mon, 30 Nov 2020 18:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uZN0nLXlO91+Yw50cISTLrm/8RP/MMTCyWtXb3ATsq4=;
 b=uGvf7TWCZ52QjWpbvYNTy6oKpFlbMTJU3O7P3/ePmoVcPt7DHivYLzOgucZj+Yd5pK
 WOOWhDIC6F+eMLCpcWKro63mgT1s3BemdVNbwl2Xj50VdgkGAzUT3/yTUi7FOEshL1n2
 nUrX85oUlGCFeSh6LDVNcbT12p5Ntk976VPosMMnes0gn917kuwvQbGNWpgXy/IDTADl
 npIWgcV+lWE0Hu3lyGP2u8FRxP3sXt1CDHUHxLW4o9ImtBHiEzCksk8RhWLLayqWP14L
 WOQt6pBBTNjrLgP2zjcAmTNM/ptTFhs837lV2P6ZmH8oQv5Q85sNqMhRKGZSBOFKTwbW
 LGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uZN0nLXlO91+Yw50cISTLrm/8RP/MMTCyWtXb3ATsq4=;
 b=Y7H4xpOI/AqwTlNytWKsyGMjFmFaawJ3XvsdbbNa3mLKoQwF0WTsnY2Mm7kaaLhmZg
 aSOZHKhcdnIFxTZ7I23Gj+Z8zAj2zeoVcLCREgSTPnB6Pv8Q38+wKcWnchRVYRxTAK1d
 ZW3pdZOvbwpuGQgKByBas1BeQt8G3/Pzoa9oI+lfAhhCHrLz/zuqzFDbHPhAlKbQam0C
 3zUSYLej10IRQ8Hb6ulu1hGP2+86+hDmTFa4wyK8rU++PbLrhLU7wKBgPnKK5nFjFnAv
 9n/ZwgvITp94Zdzx+HtnPiRYfxl0awOshySZgMZbfHUKKXoe6pWQrbnd8odpnKhtA92x
 5KRw==
X-Gm-Message-State: AOAM533VlBctwimJCRMd/uxaJZ4gdXhkjMEHumt8us0s7R+saF1NJvJK
 UZPMc+zHNi9mEoLvEBIsrrFLdFQj1/RWZGFI2TI=
X-Google-Smtp-Source: ABdhPJxbECXBo2VU6j0HMWuWzwIW3uVfkGOmXxu/Midz/3V9m5ZLhIC3NMcmblxbguXc4gMRpxO6rbPxgwklg/bW7PA=
X-Received: by 2002:a92:770f:: with SMTP id s15mr625466ilc.227.1606788478247; 
 Mon, 30 Nov 2020 18:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20201124094941.485767-1-f4bug@amsat.org>
 <20201124094941.485767-5-f4bug@amsat.org>
In-Reply-To: <20201124094941.485767-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 17:55:41 -0800
Message-ID: <CAKmqyKNDjmKK=ZOf1h_cYK31y-A0DzgcMD7oo7ovN=35uKKkXw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 4/4] hw/arm/xilinx_zynq: Add SD bus QOM alias on
 the machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 1:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To be able to select a particular SD bus from the command
> line, add a QOM alias on the machine (using an unique name).
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index b72772bc824..6a4a1de88cf 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -286,6 +286,7 @@ static void zynq_init(MachineState *machine)
>          DriveInfo *di;
>          BlockBackend *blk;
>          DeviceState *carddev;
> +        g_autofree char *bus_name =3D NULL;
>
>          /* Compatible with:
>           * - SD Host Controller Specification Version 2.0 Part A2
> @@ -299,6 +300,11 @@ static void zynq_init(MachineState *machine)
>          sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFF=
SET]);
>
> +        /* Alias controller SD bus to the machine itself */
> +        bus_name =3D g_strdup_printf("sd-bus%d", n);
> +        object_property_add_alias(OBJECT(machine), bus_name,
> +                                  OBJECT(dev), "sd-bus");
> +
>          di =3D drive_get_next(IF_SD);
>          blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
>          carddev =3D qdev_new(TYPE_SD_CARD);
> --
> 2.26.2
>
>

