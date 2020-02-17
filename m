Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873616078D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 01:45:59 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3UXt-00006c-TP
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 19:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3UWm-0007tk-Hx
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 19:44:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3UWl-0003Af-CP
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 19:44:48 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:41777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3UWl-0003AA-8m
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 19:44:47 -0500
Received: by mail-yw1-f68.google.com with SMTP id l22so7145066ywc.8
 for <qemu-devel@nongnu.org>; Sun, 16 Feb 2020 16:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nf6ZiGOA/CQMTsJ9yRTr6q2+O8kWcPDQrUophby4Wks=;
 b=Jd8K7Ozxu7V60NHmfSnXkag/FPbddWhjhmdNYV36DftgV9aXtsqCbKRY7Q7X3ME3rS
 V6i0M9rif/vRI+cuNPSUElnvpX9heAvfe02SCVmx4pmp/uqF5UADzGS111zQuRQR06XF
 cdK6TgG9ms+EKPhZnmAudwLMnHm6gU/RVqgGBNGJ+1MaRATgkC6AlYxuY0ydF6Zhvfeb
 TRt+/+IsvJNPC0cdRk3Va+Vdi1MBITptuLhjnA4RZVBOHnTIwFdodHdn+6ZdQ5pXz8nA
 uP0O/eth2M9wuYm3ymgLs5720/N4FGiNB2iyEIUkGzZMbitRo8jzs3Nw2TvAvLQip/yE
 rXHw==
X-Gm-Message-State: APjAAAVBYfInrZD9yQjniWM4o1tti1hMQW0p9TPnZOE8CYPeAKBKo12Z
 xLWYEkwrh3NzYEblMf4Hri9moee30pELK0Keowo=
X-Google-Smtp-Source: APXvYqz3VwyfR+9D99z8hjkUGbennj6QfCtaHpFJy98phOtyS7DI7In6hXEKKInptADXXDpkPoV7UreYJ/flVoRNIKI=
X-Received: by 2002:a81:8443:: with SMTP id u64mr10797753ywf.443.1581900286598; 
 Sun, 16 Feb 2020 16:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20200213175647.17628-1-peter.maydell@linaro.org>
 <20200213175647.17628-8-peter.maydell@linaro.org>
 <CAL1e-=iWXDGat9dVwNEKU1JUYTz1vc-wr2f1pTNiHP-e6zpPbA@mail.gmail.com>
 <CAAdtpL6JHhgPJOdwrMxs83qc8=9Q-1t6mrA0yJiyPjMkHSw3Lg@mail.gmail.com>
 <CAL1e-=hgrANvvPd2oaOUTf+3EuudcsZeBtj1yOCK4Pn37nxOJg@mail.gmail.com>
In-Reply-To: <CAL1e-=hgrANvvPd2oaOUTf+3EuudcsZeBtj1yOCK4Pn37nxOJg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 17 Feb 2020 01:44:35 +0100
Message-ID: <CAAdtpL6HmgdmV3f9g_K4ap48-DMe18_y88iVajMjctQdm+9URA@mail.gmail.com>
Subject: Re: [PATCH v2 07/30] qapi/block-core.json: Use literal block for
 ascii art
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.68
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 15, 2020 at 10:01 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> 9:56 PM Sub, 15.02.2020. Philippe Mathieu-Daud=C3=A9 <philippe@mathieu-da=
ude.net> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=
=B0:
> > On Fri, Feb 14, 2020 at 12:04 AM Aleksandar Markovic
> > <aleksandar.m.mail@gmail.com> wrote:
> > >
> > > 6:59 PM =C4=8Cet, 13.02.2020. Peter Maydell <peter.maydell@linaro.org=
> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> > > >
> > > > The ascii-art graph
> > >
> > > Just out of couriousity, are unicode characters allowed in rst files?
> >
> > I remember 2 years ago a blind developer thanked the QEMU community to
> > still restrict commits to 80 characters, because while 4K display are
> > available, he and other visually impaired developers cloud still
> > browse the QEMU codebase with their refreshable Braille display (which
> > was 80 cels). I don't know how many visually impaired developers are
> > following this project. A quick google returns " There is no concept
> > of Unicode in Braille. In that sense Braille is similar to old 8-bit
> > code pages which represented different symbols in different languages
> > for the same symbol code."
> > (https://superuser.com/questions/629443/represent-unicode-characters-in=
-braille).
> >
> > (I'm Cc'ing Samuel who cares about Braille displays.)
> >
>
> Got it.

AFAIK there are no particular care in the project regarding visually
impaired developers, maybe we are already using things that exclude
them.
IOW without a project policy to include visually impaired developers,
my comment is irrelevant and it shouldn't restrict the use of unicode
to improve documentation.
Personally I'd rather we keep the project open to all possible contributors=
.

> > >
> > > The boxes could've been rendered in a much more beautifull way using =
"lines and corners" group of unicode characters.
> > >
> > > Aleksandar

