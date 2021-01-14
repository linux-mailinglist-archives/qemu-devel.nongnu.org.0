Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728EC2F557A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 01:12:48 +0100 (CET)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzqFr-00056W-GR
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 19:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzq5f-0002ID-1b
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:02:15 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:38231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzq5d-00080g-2w
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:02:14 -0500
Received: by mail-io1-xd2b.google.com with SMTP id e22so7794695iom.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 16:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=47PHZQKwzJJnlIJxehqPqQL5v3ul/RjG4++16AQBQ54=;
 b=IwHrsJYQ86uWAfH7GbwV6zeOecOJkfNAZxN6/X9UnGYgZsSGvU0M8Hj37vUjCeNPSB
 4CuTClYrfDo9Rb5i+7grcWTwSZmBpEi0SRHXYfSCq/l4kl5MLfwtbiwEZdE6APrT9AEx
 yQzqgfgGYArqSrR2NYyNBT9IHzkuhbSMknRJ25IaocSMgbIeB5wMiAcOexvNX2jvYye/
 3+7t8UHGPDhurrY56xmJcXmkwKJVdL6jgcjkVLZcYi+gfLbO08Ctl2fywgAik4Rtc62k
 BdY/EDJDO3Jp/2SEjYcMbQjAqLVtIL5WiGJ0lmACYAhKPYySOb9o31mjKRnt6yJ0yOv8
 Jdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=47PHZQKwzJJnlIJxehqPqQL5v3ul/RjG4++16AQBQ54=;
 b=nQFI23C2fEnmUo+2aWs58rZqm+OPa7RjXere/L0BPOJr/fwfInU8ppkXPiSUJHRZSE
 LgNp/IPKgHXfb6SzIY061oK2d4fXI6BT+N1HsFW4Pt5rGE/q02UqlTl95Pjg61VzEI4B
 Wws/GCrkm5/4Ta7RJaQopIArukrb8tSbXUX117gYfL8O7RsYnDKFE3VHcWi+RCTQ8A24
 /VgTVjxn2vbroViYTyEwnAwLnFMcjqKtzJhTbx0jUkJL/B+40pdXlGvS6iU7FAPDU4yj
 TscKiHzeA0E1ObX725A3iImkSxtJqX/mVYZwXD4rgUiWSssHrUULgFn8H9Su0Dli66BP
 gBXQ==
X-Gm-Message-State: AOAM531EuL4ZLZLUJVFFw34iZ5uMTZj5AN+IQn5yLlNuirNu5+oWc4w5
 jrobha1sAMRgTSuRGFALkLqMv4j4wyfVXSx5iGg=
X-Google-Smtp-Source: ABdhPJxP9u00CfxLCnvz0P3lpGgZZb2jZX6chcH+VYSwuVUvsJ3YYbsOaq0nPAIRRX8AZL7iek1bdg0/0+z9k3bejaA=
X-Received: by 2002:a92:c942:: with SMTP id i2mr4392162ilq.227.1610582531861; 
 Wed, 13 Jan 2021 16:02:11 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKNoUg9f-NdgAoGrq_DuBwWv_ZgusArvOobxEYM1mpzbRA@mail.gmail.com>
 <mhng-5ca93c0e-3134-4384-915f-23c4aed71712@palmerdabbelt-glaptop1>
 <87y2jeai0s.fsf@linaro.org>
In-Reply-To: <87y2jeai0s.fsf@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 16:01:45 -0800
Message-ID: <CAKmqyKMy9e0sZ6RQriu1-GU9uSwcCotG1gweewwj9XvKq8Rryw@mail.gmail.com>
Subject: Re: Emulation for riscv
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Moises Arreola <moyarrezam@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 6, 2020 at 2:36 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Palmer Dabbelt <palmer@dabbelt.com> writes:
>
> > On Thu, 22 Oct 2020 17:56:38 PDT (-0700), alistair23@gmail.com wrote:
> >> On Thu, Oct 22, 2020 at 4:58 PM Moises Arreola <moyarrezam@gmail.com> =
wrote:
> >>>
> >>> Hello everyone, my name is Moses and I'm trying to set up a VM for a =
risc-v processor, I'm using the Risc-V Getting Started Guide and on the fin=
al step I'm getting an error while trying to launch the virtual machine usi=
ng the cmd:
> >>
> >> Hello,
> >>
> >> Please don't use the RISC-V Getting Started Guide. Pretty much all of
> >> the information there is out of date and wrong. Unfortunately we are
> >> unable to correct it.
> >>
> >> The QEMU wiki is a much better place for information:
> >> https://wiki.qemu.org/Documentation/Platforms/RISCV
> >
> > Ya, everything at riscv.org is useless.  It's best to stick to the open=
 source
> > documentation, as when that gets out of date we can at least fix it.  U=
sing a
> > distro helps a lot here, the wiki describes how to run a handful of pop=
ular
> > ones that were ported to RISC-V early but if your favorite isn't on the=
 list
> > then it may have its own documentation somewhere else.
>
> Even better if you could submit some .rst pages for QEMU's git:
>
>   docs/system/target-riscv.rst
>   docs/system/riscv/virt.rst (and maybe the other models)
>
> then we could improve the user manual where RiscV is currently a little
> under-represented. A number of the systems have simple example command
> lines or explain the kernel support needed for the model.

Thanks for pointing that out Alex. Bin has sent some patches for this
so RISC-V should have a presence soon.

Alistair

>
> >
> >>> sudo qemu-system-riscv64 -nographic -machine virt \
> >>> -kernel linux/arch/riscv/boot/Image -append "root=3D/dev/vda ro conso=
le=3DttyS0" \
> >>> -drive file=3Dbusybox,format=3Draw,id=3Dhd0 \
> >>> -device virtio-blk-device,drive=3Dhd0
> >>>
> >>> But what I get in return is a message telling me that the file I gave=
 wasn't the right one, the actual output is:
> >>>
> >>> qemu-system-riscv64: -drive file=3Dbusybox,format=3Draw,id=3Dhd0: A r=
egular file was expected by the 'file' driver, but something else was given
> >>>
> >>> And I checked the file busybox with de cmd "file" and got the followi=
ng :
> >>> busybox: ELF 64-bit LSB executable, UCB RISC-V, version 1 (SYSV), dyn=
amically linked, interpreter /lib/ld-linux-riscv64-lp64d.so.1, for GNU/Linu=
x 4.15.0, stripped
> >>
> >> That looks like an ELF, which won't work when attached as a drive.
> >>
> >> How are you building this rootFS?
> >>
> >> Alistair
> >>
> >>>
> >>> So I was wondering if the error message was related to qemu.
> >>> Thanks in advance for answering any suggestions are welcome
>
>
> --
> Alex Benn=C3=A9e

