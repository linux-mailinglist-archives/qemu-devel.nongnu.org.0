Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4BC320384
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 04:30:03 +0100 (CET)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDIy2-0006DL-72
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 22:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDIx8-0005b2-3B; Fri, 19 Feb 2021 22:29:06 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:45921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDIx6-0000fw-1a; Fri, 19 Feb 2021 22:29:05 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id l8so7459451ybe.12;
 Fri, 19 Feb 2021 19:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nlzFiW4MRrVs5Lf/8IIJlxJi1PerG4dgHtGNuBodL+g=;
 b=EOmzmk5YOLhAYF1951VHZFj8MqfEh/QlKR8sAc8P9vIjpBoZNvixxNtUfR3JcxF6ND
 W/Iuxrzt7pwHTGAlaN8TNfLsCBvwk3IdlrXvhMg0hEQG2GyQbWw43U2NCUoaw+7Sfp9U
 ECDEShGVDPFIBzmcgTduMTBkoFUq2NtiPDJf/tt/UBGF6LBK276igiWbIm7djauuLyV9
 +t5lBfOd0aSfjPHcYKOdrbkYRigxfN7tDZNgfap0SFM6fh7+LW8+mgkQW1wgwnY6+FFg
 +nIiwOwDk+YbVIp32kT6imzSILEFQ/hOI1WnBf4PBgL/01PdK/fE8DP8IdUwofsjCIwk
 ckyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nlzFiW4MRrVs5Lf/8IIJlxJi1PerG4dgHtGNuBodL+g=;
 b=LTs9pVCacKmB+XlD9sxO8feMGcYSuPv8OXquOE09aDA0RiYUfDjcT0HcYTsT4AGc30
 8uT0W2pMp+SUVbiv9DJ5CrCtdPB3TA31YfPhZQMWuyqrWExUAT35bOaS16GS1JqEKand
 EgGRQcjWwoNDyhK5V3fL6vadKQaKBfPC5y8N+SauNnCHDaqCAPsbNnnsMuIeltw3nFD4
 bHCyZH4zwyM0Kwnc4hNMxduBJWq/nUeXOALIwbYmFH+AGV3zyjn9NZF4vsCmFBgkqm2M
 QwGPArXOm5yUfXeHYYamHYsPYQ/ahc4+/+jB739AA/LE2ObcGmafsRFV9snuz/I4ifea
 SlZg==
X-Gm-Message-State: AOAM531TnNgrjlcIkdEmU9FgMWPkYYlLetTw2xFWPgegTqqN1rOWFLid
 I0AVcT3Vz3LjOZpHb7mfVREnrsu+3ueqjBML7hc=
X-Google-Smtp-Source: ABdhPJyHK3d+FsBFjSTt06phiO73fGlpf+jzYzqkpEQCY+49BHqfKZvx0Khlw+mAo5lq68ih0QSJDttETxro6JA13B4=
X-Received: by 2002:a25:d28b:: with SMTP id
 j133mr16950036ybg.517.1613791742495; 
 Fri, 19 Feb 2021 19:29:02 -0800 (PST)
MIME-Version: 1.0
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-7-git-send-email-bmeng.cn@gmail.com>
 <d68d2a11-707f-5640-052d-3ae017fc4771@amsat.org>
In-Reply-To: <d68d2a11-707f-5640-052d-3ae017fc4771@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 20 Feb 2021 11:28:51 +0800
Message-ID: <CAEUhbmXZ3aaEqv_YJ5nq3f60MVCCR=G=mNxA57OMbuNoGSpUNw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] hw/sd: sdhci: Reset the data pointer of
 s->fifo_buffer[] when a different block size is programmed
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@163.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Fri, Feb 19, 2021 at 2:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Bin,
>
> On 2/16/21 4:46 AM, Bin Meng wrote:
> > If the block size is programmed to a different value from the
> > previous one, reset the data pointer of s->fifo_buffer[] so that
> > s->fifo_buffer[] can be filled in using the new block size in
> > the next transfer.
> >
> > With this fix, the following reproducer:
> >
> > outl 0xcf8 0x80001010
> > outl 0xcfc 0xe0000000
> > outl 0xcf8 0x80001001
> > outl 0xcfc 0x06000000
> > write 0xe000002c 0x1 0x05
> > write 0xe0000005 0x1 0x02
> > write 0xe0000007 0x1 0x01
> > write 0xe0000028 0x1 0x10
> > write 0x0 0x1 0x23
> > write 0x2 0x1 0x08
> > write 0xe000000c 0x1 0x01
> > write 0xe000000e 0x1 0x20
> > write 0xe000000f 0x1 0x00
> > write 0xe000000c 0x1 0x32
> > write 0xe0000004 0x2 0x0200
> > write 0xe0000028 0x1 0x00
> > write 0xe0000003 0x1 0x40
> >
> > cannot be reproduced with the following QEMU command line:
> >
> > $ qemu-system-x86_64 -nographic -machine accel=3Dqtest -m 512M \
> >       -nodefaults -device sdhci-pci,sd-spec-version=3D3 \
> >       -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydr=
ive \
> >       -device sd-card,drive=3Dmydrive -qtest stdio
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: CVE-2020-17380
> > Fixes: CVE-2020-25085
> > Fixes: CVE-2021-3409
> > Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
> > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
> > Reported-by: Muhammad Ramdhan
> > Reported-by: Sergej Schumilo (Ruhr-University Bochum)
> > Reported-by: Simon Wrner (Ruhr-University Bochum)
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1928146
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > ---
> >
> > Changes in v2:
> > - new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a d=
ifferent block size is programmed
> >
> >  hw/sd/sdhci.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > index d0c8e29..5b86781 100644
> > --- a/hw/sd/sdhci.c
> > +++ b/hw/sd/sdhci.c
> > @@ -1140,6 +1140,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
> >          break;
> >      case SDHC_BLKSIZE:
> >          if (!TRANSFERRING_DATA(s->prnsts)) {
> > +            uint16_t blksize =3D s->blksize;
> > +
> >              MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
> >              MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
> >
> > @@ -1151,6 +1153,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_=
t val, unsigned size)
> >
> >                  s->blksize =3D deposit32(s->blksize, 0, 12, s->buf_max=
sz);
> >              }
> > +
> > +            /*
> > +             * If the block size is programmed to a different value fr=
om
> > +             * the previous one, reset the data pointer of s->fifo_buf=
fer[]
> > +             * so that s->fifo_buffer[] can be filled in using the new=
 block
> > +             * size in the next transfer.
> > +             */
> > +            if (blksize !=3D s->blksize) {
> > +                s->data_count =3D 0;
>
> I doubt the hardware works that way.

Me too, because s->data_count is not exposed by the hardware as a
register or descriptor, so it's purely our internal implementation. A
hardware might implement like that, but we really don't know unless
some hardware guys who designed a SDHC could jump out and comment :)

> Shouldn't we reset the FIFO each time BLKSIZE is accessed, regardless of =
its previous value?

If we do that, we will end up rewriting the logic of the data transfer
functions. I looked at the current implementation and I think there
are some spec violations about handling page boundaries, and that part
is related to sd->data-count. But like I said in the cover letter
these should be addressed in future patches.

>
> > +            }
> >          }
> >
> >          break;
> >

Regards,
Bin

