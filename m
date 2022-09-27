Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F55EBAE4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:44:16 +0200 (CEST)
Received: from localhost ([::1]:40068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4KF-0007nk-A8
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od46c-0004OO-7y; Tue, 27 Sep 2022 02:30:11 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:42757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od46a-0000zp-1E; Tue, 27 Sep 2022 02:30:09 -0400
Received: by mail-qv1-xf33.google.com with SMTP id u8so68535qvv.9;
 Mon, 26 Sep 2022 23:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=elvhhA4W5JGc27dibtf0cvtt45hqhOKHTd+8YZUXbGc=;
 b=pcoJErS+TrPtG5s7C7V4/do3/aR/5FBEisPSsUXAAeTVpePhRDUVQnyDz7nPxV2QxA
 Tmoun73iQnFr1UlIc+cpI1b8ePGdkE/0zY7+CXiPgg+/YIqPVlw1SJQdPYNSOTWaO2/V
 ZczSQZ/VtHxEXewR2xR2fKo8zK5BqqM2hOO7Am1o4bCnyj59KmDFti4CBU8IY3hR1Be8
 qfFQ06EXeCARu3fSa9vFzUXDsqCUBYhkC/TL2LlpZYHziaIIowTUX8ktcj1RyJZ39B5O
 MMx5afkSYGfFRoEMurN9AffeffhLWG4S9BUChWfM99ZEm5dgjT2V979dyNo8Ex4C2L03
 fM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=elvhhA4W5JGc27dibtf0cvtt45hqhOKHTd+8YZUXbGc=;
 b=JPG7UBaRIxAWuaM5iqSBBijmrm4Ui259EKnc7HykOfqW6jVM+JwL1L6+C+W00fpVh1
 QhknyiBl97eWAZKZn1jOIduh5AOBhD1WD9J3KbPuqNWxoAci0RzBCe1BuMP4SMeu9lx5
 ldMz/KFSE4ENvprFPu/r31BS8jeEP2afNwpxd0NQA6SJfHyWOjr+5CRvmzrxu0rNLaQO
 O4dq1oyd41n5ZsrcRxJz/5T7njarcBUk3QoBlFv5AI5TaGycYByHKU1pgEwIjFBHcDZz
 RFUf9tGa3sD/svfyG0ZYPyyZ2S9hKb6DZ3YY+TWK6HtDB1pe6WbFI+SQ0wm2KZGdue+5
 Jr8g==
X-Gm-Message-State: ACrzQf2AfMn3QWNgOb4Isk/21RGdPJLX7jaFzoww8iybjYoCvSAfTCDP
 LuWhh7jmh8cOEvJ6+baWuNbY31+wp/Vj4NZTod0=
X-Google-Smtp-Source: AMsMyM4TZbb+ZDqhVzZAMDiA8RnRXtztMNqpka7mITaHqBmv2kI14gEx7Fz1G5ENtc3PXKrl37t6eucmZ06VraA1DpY=
X-Received: by 2002:a05:6214:1947:b0:4aa:9e87:d032 with SMTP id
 q7-20020a056214194700b004aa9e87d032mr19766554qvk.114.1664260206068; Mon, 26
 Sep 2022 23:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220924114544.1906498-1-bmeng.cn@gmail.com>
 <87edvya1ez.fsf@pond.sub.org>
 <CAEUhbmX61MEXRv0XMXAVnuuVmq841i1_z2U5bR8hS39-cS7cKg@mail.gmail.com>
 <87o7v1mj4p.fsf@pond.sub.org>
In-Reply-To: <87o7v1mj4p.fsf@pond.sub.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Sep 2022 14:29:55 +0800
Message-ID: <CAEUhbmWk64pyujUDGFCJ=5MqwWSWy4XNb=M7QB5L1FiKHb2Q=g@mail.gmail.com>
Subject: Re: [PATCH v2] block: Refactor get_tmp_filename()
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf33.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On Tue, Sep 27, 2022 at 2:22 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > On Mon, Sep 26, 2022 at 6:13 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Bin Meng <bmeng.cn@gmail.com> writes:
> >>
> >> > From: Bin Meng <bin.meng@windriver.com>
> >> >
> >> > At present there are two callers of get_tmp_filename() and they are
> >> > inconsistent.
> >> >
> >> > One does:
> >> >
> >> >     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
> >> >     char *tmp_filename = g_malloc0(PATH_MAX + 1);
> >> >     ...
> >> >     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> >> >
> >> > while the other does:
> >> >
> >> >     s->qcow_filename = g_malloc(PATH_MAX);
> >> >     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> >> >
> >> > As we can see different 'size' arguments are passed. There are also
> >> > platform specific implementations inside the function, and this use
> >> > of snprintf is really undesirable.
> >> >
> >> > Refactor this routine by changing its signature to:
> >> >
> >> >     char *get_tmp_filename(void)
> >> >
> >> > and use g_file_open_tmp() for a consistent implementation.
> >> >
> >> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> > ---
> >> >
> >> > Changes in v2:
> >> > - Use g_autofree and g_steal_pointer
> >> >
> >> >  include/block/block_int-common.h |  2 +-
> >> >  block.c                          | 42 ++++++++++----------------------
> >> >  block/vvfat.c                    |  8 +++---
> >> >  3 files changed, 18 insertions(+), 34 deletions(-)
> >> >
> >> > diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> >> > index 8947abab76..ea69a9349c 100644
> >> > --- a/include/block/block_int-common.h
> >> > +++ b/include/block/block_int-common.h
> >> > @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
> >> >  }
> >> >
> >> >  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> >> > -int get_tmp_filename(char *filename, int size);
> >> > +char *get_tmp_filename(void);
> >> >  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
> >> >                                        QDict *options);
> >> >
> >> > diff --git a/block.c b/block.c
> >> > index bc85f46eed..4e7a795566 100644
> >> > --- a/block.c
> >> > +++ b/block.c
> >> > @@ -860,38 +860,23 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
> >> >
> >> >  /*
> >> >   * Create a uniquely-named empty temporary file.
> >> > - * Return 0 upon success, otherwise a negative errno value.
> >> > + * Return the actual name used upon success, otherwise NULL.
> >> > + * The called function is responsible for freeing it.
> >> >   */
> >> > -int get_tmp_filename(char *filename, int size)
> >> > +char *get_tmp_filename(void)
> >> >  {
> >> > -#ifdef _WIN32
> >> > -    char temp_dir[MAX_PATH];
> >> > -    /* GetTempFileName requires that its output buffer (4th param)
> >> > -       have length MAX_PATH or greater.  */
> >> > -    assert(size >= MAX_PATH);
> >> > -    return (GetTempPath(MAX_PATH, temp_dir)
> >> > -            && GetTempFileName(temp_dir, "qem", 0, filename)
> >> > -            ? 0 : -GetLastError());
> >> > -#else
> >> > +    g_autofree char *filename = NULL;
> >> >      int fd;
> >> > -    const char *tmpdir;
> >> > -    tmpdir = getenv("TMPDIR");
> >> > -    if (!tmpdir) {
> >> > -        tmpdir = "/var/tmp";
> >> > -    }
> >> > -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> >> > -        return -EOVERFLOW;
> >> > -    }
> >> > -    fd = mkstemp(filename);
> >> > +
> >> > +    fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
> >> >      if (fd < 0) {
> >> > -        return -errno;
> >> > +        return NULL;
> >> >      }
> >> >      if (close(fd) != 0) {
> >> >          unlink(filename);
> >> > -        return -errno;
> >> > +        return NULL;
> >> >      }
> >> > -    return 0;
> >> > -#endif
> >> > +    return g_steal_pointer(&filename);
> >> >  }
> >>
> >> Oh my, what a lovely mess you're messing with!
> >>
> >> The function creates a temporary *file*, not just a filename.  Makes
> >> sense, as creating a unique filename is inherently racy.  The contract
> >> is clear enough ("Create a uniquely-named empty temporary file"), but
> >> the function name is actively misleading.
> >
> > Agreed that the name is misleading.
>
> Care to fix that?

How about create_tmp_file()?

>
> >> Of course, creating a temporary file for the caller to (re)open is also
> >> racy.  By the time the caller gets around to it, the filename could name
> >> anything.  Return an open file file descriptor is a better idea.  It's
> >> basically g_file_open_tmp().  Could we rework the two users of
> >> get_tmp_filename() accept a file descriptor?
> >
> > I looked at the 2 callers, and it looks like we need to do more than
> > these 2 callers to teach them to accept a file descriptor. :(
>
> Looks like it requires surgery to bdrv_create() at least.  I'm not
> demanding you do that now.
>

Yes, big surgery to struct CreateCo::filename, and various ops in
struct CreateCo::drv that takes the filename as an argument :(

Regards,
Bin

