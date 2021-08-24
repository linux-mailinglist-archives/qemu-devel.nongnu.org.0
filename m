Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423863F5AAA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:13:26 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISUn-0003e6-5o
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISTa-0001HK-Ii
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:12:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISTU-0003LG-Kj
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:12:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id i6so30550802edu.1
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koheVDs+/OKX3JpROEujOYanfsFtXB+c/60/gWldHD0=;
 b=m/r/px+4zOS3DleHfBI4QcKuIGYWEqBnd0tPYMBxz8CjmCafbVbuotus+w1YJzUaHI
 waY/yYOwIdIoRkTuC5sZD6limfHfvfOnLN89otaEj9rtDt6s4HvJgUPeuyPqs5DViW7l
 m9DSjrWBVow9BYu/WDncw1Y73RFgKe7s5oDKE+j1rusBjsWt5OBUH99S4q+8QRbWhteh
 /5Pj2XgHn45cjKflOda0utabE7kr6XQXBmi5Ma4U5NIRvvshodN3wzlGowq06iBFp0pJ
 DmXVRAg32FwCG2UW+HiLdYRIL01E9cHsL9QrJnpSmRfmHzClR3zWqONvBZIS8NwEwJnn
 2JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koheVDs+/OKX3JpROEujOYanfsFtXB+c/60/gWldHD0=;
 b=lpP8ywUTteDzVxqK3Nn6/tX90WgCol6hQZVAKuovJnfTSL+k35XWCddV4Fo5PKN+zp
 YEjFvi+QzMQxj4BsA/D6cISAbbo9bec70FE17jVxWUNNo6xsQd6kNnwWXWm9CHAF7Ii9
 /RBPHTmUHii+f+mNf+xG8RbzE/LG6i9MsRdW76YPZP0P8utdA7PYEqE6tnsQBKKzDcnT
 I9rBBObDwi7CC19DHrgiBQ21paO20yP8YH+3u0s0uRHN393kc7GdQiF6jECko/aNVroW
 sOJEj82fArF0Q7fxX97MxpALL6ofbTvxhvQyXbppMoYN/+sO9u3GfYt4hgO/E0KiDI4m
 /J6g==
X-Gm-Message-State: AOAM531kyJ6wz8HlCvTIVvidPMUhoG20Iz9ZAUkb33U7yE8OtfKiXGhU
 mv7QPnYodaIRFZxxTpdVX/TYbxt2MGfIdA+ag0wvhg==
X-Google-Smtp-Source: ABdhPJwxyAMPMI9YmggIloFbTje0kuMe9QeWGteNoECe62Bv+V4cEg6Gl4BqSICH0RwGBoMPelpWUXkWjO9mn0fiJok=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr41930472edc.204.1629796321088; 
 Tue, 24 Aug 2021 02:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
 <20210823230535.js3gymomh2chmznc@mail.google.com>
In-Reply-To: <20210823230535.js3gymomh2chmznc@mail.google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 10:11:14 +0100
Message-ID: <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 00:05, Changbin Du <changbin.du@gmail.com> wrote:
>
> On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> > changes to be more capable of handling dynamic target changes
> > (this would also help with eg debugging across 32<->64 bit switches);
> > as I understand it that gdb work would be pretty significant,
> > and at least for aarch64 pretty much nobody cares about
> > big-endian, so nobody's got round to doing it yet.
> >
> Mostly we do not care dynamic target changes because nearly all OS will setup
> endianness mode by its first instruction. And dynamic changes for gdb is hard
> since the byte order of debugging info in elf is fixed. And currently the GDB
> remote protocol does not support querying endianness info from remote.
>
> So usually we needn't change byte order during a debug session, but we just want
> the qemu gdbstub can send data in and handle data it received in right byte order.
> This patch does this work with the help of users via the option 'endianness='.

I'm not a huge fan of putting in workarounds that deal with the
problem for specific cases and require users to tweak options settings,
rather than solving the problem in a more general way that would
let it all Just Work for all cases.

-- PMM

