Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A9668DA21
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:07:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOcc-0005QA-0M; Tue, 07 Feb 2023 09:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pPOcZ-0005P9-NQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:06:55 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pPOcX-0002XG-J7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:06:55 -0500
Received: by mail-lf1-x12a.google.com with SMTP id w11so22432603lfu.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iM9lSFaMcuDkm6sCFU4YsKm/K1ppERd5G/AJATCrMnk=;
 b=hNcFXEJb2ROYqrptx1SdlE7NYOXsmT9bZbikvBS6kn0i9dPBYtvPVjemoAYyJdlIXs
 ug6dfdjIv4vbUxdwXHeQXswgzmFScRZVn/p/SCYu9Kry5H0+LiD4/j0fEqOGwzGZaCZ/
 psrh9we6BgWSGGw9XwnjaUPaRcD26SZO6HSpn2RQXLL4ShxNK4lggsJTRiTEKfqaQ8Dc
 5+3iBU7NGJ1uPOIkw3VZVyuzn+9M6k8MYwEh55/+SgDP7PfZBGTtw1O0uIFkGzp6VUuF
 JSdEciLNfhbxr9BbVRAHnawsPBsf8hF6PqkLMR99B4kSMbFfosUrt/ezBq64xgONXKfV
 ta4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iM9lSFaMcuDkm6sCFU4YsKm/K1ppERd5G/AJATCrMnk=;
 b=VrfH+3N+QcqKfs2VfvzE/Nczb8CLrZ/UvYHeGonLVXh/qSgL8YXGOMHbtLZ1+Yrfbo
 k9yImNgL8ATFJgCvYwW5pLltegqTZCx42fSKEIIYuwJBxEQ/WTtAlAigjMnPgoZ2K4Nn
 gmHRFTOxvLZ1OvpJRYRMFEsfS+ss3CYBzvoMgPIZlogzZ9C4LXBTFf8rc06xf/mxLXyt
 tQkwpZvaoSpn0JQBHVWKYhIfF7rY1gj4/iF02lifNZWvqzXbLGQ+0jb1RS+6dKp9KqaN
 rZ2/bRgxBVFbJjFXkrkwLARXxa1SlTSXRdCIV+/tdO6W7qJ4A0//bT9GxIHc89S0tyNH
 9GMg==
X-Gm-Message-State: AO0yUKVUCr/bATAYMJ8NhFZEyI/vbUYZAU8JYs6Xr7PvwrP4YVmE3ZWe
 2vSZzAMjyq9WZXEElZaWiN/h/2bZ/VrlRvXym+A=
X-Google-Smtp-Source: AK7set8rKmxO6VmjeBfS7FGVs19RD9LawdyYdDpYR0YsYq7yPZ3YDv87cY4cluvb/876u0eHVy5QYC866CSJpfAAf+U=
X-Received: by 2002:ac2:41c7:0:b0:4cc:6ce7:6614 with SMTP id
 d7-20020ac241c7000000b004cc6ce76614mr446496lfi.83.1675778811316; Tue, 07 Feb
 2023 06:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20200925120655.295142-1-dgilbert@redhat.com>
 <20200925120655.295142-24-dgilbert@redhat.com>
 <CAJ+F1C+6zPmeTjByKMaDZaFND5qr3Y4i9vJpyFJc2UFkgHWOjQ@mail.gmail.com>
 <Y+JVHUrYY2rFbBes@work-vm>
In-Reply-To: <Y+JVHUrYY2rFbBes@work-vm>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 7 Feb 2023 18:06:39 +0400
Message-ID: <CAJ+F1CKLV_XG3pe_4YJD++-R71F5M4yepGOoR7nYocqs65y0fw@mail.gmail.com>
Subject: Re: [PULL 23/26] monitor: Use LOCK_GUARD macros
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, zhengchuan@huawei.com, 
 dovmurik@linux.vnet.ibm.com, hgcoin@gmail.com, 
 zhangjiachen.jaycee@bytedance.com, lvivier@redhat.com, stefanha@redhat.com, 
 vgoyal@redhat.com, jinyan12@huawei.com, ann.zhuangyanying@huawei.com, 
 quintela@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Feb 7, 2023 at 5:41 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Marc-Andr=C3=A9 Lureau (marcandre.lureau@gmail.com) wrote:
> > Hi David
> >
> > On Fri, Sep 25, 2020 at 4:27 PM Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > Use the lock guard macros in monitor/misc.c - saves
> > > a lot of unlocks in error paths, and the occasional goto.
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Message-Id: <20200922095741.101911-1-dgilbert@redhat.com>
> > > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  monitor/misc.c | 44 ++++++++++++++------------------------------
> > >  1 file changed, 14 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/monitor/misc.c b/monitor/misc.c
> > > index 262f2bd951..6e0da0cb96 100644
> > > --- a/monitor/misc.c
> > > +++ b/monitor/misc.c
> > > @@ -141,13 +141,13 @@ char *qmp_human_monitor_command(const char *com=
mand_line, bool has_cpu_index,
> > >      handle_hmp_command(&hmp, command_line);
> > >      cur_mon =3D old_mon;
> > >
> > > -    qemu_mutex_lock(&hmp.common.mon_lock);
> > > -    if (qstring_get_length(hmp.common.outbuf) > 0) {
> > > -        output =3D g_strdup(qstring_get_str(hmp.common.outbuf));
> > > -    } else {
> > > -        output =3D g_strdup("");
> > > +    WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
> > > +        if (qstring_get_length(hmp.common.outbuf) > 0) {
> > > +            output =3D g_strdup(qstring_get_str(hmp.common.outbuf));
> > > +        } else {
> > > +            output =3D g_strdup("");
> > > +        }
> > >      }
> > > -    qemu_mutex_unlock(&hmp.common.mon_lock);
> > >
> > >  out:
> > >      monitor_data_destroy(&hmp.common);
> > > @@ -1248,7 +1248,7 @@ void qmp_getfd(const char *fdname, Error **errp=
)
> > >          return;
> > >      }
> > >
> > > -    qemu_mutex_lock(&cur_mon->mon_lock);
> > > +    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> > >      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
> > >          if (strcmp(monfd->name, fdname) !=3D 0) {
> > >              continue;
> > > @@ -1256,7 +1256,6 @@ void qmp_getfd(const char *fdname, Error **errp=
)
> > >
> > >          tmp_fd =3D monfd->fd;
> > >          monfd->fd =3D fd;
> > > -        qemu_mutex_unlock(&cur_mon->mon_lock);
> > >          /* Make sure close() is outside critical section */
> > >          close(tmp_fd);
> >
> > The comment doesn't look true after this patch, since the lock is
> > released before returning. commit 9409fc05fe2 ("monitor: protect
> > mon->fds with mon_lock") introduced the lock & comment. Apparently,
> > you didn't convert qmp_closefd() to LOCK_GUARD, presumably because of
> > the comment. But you did it in qmp_getfd. What's the reason for that
> > though, avoiding syscalls while holding the lock or am I missing
> > something?
>
> No, I think you're right!
> Yeh I think the reason was to avoid the (potentially blocking) syscall
> with the lock held.
>

Ok, I'll send a patch, thanks

> Dave
>
> > thanks
> >
> > >          return;
> > > @@ -1267,7 +1266,6 @@ void qmp_getfd(const char *fdname, Error **errp=
)
> > >      monfd->fd =3D fd;
> > >
> > >      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> > > -    qemu_mutex_unlock(&cur_mon->mon_lock);
> > >  }
> > >
> > >  void qmp_closefd(const char *fdname, Error **errp)
> > > @@ -1299,7 +1297,7 @@ int monitor_get_fd(Monitor *mon, const char *fd=
name, Error **errp)
> > >  {
> > >      mon_fd_t *monfd;
> > >
> > > -    qemu_mutex_lock(&mon->mon_lock);
> > > +    QEMU_LOCK_GUARD(&mon->mon_lock);
> > >      QLIST_FOREACH(monfd, &mon->fds, next) {
> > >          int fd;
> > >
> > > @@ -1313,12 +1311,10 @@ int monitor_get_fd(Monitor *mon, const char *=
fdname, Error **errp)
> > >          QLIST_REMOVE(monfd, next);
> > >          g_free(monfd->name);
> > >          g_free(monfd);
> > > -        qemu_mutex_unlock(&mon->mon_lock);
> > >
> > >          return fd;
> > >      }
> > >
> > > -    qemu_mutex_unlock(&mon->mon_lock);
> > >      error_setg(errp, "File descriptor named '%s' has not been found"=
, fdname);
> > >      return -1;
> > >  }
> > > @@ -1350,11 +1346,10 @@ void monitor_fdsets_cleanup(void)
> > >      MonFdset *mon_fdset;
> > >      MonFdset *mon_fdset_next;
> > >
> > > -    qemu_mutex_lock(&mon_fdsets_lock);
> > > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> > >      QLIST_FOREACH_SAFE(mon_fdset, &mon_fdsets, next, mon_fdset_next)=
 {
> > >          monitor_fdset_cleanup(mon_fdset);
> > >      }
> > > -    qemu_mutex_unlock(&mon_fdsets_lock);
> > >  }
> > >
> > >  AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_=
opaque,
> > > @@ -1389,7 +1384,7 @@ void qmp_remove_fd(int64_t fdset_id, bool has_f=
d, int64_t fd, Error **errp)
> > >      MonFdsetFd *mon_fdset_fd;
> > >      char fd_str[60];
> > >
> > > -    qemu_mutex_lock(&mon_fdsets_lock);
> > > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> > >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> > >          if (mon_fdset->id !=3D fdset_id) {
> > >              continue;
> > > @@ -1409,12 +1404,10 @@ void qmp_remove_fd(int64_t fdset_id, bool has=
_fd, int64_t fd, Error **errp)
> > >              goto error;
> > >          }
> > >          monitor_fdset_cleanup(mon_fdset);
> > > -        qemu_mutex_unlock(&mon_fdsets_lock);
> > >          return;
> > >      }
> > >
> > >  error:
> > > -    qemu_mutex_unlock(&mon_fdsets_lock);
> > >      if (has_fd) {
> > >          snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64 ", fd:%=
" PRId64,
> > >                   fdset_id, fd);
> > > @@ -1430,7 +1423,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
> > >      MonFdsetFd *mon_fdset_fd;
> > >      FdsetInfoList *fdset_list =3D NULL;
> > >
> > > -    qemu_mutex_lock(&mon_fdsets_lock);
> > > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> > >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> > >          FdsetInfoList *fdset_info =3D g_malloc0(sizeof(*fdset_info))=
;
> > >          FdsetFdInfoList *fdsetfd_list =3D NULL;
> > > @@ -1460,7 +1453,6 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
> > >          fdset_info->next =3D fdset_list;
> > >          fdset_list =3D fdset_info;
> > >      }
> > > -    qemu_mutex_unlock(&mon_fdsets_lock);
> > >
> > >      return fdset_list;
> > >  }
> > > @@ -1554,7 +1546,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, =
int flags)
> > >  #else
> > >      MonFdset *mon_fdset;
> > >
> > > -    qemu_mutex_lock(&mon_fdsets_lock);
> > > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> > >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> > >          MonFdsetFd *mon_fdset_fd;
> > >          MonFdsetFd *mon_fdset_fd_dup;
> > > @@ -1569,7 +1561,6 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, =
int flags)
> > >          QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
> > >              mon_fd_flags =3D fcntl(mon_fdset_fd->fd, F_GETFL);
> > >              if (mon_fd_flags =3D=3D -1) {
> > > -                qemu_mutex_unlock(&mon_fdsets_lock);
> > >                  return -1;
> > >              }
> > >
> > > @@ -1580,25 +1571,21 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id=
, int flags)
> > >          }
> > >
> > >          if (fd =3D=3D -1) {
> > > -            qemu_mutex_unlock(&mon_fdsets_lock);
> > >              errno =3D EACCES;
> > >              return -1;
> > >          }
> > >
> > >          dup_fd =3D qemu_dup_flags(fd, flags);
> > >          if (dup_fd =3D=3D -1) {
> > > -            qemu_mutex_unlock(&mon_fdsets_lock);
> > >              return -1;
> > >          }
> > >
> > >          mon_fdset_fd_dup =3D g_malloc0(sizeof(*mon_fdset_fd_dup));
> > >          mon_fdset_fd_dup->fd =3D dup_fd;
> > >          QLIST_INSERT_HEAD(&mon_fdset->dup_fds, mon_fdset_fd_dup, nex=
t);
> > > -        qemu_mutex_unlock(&mon_fdsets_lock);
> > >          return dup_fd;
> > >      }
> > >
> > > -    qemu_mutex_unlock(&mon_fdsets_lock);
> > >      errno =3D ENOENT;
> > >      return -1;
> > >  #endif
> > > @@ -1609,7 +1596,7 @@ static int64_t monitor_fdset_dup_fd_find_remove=
(int dup_fd, bool remove)
> > >      MonFdset *mon_fdset;
> > >      MonFdsetFd *mon_fdset_fd_dup;
> > >
> > > -    qemu_mutex_lock(&mon_fdsets_lock);
> > > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> > >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> > >          QLIST_FOREACH(mon_fdset_fd_dup, &mon_fdset->dup_fds, next) {
> > >              if (mon_fdset_fd_dup->fd =3D=3D dup_fd) {
> > > @@ -1619,17 +1606,14 @@ static int64_t monitor_fdset_dup_fd_find_remo=
ve(int dup_fd, bool remove)
> > >                      if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
> > >                          monitor_fdset_cleanup(mon_fdset);
> > >                      }
> > > -                    goto err;
> > > +                    return -1;
> > >                  } else {
> > > -                    qemu_mutex_unlock(&mon_fdsets_lock);
> > >                      return mon_fdset->id;
> > >                  }
> > >              }
> > >          }
> > >      }
> > >
> > > -err:
> > > -    qemu_mutex_unlock(&mon_fdsets_lock);
> > >      return -1;
> > >  }
> > >
> > > --
> > > 2.26.2
> > >
> > >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


--=20
Marc-Andr=C3=A9 Lureau

