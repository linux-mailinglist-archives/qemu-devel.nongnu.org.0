Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E62F1CEE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:48:10 +0100 (CET)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1IX-0007ed-Iv
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz1Cm-0001dA-4P
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:42:12 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz1Ch-0003rV-Nw
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:42:11 -0500
Received: by mail-ej1-x636.google.com with SMTP id t16so748835ejf.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zs5bPLmYb+F4EqwZT9EmaQcbeinrAZ0cL/V9TRfTSlQ=;
 b=Sy7WeTevCvUGbC9lzdlPRrIsq7ixLyVJIHOAC6LdghRccbBeQYHlmZRi9ghBygC/qM
 5DZ0i5GwN4YTaeBAwkuK34/jsVUu9hpuloaEhe4HX8owjbA/Y3sY6xBlx2VIltZpNG6+
 RNU6xmDk0mwVkCrTCtjdFoWUl3eL4JrjaIRndXdg7P8DmMoTFx/gYyHoUFjPoc8vs55/
 8BV1PKsGDPM0gxxwpT+lmwoZ27x8kyJhuIH9u7Di08FQBc85sk+9Vww5pzffVWr960sn
 mmbePsyOaj3Lqmiyi27bNR7toYeBtg11lQr0a8ZlRlnOJuI/l7zuZ7MEmch/39j8Aqn4
 nJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zs5bPLmYb+F4EqwZT9EmaQcbeinrAZ0cL/V9TRfTSlQ=;
 b=Tf0H9W4bhigjjPpNiJqHNugCwvCAcc5yNuZ8FyM49K+fwFrQsdEx7Gcpm5eaXt+e3Y
 k/fqr/dZeQoFa8zg3F/UdMb7o4Bijdlkg6XhOfKTJ2Teuv7Rqt/A4dQ3KtxbKuxDoyih
 dESMAMkEGUaJNcNH9SfaAqz53/9BNnz9FlsB1jbEMvoLB3NJQFLdWnLTeurzv1lpTB7R
 KoDR8aNhFs/u38VtXpaXIsNcg1AUwslcnWPYDAUHm8S0Q7RdYLPb9CH4CodpKK49WDxa
 6FRy367pLK/r279xNotJvfgRJAYwaeuZ2iJ8RKQcBdF1a6sHnLqRB4vmfvyrvVRCyYnA
 5tsg==
X-Gm-Message-State: AOAM5330RuiOZWU0Acge4cnENASeOQ/WdybkEf9PpcPk4qBeuZX0gcMq
 kAlSG4/uA0vLtm82NGuAof63EWvT4XMtf+GEwfPPZA==
X-Google-Smtp-Source: ABdhPJz/ilWZxgQVTWNMO3GT/AT3/HNW6kyj0TI7N2qEA4Lm3swPsu/UpC12KY9K+E/0PrEjEPOTq88WfIr60ixOfn4=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr449849ejb.56.1610386925922; 
 Mon, 11 Jan 2021 09:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-5-f4bug@amsat.org>
 <20210111011117.GA215408@ubuntu-m3-large-x86>
In-Reply-To: <20210111011117.GA215408@ubuntu-m3-large-x86>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2021 17:41:54 +0000
Message-ID: <CAFEAcA_uz3XryHh3t4DvVR38jHGCm47YFL6KMJJX4-boMih2og@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/ppc/ppc4xx_pci: Replace pointless warning by
 assert()
To: Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Guenter Roeck <linux@roeck-us.net>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 at 01:11, Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Sep 01, 2020 at 12:40:42PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > We call pci_register_root_bus() to register 4 IRQs with the
> > ppc4xx_pci_set_irq() handler. As it can only be called with
> > values in the [0-4[ range, replace the pointless warning by
> > an assert().
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> Hopefully reporting this here is okay, I find Launchpad hard to use but
> I can file it there if need be.
>
> The assertion added by this patch triggers while trying to boot a
> ppc44x_defconfig Linux kernel:

This is the same issue reported here by Guenter:
https://lore.kernel.org/qemu-devel/3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roe=
ck-us.net/
It's still there in master (you can see it if you apply my fix
https://patchew.org/QEMU/20210111171623.18871-1-peter.maydell@linaro.org/
to get past the earlier kernel panic).

The QEMU code as it stands for the Bamboo PCI interrupts is clearly
wrong. The problem is that I don't know what the hardware's
actual behaviour is, so it's hard to fix the model...
A comment in hw/ppc/ppc4xx_pci.c claims
"On Bamboo, all pins from each slot are tied to a single board IRQ."
Code in hw/ppc/ppc440_bamboo.c wires four irq lines from the
PCI controller up to UIC lines 25, 26, 27, 28.

Does anybody have documentation for this board ? What is Linux
expecting the PCI IRQ wiring to be (not necessarily an indication
that that's what the h/w does, but a useful clue :-)) ?

thanks
-- PMM

