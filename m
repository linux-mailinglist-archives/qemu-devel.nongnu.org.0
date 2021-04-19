Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322B364124
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:58:49 +0200 (CEST)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYSYC-0007HF-2t
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lYSWT-0006rG-24
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:57:01 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:43905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lYSWO-000766-L8
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:57:00 -0400
Received: by mail-ua1-x92c.google.com with SMTP id a8so7743024uan.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P9S+UiOYuHise9kwgQQz/tkgmRPwWQ4dCc9e8kgRWCs=;
 b=aAkrVGw+6RfUfdYT22NadkZbfE4BoXlTUTZjlapcXIy9LoJbn1pydR3A2Lm7FDsRk5
 2IAwjzJnc14LISXWlwH9LyVLkiqFXG5dkzntSr4tsqQeqS9P1dyy/PUsn8BHp2zdTCOc
 tzmamsXjDkGFDmByJjWDKQr7lbqImrtPA5b29NmSayHRRLnYQ/IwzSxyuHkllpqFZ+dd
 XW77/FC/FYkzSq3l/JOQNLFf92oOaZociWfd/Q/zEJKEZHNQIyvRaJY7VvMwC5nG3Cn9
 FktqeUHVxEyvZh2MCZUzPd0VKDq4dY3CCrIHthP1cicf9vAKh5E9Q9YqiAUERvLtmUBz
 H/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P9S+UiOYuHise9kwgQQz/tkgmRPwWQ4dCc9e8kgRWCs=;
 b=Ggto4p3RZZL0CA4Bf2nGbwdlqJxHffTkp3/0DPlHVEHLmrkfsbqut0j2DxFEYqK0AU
 BeIFdyTu/dBvliER/4/7fGZ4k1vszRV2CGv2CsAgBdIaDkYgdGpJmFrogq6A02EzRAiV
 Se30hu/oof8Xm6TKXfia1buUhl+DKfzuFu7uPEp3Z4eCBmqZLePbDK8OKr7576aPqhs0
 F/7tf7HiknSxdZ88Rox60Z5wTikVTs1vaArNvdqxptAix6aTmdFjBbepuefK2pbW+KEy
 nYiBIHo+cKLJYzk1vmnybsDUjY4hCfMHN7jjJC8AI1+vAAJokafRTihvjOgpsfG+U3is
 P/AA==
X-Gm-Message-State: AOAM532SPqzNWNZXe0IPEpCuFwrz/MBA3F5HDdXiA/HOe9Spit7VU6+q
 M8fMADI4N8v/2toxpB5zFX47NjQUKP8uTvP8CLs=
X-Google-Smtp-Source: ABdhPJxvitFaBxhtkccGC7eP4Wwwf45o1OjiAn6lRTXLf/B/hLC7NGWnBgG5VisuWH4t+l3fa/4sd6G8Qr7Vm9y4u0U=
X-Received: by 2002:ab0:78d:: with SMTP id c13mr4886686uaf.99.1618833414760;
 Mon, 19 Apr 2021 04:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
 <CAJ+F1CKFzgp=ndDER4p4v-_uz0gf0ydzYcxtay7Zz7wwUQUueg@mail.gmail.com>
 <CAJ+F1CLW1rCV1rnxxhtAMEoVttA+nbWetbQkd7C3G16NTR2NRw@mail.gmail.com>
 <87blad2v9x.fsf@dusky.pond.sub.org>
In-Reply-To: <87blad2v9x.fsf@dusky.pond.sub.org>
From: Li Zhang <zhlcindy@gmail.com>
Date: Mon, 19 Apr 2021 13:56:43 +0200
Message-ID: <CAD8of+q+3Ekv3SkCtQdoPMkjrh-8hAakCk3uV=WzDF_Y-A7uaA@mail.gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=zhlcindy@gmail.com; helo=mail-ua1-x92c.google.com
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 17, 2021 at 10:02 AM Markus Armbruster <armbru@redhat.com> wrot=
e:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>
> > Hi
> >
> > On Fri, Apr 16, 2021 at 6:59 PM Marc-Andr=C3=A9 Lureau <
> > marcandre.lureau@gmail.com> wrote:
> >
> >> Hi
> >>
> >> On Fri, Apr 16, 2021 at 6:51 PM Markus Armbruster <armbru@redhat.com>
> >> wrote:
> >>
> >>> Marc-Andr=C3=A9, I'd like your opinion for this one, in particular th=
e use of
> >>> g_source_remove().
> >>>
> >>
> >> My opinion isn't really worth much, my review would have a bit more va=
lue.
> >>
> >> GSource has indeed some peculiar lifetime management, that I got wrong=
 in
> >> the past. So I would be extra careful.
> >>
> >> But before spending time on review, I would also clarify the motivatio=
n
> >> and ask for testing.
> >>
> >> Markus, hot-adding/removing monitors isn't supported?
> >>
> >>
> > I realize you answered my question below. That's surprising me. Wouldn'=
t it
> > make more sense to support it rather than having a pre-opened null-base=
d
> > monitor that can have its chardev swapped?
>
> Yes, it would.  Patches welcome.
>
> This patch is a somewhat ham-fisted and limited solution to the problem
> stated in the commit message.  However, it might *also* be a reasonable
> improvement to chardev-change on its own.  Not for me to judge.
>
Okay, Thanks.

> chardev-change comes with a number of restrictions.  Let's have a closer
> look.  It fails
>
> 1. when no such character device exists (d'oh)
>
> 2. for chardev-mux devices
>
> 3. in record/replay mode
>
> 4. when a backend is connected that doesn't implement the chr_be_change()
>    method
>
> 5. when chr_be_change() fails
>
> 6. when creating the new chardev fails[*]
>
> Items 2, 3, 4 are restrictions.  I figure 2 and 4 are simply not
> implemented, yet.  I'm not sure about 3.
>
For item 3,
source code mentions "chardev cannot  be changed in record/replay mode".
I never tried it yet. I am not quite sure why it couldn't be changed.

> Whether we want to accept patches lifting restrictions is up to the
> chardev maintainers.
>
> This patch lifts restriction 4 for QMP monitor backends.  Its monitor
> part looks acceptable to me, but I dislike its code duplication.  Before
> we spend time on cleaning that up (or on deciding to clean it up later),
> I'd like to hear the chardev mantainers' judgement, because that's about
> more serious matters than cleanliness.
>
> Do I make sense?
Yes, make sense.  Thanks.

>
> [...]
>
>
> [*] The code for creating the new chardev in the "no backend connected"
> case
>
>     be =3D chr->be;
>     if (!be) {
>         /* easy case */
>         object_unparent(OBJECT(chr));
>         return qmp_chardev_add(id, backend, errp);
>     }
>
> is problematic: when qmp_chardev_add() fails, we already destroyed the
> old chardev.  It should destroy the old chardev only when it can create
> its replacement.
>
You are right. It is a problem.


--=20

Best Regards
-Li

