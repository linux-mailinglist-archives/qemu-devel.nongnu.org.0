Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11F4EDDF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 19:38:01 +0200 (CEST)
Received: from localhost ([::1]:37066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heNU7-0005rp-Ng
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 13:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59345)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bobby.prani@gmail.com>) id 1heNT0-0005T3-EZ
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 13:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bobby.prani@gmail.com>) id 1heNSz-0006bj-3y
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 13:36:50 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:46912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bobby.prani@gmail.com>)
 id 1heNSy-0006ZP-S4
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 13:36:49 -0400
Received: by mail-io1-xd44.google.com with SMTP id i10so966242iol.13
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 10:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5cfpFTXj48N+Gg9EW7pak7y3fghKsjChFuElCzgLo+I=;
 b=eoiR3eiz70GQlZqWVDGSiZ3p2c4Dz0tufqHwELvd2K/xct+ajLZSiNqqW26a3W4fGa
 EvuV3hTS5V+QenDd0l+hjvbACbinb30XbFjRcLqWOpEbzXKx0AbKAMP30BnSjq28hiNC
 0T02qNYdHHHl5QLPtMmNzDWkZCtlkcVlcdEo9SJuz8Y9OJUqf0GOIcZp1a2cIDUOfGMD
 a+/qypFzrZRbvj4zo3AqgDZkXm4GkDuwXnxucv+hciVjH6sd+bjG3vBNJA4X5FJrKfZZ
 ZBy3xioOL4p0SQ+19fbgdnZx5v1n4+AOft0AnYfpmOqfzFl1Ot5zrJ6FxjZqZHRdq4tB
 4PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5cfpFTXj48N+Gg9EW7pak7y3fghKsjChFuElCzgLo+I=;
 b=iEkk3Pqnqyz2RRgy9m3HTod5K7sQu828fZt4mQDuoiui3mwdIyIYl8ApKkM1KGI5AV
 6X38/wjja8uEpR+yMNKL9x93H0id2DKL8mbkOoSY17rOuEbjgWD6TXyExFiwauOxAu3u
 4mfx99X6QBL0BSye3bRuIQiDMb12I0vsnMtkWtmsm7kHWJ58fXxOPoNKz986iZ0i0rzL
 4qfynicYgwMHyiL3UEqkcnYCNj8m4qVpvacVTSXOmffwZENbjpc2Uef4Mr5AWIhXgDRr
 eIlDXJOVmtZq6GK5EwJd2nkehuOZeh2uk0OvLIgWznzPqirM9EtVtnEsswOs2XUw1SSE
 hwMg==
X-Gm-Message-State: APjAAAUl/1so7F9COevwWYmxD4wVC9LLkCC9fZ5PJD4w/Eo4jWmckEi0
 42OCX1qbaGagnKy/M+c6i+O3rmZS4EWUdfBeki0=
X-Google-Smtp-Source: APXvYqycIvq2arze/I2WRXENru0skbErbgnYiFc+Pbq4MXkrU6orEnxMindM47jdlqyZfSP4oE8lGuTD6uDRlF1fntM=
X-Received: by 2002:a5e:c207:: with SMTP id v7mr27963303iop.163.1561138607260; 
 Fri, 21 Jun 2019 10:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <CADYwmhFw8ujwz+NN9prKc+Za6=dD1aN==JnKmC0gnr4V7LPU4w@mail.gmail.com>
 <87r27n8i2f.fsf@zen.linaroharston>
In-Reply-To: <87r27n8i2f.fsf@zen.linaroharston>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Fri, 21 Jun 2019 10:36:21 -0700
Message-ID: <CAJhHMCALe5K53OOmXae4dwa9wDn-RbDaPwdS-Xe+eA1PVbRG+Q@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-devel] [PATCH v3 00/50] tcg plugin support
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 21, 2019 at 1:21 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> > * Register and memory read/write API
> >
> >   It would be great to have register and memory read/write API i.e., ab=
ility
> >   to read/write to registers/memory from within the callback. This give=
s the
> >   plugin ability to do system introspection. (Not sure if the current p=
atchset
> >   implements this already).
>
> Not currently. The trick is to have something flexible enough without
> exposing internals. I guess we could consider the gdb register
> enumeration or maybe hook into stuff declared as
> tcg_global_mem_new_i[64|32]. That won't get every "register" but it
> should certainly cover the main general purpose ones. Things like SVE
> and AdvSIMD vector registers wouldn't be seen though.

I guess general registers could be a good starting point. We can then
implement arch specific register access APIs.

>
> > * Register callbacks
> >
> >   A callback needs to be invoked whenever a specified registers is read=
 or
> >   written to.
>
> Again tricky as not every register read/write is obvious from TCG -
> vector registers tweaked from helpers would be a good example.
>
> >
> > * Where do new plugins live in the tree?
> >
> >   The current source files in plugins (api, core etc.,) I think are bet=
ter if
> >   moved to tcg/plugins/.  The various plugins we write would then live =
in the
> >   plugins/ folder instead of the current tests/plugin/ folder.
>
> The example plugins are really just toys for experimenting with the API
> - I don't see too much problem with them being in tests. However the
> howvec plugin is very guest architecture specific so we could consider a
> bit more of a hierarchy. Maybe these should all live in tests/tcg?
>

So where do you want 'real' plugins to live in the tree? It would be
good to think about the structure for those.

> >
> > * Timer interrupts
> >
> >   What I observed is that the system execution is affected by what you =
do in
> >   the callbacks because of timer interrupts. For example, if you spend =
time in
> >   the memory callback doing a bit of processing and writing to a file, =
you
> >   will see more timer interrupt instructions. One solution to this woul=
d be to
> >   use 'icount', but it does not work that well. I think we need to do
> >   something similar to what gdb does in debug mode. How would you handl=
e MTTCG
> >   guests in that case?
>
> icount is going to be the best you can get for deterministic time -
> other efforts to pause/restart virtual time going in and out of plugins
> are just going to add a lot of overhead.

I wonder why using icount is not working in this case. Are there any
timers that fire non-deterministically even when icount is used?

>
> Remember QEMU doesn't even try to be a cycle accurate emulation so
> expecting to get reasonable timing information out of these plugins is a
> stretch. Maybe I should make that clearer in the design document?

It is less about being cycle accurate and more about being
deterministic. For example, when tracing using plugins+callbacks, you
will see a lot more interrupt code in the trace than when if you
execute without tracing. How do we get them to be more similar?

Another idea would be to provide an API for the plugin to generate the
timer interrupt. This allows the plugin to generate regular interrupts
irrespective of what is being done in the callbacks.

>
> The gdb behaviour is just a massive hack. When single-stepping in GDB we
> prevent timer IRQs from being delivered - they have still fired and are
> pending and will execute as soon as you hit continue.
>
> >   Another approach would be to offload callback generation to a separat=
e
> >   plugin thread. The main thread will copy data required by a callback =
and
> >   invoke the callback asynchronously (std::async in C++ if you are
> >   familiar).
>
> This would complicate things - the current iteration I'm working on
> drops the haddr cb in favour of dynamically resolving the vaddr in the
> callback. But that approach is only valid during the callback before
> something else potentially pollutes the TLB.
>

> >
> > * Starting and stopping callback generation
> >
> >   It would be great if we have a mechanism to dynamically start/stop ca=
llbacks
> >   when a sequence of code (magic instruction) is executed. This would b=
e
> >   useful to annotate region-of-interest (ROI) in benchmarks to
> > generate callbacks.
>
> Well we have that now. At each TB generation event the callback is free t=
o register
> as many or few callbacks as it likes dynamically.

But how does the plugin know that the TB being generated is the first
TB in the ROI?
Similarly the plugin needs to know the then end of ROI has been reached.

Also, please note that there can be multiple ROIs. It would be good to
know if we can assign ids to each ROI for the plugin.

Thanks,
--=20
Pranith

