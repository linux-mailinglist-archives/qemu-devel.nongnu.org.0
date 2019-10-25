Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7EAE508B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 17:54:21 +0200 (CEST)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO1uu-0004mD-Ip
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 11:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iO10n-00036Z-Nr
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iO10m-0001Lw-IM
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:56:21 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iO10m-0001LX-CM
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:56:20 -0400
Received: by mail-oi1-x242.google.com with SMTP id b25so1802817oib.7
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OJl6vLLFY5BlX1urs2xZCKUVxnbmTzfPVAU83uOxRdM=;
 b=B3WgXWSilvZ03j6JeHT9aOdQzUMYJseO5IQBY7Vi1WXbqYA4s8HXXfN3hSBBpyBZ0d
 G4X7Lu4CYI6Gc8Qhm2JdeQ9gsv/UL1pQ2FvSa4uH22xjTUzRt54FvFWiX/mqyMCgr7Db
 nVpXeMfxP8BnJnoGKzSEHNx5hmRh+RvTaradwKhA5rpBLCEB+DizaETCJ+RN/yhkeSLH
 fACIX7ROaEv3EelaswqvYui9XN8sjbSy8nEBNbluVmdfYu2TCcIuRFwTl5DfVOLADGFV
 t3mayPmuH1KuHXJ0kyoKJeRPKTmuuj0IEVA53HSJBTuF6QBLsUf5Jb5wBQ5OEpi5Cpfz
 r+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OJl6vLLFY5BlX1urs2xZCKUVxnbmTzfPVAU83uOxRdM=;
 b=e5p9iQJ3wJDQiL0kI52pDeGXnyEII8qEPsNkBsXUV7WEDGk4uDfiY3VOidQmi4mZ2F
 do5zJyZYauCju0qh59cBVHcpJtPTF1O8bPiZDwrSlA+c4cPsxloowYpf+HAu9wwyNLyk
 VafJ/tbC40PrZH1OZ3uEuMN7yESXlaFOL/X5seqX61Z2WDNWd1YnCyT/S2AA+jeI5Ml7
 ZohZtg+oh9Bz/wgt/vhJEs63Mjjh/dhrIAHebA5U8INg6MSIKpF/GzRfMbg8ccMRIQ84
 s5cc5GABe8hasMTuFpDaAbi0OCQgg4aUnZ14krrvzvz8HvuJ/v8rgurWZzHI8JR0WyTf
 fdhQ==
X-Gm-Message-State: APjAAAV4xYq3gx5dMnoxChrOZhaPfQEc8pu2k5udEW7DuWYeZLz2XxvQ
 m5HCURYRImggkYfNsC8BsO5Q8YhiOieEOjwnPD8TGA==
X-Google-Smtp-Source: APXvYqw/FPf5X20+hwW9g0vgZZV33imuf+44LxF0j3jWzZFreBxYi+6gjiHgQ3FPm0P04Clpz2HLPRliCO/7oPIz/X0=
X-Received: by 2002:a05:6808:608:: with SMTP id
 y8mr3307708oih.146.1572015379366; 
 Fri, 25 Oct 2019 07:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191025095849.25283-1-mreitz@redhat.com>
 <CAFEAcA8Y8fGKC3DkdM+wkU5Oe6ACZMtvWjpry9qFgPJc5KYjdA@mail.gmail.com>
 <19d50c64-c07a-3122-dea3-a5d97a2d35da@redhat.com>
 <CAFEAcA-3nt69+fUCf4YysVqsWd3z8r1iuURPYAPWUdHcd41p_Q@mail.gmail.com>
 <e77cacde-05ab-64c6-8f60-0222f096daf2@redhat.com>
In-Reply-To: <e77cacde-05ab-64c6-8f60-0222f096daf2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 15:56:07 +0100
Message-ID: <CAFEAcA_O35Yc=TJ1K4uk_n+hBzUondY1ttqv6xCNB6+yzwiv0g@mail.gmail.com>
Subject: Re: [RFC 0/3] block/file-posix: Work around XFS bug
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Oct 2019 at 15:21, Max Reitz <mreitz@redhat.com> wrote:
>
> On 25.10.19 16:17, Peter Maydell wrote:
> > On Fri, 25 Oct 2019 at 15:16, Max Reitz <mreitz@redhat.com> wrote:
> >> I=E2=80=99ve created an RH BZ here:
> >>
> >> https://bugzilla.redhat.com/show_bug.cgi?id=3D1765547
> >
> > Currently "You are not authorized to access bug #1765547." for
> > anonymous browsers, just fyi.
>
> Err.  Oops.  That wasn=E2=80=99t my intention.  I hate that misfeature.
>
> Thanks for telling me, I fixed it. :-)

Yeah, that's a really well written bug report, you definitely
don't want to hide it away :-) Thanks for making it public.

-- PMM

