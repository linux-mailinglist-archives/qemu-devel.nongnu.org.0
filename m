Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F396211318
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 20:53:21 +0200 (CEST)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqhrE-0001e1-G7
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 14:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jqhqG-00012Y-1D; Wed, 01 Jul 2020 14:52:20 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jqhqD-0000f1-Sj; Wed, 01 Jul 2020 14:52:19 -0400
Received: by mail-wm1-x344.google.com with SMTP id o2so24503212wmh.2;
 Wed, 01 Jul 2020 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0zDbEac3meLdGS6pGUbPIVXPb6dSX1SeMYKws+Ysw8M=;
 b=CJo5MBkYQMpM3uz9rOGy1bm7fEM0AQRBH7xK4ObDEYiv7IvTIJJcyBW46OPpQkXtAB
 72BB5wkJC7/kMnOgg6xNbxppoeo0+YqVOL+cxatP5e767nncCrsLimu9Yk//cppfYa7v
 CFVpiN6F0gHmCk3nAK4kneE3m6mwYLK/3pMLESlpPhxZwFRMVr2XtMJL9WT7fOjCcxOA
 73vwz7KFIqiYdr59gPn3w+IW3pnNkUxbAJyYlYsb/MBIbMPmTNgyXZV2iw50xLgTI7hQ
 c7bglt2HUplCE+lg2wS6vmJW4pOAybQXrx0jsx0/fKajwN1QQae/nt8n0UYoYGeLNcal
 zxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0zDbEac3meLdGS6pGUbPIVXPb6dSX1SeMYKws+Ysw8M=;
 b=M2XPXHQTxa0i701w1+CUigp2rWrUxBs4pjtn5bCNMzM4fpjzRBrzp1ugCYrloCgyJM
 ouPkPgbs+RTBKgleSW0Yb703qX2uLwA5wBRvBGSEFSzTEuPY2oeCDd55K9Li6bYswcX/
 Rw97XqUmztTOFJnoxlXLqoVyDLu+9GqqO2Ob9fAKxVAGop+6YTf+odiBZ65kFEeTcXGm
 zhfvGb1sAyVqxLf8hSksNcH9Tn7mHGbvN4FOllcZwdaafh1JMQSBmwTvdR0HUz0Pe9rw
 ad5iK/fjqS6pBk9G2w8F4QjOrK0TJf9v6WI7zjJXLva5mtfHG6RSNwnxqaCDF+oUYcFt
 OzWA==
X-Gm-Message-State: AOAM531dtoXC/yeUmm1m+C3w8Pp587jYOXTGRCJW8+TLp238NYQQdjrx
 5WLD2ehG3raw5vqNX8IsO5RD+kXY1uf7DSESbSw=
X-Google-Smtp-Source: ABdhPJxqcQy8Nlx1zjgtUN0inP3PJDzssdP6fZbweAL0wOK8Lx+i7IzQZZJJ5n9+wlpfl+lgutr2/rRCBLi9xEe4O24=
X-Received: by 2002:a1c:4444:: with SMTP id r65mr26873792wma.129.1593629535624; 
 Wed, 01 Jul 2020 11:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200630195723.1359-1-f4bug@amsat.org>
 <CAHiYmc6d3Q2A237qVqp6s0MagXqgy11aX9r_LuJsGkoJxRhfQw@mail.gmail.com>
 <20200701173944.GA1090525@aurel32.net>
In-Reply-To: <20200701173944.GA1090525@aurel32.net>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Wed, 1 Jul 2020 20:51:57 +0200
Message-ID: <CAHiYmc5Y6_OcjYS8zR=hKGFeeL9zJ2g+CX8jeNyZdyMnH6uO+g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/mips/malta: Add the 'malta-strict' machine,
 matching Malta hardware
To: Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
 Yunqiang Su <ysu@wavecomp.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 1, 2020 at 7:39 PM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Aleksandar,
>
> On 2020-06-30 23:54, Aleksandar Markovic wrote:
> > As, in a very clear way, evidenced from the previous versions of this
> > series, this series real goal was not not to create some new
> > "malta-strict" machine, but to prepare path to creation of some
> > imagined "malta-unleashed" machine which will, to the contrary of
> > proclaimed goal, create a machine that could never exist in reality.
> > That is why I can't accept this series.
>
> I do not understand your opposition to this, and why it is an issue to
> support more than 2GiB of RAM for such a board. Supporting more than 2GiB
> of memory doesn't prevent people to emulate a real Malta board with less
> memory.
>
> In addition to that, the Malta board in QEMU has been supporting for
> many years more than the maximum 256MiB that is possible on a physical
> board. The QEMU version also supports way more than CPU variants than
> the physical board. In other word the existing malta machine in QEMU is
> already a "malta-unleashed".
>

Aurelien,

Glad to see you again. I am really sorry you were absent for so long.

Those (what you described in the paragraphs above) were mistakes from
the past. At some point, we needed to stop doing it, and finally
returned to the root QEMU principles of emulating systems as
faithfully as possible.

Knowing the needs like you described exist, my vision is that, just
for occasions you described, we create a virtual board that would have
very wide set of feature, unconstrained by real world. That way we
would avoid situations to "lie" in our emulations.

If you needed something more that is currently provided, you should
have issued a feature request through regular channels, and that would
have the people the chance to develop a solid solution, not some quick
fixes that pushes us further and further in wring direction.

Best wishes,
Aleksandar


Why didn't you respond on my mail from the other day? Do you plan to respon=
d?

> And these possibilities have been used by MIPS* employees to develop
> MIPS R6 based distributions. Limiting the board in terms of RAM, CPU or
> virtio support would just make our users life more difficult for no
> gain.
>
> Regards,
> Aurelien
>
> * By MIPS employee, I mean persons that have been employed by companies
> owning MIPS over the last few years, including Imagination Technologies
> and Wave Computing.
>
>
>
> > =D1=83=D1=82=D0=BE, 30. =D1=98=D1=83=D0=BD 2020. =D1=83 21:58 Philippe =
Mathieu-Daud=C3=A9 <f4bug@amsat.org> =D1=98=D0=B5
> > =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> > >
> > > Hi,
> > >
> > > This series add a new 'malta-strict' machine, that aims to properly
> > > model the real hardware (which is not what the current 'malta'
> > > machine models).
> > >
> > > Since v2:
> > > - Initialize missing malta_machine_types::class_size
> > > - Remove RFC patch that confuses Aleksandar
> > > - Added examples of 'malta-strict' use
> > >
> > > $ git backport-diff -u v2
> > > Key:
> > > [----] : patches are identical
> > > [####] : number of functional differences between upstream/downstream=
 patch
> > > [down] : patch is downstream-only
> > > The flags [FC] indicate (F)unctional and (C)ontextual differences, re=
spectively
> > >
> > > 001/5:[----] [--] 'hw/mips/malta: Trivial code movement'
> > > 002/5:[----] [--] 'hw/mips/malta: Register the machine as a TypeInfo'
> > > 003/5:[0001] [FC] 'hw/mips/malta: Introduce MaltaMachineClass::max_ra=
msize'
> > > 004/5:[----] [--] 'hw/mips/malta: Introduce the 'malta-strict' machin=
e'
> > > 005/5:[----] [--] 'hw/mips/malta: Verify malta-strict machine uses co=
rrect DIMM sizes'
> > >
> > > Philippe Mathieu-Daud=C3=A9 (5):
> > >   hw/mips/malta: Trivial code movement
> > >   hw/mips/malta: Register the machine as a TypeInfo
> > >   hw/mips/malta: Introduce MaltaMachineClass::max_ramsize
> > >   hw/mips/malta: Introduce the 'malta-strict' machine
> > >   hw/mips/malta: Verify malta-strict machine uses correct DIMM sizes
> > >
> > >  hw/mips/malta.c | 105 +++++++++++++++++++++++++++++++++++++++++-----=
--
> > >  1 file changed, 91 insertions(+), 14 deletions(-)
> > >
> > > --
> > > 2.21.3
> > >
> > >
> >
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                 http://www.aurel32.net

