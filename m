Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61A832AA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 15:26:18 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huzTl-00066y-Os
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 09:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56170)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1huzTA-0005h2-Lg
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1huzT9-0004AQ-Jj
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:25:40 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1huzT9-0004A8-Ar
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:25:39 -0400
Received: by mail-ot1-x343.google.com with SMTP id n5so92475511otk.1
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZVGdpr1VRHGVMG/yt+pZqhleYek91NY5RTK1O4r7rSE=;
 b=gd2X1Im48SWlE2ncLNHO4iyRAdGBJf4+m4MZV5t203g/0DGoC5hMNU58P0hfwCM/56
 MdskH+hn0ACAVhTCd+mVWAjDH3rB5sHl9goFpfZTIMEvDFpodFVZEJL/qhSkGnLHAC6l
 Qn63zF5z5Lus/FNNFM95JmEUHUkbEca20f5v20iZUGdojEBrQ4P6ZP76AjbAEAEXsiow
 9n4+NYjfL92MFYAPg+zBygq2+YVVhvLqK1VS3GQdyaXvASIcpvEMS0cg26C+73RgU+FD
 Qdj6ioVqWR/SrxsrQdv/4QALyjtqouIBLqA+aZSN8T4SIBWtM+D6ow3Tn9bM0/kn8Xo2
 BDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZVGdpr1VRHGVMG/yt+pZqhleYek91NY5RTK1O4r7rSE=;
 b=RmDCivLAmpCqoFgkyz6xC3riJJRzWpD3NeYsd2YapvC2DwqK7c1ExXjedR0akr9fEa
 p/y7OG95XM2gm7IUR2dISVDQn8UnVE35+TiYgTwzvEtE8z+QHm9zUV3wsaJWvvadGRvf
 jqFzatoeJSXHaXJftvhIbEVXWO++NJb5tJvqfjrWUVDnsDVautX4LLotAq0O0YYMvikq
 KvT9GgW5HeMs9T5AYCiT47lsxrxYDjvXUSOUZeD71LtrPOVkfEhZ99lRjTAmi21ggTSm
 jmoShNMsJCPK+lzOJEbHcVIGWUMTtIBqIWa7l2xBBqbpqiA5PqQmUBJDCRfWtkGJJML2
 ippQ==
X-Gm-Message-State: APjAAAWNKixr2J/ocvx70lrYMmoz0cLShXWrQVdjr3dITIyeOYRkwisB
 ChLgu1XojefijNc4+sVXVyH8H7e1E5EZazKcJQV83g==
X-Google-Smtp-Source: APXvYqxmt5i/rOeKE+vKvWlt8+5bEvIPkQzlnePfgaFOc9JQDEuF+t80XyVIA9aYJNhoMJ5MWM1SPLxaGlDd0fa0vrw=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr2838767otk.221.1565097938344; 
 Tue, 06 Aug 2019 06:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190713165856.29883-1-philmd@redhat.com>
 <20190806124408.GE14887@redhat.com>
In-Reply-To: <20190806124408.GE14887@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 14:25:27 +0100
Message-ID: <CAFEAcA8=+n_+dF2o4bDtY4T5G=_rYySTEHmf1KSb0qWQJN0BfQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [RFC PATCH-for-4.1] Makefile: Fix the NSIS Windows
 builds
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
Cc: Fam Zheng <fam@euphon.net>, Adam Baxter <voltagex@voltagex.org>,
 Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Aug 2019 at 13:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Sat, Jul 13, 2019 at 06:58:56PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > The qemu-nsis.bmp file was not listed with the other blobs, thus
> > not installed in the ${BINDIR} location.
> >
> > This fixes:
> >
> >   $ make installer
> >   [...]
> >   (cd /tmp/qemu-nsis; \
> >            for i in qemu-system-*.exe; do \
> >              arch=3D${i%.exe}; \
> >              arch=3D${arch#qemu-system-}; \
> >              echo Section \"$arch\" Section_$arch; \
> >              echo SetOutPath \"\$INSTDIR\"; \
> >              echo File \"\${BINDIR}\\$i\"; \
> >              echo SectionEnd; \
> >            done \
> >           ) >/tmp/qemu-nsis/system-emulations.nsh
> >   makensis -V2 -NOCD \
> >                   -DCONFIG_DOCUMENTATION=3D"y" \
> >                    \
> >                   -DBINDIR=3D"/tmp/qemu-nsis" \
> >                    \
> >                   -DSRCDIR=3D"/home/phil/source/qemu" \
> >                   -DOUTFILE=3D"qemu-setup-4.0.90.exe" \
> >                   -DDISPLAYVERSION=3D"4.0.90" \
> >                   /home/phil/source/qemu/qemu.nsi
> >   File: "/tmp/qemu-nsis\*.bmp" -> no files found.
> >   Usage: File [/nonfatal] [/a] ([/r] [/x filespec [...]] filespec [...]=
 |
> >      /oname=3Doutfile one_file_only)
> >   Error in script "/home/phil/source/qemu/qemu.nsi" on line 122 -- abor=
ting creation process
> >   Makefile:1077: recipe for target 'qemu-setup-4.0.90.exe' failed
> >   make: *** [qemu-setup-4.0.90.exe] Error 1
> >
> > Fixes: https://bugs.launchpad.net/bugs/1836453
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > Based-on: 20190713163558.13204-1-philmd@redhat.com
> > https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03204.html
> >
> > $ file qemu-setup-4.0.90.exe
> > qemu-setup-4.0.90.exe: PE32 executable (GUI) Intel 80386 (stripped to e=
xternal PDB), for MS Windows, Nullsoft Installer self-extracting archive
> > ---
> >  Makefile | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

I thought for a moment that this was another patch we'd missed putting
in 4.1, but it went in as commit b3ce38dcf93a12038ce on July 15th, so
we're OK.

thanks
-- PMM

