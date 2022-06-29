Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041955FE5E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 13:19:08 +0200 (CEST)
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Vit-00056Y-Md
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 07:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o6VbD-0006VJ-SB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:11:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o6Vb9-00052t-4Q
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 07:11:09 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z41so3126592ede.1
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AsaEgnk9+p+kBOpAwf7DkihqhWIjMYk7TPsuBd2Mc38=;
 b=yjOf2SdPGU9m5UpdLLvklDS7Zva7Hb6icsb6/v6XGMKZQd/pWugs06MY1KszcMq5wK
 Q+dsJ8h8LDbVHpPUvuP81uxQfimYo5FdA/B947pkucn/gcGAzdKLAu9UzEjvGnYH4x15
 rBKqhDH6E9KrF5I48VKgjnTsUWm1d7m/4Ta5fKBnSktddHhHnd97Vh91p/CgNvpaOB/Y
 cAGcpYhT0j/u2hHOZjMHK+tqjQlEy4fBhIpuqS0h98jU+rojZ3gj3QFeW2HLQj6iMsYN
 BIN6LpdLg52z0ew7kihmrlLara2/lJrlROEHxIKoWuK7ASuUAFVFkEcPYJoJcN8hn0G7
 s3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AsaEgnk9+p+kBOpAwf7DkihqhWIjMYk7TPsuBd2Mc38=;
 b=T7QelBclVtuLQIOF7sqHboV11yPW1U8SlEVarYa26VHCK6nQiANMAEVku1nEOe9x70
 v530UqnsGCOn33C1FCYtKTat7zfCP6VO98f0XVA/WyEJfYhAVd33c/WSa6XvDx9JEWkH
 rwQlF1YefJjsCeBPhlYERwJ9/XhIJep+v+l7/X10WEKxiZyvpGZvgqG/9FSjif/cZpuR
 hBOfch1vS2RvzjPkVnhrJxOhDpQx2sxf/YLwguvGoB2GaThB/lwkIzpnSxpfvK+JIduC
 QVVC1NxqZOlal+drPwZwhhchvYoKSQ2P0Ics4Auj5iVCIbvqzbEBBH1W9/LrIY96P4zf
 iRGA==
X-Gm-Message-State: AJIora9LhjeP9pilT/ej857u+n0aZhWQmesr9VLRkvWCrfAWhw7qZjHX
 +lj3UeZwpUDJ+H+4k34n1tTwNl9TLo091ylNSzTY
X-Google-Smtp-Source: AGRyM1uPbrvzoLlyR0nt2+Z1TpnLpkh5Pjs93zxRS2toOfwNAM3PDwYzLrA5i8TUp1+4ZuwStIZtfrkK/Ef7VkrxZQ8=
X-Received: by 2002:a05:6402:d6b:b0:435:7170:cf15 with SMTP id
 ec43-20020a0564020d6b00b004357170cf15mr3440265edb.314.1656501064258; Wed, 29
 Jun 2022 04:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-5-xieyongji@bytedance.com>
 <8735fnq00u.fsf@pond.sub.org>
In-Reply-To: <8735fnq00u.fsf@pond.sub.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 29 Jun 2022 19:10:53 +0800
Message-ID: <CACycT3vzA_v_b91=Z7bsngtjgTmdJDtRs-62UCfgWWYPJWSofw@mail.gmail.com>
Subject: Re: [PATCH 4/4] libvduse: Check the return value of some ioctls
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jun 29, 2022 at 5:41 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Xie Yongji <xieyongji@bytedance.com> writes:
>
> > Coverity pointed out (CID 1490222, 1490227) that we called
> > ioctl somewhere without checking the return value. This
> > patch fixes these issues.
> >
> > Fixes: Coverity CID 1490222, 1490227
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > ---
> >  subprojects/libvduse/libvduse.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
> > index 1a5981445c..bf7302c60a 100644
> > --- a/subprojects/libvduse/libvduse.c
> > +++ b/subprojects/libvduse/libvduse.c
> > @@ -947,7 +947,10 @@ static void vduse_queue_disable(VduseVirtq *vq)
> >
> >      eventfd.index = vq->index;
> >      eventfd.fd = VDUSE_EVENTFD_DEASSIGN;
> > -    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
> > +    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd)) {
> > +        fprintf(stderr, "Failed to disable eventfd for vq[%d]: %s\n",
> > +                vq->index, strerror(errno));
> > +    }
> >      close(vq->fd);
> >
> >      assert(vq->inuse == 0);
> > @@ -1337,7 +1340,10 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >
> >      return dev;
> >  err:
> > -    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
> > +    if (ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name)) {
> > +        fprintf(stderr, "Failed to destroy vduse device %s: %s\n",
> > +                name, strerror(errno));
> > +    }
> >  err_dev:
> >      close(ctrl_fd);
> >  err_ctrl:
>
> Both errors are during cleanup that can't fail.  The program continues
> as if they didn't happen.  Does the user need to know?
>

So I printed some error messages. I didn't find any other good way to
notify the users.

Thanks,
Yongji

