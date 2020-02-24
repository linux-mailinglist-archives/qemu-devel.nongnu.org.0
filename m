Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC916AB3C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 17:21:36 +0100 (CET)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6GUA-00069x-Vg
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 11:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j6GTQ-0005Xg-F0
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:20:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1j6GTP-0003Ag-6f
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:20:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1j6GTO-0003AQ-Vn
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:20:47 -0500
Received: by mail-wm1-x343.google.com with SMTP id z12so6379174wmi.4
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MHhiCvHP6qkd0sQN5DXO7glZ8xdNaXzCtbf4mWvs878=;
 b=uOAYE0OR0j4/yOsThdTP0za6rblLA6r9iUcOF+iakquA/v9rC421Ox6npJ0sxi+63o
 JvQzsMfSkPQAN5I1vNOyesOCYIrwEE1NCOTUBW8FTQHA5vLTZSsmTP5mT/+mtihk+box
 3oO/vZ4sxDQYBhtfbvO05CMsX23Mm2dSQq5DZaIncvHuv+WpkOSSiCfFyRLRVDBYJk34
 Bvcg65WP0+VMZNiy6QcGBJTz9RGv3Z+YC9+TG2ljjDb0lNAiXdQ1/mzvKB9gfTTCErb4
 ROy5LF7hW8e3H7ag7bsmAulk9hiaPUMdROmkhgCo0DcUOb24Qv9Tdy/H6BipMMdTo2QB
 EjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MHhiCvHP6qkd0sQN5DXO7glZ8xdNaXzCtbf4mWvs878=;
 b=Kig1jLFJPDGXdhTJMeRZtVl7R7tJi9E5BZMj8sLsnuDBk0w4ZH1bTkRSjrOQHGKNG8
 W8N5tol62TBbHUOmZdKlN4Rnq7OZA4ZSGvnbUd1Z7w4u/0K2fKy/UpYfpY3fEaxsgx9/
 +Wl4j0HBEhAo75tbQE+QIOEgmi2wXUjGtz/EC4IAJIe/7mlvyjTdp8BiVqtsIjh0Betx
 Z58AcrAyPuLe5IrJon7EQinMcqwlRySUk63b8YC+LsZiGOYRUgvX0RPk7/skg9Mep70H
 /0I4mv78r+HZWNoPcr5FlTUKgYKl9j3yIF7TDpFTWnh7oe0S/K6UAa+LzKAJRovCSu1M
 UgmA==
X-Gm-Message-State: APjAAAW9I24aqJcPnUNeU8sBJNeAzE9q8lGGKrBmwCAxSBDz/UqC4xC4
 gOTrOBxHZgW4osmq/jQaxsLwtMh82pzgiKx77Ig=
X-Google-Smtp-Source: APXvYqxKxoEoOms1ANZzFUEU/qYFHN3HglPw6jIitLqvH1ZMBV1xKPwdiR1ljh9mKEExDvTVhUsEXlbWoS391m3AXYg=
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr23898100wme.26.1582561245463; 
 Mon, 24 Feb 2020 08:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20200113144848.2168018-1-marcandre.lureau@redhat.com>
 <87a75dn1gd.fsf@dusky.pond.sub.org>
 <CAJ+F1C+M3yPreBLOHXkt16b5aghesT7qYkEPbS_3Dm7vGTaMKA@mail.gmail.com>
 <87blptckoi.fsf@dusky.pond.sub.org> <20200221100700.GA5254@linux.fritz.box>
 <87pne751g9.fsf@dusky.pond.sub.org>
In-Reply-To: <87pne751g9.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 24 Feb 2020 17:20:33 +0100
Message-ID: <CAJ+F1CKbZiVk0DCQxMojxu8FyEskg5Cw32B08Vi9emaEMw79fQ@mail.gmail.com>
Subject: Re: [PATCH] console: make QMP screendump use coroutine
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, David Alan Gilbert <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Feb 21, 2020 at 5:50 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Kevin Wolf <kwolf@redhat.com> writes:
>
> > Am 20.02.2020 um 17:01 hat Markus Armbruster geschrieben:
> >> >> >  void qmp_screendump(const char *filename, bool has_device, const=
 char *device,
> >> >> >                      bool has_head, int64_t head, Error **errp)
> >> >> >  {
> >> >> >      QemuConsole *con;
> >> >> >      DisplaySurface *surface;
> >> >> > +    g_autoptr(pixman_image_t) image =3D NULL;
> >> >> >      int fd;
> >> >> >
> >> >> >      if (has_device) {
> >> >> > @@ -365,7 +375,15 @@ void qmp_screendump(const char *filename, bo=
ol has_device, const char *device,
> >> >> >          }
> >> >> >      }
> >> >> >
> >> >> > -    graphic_hw_update(con);
> >> >> > +    if (qemu_in_coroutine()) {
> >> >> > +        assert(!con->screendump_co);
> >> >> > +        con->screendump_co =3D qemu_coroutine_self();
> >> >> > +        aio_bh_schedule_oneshot(qemu_get_aio_context(),
> >> >> > +                                graphic_hw_update_bh, con);
> >> >> > +        qemu_coroutine_yield();
> >> >> > +        con->screendump_co =3D NULL;
> >> >> > +    }
> >> >>
> >> >> What if multiple QMP monitors simultaneously screendump?  Hmm, it w=
orks
> >> >> because all execute one after another in the same coroutine
> >> >> qmp_dispatcher_co.  Implicit mutual exclusion.
> >> >>
> >> >> Executing them one after another is bad, because it lets an ill-beh=
aved
> >> >> QMP command starve *all* QMP monitors.  We do it only out of
> >> >> (reasonable!) fear of implicit mutual exclusion requirements like t=
he
> >> >> one you add.
> >> >>
> >> >> Let's not add more if we can help it.
> >> >
> >> > The situation is not worse than the current blocking handling.
> >>
> >> Really?
> >>
> >> What makes executing multiple qmp_screendump() concurrently (in separa=
te
> >> threads) or interleaved (in separate coroutines in the same thread)
> >> unsafe before this patch?
> >
> > QMP command handlers are guaranteed to run in the main thread with the
> > BQL held, so there is no concurrency. If you want to change this, you
> > would have much more complicated problems to solve than in this handler=
.
> > I'm not sure it's fair to require thread-safety from one handler when
> > no other handler is thread safe (except accidentally) and nobody seems
> > to plan actually calling them from multiple threads.
>
> "Let's not [...] if we can help it." is hardly a "change this or else no
> merge" demand.  It is a challenge to find a more elegant solution.
>
> >> >> Your screendump_co is per QemuConsole instead of per QMP monitor on=
ly
> >> >> because you need to find the coroutine in graphic_hw_update_done().=
  Can
> >> >> we somehow pass it via function arguments?
> >> >
> >> > I think it could be done later, so I suggest a TODO.
> >>
> >> We should avoid making our dependence on implicit mutual exclusion
> >> worse.  When we do it anyway, a big, fat, ugly comment is definitely
> >> called for.
> >
> > Anyway, what I really wanted to add:
> >
> > This should be easy to solve by having a CoQueue instead of a single
>
> Ah, challenge accepted!  Exactly the outcome I was hoping for :)
>
> > Coroutine pointer. The coroutine would just call qemu_co_queue_wait(),
> > which adds itself to the queue before it yields and the update
> > completion would wake up all coroutines that are currently queued with
> > qemu_co_queue_restart_all().
> >
> > qemu_co_queue_wait() takes a lock as its second parameter. You don't
> > need it in this context and can just pass NULL. (This is a lock that
> > would be dropped while the coroutine is sleeping and automatically
> > reacquired afterwards.)
> >
> >> >> In case avoiding the mutual exclusion is impractical: please explai=
n it
> >> >> in a comment to make it somewhat less implicit.
> >>
> >> It is anything but: see appended patch.
> >
> > This works, too, but it requires an additional struct. I think the queu=
e
> > is easier. (Note there is a difference in the mechanism: Your patch
> > waits for the specific update it triggered, while the CoQueue would wai=
t
> > for _any_ update to complete. I assume effectively the result is the
> > same.)
>
> Your idea sounds much nicer to me.  Thanks!

Similar to the NULL check you asked to remove,
having a CoQueue there would lead to think that several concurrently
running screendump are possible.

Is this a direction we are willing to take?

fwiw, my earlier async series did allow that, and was using a queue
for concurrent screendumps (but without coroutine & CoQueue, since it
was all traditional callback/events-based)



--=20
Marc-Andr=C3=A9 Lureau

