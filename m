Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF73711E6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 09:13:39 +0200 (CEST)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldSlt-0003ZT-Rj
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 03:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldSkp-000376-BE
 for qemu-devel@nongnu.org; Mon, 03 May 2021 03:12:31 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldSkn-0007Ym-9W
 for qemu-devel@nongnu.org; Mon, 03 May 2021 03:12:31 -0400
Received: by mail-qk1-x734.google.com with SMTP id i67so1042709qkc.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GicC2B9U64j4ceSZdsQt3D7aP8J7sCZvXfK3F1DgSdE=;
 b=C47O/oynshwr1/u+BAufLStRrC1B+9lw+hZTNRZN+RWLXM6DfPg1C2AW0fjM3PkmWl
 Rq2l4k7QeTAbYTdktDoVpZJixMOn6mPzQWVm8i710OjsguJtg1atypf892rBJJgTCkYr
 D6EuHn7zpOHcNmV4OjOlCiDY/ebfb/hoYxEBldGKMI8LMEwLvMA/C1vusaMbTt/MbAzW
 ShnvR772FnRtNiGxgyCkxRtCWFUMhi3c5mU2b3/45uGIwsrufM6Z61z3Frsf2TG1eTDi
 d6yid7Cy56o6J+SBwl73TkF/7JkyFz5WyHYcwqO/0eMn5k+M+HDQ7wpLtVib6K4Oy4ZW
 KsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GicC2B9U64j4ceSZdsQt3D7aP8J7sCZvXfK3F1DgSdE=;
 b=NdD3qQflwsrh7vivPuj1cmSWjHsQAADqBcoVd7bWPO4HquJKsif6KXKiLqV/T2HGyY
 JPqrdEKh/Tlj5kuBNEySDrImHsjFzBhTHcCOTnqWRKz0s773jc1xKgG7nq66Q2G1aX3A
 jd275AJj6YVBvNDtuL4MONdBqu41gSWTMHxw8yA2h+jK+4E2e5jE57ZwTvHsTrYqw1JJ
 bUmvI9IX/GNq9kTy37X8F6ROW7UZvQAK1QpNgPoGKlscsxG9GRIiqTsmEjN+euWEv2VG
 EBoiIV6wCBPxvGbmGzBqyZopMjdFM5mq5DWERdOnpHBfHFjDjHR+FyWlRu5fV+Pm9FEI
 nQSg==
X-Gm-Message-State: AOAM531uN36ZD/k5CH2HL2zMtbdJIn7M/rOGq7XcNbmzWO79tFpv3MsD
 9yjv9Pau1WEJX2i6HuFsQQtEMPaeHEQjBYpR2d0=
X-Google-Smtp-Source: ABdhPJx8rPzuzrQ/CQzUyyY61Of9cij69fmq3NepThWkTBiMn58QFQRJFT3DIMN/X+Zh3WYzVBu2vPbRXluha7r5/XA=
X-Received: by 2002:a37:b807:: with SMTP id i7mr17781719qkf.126.1620025947898; 
 Mon, 03 May 2021 00:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <CAKmqyKPYu1Y5EaAvVgB9U4kCh4yBJG_75r6ivdvMuZDN6F3ZcQ@mail.gmail.com>
 <17b136e5-5811-27e2-224a-47795eb68bb5@redhat.com>
In-Reply-To: <17b136e5-5811-27e2-224a-47795eb68bb5@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 May 2021 17:12:01 +1000
Message-ID: <CAKmqyKOtnRvXZffxc_8zZUYQxwFFO9cEocU0cRkUs3PGJnCNVQ@mail.gmail.com>
Subject: Re: Let's remove some deprecated stuff
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x734.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 3, 2021 at 2:49 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 03/05/2021 03.41, Alistair Francis wrote:
> > On Thu, Apr 29, 2021 at 8:00 PM Markus Armbruster <armbru@redhat.com> w=
rote:
> >>
> >> If you're cc'ed, you added a section to docs/system/deprecated.rst tha=
t
> >> is old enough to permit removal.  This is *not* a demand to remove, it=
's
> >> a polite request to consider whether the time for removal has come.
> >> Extra points for telling us in a reply.  "We should remove, but I can'=
t
> >> do it myself right now" is a valid answer.  Let's review the file:
> >>
> >>      System emulator command line arguments
> >>      --------------------------------------
> >>
> >> K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n:
> >>
> >>      ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since =
4.0)
> >>      '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
''''
> >>
> >>      The ``-audiodev`` argument is now the preferred way to specify au=
dio
> >>      backend settings instead of environment variables.  To ease migra=
tion to
> >>      the new format, the ``-audiodev-help`` option can be used to conv=
ert
> >>      the current values of the environment variables to ``-audiodev`` =
options.
> >>
> >> K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n:
> >>
> >>      Creating sound card devices and vnc without ``audiodev=3D`` prope=
rty (since 4.2)
> >>      '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
'''''''''''''
> >>
> >>      When not using the deprecated legacy audio config, each sound car=
d
> >>      should specify an ``audiodev=3D`` property.  Additionally, when u=
sing
> >>      vnc, you should specify an ``audiodev=3D`` property if you plan t=
o
> >>      transmit audio through the VNC protocol.
> >>
> >> Gerd Hoffmann:
> >>
> >>      Creating sound card devices using ``-soundhw`` (since 5.1)
> >>      ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> >>
> >>      Sound card devices should be created using ``-device`` instead.  =
The
> >>      names are the same for most devices.  The exceptions are ``hda`` =
which
> >>      needs two devices (``-device intel-hda -device hda-duplex``) and
> >>      ``pcspk`` which can be activated using ``-machine
> >>      pcspk-audiodev=3D<name>``.
> >>
> >> [...]
> >>
> >> Alistair Francis:
> >>
> >>      RISC-V ``-bios`` (since 5.1)
> >>      ''''''''''''''''''''''''''''
> >>
> >>      QEMU 4.1 introduced support for the -bios option in QEMU for RISC=
-V for the
> >>      RISC-V virt machine and sifive_u machine. QEMU 4.1 had no changes=
 to the
> >>      default behaviour to avoid breakages.
> >>
> >>      QEMU 5.1 changes the default behaviour from ``-bios none`` to ``-=
bios default``.
> >>
> >>      QEMU 5.1 has three options:
> >>       1. ``-bios default`` - This is the current default behavior if n=
o -bios option
> >>            is included. This option will load the default OpenSBI firm=
ware automatically.
> >>            The firmware is included with the QEMU release and no user =
interaction is
> >>            required. All a user needs to do is specify the kernel they=
 want to boot
> >>            with the -kernel option
> >>       2. ``-bios none`` - QEMU will not automatically load any firmwar=
e. It is up
> >>            to the user to load all the images they need.
> >>       3. ``-bios <file>`` - Tells QEMU to load the specified file as t=
he firmwrae.
> >>
> >
> > This has already been acted upon in the code, we now default to
> > including a "bios" with RISC-V softmmu which is what this is
> > describing.
> >
> > Do we need to take any action to indicate that it's already in effect?
>
> deprecated.rst is mainly thought for the things that only have been marke=
d
> as deprecated, but not changed yet. Once it's done, the items normally ge=
t
> moved to docs/system/removed-features.rst instead.

Too easy, I'll move it there instead.

Alistair

>
>   Thomas
>

