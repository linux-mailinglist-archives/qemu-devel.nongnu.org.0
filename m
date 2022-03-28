Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E164E4E8BEF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 04:11:50 +0200 (CEST)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYerF-0004SP-Hl
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 22:11:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nYeqA-0003fy-D1
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:10:42 -0400
Received: from [2607:f8b0:4864:20::1131] (port=46998
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nYeq8-0002Zi-Ql
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:10:42 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2e5e176e1b6so133483527b3.13
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+AYxCrubaHS6NcQi+lSL2gXb7aGjXwT+zIvWjuViwL4=;
 b=Ss47M8mYNf1bCbEmyENGTJuBJNKv/j7KobNrrH4LlrU3SAEwjyryX18Bie/TwK0hpg
 pWMDJfEtK3HxcijVxzDyrvlQkpppvT9w9hgFfidEcDPEuh+uvbH2uJpCie3Coozto1AS
 SA32aXCd5dvdM+RE+uKyk6Akl7Vv7l8INIQX6rtThlDu8yUga7qe+aA2lJXNIG+pfzGn
 2YZR3DJEfGoUxkSh+57wELDZDJDMHenjU7gqnR+YiQYS1wKnFkzt2IQywlpzNY70y6tZ
 FWYI7IuwGcmvAbd/oR0F4KxW2kiWllkgkXz+A0oSfs4XVCy30+sw3tthnZfFpY/kZoN3
 c1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+AYxCrubaHS6NcQi+lSL2gXb7aGjXwT+zIvWjuViwL4=;
 b=rQBbmFnuxximAHS3y4lxnPaesPgklM6gEhN4e3Oasut7XiyWp1dVH4t52+5gvvSE+I
 s3Ub9gMX9PgV04p7gObPLBUJ0jG5BdK3DabathLauv3O9wety/We4LEoxZyRKbHi3MIu
 qStSqvR2tLcaItavWjbJd78qVMGlVKPSsYmsiEiEHxTcmYT+DKpcPTmcSFS9weXmjAxy
 H5jXMUeP9PysY/BBHr8fHx0Rfu4DcMkjv/jeBdUuDXUBxvf5d1h6s1kMbUagSIR4EjFe
 mOqb/VuyISv57VjkEyjmWEPZiga8D8DZOX4PE4QWhZISqcrENAzGeoBP3stHHbVVXDRn
 qh8A==
X-Gm-Message-State: AOAM532EZXTTktnguX+kxEJf9vvYGVFGnWDjtuRhhxLLnnsL/iNKxs8O
 dK+qXdthdXZ4+csky8d3SVMcrfPA/B3r9IT9x5I=
X-Google-Smtp-Source: ABdhPJwvPYdeaYWZRfwWr34vL7zZzSUATURd37yhi78UFx6Z3R6tPePI0kI5YN/jUYlRwHrg4z0gl+Kqvxx+CVn1NDY=
X-Received: by 2002:a81:8106:0:b0:2dc:1f07:920b with SMTP id
 r6-20020a818106000000b002dc1f07920bmr23674923ywf.330.1648433439545; Sun, 27
 Mar 2022 19:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
 <87wngj3aj2.fsf@linaro.org>
 <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
In-Reply-To: <CAFEAcA_O8=0KZ=sjzP7GZ=ytSQm0P+zB_t=jQ2nZnw6b721Yxw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Mar 2022 10:10:28 +0800
Message-ID: <CAEUhbmWjjqihJb70x2k4+yf9dr8yh+_eMRu0MubofSbw+C9izQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 7:52 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 24 Mar 2022 at 10:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> > I think we need to not use cpu_physical_memory_write (which is
> > explicitly the system address space) but have a function that takes cpu
> > so it can work out the correct address space to you
> > address_space_read/write. If null we could probably reasonably use
> > first_cpu as an approximation.
>
> It's not sufficient to use address_space_read/write, because the
> devices in question are written to figure out the accessing CPU
> using current_cpu, not by having different MemoryRegions in the
> different per-CPU AddressSpaces. (You can see this because the bug
> is present in the common "gdb gives us a virtual address" case which
> goes via cpu_memory_rw_debug() and does thus use address_space_read(),
> not only in the oddball 'treat addresses from gdb as physaddrs' case.)
>
> If we want to fix this without setting current_cpu, then we need to
> rewrite these devices not to be accessing it, which we could do
> in one of two ways:
>  * have the devices arrange to put different MRs in the ASes
>    for each CPU (this is possible today but a massive pain as
>    it would likely involve restructuring a lot of board and
>    SoC level code)
>  * have the MemTxAttrs tell the device what the accessing CPU is
>    (probably by extending the requester_id field); this is
>    somewhat analogous to how it happens in some cases on real
>    hardware, where the AXI bus signals include an ID field
>    indicating what initiated the transaction. This feels neater,
>    but it's still quite a bit of work for such an unimportant
>    corner case.
>
> Or we could work around things, by requiring that devices that
> access current_cpu cope with it being NULL in some vaguely
> plausible way. This means that even when you tell gdb or the
> monitor "access this address using this CPU" you'll get CPU0's
> view, of course. Some devices like hw/intc/openpic.c do this already.
>
> Or we could continue to ignore the bug, like we've done for the
> past six years, on the basis that you only hit it if you've
> done something slightly silly in gdb or the monitor in
> the first place :-)

IMHO it's too bad to just ignore this bug forever.

This is a valid use case. It's not about whether we intentionally want
to inspect the GIC register value from gdb. The case is that when
single stepping the source codes it triggers the core dump for no
reason if the instructions involved contain load/store to any of the
GIC registers.

Regards,
Bin

