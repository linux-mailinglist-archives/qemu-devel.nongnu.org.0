Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B551319A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 17:58:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMaZs-0006z9-LY
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 11:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hMaYk-0006bY-CJ
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:57:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hMaYj-0000Bw-0d
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:57:14 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1hMaYf-00007x-SN; Fri, 03 May 2019 11:57:10 -0400
Received: by mail-wr1-x444.google.com with SMTP id c5so8469221wrs.11;
	Fri, 03 May 2019 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UflN6O/cC2oAHvB7oVstYZTEynT12/71bOY2BTbtmTc=;
	b=KIqV4vqMqRfwL2WVXdvocBRmA86tIwefo5Jbsu/d+st77CwTOXC2xtYFjmHd1NVGl+
	3vZ9WpYh7hvf76WPYnkval1tRdIidfkv+OSyb8qVmYBo6R9V7FK+S0olf2ptTIF/ZW3V
	8T3C9TDM6E0zUGnyWJWRhNsrsRO4dyWsUDTtiXncm/d2FWcIXipTsv/Xiq8KHZaJ7Llt
	yqCcCBO3LjNInHPO8sZeBCMczZtmc27fE4Qyu3KF9Tg11XfspAax0fkSAM005l5atsgP
	qWHfL/t4/73iKL94hurwrZXrtahqoca+JSVR8lWwkz3PVzmIJj5ldFsr2RQ8ExtKyQLm
	yVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UflN6O/cC2oAHvB7oVstYZTEynT12/71bOY2BTbtmTc=;
	b=lzP1N9fwMVOcNHdhmup/aTCrJvx4qQssknz/MyyvYpjNfVuNgizvQFnFtB6OcCbEO1
	SKbfOPo/MLuH4bz3mcINlrX/SZpVMVbTDy6wSNgd7gR4u4dKUNDkFcsH/JHI2bZyI2Lf
	iwpCdIWIucMN21+X0huf7LcbjHLL6nVbon9P1s6z7mZBlxpctIck5KOOvXfS/moGvFeL
	Kei6MTLc9uqLRvOwdAFDjQ3fmZOATx1J+OPIw/hwFSItpK/eSTxEYS4coWiUJpr6O0FA
	JdXM6sIeoslQI8jijgwZ66CgQG8Q1cXKFlswC72xH9c6sW04l6K/jhqZRaA4rkUa2Tm/
	wDjQ==
X-Gm-Message-State: APjAAAWUhz4WzOUaN56LHvQupcCIjwgHQ0F0p6STx8smLukX4VkMvdgt
	TR/cjfVK8hHcQnq+oBIa+P4QtJGYefWhd1/6pHc=
X-Google-Smtp-Source: APXvYqwaYQ0DRJMGMlkKGP6YFUcp4DlWhsKQTYgYhSG0nWPNqHbNbLmnmuQocvWs/c+OQGR1NIOdshT/YW9BsEQPYBE=
X-Received: by 2002:adf:b641:: with SMTP id i1mr7517545wre.288.1556899028217; 
	Fri, 03 May 2019 08:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190503002206.9751-1-driver1998@foxmail.com>
	<20190503003618.10089-1-driver1998@foxmail.com>
	<aa0dce0b-1be0-7247-8f81-c4f265ba0009@redhat.com>
	<CAFEAcA9a8oQHe+cbSotO+BR2-iqgKOBV5Pg4n1aOBY7_tnvqFg@mail.gmail.com>
In-Reply-To: <CAFEAcA9a8oQHe+cbSotO+BR2-iqgKOBV5Pg4n1aOBY7_tnvqFg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 3 May 2019 17:56:56 +0200
Message-ID: <CAJ+F1CL+2YGHMZteU74y9a61rW6fXLDxcb4KGzPBEAL6878Ujg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v3 1/4] QEMU_PACKED: Remove gcc_struct
 attribute in Windows non x86 targets
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, qemu trival <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Cao Jiaxi <driver1998@foxmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

Le ven. 3 mai 2019 =C3=A0 17:23, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> On Fri, 3 May 2019 at 06:07, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 03/05/2019 02.36, Cao Jiaxi wrote:
> > > gcc_struct is for x86 only, and it generates an warning on ARM64
> Clang/MinGW targets.
> > >
> > > Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
> > > ---
> > >  contrib/libvhost-user/libvhost-user.h | 2 +-
> > >  include/qemu/compiler.h               | 2 +-
> > >  scripts/cocci-macro-file.h            | 7 ++++++-
> > >  slirp/src/util.h                      | 2 +-
> > >  4 files changed, 9 insertions(+), 4 deletions(-)
>
> > > diff --git a/slirp/src/util.h b/slirp/src/util.h
> > > index 01f1e0e068..278828fe3f 100644
> > > --- a/slirp/src/util.h
> > > +++ b/slirp/src/util.h
> > > @@ -43,7 +43,7 @@
> > >  #include <netinet/in.h>
> > >  #endif
> > >
> > > -#if defined(_WIN32)
> > > +#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
> > >  # define SLIRP_PACKED __attribute__((gcc_struct, packed))
> > >  #else
> > >  # define SLIRP_PACKED __attribute__((packed))
> > >
> >
> > The slirp code is currently on its way into a separate module, so you
> > might need to provide that hunk to the libslirp folks again... I'm
> > putting the slirp maintainers on CC:, maybe they can pick it up from
> here.
>
> Yes, the slirp module has now landed in master, so this patch
> definitely needs to be split into two. I've kept in my
> target-arm.next tree the parts which are applicable to
> the QEMU repo itself (ie everything except the slirp/ change),
> so we just need a new patch for the slirp submodule part.
>
> Marc-Andr=C3=A9, Samuel -- what's the process for submitting and
> getting reviewed changes to the slirp submodule now it's a
> separate project ?
>

It's hosted on gitlab.freedesktop.org, with some CI. It's fine to send
patches on qemu devel, as long as Samuel or I are in CC. But in the long
term, I think gitlab MR will be favoured (after a while using it, I think
gitlab is better than ML for patches & bug tracking tbh)

>
