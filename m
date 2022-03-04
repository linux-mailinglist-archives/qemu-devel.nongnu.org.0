Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B44CDEE8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:49:06 +0100 (CET)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQErJ-000578-Ab
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nQEo6-0003EV-SW; Fri, 04 Mar 2022 15:45:50 -0500
Received: from [2a00:1450:4864:20::336] (port=36645
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nQEo2-0001by-8t; Fri, 04 Mar 2022 15:45:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 62-20020a1c0241000000b003898fc06f1eso5886wmc.1; 
 Fri, 04 Mar 2022 12:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eXtTgT8l1cbLfeNWaUtPVUTFjjKIkjnPWz0zv4NFg6U=;
 b=O2PKp7V/B+Y8/hSKhjuqFxcW9siaU96sU5vs4Vw5LFEx647pQg3s024Gywgb6QOo4y
 NI0XzX8Dqm9kkmdJtfrvNQ+lS/Kf1rCeZoQQj4+Di3Qisgo0SfP8F+dwlzJZepq42J3e
 cb0y87ir51R89HghEm14jCOuFJJsHHMV58TKl8UOlw7CqQ3QrCtze0m4BrJUYFkW4qI1
 hzxJvqcfcN0/q3EMwh371+JAmXsBk+n1zyJoaU3RE5tWy4924Zf92HvWJhPFIX9GU/f/
 5spn8o6+0z6gYAZOx1IXSsgx2f+bO5cP1TSSuUrL/O11MGpmXWvuqXOkLGb4fIGk4yr8
 NV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXtTgT8l1cbLfeNWaUtPVUTFjjKIkjnPWz0zv4NFg6U=;
 b=6DtgiWHIEqs0JAC/jU6tKDM5B8EQljjKbozaO0/EcZFygXq5oJb/j0qYZVvq1bb4in
 PA8puqD5UNvy0/W/o9lnxgPNLIb9STXHcBDaZFUJsRnA0hD+WASWh1Yx//G0SiQhEUO2
 PxL39Btyw/JzmU+7n5G6a8evyDIZ5niUeD8gTeTY0XE75fsdyYz6d7Z7N3vp+zsAbdxe
 1yfd8uOYDrA5/djttdsYgU18gnlTJ7pCPOPyLEh4Jww+zlkdpt3nzsOsYVkB/J0a6dTT
 OZ1Ght9aVZZLTxDZ8FPLsNFkGSrcoVMb/v2A48521Qaq0JQ6Vi0aJv/EGjklNjUrpZMA
 9fgg==
X-Gm-Message-State: AOAM530sSy78C4gBG08tw5rOLKpx66S8YmyD6RBMpmdHb75JfKdNXAap
 val0MDnoartpKJcuPlEYOA3P2W6yF8/B3abQZZ4=
X-Google-Smtp-Source: ABdhPJzK1ay0muvETdURae3Rhp/7CYwFN4sDRhth84TTtauXQ6tDNhJbkFJJQkMN8Lq2eKsPMILollGRl9M02Ny3ar8=
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr164952wml.72.1646426739175; Fri, 04 Mar
 2022 12:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-4-marcandre.lureau@redhat.com>
 <6eedba39-6067-30ba-35b9-9d8cd4ad90c2@eik.bme.hu>
In-Reply-To: <6eedba39-6067-30ba-35b9-9d8cd4ad90c2@eik.bme.hu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 5 Mar 2022 00:45:26 +0400
Message-ID: <CAJ+F1C+3dWyEqpoHWS+x44MTE4S5B1kRUYmq_UNnpy3sLjFXVA@mail.gmail.com>
Subject: Re: [PATCH 3/4] Replace qemu_gettimeofday() with g_get_real_time()
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000eff7af05d96a9884"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eff7af05d96a9884
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Mar 5, 2022 at 12:40 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Fri, 4 Mar 2022, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > GLib g_get_real_time() is an alternative to gettimeofday().
> >
> > For semihosting, a few bits are lost on POSIX host, but this shouldn't
> > be a big concern.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> > blockdev.c                 |  8 ++++----
> > hw/rtc/m41t80.c            |  6 +++---
> > hw/virtio/virtio-balloon.c |  9 +--------
> > qapi/qmp-event.c           | 12 +++++-------
> > qemu-img.c                 |  8 ++++----
> > qga/commands-posix.c       | 11 +----------
> > target/m68k/m68k-semi.c    | 22 ++++++++++------------
> > target/nios2/nios2-semi.c  | 24 +++++++++++-------------
> > 8 files changed, 39 insertions(+), 61 deletions(-)
> >
> > diff --git a/blockdev.c b/blockdev.c
> > index 42e098b458b1..4b07dbfbdefc 100644
> > --- a/blockdev.c
> > +++ b/blockdev.c
> > @@ -1235,7 +1235,7 @@ static void
> internal_snapshot_prepare(BlkActionState *common,
> >     BlockDriverState *bs;
> >     QEMUSnapshotInfo old_sn, *sn;
> >     bool ret;
> > -    qemu_timeval tv;
> > +    int64_t rt;
> >     BlockdevSnapshotInternal *internal;
> >     InternalSnapshotState *state;
> >     AioContext *aio_context;
> > @@ -1305,9 +1305,9 @@ static void
> internal_snapshot_prepare(BlkActionState *common,
> >     /* 3. take the snapshot */
> >     sn =3D &state->sn;
> >     pstrcpy(sn->name, sizeof(sn->name), name);
> > -    qemu_gettimeofday(&tv);
> > -    sn->date_sec =3D tv.tv_sec;
> > -    sn->date_nsec =3D tv.tv_usec * 1000;
> > +    rt =3D g_get_real_time();
> > +    sn->date_sec =3D rt / G_USEC_PER_SEC;
> > +    sn->date_nsec =3D (rt % G_USEC_PER_SEC) * 1000;
> >     sn->vm_clock_nsec =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >     if (replay_mode !=3D REPLAY_MODE_NONE) {
> >         sn->icount =3D replay_get_current_icount();
> > diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
> > index a00971a67e1c..e045c864bb44 100644
> > --- a/hw/rtc/m41t80.c
> > +++ b/hw/rtc/m41t80.c
>
> This part
>
> Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> but why don't you use g_get_current_time() instead which seems to be a
> more direct replacement for gettimeofday, then you don't have to do maths
> with G_USEC_PER_SEC.>
>
>
As per glib docs, "g_get_current_time has been deprecated since version
2.62 and should not be used in newly-written code. GTimeVal is not
year-2038-safe. Use g_get_real_time() instead."

thanks




> Regards.
> BALATON Zoltan
>
> > @@ -47,7 +47,7 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
> > {
> >     M41t80State *s =3D M41T80(i2c);
> >     struct tm now;
> > -    qemu_timeval tv;
> > +    int64_t rt;
> >
> >     if (s->addr < 0) {
> >         s->addr =3D 0;
> > @@ -57,8 +57,8 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
> >     }
> >     switch (s->addr++) {
> >     case 0:
> > -        qemu_gettimeofday(&tv);
> > -        return to_bcd(tv.tv_usec / 10000);
> > +        rt =3D g_get_real_time();
> > +        return to_bcd((rt % G_USEC_PER_SEC) / 10000);
> >     case 1:
> >         return to_bcd(now.tm_sec);
> >     case 2:
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index e6c1b0aa46fe..b1bada84cecc 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -452,7 +452,6 @@ static void
> virtio_balloon_receive_stats(VirtIODevice *vdev, VirtQueue *vq)
> >     VirtQueueElement *elem;
> >     VirtIOBalloonStat stat;
> >     size_t offset =3D 0;
> > -    qemu_timeval tv;
> >
> >     elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
> >     if (!elem) {
> > @@ -484,13 +483,7 @@ static void
> virtio_balloon_receive_stats(VirtIODevice *vdev, VirtQueue *vq)
> >             s->stats[tag] =3D val;
> >     }
> >     s->stats_vq_offset =3D offset;
> > -
> > -    if (qemu_gettimeofday(&tv) < 0) {
> > -        warn_report("%s: failed to get time of day", __func__);
> > -        goto out;
> > -    }
> > -
> > -    s->stats_last_update =3D tv.tv_sec;
> > +    s->stats_last_update =3D g_get_real_time() / G_USEC_PER_SEC;
> >
> > out:
> >     if (balloon_stats_enabled(s)) {
> > diff --git a/qapi/qmp-event.c b/qapi/qmp-event.c
> > index 19d3cd003833..025716b3ec37 100644
> > --- a/qapi/qmp-event.c
> > +++ b/qapi/qmp-event.c
> > @@ -20,15 +20,13 @@
> >
> > static void timestamp_put(QDict *qdict)
> > {
> > -    int err;
> >     QDict *ts;
> > -    qemu_timeval tv;
> > +    int64_t rt =3D g_get_real_time();
> >
> > -    err =3D qemu_gettimeofday(&tv);
> > -    /* Put -1 to indicate failure of getting host time */
> > -    ts =3D qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds':
> %lld }",
> > -                                 err < 0 ? -1LL : (long long)tv.tv_sec=
,
> > -                                 err < 0 ? -1LL : (long
> long)tv.tv_usec);
> > +    ts =3D qdict_from_jsonf_nofail("{ 'seconds': %" G_GINT64_FORMAT
> > +                                 ", 'microseconds': %" G_GINT64_FORMAT
> "}",
> > +                                 rt / G_USEC_PER_SEC,
> > +                                 rt % G_USEC_PER_SEC);
> >     qdict_put(qdict, "timestamp", ts);
> > }
> >
> > diff --git a/qemu-img.c b/qemu-img.c
> > index 6fe2466032f9..e26773909684 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -3304,11 +3304,11 @@ static int img_snapshot(int argc, char **argv)
> >     char *filename, *snapshot_name =3D NULL;
> >     int c, ret =3D 0, bdrv_oflags;
> >     int action =3D 0;
> > -    qemu_timeval tv;
> >     bool quiet =3D false;
> >     Error *err =3D NULL;
> >     bool image_opts =3D false;
> >     bool force_share =3D false;
> > +    int64_t rt;
> >
> >     bdrv_oflags =3D BDRV_O_RDWR;
> >     /* Parse commandline parameters */
> > @@ -3405,9 +3405,9 @@ static int img_snapshot(int argc, char **argv)
> >         memset(&sn, 0, sizeof(sn));
> >         pstrcpy(sn.name, sizeof(sn.name), snapshot_name);
> >
> > -        qemu_gettimeofday(&tv);
> > -        sn.date_sec =3D tv.tv_sec;
> > -        sn.date_nsec =3D tv.tv_usec * 1000;
> > +        rt =3D g_get_real_time();
> > +        sn.date_sec =3D rt / G_USEC_PER_SEC;
> > +        sn.date_nsec =3D (rt % G_USEC_PER_SEC) * 1000;
> >
> >         ret =3D bdrv_snapshot_create(bs, &sn);
> >         if (ret) {
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 75dbaab68ea9..3311a4ca0167 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char
> *mode, Error **errp)
> >
> > int64_t qmp_guest_get_time(Error **errp)
> > {
> > -   int ret;
> > -   qemu_timeval tq;
> > -
> > -   ret =3D qemu_gettimeofday(&tq);
> > -   if (ret < 0) {
> > -       error_setg_errno(errp, errno, "Failed to get time");
> > -       return -1;
> > -   }
> > -
> > -   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
> > +    return g_get_real_time();
> > }
> >
> > void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
> > diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
> > index c5c164e096c8..54f735743165 100644
> > --- a/target/m68k/m68k-semi.c
> > +++ b/target/m68k/m68k-semi.c
> > @@ -378,19 +378,17 @@ void do_m68k_semihosting(CPUM68KState *env, int n=
r)
> >                            arg0, arg1);
> >             return;
> >         } else {
> > -            qemu_timeval tv;
> >             struct gdb_timeval *p;
> > -            result =3D qemu_gettimeofday(&tv);
> > -            if (result =3D=3D 0) {
> > -                if (!(p =3D lock_user(VERIFY_WRITE,
> > -                                    arg0, sizeof(struct gdb_timeval),
> 0))) {
> > -                    /* FIXME - check error code? */
> > -                    result =3D -1;
> > -                } else {
> > -                    p->tv_sec =3D cpu_to_be32(tv.tv_sec);
> > -                    p->tv_usec =3D cpu_to_be64(tv.tv_usec);
> > -                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
> > -                }
> > +            int64_t rt =3D g_get_real_time();
> > +            if (!(p =3D lock_user(VERIFY_WRITE,
> > +                                arg0, sizeof(struct gdb_timeval), 0)))=
 {
> > +                /* FIXME - check error code? */
> > +                result =3D -1;
> > +            } else {
> > +                result =3D 0;
> > +                p->tv_sec =3D cpu_to_be32(rt / G_USEC_PER_SEC);
> > +                p->tv_usec =3D cpu_to_be64(rt % G_USEC_PER_SEC);
> > +                unlock_user(p, arg0, sizeof(struct gdb_timeval));
> >             }
> >         }
> >         break;
> > diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
> > index 5a7ad0c7108d..4600bf0a39d9 100644
> > --- a/target/nios2/nios2-semi.c
> > +++ b/target/nios2/nios2-semi.c
> > @@ -400,20 +400,18 @@ void do_nios2_semihosting(CPUNios2State *env)
> >                            arg0, 0);
> >             return;
> >         } else {
> > -            qemu_timeval tv;
> >             struct gdb_timeval *p;
> > -            result =3D qemu_gettimeofday(&tv);
> > -            if (result =3D=3D 0) {
> > -                p =3D lock_user(VERIFY_WRITE, arg0, sizeof(struct
> gdb_timeval),
> > -                              0);
> > -                if (!p) {
> > -                    result =3D -1;
> > -                    errno =3D EFAULT;
> > -                } else {
> > -                    p->tv_sec =3D cpu_to_be32(tv.tv_sec);
> > -                    p->tv_usec =3D cpu_to_be64(tv.tv_usec);
> > -                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
> > -                }
> > +            int64_t rt =3D g_get_real_time();
> > +            p =3D lock_user(VERIFY_WRITE, arg0, sizeof(struct
> gdb_timeval),
> > +                          0);
> > +            if (!p) {
> > +                result =3D -1;
> > +                errno =3D EFAULT;
> > +            } else {
> > +                result =3D 0;
> > +                p->tv_sec =3D cpu_to_be32(rt / G_USEC_PER_SEC);
> > +                p->tv_usec =3D cpu_to_be64(rt % G_USEC_PER_SEC);
> > +                unlock_user(p, arg0, sizeof(struct gdb_timeval));
> >             }
> >         }
> >         break;
> >



--=20
Marc-Andr=C3=A9 Lureau

--000000000000eff7af05d96a9884
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 5, 2022 at 12:40 AM BAL=
ATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Fri, 4 Mar 2022, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_=
blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; GLib g_get_real_time() is an alternative to gettimeofday().<br>
&gt;<br>
&gt; For semihosting, a few bits are lost on POSIX host, but this shouldn&#=
39;t<br>
&gt; be a big concern.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt; blockdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 ++++----<br>
&gt; hw/rtc/m41t80.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++=
---<br>
&gt; hw/virtio/virtio-balloon.c |=C2=A0 9 +--------<br>
&gt; qapi/qmp-event.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++---=
----<br>
&gt; qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 ++++----<br>
&gt; qga/commands-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +----------<br>
&gt; target/m68k/m68k-semi.c=C2=A0 =C2=A0 | 22 ++++++++++------------<br>
&gt; target/nios2/nios2-semi.c=C2=A0 | 24 +++++++++++-------------<br>
&gt; 8 files changed, 39 insertions(+), 61 deletions(-)<br>
&gt;<br>
&gt; diff --git a/blockdev.c b/blockdev.c<br>
&gt; index 42e098b458b1..4b07dbfbdefc 100644<br>
&gt; --- a/blockdev.c<br>
&gt; +++ b/blockdev.c<br>
&gt; @@ -1235,7 +1235,7 @@ static void internal_snapshot_prepare(BlkActionS=
tate *common,<br>
&gt;=C2=A0 =C2=A0 =C2=A0BlockDriverState *bs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0QEMUSnapshotInfo old_sn, *sn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bool ret;<br>
&gt; -=C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt; +=C2=A0 =C2=A0 int64_t rt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0BlockdevSnapshotInternal *internal;<br>
&gt;=C2=A0 =C2=A0 =C2=A0InternalSnapshotState *state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0AioContext *aio_context;<br>
&gt; @@ -1305,9 +1305,9 @@ static void internal_snapshot_prepare(BlkActionS=
tate *common,<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* 3. take the snapshot */<br>
&gt;=C2=A0 =C2=A0 =C2=A0sn =3D &amp;state-&gt;sn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0pstrcpy(sn-&gt;name, sizeof(sn-&gt;name), name);<br=
>
&gt; -=C2=A0 =C2=A0 qemu_gettimeofday(&amp;tv);<br>
&gt; -=C2=A0 =C2=A0 sn-&gt;date_sec =3D tv.tv_sec;<br>
&gt; -=C2=A0 =C2=A0 sn-&gt;date_nsec =3D tv.tv_usec * 1000;<br>
&gt; +=C2=A0 =C2=A0 rt =3D g_get_real_time();<br>
&gt; +=C2=A0 =C2=A0 sn-&gt;date_sec =3D rt / G_USEC_PER_SEC;<br>
&gt; +=C2=A0 =C2=A0 sn-&gt;date_nsec =3D (rt % G_USEC_PER_SEC) * 1000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0sn-&gt;vm_clock_nsec =3D qemu_clock_get_ns(QEMU_CLO=
CK_VIRTUAL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (replay_mode !=3D REPLAY_MODE_NONE) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sn-&gt;icount =3D replay_get_current_=
icount();<br>
&gt; diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c<br>
&gt; index a00971a67e1c..e045c864bb44 100644<br>
&gt; --- a/hw/rtc/m41t80.c<br>
&gt; +++ b/hw/rtc/m41t80.c<br>
<br>
This part<br>
<br>
Acked-by: BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=
=3D"_blank">balaton@eik.bme.hu</a>&gt;<br>
<br>
but why don&#39;t you use g_get_current_time() instead which seems to be a =
<br>
more direct replacement for gettimeofday, then you don&#39;t have to do mat=
hs <br>
with G_USEC_PER_SEC.&gt;<br><br></blockquote><div><br></div><div>As per gli=
b docs, &quot;g_get_current_time has been deprecated since version 2.62 and=
 should not be used in newly-written code. GTimeVal is not year-2038-safe. =
Use g_get_real_time() instead.&quot;</div><div><br></div><div>thanks<br></d=
iv><div><br class=3D"gmail-Apple-interchange-newline"></div><div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards.<br>
BALATON Zoltan<br>
<br>
&gt; @@ -47,7 +47,7 @@ static uint8_t m41t80_recv(I2CSlave *i2c)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0M41t80State *s =3D M41T80(i2c);<br>
&gt;=C2=A0 =C2=A0 =C2=A0struct tm now;<br>
&gt; -=C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt; +=C2=A0 =C2=A0 int64_t rt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (s-&gt;addr &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;addr =3D 0;<br>
&gt; @@ -57,8 +57,8 @@ static uint8_t m41t80_recv(I2CSlave *i2c)<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0switch (s-&gt;addr++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_gettimeofday(&amp;tv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return to_bcd(tv.tv_usec / 10000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rt =3D g_get_real_time();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return to_bcd((rt % G_USEC_PER_SEC) / 100=
00);<br>
&gt;=C2=A0 =C2=A0 =C2=A0case 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return to_bcd(now.tm_sec);<br>
&gt;=C2=A0 =C2=A0 =C2=A0case 2:<br>
&gt; diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c<b=
r>
&gt; index e6c1b0aa46fe..b1bada84cecc 100644<br>
&gt; --- a/hw/virtio/virtio-balloon.c<br>
&gt; +++ b/hw/virtio/virtio-balloon.c<br>
&gt; @@ -452,7 +452,6 @@ static void virtio_balloon_receive_stats(VirtIODev=
ice *vdev, VirtQueue *vq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtQueueElement *elem;<br>
&gt;=C2=A0 =C2=A0 =C2=A0VirtIOBalloonStat stat;<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t offset =3D 0;<br>
&gt; -=C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement)=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!elem) {<br>
&gt; @@ -484,13 +483,7 @@ static void virtio_balloon_receive_stats(VirtIODe=
vice *vdev, VirtQueue *vq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;stats[tag] =3D va=
l;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0s-&gt;stats_vq_offset =3D offset;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (qemu_gettimeofday(&amp;tv) &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;%s: failed to get time =
of day&quot;, __func__);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 s-&gt;stats_last_update =3D tv.tv_sec;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;stats_last_update =3D g_get_real_time() / G_USEC_=
PER_SEC;<br>
&gt;<br>
&gt; out:<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (balloon_stats_enabled(s)) {<br>
&gt; diff --git a/qapi/qmp-event.c b/qapi/qmp-event.c<br>
&gt; index 19d3cd003833..025716b3ec37 100644<br>
&gt; --- a/qapi/qmp-event.c<br>
&gt; +++ b/qapi/qmp-event.c<br>
&gt; @@ -20,15 +20,13 @@<br>
&gt;<br>
&gt; static void timestamp_put(QDict *qdict)<br>
&gt; {<br>
&gt; -=C2=A0 =C2=A0 int err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0QDict *ts;<br>
&gt; -=C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt; +=C2=A0 =C2=A0 int64_t rt =3D g_get_real_time();<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 err =3D qemu_gettimeofday(&amp;tv);<br>
&gt; -=C2=A0 =C2=A0 /* Put -1 to indicate failure of getting host time */<b=
r>
&gt; -=C2=A0 =C2=A0 ts =3D qdict_from_jsonf_nofail(&quot;{ &#39;seconds&#39=
;: %lld, &#39;microseconds&#39;: %lld }&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err &lt; 0 ? -1LL : (long =
long)tv.tv_sec,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err &lt; 0 ? -1LL : (long =
long)tv.tv_usec);<br>
&gt; +=C2=A0 =C2=A0 ts =3D qdict_from_jsonf_nofail(&quot;{ &#39;seconds&#39=
;: %&quot; G_GINT64_FORMAT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;, &#39;microseconds&=
#39;: %&quot; G_GINT64_FORMAT &quot;}&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rt / G_USEC_PER_SEC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rt % G_USEC_PER_SEC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0qdict_put(qdict, &quot;timestamp&quot;, ts);<br>
&gt; }<br>
&gt;<br>
&gt; diff --git a/qemu-img.c b/qemu-img.c<br>
&gt; index 6fe2466032f9..e26773909684 100644<br>
&gt; --- a/qemu-img.c<br>
&gt; +++ b/qemu-img.c<br>
&gt; @@ -3304,11 +3304,11 @@ static int img_snapshot(int argc, char **argv)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0char *filename, *snapshot_name =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int c, ret =3D 0, bdrv_oflags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int action =3D 0;<br>
&gt; -=C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bool quiet =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bool image_opts =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bool force_share =3D false;<br>
&gt; +=C2=A0 =C2=A0 int64_t rt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bdrv_oflags =3D BDRV_O_RDWR;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Parse commandline parameters */<br>
&gt; @@ -3405,9 +3405,9 @@ static int img_snapshot(int argc, char **argv)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;sn, 0, sizeof(sn));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pstrcpy(<a href=3D"http://sn.name" re=
l=3D"noreferrer" target=3D"_blank">sn.name</a>, sizeof(<a href=3D"http://sn=
.name" rel=3D"noreferrer" target=3D"_blank">sn.name</a>), snapshot_name);<b=
r>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_gettimeofday(&amp;tv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sn.date_sec =3D tv.tv_sec;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sn.date_nsec =3D tv.tv_usec * 1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rt =3D g_get_real_time();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sn.date_sec =3D rt / G_USEC_PER_SEC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sn.date_nsec =3D (rt % G_USEC_PER_SEC) * =
1000;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D bdrv_snapshot_create(bs, &amp=
;sn);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
&gt; index 75dbaab68ea9..3311a4ca0167 100644<br>
&gt; --- a/qga/commands-posix.c<br>
&gt; +++ b/qga/commands-posix.c<br>
&gt; @@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char=
 *mode, Error **errp)<br>
&gt;<br>
&gt; int64_t qmp_guest_get_time(Error **errp)<br>
&gt; {<br>
&gt; -=C2=A0 =C2=A0int ret;<br>
&gt; -=C2=A0 =C2=A0qemu_timeval tq;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0ret =3D qemu_gettimeofday(&amp;tq);<br>
&gt; -=C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;Failed=
 to get time&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;<br>
&gt; +=C2=A0 =C2=A0 return g_get_real_time();<br>
&gt; }<br>
&gt;<br>
&gt; void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)<=
br>
&gt; diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c<br>
&gt; index c5c164e096c8..54f735743165 100644<br>
&gt; --- a/target/m68k/m68k-semi.c<br>
&gt; +++ b/target/m68k/m68k-semi.c<br>
&gt; @@ -378,19 +378,17 @@ void do_m68k_semihosting(CPUM68KState *env, int =
nr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg0, arg1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gdb_timeval *p;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D qemu_gettimeofda=
y(&amp;tv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D l=
ock_user(VERIFY_WRITE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg0, sizeof(struc=
t gdb_timeval), 0))) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* FIXME - check error code? */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 result =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 p-&gt;tv_sec =3D cpu_to_be32(tv.tv_sec);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 p-&gt;tv_usec =3D cpu_to_be64(tv.tv_usec);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 unlock_user(p, arg0, sizeof(struct gdb_timeval));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t rt =3D g_get_real_t=
ime();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D lock_user(VERIF=
Y_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg0, sizeof(struct gdb_timeval)=
, 0))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME - ch=
eck error code? */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D -1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D 0;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;tv_sec =
=3D cpu_to_be32(rt / G_USEC_PER_SEC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;tv_usec=
 =3D cpu_to_be64(rt % G_USEC_PER_SEC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(p=
, arg0, sizeof(struct gdb_timeval));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c<br>
&gt; index 5a7ad0c7108d..4600bf0a39d9 100644<br>
&gt; --- a/target/nios2/nios2-semi.c<br>
&gt; +++ b/target/nios2/nios2-semi.c<br>
&gt; @@ -400,20 +400,18 @@ void do_nios2_semihosting(CPUNios2State *env)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg0, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_timeval tv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gdb_timeval *p;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D qemu_gettimeofda=
y(&amp;tv);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D lock_us=
er(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!p) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 result =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 errno =3D EFAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 p-&gt;tv_sec =3D cpu_to_be32(tv.tv_sec);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 p-&gt;tv_usec =3D cpu_to_be64(tv.tv_usec);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 unlock_user(p, arg0, sizeof(struct gdb_timeval));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t rt =3D g_get_real_t=
ime();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D lock_user(VERIFY_WRIT=
E, arg0, sizeof(struct gdb_timeval),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!p) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D -1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EFA=
ULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D 0;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;tv_sec =
=3D cpu_to_be32(rt / G_USEC_PER_SEC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;tv_usec=
 =3D cpu_to_be64(rt % G_USEC_PER_SEC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(p=
, arg0, sizeof(struct gdb_timeval));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000eff7af05d96a9884--

