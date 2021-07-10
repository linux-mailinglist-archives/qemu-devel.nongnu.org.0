Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C13C3246
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 05:31:30 +0200 (CEST)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m23iD-0004we-BH
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 23:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m23hK-0004GL-Bb
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 23:30:34 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:43897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m23hH-0007OR-DD
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 23:30:34 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso11543300otu.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 20:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VRUcwYZCiCltyD1J8zmr4qTfV3cvvGkqDB3gyK6Nmg=;
 b=f9AW/E33og2QmDt5Y/P3ipTxJsu9lQRYzobwRXPViHgRkCSd2ELafYFuLb/2CcBTMl
 Zt6LNfW1l5X/p2X5ucm5EUcLW/DrLOhSOrk+YGLjVLAIU8YJpWKLF0Ii1KkDR+s+ikJa
 ch1p6MNRDKPf5RHdaWQcj9P2dcYc5DB6w+uCiRuSRJfucc/7RJbFl8s4XyISLd70G+hI
 NGcFjNQHYe5q9fFUdihAXje6b5Pyl4xY6I4RZ8xqQ0PkbzdZrdTM2JdFmwKYGmMYH2bP
 3xAngOrn74kzIW4EEx42q2GoukY2MKiFSa/kFuE8WZsn4zkX3+IgCZACpmWyM804sVTy
 wFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VRUcwYZCiCltyD1J8zmr4qTfV3cvvGkqDB3gyK6Nmg=;
 b=izWX3yGX7SKO7Kww/QVZCnIHjY9sgiD1MufguSJUu5PFlhfeJmN8roxdDDEHno3peB
 0EVTOYJufiDZ1Aj3iTzMIUEtCahtJdjyq0LXNNrlvOcpGgKkLQEp2mxBNH4wTKa5gF1W
 kGe5qzV5VNhF5+yTy4wrFcwlCe/n39GDvsJcNDki6rgi9Q7bZnnb+ZDh7CP2/eBLrI7F
 iQU5OBWDjQlEDgTrci8aS8QJ/BkRPBqLF9BNcgTAxxjKjuNRv3DM5Xfv8FKXEpmRIUN1
 C+FVpmK1YehEOzDuQCHBfcO2z4qimsRrs0ndySnKtADD9yHAFnDjbpXHPsG1w4jrDAOd
 DQzw==
X-Gm-Message-State: AOAM533hCkOEb5UePT9qHY+4tSVnUCVjadvW60FYVYP+WWHDUJ7bMlJQ
 TfaCw1A9EorcA9J9SD4UxZOpbHFr0CGoSLQyexc=
X-Google-Smtp-Source: ABdhPJyFWmA0cvHAkn6ahuxCYW6fokL9ThBxC5G9gNGzO87zQxMb1Qd1l5Youy1xlgdBUgZDjMEFwySirz0ezS/DGVo=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr3747391otl.233.1625887828345; 
 Fri, 09 Jul 2021 20:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
 <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
 <CAMVc7JULWjm_ME0bO0VAmqw=8Jr-LvqJWxFk1KxSMk2orMDgvQ@mail.gmail.com>
 <F66D4F54-B102-4248-A451-8A9CDC2AF99D@gmail.com>
In-Reply-To: <F66D4F54-B102-4248-A451-8A9CDC2AF99D@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sat, 10 Jul 2021 12:30:17 +0900
Message-ID: <CAMVc7JVV+xskXs48nhZXwQzRDhjX_EPcNs_LrAxkLJE_3AuGnw@mail.gmail.com>
Subject: Re: Picture missing in About dialog on cocoa ui
To: Programmingkid <programmingkidx@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x333.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 10, 2021 at 11:43 AM Programmingkid
<programmingkidx@gmail.com> wrote:
>
>
>
> > On Jul 8, 2021, at 8:15 PM, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > I tried [NSApp applicationIconImage] but had no luck. I suspect it is
> > because Rez is for Carbon development and deprecated while NSApp is
> > from AppKit. Loading from the filesystem is inevitable.
>
> Totally disagree. I'm on a new MacBook Air and the rez command is available. I will agree that Apple likes removing features but the rez command is not one of them.

I also think Apple is going to remove Rez anytime soon since the
documentation also says it is deprecated since Xcode 6, which was
released 2014. It is true that the manual says it's deprecated and
Apple doesn't want us to use it but we can actually use it, of course.

I'd also like to hear opinions from maintainers. Peter, what do you
think? I'm also adding Paolo Bonzini who merged the change introducing
Rez.

> I did not try [NSApp applicationIconImage], but I did try using [[NSWorkspace sharedWorkspace] iconForFile: program_path] and it worked.

I meant it still needs filesystem access. Filesystem access is always
a cause of headache. The problem in [[NSWorkspace sharedWorkspace]
iconForFile: program_path] I tried to address is also because of the
filesystem. It constructs a path from argv and mainBundle but argv is
not reliable to get the path of executable. Note that you still can
get the executable path in a reliable manner with
_NSGetExecutablePath(); a proper fix is to use the function if we opt
to use the executable as the icon source.

Regards,
Akihiko Odaki

>
> > By the way, I knew Rez is from Carbon but didn't know it is
> > deprecated, which I have figured out just now by reading man. Reading
> > the icon file and assigning it to [NSApp applicationIconImage] is a
> > possible solution, but it requires modifications for all graphical
> > backends (cocoa, gtk, and sdl) and of course an external icon file. Do
> > you think removing the dependency on Rez is worth it?
>
> I do not think we should remove any code that depends on rez. I honestly think the easiest and best thing to do is to go back to using my original patch for displaying a picture in the About dialog.
>
>
> > See "[PATCH 1/4] cutils: Introduce bundle mechanism" for a general fix
> > of the problem when loading a "bundled" file.
> >
> > Regards,
> > Akihiko Odaki
> >
> >
> > On Fri, Jul 9, 2021 at 2:51 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Thu, 8 Jul 2021 at 17:28, Programmingkid <programmingkidx@gmail.com> wrote:
> >>> The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it requires a
> >>> picture file to be found in a certain path. My original code used QEMU's
> >>> icon to obtain a picture. The reason why the picture in the About dialog
> >>> stopped appearing was because of the move to the meson build system.
> >>> A new patch has just been committed that fixes the missing icon issue.
> >>> Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes the
> >>> missing picture issue in the About dialog.
> >>
> >> If the icon is the same (same resolution, etc) then just using it
> >> does seem better than loading it off the filesystem. But we should
> >> also sort out why get_relocated_path() isn't working, because if QEMU.
> >> can't load files that way then other things will also be broken I think.
> >>
> >> -- PMM
>

