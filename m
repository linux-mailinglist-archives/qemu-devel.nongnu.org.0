Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EFE3EF01A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:20:28 +0200 (CEST)
Received: from localhost ([::1]:37684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1pD-00013K-Si
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1oI-0000Ac-66
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:19:30 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1oG-0000cb-7E
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:19:29 -0400
Received: by mail-ed1-x530.google.com with SMTP id dj8so24453654edb.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 09:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l39qz/4mBUJGpydjHQjtSShdciU4t6f11zbUvrAddo8=;
 b=xMNec352TFIkQkGXstVyOsAkMi97NxlsILh0L1n0tMpv6Y0rJE21uWU00DfPDZposy
 R7R5W6fd8bqojBih9PVWEWq0+Uvr8bwGz4Tb3s24UVJUpe0D7jK4nt6a1FJI92egoZpe
 Yx6FNeYbbaBdPGQYHTzeiMmG8SmOV73eZVFP2tXsq/kvSba4FvajQDGinETp7dISqXYL
 rg0Akd7GVnTPFrsqQ9x9YufHxqTzhPMlRKlRyd4RAIST1ZAUF9gzdxKyKmZrHwgSvuv3
 xUYR+jGM7HJqEgDuxHtKs6CumyAHuHoIHIa6CfxoYIg92vmKbhK2arH2khSC1v7rXYfT
 A5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l39qz/4mBUJGpydjHQjtSShdciU4t6f11zbUvrAddo8=;
 b=EjXyxTZ8sMMLiIGKNzEsGbHB4kHQM/3mmhyKZQPRvdKRG3YDpVarSUpG6BuQYo5wgY
 Q16dMA8yF8eablvUqOFcafSzrXPI8qjfJ13vSV6f/TR30+AZA/JWfHtS3MM93GREJMs6
 5xnBYn+St3CHtsYG/LE3pUhPnS2JZu8OhdrgL27LTV5EhrktIKKUr6K1qOhsAtCDa08m
 hNddlcFqc2F0v4UzQR28q6RrGhvrgBEwapN1cqJ0GeFu77341hVr0wQD5Le4IHtTSBkV
 SRc0eBzY7eNP0Ai0RFCXhgo9w3QKzhggWYts6oos8FWDZ5xPl+VNgUcT7cQQvkuMwKtw
 rmTw==
X-Gm-Message-State: AOAM531/0PEHnzRibA+DXalxupjWR7H452jvEHqUJh1KlumLoSVcwoCe
 CnmcCUIbIns/6UmXnxlVvP8bHjKxluN9KFc0+s4Tmw==
X-Google-Smtp-Source: ABdhPJxiFj/r2RHUTjts2fiLTim3RqURM4TgY2a69iuCyKPs13Ht/03mxp5haShyLGDlUVcaDq9PP6v8O4SKFBcIxgU=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr4966036edb.52.1629217166283; 
 Tue, 17 Aug 2021 09:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp9HQ+uoPqu5vwCD8sCca99N5bV+aqD9Oea=VpTVT7Mb+A@mail.gmail.com>
 <30c3d9c2-08c3-6159-103d-d61ed41efb01@redhat.com>
In-Reply-To: <30c3d9c2-08c3-6159-103d-d61ed41efb01@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 17:18:40 +0100
Message-ID: <CAFEAcA-fTz-X7G==mvoEMyw5txY4nL3PR+TeXtnu0nmSum1saw@mail.gmail.com>
Subject: Re: Bootloading within QEMU?
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 16:57, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 17/08/21 16:31, Kenneth Adam Miller wrote:
> > I am trying to discover how to schedule QEMU to begin actual emulation
> > as currently my target correctly starts QEMU but only shows the shell,
> > and not even boot loading occurs within QEMU. I'm trying to learn from
> > example, and so will focus my questions only on X86.

x86 is the oldest of QEMU's target architectures and thus the
one most laden down with ancient "we wouldn't write it that way today"
code, backwards-compatibility cruft and other confusing encrustations.
It's not a good choice for trying to learn how a target architecture
should be structured, I'm afraid. Arm is good-in-parts but has a similar
amount of old code and back-compat junk (we have overhauled the translate.c
code massively, so that part is good, unlike the i386 translate.c which
is absolutely dreadful). You might try riscv, that's a lot newer.

> > I can see the
> > MachineClass and MachineState types, and I have tried to follow QEMU
> > with the debugger and found where QEMU calls qemu_init and
> > qemu_main_loop under qemu/softmmu/main.c, and even tried to follow
> > through from init to main loop to see where it would begin booting, but
> > I cannot see where the bootloader is scheduled or specified or started
> > from within the target occurs.
>
> There are two possibilities:
>
> 1) QEMU loads a fixed firmware file, usually at a fixed address in
> memory so that the reset vector of the CPU is inside the firmware.  This
> is what happens for example on x86.  The firmware ultimately boots the
> machine (e.g. on x86 you have BIOS->GRUB->Linux or something like that).
>
> 2) QEMU loads a binary specified on the command line---typically with
> -kernel, which is stored in current_machine->kernel_filename---and
> somehow arranges for the guest to execute that file when it starts.  For
> example one possibility is to write a jump instruction at the CPU reset
> vector (see riscv_setup_rom_reset_vec for an example).  The functions
> you want to look at for the loading part are load_elf_ram*, and
> load_uimage_as and load_image_targphys_as.

For a new architecture I would strongly suggest avoiding putting
any more magic into the "-kernel" handling than you can avoid.
You probably do want it to do "load a Linux kernel with whatever
the standard image format and boot protocol that implies", but
stick to exactly that (and if you can avoid it, don't even implement
that). Definitely don't overload it with "and if it's an ELF file then
load it like an ELF file too" or supporting 15 different kinds of file
format or other "do what I mean" handling.

You can do generic "load an ELF file" with the generic-loader
https://qemu-project.gitlab.io/qemu/system/generic-loader.html
which requires no architecture or board specific handling --
as the name suggests, it is generic ;-) . This makes it different
from the -kernel and -bios options, which both need at least
some handling in the board code.

A general recommendation: to the extent that you can do so, avoid
implementing behaviour in QEMU which is not just "same thing the
real hardware does". When you're implementing "what the hardware
does" you have a concrete specification that defines what the
"right thing" is, people writing code for it hopefully already
know what that behaviour is, and you can generally point your users
at the h/w docs for specifics rather than having to write them
up in the QEMU docs. As soon as you wander off into the realms
of "it would be kind of convenient if QEMU directly booted this
file I had lying around" (which usually implies emulating some
behaviour that is not that of the hardware but of firmware or
a bootloader) things get a lot murkier and you can end up with
a bit of a mess, especially over time. Worse, that mess is hard
to back out of because we don't like to break backwards-compatibility
for user command lines that worked with previous QEMU versions.
target/arm's "let's just pretend we're a bootloader because
it's convenient" code was initially about 100 lines long;
today it is more than ten times that size...

-- PMM

