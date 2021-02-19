Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E7531F3CC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 03:07:51 +0100 (CET)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCvCw-0001Ka-22
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 21:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lCvC1-0000cJ-6A
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 21:06:53 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:46318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lCvBz-0007Da-8W
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 21:06:52 -0500
Received: by mail-ot1-x32c.google.com with SMTP id o10so3768003ote.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 18:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xq4QJgNLGRiNqTuy7bRtqOha/7gxNZFFZQCsJEnsezk=;
 b=l1OReFMpOxkFelBxv7B/m8hsImuKN97OBSwIDaqcUZRMnMyqyvLAXjTvJJTK4oz1DW
 AKsDxtVK4guxtGwo2D5nFEUmm8nXKhjJZ2aXzH35skfVyJAEvDbaS9yjdoKqTM4PWbsO
 C6mni9TFmIl11DVXbgXMid1bIqt6uYppH6OZV5ggYRycYXvYydUtVmpCdv4ETxv1cau8
 EuGctscKNjJ0TTpBawxs35Sm1Lh403gky4ghhFkZREBM1zwvmthpgvZA2l7WvrOehaXY
 kjgFprSZL4sdCrKOlq068bUJT8HiSJxmjpTPiRlQXSNZ7EjoR9hz0z80BYXePWf+OFq3
 FdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xq4QJgNLGRiNqTuy7bRtqOha/7gxNZFFZQCsJEnsezk=;
 b=duWjOMstZgvCOMWJj83ME1GzBRejnQ95DabDxknZtf6u/+3p+Z05xrCNoYXBjLjuOt
 D6mj69CVv21VX+F9fxhTtycCYysRJZY0wBW6jEk0Kbg5isSRVpLvfgZSQgXycbfpCJ1J
 TG6+ygu3NEx6EBcL5NFMndYC2TJdWVT5OwXFrt00PDJ2Z2/2nSP8jVQZxvkKeXgDjrMU
 y5X9ZJDOLFw17or5E44eylJqIEGzfpJ+CHtyJBLanAqwB52GCInNcmhbK6yfvYd6stau
 6U7gdQ1Tz2B64LtNkUoijJKU50N3I6EJKljCsBiYf6QMHqf+2+jy6v8XsWG1WGeIK1Gw
 Uhrg==
X-Gm-Message-State: AOAM530I2N7gLcAOBiEfEtao+Se2JmV/7mXvK4egLBwBjKXY6hMQIp4S
 QF8ym5xZRXNFlj01EOxeqaNwvv6PVS7Kq7QtmZc=
X-Google-Smtp-Source: ABdhPJxARU8ZNnyqUWFIT6R1lfkh5bD6FGE4oNmUQDYaoGPXxREvMJJXElXWYwjZNbN9tSJxfxf3jO/BIxspv1FEGKI=
X-Received: by 2002:a05:6830:1557:: with SMTP id
 l23mr5279778otp.181.1613700409498; 
 Thu, 18 Feb 2021 18:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
 <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
In-Reply-To: <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 19 Feb 2021 10:06:13 +0800
Message-ID: <CAKXe6SKrU_2zgw5YtcNw9uXd2gHFTSsLkDHyqqg=Z2uZj+e2AA@mail.gmail.com>
Subject: Re: [PATCH] net: eepro100: validate various address values
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>, Ruhr-University Bochum <bugs-syssec@rub.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexander Bulekov <alxndr@bu.edu> =E4=BA=8E2021=E5=B9=B42=E6=9C=8819=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=889:56=E5=86=99=E9=81=93=EF=BC=9A
>
> On 210218 1441, Peter Maydell wrote:
> > On Thu, 18 Feb 2021 at 14:13, P J P <ppandit@redhat.com> wrote:
> > >
> > > From: Prasad J Pandit <pjp@fedoraproject.org>
> > >
> > > While processing controller commands, eepro100 emulator gets
> > > command unit(CU) base address OR receive unit (RU) base address
> > > OR command block (CB) address from guest. If these values are not
> > > checked, it may lead to an infinite loop kind of issues. Add checks
> > > to avoid it.


So could you please provide a backtrack?


Thanks,
Li Qiang

> > >
> > > Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> > > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > > ---
> > >  hw/net/eepro100.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> > > index 16e95ef9cc..afa1c9b2aa 100644
> > > --- a/hw/net/eepro100.c
> > > +++ b/hw/net/eepro100.c
> > > @@ -843,7 +843,8 @@ static void action_command(EEPRO100State *s)
> > >          bool bit_i;
> > >          bool bit_nc;
> > >          uint16_t ok_status =3D STATUS_OK;
> > > -        s->cb_address =3D s->cu_base + s->cu_offset;
> > > +        s->cb_address =3D s->cu_base + s->cu_offset;  /* uint32_t ov=
erflow */
> > > +        assert (s->cb_address >=3D s->cu_base);
> >
> > We get these values from the guest; you can't just assert() on them.
> > You need to do something else.
> >
> > My reading of the 8255x data sheet is that there is nothing
> > in the hardware that forbids the guest from programming the
> > device such that the cu_base + cu_offset wraps around:
> > http://www.intel.com/content/dam/doc/manual/8255x-10-100-mbps-ethernet-=
controller-software-dev-manual.pdf
> > -- page 30 says that this is all doing 32-bit arithmetic
> > on addresses and doesn't say that there is any special case
> > handling by the device of overflow of that addition.
> >
> > Your commit message isn't very clear about what the failure
> > case is here, but I think the fix has to be something
> > different from this.
>
> Maybe the infinite loop mentioned in the commit message is actually a
> DMA recursion issue? I'm providing a reproducer for a DMA re-entracy
> issue below. With this patch applied, the reproducer triggers the
> assert(), rather than overflowing the stack, so maybe it is the same
> issue?
> -Alex
>
> cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest, -m =
\
> 512M -device i82559er,netdev=3Dnet0 -netdev user,id=3Dnet0 -nodefaults \
> -qtest stdio
> outl 0xcf8 0x80001014
> outl 0xcfc 0xc000
> outl 0xcf8 0x80001010
> outl 0xcfc 0xe0020000
> outl 0xcf8 0x80001004
> outw 0xcfc 0x7
> write 0x1ffffc0b 0x1 0x55
> write 0x1ffffc0c 0x1 0xfc
> write 0x1ffffc0d 0x1 0x46
> write 0x1ffffc0e 0x1 0x07
> write 0x746fc59 0x1 0x02
> write 0x746fc5b 0x1 0x02
> write 0x746fc5c 0x1 0xe0
> write 0x4 0x1 0x07
> write 0x5 0x1 0xfc
> write 0x6 0x1 0xff
> write 0x7 0x1 0x1f
> outw 0xc002 0x20
> EOF
>
> Formatted for committing a regression-test:
>
> static void test_fuzz(void)
> {
>     QTestState *s =3D
>         qtest_init("-display none , -m 512M -device i82559er,netdev=3Dnet=
0 "
>                    "-netdev user,id=3Dnet0 -nodefaults");
>     qtest_outl(s, 0xcf8, 0x80001014);
>     qtest_outl(s, 0xcfc, 0xc000);
>     qtest_outl(s, 0xcf8, 0x80001010);
>     qtest_outl(s, 0xcfc, 0xe0020000);
>     qtest_outl(s, 0xcf8, 0x80001004);
>     qtest_outw(s, 0xcfc, 0x7);
>     qtest_bufwrite(s, 0x1ffffc0b, "\x55", 0x1);
>     qtest_bufwrite(s, 0x1ffffc0c, "\xfc", 0x1);
>     qtest_bufwrite(s, 0x1ffffc0d, "\x46", 0x1);
>     qtest_bufwrite(s, 0x1ffffc0e, "\x07", 0x1);
>     qtest_bufwrite(s, 0x746fc59, "\x02", 0x1);
>     qtest_bufwrite(s, 0x746fc5b, "\x02", 0x1);
>     qtest_bufwrite(s, 0x746fc5c, "\xe0", 0x1);
>     qtest_bufwrite(s, 0x4, "\x07", 0x1);
>     qtest_bufwrite(s, 0x5, "\xfc", 0x1);
>     qtest_bufwrite(s, 0x6, "\xff", 0x1);
>     qtest_bufwrite(s, 0x7, "\x1f", 0x1);
>     qtest_outw(s, 0xc002, 0x20);
>     qtest_quit(s);
> }
>
>
> >
> > thanks
> > -- PMM
> >
>

