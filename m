Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285AC449EBA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:44:13 +0100 (CET)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDN5-0005qI-Q9
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:44:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mkDLZ-0004Wf-59; Mon, 08 Nov 2021 17:42:37 -0500
Received: from [2607:f8b0:4864:20::830] (port=40509
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mkDLX-00050N-2t; Mon, 08 Nov 2021 17:42:36 -0500
Received: by mail-qt1-x830.google.com with SMTP id t34so6617176qtc.7;
 Mon, 08 Nov 2021 14:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4t/uzsVjnf++F+iZc9VXehuWidAREiVfluH73bH/Uc8=;
 b=T6bMlMe2yNmzXy3GJlDOLkRueqyZ6xTeK5Ocot2qgrpjgAFRE2tCWz+axUBN2aEzwN
 WmPfM0u79T+c7/EUAuAlLiUMAY06T47/cfqSWxDPEB0wEYCuG5JlRrtmJo6VzoqHIg+K
 7V3S0cz/jVr1IxGUBLh3zM/LhyW9CwAv5bC1Yd9nTLm5sRGE4oxONLF51EYWyXdY7Wji
 kKsZP4HQZgdKas4xV8wElodu04N7wE4+7rgY1ISZGWeUiJSIsgz3KBwLKpSbOp5b6FvG
 o5w5s0r+dSq0QS18QN0jpoLxbpnAJiZVRDyoSzY27JfA9fEgZd7BXEcieMEA0X3AOBk/
 W+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4t/uzsVjnf++F+iZc9VXehuWidAREiVfluH73bH/Uc8=;
 b=BvICoEudrwJ+s3S9OI3JPCcw06QAUGAZogop/ljwTNx8DpXZo/zSUB8S34FSCyEiZA
 HnaMAjKgvOiaz1Eq7YxHGZm9QZWEqWfKUkXlxdicdkk2ypbaw4OPUieRLNn92uuTXH/8
 WaqsWFiDieO/9VrjqGwCj/FQ3Ldw8fr6nT1/NYaizWGVhfGc1vErNAjLufMZWE26O0dv
 E+Cc3IQKL9JEeIfV9U0mNxRKQXUGpFGzF9SvVgC42sxZ8Ow7tEm6TeR8A+ZvziBahFF8
 JEnP2mBXxbMZS43hghQdfrb8klN6S7d2hxyjS7KQnVEbG3O/5sz/Mg81+h0NjDD8C784
 V/+g==
X-Gm-Message-State: AOAM530wPse2/o/IdVKFcZvQ2aarX9o/tBbHJcsGclIoNUrkOL5PCt6h
 2XnkYQvszQI2WujN6DcH6itjc0iSASV3sFsabr99Y59m+Cl6X+O2y7k=
X-Google-Smtp-Source: ABdhPJzoPkqUUgE0Y/5hG2Me6wxAYekTV5ryOcz6kUruZkWc3oLFUcF5ZHJs+IJaHPK3lqPFMKIFRswAdJ2WcUAZNRQ=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr2003327jak.18.1636411038193; 
 Mon, 08 Nov 2021 14:37:18 -0800 (PST)
MIME-Version: 1.0
References: <CAFT0Dp1FKeLFNbKSXtgjt9FHF3awu+4ic32cAXQrrmd7Dstwbw@mail.gmail.com>
 <daa4049b-c6c2-1c0c-c1bd-404008c137dd@amsat.org>
In-Reply-To: <daa4049b-c6c2-1c0c-c1bd-404008c137dd@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Nov 2021 08:36:51 +1000
Message-ID: <CAKmqyKNuUaz=Ri_Krg_AtPESFXgX7wtMkJncddSJH1H-b3O9cg@mail.gmail.com>
Subject: Re: Emulation of solo key
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=alistair23@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Niraj Sorathiya <nirajsorathiya101@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 8, 2021 at 5:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Niraj,
>
> On 11/6/21 11:17, Niraj Sorathiya wrote:
> > Hello Team,
> >
> > I really need your suggestions on how I should proceed to build a
> > Solo key emulator ?  Since I am new to QEMU  , I would like to know how
> > I should do planing before getting into technical of QEMU
> >
> > Please find all information about solo key below:
> >
> > Docs: https://docs.solokeys.io/solo/building/
> > <https://docs.solokeys.io/solo/building/>
> > Firmware: https://github.com/solokeys/solo/
> > <https://github.com/solokeys/solo/>
> > Hardware: https://github.com/solokeys/solo-hw
> > <https://github.com/solokeys/solo-hw>
>
> Solo is based on the STM32L432 microcontroller.
>
> Currently QEMU only models the STM32F family:
> https://qemu-project.gitlab.io/qemu/system/arm/stm32.html
>
> Presumably some core components could be reused for the
> STM32L family.

Generally STM32 parts share a lot of standard functionality. So I
suspect it would be pretty straightforward to get a STM32L432 up and
running using the existing QEMU devices.

STM32L4: https://www.st.com/content/st_com/en/products/microcontrollers-mic=
roprocessors/stm32-32-bit-arm-cortex-mcus/stm32-ultra-low-power-mcus/stm32l=
4-series.html
STM32F4: https://www.st.com/en/microcontrollers-microprocessors/stm32f4-ser=
ies.html

That should give you CPU, interrupts, UART (USART), SPI, timers and
probably ADC and sysconfig (I haven't checked the docs to double
check). That would at least be enough to run the firmware and see
signs of life.

It looks like the STM32L432 doesn't have the cyrpto/hash functions, so
that's one less thing to work on.

For full functionality you would probably need to model the USB SoC
(I'm assuming connected via I2C or SPI). You probably want GPIO for
the button as well, I have out of tree support for that as a starting
point (https://github.com/alistair23/qemu/tree/netduinoplus2.dev).
Then any other external ICs, I would assume there is a TRNG involved
somewhere.

Alistair

>
> Regards,
>
> Phil.
>

