Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2313840AD6F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:20:37 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7QR-0006CR-Kj
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mQ7Ko-0001Lp-8W; Tue, 14 Sep 2021 08:14:46 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mQ7Kl-0006Gf-Nz; Tue, 14 Sep 2021 08:14:46 -0400
Received: by mail-qv1-xf30.google.com with SMTP id 93so8238175qva.7;
 Tue, 14 Sep 2021 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VUsoPB++nDlcmSmWK4ebejso4Pdv5zW7qntAZ8lgTRg=;
 b=JyLMmBVHM7mVmC4W0avEObvkngAWPVpuIYcqlFOFikr/FFynjOoliuqPR0A6JHOjOM
 CEjkloPpNmNP00ZIaElbe2zz+Q9xEfV7tYa19NxzUCVvoHvZhua58uR9XkiBWT2Rn7w4
 Ahga2bN1LN1A/5LsaB2rHZo7H3iaz8lVvmv04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VUsoPB++nDlcmSmWK4ebejso4Pdv5zW7qntAZ8lgTRg=;
 b=f1NYv2VxFtiZhF4KAsvJo6UpEzbnIzfyuc/svVFgDfBrcExAA8gsBRZY9KfEImnwDk
 pQ6XZ9Ylk7u31LyujvWtO1WnRzLUGwtcvYX7qVkrMQjBcPntgoowX6BxeNt70YLNUBv4
 e3by+9loBaw8Wynlnu0CJZoxwe+ils8F93BqeEVya7Om7IGk6PxygfKHfjygI9EUd7zx
 H5YVbsOKPM5NHy4Bc44f0v6xvRWWGOlfKvZ7hbhc+h/I3lNLitp1T9ij+9MSVGfCd1cV
 hDYsFFwd82Y8oPiZQXTwdC3qvLQgtMUECcKuEiixyEJ18tUCzFd9fwi5T6OxdvXX1wOR
 KqoA==
X-Gm-Message-State: AOAM533Kses9Y6Jg0Iwkz/RKQ+QQpMa28CoS7DrwXgiHzdaFF9ZAtNsA
 Wj3Z373bi04JgOjFUOOTXM5Qwkz0nTtH1HD4JBA=
X-Google-Smtp-Source: ABdhPJwtk0jWsohZ6455nj1rQZtfuyLm9iQ4HG1045ES0jUXa3UKDHSIq5c/NpeRgzOwRJx4CA1QDWT/bvyaTovha2I=
X-Received: by 2002:a05:6214:13ee:: with SMTP id
 ch14mr4885954qvb.43.1631621681152; 
 Tue, 14 Sep 2021 05:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
In-Reply-To: <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Sep 2021 12:14:28 +0000
Message-ID: <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: Peter Delevoryas <pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sept 2021 at 11:59, Peter Delevoryas <pdel@fb.com> wrote:
>
>
> > On Sep 14, 2021, at 3:56 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> >
> > =EF=BB=BF
> > Hello Peter D,
> >
> >> +static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *dat=
a)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
> >> +
> >> +    mc->desc =3D "Facebook Fuji BMC (Cortex-A7)";
> >> +    amc->soc_name =3D "ast2600-a3";
> >> +    amc->hw_strap1 =3D FUJI_BMC_HW_STRAP1;
> >> +    amc->hw_strap2 =3D FUJI_BMC_HW_STRAP2;
> >> +    amc->fmc_model =3D "mx66l1g45g";
> >> +    amc->spi_model =3D "mx66l1g45g";
> >> +    amc->num_cs =3D 2;
> >> +    amc->macs_mask =3D ASPEED_MAC3_ON;
> >> +    amc->i2c_init =3D fuji_bmc_i2c_init;
> >> +    amc->uart_default =3D ASPEED_DEV_UART1;
> >> +    mc->default_ram_size =3D 2 * GiB;
> >
> > Is that the default of the Fuji board ? This is causing an issue in our=
 tests :
> >
> >   qemu-system-aarch64: at most 2047 MB RAM can be simulated
> >
> > Could we lower it down to 1G ?
>
> Yikes, sorry about that. I thought it was 2G, but yeah let=E2=80=99s just=
 lower it to 1G. I might be completely wrong anyways.

The upstream device tree uses 2G:

https://elixir.bootlin.com/linux/v5.15-rc1/source/arch/arm/boot/dts/ast2600=
-facebook-netbmc-common.dtsi#L20

It's unfortunate we limit the defaults given very few (no one?) is
using this model on a machine that is 32 bit.

OTOH, modelling 1G of RAM is useful for testing, so it's no great loss.

Cheers,

Joel

