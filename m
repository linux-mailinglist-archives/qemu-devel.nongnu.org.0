Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A761BFD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 10:55:35 +0200 (CEST)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkPQr-0007w7-Nu
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 04:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38077)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hkPNb-00075L-P1
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 04:52:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hkPNa-0007sG-EW
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 04:52:11 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hkPNa-0007pL-7u
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 04:52:10 -0400
Received: by mail-oi1-x242.google.com with SMTP id w196so11978464oie.7
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iUdf517MWdBwlxi0FoaYCJGa4nrX7/86UoauhXyfiSM=;
 b=OlRoo8OBH9PuUUBviIr6FgaaQQVm3RktmdZmv5jADXQQiuFTvq85quX6WK/bfoyssf
 e7WO0GS8rtCJstbdF3xurKj0XjvyR2QQgvqbeDurxX6GAzJ5maxjxarNH0EryTczTOTd
 lso+KIL4xV4+qB1XsvAxkIaEGJZoODcPDsOi3Kzkw+huNg2QAw1ZybEHehZUX5Rpj7x4
 M9QNj/8xbZyCRDwMtvlL/2+3Dc55TDkiLINSdaw/SvTDxUqZpajSjOXBB89m5HUs4Pmp
 G7p/psqoEmMhuBTVlUBtIwLUi+RLRZlbr1TUNBq7DYNmvTLynC0ljwJCdXwBQV+CJG9/
 ZCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iUdf517MWdBwlxi0FoaYCJGa4nrX7/86UoauhXyfiSM=;
 b=jmmb7m3zpGLmOZqhZbI0pGNI4C5FMuwM/JHIo7+Xq7W1kIVuHmcDuFLeHJiaDNB9/t
 i7OvyKC5yN6ni8AjYRg9NzpG6rFA/MS4bnWK7+Kk5DrjXD01YNOD/ulU0tJxdWEf0mIT
 mtfo8sluSi55s31Oqa5eibYGY9x8tZXXKb2B5GKO+qLy7PyKC3ys634eeOlfjGCSefCH
 mNYOmR1fOv2PaYpfgfy7gQuXVZdUvrxqJ0QHqkvpmr3PjsZdPY51J6FULY+fm6LA2otD
 ANg5ZstxY8U66JFy5hgHbyVbKprqxufFBaO6kMZOXbZofDL4de3qMmme8dxbKe2hqCtA
 7A3Q==
X-Gm-Message-State: APjAAAWdkKlQ6SFiRDkSVX3s7q7NBWlgSSXZ7aznn+z7ktRFy6KLD3S7
 HmkVirhLWfn0zArJlTHDa0ckOPwUcB4WdUrDsF6vyrikwU0=
X-Google-Smtp-Source: APXvYqxl0BL7lqJIUdNiO9qQfgieVa6mvnO9t/kBNy0qMFUArS3q59wjVb7dI9BS1rddusddnWDX2Ym+K1pPGR210Aw=
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr8609311oij.98.1562575576736; 
 Mon, 08 Jul 2019 01:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <156217961567.21218.1941224583128986225@c4a48874b076>
 <0a0abd7a-ce36-6faa-cba8-b6a40e7b503e@vivier.eu>
 <CAFEAcA96z+9kMG1iDmBLa-MXuRez7XNyN7TigdaiNCBiy=2UuA@mail.gmail.com>
In-Reply-To: <CAFEAcA96z+9kMG1iDmBLa-MXuRez7XNyN7TigdaiNCBiy=2UuA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jul 2019 09:46:05 +0100
Message-ID: <CAFEAcA8xFy+dC-WzurjieTaj5wK5H_eRx3R6LScck=08u5pmkw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PULL v2 0/2] Trivial branch patches
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
Cc: no-reply@patchew.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Amit Shah <amit@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Jul 2019 at 16:16, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Fri, 5 Jul 2019 at 16:10, Laurent Vivier <laurent@vivier.eu> wrote:
> >
> > Le 03/07/2019 =C3=A0 20:46, no-reply@patchew.org a =C3=A9crit :
> > > Patchew URL: https://patchew.org/QEMU/20190703152513.29166-1-laurent@=
vivier.eu/
> > >
> > ...
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D12708=3D=3DERROR: LeakSanitizer: detected memory leaks
> > >
> > > Direct leak of 32 byte(s) in 1 object(s) allocated from:
> > >     #0 0x56164f580b6e in calloc (/tmp/qemu-test/build/x86_64-softmmu/=
qemu-system-x86_64+0x19f9b6e)
> > > ---
> >
> > It seems not related. Does it prevent the series to be merged?
>
> Yeah, it's unrelated (an issue in master which is now fixed), but I
> had missed your v2 pullreq amongst all the noise. Thanks for the ping --
> I'm running it through the test process now.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

