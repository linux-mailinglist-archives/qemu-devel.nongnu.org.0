Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC1987AA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 01:12:31 +0200 (CEST)
Received: from localhost ([::1]:36984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0ZmI-0000eA-4F
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 19:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fintelia@gmail.com>) id 1i0Zkq-000851-EI
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 19:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1i0Zko-0007UL-Kw
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 19:11:00 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1i0Zkk-0007R2-Fw; Wed, 21 Aug 2019 19:10:54 -0400
Received: by mail-lf1-x143.google.com with SMTP id h28so3059645lfj.5;
 Wed, 21 Aug 2019 16:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D+h2/vD1IqOJbT4fBJlcA13Mv/QGR6RAxBRfM98uZ28=;
 b=F/AUwsrCmLmUtc2gsZE1OXXX7ELwnwQPsNCxWX5henShAl8a/hj4dL+ZHSp453WC7v
 TBpp9hPQIFyRlDNVSgUasD42LltHr1c8S+aIwR0LRRJSRvUzKClDDlb0JbOZR4M2BIFy
 4CaW4DfuU6xsVf60kNroh/aQXrlGRlkNbNmAW9kbIFojGq4JT9pwis0mgeGDmZO71aZz
 Iq8i1jYMKiWZUBGvlDCAqFMpJuvIP9s28seU0tfMpH42boESOPyFIqanTGTnpTeRQDEC
 J4zDEjnj4ny0BAGMVoMPWBBgzKI8kFcRDBKv3cqq+wEk+IEfE+RguLd8tZBXHREAqyxZ
 7Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+h2/vD1IqOJbT4fBJlcA13Mv/QGR6RAxBRfM98uZ28=;
 b=md+OW1+xt7sd3b+NWeA6/0OALp4FaJ5faZ+2jnwrWbS+DOekjuMzulTXaQKKZWEW7B
 No1bUvWIdHpydjzUc2yg7WVw4cok8BeQ98mdh/T3ZyioDXzpRuKsRVsZUvCP07FdPdHG
 uv5DiwdCLx/bY8Sfec2OCXgs5FrCbEDyxI0SWMmNcVJhqhBP+sOMOHDOdqOl8kilMmA5
 wVkba2IIvBN6Y7GpSZOxfB0UuZVnXF6+GQAp/d0fQ0ivMjPC3O/NUmdboPYGCDWe//q1
 Di9mYNznuSiizlB6qFsFpxje8HiXL8V3BOfu3Gj0Ge1M3giJ0GovQD2PyS88+3oRWhKR
 r7sA==
X-Gm-Message-State: APjAAAWQhgwEMXf9W/OsfWU1qXXYqtalEiN7ZuY86gQ5W8Nur9Y7G3Wc
 X5l0bIjPITsJzlm6KRdZD1SaxD2yJuDjR/u0weQ=
X-Google-Smtp-Source: APXvYqyPg0yy0qnlra3MHOwc6eXfutN/BsAAxAeyAM9B49QAIGJKd5d4oI5ARKvzuYu8HH+JGTUyGE1lJEG5d77vRv8=
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr20002211lfm.143.1566429051763; 
 Wed, 21 Aug 2019 16:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKM44ZAHgc5cYAiAXXtVG=dMcX1i7FLn+2mMwM1Av4Gqzg@mail.gmail.com>
 <mhng-04cdd93a-df3e-4de0-b1f5-0365f2be0fab@palmer-si-x1c4>
In-Reply-To: <mhng-04cdd93a-df3e-4de0-b1f5-0365f2be0fab@palmer-si-x1c4>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Wed, 21 Aug 2019 19:10:25 -0400
Message-ID: <CANnJOVF_KwuXLD14EY+y+sVvchfBD=Y884=9YzW_8FwsSNd++g@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [Qemu-riscv]  RISC-V: Vector && DSP Extension
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, bastian@mail.uni-paderborn.de,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, zhiwei_liu@c-sky.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is there a reason to guarantee support of a particular draft extension
version once it has been superseded by a subsequent version? I understand
why it was done for priv-1.9.1, but going forward I'm skeptical there will
be much/any code out in the wild that depends on old draft versions of
extensions. The main reason people seem interested in implementing
extensions in QEMU is to test them before going through the trouble of
manufacturing hardware, and I don't really see why anyone would want to
test a design that is no longer under consideration.

Jonathan

On Wed, Aug 21, 2019 at 3:31 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> On Thu, 15 Aug 2019 14:37:52 PDT (-0700), alistair23@gmail.com wrote:
> > On Thu, Aug 15, 2019 at 2:07 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >>
> >> On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic
> >> <aleksandar.m.mail@gmail.com> wrote:
> >> >
> >> > > We can accept draft
> >> > > extensions in QEMU as long as they are disabled by default.
> >>
> >> > Hi, Alistair, Palmer,
> >> >
> >> > Is this an official stance of QEMU community, or perhaps Alistair's
> >> > personal judgement, or maybe a rule within risv subcomunity?
> >>
> >> Alistair asked on a previous thread; my view was:
> >> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.html
> >> and nobody else spoke up disagreeing (summary: should at least be
> >> disabled-by-default and only enabled by setting an explicit
> >> property whose name should start with the 'x-' prefix).
> >
> > Agreed!
> >
> >>
> >> In general QEMU does sometimes introduce experimental extensions
> >> (we've had them in the block layer, for example) and so the 'x-'
> >> property to enable them is a reasonably established convention.
> >> I think it's a reasonable compromise to allow this sort of work
> >> to start and not have to live out-of-tree for a long time, without
> >> confusing users or getting into a situation where some QEMU
> >> versions behave differently or to obsolete drafts of a spec
> >> without it being clear from the command line that experimental
> >> extensions are being enabled.
> >>
> >> There is also an element of "submaintainer judgement" to be applied
> >> here -- upstream is probably not the place for a draft extension
> >> to be implemented if it is:
> >>  * still fast moving or subject to major changes of design direction
> >>  * major changes to the codebase (especially if it requires
> >>    changes to core code) that might later need to be redone
> >>    entirely differently
> >>  * still experimental
> >
> > Yep, agreed. For RISC-V I think this would extend to only allowing
> > extensions that have backing from the foundation and are under active
> > discussion.
>
> My general philosophy here is that we'll take anything written down in an
> official RISC-V ISA manual (ie, the ones actually released by the
> foundation).
> This provides a single source of truth for what an extension name /
> version
> means, which is important to avoid confusion.  If it's a ratified
> extension
> then I see no reason not to support it on my end.  For frozen extensions
> we
> should probably just wait the 45 days until they go up for a ratification
> vote,
> but I'd be happy to start reviewing patches then (or earlier :)).
>
> If the spec is a draft in the ISA manual then we need to worry about the
> support burden, which I don't have a fixed criteria for -- generally there
> shouldn't be issues here, but early drafts can be in a state where they're
> going to change extensively and are unlikely to be used by anyone.
> There's
> also the question of "what is an official release of a draft
> specification?".
>
> That's a bit awkward right now: the current ratified ISA manual contains
> version 0.3 of the hypervisor extension, but I just talked to Andrew and
> the
> plan is to remove the draft extensions from the ratified manuals because
> these
> drafts are old and the official manuals update slowly.  For now I guess
> we'll
> need an an-hoc way of determining if a draft extension has been officially
> versioned or not, which is a bit of a headache.
>
> We already have examples of supporting draft extensions, including
> priv-1.9.1.
> This does cause some pain for us on the QEMU side (CSR bits have different
> semantics between the specs), but there's 1.9.1 hardware out there and the
> port
> continues to be useful so I'd be in favor of keeping it around for now.  I
> suppose there is an implicit risk that draft extensions will be
> deprecated, but
> the "x-" prefix, draft status, and long deprecation period should be
> sufficient
> to inform users of the risk.  I wouldn't be opposed to adding a "this is a
> draft ISA" warning, but I feel like it might be a bit overkill.
>
> >
> > Alistair
> >
> >>
> >> thanks
> >> -- PMM
>
>
