Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B04593131
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 17:00:07 +0200 (CEST)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNbZW-0005iR-7L
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 11:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbXg-00048T-Tq
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:58:15 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:45979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbXf-0001U7-39
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:58:12 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3246910dac3so78587267b3.12
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=U0zmGbvKaYVopjRkWZyBaFRzXasaTCUA6tfUTbTP84s=;
 b=ItYgYlQ7GaRpxR+R4CXEVWObxdbDlnCLLHriM9l5BLY5NTX1Jr498JgFZU8BXDpbJY
 tnna25W6dhRQY0WwxNYSOeunb5Igt8hIMscM6PaKgdnMek24SW0v1nnPBj/8JeYbqpHM
 nfuwNKxPau6IRodzmELRMJQzZXfxOZSMyGJuk/3AArC/i0A215tzGqDwPfKpfxCm2mx2
 3BpO6sPt/beRMHxxxTVHpDdnW2kx4uwAm4vZlmnCuEqBqbBvDvvFIbWnU691TYgEt5zN
 90O3rvkfu+gCQGKdNDido74Kj9keaDaZnpkeRqktZ+vjMamw8saAveHgFdUsfdfWgyWQ
 Te+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=U0zmGbvKaYVopjRkWZyBaFRzXasaTCUA6tfUTbTP84s=;
 b=0Z5p7JvRs9f+exVWODSImXKi501J/hInDCMuXybnC5ECyIHUvx4WVSsLUuk2yve/0n
 CthjFtseNwkQaKFOZWgXPG/1vXKhbDRxJfeSI9kgwDzkSGbTmgv4YsmAr2oDhj3KZk9c
 DDZngtCoR9WV3k6PPEbpS6Ho46O8EKsKxmGBoUiZmN1FmqUVRvk9gyBKM9/vd6SYANiv
 Jdejr3D4wJLbDNwXxHYCvBrvvTVJ4NWgm/KN6nNrodY8gX1b1dNUEHPVOSigEJpnxfS8
 Ci11Cn0Yr1kiZ3i5rDd3d9ViZUlRNxL1kplES0aJZ4s5unh7pYD+NDTh6A/s9+eIi+X5
 u3zg==
X-Gm-Message-State: ACgBeo0hzySgV+t0KYg0m2yo7w8ecr+gEw3pEdvi4JFk4fNw73q/Mpea
 IO2tqG4TL4LYLFalWCc2x76GkZ+THHSf2h0Aj9nLFQ==
X-Google-Smtp-Source: AA6agR67gNaXZ72GSt+sC/zmeYQpH5Kvu3i613J2INH4LMx4CrUyWxLl9q3q72tYzLeRs6UaFp5XyyZjhv7lPYHOzBw=
X-Received: by 2002:a25:3d0:0:b0:67c:2231:65e with SMTP id
 199-20020a2503d0000000b0067c2231065emr11113109ybd.67.1660575489938; 
 Mon, 15 Aug 2022 07:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
In-Reply-To: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2022 15:57:28 +0100
Message-ID: <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Shiny Saana <shinysaana@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 13 Aug 2022 at 18:54, Shiny Saana <shinysaana@gmail.com> wrote:
> I'd like to implement support for emulating the teensy 4.1 board (
> https://www.pjrc.com/store/teensy41.html) to QEMU.
>
> I'm honestly quite lost as to where to start at the moment, since
> I can't really find any emulated Cortex-M7 that would be close to
> that board already implemented.

Hi! Yes, implementing a new board and SoC model is quite a bit of
work, and unfortunately the process isn't really documented, so
the best thing is to look for some other existing SoC model and
do something similar. In this case, we implement the Cortex-M7
CPU itself, but we don't implement the IMXRT1062 SoC that it uses,
or any similar SoC in that family. (We do have some of the older
A-profile IMX boards, so it's possible some device models are
reusable -- but equally they might be very different.)

As a pattern, I would look at the stm32vldiscovery machine.
This is a Cortex-M3 system based on the stm32f100 SoC, where
we have implemented a few of the SoC devices and have stub
implementations of most of the rest. That's a fairly recently
added M-profile SoC and it's written in the "modern" style we'd
recommend for new code, so it's a good pattern to copy, and
because it only has a few 'real' devices it's hopefully not an
overwhelmingly large amount of code.

An initial simple implementation would get a level of
functionality capable of basic "can run code and it will
be able to do serial port (UART) input and output".
(If you're hoping for/would need more than that, do say so,
so we can check how much effort what you're aiming for would be.
Some things QEMU doesn't really support very well, like
emulation of GPIO input/output line hardware lines being
connected to LEDs and switches... In any case "just a UART"
is a good first step.)

You'll need detailed documentation of both the board and the
SoC. Handily a lot of that is collected here:
https://www.pjrc.com/teensy/datasheets.html

If you're hoping to submit a new board model upstream you
should give some consideration to git commit structure
as you work on it -- for code review we need big changes like
a new board type to be broken up into smaller self-contained
pieces. It is possible to just write all the code first and
then split it into digestible pieces later, but personally
I find it much easier to try to keep the changes at least
roughly in a series of separate patches as I go along.

Our "submitting a patch" page has some general advice
and information on our patch processes:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html

thanks
-- PMM

