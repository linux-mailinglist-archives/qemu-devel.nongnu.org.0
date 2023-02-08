Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3B68F6A4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:10:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPotF-0006TH-3F; Wed, 08 Feb 2023 13:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPotC-0006QO-SE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:09:50 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPotA-000351-PA
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:09:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F966B81F05
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 18:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811FCC433D2
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 18:09:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YScLU8WA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675879781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JOYXip39glVdXPnOanB6zCygr3LW1kqcLdaTjLZq8co=;
 b=YScLU8WAJq7zwx9zPZ1j0O4lJ0E9MGIw3bTecZY3+p4blqSvxpNVyXXHt8pwtsfBupsaCq
 osDAFQYqJaGtlvB9yWem8HoiDailPYKWj02IHDg9raADmvFyL0zzIwfTPJMzaw9h2LoKYN
 Bsl7/63McqgISxXWTrg/gjA/RiDmtg8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 35d79819
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 8 Feb 2023 18:09:41 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id u7so7163928ybi.6
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 10:09:40 -0800 (PST)
X-Gm-Message-State: AO0yUKWLohkZfQKsoe8S+VUL/Zdzv5IABlDm55+eR507iEFtx9a7ywoy
 HEfHUXMXxrmnFUR/Vx/DAXcAVwAa1eB6pK2YDNA=
X-Google-Smtp-Source: AK7set/Vl0tbDv9vbUQB8vt8A1LEoBKakLCdjnLoynIZLxn24iZnqQ4wyt+6FLRh05grhGgr5YqLXGyE1uSKalC6Bq0=
X-Received: by 2002:a25:9f90:0:b0:87b:121:93d8 with SMTP id
 u16-20020a259f90000000b0087b012193d8mr743695ybq.231.1675879780079; Wed, 08
 Feb 2023 10:09:40 -0800 (PST)
MIME-Version: 1.0
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
 <Y+Pf0q6LmQKN+FHo@dev-arch.thelio-3990X>
 <CAHmME9pQ6yvRQzzT_k0vmDFi4QioCfgryCebhvfNCWNP_tkddQ@mail.gmail.com>
In-Reply-To: <CAHmME9pQ6yvRQzzT_k0vmDFi4QioCfgryCebhvfNCWNP_tkddQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Feb 2023 15:09:27 -0300
X-Gmail-Original-Message-ID: <CAHmME9rqCpEHAdJhKNACVx2a_o6LNS4Hy5ff6pX6o5oeJCRZOg@mail.gmail.com>
Message-ID: <CAHmME9rqCpEHAdJhKNACVx2a_o6LNS4Hy5ff6pX6o5oeJCRZOg@mail.gmail.com>
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
To: Nathan Chancellor <nathan@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org, 
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org, 
 kraxel@redhat.com, hpa@zytor.com, bp@alien8.de, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 8, 2023 at 2:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Nathan (and MST),
>
> On Wed, Feb 8, 2023 at 2:45 PM Nathan Chancellor <nathan@kernel.org> wrot=
e:
> >
> > Hi Jason,
> >
> > On Fri, Dec 30, 2022 at 11:07:25PM +0100, Jason A. Donenfeld wrote:
> > > The setup_data links are appended to the compressed kernel image. Sin=
ce
> > > the kernel image is typically loaded at 0x100000, setup_data lives at
> > > `0x100000 + compressed_size`, which does not get relocated during the
> > > kernel's boot process.
> > >
> > > The kernel typically decompresses the image starting at address
> > > 0x1000000 (note: there's one more zero there than the compressed imag=
e
> > > above). This usually is fine for most kernels.
> > >
> > > However, if the compressed image is actually quite large, then
> > > setup_data will live at a `0x100000 + compressed_size` that extends i=
nto
> > > the decompressed zone at 0x1000000. In other words, if compressed_siz=
e
> > > is larger than `0x1000000 - 0x100000`, then the decompression step wi=
ll
> > > clobber setup_data, resulting in crashes.
> > >
> > > Visually, what happens now is that QEMU appends setup_data to the ker=
nel
> > > image:
> > >
> > >           kernel image            setup_data
> > >    |--------------------------||----------------|
> > > 0x100000                  0x100000+l1     0x100000+l1+l2
> > >
> > > The problem is that this decompresses to 0x1000000 (one more zero). S=
o
> > > if l1 is > (0x1000000-0x100000), then this winds up looking like:
> > >
> > >           kernel image            setup_data
> > >    |--------------------------||----------------|
> > > 0x100000                  0x100000+l1     0x100000+l1+l2
> > >
> > >                                  d e c o m p r e s s e d   k e r n e =
l
> > >                      |-----------------------------------------------=
--------------|
> > >                 0x1000000                                            =
         0x1000000+l3
> > >
> > > The decompressed kernel seemingly overwriting the compressed kernel
> > > image isn't a problem, because that gets relocated to a higher addres=
s
> > > early on in the boot process, at the end of startup_64. setup_data,
> > > however, stays in the same place, since those links are self referent=
ial
> > > and nothing fixes them up.  So the decompressed kernel clobbers it.
> > >
> > > Fix this by appending setup_data to the cmdline blob rather than the
> > > kernel image blob, which remains at a lower address that won't get
> > > clobbered.
> > >
> > > This could have been done by overwriting the initrd blob instead, but
> > > that poses big difficulties, such as no longer being able to use memo=
ry
> > > mapped files for initrd, hurting performance, and, more importantly, =
the
> > > initrd address calculation is hard coded in qboot, and it always grow=
s
> > > down rather than up, which means lots of brittle semantics would have=
 to
> > > be changed around, incurring more complexity. In contrast, using cmdl=
ine
> > > is simple and doesn't interfere with anything.
> > >
> > > The microvm machine has a gross hack where it fiddles with fw_cfg dat=
a
> > > after the fact. So this hack is updated to account for this appending=
,
> > > by reserving some bytes.
> > >
> > > Cc: x86@kernel.org
> > > Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > > Cc: H. Peter Anvin <hpa@zytor.com>
> > > Cc: Borislav Petkov <bp@alien8.de>
> > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >
> > I apologize if this has already been reported/fixed already (I did a
> > brief search on lore.kernel.org) or if my terminology is not as precise
> > as it could be, I am a little out of my element here :)
> >
> > After this change as commit eac7a7791b ("x86: don't let decompressed
> > kernel image clobber setup_data") in QEMU master, I am no longer able t=
o
> > boot a kernel directly through OVMF using '-append' + '-initrd' +
> > '-kernel'. Instead, systemd-boot tries to start the distribution's
> > kernel, which fails with:
> >
> >   Error registering initrd: Already started
> >
> > This can be reproduced with just a defconfig Linux kernel (I used
> > 6.2-rc7), the simple buildroot images that ClangBuiltLinux uses for
> > boot testing [1], and OVMF. Prior to this change, the kernel would star=
t
> > up but after, I am dumped into the UEFI shell (as there is no
> > bootloader).
> >
> > The QEMU command I used was:
> >
> > $ qemu-system-x86_64 \
> >     -kernel arch/x86_64/boot/bzImage \
> >     -append "console=3DttyS0 earlycon=3Duart8250,io,0x3f8" \
> >     -drive if=3Dpflash,format=3Draw,file=3D/usr/share/edk2/x64/OVMF_COD=
E.fd,readonly=3Don
> >     -drive if=3Dpflash,format=3Draw,file=3D../boot-utils/images/x86_64/=
OVMF_VARS.fd \
>
> Oh no... Without jumping into it, at first glance, I have absolutely
> no idea. I suppose I could start debugging it and probably come up
> with a solution, but...
>
> @mst - I'm beginning to think that this whole setup_data route is
> cursed. This is accumulating hacks within hacks within hacks. What
> would you think if I just send a patch *removing* all use of
> setup_data (the rng seed and the dtb thing), and then we can gradually
> add that back with an actual overarching design. For example, it'd
> probably make sense to have a separate fwcfg file for setup_data
> rather than trying to mangle and existing one, etc. This way, we
> unbreak the tree, and let the new approach be reviewed more
> reasonably.

Sent as https://lore.kernel.org/qemu-devel/20230208180835.234638-1-Jason@zx=
2c4.com/

