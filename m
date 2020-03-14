Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BA18560D
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 18:03:09 +0100 (CET)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDABn-0004qI-SV
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 13:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1jDAAx-0004Js-KB
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 13:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1jDAAw-0007kY-Cn
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 13:02:15 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37271)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1jDAAs-0007d4-Qh; Sat, 14 Mar 2020 13:02:10 -0400
Received: by mail-oi1-x244.google.com with SMTP id w13so13085181oih.4;
 Sat, 14 Mar 2020 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6VnsisfekHegeLA+tLDJ+bvDnf0p0x/OlQTwXQ1DCAg=;
 b=HsWWWnPFu6JKj1ktLqlumbeCW1feS9o6CYz1x4khT/psx1qt9sE51AomrYOG9OcIBi
 yyj/2eHH7pBPmG8UVq4wov6QuL/LfKpvNFiQwYHs9oLLyNFieuL71AxOnoFOd9PV7qM7
 XBbtfpjJmBA4oPsfe/M2czAKeaOB7CUPXUsvDu7lNxxa4pG9GTToC1n72YHuhVLJR8a3
 FBLndCBWvi5jcV5UYyiVF+KjPCcGxrS23TP2iQnxRWE7dCNZ/TUILuLvW+hXclJDY30/
 ZtN/DN/Ys2L/zu4UWG1JfcyG9w5ilQjIPOr08mw2vBXI+/FICqaWsaRe5UFSxxGImSKj
 QWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6VnsisfekHegeLA+tLDJ+bvDnf0p0x/OlQTwXQ1DCAg=;
 b=HSDpYhKXaEo7GpCHxjnbM/9Trd6DBS4JHcygxgsMXlEl1Hy058jup6z3NyRXLThtN0
 wl4AUBIrtju4R+fGOPiP4vQlODTThzv6i1Cpoq4RPS0e135BngKO5TYvVcNy4mGYMdEg
 Vp0Xlt2qjJNWHvWs4nj6fZ9VjCFBLQI8a557oqC2ngU0BLkmZHeuM8Wbfk4aRADmedbc
 qj22WF9xhI/2EgOqLk+Kl0NuCPNSSwECoR6QkXFz8uZWRVVVkm5DqBFbBMkxcUVKmLBd
 THVpVFY8mR5RWpfurgKE5vtBWapnQ6q+cU6NtQTVJjsKaY9UIU0NHotsL8Ykmxn7NCDK
 1IYA==
X-Gm-Message-State: ANhLgQ2e/xV+k7PzyqaHcOXMXnCWsO12pZSGnikrcXVM9OIioI2nzRL8
 cr2aB/umfb4V1XfkOQiWEVsQe3jeHXYmMldEZ6A=
X-Google-Smtp-Source: ADFU+vvzyIlt5LUilL+cuL0/0c0qMeaFjVpiomy/KK+5ep5XEc6jk6S6bUGHSDHbKVgN4e81GY1dmuM4TaHHdDMojAE=
X-Received: by 2002:aca:3c45:: with SMTP id j66mr11748643oia.62.1584205329681; 
 Sat, 14 Mar 2020 10:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200313002813.3857-1-yuanzi@google.com>
 <CAL1e-=ghc+6GRMd3NToF6+DeAz1VSR6bxuKd7dBtSJwrj50ovQ@mail.gmail.com>
 <e7ce2848-fb44-3837-65bc-6b449c0e518e@vivier.eu>
In-Reply-To: <e7ce2848-fb44-3837-65bc-6b449c0e518e@vivier.eu>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 14 Mar 2020 18:01:58 +0100
Message-ID: <CAL1e-=hwWP4ztFuLeXsywzz_JvE-j7_1U2CNsU=p7pFS9eva2w@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Update TASK_UNMAPPED_BASE for aarch64
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
 Lirong Yuan <yuanzi@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Josh Kunz <jkz@google.com>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 14, 2020 at 11:45 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 14/03/2020 =C3=A0 04:06, Aleksandar Markovic a =C3=A9crit :
> > On Fri, Mar 13, 2020 at 1:28 AM Lirong Yuan <yuanzi@google.com> wrote:
> >>
> >> This change updates TASK_UNMAPPED_BASE (the base address for guest pro=
grams) for aarch64. It is needed to allow qemu to work with Thread Sanitize=
r (TSan), which has specific boundary definitions for memory mappings on di=
fferent platforms:
> >> https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/=
rtl/tsan_platform.h
> >>
> >> Signed-off-by: Lirong Yuan <yuanzi@google.com>
> >> ---
> >>  linux-user/mmap.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> >> index 8685f02e7e..e378033797 100644
> >> --- a/linux-user/mmap.c
> >> +++ b/linux-user/mmap.c
> >> @@ -184,7 +184,11 @@ static int mmap_frag(abi_ulong real_start,
> >>  }
> >>
> >>  #if HOST_LONG_BITS =3D=3D 64 && TARGET_ABI_BITS =3D=3D 64
> >> +#ifdef TARGET_AARCH64
> >> +# define TASK_UNMAPPED_BASE  0x5500000000
> >
> > Hi, Lirong,
> >
> > Can you point from which line of the file you linked to did you
> > arrive to the value 0x5500000000?
> >
> > Second question: What about other targets?
>
> Personally, I prefer to not change the value for other targets if it is
> not required by someone that had some problems with the current value.
>
> It needs to be changed carefully and to be well tested after change.
>

Sure, but again, from where " 0x5500000000" comes from?

> Thanks,
> Laurent

