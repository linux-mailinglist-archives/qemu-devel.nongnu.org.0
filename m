Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A159A371065
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 03:42:39 +0200 (CEST)
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldNba-0002e8-6V
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 21:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldNan-0002Cd-Ro
 for qemu-devel@nongnu.org; Sun, 02 May 2021 21:41:49 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldNam-0002eo-18
 for qemu-devel@nongnu.org; Sun, 02 May 2021 21:41:49 -0400
Received: by mail-qt1-x833.google.com with SMTP id a18so2673172qtj.10
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 18:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zTNwBny3wLcWZ5NHEWwEEUTAadGllGCLBkr91ZDNXn8=;
 b=F/TgBYGNYGYG0bTcDQTJbpg4v18MI4C//nGM4oexB03ZYq8AWLjM12dhj7x5vTI/Oo
 NvdJokxytR6LxCk9KRthDa0S26+ecDaOhFEmj0ypAuz0rNXuHTx+PaACSflQ7by0Zw+9
 CheOzQcggF2EB5L8slfZJ+iMjhykGjV027GEOpQE4reLzNmH3V3hFJGL0xAH50VAAAbv
 Fu8tjP3gafMFPOS77s7u5OrzTO5upurohWBdP/30XgmQtLoyBi8iJV7sEcXBc7q5zKJe
 vN6jxylATQWBfFguQ3dL/6c2M2MQWKpDJFlFMFFVfFE+eo9iZDDQjp+7scASF50Y6Tlg
 NjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zTNwBny3wLcWZ5NHEWwEEUTAadGllGCLBkr91ZDNXn8=;
 b=UtEaSozSp0u+kDC7wIAAXng1yZdMD0GNVhXjlghJ7DlLJKt0YbIMhZAtCeAsKH0+LA
 0jZLUv/5fDw2kC/BpXQywkJqUGPR7HtXj/aNGwV2RKJ6OHU53TzP+K9Hdu7zxyUZRjiL
 Kc2U2NcOZI3u7GpVrmSyKYWum2il0JIkTjw/OE6A6PF+1+dUhXre+LJazGd1tjFOCvfG
 T/vFYwmJ20g1Ky1RrbgE/JGVSfZZnmOJE9jo4p8iiAxJCO5lQzcg9TXMoXDbrT0aPiNv
 pteVf13cvCQAB7bDEjOvfuyN399iQ3RzoDUc9XQjDxN6JXRgU0yCd55ejM6tRs3gyXaF
 nKsQ==
X-Gm-Message-State: AOAM531iKsptClZIie2oiDB0GTUW5Sb+MdWoDdjYyee1zI21flo0aJAn
 B1m83ha5LU2Jf09CM1vJAEx9jAKbS0YfrKCWYdA=
X-Google-Smtp-Source: ABdhPJzDyvcf7EkNzIJe8p9LLyScPuKNm9G5pPdKyTap7nEF1iwLcrQnncA8tZS2eAjzpq1lrZ4CE1mLms3GfZAmaGY=
X-Received: by 2002:ac8:5810:: with SMTP id g16mr14675458qtg.135.1620006105531; 
 Sun, 02 May 2021 18:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 May 2021 11:41:18 +1000
Message-ID: <CAKmqyKPYu1Y5EaAvVgB9U4kCh4yBJG_75r6ivdvMuZDN6F3ZcQ@mail.gmail.com>
Subject: Re: Let's remove some deprecated stuff
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=alistair23@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 8:00 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> If you're cc'ed, you added a section to docs/system/deprecated.rst that
> is old enough to permit removal.  This is *not* a demand to remove, it's
> a polite request to consider whether the time for removal has come.
> Extra points for telling us in a reply.  "We should remove, but I can't
> do it myself right now" is a valid answer.  Let's review the file:
>
>     System emulator command line arguments
>     --------------------------------------
>
> K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n:
>
>     ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>
>     The ``-audiodev`` argument is now the preferred way to specify audio
>     backend settings instead of environment variables.  To ease migration=
 to
>     the new format, the ``-audiodev-help`` option can be used to convert
>     the current values of the environment variables to ``-audiodev`` opti=
ons.
>
> K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n:
>
>     Creating sound card devices and vnc without ``audiodev=3D`` property =
(since 4.2)
>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
'''''''''
>
>     When not using the deprecated legacy audio config, each sound card
>     should specify an ``audiodev=3D`` property.  Additionally, when using
>     vnc, you should specify an ``audiodev=3D`` property if you plan to
>     transmit audio through the VNC protocol.
>
> Gerd Hoffmann:
>
>     Creating sound card devices using ``-soundhw`` (since 5.1)
>     ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>
>     Sound card devices should be created using ``-device`` instead.  The
>     names are the same for most devices.  The exceptions are ``hda`` whic=
h
>     needs two devices (``-device intel-hda -device hda-duplex``) and
>     ``pcspk`` which can be activated using ``-machine
>     pcspk-audiodev=3D<name>``.
>
> [...]
>
> Alistair Francis:
>
>     RISC-V ``-bios`` (since 5.1)
>     ''''''''''''''''''''''''''''
>
>     QEMU 4.1 introduced support for the -bios option in QEMU for RISC-V f=
or the
>     RISC-V virt machine and sifive_u machine. QEMU 4.1 had no changes to =
the
>     default behaviour to avoid breakages.
>
>     QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-bios=
 default``.
>
>     QEMU 5.1 has three options:
>      1. ``-bios default`` - This is the current default behavior if no -b=
ios option
>           is included. This option will load the default OpenSBI firmware=
 automatically.
>           The firmware is included with the QEMU release and no user inte=
raction is
>           required. All a user needs to do is specify the kernel they wan=
t to boot
>           with the -kernel option
>      2. ``-bios none`` - QEMU will not automatically load any firmware. I=
t is up
>           to the user to load all the images they need.
>      3. ``-bios <file>`` - Tells QEMU to load the specified file as the f=
irmwrae.
>

This has already been acted upon in the code, we now default to
including a "bios" with RISC-V softmmu which is what this is
describing.

Do we need to take any action to indicate that it's already in effect?

Alistair

