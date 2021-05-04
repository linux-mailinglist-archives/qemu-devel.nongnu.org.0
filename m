Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25294372603
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:56:17 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoye-0003g2-59
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1ldoZJ-0001Ik-FX
 for qemu-devel@nongnu.org; Tue, 04 May 2021 02:30:05 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:36434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1ldoZH-0006XM-6Z
 for qemu-devel@nongnu.org; Tue, 04 May 2021 02:30:05 -0400
Received: by mail-il1-x129.google.com with SMTP id p15so5529034iln.3
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 23:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5ExzEX71Q01iFP+mV4YnkeCQ9Estz8ODEUZ1ppfFR/I=;
 b=neWHACB8NI/utFJQyJ+zajcbGGcUqisv57PUqvhc0apZ/vtluzqTs6YM2QaL+Cumsd
 LsTme530TeFZk+BKsttEKnIyWEe8D57EJJ/rFD9gAFGCMQC2GLo7+gXTCNEIJV/IiwjV
 XQ7xH9l/mEknS9R+N3fRK+yIN4Yd3EKt8kyIdxXqY3Nv/oAW2z2xHGycuIrhyR1rRkj0
 RdXglfglFcbTlFi2WRs72Jr/bDaLQDdT9WGGtS7i84zfat8x911u80SIXTv1e29iv1+t
 tGmvCCfS48uSp45MzMlYLIh/Xw3Ar9QSfZseZZzJk/85oAYxt934qCa/KJV5NIwZ5HSl
 PBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5ExzEX71Q01iFP+mV4YnkeCQ9Estz8ODEUZ1ppfFR/I=;
 b=X3V7tyE0o30x19Xyjzf6Xih573AWOsCoSkX6x2QEbHyv1cxYE1qZNK4BvUCsL7J8vd
 4qh3Ssd2tNpSiISPBg6wHTEwdToq2NfJIX1fmM7q07eyL2CFUhdEB/P5fzuw3bONE7F2
 2ilt0S5+8JIzFaIfCx0reLJkS0H4uOGBUEBNX9+MXkDK4rWM1unmU4b+YicTVYK4K6Lb
 JQjkORAtagXp00072NfM20qtCVHr28ex1d2j/UFhjsAK2kbPoV2SEgLCnRXLfPnjcLBA
 N1nLxrpchxQDiUTh1alUaFHjWgmv434RU5BDsXZPHMW3sqJfEVhT1fNP5HVRDSI0wgJM
 baBA==
X-Gm-Message-State: AOAM531j+ZFObYARbp/T2n6HuCYkK9JkQtIK/tcvR9gpJXVOSMyyjdnI
 emm8meUjfSvnto5Qz1Lb9sGT9AVGVghBXQFjwFM=
X-Google-Smtp-Source: ABdhPJy3pVNOuWOtAOCWLuUsoGBM/Z6JUbB4ePMx+8pAJ+qWF45QqMvX4hcbA4OoV0G/FjCF30cYk+F5iWY58XGi0/8=
X-Received: by 2002:a92:cecc:: with SMTP id z12mr16741828ilq.89.1620109802004; 
 Mon, 03 May 2021 23:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
 <CAJ+F1CKFzgp=ndDER4p4v-_uz0gf0ydzYcxtay7Zz7wwUQUueg@mail.gmail.com>
 <CAJ+F1CLW1rCV1rnxxhtAMEoVttA+nbWetbQkd7C3G16NTR2NRw@mail.gmail.com>
 <87blad2v9x.fsf@dusky.pond.sub.org>
In-Reply-To: <87blad2v9x.fsf@dusky.pond.sub.org>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 4 May 2021 08:29:50 +0200
Message-ID: <CAM9Jb+g0jUy5uEYmpu0nTYogRoDN1VZayLD_0xQ2ZZqB5tr21Q@mail.gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x129.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Li Zhang <li.zhang@cloud.ionos.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Li Zhang <zhlcindy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+CC Danpb

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
> Whether we want to accept patches lifting restrictions is up to the
> chardev maintainers.

Maybe we can handle or already handle the restrictions at libvirt side?

>
> This patch lifts restriction 4 for QMP monitor backends.  Its monitor
> part looks acceptable to me, but I dislike its code duplication.  Before
> we spend time on cleaning that up (or on deciding to clean it up later),
> I'd like to hear the chardev mantainers' judgement, because that's about
> more serious matters than cleanliness.

Sure. But I also feel allowing to change monitor device is a useful feature
independent of monitor hotplug/unplug feature .

>
> Do I make sense?
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

 Good point. I agree. We should fix this.

Thanks,
Pankaj

