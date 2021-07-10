Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396093C300B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 04:44:57 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m22z9-0007y0-Oy
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 22:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m22xy-0007Gf-K7
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 22:43:42 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m22xw-0002sK-NB
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 22:43:42 -0400
Received: by mail-qk1-x72b.google.com with SMTP id i125so11560255qke.12
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 19:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/7Y9R/UOwh6ISqRDQh22xlSw8peaKxdxsSFCNXui/j8=;
 b=rf+QnBZ1E3kbFz33ycvjO7oKXlaWzwX+YNdpRZ1RBCrph0o9ayXaGvj+p5h7a80OnR
 h9i1cWndAXLJhZM+KX+1O/HV6TYeGGo5r8Uf4+rjMof3MiQQwRgVqMlPd+g3CdLnmAAW
 sVx5gjqMV2l1XEa5Kq8DtQdstUrLSkEhE1ynXyHmmwRpefy8Z011mn/PWlsc/J95g4C/
 YFtDq7jS0l5mvJ2XcMlMc+y+dZOJH2wCFE0ag3N7DnhTnQrNlkmq26/I6xg+R5x34Shc
 NazQQOcTKJbSHNnPr09B6DhAJonvkieHiGdMmI8VpXPYEJlZB8eMQQBthC7KiAjqSZ0X
 scfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/7Y9R/UOwh6ISqRDQh22xlSw8peaKxdxsSFCNXui/j8=;
 b=N0pj5JLhSqnmSIxmvdEu4N5i/KiikKE52ZLYedaoNHEdEykpjJZdUP7I2XCBQS8LAv
 sBnbDXSJFvJt1uaiGwFGOJmJi/t/BR0oylvxbXqzpELkUfKsY/cc6ty4cTFsCGgMUeec
 wE6SIG0sis5Iuki1SrJr93pWpUsZbX4lEinD2CBHLcBNMlfEiso2jSP5JGkysy+0zxcg
 qwxPH/afG6YOqxArd58HmKLTocxlssq7S43aI7JCdc/BWaXGh9kRiV781Lydg5lHUaBO
 egQF821DZH/FTz+iJHqOAxXLXM+j7fx9Z8N/KddrcJnY98XURpibYKyV/FOuOV74NIDD
 MMiQ==
X-Gm-Message-State: AOAM530sPnZt8riCQlgRU5zUGrL5V7Cb3R/PPjwuRjz+kqqXh5IXAzPg
 1yctdLwXOMpCRTQgS5BVv5I=
X-Google-Smtp-Source: ABdhPJyTrlAZ1O9Fk1L0tVBMunGuCOhJNJbZECF8MFn+L+TMZfRpVL/ar+6pkgXGx1zhBq86RN2GCg==
X-Received: by 2002:a05:620a:d49:: with SMTP id
 o9mr40364467qkl.378.1625885019260; 
 Fri, 09 Jul 2021 19:43:39 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id j19sm2657927qtp.43.2021.07.09.19.43.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Jul 2021 19:43:38 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Picture missing in About dialog on cocoa ui
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CAMVc7JULWjm_ME0bO0VAmqw=8Jr-LvqJWxFk1KxSMk2orMDgvQ@mail.gmail.com>
Date: Fri, 9 Jul 2021 22:43:37 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <F66D4F54-B102-4248-A451-8A9CDC2AF99D@gmail.com>
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
 <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
 <CAMVc7JULWjm_ME0bO0VAmqw=8Jr-LvqJWxFk1KxSMk2orMDgvQ@mail.gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 8, 2021, at 8:15 PM, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>=20
> I tried [NSApp applicationIconImage] but had no luck. I suspect it is
> because Rez is for Carbon development and deprecated while NSApp is
> from AppKit. Loading from the filesystem is inevitable.

Totally disagree. I'm on a new MacBook Air and the rez command is =
available. I will agree that Apple likes removing features but the rez =
command is not one of them.=20

I did not try [NSApp applicationIconImage], but I did try using =
[[NSWorkspace sharedWorkspace] iconForFile: program_path] and it worked.

> By the way, I knew Rez is from Carbon but didn't know it is
> deprecated, which I have figured out just now by reading man. Reading
> the icon file and assigning it to [NSApp applicationIconImage] is a
> possible solution, but it requires modifications for all graphical
> backends (cocoa, gtk, and sdl) and of course an external icon file. Do
> you think removing the dependency on Rez is worth it?

I do not think we should remove any code that depends on rez. I honestly =
think the easiest and best thing to do is to go back to using my =
original patch for displaying a picture in the About dialog.


> See "[PATCH 1/4] cutils: Introduce bundle mechanism" for a general fix
> of the problem when loading a "bundled" file.
>=20
> Regards,
> Akihiko Odaki
>=20
>=20
> On Fri, Jul 9, 2021 at 2:51 AM Peter Maydell =
<peter.maydell@linaro.org> wrote:
>>=20
>> On Thu, 8 Jul 2021 at 17:28, Programmingkid =
<programmingkidx@gmail.com> wrote:
>>> The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it =
requires a
>>> picture file to be found in a certain path. My original code used =
QEMU's
>>> icon to obtain a picture. The reason why the picture in the About =
dialog
>>> stopped appearing was because of the move to the meson build system.
>>> A new patch has just been committed that fixes the missing icon =
issue.
>>> Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes =
the
>>> missing picture issue in the About dialog.
>>=20
>> If the icon is the same (same resolution, etc) then just using it
>> does seem better than loading it off the filesystem. But we should
>> also sort out why get_relocated_path() isn't working, because if =
QEMU.
>> can't load files that way then other things will also be broken I =
think.
>>=20
>> -- PMM


