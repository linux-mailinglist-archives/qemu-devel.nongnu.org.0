Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE044CFD75
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:54:49 +0100 (CET)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBwu-00084Z-8r
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBA3-0001K1-5g
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:04:19 -0500
Received: from [2607:f8b0:4864:20::d30] (port=40761
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRBA1-0003pW-Kn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:04:18 -0500
Received: by mail-io1-xd30.google.com with SMTP id x4so1616238iop.7;
 Mon, 07 Mar 2022 03:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ouAmCle6B3dbO/a12UFjmEanteOsMmT+/TxjMSS+W/M=;
 b=hKj/QB+KMDi5aW3JGCO+0lA2ZWW0GX2kyULzS+IHRbBAiuh5acdyVwfvXsXpgQGyGX
 1R/VOFKR1eo/hTfDlJ3GrShzPHsYq24qayyrn4m87hkITZ25XVrlES9Psue0pJn8g4lb
 sDNCvXPdgThC880B3kiczkePnmi8L9bBWD950Xu5aUd9M2F8L1Ty8HUHOBGhhk/5Asw5
 vX2Y6uD4WAekCEpaEQZeU+WYP8ORmOaBt++cOQGsgeFHltTh6OoONFxxSPmJMga055WA
 C9KLPEiBPn1/jV42RtLW2ACWn1eE8JBoQmeer2mtBI00ZDSlhFrvnSySjMZFlcxWxBQo
 rABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ouAmCle6B3dbO/a12UFjmEanteOsMmT+/TxjMSS+W/M=;
 b=q7QRYoIXCyrx9AqGHOB2x7y6CUOOT84bXo+WVLfjqiESLPM9NOEcHU8mpN44F8Lhv1
 qdvnvLdfd0OMUctkXRn7jTNvP8UjAKs3R2Xn6qhrcbOaTBPSigtfR2wBBCP3cKWHCRt+
 kA5zOcQZAiC72IA8/MrmLNabAwao4SGfoSZqbKVFVDYP4rzJ3bpgy1QLr4LbJvfNLhlj
 AvRcH4OD4clV4+nEqFRw6hNgwYDvTtxxTvz5atbU9fIueaiJBg5jU6sQIh+HLzvLsCFp
 U3wIgtLVS3yF9Z/ikqf0CVpuI3AlXGZ6h4FNXxH83uF8FB1XIoXEJrtsi6CAsST/eJkk
 FTBQ==
X-Gm-Message-State: AOAM530y0A9n6t3y5OuMDTvfY5luIwxjnAOEUfmI62GC0BEJ7PaHQPAi
 YxLrYZzZ1nWGK161lBFOj6BqLcYGz1mi7Wck9fn56aXGEDU=
X-Google-Smtp-Source: ABdhPJzxmZVBh3CmfV+kkK630c5eo1VOaWK8C5vV69xf+RnoI+G+4weRXbdWJMQnQgn6rh5xoYn7zovuzhot/+/xQ+o=
X-Received: by 2002:a05:6638:15ce:b0:317:b681:157b with SMTP id
 i14-20020a05663815ce00b00317b681157bmr5976456jat.66.1646651056037; Mon, 07
 Mar 2022 03:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-2-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-2-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 21:03:49 +1000
Message-ID: <CAKmqyKPqpB-QjTJGKL-3=6DHg1Siq1TA7xeUW9deW2HKn_ZX=g@mail.gmail.com>
Subject: Re: [PATCH 1/6] aspeed/smc: Use max number of CE instead of 'num_cs'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 7, 2022 at 5:43 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Aspeed SMC model uses the 'num_cs' field to allocate resources
> fitting the number of devices of the machine. This is a small
> optimization without real need in the controller. Simplify modelling
> and use the max_peripherals field instead.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/aspeed_smc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index d899be17fd71..a5d8bb717fc7 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -693,7 +693,7 @@ static void aspeed_smc_reset(DeviceState *d)
>      }
>
>      /* Unselect all peripherals */
> -    for (i =3D 0; i < s->num_cs; ++i) {
> +    for (i =3D 0; i < asc->max_peripherals; ++i) {
>          s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
>          qemu_set_irq(s->cs_lines[i], true);
>      }
> @@ -1042,7 +1042,7 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
>           addr < s->r_timings + asc->nregs_timings) ||
>          addr =3D=3D s->r_ce_ctrl) {
>          s->regs[addr] =3D value;
> -    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
> +    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peri=
pherals) {
>          int cs =3D addr - s->r_ctrl0;
>          aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
>      } else if (addr >=3D R_SEG_ADDR0 &&
> @@ -1139,9 +1139,9 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
>      s->spi =3D ssi_create_bus(dev, "spi");
>
>      /* Setup cs_lines for peripherals */
> -    s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
> +    s->cs_lines =3D g_new0(qemu_irq, asc->max_peripherals);
>
> -    for (i =3D 0; i < s->num_cs; ++i) {
> +    for (i =3D 0; i < asc->max_peripherals; ++i) {
>          sysbus_init_irq(sbd, &s->cs_lines[i]);
>      }
>
> --
> 2.34.1
>
>

