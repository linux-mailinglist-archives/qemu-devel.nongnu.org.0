Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF02245EF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 04:19:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSuMo-0004y5-EA
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 22:19:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hSuLV-0004f8-95
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1hSuLT-00008a-Ud
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:17:41 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>) id 1hSuLT-00007w-Lk
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:17:39 -0400
Received: by mail-ot1-x334.google.com with SMTP id u11so14889768otq.7
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 19:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mCh+1nGlY43OB97ODgiSURJpwKAFtzjQ9Wk5DconRBU=;
	b=OHd50PMUzD2DsoDBsg4rrMI/fhILyd2+kgTkIGz1LzApq2jwLTc7w6/BI3wu4tXl2h
	8zlMIS1seNX2d7Erg9Ljef0ype8XOnMQotqdZkpnfAzLBiTlI8Clva/UGswKxCpeP2ET
	h9gwrnxLi9EdnVbYRForoQhDVKHFIXZrm0pQoPu897aLZd8oJVH0xjxaUiJixjM//RnR
	ic3/4rwX3CWFH5S+RN+vAxyhkx86k8KKE+e9SlmTjxMcqp3PPFg8Jk7aqJU/9w1y4h6x
	rrhBb+PU+H4f+/4FpAzPdDDJEoSLcmTmwx38Vv+OTNe+IGfnjNfZoVOWKUXQR8TqNH1l
	/q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mCh+1nGlY43OB97ODgiSURJpwKAFtzjQ9Wk5DconRBU=;
	b=RRlX99tUd5PqRnDbsnA34Jfvwvvh957bggO7HXqXxgkdusL2T+/8r83SoAAbQuYz7K
	CHnERhZOqCF731Ha0NP3AKcYxbf6o7J2d+P58m2lUViX/xmuWWEM9gKz7Guaebywuk/u
	zTpshsDMsT6CRff668D8TVeaQf60o+3kGkD1Mjr79VMSKQfNcQwXwYEZ/6Bup8ZR7gOJ
	pLv1TgGUuh+VHKiF9V5Nj0E+TqEcm46UReImL6Rhp+db8XrplOk5gDnfiT9BMOVVNQUm
	EsCGrYwlnuolgNRlr53veWve1VIJl4tmewg+1BKXJ0whK6FPzXUBAMteW3vHH/FxA+gr
	PuvA==
X-Gm-Message-State: APjAAAVuo8pdKAhAWXODyzSqxULzKwP4JW0afcv9NlBhUSkssncH3zml
	mp7Os2io2iMljNMl1gIVXHakFLOkrCqRp+CX0Ro=
X-Google-Smtp-Source: APXvYqxnoIrxvgIHOcGa4H1w5ic5SqFrEhqdk4k3IGdUdBszItAPIqGEL3x7vQPrRtT5sY3yG+OXmEYgZ+wUW4wYgo0=
X-Received: by 2002:a9d:ec5:: with SMTP id 63mr18212636otj.333.1558405057931; 
	Mon, 20 May 2019 19:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190424140643.62457-1-liq3ea@163.com>
	<CAKXe6S+J7OgqJkrDByo3y9M5BGTaCN0Cjb0_WYxDyTvFGg-w8w@mail.gmail.com>
	<CAKXe6SL3x6S5Pco6ZdFvPpmwPhPj6d2B7mFLDbyGoSqcGB+KCQ@mail.gmail.com>
	<c1153add-2518-ce69-1c83-eb46d6c643ac@redhat.com>
In-Reply-To: <c1153add-2518-ce69-1c83-eb46d6c643ac@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Tue, 21 May 2019 10:17:01 +0800
Message-ID: <CAKXe6SKjJHPbM_2751bp=vHpdrYk44gVtzBnMZmQ65ev9EVhfw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::334
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 0/5] fw_cfg_test refactor and add two
 test cases
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
	Li Qiang <liq3ea@163.com>, Qemu Developers <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B45=E6=
=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=885:29=E5=86=99=E9=81=
=93=EF=BC=9A

> Hi Li,
>
> On 5/17/19 4:28 AM, Li Qiang wrote:
> > Ping.....
> >
> > Li Qiang <liq3ea@gmail.com <mailto:liq3ea@gmail.com>> =E4=BA=8E2019=E5=
=B9=B45=E6=9C=889=E6=97=A5=E5=91=A8=E5=9B=9B
> > =E4=B8=8B=E5=8D=885:57=E5=86=99=E9=81=93=EF=BC=9A
> >
> >     Ping.... this serials.
>
> I apologize I hold this series for too long.
> With your v1 I wanted to clarify the commit descriptions without asking
> you to send a v2, then I reword your patches and the same day you sent
> your v2, then I had mixed feeling about how to do to not frustrate you
> asking to respin again, but I ended it worst :(
>


Hi Philippe, not afraid to frustrate me next time, just send out the review
email. I don't mind to make
revisions to improve the patches.



> I adapted the descriptions on your v2 and will repost as v3, then merge
> if you are OK with v3.
>
>

I have no objection for this, just merge it.

Thanks,
Li Qiang




> Regards,
>
> Phil.
>
> >
> >     Thanks,
> >     Li Qiang
> >
> >     Li Qiang <liq3ea@163.com <mailto:liq3ea@163.com>> =E4=BA=8E2019=E5=
=B9=B44=E6=9C=8824=E6=97=A5=E5=91=A8
> >     =E4=B8=89 =E4=B8=8B=E5=8D=8810:07=E5=86=99=E9=81=93=EF=BC=9A
> >
> >         In the disscuss of adding reboot timeout test case:
> >
> https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg03304.html
> >
> >         Philippe suggested we should uses the only related option for o=
ne
> >         specific test. However currently we uses one QTestState for all
> the
> >         test cases. In order to achieve Philippe's idea, I split the
> >         test case
> >         for its own QTestState. As this patchset has changed a lot, I
> >         don't bump
> >         the version.
> >
> >         Change since v1:
> >         Add a patch to store the reboot_timeout as little endian
> >         Fix the endian issue per Thomas's review
> >
> >         Li Qiang (5):
> >           tests: refactor fw_cfg_test
> >           tests: fw_cfg: add a function to get the fw_cfg file
> >           fw_cfg: reboot: store reboot-timeout as little endian
> >           tests: fw_cfg: add reboot_timeout test case
> >           tests: fw_cfg: add splash time test case
> >
> >          hw/nvram/fw_cfg.c     |   4 +-
> >          tests/fw_cfg-test.c   | 125
> >         +++++++++++++++++++++++++++++++++++++++---
> >          tests/libqos/fw_cfg.c |  55 +++++++++++++++++++
> >          tests/libqos/fw_cfg.h |   9 +++
> >          4 files changed, 184 insertions(+), 9 deletions(-)
> >
> >         --
> >         2.17.1
> >
> >
>
