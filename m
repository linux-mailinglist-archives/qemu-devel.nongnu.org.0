Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005EB3CEB46
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:17:37 +0200 (CEST)
Received: from localhost ([::1]:58102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ylk-0001eU-GV
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Ykh-0000zA-5l
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:16:31 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Ykf-00017q-9B
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:16:30 -0400
Received: by mail-ed1-x533.google.com with SMTP id ca14so25504391edb.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uJ5yzfpd9Bl52WNmwv/MVSz+tTtH+4mg+snx1pxwAok=;
 b=TRikOAdV0f3501KTVeNAkgLuuYybENxsAnSxc9lwtCgUYrtVa8qK/hmaIIrhkbcGrK
 OI0iNILvIORHkopP37MmMFDhLXilCSOjGT+TPizlxbvSSNz9fN/ImdqrBU7/hZRPk3DQ
 izLnmCjS3k6X5wnW62/M/knh59CxceN+7mJB0Q9zwfoHWtf0w37EwfCEl8i7g1KCDx3e
 STjR6aiFfN8E8nHtUOh1gYs0tsgksQg12XYuZ843ySGVrg1EzHF02oL5rL/DqEr6qXxn
 NQCVDXvWes700BWCj0pfb0vrj0FvfXPVIiTNw/Y+c8N7Ko6ufmxRxaB5Sq4jZIGVQkyM
 MHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uJ5yzfpd9Bl52WNmwv/MVSz+tTtH+4mg+snx1pxwAok=;
 b=EMRVW7judsVojp08lG0CspCXkENkxiOUkL9px9JKiTIzkESR5SduidiM3TCLhdRWls
 2iz/hnaaSFlOyGTuL+dUYobwagJ6CGdEDNQB6gefDx4lkOBABLmysoRdIYpKxgDmunyc
 FU4sRr+E6HfgqujMKOmClXIvuE8LOc47lPXnsi66FBt4sY0nsW9dCz4+FepGQ4BIJuhy
 jur8SqbGHEWZN7dh2g2V6GtC5GIxGUcy36pUYIlls+sPyZvwvoEb18qHPLQmnxxyUJ1E
 94EwtqCdpNjNirwz9/sBXaPr7FUHrsDloqaF3A45W0OhS1kPaL2NIaJOKFF69678cNB7
 Ikxw==
X-Gm-Message-State: AOAM530nG07G11YycU2mMo3iG/89ZX0dlY0+VIZ5x+NfEEQzySa7bsnm
 V3h9bIFIDRYe7GDxo/LyMN0I9LNVnZ3bhPeA7jvy6w==
X-Google-Smtp-Source: ABdhPJyiLs+edTA4smwD9PlwIntYL4RupxIQrXkUH4ng4Izk4E9Rcu5q0TlvcH9S0+anf4nTszrRTWGiv9hFYvQ1tG0=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr35709412eds.204.1626722187159; 
 Mon, 19 Jul 2021 12:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210708151748.408754-1-pbonzini@redhat.com>
 <20210708151748.408754-45-pbonzini@redhat.com>
 <CAFEAcA9=6pqDQb4fpa91F5L6FfiBb505+f=ZMv6b=sekkT8UEw@mail.gmail.com>
In-Reply-To: <CAFEAcA9=6pqDQb4fpa91F5L6FfiBb505+f=ZMv6b=sekkT8UEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 20:15:46 +0100
Message-ID: <CAFEAcA_72ySeSGD88hCcOJgA7EwLObMFPPkzQZnsXV6FqPFZRQ@mail.gmail.com>
Subject: Re: [PULL 44/48] meson: Introduce target-specific Kconfig
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 23:59, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 8 Jul 2021 at 16:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> > Add a target-specific Kconfig. We need the definitions in Kconfig so
> > the minikconf tool can verify they exits. However CONFIG_FOO is only
> > enabled for target foo via the meson.build rules.
> >
> > Two architecture have a particularity, ARM and MIPS. As their
> > translators have been split you can potentially build a plain 32 bit
> > build along with a 64-bit version including the 32-bit subset.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Message-Id: <20210707131744.26027-2-alex.bennee@linaro.org>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Hi; this change (commit f4063f9c319e392 in master) seems to have
> resulted in qemu-system-tricore no longer building the
> 'tricore_testboard'. Before this commit:
>
> $ ./build/tricore/qemu-system-tricore -M help
> Supported machines are:
> KIT_AURIX_TC277_TRB  Infineon AURIX TriBoard TC277 (D-Step)
> none                 empty machine
> tricore_testboard    a minimal TriCore board
>
> After this commit, 'tricore_testboard' no longer appears in the list.
> The hw/tricore/meson.build uses "when: 'CONFIG_TRICORE'" to
> compile the source files for the board, so presumably that
> CONFIG switch is no longer being defined ?

This seems to be caused because when "CONFIG_FOO=3Dy" is passed on
the minikconf commandline it doesn't appear in the output (though
it is not ignored entirely, because other config options that
FOO selects do appear in the output). For example from my
meson-logs/meson-log.txt:

Configuring arm-softmmu-config-devices.mak with command
Running command: /usr/bin/python3
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/scripts/minikconf.py
--defconfig arm-softmmu-config-devices.mak
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/x86/meson-private/arm-soft=
mmu-config-devices.mak.d
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/devices/arm-softmmu/defa=
ult.mak
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/Kconfig CONFIG_TPM=3Dy
CONFIG_SPICE=3Dy CONFIG_IVSHMEM=3Dy CONFIG_OPENGL=3Dy CONFIG_X11=3Dy
CONFIG_VHOST_USER=3Dy CONFIG_VHOST_VDPA=3Dy CONFIG_VHOST_KERNEL=3Dy
CONFIG_VIRTFS=3Dy CONFIG_LINUX=3Dy CONFIG_MULTIPROCESS_ALLOWED=3Dy
CONFIG_TCG=3Dy CONFIG_ARM=3Dy
--- stdout ---
CONFIG_A15MPCORE=3Dy
CONFIG_A9MPCORE=3Dy
[etc]

CONFIG_ARM doesn't apper in the stdout, and so it's not
possible to use it to select something in meson. None
of the other CONFIG_* passed on the commandline appear
in stdout either.

If you look at the aarch64 version:
Running command: /usr/bin/python3
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/scripts/minikconf.py
--defconfig aarch64-softmmu-config-devices.mak
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/x86/meson-private/aarch64-=
softmmu-config-devices.mak.d
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/devices/aarch64-softmmu/=
default.mak
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/Kconfig CONFIG_TPM=3Dy
CONFIG_SPICE=3Dy CONFIG_IVSHMEM=3Dy CONFIG_OPENGL=3Dy CONFIG_X11=3Dy
CONFIG_VHOST_USER=3Dy CONFIG_VHOST_VDPA=3Dy CONFIG_VHOST_KERNEL=3Dy
CONFIG_VIRTFS=3Dy CONFIG_LINUX=3Dy CONFIG_MULTIPROCESS_ALLOWED=3Dy
CONFIG_TCG=3Dy CONFIG_AARCH64=3Dy

CONFIG_AARCH64 doesn't appear in the output, but CONFIG_ARM
does (because AARCH64 selects it).

The only board that gets hit by this is tricore, because as
it happens we don't try to gate anything else on CONFIG_$ARCH.
(Which raises the question of what these CONFIG flags are for
in the first place...)

thanks
-- PMM

