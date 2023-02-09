Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC03C690BA3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:24:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7ps-0007wx-Sl; Thu, 09 Feb 2023 09:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ7pn-0007tn-JQ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:23:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ7pl-0003JK-9F
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:23:35 -0500
Received: by mail-pl1-x629.google.com with SMTP id b5so2959880plz.5
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 06:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UQcDxg7aL6D5moMQE1sEpLhiqY0tNIoynoElVkpsPa4=;
 b=CKE7iuGyHq8/3szPifE6UdA8sefMi47v0M0+hrREQ0mQN4pJY92E/ZVpk9jLIyHD54
 KpfytT+Gx0ry60XO7cLHvY376jLk70XLJvCUGlBumLQeoHbI/cbP+s2/zIADHKHa2+3r
 kiPKqgz4H8uNJ643jm/rmM+A9CPhpCln7XBSdWcdZqrqYU+zrHdKnnrzHVO85SJDISi2
 0/sUtcu8t2mKYDF2xmkMy25ZNSvPJi+CSISUKn09F7wFBotxgtBQ8l0zUEYkaaRctxEt
 VvT5Gajwr6gflv+bWVnQIy5XYWp/MTXVhmemE1NlEU7mfgtThZvhXajMLr6fT7/qN2xe
 AjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQcDxg7aL6D5moMQE1sEpLhiqY0tNIoynoElVkpsPa4=;
 b=W35QLJiMAW86azkIOn5YbrzKa7fdDGaOQxicrn1MB7V2xolZBmgNMEk3lTDdR5ZB46
 ib8nzStOr09GsO8O1sVvitLhBIGrxOqb/gOtUU9spurI8dQ8zAyFkJXluDENjRW8M9B/
 9UrXxtdoV4oMv7Jzbf3T+Jh9hwPzGB9FsQcMybHJwRXcdnVgGEnUfHiw9hHZqil1lGTU
 u7Gui2sj+rshHwRclEooIPVDTeLWsJ6OzciKDcRa9iIRxq9m49ulUn6Vt6cQCTTygah3
 05CB7ZsKC/XLjtXsQDizy4zJXd9VlPms8RL3vXs44TqbCPs+cuO6IClSdurpqbMHmVUS
 rMgw==
X-Gm-Message-State: AO0yUKWobH1c2+m5NH8zQbQJPQBtNKHxzK9N592lPv1N2NzxP8G6fg0P
 aQ2+KOvSrBZctdx/xOgAmBYLNiWyS+GSYu1/5XaYJg==
X-Google-Smtp-Source: AK7set/CmmNVLfrfc1a+dEFbGJhW//JTfUw2wJlEscbkXdFyj7bxprTaY01d3wstHyFntgtVRBbVlswAzxusgi2JHtI=
X-Received: by 2002:a17:902:6b88:b0:199:1458:6c67 with SMTP id
 p8-20020a1709026b8800b0019914586c67mr3056324plk.28.1675952611633; Thu, 09 Feb
 2023 06:23:31 -0800 (PST)
MIME-Version: 1.0
References: <f71df8f625e4110b84b6c4fefd9e95619b3ab92e.camel@physik.fu-berlin.de>
 <CAFEAcA-Le_YbaYn6i15EesDMan+OF0S7uteanSXrWYK37HbdvQ@mail.gmail.com>
 <48f42e259498adc7953853572eb481279ee06e71.camel@physik.fu-berlin.de>
In-Reply-To: <48f42e259498adc7953853572eb481279ee06e71.camel@physik.fu-berlin.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Feb 2023 14:23:20 +0000
Message-ID: <CAFEAcA8=L-S+41wCZ7z-JUzt5Cg_CQH_ruOTCUeWud6vfy1F4w@mail.gmail.com>
Subject: Re: Linker failures trying to build static qemu-user binary
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 9 Feb 2023 at 14:21, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi!
>
> On Thu, 2023-02-09 at 14:14 +0000, Peter Maydell wrote:
> > The "Using getpwuid in statically linked applications" etc warnings
> > are expected, so we can ignore those; this is the key error:
>
> OK.
>
> > > /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o): in function `__libdwfl_debuginfod_init':
> > > (.text.startup+0x17): undefined reference to `dlopen'
> > > /usr/bin/ld: (.text.startup+0x32): undefined reference to `dlsym'
> > > /usr/bin/ld: (.text.startup+0x4b): undefined reference to `dlsym'
> > > /usr/bin/ld: (.text.startup+0x64): undefined reference to `dlsym'
> > > /usr/bin/ld: (.text.startup+0x7d): undefined reference to `dlsym'
> > > /usr/bin/ld: (.text.startup+0xdc): undefined reference to `dlclose'
> > > collect2: error: ld returned 1 exit status
> >
> > We use pkg-config to find out what the libdw library needs on
> > the compiler/linker command line to link successfully, so
> > maybe your distro's pkg-config info isn't right. What does
> > "pkg-config --static --libs libdw" say ?
>
> glaubitz@nofan:~> pkg-config --static --libs libdw
> -ldw -lbz2 -llzma -pthread -lpthread -lelf -lz

Right, same as my output.

> I'm building on Debian stable (Bullseye).
>
> > If libdw needs libdl
> > then it ought to list it in that output, I think. IME pkg-config
> > information is often incorrect for static linking, though.
> > I guess this one happened to work previously because glibc didn't
> > actually mandate linking with '-ldl', and now on your system it
> > apparently does. On my system pkg-config says
> > -ldw -lbz2 -llzma -pthread -lpthread -lelf -lz
> > which looks like it's missing -ldl, but the link succeeds anyway,
> > presumably because the symbols are provided by the main glibc .a.
> >
> > On the other hand, if libdw wants to use dlopen/dlsym then
> > I wonder if we should just suppress it for static linking:
> > on my (Ubuntu 22.04) ld warns:
> > /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o):
> > in function `__libdwfl_debuginfod_init':
> > (.text.startup+0x1b): warning: Using 'dlopen' in statically linked
> > applications requires at runtime the shared libraries from the glibc
> > version used for linking
> >
> > so whatever libdw is trying to do will likely not work in most
> > statically-linked situations anyway.
>
> So, just include "-ldl" in LD_FLAGS?

If this is necessary, then pkg-config should tell us to do it :-)

But in the usual situation that you put the statically linked
QEMU binary into a chroot, the dlopen() that libdw is going to
try to do won't work anyway...

thanks
-- PMM

