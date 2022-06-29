Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD656004F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:45:12 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6X4B-0002PU-Dv
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o6Wx5-0006Is-3J
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 08:37:51 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o6Www-0002uV-BI
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 08:37:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id ge10so32311038ejb.7
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 05:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bmLaYPL9vh82c1vI/a+Qj8Hwan3XxUvjyETYlEA8/Vw=;
 b=a+aVdIPlpca5kSHqm3wFE6LAdkbJ0XcXoo2Hh3MMUnHn+SkDxmamWrkGhyO+sZpNlg
 bl5i5IN9ArjROdFRKyGQREaFcJRfc8j9wHid8MVSIlRhceBRcnYCulln5afZ7Px+yDff
 l0G9Ohwajl1QJqM2hVrH3wPZNxp9Wf5KrPBJKCc/sKFjVYFPzPaxwkCZrRaj3yOdFSUQ
 a8ZPhsAwanCD/L5MUvtmAkm/ZKpNj5uoL6T5hsAaW+EGS8EnqqYIkmjJcJHQ0vpklMvI
 Je5eMZmfU3MUPEi+k0K8I06SofLF6tiHfGEj94BQMgecmX8DVtyWe7DotthXVJnvrp3E
 V+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bmLaYPL9vh82c1vI/a+Qj8Hwan3XxUvjyETYlEA8/Vw=;
 b=c15XNqD+O2qMvd/mYSAPCVJtSCU5fTy/l5TdDEXcKQW4GFQPbgbSJ4IxdNorGFRiLY
 IcTLWJxKsJIAlE5DraZGGNjId0HX1xynEAavYzE5eRByRbrwHBzDtLW1JioTAODjH7Bt
 46C5diZ900AcQ7xZ33HIfrv3l5Sw+lxxtjflt2qc+oUmWzMopoeg3o8gcI1aUOAap4s5
 lWOI6TZfW+Ctu4oz06hl09EFceo4/QwymbfyvbcggSt52IZEpzebIBXKgm9428NzsGlK
 MHTlISOHDlyXM9SEeMnpgz/+NKio0C6PT0hy1P5MnAr5K5GiJWN7h5RKLNkxAWbPQRt9
 Qtkg==
X-Gm-Message-State: AJIora9fsw8vQIqpIUStHXhS0LeiA2eaOIg7TdxhxMOZrMpsIF6j8Yqk
 gd2waY2TrB0BTgfkwOAOwvoO73Dd7j58VkSduvCX
X-Google-Smtp-Source: AGRyM1tn1QI5+d1BfjLWPwN8jSP+Qrfcwf4HLYTLIqA/DmGMX8qd1jvCRQ4qNdtBz5Mdbbn3+7GmDsK6K+tAOOwYQf0=
X-Received: by 2002:a17:906:794a:b0:722:efd0:862f with SMTP id
 l10-20020a170906794a00b00722efd0862fmr3114026ejo.650.1656506258087; Wed, 29
 Jun 2022 05:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-5-xieyongji@bytedance.com>
 <8735fnq00u.fsf@pond.sub.org>
 <CACycT3vzA_v_b91=Z7bsngtjgTmdJDtRs-62UCfgWWYPJWSofw@mail.gmail.com>
 <87k08zg0m1.fsf@pond.sub.org>
In-Reply-To: <87k08zg0m1.fsf@pond.sub.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 29 Jun 2022 20:37:27 +0800
Message-ID: <CACycT3sh_5SU1Cj35EwLs5bfc7vyd4FBZzmTBMwPj-VmCi41FQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] libvduse: Check the return value of some ioctls
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 29, 2022 at 7:39 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Yongji Xie <xieyongji@bytedance.com> writes:
>
> > On Wed, Jun 29, 2022 at 5:41 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Xie Yongji <xieyongji@bytedance.com> writes:
> >>
> >> > Coverity pointed out (CID 1490222, 1490227) that we called
> >> > ioctl somewhere without checking the return value. This
> >> > patch fixes these issues.
> >> >
> >> > Fixes: Coverity CID 1490222, 1490227
> >> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> >> > ---
> >> >  subprojects/libvduse/libvduse.c | 10 ++++++++--
> >> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
> >> > index 1a5981445c..bf7302c60a 100644
> >> > --- a/subprojects/libvduse/libvduse.c
> >> > +++ b/subprojects/libvduse/libvduse.c
> >> > @@ -947,7 +947,10 @@ static void vduse_queue_disable(VduseVirtq *vq)
> >> >
> >> >      eventfd.index = vq->index;
> >> >      eventfd.fd = VDUSE_EVENTFD_DEASSIGN;
> >> > -    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
> >> > +    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd)) {
> >> > +        fprintf(stderr, "Failed to disable eventfd for vq[%d]: %s\n",
> >> > +                vq->index, strerror(errno));
> >> > +    }
> >> >      close(vq->fd);
> >> >
> >> >      assert(vq->inuse == 0);
> >> > @@ -1337,7 +1340,10 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >> >
> >> >      return dev;
> >> >  err:
> >> > -    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
> >> > +    if (ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name)) {
> >> > +        fprintf(stderr, "Failed to destroy vduse device %s: %s\n",
> >> > +                name, strerror(errno));
> >> > +    }
> >> >  err_dev:
> >> >      close(ctrl_fd);
> >> >  err_ctrl:
> >>
> >> Both errors are during cleanup that can't fail.  The program continues
> >> as if they didn't happen.  Does the user need to know?
> >>
> >
> > So I printed some error messages. I didn't find any other good way to
> > notify the users.
>
> I can think of another way, either.  But my question wasn't about "how",
> it was about "why".  The answer depends on the impact of these errors.
> Which I can't judge.  Can you?
>

OK, I get your point. Actually users might have no way to handle those
errors. And there is no real impact on users since those errors mean
the resources have been cleaned up in other places or by other
processes. So I choose to ignore this error, but it triggers a
Coverity warning.

Thanks,
Yongji

