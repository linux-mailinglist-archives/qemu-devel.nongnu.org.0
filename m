Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB7431F487
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 05:45:54 +0100 (CET)
Received: from localhost ([::1]:35918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCxft-0003aU-4U
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 23:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lCxeW-00038Y-1I
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 23:44:28 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:47053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lCxeQ-0004sr-L2
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 23:44:27 -0500
Received: by mail-ot1-x330.google.com with SMTP id o10so4022207ote.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 20:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c+pJAiRykBjyE902pylegFCvWphe7oPPNIv8mOXOJUA=;
 b=HFOHaCRbvz+0qeg48P9me395OIDFVCFiWBr3vWP9eHGe6+s9IVLjJkr0yKSB9Ipdv5
 qhDzuOpbhYePJPemDVB+HZX4lHOJ7Fk0HihboHcVGdB1qZ1ZujeHHBYC3+jreoXZSnIQ
 GA/4/I84YJ/Kz8Wy0hWLwQiZ1tJEk5/qzQiF67ulLzyt4tCzdCOgruP/e5avLn+ZGV1f
 PqeGKaF4yBTvgeo+RUPTlkLH8KonkK3/nfERAR3VTrrAauNeaS0BRcU5y+BidwyiJxqo
 eFtdRj6bVsEJD8P8+NOv80slxyAR2LE3fZxQsT54ctXUYT3OrhlrIN6s0WHZvQ+GnO3P
 KSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c+pJAiRykBjyE902pylegFCvWphe7oPPNIv8mOXOJUA=;
 b=OZ2tcs6GOSUhpkRFgVasbWSh419N/Q5JUEFoeWqbspalS09965kvnOWpnVzWS/3bKC
 itt5iQTmj2lL0Ze0OEyBq8kKV1MJSZ1FE6RpwLsZ4DICPgApnNpE66I6WKdmARb5vbh6
 KVZ94/87No/D6kKYFAzqiWteihvs5/DNLfVUeV07ILSTafM2ojk4j6MSVBQ0JrtuIzso
 4JUdgHEwq/+CllbAJjp2lf7dLyGN/ek7QKbaNCzbbA2Ah9Tb1zmTdFMhJ7Bww/BFZILa
 wT+iObxOJxgYxXLnL0Hd8+ST5HmO5m/AvQqWHklvBjpvZOdDMu7Xg24fnT0hLkSSBTon
 Zobg==
X-Gm-Message-State: AOAM531quD5UVGrOU0OZmE7l6ppP2MwQyYGBR59AdTxLqP1hQK8Z7XXj
 31BxGPQC4jYqcBNWko9NHha55shFSOqfnYOTDS0=
X-Google-Smtp-Source: ABdhPJw0ynTEpqbR3qtuN64yBRNF2CroCm6ceqNiAqEgd+6Etw7qK51lqnXAnt92IFYRKoGYNVH5SrheOfcw3ddezHs=
X-Received: by 2002:a05:6830:1557:: with SMTP id
 l23mr5663236otp.181.1613709861207; 
 Thu, 18 Feb 2021 20:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
 <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
 <CAKXe6SKrU_2zgw5YtcNw9uXd2gHFTSsLkDHyqqg=Z2uZj+e2AA@mail.gmail.com>
 <20210219021440.ub4qh3cnyv4cgswy@mozz.bu.edu>
In-Reply-To: <20210219021440.ub4qh3cnyv4cgswy@mozz.bu.edu>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 19 Feb 2021 12:43:45 +0800
Message-ID: <CAKXe6SJ1UTKYZMKVrhiqs6Pno-0ehMU_9Zjg9dGs+jR_2VMMxw@mail.gmail.com>
Subject: Re: [PATCH] net: eepro100: validate various address values
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x330.google.com
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
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8810:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On 210219 1006, Li Qiang wrote:
> > Alexander Bulekov <alxndr@bu.edu> =E4=BA=8E2021=E5=B9=B42=E6=9C=8819=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=889:56=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On 210218 1441, Peter Maydell wrote:
> > > > On Thu, 18 Feb 2021 at 14:13, P J P <ppandit@redhat.com> wrote:
> > > > >
> > > > > From: Prasad J Pandit <pjp@fedoraproject.org>
> > > > >
> > > > > While processing controller commands, eepro100 emulator gets
> > > > > command unit(CU) base address OR receive unit (RU) base address
> > > > > OR command block (CB) address from guest. If these values are not
> > > > > checked, it may lead to an infinite loop kind of issues. Add chec=
ks
> > > > > to avoid it.
> >
> >
> > So could you please provide a backtrack?
> >
>
> I don't know if you are asking me or Prasad, but here is the stacktrace


Yes, a typical DMA reentry issue.
Any progress to solve these DMA reentry issues? seems more and more
this kind of issues.
Just return from the busy things as a new father and not focus this
quite a time.

Thanks,
Li Qiang

> for the one I provided:
> =3D=3D2715275=3D=3DERROR: AddressSanitizer: stack-overflow on address
> 0x7ffc5262ba28 (pc 0x55d83b103ac6 bp 0x7ffc5262c270 sp 0x7ffc5262ba30
> T0)
> #0 in __asan_memcpy (qemu-system-i386+0x2aa3ac6)
> #1 in flatview_do_translate ../softmmu/physmem.c:518:12
> #2 in flatview_translate ../softmmu/physmem.c:568:15
> #3 in flatview_read ../softmmu/physmem.c:2878:10
> #4 in address_space_read_full ../softmmu/physmem.c:2892:18
> #5 in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
> #6 in dma_memory_rw include/sysemu/dma.h:127:12
> #7 in pci_dma_rw include/hw/pci/pci.h:803:12
> #8 in pci_dma_read include/hw/pci/pci.h:821:12
> #9 in read_cb ../hw/net/eepro100.c:726:5
> #10 in action_command ../hw/net/eepro100.c:847:9
> #11 in eepro100_cu_command ../hw/net/eepro100.c:969:13
> #12 in eepro100_write_command ../hw/net/eepro100.c:1063:5
> #13 in eepro100_write2 ../hw/net/eepro100.c:1510:9
> #14 in eepro100_write ../hw/net/eepro100.c:1593:9
> #15 in memory_region_write_accessor ../softmmu/memory.c:491:5
> #16 in access_with_adjusted_size ../softmmu/memory.c:552:18
> #17 in memory_region_dispatch_write ../softmmu/memory.c
> #18 in flatview_write_continue ../softmmu/physmem.c:2776:23
> #19 in flatview_write ../softmmu/physmem.c:2816:14
> #20 in address_space_write ../softmmu/physmem.c:2908:18
> #21 in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
> #22 in dma_memory_rw include/sysemu/dma.h:127:12
> #23 in dma_memory_write include/sysemu/dma.h:163:12
> #24 in stw_le_dma include/sysemu/dma.h:259:1
> #25 in stw_le_pci_dma include/hw/pci/pci.h:855:1
> #26 in action_command ../hw/net/eepro100.c:913:9
> #27 in eepro100_cu_command ../hw/net/eepro100.c:969:13
> #28 in eepro100_write_command ../hw/net/eepro100.c:1063:5
> #29 in eepro100_write2 ../hw/net/eepro100.c:1510:9
> #30 in eepro100_write ../hw/net/eepro100.c:1593:9
> ... till there's no more stack ...
>
> >
> > Thanks,
> > Li Qiang
> >
> > > > >
> > > > > Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> > > > > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > > > > ---
> > > > >  hw/net/eepro100.c | 8 +++++++-
> > > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> > > > > index 16e95ef9cc..afa1c9b2aa 100644
> > > > > --- a/hw/net/eepro100.c
> > > > > +++ b/hw/net/eepro100.c
> > > > > @@ -843,7 +843,8 @@ static void action_command(EEPRO100State *s)
> > > > >          bool bit_i;
> > > > >          bool bit_nc;
> > > > >          uint16_t ok_status =3D STATUS_OK;
> > > > > -        s->cb_address =3D s->cu_base + s->cu_offset;
> > > > > +        s->cb_address =3D s->cu_base + s->cu_offset;  /* uint32_=
t overflow */
> > > > > +        assert (s->cb_address >=3D s->cu_base);
> > > >
> > > > We get these values from the guest; you can't just assert() on them=
.
> > > > You need to do something else.
> > > >
> > > > My reading of the 8255x data sheet is that there is nothing
> > > > in the hardware that forbids the guest from programming the
> > > > device such that the cu_base + cu_offset wraps around:
> > > > http://www.intel.com/content/dam/doc/manual/8255x-10-100-mbps-ether=
net-controller-software-dev-manual.pdf
> > > > -- page 30 says that this is all doing 32-bit arithmetic
> > > > on addresses and doesn't say that there is any special case
> > > > handling by the device of overflow of that addition.
> > > >
> > > > Your commit message isn't very clear about what the failure
> > > > case is here, but I think the fix has to be something
> > > > different from this.
> > >
> > > Maybe the infinite loop mentioned in the commit message is actually a
> > > DMA recursion issue? I'm providing a reproducer for a DMA re-entracy
> > > issue below. With this patch applied, the reproducer triggers the
> > > assert(), rather than overflowing the stack, so maybe it is the same
> > > issue?
> > > -Alex
> > >
> > > cat << EOF | ./qemu-system-i386 -display none -machine accel=3Dqtest,=
 -m \
> > > 512M -device i82559er,netdev=3Dnet0 -netdev user,id=3Dnet0 -nodefault=
s \
> > > -qtest stdio
> > > outl 0xcf8 0x80001014
> > > outl 0xcfc 0xc000
> > > outl 0xcf8 0x80001010
> > > outl 0xcfc 0xe0020000
> > > outl 0xcf8 0x80001004
> > > outw 0xcfc 0x7
> > > write 0x1ffffc0b 0x1 0x55
> > > write 0x1ffffc0c 0x1 0xfc
> > > write 0x1ffffc0d 0x1 0x46
> > > write 0x1ffffc0e 0x1 0x07
> > > write 0x746fc59 0x1 0x02
> > > write 0x746fc5b 0x1 0x02
> > > write 0x746fc5c 0x1 0xe0
> > > write 0x4 0x1 0x07
> > > write 0x5 0x1 0xfc
> > > write 0x6 0x1 0xff
> > > write 0x7 0x1 0x1f
> > > outw 0xc002 0x20
> > > EOF
> > >
> > > Formatted for committing a regression-test:
> > >
> > > static void test_fuzz(void)
> > > {
> > >     QTestState *s =3D
> > >         qtest_init("-display none , -m 512M -device i82559er,netdev=
=3Dnet0 "
> > >                    "-netdev user,id=3Dnet0 -nodefaults");
> > >     qtest_outl(s, 0xcf8, 0x80001014);
> > >     qtest_outl(s, 0xcfc, 0xc000);
> > >     qtest_outl(s, 0xcf8, 0x80001010);
> > >     qtest_outl(s, 0xcfc, 0xe0020000);
> > >     qtest_outl(s, 0xcf8, 0x80001004);
> > >     qtest_outw(s, 0xcfc, 0x7);
> > >     qtest_bufwrite(s, 0x1ffffc0b, "\x55", 0x1);
> > >     qtest_bufwrite(s, 0x1ffffc0c, "\xfc", 0x1);
> > >     qtest_bufwrite(s, 0x1ffffc0d, "\x46", 0x1);
> > >     qtest_bufwrite(s, 0x1ffffc0e, "\x07", 0x1);
> > >     qtest_bufwrite(s, 0x746fc59, "\x02", 0x1);
> > >     qtest_bufwrite(s, 0x746fc5b, "\x02", 0x1);
> > >     qtest_bufwrite(s, 0x746fc5c, "\xe0", 0x1);
> > >     qtest_bufwrite(s, 0x4, "\x07", 0x1);
> > >     qtest_bufwrite(s, 0x5, "\xfc", 0x1);
> > >     qtest_bufwrite(s, 0x6, "\xff", 0x1);
> > >     qtest_bufwrite(s, 0x7, "\x1f", 0x1);
> > >     qtest_outw(s, 0xc002, 0x20);
> > >     qtest_quit(s);
> > > }
> > >
> > >
> > > >
> > > > thanks
> > > > -- PMM
> > > >
> > >

