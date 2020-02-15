Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1CC15FEBA
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Feb 2020 15:03:04 +0100 (CET)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2y2B-0004AZ-AA
	for lists+qemu-devel@lfdr.de; Sat, 15 Feb 2020 09:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34707)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1j2y0o-0003hY-Ah
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 09:01:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1j2y0m-0006SO-Rx
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 09:01:38 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54262
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1j2y0m-0006Lp-NB
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 09:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581775293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdeZj9ZkNBea6Gfisi6CZh2PaHktBxoVFDhZ2o9D7pg=;
 b=E9OtmIGNaiA9nz8/g8npY/MzFW7TzofkW/IquC2TC9rAbH66+JexetRF2wi0fBS5jMQQ+l
 0upQY0LhxntT3JbVkKL4QgzheakCAPBGGHX1jELO7i8NpYSNS+jE2dOR9GaV7uKQYbsPFG
 1h8Unk6Q7C880ywqLsqs2UWt9t6zFG4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-YE3Mfh8EMim7QblmMPBv5g-1; Sat, 15 Feb 2020 09:01:28 -0500
Received: by mail-wr1-f69.google.com with SMTP id r1so5737142wrc.15
 for <qemu-devel@nongnu.org>; Sat, 15 Feb 2020 06:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zdeZj9ZkNBea6Gfisi6CZh2PaHktBxoVFDhZ2o9D7pg=;
 b=c5yvhlTnItb8IEiHdQkoBVtCnOivU4Be5von+7SLutJsJhtKI9UQ7BtWRQpnMoDHho
 jHHK7NeJTKIbRNYxoAGuDYJYJotSQbk5sCKvtUEJuJGKKKGEYsvEedOJGDfKe6Yky8md
 OBiXGldRhCUWCP+r4VXt9QOziGQ/+tIpAA1ojrnt1OUNCkDFC+g9+nmMztPP0je5qxif
 9LW6uiWYcoaNPTHitCFlTj9go9RS9aj98IJBfKCPOx26eN7q4pwlfdqyujD9mi2ygRvs
 +1V+nlNdHnQSuDhzUUMSblmELv4HTXk35Z03sVbJXGi8Z+6aTf3WICUqsAe1I3SOw8pP
 qb5A==
X-Gm-Message-State: APjAAAUbTKVO2axAJpWCZ6H6u8UDdA5HpfzEMMXDD+RIDr/rdkWX9vqQ
 RTzb0Wdqv593jjxPIa/TOS7aC+BSmHM2qA4ASYM2eCBYoyteZnT2h78DkogGCs14Dc7o/zFegBc
 RayDGh47afEJg+xnhKpP9iMtZFgYAbVA=
X-Received: by 2002:a1c:541b:: with SMTP id i27mr11835837wmb.137.1581775286996; 
 Sat, 15 Feb 2020 06:01:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXKfiTZgeQmVIUhuE5E71OTj0M4OddYYdumXfr4a5/m5S0JpJGb7rzYURiiSSnLPXCG2vE2AkRlqFlztpj4as=
X-Received: by 2002:a1c:541b:: with SMTP id i27mr11835821wmb.137.1581775286763; 
 Sat, 15 Feb 2020 06:01:26 -0800 (PST)
MIME-Version: 1.0
References: <0895187b-e50c-28a8-bce3-9f351d29234d@physik.fu-berlin.de>
 <1e7c2c17-1907-cc9d-2bad-071bdd09650e@redhat.com>
In-Reply-To: <1e7c2c17-1907-cc9d-2bad-071bdd09650e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Sat, 15 Feb 2020 15:01:15 +0100
Message-ID: <CAP+75-V0yQz1H5c8YXZ=6WDXEmxYG1JbxZBDNPLPBzkQ1DPZnw@mail.gmail.com>
Subject: Re: Build for qemu-sh4 broken since 2445971604c
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
X-MC-Unique: YE3Mfh8EMim7QblmMPBv5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 15, 2020 at 2:53 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi John,
>
> On 2/15/20 11:53 AM, John Paul Adrian Glaubitz wrote:
> > Hi!
> >
> > Currently trying to build qemu-sh4 in static configuration fails with:
> >
> > make[1]: Entering directory '/root/qemu/slirp'
> > make[1]: Nothing to be done for 'all'.
> > make[1]: Leaving directory '/root/qemu/slirp'
> >    CC      sh4-linux-user/tcg/tcg-op-gvec.o
> > /root/qemu/tcg/tcg-op-gvec.c:298:25: error: unknown type name =E2=80=98=
gen_helper_gvec_5_ptr=E2=80=99; did you mean =E2=80=98gen_helper_gvec_4_ptr=
=E2=80=99?
> >    298 |                         gen_helper_gvec_5_ptr *fn)
> >        |                         ^~~~~~~~~~~~~~~~~~~~~
> >        |                         gen_helper_gvec_4_ptr
> > make[1]: *** [/root/qemu/rules.mak:69: tcg/tcg-op-gvec.o] Error 1
> > make: *** [Makefile:497: sh4-linux-user/all] Error 2
>
> I believe your build directory is out of date and might have dangling
> old files.

FYI the CI job succeeds:
https://travis-ci.org/qemu/qemu/jobs/650567444#L3193

> > This seems to have been introduced with:
> >
> > commit 2445971604c1cfd3ec484457159f4ac300fb04d2
> > Author: Richard Henderson <richard.henderson@linaro.org>
> > Date:   Tue Feb 11 16:31:38 2020 -0800
> >
> >      tcg: Add tcg_gen_gvec_5_ptr
> >
> >      Extend the vector generator infrastructure to handle
> >      5 vector arguments.
> >
> >      Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >      Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >      Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> >      Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> If you look the content of this commit, the new type is properly declared=
:
>
> --- a/include/tcg/tcg-op-gvec.h
> +++ b/include/tcg/tcg-op-gvec.h
> @@ -83,6 +83,13 @@ void tcg_gen_gvec_4_ptr(uint32_t dofs, uint32_t aofs,
> uint32_t bofs,
>                           uint32_t maxsz, int32_t data,
>                           gen_helper_gvec_4_ptr *fn);
>
>                           uint32_t maxsz, int32_t data,
>                           gen_helper_gvec_4_ptr *fn);
>
> +typedef void gen_helper_gvec_5_ptr(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_pt=
r,
> +                                   TCGv_ptr, TCGv_ptr, TCGv_i32);
> +void tcg_gen_gvec_5_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
> +                        uint32_t cofs, uint32_t eofs, TCGv_ptr ptr,
> +                        uint32_t oprsz, uint32_t maxsz, int32_t data,
> +                        gen_helper_gvec_5_ptr *fn);
> +
>
> BTW what capstone configuration are you using?
> Is that --disable-capstone or another?

OK I understood, Debian provide capstone.a:
https://packages.debian.org/sid/sh4/libcapstone-dev/filelist

and our CI job on Travis is based on Ubuntu, so using --static works:
https://travis-ci.org/qemu/qemu/jobs/650567444

Fedora capstone-devel package only provide a shared library.


