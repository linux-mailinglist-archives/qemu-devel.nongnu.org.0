Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4D3E4153
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:05:04 +0200 (CEST)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0HP-0004Hv-AF
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mD0EI-000397-Ry; Mon, 09 Aug 2021 04:01:50 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mD0EG-0001Tl-O4; Mon, 09 Aug 2021 04:01:50 -0400
Received: by mail-qt1-x82d.google.com with SMTP id d9so11789501qty.12;
 Mon, 09 Aug 2021 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BydnRyj+mX6ZIkbViJ77Ocuamd+zridYzLaZmzCtBkI=;
 b=iSSRkymXDCUgsgzYSALDnE+x6aFHlRXB+x720/ROtGrl9V8+3+xruNKfSeEu3NwpF6
 D2KIvwdOOYXUfWAi0rpMOF6cTyZvZo2Mtt46VAcWLthjVk+U8sDFYl1btfm2YmaxDzsQ
 LZrEMkcoCARCJsRlYgYh3IzUqhJmZx9t3DZWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BydnRyj+mX6ZIkbViJ77Ocuamd+zridYzLaZmzCtBkI=;
 b=n+2HPK3KzCwMmzbwKP3S/goeaEzg6M4gazuZWclFPBgzk4znvy9BdTiC8uE6aHUaT7
 VkOolzS07mV1FIZXAseQTUzhEqzJGxL8KFj78+XA7Qp7CN3P1ypQzPT2rbSJ/PtURVAc
 Edzy0a1VBp6CayzYR6mB0HETAwDmYVgPEAqpnX+t8SEWgq1eQ2D7EG8rEMU93oWZPaVW
 6P3L/NAF9tkeKlfn6EI2zIsGcQgTzmhMc/G88n2IE0OPzOLxUHyU0lHMOxeAydqHGlft
 qVG9tRhpTPxPRX8DLzKOngBLFARCxmeTBCK0MNBk8Bz3uQZYGtmfXOzQGWpSJQXXyLHZ
 C+wg==
X-Gm-Message-State: AOAM5334EcUCzGMHRCPJ/3wfLlg3r6RTiufWK6rQyWgFu+eA6XvhUs5Z
 9qd6cv/ibnCze8Vki45g57RKtuKgqQmC26CY/r0=
X-Google-Smtp-Source: ABdhPJw7qY88csk2tZqE2YJfSqORLudWJ7r7WH60+kfQBqOF3X3QD/dghhOowEPTqoULI8PRZMWkwVbGmdkvYr5DUzs=
X-Received: by 2002:ac8:5949:: with SMTP id 9mr13067349qtz.135.1628496106943; 
 Mon, 09 Aug 2021 01:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210808200457.889955-1-linux@roeck-us.net>
 <7f49fccc-fb76-cd50-02d2-aa47f410d73e@kaod.org>
In-Reply-To: <7f49fccc-fb76-cd50-02d2-aa47f410d73e@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Aug 2021 08:01:35 +0000
Message-ID: <CACPK8XchtnxGyZ=wFMJU7S0V7SPUF0KoFn5BJiF7vT8bu3Qd3w@mail.gmail.com>
Subject: Re: [PATCH] hw: arm: aspeed: Enable eth0 interface for
 aspeed-ast2600-evb
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 07:45, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/8/21 10:04 PM, Guenter Roeck wrote:
> > Commit 7582591ae7 ("aspeed: Support AST2600A1 silicon revision") switch=
ed
> > the silicon revision for AST2600 to revision A1. On revision A1, the fi=
rst
> > Ethernet interface is operational. Enable it.
>
> Indeed.
>
> I see that commit ba56f464f0c ("ARM: dts: aspeed: ast2600evb: Add MAC0")
> reintroduced it a while ago. But my A0 doesn't support it. I am missing
> something.
>
> Joel, why this patch didn't reach the OpenBMC kernel ?

Because your a0 doesn't support it, so it would break that. That's the
only reason.

For this patch,

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Thanks,
>
> C.
>
>
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  hw/arm/aspeed.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 9d43e26c51..ecf0c9cfac 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -959,7 +959,8 @@ static void aspeed_machine_ast2600_evb_class_init(O=
bjectClass *oc, void *data)
> >      amc->fmc_model =3D "w25q512jv";
> >      amc->spi_model =3D "mx66u51235f";
> >      amc->num_cs    =3D 1;
> > -    amc->macs_mask  =3D ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_=
ON;
> > +    amc->macs_mask =3D ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_O=
N |
> > +                     ASPEED_MAC3_ON;
> >      amc->i2c_init  =3D ast2600_evb_i2c_init;
> >      mc->default_ram_size =3D 1 * GiB;
> >      mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
> >
>

