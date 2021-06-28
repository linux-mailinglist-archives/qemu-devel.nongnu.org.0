Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42D3B67DF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:41:53 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvGa-00039S-V6
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvET-0000kA-PP
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:39:41 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvEQ-0001r6-SW
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:39:41 -0400
Received: by mail-ej1-x633.google.com with SMTP id l24so2016476ejq.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5LtKJhrFREuaiP3YqrYV+PjBOB2F3iQ1li5BOmdMx9U=;
 b=f+ehtFdc9Mm40oH2unbVJ8/eaSU+FpSFiJgmyp0O40n7jwWb9Qb1Bj1xVFwHInxISD
 M9DSxGf2zQGqdTOA9zM1BErEtRsrCugcFw5LPVyT24ovPa1KGdpXgeT7Ne5/5cnTk1gM
 rSjRgaP1QHiRRr+N2Pn6ex0aNELjEfIAedNS59CHWwXtQLuKGK7+ZEW9yy2kp5o7M5a3
 HIvjQPNsuArDlj5P6N4U9TGiHyqowL/OJdyxOvs5QsuEhM1BeYcglp1/alIOi6WIM8q2
 FQ/4ghB/XRPwT3mwmnrvj4JBp4yjj09lDsPCoxTrrH3JnSdLyJrcda7hga9FoYFNnTC6
 t/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5LtKJhrFREuaiP3YqrYV+PjBOB2F3iQ1li5BOmdMx9U=;
 b=K9O08Ik3nJSbMBOyYnc815KuEeY/mJVNHYK1Bq26NTbsUhoeiUQM1VW/IkRPdr7xKu
 rUca4oKtmI8gibR28bkREhf3KzEqvH6EGwMsxw2uGCxuHjGFRL0faIpjusqDNbXnj0OX
 wjoCcMrOP/8paYIYYq1r11PWJUwIZr7hC+Wuvxtc3XJOxbgbydime6IB59+TDj6ez7YO
 jTXK8qLLg+48+ORLbP/UxZD1bHLZlwh41xtxpnqGtAReF5mnw2bmrsdOFI2JL7xykk7Y
 WA4eqR2RDr3K5y322p8dh8psMXZjI6jQD/jhJd8tfs8j5JORkp1iqzoOdRdS8oCrhVp7
 1mhw==
X-Gm-Message-State: AOAM532PpkTnIa6KdsnLHswwl8SmWlkqXi0uvhHPhGYGgtk5ZLWh0RuW
 rqHkDt+Qnyelyxcxd4yZD7QOVrR08JXCebx3ZaYTjA==
X-Google-Smtp-Source: ABdhPJzUUBuVKOciJeZpXbLWjzT+ckksV16EupIxQUTBPUsQmt5CXDadziH1bbKXN9tLXCm4wNe/KSvfb0BRxv90+us=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr24835559ejw.382.1624901976585; 
 Mon, 28 Jun 2021 10:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210625210209.1870217-1-nolan@sigbus.net>
 <4fe1c908-6d2e-8481-81c6-2c68c367e5e3@amsat.org>
In-Reply-To: <4fe1c908-6d2e-8481-81c6-2c68c367e5e3@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 18:38:59 +0100
Message-ID: <CAFEAcA_dZekwW0VXLUJWnDR9Etfc3kcEndckRKj-LyPa+0a2WA@mail.gmail.com>
Subject: Re: [PATCH v3] Add basic power management to raspi.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Nolan Leake <nolan@sigbus.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Jun 2021 at 11:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Nolan, Peter,
>
> On 6/25/21 11:02 PM, Nolan Leake wrote:
> > diff --git hw/arm/bcm2835_peripherals.c hw/arm/bcm2835_peripherals.c
>
> Odd, usually the diff line comes with a/ b/ prefix, I can not
> apply your patch (git version 2.31.1, Fedora):
>
> Applying: Add basic power management to raspi.
> error: arm/bcm2835_peripherals.c: does not exist in index
> error: misc/meson.build: does not exist in index
> error: hw/arm/bcm2835_peripherals.h: does not exist in index
> Patch failed at 0001 Add basic power management to raspi.
>
> But patchew succeeded:
> https://patchew.org/QEMU/20210625210209.1870217-1-nolan@sigbus.net/
>
> Applying: Add basic power management to raspi.
> Using index info to reconstruct a base tree...
> A       arm/bcm2835_peripherals.c
> A       hw/arm/bcm2835_peripherals.h
> A       misc/meson.build
> Falling back to patching base and 3-way merge...
>
> So I tested patchew's commit 7856ac0e804:
> https://github.com/patchew-project/qemu/commit/7856ac0e8045d006f1008a03e1=
d4d8710b9d0612

It succeeded, but if you look at that tree you'll notice it
was confused enough to create a new top level directory misc/
to put the .c file in! I'm not sure how the result manages to build :-)

I have fixed this up locally. I have also moved the bcm2835_powermgt.h
file to include/hw/misc, to go with the other bcm2835 headers there,
and I have fixed the region size.

Applied to target-arm.next, thanks.

thanks
-- PMM

