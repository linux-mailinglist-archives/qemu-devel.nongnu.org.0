Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBFF3EAF87
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 07:12:35 +0200 (CEST)
Received: from localhost ([::1]:40822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEPUg-0005do-3n
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 01:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEPTh-0004tv-5r
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 01:11:33 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEPTb-0007bN-Qz
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 01:11:32 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b7so2569370iob.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 22:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SQ6pzqrT0ERUXTZHgacYc6OP1MzocjTIFOeqKYM2iyw=;
 b=fL7v51y30nAPy7wz/fWltC/ieGx5jMD497RE1Vmud1JjR3TMkTiaK/k+9PF9M0H4Lu
 Od+9N4st77NHltlE0bs9x2XUCcRKI6x+cQo9529xJVmxQ08huJtJ6uZWJFT5Ass1yhJc
 WqVBLu3eLubLr6LtWMNrVaHRraQBQqt3k6rp9Ggi+1SNaet0amIOJCfiIpAMLrtJvKln
 mTWKgSYyManJM5qXex3rV3wM4a4P6JHUaDerLRWJyBpYm7o5wIYnuwnK+cYVfZncXEBA
 HLPCBbuUmNMQcoESkCxXZX2h03cey+JeGeMTHC0DNMEkVh0F1Js4/TeYVy6ooTwrY0kn
 30eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SQ6pzqrT0ERUXTZHgacYc6OP1MzocjTIFOeqKYM2iyw=;
 b=PpA8dUN1PF5wZY+0ahDUplacSHF9V5HGvuwcSnpfcd4ayC1R2y2OD/hr9yhL+4S6x8
 RBYej/AEeusyrJo9dA9dFkzecPwHriCaJnGRTjoi5Dx9UUmRTCyMBUwVIBIn1jsGiFLZ
 rGpN7Mt3r7VZdNJ0/an/9WS3I2HhwE6bY8yfRy5Wx69rFaIH1YbrcwDGmiUhn32xYy+b
 dA46Gp4isYtACezeQXpzCnm5xUB7dH3Qy7vaUs7mNFMmgKXXfP3AhxoWGoI91eLrMoxC
 v1D7b3THdlFyBzng/jbddjU1F8RLEhyStOKAM8rVoblB5XUwkiG58Ec9gu/Xt2XPdxLb
 8qKw==
X-Gm-Message-State: AOAM531AECO2mY8J1v8R/zoGilFwKaV8aE3fYgXAq22BPZdbEsGfFvaX
 ZmgodSPqzFZWveTmqPnLoCkr4gNgGSGQJ3geaUU=
X-Google-Smtp-Source: ABdhPJwCVSzNsqsV0hkIeHzevTPm7+xIYm24Wn8ejBbCh+KyW1jnLXNx6pbOoTe8+DOrlrFdqWr9yqqoWr8dyXt7vO0=
X-Received: by 2002:a02:cc22:: with SMTP id o2mr564358jap.26.1628831486656;
 Thu, 12 Aug 2021 22:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <775EB0C4-04FF-4D76-8248-D5B16D238B3B@jrtc27.com>
 <CAEUhbmXjC_RaN0rMZO0-FFAP8Cce-Kpxy=ZORpi1k=0Nv7OLiw@mail.gmail.com>
In-Reply-To: <CAEUhbmXjC_RaN0rMZO0-FFAP8Cce-Kpxy=ZORpi1k=0Nv7OLiw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 15:11:00 +1000
Message-ID: <CAKmqyKMm+fpr3vCuzQ+29iKukiCe=Vv9-djKN446LMSX-NU96g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/4] Add options to config/meson files for custom
 CSR
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
Cc: "Ruinland Chuan-Tzu Tsa\(\(\(\(\(\(\(\(\(\(\)" <ruinland@andestech.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 6, 2021 at 11:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 8:58 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >
> > > On Fri, Aug 6, 2021 at 10:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Fri, Aug 6, 2021 at 1:57 AM Ruinland Chuan-Tzu Tsai
> > > > <ruinland@andestech.com> wrote:
> > > > >
> > > > > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> > > > >
> > > > > Adding option `riscv_custom` to configure script, meson.build and
> > > > > meson_options.txt so as to toggle custom CSR and will-be-upstream=
ed custom
> > > > > instructions handling logic.
> > > > >
> > > > > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > > > > ---
> > > > >  configure         | 6 ++++++
> > > > >  meson.build       | 2 ++
> > > > >  meson_options.txt | 2 ++
> > > > >  3 files changed, 10 insertions(+)
> > > > >
> > > >
> > > > This sounds like unnecessary to bring such a config option to the m=
eson level.
> > > >
> > > > I believe a Kconfig option should just be fine.
> > >
> > > +Alistair
> >
> > I don=E2=80=99t see why this is even a config option. If you request a =
vendor=E2=80=99s
> > CPU you should get any custom CSRs defined for that vendor=E2=80=99s CP=
U. If
> > you don=E2=80=99t you don=E2=80=99t. This should be purely a run-time t=
hing, no?
>
> In a generic use case where we build all RISC-V machines into one
> qemu-system-riscv{32,64} executable this makes no difference. The
> Kconfig option will be turned on if any one of the machines requires
> it. It only gets benefits when we build a QEMU executable on a
> per-machine basis.

I agree with Bin that this could be a Kconfig option, that is selected
when a vendor CPU is enabled.

It also doesn't have to be a config and could just be built all the
time. I don't see much of an advantage in allowing it to be disabled,
it's just another thing we would need to test. Maybe is a user was
just interested in the virt machine/KVM they could disable it to avoid
any overhead.

Alistair

>
> Regards,
> Bin
>

