Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187EF3FA52F
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 12:53:45 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJvy2-0001PL-Li
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 06:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJvvu-0000KA-VQ
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 06:51:32 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJvvt-0003Ao-5j
 for qemu-devel@nongnu.org; Sat, 28 Aug 2021 06:51:30 -0400
Received: by mail-ej1-x633.google.com with SMTP id h9so19630177ejs.4
 for <qemu-devel@nongnu.org>; Sat, 28 Aug 2021 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7aAkV1CGb7+IShcjFyAVU7OvhH5fkDA+TbkiNj4vyQ=;
 b=T21fC0tj19k57Ytp8jEoKAA1mzfZduoBl02mXYsKjDNXVSGEaaCmKrh+Qe/gq2JbeW
 cLV7QjwQ0qD1tMjX8eIITSabNdogVe21mRcbqMEF8zJTVbXJCVr22KC2zjVRw1QTVU0P
 o9BD1EsrjWge7RASmSEuSIl515n+HKIm2+1Ek6jZ1swED+de+9ZAn5H3XDiA4scp+eMa
 U8ZMNVSjerMQ4uHby9KtY8345YqwPSX5tNusSfy8+MX2qaKFrzQwCEK2qgh270lLZC33
 DFK+z1OJ9LqtqAVJ5cFcV/a/HcZYiBEhqOO0KI3tzs/ElVMax3gUwZj8nJ+A5Y6I3KY1
 ZYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7aAkV1CGb7+IShcjFyAVU7OvhH5fkDA+TbkiNj4vyQ=;
 b=ILeAes3ironaDmR1COo8u0529DE8QeTD2H3CN28xQjOand6yhk67E3KZyYpPD6+ACT
 TdSCZV9n9Bv7y0IojaMoP7w3VQUVgnkmSAFSgcEi6JsAlZ/u8RWaF6ADpYCEckwrmtWs
 0K3NWeKTyBuPI8Y4TbjYU9QPZAcXISYC6YQchExTHM109uQ19XEnL4GRVJ7go+Rb7pKh
 4pjvWJTR4JefwmKgGPhNaw5KgAEP5N+NGwQUoLUIeWDrtmiXDJUwq6nE1kdSwai3yGUF
 N3PNxdBI4PqvoA0BjQ42urA+MKgKZixBYEdVrN+tZ8MuT7NQeiAekMLvO5V/YZAn2j5r
 bwsQ==
X-Gm-Message-State: AOAM533mEsN89wKqF0KpOXOy3nmrD613VkAQbEPIbWattTeFrVvGrve3
 aU7UuvKDVzLs0dGXXKjMBw/DILobtus7eEmjcYzJYw==
X-Google-Smtp-Source: ABdhPJyg51Dcp53SpeLwj2MIm/3eKQa83C1CY4aeFoTUy7eBXZLHlCNKPF2BRmD3jKAUtsCW3kgC2TnAVNDSC0dJFFU=
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr12630803ejc.482.1630147887472; 
 Sat, 28 Aug 2021 03:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
 <20210823230535.js3gymomh2chmznc@mail.google.com>
 <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
 <20210827144938.72astzvxxy3igpn4@mail.google.com>
In-Reply-To: <20210827144938.72astzvxxy3igpn4@mail.google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 Aug 2021 11:51:16 +0100
Message-ID: <CAFEAcA_78m1jXENFEBRbMcZ4gY+o9BAk01rPHYtXXR1p+rXuFA@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 at 15:49, Changbin Du <changbin.du@gmail.com> wrote:
>
> On Tue, Aug 24, 2021 at 10:11:14AM +0100, Peter Maydell wrote:
> > On Tue, 24 Aug 2021 at 00:05, Changbin Du <changbin.du@gmail.com> wrote:
> > >
> > > On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> > > > changes to be more capable of handling dynamic target changes
> > > > (this would also help with eg debugging across 32<->64 bit switches);
> > > > as I understand it that gdb work would be pretty significant,
> > > > and at least for aarch64 pretty much nobody cares about
> > > > big-endian, so nobody's got round to doing it yet.
> > > >
> > > Mostly we do not care dynamic target changes because nearly all OS will setup
> > > endianness mode by its first instruction. And dynamic changes for gdb is hard
> > > since the byte order of debugging info in elf is fixed. And currently the GDB
> > > remote protocol does not support querying endianness info from remote.
> > >
> > > So usually we needn't change byte order during a debug session, but we just want
> > > the qemu gdbstub can send data in and handle data it received in right byte order.
> > > This patch does this work with the help of users via the option 'endianness='.
> >
> > I'm not a huge fan of putting in workarounds that deal with the
> > problem for specific cases and require users to tweak options settings,
> > rather than solving the problem in a more general way that would
> > let it all Just Work for all cases.
> >
> Probably we can add a new callback 'gdb_get_endianness' for CPUClass, and use
> this callback to determine if bswap is needed every time we read/write cpu
> registers. What's your thought?

I think that you need to start by talking to the gdb folks about
how debugging a dynamic endianness target should work. Fixing
this probably goes something like:
 * agree on design for how dynamic endianness, 32-64 mode changes,
   etc, should be handled by gdb
 * make gdb changes
 * document required gdbstub protocol enhancements (ie how the stub
   tells gdb about endianness changes, whether this changes how we
   send register information, memory data, etc)
 * implement those changes in QEMU

You seem to be trying to start with the final step, not the first one :-)

-- PMM

