Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4896104556
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 21:45:16 +0100 (CET)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXWqh-0003UR-Os
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 15:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iXWpk-00034R-N1
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iXWpj-0004cd-K1
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:44:16 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iXWpj-0004bG-As
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:44:15 -0500
Received: by mail-oi1-x243.google.com with SMTP id 14so1021710oir.12
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 12:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IrGzEhAVokXnY9mIl3c/73d3PZaToiauaqRJgmslU10=;
 b=JYafPBclM/iF+0ngyf4kctWg+n4qXMDU57nG+BLhUC42ap5eCznM3B8cX7SxVsOgj3
 Df7gaaciXQOwEnqOePx0Ls90gQUH0EamCZkAYR6jULqBGbivOXvXeL/s3KPkZ1cDiYVK
 Ppyi/ru7Tkq1EYRrS9zKruSaqOTzBMbHqnPpg4hQqOiTVTwuCXH741GXuNUjapgJ+Kd2
 QeT93Xj2N40QFVCGkTz0Vkf6OgYdQ5a/br/3+Ikt+Rct2gEBZRKWuHJGnthhojqV6mQn
 UGe6BWKgdFaI1QUYpj6jw9n4eTO1tokGHuwTZ0YfperJD3KmsTuMh1T4T8pSGfxgjMf5
 A0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IrGzEhAVokXnY9mIl3c/73d3PZaToiauaqRJgmslU10=;
 b=cvkLDGc/++yP1BbF9o2FZKjklH/r396arJk+bjUq3Ul6nSc+NiGYSy0vnsJdKARPUk
 PJDd+vb4OHaGZNKsAk4EQkDY+YZ/yJZ0SiS2VDxATbaT4WSswtm8ji85xfbdUqNxErPH
 yHNJwmraFvjX3iu8MHXKYRPV5qQLeBYzrlFbuogwDDbSBeF3RosVTKfPnMLeYUbEpjK9
 WKfhzAo21owiF8MJgc/m0r5jQ4YwaF4u/NSJo1KgGEG4LNvdvVCLpPJaKLynGf5gzGFj
 WqVhhlQjAyjhbMaqn7NeooM5sb0R01d0P3/3hqThnbIUBNQFBQsvJG2UuDjl+9lOGAvL
 gTXw==
X-Gm-Message-State: APjAAAU0n1BZ3ENVL+LDRp6JiftIgWdNIrRI7qWn44QM/gRPhjBV1qCn
 J9qCK5E/0Ab4w2BsWbseRYuY/W3nLus/RPf1h6o=
X-Google-Smtp-Source: APXvYqxbL4TLuBpjJUT8hN7z3BpYAxbsTucD81xtsOSEvHx13VdMt4BVmH/buiGR4hbjduBNJC+l/yGGQuZwJ657ZXI=
X-Received: by 2002:aca:670b:: with SMTP id z11mr4303911oix.79.1574282654378; 
 Wed, 20 Nov 2019 12:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20191119190405.GA23854@ls3530.fritz.box>
In-Reply-To: <20191119190405.GA23854@ls3530.fritz.box>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 20 Nov 2019 21:44:03 +0100
Message-ID: <CAL1e-=i79EfRrvB+z9LQBXZUKak3Y5akEpWqgu2o_Vk6Js6zTQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user/strace: Improve output of various syscalls
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> @@ -26,7 +26,7 @@
>  { TARGET_NR_afs_syscall, "afs_syscall" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_alarm
> -{ TARGET_NR_alarm, "alarm" , NULL, NULL, NULL },
> +{ TARGET_NR_alarm, "alarm" , "%s(%d)", NULL, NULL },
>  #endif

Man page says:

unsigned int alarm(unsigned int seconds)

The sole argument is unsigned int - therefore "%d" should be "%u",
shouldn't it?

--------------------------------------------------

This is not a part of your changes, but appeared in your patch diff:

>  #ifdef TARGET_NR_epoll_create
>  { TARGET_NR_epoll_create, "epoll_create" , NULL, NULL, NULL },

From man pages:

int epoll_create(int size);

So, this also belongs to the category "has only int-type parameter,'
and "%s(%d)" should be used, no?

---------------------------------------------------

>  #ifdef TARGET_NR_setresgid
> -{ TARGET_NR_setresgid, "setresgid" , NULL, NULL, NULL },
> +{ TARGET_NR_setresgid, "setresgid" , "%s(%u,%u,%u)", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_setresgid32
>  { TARGET_NR_setresgid32, "setresgid32" , NULL, NULL, NULL },
>  #endif

Why are you here correcting setresgid(), but leaving setresgid32()
intact, even though they have the same argument type pattern?

--------------------------------------------------

I have these objections, however, in general, I salute the patch, and
your efforts to improve QEMU linux-user strace, it is a quite useful
debug tool, and thanks for doing this! :)

Yours,
Aleksandar

