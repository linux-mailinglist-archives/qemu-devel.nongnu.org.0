Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E334F264
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 22:48:24 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRLHi-0004k1-Jr
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 16:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRLGI-0004ID-1C
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 16:46:55 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRLGF-0004lH-3e
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 16:46:53 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h10so19725342edt.13
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hjF/Nf4jazmZZxHuuMH0gSY3awTMprYZxnLWUZibjxk=;
 b=NF9w7CpiHpuKWxFh4GitwByei2bQML+ioExp7xGejKcZjFoDhg4+UM2wgpyIWCHpAW
 PH0PmrTWqrytUBy2ouPvaLLfgjympCUjTv32jt27qJg713VnS+kNPTmyIQLQzViXVL9f
 wkWeF2M/1HiPdjJ3/N2erx+HOGcPLv4/IlKKYtsAeoHmuL+HXqUq+2yq1m1iVZ1/9KJ4
 5F/jKQHvicdfHyliY5AU0pmUqlZ6okxbbaNd2KrQHABUdzubqvqKQ0J6qMukj+IJnhme
 HqvQWPUBE9pSKA4T/LdeDMizwcpKnvC3g4fKZAfrUjmc8rvyXPxSdOIqxJJ4lbkNqDaJ
 YLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hjF/Nf4jazmZZxHuuMH0gSY3awTMprYZxnLWUZibjxk=;
 b=Ap/JQfRoZlg4TcvwHMwVxAwlWA0oJIULdqSc8lIf+6X1fMK+9C4Ilb4P3rWwhtTnqP
 KpjSxswsUpeF81PYvIddo0tCu0hIPR46KjD7LuDYUxCWH/nbLf+h3iXN1oDWuaxU5i/Z
 Hk8y9lsD5dJxOQ2mjRKF5iy9ygA/WEBLNwloAzSrpjy+5KQkbcLWMRyqw4WbH7LhauQo
 eyPAdJCMavuKEh37Ox1hX8UqjEEelp76YAmGrheDMOrAIeYYFnyM0jU0c86GkzcBrpyy
 6FMSqX96KxatX4DrZMosIebPBlP5DCsEEjBMaEowDDbZZUph5qgMx6hjg7DpgbCAot5r
 Feng==
X-Gm-Message-State: AOAM531rbT944+3dAdG5cszQGxToYeYk74NkFWRtTGDxSzuwAN0MCikw
 EPKyivq/Y/bJlyEL7CNS742zoEVxQKQS640aNi4VPA==
X-Google-Smtp-Source: ABdhPJwE3IC9vTcNwAJ4uv0NJGOo/WYZsnTo1plAjNzQYLfiBwxevDpqlIOr6BhsM6SpEdC9LmffPNZgZCtZZbjkPZE=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr35651340edu.52.1617137209252; 
 Tue, 30 Mar 2021 13:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-7-alex.bennee@linaro.org>
 <a71640f7-a864-1214-52d7-e6dab4677dd8@linaro.org>
 <CAHDbmO1+q=DxGQcoirmnsSfwp_XKoJvj04oWJBhpGCiEsK=_MQ@mail.gmail.com>
 <c0e83eb0-29ef-495a-1653-e0281812664c@linaro.org>
In-Reply-To: <c0e83eb0-29ef-495a-1653-e0281812664c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Mar 2021 20:46:17 +0000
Message-ID: <CAFEAcA-UL1hYanrOb5dBJWRHhfD9VVMU5ka0TOpWdysjGH7d6g@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] tests/i386/test-i386: try and correct constrain 16
 bit call (WIP)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Mar 2021 at 21:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/30/21 12:20 PM, Alex Benn=C3=A9e wrote:
> > Hmm actually the fedora-i386-cross image is:
> >
> >    gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9)
> >
> > with CROSS_CC_GUEST_CFLAGS=3D-m32 so I wonder what the difference is
> > between that and:
> >
> >    i686-linux-gnu-gcc -m32
> >
> > i686-linux-gnu-gcc --version
> > i686-linux-gnu-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
> > Copyright (C) 2019 Free Software Foundation, Inc.
> > This is free software; see the source for copying conditions.  There is=
 NO
> > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.
> >
> > They are both pretty new.
>
> The difference, I'm sure, is a local distro patch enabling -fpie by defau=
lt.
>
> I'm hoping that we can just use
>
> --- a/tests/tcg/i386/Makefile.target
> +++ b/tests/tcg/i386/Makefile.target
> @@ -10,6 +10,9 @@ ALL_X86_TESTS=3D$(I386_SRCS:.c=3D)
>   SKIP_I386_TESTS=3Dtest-i386-ssse3
>   X86_64_TESTS:=3D$(filter test-i386-ssse3, $(ALL_X86_TESTS))
>
> +# test-i386 has non-pic calls into 16-bit mode
> +test-i386: CFLAGS +=3D -fno-pie
> +
>   test-i386-sse-exceptions: CFLAGS +=3D -msse4.1 -mfpmath=3Dsse
>   run-test-i386-sse-exceptions: QEMU_OPTS +=3D -cpu max
>   run-plugin-test-i386-sse-exceptions-%: QEMU_OPTS +=3D -cpu max

configure will set CFLAGS_NOPIE in config-host.mak, but I don't know
if you have access to that here. (It does suggest that there are cases
where -fno-pie isn't available, though I guess they might be non-x86.)

-- PMM

