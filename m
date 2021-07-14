Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C33C80EB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:03:25 +0200 (CEST)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3and-0000g2-23
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3alp-0007hf-Fg
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:01:33 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3aln-0005BR-Nl
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:01:33 -0400
Received: by mail-ej1-x633.google.com with SMTP id dp20so310561ejc.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dYajh4Q1ICP++tRf3RaIXOKAvpgkEQ7tQX1fI8OL5b4=;
 b=vFMavCPXOTtNqhurgQ5mEkQijz9Bh+4qHPWUVeGUhmp/9YY7n6Sje8smmeywVvfyTM
 bSAruEK9KjizstbgH47+myDqn5aCQpOCUEip6c6Bdk+LcZ6Bu9hCKxUT1OE9h0S7LtJ/
 SFKrXDUecmCcin47gX7RB1kemoAU5118JMyRO5dpfX7FdiYTkP5GlUvP206MUn92N1sn
 72F5H6cPevb2uqbUvuGoRyn025mxx+yL4LWXNKiRSBtpCPZ0iVnJNkaAtQsbIg/s1DFm
 o9BslDKAZe73AlUHcq4uLEdtAz6sdrkmnGPAcOWy8EpGUmxWMDyC41SLQ7C1FYMFX2wp
 sh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dYajh4Q1ICP++tRf3RaIXOKAvpgkEQ7tQX1fI8OL5b4=;
 b=NVT62Ycbh/AaxbdcB8KeLuNg+ZZbvqU8fZZo7r6FvkrKHKIMGNoy1zi6GkmG+rauny
 oj/+EZnUMaIElGDMqPjoQcdRUILWrfyvjiYv4b1KK0wN5pWYR6sxq6ldcA2QkkvNAbZG
 YhCKZ+4pVaKfo5udSfNmFSaCq9KlvvEqHoMBWoeEmApGwTMxiIsFtN2+WVxc1zM8/s4i
 v59jkilUoZ8LtSXbT+UdgMxQx5nlmPZHIsLs42cmmUBJjKbosj7MjFRAIz8A8G7GS3PF
 Rfqlr6gzSFgRpE9Oxm+Zi3L6w03zKFGsR0oaHtXmKwRqgwW9UBlUz9Io69FuUP4MIm21
 PCwg==
X-Gm-Message-State: AOAM533vIhoJZTEfz/71xdb4hcj3VD/izz+pik+GgogD5H7AbAqnOp7w
 HIo5w3ogxtKmCCmQ+ODteMLaKi0FbgXMwfchIBujcA==
X-Google-Smtp-Source: ABdhPJwgPCQVBar1qpTkza7IW2qK1hLsLeQHGgfG4WswvUyOBdRMeAhRQskeBhJYh9TVeIJrWD4wGag9osZuLze4pHc=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr11324460ejb.482.1626253289894; 
 Wed, 14 Jul 2021 02:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
 <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
 <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
 <CAEUhbmW__q9mqDK2_XpTqB2Nmdu0_Mj4UrypOi3TugOuGud11A@mail.gmail.com>
 <62d56b3b-ef11-2384-d3cd-0d34046400ee@redhat.com>
 <CAEUhbmVtydsZBwnt+QVnZp9uwvKNru2CZ_trq07eJ5mT=UcqUA@mail.gmail.com>
In-Reply-To: <CAEUhbmVtydsZBwnt+QVnZp9uwvKNru2CZ_trq07eJ5mT=UcqUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 10:00:50 +0100
Message-ID: <CAFEAcA_5LugG0JbBX=gN=dYE301nVNuDUpe9--_8o3rw9_y4Jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Markus Carlstedt <markus.carlstedt@windriver.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Christina Wang <christina.wang@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 04:42, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=885:11, Bin Meng =E5=86=99=E9=81=93=
:
> > > Can we get some agreement among maintainers?
> >
> >
> > It's not about the agreement but about to have a stable ABI. I don't
> > know the case for sd but e1000 is used in various  and we work hard to
> > unbreak the migration compatibility among downstream versions. Git log
> > on e1000.c will tell you more.
>
> Agreement or stable ABI, whatever we call, but we should be in some consi=
stency.
>
> IMHO maintainers should reach an agreement to some extent on how
> compatibility should be achieved. I just found silly to add a property
> to fix a real bug in the model, and we preserve the bug all over
> releases.
>
> I can find plenty of examples in the current QEMU tree that were
> accepted that changed the bugous register behavior, but it was not
> asked to add new properties to keep the bugos behavior.
>
> e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF logi=
c")

There is basically a judgement call going on here about whether the
device is "significant enough" that it's worth the effort of
preserving back-compatibility of bugs.

There is at least one clear rule: if the device isn't used by any
machine with a versioned machine type, then there is no need to
provide back-compatibility of old buggy behaviour. (There would
be no way for the user to select the old behaviour by choosing a
-4.2 machine type.) This is why the fsl_etsec device doesn't need
to handle that.

For PCI devices it's a bit fuzzier because in theory you can plug
any PCI card into a versioned x86 PC machine.

We don't want to preserve bug-compatibility for absolutely
everything, because the codebase would quickly clog up with weird
behaviour that we never test and which is not of any use to users
either. So you have to look at:
 * how easy is providing the back-compat?
 * how commonly used in production is the device?
 * how likely is it that guests might care?
 * would the behaviour change cause odd behaviour across
   a cross-version migration from the old QEMU?

Migration compat is similar, but not quite the same because the
compatibility handling tends to be less invasive, so we take the
"provide compat" choice more often. For non-versioned machine types,
again, we're OK with breaking back-compat as long as we bump a
migration version number so the user gets an error message rather
than weird behaviour.

thanks
-- PMM

