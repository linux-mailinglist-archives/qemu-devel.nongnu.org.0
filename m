Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6BB59E409
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 15:12:48 +0200 (CEST)
Received: from localhost ([::1]:34060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQTi2-0000Ws-R8
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 09:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQTfO-0005VW-J6
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:10:02 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:36585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQTfH-0003Sr-2I
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 09:10:01 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3375488624aso348206117b3.3
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=l6D4OkRsSxRrpdxS778PHcilllcgsWp5HtxIEzGoemY=;
 b=L9NZJvY7kMoaAbOA5oTpmdFYAU6SKs95nq+5Q5j6TkmWUm8firZdonlzNDma42u68f
 AdNMbiy4PTmwehlLFuD5icqdB8TG5koDBJqcEULisNE8HwK74N6jmMKttTWByTKCZ+BN
 qY3qUxQPobZlFtfd7JxRTPwG9DRJcNcMsLg7ALjg7b2wmKee1/3Qm/tmcSNBSFkOec4w
 TneH5UeeUoKQofvHLNVfGlrND+W/9CqDLDjz+cXZHyAroSb4w3C931l3IZOJLjTAM+rJ
 +i+v0K+XFpIcJtupdiuVB+jf1xn2Gbtrb4y/8QzcPzJeVP/8Synq5Z3p67V9/G+7BiqR
 qW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=l6D4OkRsSxRrpdxS778PHcilllcgsWp5HtxIEzGoemY=;
 b=4yFv8QyI50sc1iYZVfSFSgrzDKVA97edIAVN/0qXhwXBnpNaJT7UdufBWX43w9f0T0
 CkCX8ZjB/X6SNtD6zYmuk20ZkiODhDas3ViWib4RBxoomq+Y62jwVaIkWL0ziU6HCyDH
 37132OI5FI/Mr4bJAuSIWONxBNOnVYHQXcjb8Bx7X9Jl4MM2Pi18NN4MUw+cA9EGEhx4
 lWqLuPtmV2gHiWdm++IMP4D2lVNcx1N0KYRmnHWpjgwwuR0IuwX+JHuVGusj6rTQnsdx
 c+LlF6dcyhGPer0Laf4445ayliQopCGLfX+JRcN53u2N7X5Cfh+UN6g5uUgPAgLQGlYU
 gK5A==
X-Gm-Message-State: ACgBeo2uU+lUdd2f0IWUZE1i6hekqsqUmKxNvxixz/N3QgUzm+SQubyf
 670jCKeqwJNi1lWSwhQ02U3zNVU4EyOkmFguqEcKcg==
X-Google-Smtp-Source: AA6agR4wf1NBp4Fo6j5Vk3mJFoXAjbgojAnt3+xDe+2riUwFpwtzJ1obLLhK2jaJHbC+xIvHeM7f07V01GLjXmAUeF0=
X-Received: by 2002:a05:6902:10c3:b0:695:e4a3:ea8f with SMTP id
 w3-20020a05690210c300b00695e4a3ea8fmr4848244ybu.288.1661260191530; Tue, 23
 Aug 2022 06:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org>
 <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
 <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
In-Reply-To: <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Aug 2022 14:09:09 +0100
Message-ID: <CAFEAcA8TmrMo+MOhOutUuwE=GOEFYUGxgRA2_XGZ2iunMTAe5w@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Shiny Saana <shinysaana@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Aug 2022 at 01:05, Shiny Saana <shinysaana@gmail.com> wrote:
> I've been able to write an initial Teensy 4.1 machine, for now with
> only the few important memory regions initialized, and successfully
> ran some hand-written ARM code on it.

Great, that's good progress!

> The documentation ( https://www.pjrc.com/teensy/IMXRT1060RM_rev3.pdf ),
> in section 9.7.1, gives some informations on how, in the actual
> Teensy board, the ROM, executed at boot, initialize the board
> peripherals, and also reads from a data structure included in the
> Flash memory (the user-provided program) where the CPU should jump
> to after the ROM has done its work (somewhere in that same Flash memory,
> usually).
>
> I was able to successfully dump the ROM of the real board and
> confirm this behavior. Given that the current plan is not to
> emulate every peripherals, I am of the opinion that writing a very
> simple ROM that merely reads this Flash provided data structure and
> jumps to the provided address sounds like a good starting point, so
> that I can keep iterating on writing more and more complex code
> through the provided Teensy toolchain, and implementing needed
> peripherals.
>
> As such, I have several questions:
>
> 1/ To replicate this behaviour, is this considered the correct
> approach by the current QEMU maintainers?

Yes, I think this is probably a reasonable way to go.

> 2/ If so, I have not been able to find any function that would be
> able to load data into a memory region "statically". Does one
> exist? Is there an alternative to this process?

Depends exactly what you want to do. If you want "let the user
load data to an arbitrary address", then the "generic loader"
is usually helpful:
https://www.qemu.org/docs/master/system/generic-loader.html

If you mean "C code within QEMU loads data to a specific place",
rom_add_blob_fixed_as() is probably what you want. This is how
hw/arm/boot.c loads both user-provided data files and the
hand-coded mini-bootloader into the guest.

> 3/ Regarding loading the "kernel" of the board, as part of the
> init process, I am calling the usual "armv7m_load_kernel" function
> with its usual parameters. However, it seems to load it as the
> very start of the address space, which is not where the flash
> memory is, and so is not where the kernel should be loaded. I
> wasn't able to find a workaround. Is there something I'm missing?

The behaviour of armv7m_load_kernel() depends on what kind
of file you pass to -kernel. If you pass -kernel an ELF file,
then it will get loaded to the addresses as specified by
the ELF file, so you can use that to put data anywhere you like.
If you pass it a raw binary file then, yeah, at the moment
that gets loaded to address 0. There's no real reason for this
limitation -- it's mainly because when that code was written
we supported very few M-profile boards, and all of them booted
from address 0. (That is, the board doesn't set either the
init-svtor or init-nsvtor properties on the armv7m object to
anything other than 0.) We could change how this works, but
the difficulty is that the desire for "Just Do What I Mean"
behaviour for a specific board tends to conflict with the
desire for all boards to behave in a consistent manner.
In particular, at the moment passing a binary file to -kernel
means "I want this to be loaded so that it has the
CPU vector table in it and execution starts from reset as
the architecture says it should"; it can't both mean that
consistently across M-profile boards and also mean "on the
teeny board, be an image file intended to boot via the ROM
loader".

Loading the teeny images via the generic loader rather than
via -kernel would be one way to sidestep this issue...

Do you know what the hardware sets the initial vector
base address to? (that is, where the ROM itself puts its
reset/interrupt vector table). I couldn't find anything in
the datasheet that said that.

(By the way, calling armv7m_load_kernel() is mandatory even if
you don't care about loading an image, because it's the function
that arranges that the CPU gets reset correctly.)

thanks
-- PMM

