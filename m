Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93783D7279
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:00:51 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JtK-0005Ov-Vj
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JsC-0004Ug-Tl
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:59:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JsB-0005TF-9V
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:59:40 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r16so14541790edt.7
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lArMNQEDdOlxa3qae9jy7hBhFApSQSSTf8XVUotnVBM=;
 b=Oag5gO49g/2Gp45IwV/nk7OcsGwy2nQ+tOMQsL8T66bYOOjGXXYPgdAkA24jv4VPA1
 FRGKxH0UUmPiVBWIWr8q6902auD+4XaqJECV0RwRgpVoyapqKfIeM83RIl8g0c/mw8p8
 1dN3e+sneht4TqdpnVQQIlZvYOcTzG5uuT1jIBi09eaF/DAsnJuYQ2kbtg5KZam3dA7X
 hcInjJ9Hg5CdJ1XKCXecojI+eEk24bLBrwKqqWZobKE1M0NX8ZkwU6QGCcOPg9GT5FRV
 47I22cq/k6oYhNfFPxyyyXPxaTe5/1wGvn5Kkw1b6dXMGUXMOuYwWfWnePdubGHLGYH8
 VBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lArMNQEDdOlxa3qae9jy7hBhFApSQSSTf8XVUotnVBM=;
 b=WJAS6yesY0i2MOP5Z719BsbIUT3S5bLAleE/IogmvM2bC1T7M6tgOXXxwVdnliQmQz
 88Dl2+XP9vG13j7Jy4YLHmNYWPUS7f/MdboMruL7wWKOSflE56ZGWmrZU+T+LDp9h6g3
 jeLYjE8jvkY/BV16YaFSErQMsjqR5HF9lPMu/vDBCJGOeMmPUvDW+KZbBvq4fbsjBoRT
 27YDwFNaby+4z7Q30inPFS5iQ4HnMKTcoO56vpcXeRtyegJ+qmbHlRsDQ+dGDRG9f7OF
 gxZD+IHL425HZfOUDK4Vp7BLSfuv+VEurQxaKCrwqbQCPEAmZRMZfnWZxpFy+wmwtysK
 t4PA==
X-Gm-Message-State: AOAM530v+UybmWARqKb5vfdC0BWKQUvuCD6gjCpQslFIpteWiuqYrm28
 pXvw8aW9Dw6wifb2M2r/J2Wfn+Uqo/soI0tGresR1A==
X-Google-Smtp-Source: ABdhPJxvRn7th90Sila9lMsPVBv1MEE9fTY1nDp8LKkbPvnnWzTmpWezLjgS7V1R4mWbZqnhGXaF2bLBc8ojnsrJWII=
X-Received: by 2002:a05:6402:35c7:: with SMTP id
 z7mr26917308edc.36.1627379977943; 
 Tue, 27 Jul 2021 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-2-joel@jms.id.au>
 <7c5dd20c-4710-4bdb-605f-e35ed7bfb35a@kaod.org>
 <CACPK8Xe=v4KRT1TqC8-DFWxqUoCak1MisWr84_9ug-xfXezWEA@mail.gmail.com>
In-Reply-To: <CACPK8Xe=v4KRT1TqC8-DFWxqUoCak1MisWr84_9ug-xfXezWEA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 10:58:55 +0100
Message-ID: <CAFEAcA9t4P-h2fnY7=s_jt0RmB0pj2gUuz6zVZ7YfF9uXzKj9g@mail.gmail.com>
Subject: Re: [SPAM] [PATCH v2 1/3] hw: aspeed_gpio: Fix memory size
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 at 09:02, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 19 Jul 2021 at 16:02, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > On 7/13/21 8:58 AM, Joel Stanley wrote:
> > > The macro used to calculate the maximum memory size of the MMIO regio=
n
> > > had a mistake, causing all GPIO models to create a mapping of 0x9D8.
> > > The intent was to have it be 0x9D8 - 0x800.
> > >
> > > This extra size doesn't matter on ast2400 and ast2500, which have a 4=
KB
> > > region set aside for the GPIO controller.
> > >
> > > On the ast2600 the 3.3V and 1.8V GPIO controllers are 2KB apart, so t=
he
> > > regions would overlap. Worse was the 1.8V controller would map over t=
he
> > > top of the following perianal, which happens to be the RTC.

I'm going to assume this is an unfortunate autocorrect for
"following peripheral", and will tweak the commit message...

> > >
> > > The mmio region used by each device is a maximum of 2KB, so avoid the
> > > calculations and hard code this as the maximum.
> > >
> > > Fixes: 36d737ee82b2 ("hw/gpio: Add in AST2600 specific implementation=
")
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> >
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Cedric, Peter; can we please get this merged for 6.1? Without it the
> RTC model is not functional on the ast2500.

I'm doing an arm pullreq today so I'll put it into that.

thanks
-- PMM

