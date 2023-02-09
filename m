Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886F690B75
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:15:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7h0-0003D1-HE; Thu, 09 Feb 2023 09:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ7gy-0003Bi-7i
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:14:28 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ7gw-00017S-Ca
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:14:27 -0500
Received: by mail-pg1-x534.google.com with SMTP id x31so1642189pgl.6
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 06:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xJNmhVIYO0Sy+mtLAEhDjTPYxdJYkE6vBtcTZrbSCos=;
 b=Nm/rrmrDvNzq0CymZss7M5vV7MoL6azeHOj45TDMkE3A0DoD/eC+HoN2rJ+JgLbhzP
 hbiaYqukQ7zhLWB1wy1Xk6MwEjY5rmXszt92eWtDfqvETLLxJqmC/HBDPmbBAM9IXKNs
 cjjnnZyZN7sarceLksNRZZF3BzaOWWJZAn9OpYMPwqcfh9EXb1jaEVGkRu7O/G96KqlV
 ubZlSzWQSAeS6M4nWOrLY+BUuJ6LD8yRCfYKFAE4eByaOeHCfd75pt8q4GotmnSuVDTJ
 tdbkI5jlxpt4qzDLqpZsqjCz4AY36l9hm7loR6Eklyrgxda/TovgUxYHDPTtU9/9tHY4
 yc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xJNmhVIYO0Sy+mtLAEhDjTPYxdJYkE6vBtcTZrbSCos=;
 b=fzoE8HUPX68aYKzENvbVTpbnL3Sz4cYht4xLCw+z6+e3M8aFw8OxJZ+3hYlCoODoJL
 2Xnqb2JZ/Aq6aT7R78mnAoZJ29x7dDZiTsy9fK88X8p8OpZJI0p3W3QC8BRVZUBgDEtn
 lmrBahcIl94yX16yeKXO4pG+zyE7ELjavSjbRmmY42qpNt/esBg2eXRqmZtdQ0uZ1lel
 7bj27yNai0atZrI/+TstOlMUj3CKVxQKDZIab7pq0dUCH/yMJ3cOdhAm1kvJVKn+Omeq
 aWBdDXR4n8etBYLzssPd9LCXMPOmBKET+24oa/PPQmHYfYG/gELAZmikG0fm4WSxQAQq
 Hb4g==
X-Gm-Message-State: AO0yUKXQ6aFdLgl/oPML6OFpG55XZepJCsdHs+6dwsafCj4Ce5ajeFQH
 p1VcoOS2sEfSFBm5cT4PDRySIIvMO34XGXge9zTnhw==
X-Google-Smtp-Source: AK7set89+tZzn6gqMDKU9qEZLRvAnboGQTebq3XsvUxX426qONLiqfyl/RtEdEprxKsKflThyD/xoqOW/qeRZugic3Q=
X-Received: by 2002:aa7:9e5a:0:b0:5a8:482f:c328 with SMTP id
 z26-20020aa79e5a000000b005a8482fc328mr1202642pfq.39.1675952064626; Thu, 09
 Feb 2023 06:14:24 -0800 (PST)
MIME-Version: 1.0
References: <f71df8f625e4110b84b6c4fefd9e95619b3ab92e.camel@physik.fu-berlin.de>
In-Reply-To: <f71df8f625e4110b84b6c4fefd9e95619b3ab92e.camel@physik.fu-berlin.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Feb 2023 14:14:13 +0000
Message-ID: <CAFEAcA-Le_YbaYn6i15EesDMan+OF0S7uteanSXrWYK37HbdvQ@mail.gmail.com>
Subject: Re: Linker failures trying to build static qemu-user binary
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Thu, 9 Feb 2023 at 13:54, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi!
>
> I usually build a static qemu-user binary from the git source using the following
> configure line:
>
> export ARCH=m68k && ./configure --target-list=$ARCH-linux-user --static --disable-rdma \
>                     --disable-pie --disable-system --disable-xen --disable-pvrdma \
>                     --disable-libssh --disable-werror --disable-glusterfs
>
> However, that stopped working some time ago with the linker error below.
>
> Does anyone know how to fix this?

The "Using getpwuid in statically linked applications" etc warnings
are expected, so we can ignore those; this is the key error:

> /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o): in function `__libdwfl_debuginfod_init':
> (.text.startup+0x17): undefined reference to `dlopen'
> /usr/bin/ld: (.text.startup+0x32): undefined reference to `dlsym'
> /usr/bin/ld: (.text.startup+0x4b): undefined reference to `dlsym'
> /usr/bin/ld: (.text.startup+0x64): undefined reference to `dlsym'
> /usr/bin/ld: (.text.startup+0x7d): undefined reference to `dlsym'
> /usr/bin/ld: (.text.startup+0xdc): undefined reference to `dlclose'
> collect2: error: ld returned 1 exit status

We use pkg-config to find out what the libdw library needs on
the compiler/linker command line to link successfully, so
maybe your distro's pkg-config info isn't right. What does
"pkg-config --static --libs libdw" say ? If libdw needs libdl
then it ought to list it in that output, I think. IME pkg-config
information is often incorrect for static linking, though.
I guess this one happened to work previously because glibc didn't
actually mandate linking with '-ldl', and now on your system it
apparently does. On my system pkg-config says
-ldw -lbz2 -llzma -pthread -lpthread -lelf -lz
which looks like it's missing -ldl, but the link succeeds anyway,
presumably because the symbols are provided by the main glibc .a.

On the other hand, if libdw wants to use dlopen/dlsym then
I wonder if we should just suppress it for static linking:
on my (Ubuntu 22.04) ld warns:
/usr/bin/ld: /usr/lib/x86_64-linux-gnu/libdw.a(debuginfod-client.o):
in function `__libdwfl_debuginfod_init':
(.text.startup+0x1b): warning: Using 'dlopen' in statically linked
applications requires at runtime the shared libraries from the glibc
version used for linking

so whatever libdw is trying to do will likely not work in most
statically-linked situations anyway.

I've cc'd the author of the commit that added the libdw
dependency.

thanks
-- PMM

