Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1559A4D08EA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:54:05 +0100 (CET)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRKMl-0004fw-Mz
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRKL8-0003V3-OQ; Mon, 07 Mar 2022 15:52:22 -0500
Received: from [2607:f8b0:4864:20::136] (port=39817
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRKL7-0004rM-7K; Mon, 07 Mar 2022 15:52:22 -0500
Received: by mail-il1-x136.google.com with SMTP id b14so2107917ilf.6;
 Mon, 07 Mar 2022 12:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1jfEMK8efTkZBDUaALq1cuq5BkxsGKIjkbTz/4RXjsQ=;
 b=VBZjCHJfEzI1GXX9Jk8wQKZlqfs87bBhA4b80mid2jSEp0YQy4rJ4tC5pzVWX4oY1c
 /eyn2nu7z1+ijbVpjhhT3Uv8XS0rkaW62mpx//MzNhXIOUzLlnfb97DWxnxVrgDx+fCR
 bHjh5+Ow9Y7Z8hGwzmTK9YkJO9WkT0/cRrb3UhXoTvem+pttnxE4T5pn9AcKxRGrL5rc
 YbGAH4hmouGl0H4lI7wKyBT8jSqqOJROebL9bvU0aBSjaPta7k+h7uhUm6TtzLOlMEVV
 yHSaacYHc9rnjgq5QkuhB7KgmaxWTlvMkuOjcB9TLV+QBlRpYHUsbY12+rBbaVcQ6/Y1
 ORlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1jfEMK8efTkZBDUaALq1cuq5BkxsGKIjkbTz/4RXjsQ=;
 b=EWymPjhpuSoTeiRq08G85WKv3Xlv/9CIKRoQbQUHBFh4Sw4RjPvuW/ceTk0EtO3azl
 5FkVKRZ2Dxb4TaE8p7tZT78FXpew/ItiLShqWoX31sf5c8snFUKkT+mHdxY2/poaNbyK
 ow2qRzQKx+ZecsG2TThl93kvMVOgAJz+ZFAt0M9iimzp79M7EJBiJhAn1su10V3yY6xV
 JUi5YTDDcD07rKIRe8WoIRGrsmw4e9CS1PWMXh5RVJUEw3FLH6/Wz84TEGevPt4SF8G1
 zBvK0sLX6/xhNkhgj2OkCW9OhYdBnZUeS/soLRZqWbXX1LAmXmk1Qe8k7ntB9NJddyqY
 O32Q==
X-Gm-Message-State: AOAM5303s/Y7n2I9H+BvYKW4/yqC1zQcn0SfPeGYv02PSZUsTLpUgmtj
 U+lnDZoErsCbRc/gkUYOkhQOGvVTC2qCVmTQixk=
X-Google-Smtp-Source: ABdhPJxYYPf8CjsbDOiBFJRTGLbuJbiqhOCz6GzMZebaKZtMo1wZyj2xNCuRVyP5JivHK9118pHKcKSbKVsRM/AnFZs=
X-Received: by 2002:a92:d80c:0:b0:2c2:c40c:7bd4 with SMTP id
 y12-20020a92d80c000000b002c2c40c7bd4mr12878526ilm.310.1646686339882; Mon, 07
 Mar 2022 12:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-3-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-3-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Mar 2022 06:51:53 +1000
Message-ID: <CAKmqyKOvHX23Ef-dLNY_YbGn_nHQmX4WFmjJnuPzu6uRPsKEHg@mail.gmail.com>
Subject: Re: [PATCH 2/6] aspeed: Rework aspeed_board_init_flashes() interface
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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

On Mon, Mar 7, 2022 at 5:24 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, the allocation of the flash devices uses the number of
> slave selects configured in the SoC realize routine. It is simpler to
> use directly the number of FMC devices defined in the machine class
> and 1 for spi devices (which is what the SoC does in the back of the
> machine).
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/aspeed.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 02918a594d24..be24508a9854 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -276,9 +276,8 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr a=
ddr, size_t rom_size,
>      rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>  }
>
> -static void aspeed_board_init_flashes(AspeedSMCState *s,
> -                                      const char *flashtype,
> -                                      int unit0)
> +static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
> +                                      int count, int unit0)
>  {
>      int i;
>
> @@ -286,7 +285,7 @@ static void aspeed_board_init_flashes(AspeedSMCState =
*s,
>          return;
>      }
>
> -    for (i =3D 0; i < s->num_cs; ++i) {
> +    for (i =3D 0; i < count; ++i) {
>          DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit0 + i);
>          qemu_irq cs_line;
>          DeviceState *dev;
> @@ -382,10 +381,10 @@ static void aspeed_machine_init(MachineState *machi=
ne)
>
>      aspeed_board_init_flashes(&bmc->soc.fmc,
>                                bmc->fmc_model ? bmc->fmc_model : amc->fmc=
_model,
> -                              0);
> +                              amc->num_cs, 0);
>      aspeed_board_init_flashes(&bmc->soc.spi[0],
>                                bmc->spi_model ? bmc->spi_model : amc->spi=
_model,
> -                              bmc->soc.fmc.num_cs);
> +                              1, amc->num_cs);
>
>      /* Install first FMC flash content as a boot rom. */
>      if (drive0) {
> --
> 2.34.1
>
>

