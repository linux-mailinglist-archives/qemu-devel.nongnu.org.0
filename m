Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C0F9C0DC
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 00:58:58 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1ezo-0005h1-Ev
	for lists+qemu-devel@lfdr.de; Sat, 24 Aug 2019 18:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nsoffer@redhat.com>) id 1i1eyr-0005BU-Eb
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 18:57:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nsoffer@redhat.com>) id 1i1eyp-00037I-Ek
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 18:57:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <nsoffer@redhat.com>) id 1i1eyp-00034q-35
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 18:57:55 -0400
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0143281F01
 for <qemu-devel@nongnu.org>; Sat, 24 Aug 2019 22:57:53 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id k70so7502782otk.6
 for <qemu-devel@nongnu.org>; Sat, 24 Aug 2019 15:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVPHhwQKA+ql5IsxsZSIXvTJPqAEZ2As4d3TJTr8PgI=;
 b=ByIqY5YKzVePqPtzHKAzQjxmga/tx7ung8ssbmhNCW4DTlqT4mwBL8vUan8YSaRvr0
 LcdkDid8AQs09nVl/jxvvytMF9v8Uij5Vqx7o0XoyE4qC2SSSaL1cwy5warIhqplUlRj
 v8Lt377YmGElXeq+V9w/M37GYjwNLHELDMNeAW13YdIXH/ZlKmxBJHAH1TW/jh1r/H0G
 v6oM+vdOqoOQYblmF9atjYTC+59OTUiKzd7s3cvHEIPeBiC2sWRQWLcuuGriRoOl9cnF
 9Je96o7s/FKV/NW0bk78wXqD8W6TSFanWASkmrGJ9syxWRMaadoyQAQO4Tl2ggLvJ4DG
 Nmmg==
X-Gm-Message-State: APjAAAWKn79SH2KJDA2ev229LD+G1CXMAgK95Aoff6DjcNr/0boDWPx9
 +pSVkGhuP2tEImcmNfYfcJQ0QYMfwySFlQcRkrf9nkAYK5jQSXrSlij4i53eLe4kvYd3zwO53Mh
 dhfKBduq7E4zSRixeZFtPU94T3RhUGo0=
X-Received: by 2002:aca:1714:: with SMTP id j20mr7176563oii.135.1566687472411; 
 Sat, 24 Aug 2019 15:57:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmvawwyCVxQOWL0FrTbplzHcmsblV/974GuCPpNImSr25Zpfu/HXJcaB3lJbMSwPkYp1hnvOW4u/ZSYYx0amY=
X-Received: by 2002:aca:1714:: with SMTP id j20mr7176552oii.135.1566687472079; 
 Sat, 24 Aug 2019 15:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190816212122.8816-1-nsoffer@redhat.com>
 <86c147ef-9dd3-d35a-5005-ec53081196d7@redhat.com>
 <CAMRbyyt3Ku0Znpfx16FDqFTYbp5oJ1-9DnyxntHnArHsbR1ing@mail.gmail.com>
 <271a2dd3-9f2b-013d-896f-f4059c804967@redhat.com>
 <CAMRbyytxF8r9LoX4J_7ca2QPRtnpWgdTtyaKq=p=7ZaoMu-uug@mail.gmail.com>
 <e8db1edb-b1ee-8244-c772-8e08794181f0@redhat.com>
 <CAMRbyytObKSo+spkrQsTurybGJEndDTWP4UJgieP0nVw=CLmag@mail.gmail.com>
 <5a6cabf2-a284-9f63-da0e-96af26f8e0cd@redhat.com>
In-Reply-To: <5a6cabf2-a284-9f63-da0e-96af26f8e0cd@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 25 Aug 2019 01:57:40 +0300
Message-ID: <CAMRbyys_PgX0Lr27O_m6FZTDr3YFZ3LgnEsYhZk7KrV1ub5peg@mail.gmail.com>
To: Max Reitz <mreitz@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] block: posix: Always allocate the first
 block
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Nir Soffer <nirsof@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 23, 2019 at 8:53 PM Max Reitz <mreitz@redhat.com> wrote:

> On 23.08.19 18:48, Nir Soffer wrote:
> > On Fri, Aug 23, 2019 at 4:58 PM Max Reitz <mreitz@redhat.com
> > <mailto:mreitz@redhat.com>> wrote:
>
> [...]
>
> >     If you have a format layer that truncates the image to a fixed size
> and
> >     does not write anything into the first block itself (say because it
> uses
> >     a footer), then (with O_DIRECT) allocate_first_block() will fail
> >     (silently, because while it does return an error value, it is never
> >     checked and there is no comment that explains why we don=E2=80=99t =
check it)
> >
> >
> > The motivation is that this is an optimization for the special case of
> using
> > empty image, so it does not worth failing image creation.
> > I will add a comment about that.
>
> Thanks!
>
> [...]
>
> > Thanks for the example.
> >
> > I will need time to play with blockdev and understand the flows when
> image
> > are created. Do you think is would be useful to fix now only image
> creation
> > via qemu-img, and handle blockdev later?
>
> Well, it isn=E2=80=99t about blockdev, it=E2=80=99s simply about the fact=
 that this
> function doesn=E2=80=99t work for O_DIRECT files.  I showed how to reprod=
uce the
> issue without blockdev (namely block_resize).  Sure, that is an edge
> case, but it is a completely valid case.
>
> Also, it seems to me the fix is rather simple.  Just something like:
>
> static int allocate_first_block(int fd, int64_t max_size)
> {
>     int write_size =3D MIN(max_size, MAX_BLOCKSIZE);
>     void *buf;
>     ssize_t n;
>
>     /* Round down to power of two */
>     assert(write_size > 0);
>     write_size =3D 1 << (31 - clz32(write_size));
>
>     buf =3D qemu_memalign(MAX(getpagesize(), write_size), write_size);
>     memset(buf, 0, write_size);
>
>     do {
>         n =3D pwrite(fd, buf, write_size, 0);
>     } while (n < 0 && errno =3D=3D EINTR);
>
>     qemu_vfree(buf);
>
>     return n < 0 ? -errno : 0;
> }
>
> Wouldn=E2=80=99t that work?
>

Sure, it should work.

But I think we can make this simpler, always writing MIN(max_size,
MAX_BLOCKSIZE).

vdsm is enforcing now 4k alignment, and there is no way to create images
with unaligned
size. Maybe qemu should adapt this rule?

Nir
