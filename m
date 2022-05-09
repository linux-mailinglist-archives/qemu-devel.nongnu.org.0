Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11BA51F7C8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:13:18 +0200 (CEST)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnzS9-0007Cj-Rb
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nnzOw-0006OA-U3
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:09:58 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nnzOu-0006st-Ae
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:09:58 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f7b815ac06so136889357b3.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PpAOtw1hL62SpN55D2UOdWQNTb3V1BrOTF8az3ck1PI=;
 b=ROvLxYawETl5uS3J90y2PaXP5VqrOw/D/Atsbju3RRZCDFNftw02id5JJC3D0znHMy
 /Uhg6hcAdMsivcIPsuKTH5fWZHhx0m9+kvptkRDOS/6TYigXgpygnQB01XVWwcb3bh1o
 QgBGQzwRjgrFDEVyi/6jXaCWTVd5MUy6sKyfAZkcS1GhjaECzzy1DpWd9NflnQGFVLfT
 KPFBodnsV1CKVOfOYRJVfHeQAcU28172Af+HsBjvxW2dD5SM1tEmniSxOfF1QcDtDm6j
 OQZRGga2kYa5YvH/uAbdoVzfwGazv5DBUpL+wyL7XTli18bUpZPjCXgEEq8KPG4Brgp1
 kOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PpAOtw1hL62SpN55D2UOdWQNTb3V1BrOTF8az3ck1PI=;
 b=O/vtvsQE+Dk2cmmDaBylnFU0j3l7P6yzRevx2MTmWO13oJnoHs/axhL+2yQ0P18wY1
 n2idQ39ENdYFEmOnWr/VlNgMVsYyG+o4nkt0BykYWM6I1PrheFtCJrx+iJUZA/LeaSk3
 s3havkuKC7BDE3LE6IN98glx4nATOBYGUJtV5Xo53L2pyWjP+VhbGyyh7OFLgdPujZQf
 lwdDJ6jSQIGNHnktOIM7eYE2AtbP4lZUjyqII2mR/ssSEPzGboV6sTabOlpxxMcoEj6u
 4eNT4sofiAFNlWunJk0ZHWRlnlcdDOxFa3oGVEf1Ki7AlxBK54hcDc48eGM2c+oHCIRA
 617g==
X-Gm-Message-State: AOAM530BFqn3uy1VVBzKDg0yXZNud86k35aIYo1WayXcP9n/v3mbyKDl
 Q5GI8zkg89cg/5wHsjVYytUcvMVy/OdsFYCtfGc=
X-Google-Smtp-Source: ABdhPJz0elLjcGnF7nxf+kBNhoqpHf/DYFP02YhMi8aouOA1dbuU4JUOwm8tsaPh5Wh5bATggPswVZuH820OrdPP9UE=
X-Received: by 2002:a0d:ed87:0:b0:2fb:5542:5798 with SMTP id
 w129-20020a0ded87000000b002fb55425798mr5813665ywe.487.1652087393989; Mon, 09
 May 2022 02:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
 <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
 <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
 <CAEUhbmXuYt2KqKtrvMRoR2acFaweO3zVGa4+tyoxMnSc-kg11Q@mail.gmail.com>
 <CAEUhbmV2SH80i2vCato_2qRGeDCqeDqVp1m0Lc_SrJLGhZK-jw@mail.gmail.com>
 <CAEUhbmVxfbrkw3ZvzOb3gVm-c_5KU_B_UiT42m+bgVQdPPJtLQ@mail.gmail.com>
 <87v8ujt3lu.fsf@linaro.org>
 <CAKmqyKN15A4dS64k7-s45LjTJprKHCNL4BRuu-XnuHo4FJppZA@mail.gmail.com>
In-Reply-To: <CAKmqyKN15A4dS64k7-s45LjTJprKHCNL4BRuu-XnuHo4FJppZA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 May 2022 17:09:42 +0800
Message-ID: <CAEUhbmW0mvoY7nHhOpfWRTJyukfNZZiLd8Enc2nra6x2Q6p8Ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair@alistair23.me>, Nick Hudson <nick.hudson@gmx.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, May 9, 2022 at 5:07 PM Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Fri, May 6, 2022 at 11:25 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > Bin Meng <bmeng.cn@gmail.com> writes:
> >
> > > +more
> > >
> > > On Tue, May 3, 2022 at 11:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >>
> > >> On Thu, Apr 28, 2022 at 4:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >> >
> > >> > On Fri, Apr 22, 2022 at 11:00 AM Bin Meng <bmeng.cn@gmail.com> wro=
te:
> > >> > >
> > >> > > +Richard
> > >> > >
> > >> > > On Wed, Apr 20, 2022 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wr=
ote:
> > >> > > >
> > >> > > > On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> =
wrote:
> > >> > > > >
> > >> > > > > On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com=
> wrote:
> > >> > > > > >
> > >> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > >> > > > > >
> > >> > > > > > Sync uboot_image.h from upstream U-Boot v2022.01 release [=
1].
> > >> > > > > >
> > >> > > > > > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/i=
nclude/image.h
> > >> > > > > >
> > >> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >> > > > > > ---
> > >> > > > > >
> > >> > > > > > (no changes since v1)
> > >> > > > > >
> > >> > > > > >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++-=
-------------
> > >> > > > > >  1 file changed, 142 insertions(+), 71 deletions(-)
> > >> > > > > >
> > >> > > > >
> > >> > > > > Ping?
> > >> > > >
> > >> > > > Ping?
> > >> > >
> > >> > > Richard, is that you to pick up this series?
> > >> > >
> > >> >
> > >> > Ping?
> > >>
> > >> Ping? Can you please indicate who is the right person to pick up thi=
s
> > >> series? Thanks.
> > >>
> > >
> > > I pinged several times, but there's radio silence, sigh. Can you
> > > please let me know who is supposed to pick up this series?
> >
> > The only file that includes this is hw/core/loader.c so I would assume
> > that's in Alistair's domain. However it's not well matched by
> > MAINTAINERS and has only seen periodic updates since it's inclusion in
> > 2007.
> >
> > Alistair can you take this and update MAINTAINERS so it doesn't fall
> > through the cracks again?
>
> Thanks!
>
> Applied to riscv-to-apply.next
>
> I'll update MAINTAINERS as well
>

Thank you Alex, Alistair!

