Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B68A151A27
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 12:58:09 +0100 (CET)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iywqG-0000Wg-MK
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 06:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41161)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iywpN-000879-6V
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iywpK-0004aU-LC
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:57:13 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34931)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iywpK-0004Vc-Ga
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:57:10 -0500
Received: by mail-oi1-x244.google.com with SMTP id b18so18178706oie.2
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 03:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Y7ZSwoSok8OXqF+QI4LjdGdBmJ9hVGeWUMnqhvKP90=;
 b=iNnt2y3nmnlkUajJDxpJmYA8YC2hFPpE5NS54tV7kiUSAOk/pK8guQKV5VdaUftVQz
 JtoePXuJ4AtYrNqyncet4uOIl0190jjzVrXNwtMn7npZDzhjoFnHcH8h7EQeMDE3OXvE
 1yfyC04x+3BEGu+077Qmizhtw41q7GkvMOYmao3l40CFaFkj6IeS46DDiT3Mc0WlMktn
 PRpX9qCtLbAIA+GY8pwKHsBMETOoWsFy7HIIZnpxwL3bwMD8pA719mbA1RzYBm0GFsi7
 KkBLq3Ry3LgdNJ9VQLzIYFGrVPTjhprv9EkNpZ2dt7wyO0zEn21q00J06wC5s6JrLiDV
 qyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Y7ZSwoSok8OXqF+QI4LjdGdBmJ9hVGeWUMnqhvKP90=;
 b=lG2u0ICZSnmzjXRZYiOq0yuQZpuK26xJcm6PAmBEd4viDW7GUewVKZupIq7BlZQftf
 9iSgdRuyz6C5cjFvuo79OXNrsYdfZpRF0qlFf6Ab1gQOz24G7yYDMoeRprJJSmmuBmTk
 /VpgzSj5qWDIuo3JdeceW3K21pIv7CpNiNdR5rcW4sp3y2vBISMGOXsAnHnYE4X/QpOw
 8E7PaF+zPjZko7GHAIelf5lXgTrx7bHSYNbfrY9/k/aNr+C8XTndEGwRmUIYUJ7pjipv
 Rdmw7E9XOcZJ+Al81tGAksriLaus1WPZOZeRJFWw0+cdbU8h+/dmCF9+0UValLmKk53C
 BZJQ==
X-Gm-Message-State: APjAAAWCsFK8eMeuTxXMpnX0yc2CZD8j+L2EjFeCVlH3EJOP9JQMpbWH
 zwT5AWjQdH5GMFMv7CDwwyAg6P6KQzjXs7ANgos=
X-Google-Smtp-Source: APXvYqzeY9HgozgTcIZ70rDRSUJo4Z7wOty9ZxnnGbhfWNSe2r3V9B4siw5EpOvh7mlQxDizN0NdgVvfow7nXyF0wZk=
X-Received: by 2002:aca:5844:: with SMTP id m65mr3203068oib.136.1580817429525; 
 Tue, 04 Feb 2020 03:57:09 -0800 (PST)
MIME-Version: 1.0
References: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1578947683-21011-6-git-send-email-aleksandar.markovic@rt-rk.com>
 <93e1c210-2f0d-2ab1-d933-2889939396db@vivier.eu>
In-Reply-To: <93e1c210-2f0d-2ab1-d933-2889939396db@vivier.eu>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 4 Feb 2020 12:56:58 +0100
Message-ID: <CAL1e-=hMS0-E7c_gW-m9Mk6ZeCSzdDwmhmYnNUGhor2o_KEhBQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/20] linux-user: mips: Update syscall numbers to
 kernel 5.5 rc3 level
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 14, 2020 at 5:40 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 13/01/2020 =C3=A0 21:34, Aleksandar Markovic a =C3=A9crit :
> > From: Aleksandar Markovic <amarkovic@wavecomp.com>
> >
> > Update mips syscall numbers based on Linux kernel tag v5.5-rc3
> > (commit 46cf053e).
> >
> > Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> > ---
> >  linux-user/mips/cpu_loop.c     | 78 ++++++++++++++++++++++++++++++++++=
+++++++-
> >  linux-user/mips/syscall_nr.h   | 45 ++++++++++++++++++++++++
> >  linux-user/mips64/syscall_nr.h | 13 +++++++
> >  3 files changed, 135 insertions(+), 1 deletion(-)
> >
> > diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> > index 39915b3..b81479b 100644
> > --- a/linux-user/mips/cpu_loop.c
> > +++ b/linux-user/mips/cpu_loop.c
> > @@ -25,8 +25,9 @@
> >  #include "internal.h"
> >
> >  # ifdef TARGET_ABI_MIPSO32
> > +#  define MIPS_SYSCALL_NUMBER_UNUSED -1
>
> I'm not sure you need to introduce this change.
>
> The case already exists (stat, fstat, old_select, lstat, ...) and the
> entry that was used is:
>
>            MIPS_SYS(sys_ni_syscall , 0)
>
> perhaps you can do the same ?
>

I like better the new way of dealing with this (like in this patch), since =
it is
more explicit. For now, I won't change this patch, if you agree, and later =
on
I will synchronize all such cases to be the same (but this is not critical =
for
the time being).

Yours,
Aleksandar

> I think the do_syscall() will return -ENOSYS as the TARGET_NR_XXX is not
> defined for o32 in linux-user/mips/syscall_nr.h.
>
> Thanks,
> Laurent
>

