Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F558AA1B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:27:41 +0200 (CEST)
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvUS-0004rC-9V
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJvM0-0006IG-9O
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJvLv-0001sA-7g
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659698330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlosFwYMHZCkEZOudHGIzYYqMoZqQHL4Zfzm4hwhOr4=;
 b=ZRfD40D0N5RngkskZciigKWGGMh2HoPAKEVoVAmSJTAM7SlOc7li1bWPp/MDRKzLw3yx8g
 5Im9QSy5tP2uo11tsU2/m6i1qigEr0Bj65UtKMool9AwQYfLRalV1kBgmHZF8QrtaPhUdo
 37E6ZvHBcxuwMBJ0rgU5Du7EAlXFWkA=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-eUsJ7iaGPmC8XYtdpg7j9g-1; Fri, 05 Aug 2022 07:18:47 -0400
X-MC-Unique: eUsJ7iaGPmC8XYtdpg7j9g-1
Received: by mail-ot1-f69.google.com with SMTP id
 l7-20020a05683004a700b00636b1690eb2so576177otd.9
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=WlosFwYMHZCkEZOudHGIzYYqMoZqQHL4Zfzm4hwhOr4=;
 b=LhEn3GYayWm2lzTOYNwyJk42sVlHfnptyAQSXIT4zA7/9OUh9+gnAJ+/uJ402kLJUy
 pQzqDaezxA+hnMovSPBT0S4i+Z3bwqbykAwa6jX8Z2ywPBKfcQSWUTFb6HXwzn6e7cPC
 320L0eKce3eCb6maTNe5HVu/Mvb+fchCmQlZlW6diACck713342QWz7otnRzDR0nNXU4
 f6s/H4XUqDewazP+FLTS1QodCXz9BPSTVIzf1ntU8DRazGTTYngB5slqO5r2ZctiJcJz
 8KR69V//mw7FGn8RAOFoxd8kmivIJt/oTKeYMOvzYerVvhCZ2EbklGPGtCgW26Ofn8U2
 lXbA==
X-Gm-Message-State: ACgBeo3jgpqqkpZWwaJ/6GOpnmtRqKCbkNCNJjaQqqyeSPpiAuT2Ql8u
 q2ZJP9T3bm5g7FPxMwBqAK1TMAoQu9juWwS5E9XEvtf8LbzBPcVsmM0Ky1fxi6UO/y9fJEz6nsX
 NcyHGHKtjpVywr3tDpRxQaKrwuaxB+C4=
X-Received: by 2002:a05:6870:65a7:b0:10e:d8ab:dd79 with SMTP id
 fp39-20020a05687065a700b0010ed8abdd79mr2937288oab.53.1659698326564; 
 Fri, 05 Aug 2022 04:18:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5WW+xl7lTMtzAQpOaK6tDu5vluJpWIDdR09eBrqer5hN1bX7T00xRAcXOR8EErd4fBwuYXiAbnIgb0DNmw8ZI=
X-Received: by 2002:a05:6870:65a7:b0:10e:d8ab:dd79 with SMTP id
 fp39-20020a05687065a700b0010ed8abdd79mr2937276oab.53.1659698326351; Fri, 05
 Aug 2022 04:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <4561100.0A2huPDW8y@silver>
In-Reply-To: <4561100.0A2huPDW8y@silver>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 5 Aug 2022 15:18:34 +0400
Message-ID: <CAMxuvayecf4pzKmjqB1AACD9OAc+5XY_88g=A9hm4qUq2SUm1A@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Aug 5, 2022 at 3:11 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Donnerstag, 4. August 2022 09:25:17 CEST Nikita Ivanov wrote:
> > From 0ceb04ada1ed5a863914f4449469d7572d3443ed Mon Sep 17 00:00:00 2001
> > From: Nikita Ivanov <nivanov@cloudlinux.com>
> > Date: Wed, 3 Aug 2022 12:54:00 +0300
> > Subject: [PATCH] error handling: Use TFR() macro where applicable
> >
> > There is a defined TFR() macro in qemu/osdep.h which
> > handles the same while loop.
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
> >
> > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> > ---
> >  hw/9pfs/9p-local.c   |  8 ++------
> >  net/l2tpv3.c         | 15 +++------------
> >  net/tap.c            |  8 ++------
> >  qga/commands-posix.c |  4 +---
> >  util/main-loop.c     |  4 +---
> >  util/osdep.c         |  4 +---
> >  6 files changed, 10 insertions(+), 33 deletions(-)
>
> I was thinking the same as Marc-Andr=C3=A9 before:
>
> commit 1dacd88ddcf33eb6ed044c4080e3ef5e3de4b6b6
> Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Date:   Wed Mar 23 19:57:27 2022 +0400
>
>     include: move TFR to osdep.h
>
>     The macro requires EINTR, which has its header included in osdep.h.
>
>     (Not sure what TFR stands for, perhaps "Test For Retry". Rename it ?)
>
>     Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>     Message-Id: <20220323155743.1585078-17-marcandre.lureau@redhat.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Wouldn't it make sense to first rename TFR() to something like
> RETRY_ON_EINTR() and then doing this consolidation here on top?

Apparently TFR often stands for "Temp Failure Retry" (looking at
github code search)

LOOP_WHILE_EINTR ?

>
> Best regards,
> Christian Schoenebeck
>
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index d42ce6d8b8..c90ab947ba 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
> > V9fsPath *fs_path,
> >          if (fd =3D=3D -1) {
> >              return -1;
> >          }
> > -        do {
> > -            tsize =3D read(fd, (void *)buf, bufsz);
> > -        } while (tsize =3D=3D -1 && errno =3D=3D EINTR);
> > +        TFR(tsize =3D read(fd, (void *)buf, bufsz));
> >          close_preserve_errno(fd);
> >      } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
> >                 (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > @@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const c=
har
> > *oldpath,
> >          }
> >          /* Write the oldpath (target) to the file. */
> >          oldpath_size =3D strlen(oldpath);
> > -        do {
> > -            write_size =3D write(fd, (void *)oldpath, oldpath_size);
> > -        } while (write_size =3D=3D -1 && errno =3D=3D EINTR);
> > +        TFR(write_size =3D write(fd, (void *)oldpath, oldpath_size));
> >          close_preserve_errno(fd);
> >
> >          if (write_size !=3D oldpath_size) {
> > diff --git a/net/l2tpv3.c b/net/l2tpv3.c
> > index af373e5c30..adfdbdb84c 100644
> > --- a/net/l2tpv3.c
> > +++ b/net/l2tpv3.c
> > @@ -240,9 +240,7 @@ static ssize_t
> > net_l2tpv3_receive_dgram_iov(NetClientState *nc,
> >      message.msg_control =3D NULL;
> >      message.msg_controllen =3D 0;
> >      message.msg_flags =3D 0;
> > -    do {
> > -        ret =3D sendmsg(s->fd, &message, 0);
> > -    } while ((ret =3D=3D -1) && (errno =3D=3D EINTR));
> > +    TFR(ret =3D sendmsg(s->fd, &message, 0));
> >      if (ret > 0) {
> >          ret -=3D s->offset;
> >      } else if (ret =3D=3D 0) {
> > @@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientSt=
ate
> > *nc,
> >      message.msg_control =3D NULL;
> >      message.msg_controllen =3D 0;
> >      message.msg_flags =3D 0;
> > -    do {
> > -        ret =3D sendmsg(s->fd, &message, 0);
> > -    } while ((ret =3D=3D -1) && (errno =3D=3D EINTR));
> > +    TFR(ret =3D sendmsg(s->fd, &message, 0));
> >      if (ret > 0) {
> >          ret -=3D s->offset;
> >      } else if (ret =3D=3D 0) {
> > @@ -434,12 +430,7 @@ static void net_l2tpv3_send(void *opaque)
> >
> >      msgvec =3D s->msgvec + s->queue_head;
> >      if (target_count > 0) {
> > -        do {
> > -            count =3D recvmmsg(
> > -                s->fd,
> > -                msgvec,
> > -                target_count, MSG_DONTWAIT, NULL);
> > -        } while ((count =3D=3D -1) && (errno =3D=3D EINTR));
> > +        TFR(count =3D recvmmsg(s->fd, msgvec, target_count, MSG_DONTWA=
IT,
> > NULL));
> >          if (count < 0) {
> >              /* Recv error - we still need to flush packets here,
> >               * (re)set queue head to current position
> > diff --git a/net/tap.c b/net/tap.c
> > index b3ddfd4a74..b047eca8b5 100644
> > --- a/net/tap.c
> > +++ b/net/tap.c
> > @@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
> > struct iovec *iov, int iovcnt
> >  {
> >      ssize_t len;
> >
> > -    do {
> > -        len =3D writev(s->fd, iov, iovcnt);
> > -    } while (len =3D=3D -1 && errno =3D=3D EINTR);
> > +    TFR(len =3D writev(s->fd, iov, iovcnt));
> >
> >      if (len =3D=3D -1 && errno =3D=3D EAGAIN) {
> >          tap_write_poll(s, true);
> > @@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper=
,
> > const char *bridge,
> >
> >          close(sv[1]);
> >
> > -        do {
> > -            fd =3D recv_fd(sv[0]);
> > -        } while (fd =3D=3D -1 && errno =3D=3D EINTR);
> > +        TFR(fd =3D recv_fd(sv[0]));
> >          saved_errno =3D errno;
> >
> >          close(sv[0]);
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 954efed01b..90f83aa9b6 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Err=
or
> > **errp)
> >
> >      *status =3D 0;
> >
> > -    do {
> > -        rpid =3D waitpid(pid, status, 0);
> > -    } while (rpid =3D=3D -1 && errno =3D=3D EINTR);
> > +    TFR(rpid =3D waitpid(pid, status, 0));
> >
> >      if (rpid =3D=3D -1) {
> >          error_setg_errno(errp, errno, "failed to wait for child (pid: =
%d)",
> > diff --git a/util/main-loop.c b/util/main-loop.c
> > index f00a25451b..58e14db2d4 100644
> > --- a/util/main-loop.c
> > +++ b/util/main-loop.c
> > @@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)
> >      ssize_t len;
> >
> >      while (1) {
> > -        do {
> > -            len =3D read(fd, &info, sizeof(info));
> > -        } while (len =3D=3D -1 && errno =3D=3D EINTR);
> > +        TFR(len =3D read(fd, &info, sizeof(info)));
> >
> >          if (len =3D=3D -1 && errno =3D=3D EAGAIN) {
> >              break;
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 60fcbbaebe..d35c473ac7 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
> > int64_t len, int fl_type)
> >          .l_type   =3D fl_type,
> >      };
> >      qemu_probe_lock_ops();
> > -    do {
> > -        ret =3D fcntl(fd, fcntl_op_setlk, &fl);
> > -    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> > +    TFR(ret =3D fcntl(fd, fcntl_op_setlk, &fl));
> >      return ret =3D=3D -1 ? -errno : 0;
> >  }
>
>


