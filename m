Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8130B20A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 22:24:01 +0100 (CET)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6gfw-0001kE-JL
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 16:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6geT-00018K-3q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:22:29 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6geO-0002Kb-Ld
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:22:28 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c2so20551304edr.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 13:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+SLzS31n4x1I/uO0eFE40WqwDzbQH4oIkzAyKgrFUsE=;
 b=Uxp86bl/abfGZog3jBYBRN4C+Ufv8QbNrZJV4wZeGys6Z9rvWgDRQQogoHwkmUYMGa
 /CfqyFQQd+IFHeIDbMW82yPpK1ho8t40EzkiwufMyGw3oIteALDaiikNzJmWWY8cjzOW
 tYw2of3lHVa6zUsvGHFuiLa6ys9WLmf3fwcaP0Vfa0p0zDB5ZcYzm/nvgsOqfgAjsqkQ
 SVSELOBptGF8HD7o1AbuQpe7j3Qd8UD6POQWzk4vOQ75Fo4awm8ql2y7o9qFnI4eQOfE
 kBIajjAaqPiZzsUsNZNuE8QM+ya7JVVcRZHyGiD3omv2iVhcuLZyFcxGXafSflW/ZoTi
 c6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+SLzS31n4x1I/uO0eFE40WqwDzbQH4oIkzAyKgrFUsE=;
 b=QqY5RzDxxH5+s3WWlQ1mW3zFZgIXEO4fQmBK2cC4TgOIYy2/xHAuSXNxavNUx5tT+E
 ZF3lwTZRj4X1Wi7txXzCVQk4FjdGFFJ/+UKo7Sr7OkqgJUjg1i9eUYWFSFiGtJmYNCN+
 2/0nc3LCytaf6UUb1FJsAgQJE/pnLh4AIA90HdGBqJymlET7Pe7yCG3jxdL2imXkFn5q
 H47nL8U6wWykM0jRZFXchi1hQNLLU4U5hYZE8WdX/pUjo+9/7FgLhrpcBNu/2WRVd5ht
 +FWRz8TKEbar4KESExX9QJukMW51oXKF3pqYoVKFlG1V77kdUA2CxUL1ySlwEPQ8oeQE
 IKDw==
X-Gm-Message-State: AOAM532yHYt4QOp54ZD7efltXkPQZBBuob8oA73BxOqeToAngKGoFCjN
 2fBVekQBys7DA45CVmcrHw8Pc454mFj8xCI9aDP1+Q==
X-Google-Smtp-Source: ABdhPJzkNDWPkiOkmqZD09bl8WxqgLGYlJ0Mfv40b3RFGRDv3K6AlLtseFkGwgGeHEADwtxvN3ovR4W0v4GwV862aP8=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr20851479edv.36.1612214542640; 
 Mon, 01 Feb 2021 13:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20210128185300.2875-1-alex.bennee@linaro.org>
 <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
 <871rdzv9cf.fsf@linaro.org>
In-Reply-To: <871rdzv9cf.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 21:22:11 +0000
Message-ID: <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Anders Roxell <anders.roxell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 at 20:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> The wiki and the web are curiously absent of the right runes to boot a
> >> vexpress model so I had to work from first principles to work it out.
> >> Use the more modern -drive notation so alternative backends can be
> >> used (unlike the hardwired -sd mode).
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Anders Roxell <anders.roxell@linaro.org>
> >> ---
> >>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
> >>  1 file changed, 26 insertions(+)
> >>
> >> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.r=
st
> >> index 7f1bcbef07..30b1823b95 100644
> >> --- a/docs/system/arm/vexpress.rst
> >> +++ b/docs/system/arm/vexpress.rst
> >> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU=
 model:
> >>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
> >>    provided on the command line then QEMU will edit it to include
> >>    suitable entries describing these transports for the guest.
> >> +
> >> +Booting a Linux kernel
> >> +----------------------
> >> +
> >> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
> >> +enough to get something running.
> >> +
> >> +.. code-block:: bash
> >> +
> >> +  $ export ARCH=3Darm
> >> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> >> +  $ make multi_v7_defconfig
> >> +  $ make
> >
> > We probably shouldn't be recommending in-tree kernel builds, or
> > polluting the user's environment with random variables. Try:
> >
> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- mul=
ti_v7_defconfig
> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-

> Building a current Linux kernel with ``multi_v7_defconfig`` should be
> enough to get something running. Nowadays an out-of-tree build is
> recommended (and also useful if you build a lot of different targets).
> $SRC points at root of the linux source tree.
>
> .. code-block:: bash
>
>   $ mkdir build; cd build
>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabih=
f- multi_v7_defconfig
>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabih=
f-

That works, but do you really commonly cd into the build directory?
I usually sit in the source tree...

thanks
-- PMM

