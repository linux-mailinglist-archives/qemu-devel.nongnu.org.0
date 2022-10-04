Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504025F41A4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:11:10 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offpL-0005Zg-KX
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1offiD-0008LJ-GT
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:03:58 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1offi9-0003lp-Qf
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:03:44 -0400
Received: by mail-ej1-x630.google.com with SMTP id au23so7290974ejc.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mENYIcsM8H7by6Cq0FHD+iv07XiZcyZ7ZAKXcrPZEag=;
 b=rfLLEkmV/DjE1s0QvEakV00KEhKQZB4INowQDebL2Y/KgsKP82zsFVc0K2ZCCGHOLY
 qNafbLxiKJKzEAvqUrtMP+sgCSqfZBzWviaVVgsqMoDB9YIFtCFGjB1SNE75D59tGX81
 nrMgfdCDbh6TXW+W8DLKfY5EYmxUDfiGV1ixn1+XL7MYtOWBQAf5ruulwBwCO0Be5ZDR
 LXr5xwKhmUUI5h8zBaDItEIb2+8iJLlmqrY8Nwap6XLv6NL642bJ+f4l/RrxmGxwwUer
 2RXIyIqLVL3H1nWhgxC0HH8XJn4GZwDnXUgPVBm2pCtzSBEKp+v9OwrWsYrcceHz5jmE
 aZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mENYIcsM8H7by6Cq0FHD+iv07XiZcyZ7ZAKXcrPZEag=;
 b=d0749VEpjOIMys7tR3HTsUWmIIcZ67sjJYGFoPTgfvBT7LUj6Rabirt+VV9Jaehb49
 F7xV+TnXGLs0HTZe1EIFhNDgImxQDhBdK7s07lWYmXY2aTzCnfw4fTbbwYdQGqf7fSwJ
 CcOegODSlrXTIGId3jhXuEvkd97b3ACCuYl0YtkxrwffhZsnOq3LMJukHEZ7c4UACYGe
 F+IOtJi902elmEUifnKfwPq1Z20ujTGq332a5/MVDNIEFm8Ra3ToNtYjhLGTfTIUHx2A
 9aTQYPgW7GtEwucclcYnWbJ+zGx8xEAEuVxlNdMatQD2hI2T+wJb+SOGA9wkUyaI3GNo
 vmUw==
X-Gm-Message-State: ACrzQf2G1EZ5VBBHFbcR5kYO70iwRkGL136C4DFo8TSZVqXwjMRVKN43
 kgpRYEfAavPNbwqUi2gGoehpWZP+KCNhdr2U6BIpbw==
X-Google-Smtp-Source: AMsMyM47K1gxC4lHvGyjZA6dcDghY+EwIVm1mLHKNNnxSZf/Mc3o4uNOSa2RoeR+5aHsI+/nMDaXajeQMWDp6mByGKc=
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr18604159ejc.555.1664881417827; Tue, 04
 Oct 2022 04:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <YziPyCqwl5KIE2cf@zx2c4.com>
 <20221003103627.947985-1-Jason@zx2c4.com>
 <b529059a-7819-e49d-e4dc-7ae79ee21ec5@amsat.org>
 <CAHmME9pUuduiEcmi2xaY3cd87D_GNX1bkVeXNqVq6AL_e=Kt+Q@mail.gmail.com>
 <YzwM+KhUG0bg+P2e@zx2c4.com>
 <CAFEAcA9KsooNnYxiqQG-RHustSx0Q3-F8ibpQbXbwxDCA+2Fhg@mail.gmail.com>
 <CAHmME9qmSX=QmBa-k4T1U=Gnz-EtahnYxLmOewpN85H9TqNSmA@mail.gmail.com>
In-Reply-To: <CAHmME9qmSX=QmBa-k4T1U=Gnz-EtahnYxLmOewpN85H9TqNSmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 12:03:26 +0100
Message-ID: <CAFEAcA9-_qmtJgy_WRJT5TUKMm_60U53Mb9a+_BqUnQSS7PPcg@mail.gmail.com>
Subject: Re: [PATCH v2] mips/malta: pass RNG seed to to kernel via env var
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, kvm-devel <kvm@vger.kernel.org>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Oct 2022 at 11:56, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Oct 4, 2022 at 12:53 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 4 Oct 2022 at 11:40, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > I think the unusual thing here is that this patch isn't
> > "this facility is implemented by u-boot [commit whatever,
> > docs whatever], and here is the patch adding it to QEMU's
> > handling of the same interface". That is, for boards like
> > Malta the general expectation is that we're emulating
> > a piece of real hardware and the firmware/bootloader
> > that it would be running, so "this is a patch that
> > implements an interface that the real bootloader doesn't
> > have" is a bit odd.
>
> Except it's not different from other platforms that get bootloader
> seeds as such. A bootloader can easily pass this; QEMU most certainly
> should pass this. (I sincerely hope you're not arguing in favor of
> holding back progress in this area for yet another decade.)

What I'm asking, I guess, is why you're messing with this board
model at all if you haven't added this functionality to u-boot.
This is just an emulation of an ancient bit of MIPS hardware, which
nobody really cares about very much I hope.

I'm not saying this is a bad patch -- I'm just saying that
QEMU should not be in the business of defining bootloader-to-kernel
interfaces if it can avoid it, so usually the expectation is
that we are just implementing interfaces that are already
defined, documented and implemented by a real bootloader and kernel.

[from your other mail]
> Also, in case you've missed the actual context of this patch, it
> happens for `-kernel ...`. So we're now strictly in the realm of QEMU
> things.

-kernel generally means "emulate the platform's boot loader":
it is exactly because we do not want to be in a realm of
QEMU-defined interfaces that we try to follow what the
platform boot loader does rather than defining new
interfaces. That's not always possible or the right thing,
but it's usually the cleaner way to go.

thanks
-- PMM

