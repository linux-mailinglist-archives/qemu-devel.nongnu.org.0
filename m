Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958E35C92C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:50:54 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxts-0007eo-TP
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVxsY-0006uq-1x
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:49:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVxsT-0007YJ-P4
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:49:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id g17so14683937edm.6
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YBQjV6Tlf7l4baWwDrLI9ZK5m9k22UcI+TNM7YMe8MA=;
 b=e01fa8/2dkLTAoue5I+4ZFyPNvNStxyuYcxmWMSeFUbC4uNoO8MIFDzNmcLa1gz30o
 ocDVAzq0E/BLeFeQZCDIcUrSXRFtKaXBE4UO0bsCCI9ut+k3mcl4pJrNMz53BtG3aijU
 Ezhnf4v4KXHYZ5l1Ikw0nyQo/+l1LgbAu2PlzKKpNlEMzrX8NXUDCDhT0r9p1kcNyKEW
 hACQfd5y/uJwtTzecksWS5gMEJx8m3uBiImDdhQjr/D4b5VBTSkoaoNld3JET/p79XMC
 naZdxWQlUpi8iJxjoYH9YvjGWxGl0O7pz/I/bcd0XwDW5Kh/z1v1pSdkn0aR1RX7yKDo
 90FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YBQjV6Tlf7l4baWwDrLI9ZK5m9k22UcI+TNM7YMe8MA=;
 b=I34AJhqcqxX9ec0xnrDHbMiVwDWSOzwtLj8ntlw9cyM5o4mD+w7wf/mbwzUrA86kE3
 gWY+OtvWAEUGFWzYTQcaC+lbuSR4tcRTsmVCHVJ7XpO55rNLQXhPpvczT0+Ioga7jV01
 3ZS3rI3OYZHUjJ6tYM+HwfsmZzZmiwdWqDemR3u/acqd9krQ630o+Ym9P/7B1V9MB6EU
 cUKGh8aXqMYhdqvLF0e4vCCJCP4/nLdsbxK1XjFxZG1EQ7wVd5ujgtIx7ptatsL2kuzP
 1y1n+i4HlksvxKcpXQWhKHKbrdjkcruhh/oIo945u2olSMpV3XJf3M6bLBz3a82naBmw
 e/Dw==
X-Gm-Message-State: AOAM532ce0WpjmWY8cN/gykvQ86Y1DeG+qbVf5cZHpHAH85p98Hm+23i
 afjMUuvESSGYhroRxgg0LoFglVY/ZFY8zjntlV6EaQ==
X-Google-Smtp-Source: ABdhPJyDR/1ONeN9cy8RG0Aet86kqi0wU8I9thYhyg37LO0rIIggv0kfdilJmg63+jWBgUiJ7UXyEdhhuWyoW59Js6E=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr29424403edt.36.1618238964234; 
 Mon, 12 Apr 2021 07:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210412134317.12501-1-peter.maydell@linaro.org>
 <5ae470a2-d10a-13a3-4dc6-62490a940e13@amsat.org>
In-Reply-To: <5ae470a2-d10a-13a3-4dc6-62490a940e13@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Apr 2021 15:48:39 +0100
Message-ID: <CAFEAcA8wTdQpYhsDzcXZQG=yqxoQumoZj4TgPjEZjM6GgHmTvQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mps3-an524: support memory remapping
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Apr 2021 at 15:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 4/12/21 3:43 PM, Peter Maydell wrote:
> > The AN524 FPGA image supports two memory maps, which differ
> > in where the QSPI and BRAM are. In the default map, the BRAM
> > is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
> > map, they are the other way around.
> >
> > In hardware, the initial mapping can be selected by the user
> > by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
> > in the board configuration file. The guest can also dynamically
> > change the mapping via the SCC CFG_REG0 register.
> >
> > This patchset adds support for the feature to QEMU's model;
> > the user-sets-the-initial-mapping part is a new machine property
> > which can be set with "-M remap=3DQSPI".
> >
> > This is needed for some guest images -- for instance the
> > Arm TF-M binaries -- which assume they have the QSPI layout.
>
> I tend to see machine property set on the command line similar
> to hardware wire jumpers, externally set (by an operator having
> access to the hardware, not guest code).
>
> Here the remap behavior you described is triggered by the guest.
> Usually this is done by a bootloader code before running the
> guest code.
> Couldn't we have the same result using a booloader (like -bios
> cmd line option) rather than modifying internal peripheral state?

In the real hardware, the handling of the board configuration
file is done by the "Motherboard Configuration Controller", which
is an entirely separate microcontroller on the dev board but outside
the FPGA, and which is responsible for things like loading image
files off the SD card and writing them to memory, setting a bunch
of initial configuration including the remap setting but also
things like setting the oscillators to the values that this
particular FPGA image needs. It's also what makes the board
appear to a connected computer as a USB mass storage device so
you can update the SD card files via USB cable rather than doing
lots of plugging and unplugging, and it is what loads the FPGA
image off SD card and into the FPGA in the first place.

QEMU is never going to implement the MCC as a real emulated
guest CPU; instead our models hard-code some of the things it
does. I think that a machine property (a thing set externally
to the guest CPU and valid before any guest CPU code executes)
is a reasonable way to implement the remap setting, which from
the point of view of the CPU inside the FPGA is a thing set
externally and valid before any guest CPU code executes.

thanks
-- PMM

