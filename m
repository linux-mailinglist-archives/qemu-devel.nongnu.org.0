Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069995601BC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:53:25 +0200 (CEST)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Y8B-0005j1-Vk
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o6XkP-0004E3-Hz
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:28:51 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o6XkK-0006ER-GX
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 09:28:46 -0400
Received: by mail-ej1-x636.google.com with SMTP id sb34so32530092ejc.11
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oRXyN33mcCi462a1bew0hyUXkJvvj22jlEiwHfASSos=;
 b=t/cjuwmxutbmKLba/NrihUbc5E4OrOKZXw//DYvZlHGtVSGhJR8oJPnyo65kZbFmcH
 1nw1R4zhLDZBRVLPMrYpzwdroxECpb2orSlkEtX6MqzXIjSLgwDjhXh7KExoHA2/LZvY
 nYUlx+bloR7WG9wm6qZimTshvYZaJlZNlKA/b3CrQNYeBkspjI6Dzk1d0wBPLqqYgfVk
 bvmGBaBDzOhv5L4cMeE+ZaG318Iwmz4c0xX8KlUP2FLa5dfEliZ8TC6u8TEl8nES8vNW
 OWXXnH4K97K+NxS4Z3Xl/yqOED6mCXEgZitmCS5MwjmjLLoykmJJLIMgjfQa8OnqK6x+
 KWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oRXyN33mcCi462a1bew0hyUXkJvvj22jlEiwHfASSos=;
 b=H1rLle1pp1RBNrSWETo1Ey8GaIFZSFfMMU42SvJx37BkErsH+VkjFrJZjOB+6DfVIU
 iB7WfBjf8fBAfSh7NBGMpIqCHiCpdrgoi8BNYjUYzWYnMQB9MMJwxWuSNfTPeqIog+Ga
 xmKhWOuqWLmL+eK8iNIMx4xDNtQ0Sp7ooFHvPKnTDRCwET45oBMSOFMs3Ce9rkrI84rH
 8C9LSGlOdihQE+xB2HfSn15PIXw8lXKWRhXNUFFMq5Va0VKcRpFeccW8w5pXvoFwTfgJ
 l68DdlInLBMsIB0aasamHgrdUvJAC4te4JDtoPWkmvjHV0NvEXsfAllPGju7TIS4202i
 dAEA==
X-Gm-Message-State: AJIora+hEu4cJI5FxZRNpgzNNWeRBWc6PAYTLJm1/qT61d0RBUFG36HU
 v8TJhUMIu4RkL8PIoMtFPTjkuO8rbgo/Okg5Zjx7
X-Google-Smtp-Source: AGRyM1t0J5SBc4k1AUvUv7/D3jVfNtR3SVxY7rAM6Cq9476+dAFziS/TkPWL9U7ClVQAsZT0ajgtsHYy7OgSmRcvCtY=
X-Received: by 2002:a17:907:6e01:b0:726:9a7b:59b7 with SMTP id
 sd1-20020a1709076e0100b007269a7b59b7mr3458032ejc.752.1656509320195; Wed, 29
 Jun 2022 06:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-5-xieyongji@bytedance.com>
 <8735fnq00u.fsf@pond.sub.org>
 <CACycT3vzA_v_b91=Z7bsngtjgTmdJDtRs-62UCfgWWYPJWSofw@mail.gmail.com>
 <87k08zg0m1.fsf@pond.sub.org>
 <CACycT3sh_5SU1Cj35EwLs5bfc7vyd4FBZzmTBMwPj-VmCi41FQ@mail.gmail.com>
 <87edz7eh9y.fsf@pond.sub.org>
In-Reply-To: <87edz7eh9y.fsf@pond.sub.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 29 Jun 2022 21:28:29 +0800
Message-ID: <CACycT3tXxX4BADkAiiz8gMaxaGXTHWRQtCBWaqmS9++HWAg4iw@mail.gmail.com>
Subject: Re: [PATCH 4/4] libvduse: Check the return value of some ioctls
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x636.google.com
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

On Wed, Jun 29, 2022 at 9:22 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Yongji Xie <xieyongji@bytedance.com> writes:
>
> > On Wed, Jun 29, 2022 at 7:39 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Yongji Xie <xieyongji@bytedance.com> writes:
> >>
> >> > On Wed, Jun 29, 2022 at 5:41 PM Markus Armbruster <armbru@redhat.com> wrote:
> >> >>
> >> >> Xie Yongji <xieyongji@bytedance.com> writes:
> >> >>
> >> >> > Coverity pointed out (CID 1490222, 1490227) that we called
> >> >> > ioctl somewhere without checking the return value. This
> >> >> > patch fixes these issues.
> >> >> >
> >> >> > Fixes: Coverity CID 1490222, 1490227
> >> >> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> >> >> > ---
> >> >> >  subprojects/libvduse/libvduse.c | 10 ++++++++--
> >> >> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >> >> >
> >> >> > diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
> >> >> > index 1a5981445c..bf7302c60a 100644
> >> >> > --- a/subprojects/libvduse/libvduse.c
> >> >> > +++ b/subprojects/libvduse/libvduse.c
> >> >> > @@ -947,7 +947,10 @@ static void vduse_queue_disable(VduseVirtq *vq)
> >> >> >
> >> >> >      eventfd.index = vq->index;
> >> >> >      eventfd.fd = VDUSE_EVENTFD_DEASSIGN;
> >> >> > -    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
> >> >> > +    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd)) {
> >> >> > +        fprintf(stderr, "Failed to disable eventfd for vq[%d]: %s\n",
> >> >> > +                vq->index, strerror(errno));
> >> >> > +    }
> >> >> >      close(vq->fd);
> >> >> >
> >> >> >      assert(vq->inuse == 0);
> >> >> > @@ -1337,7 +1340,10 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
> >> >> >
> >> >> >      return dev;
> >> >> >  err:
> >> >> > -    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
> >> >> > +    if (ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name)) {
> >> >> > +        fprintf(stderr, "Failed to destroy vduse device %s: %s\n",
> >> >> > +                name, strerror(errno));
> >> >> > +    }
> >> >> >  err_dev:
> >> >> >      close(ctrl_fd);
> >> >> >  err_ctrl:
> >> >>
> >> >> Both errors are during cleanup that can't fail.  The program continues
> >> >> as if they didn't happen.  Does the user need to know?
> >> >>
> >> >
> >> > So I printed some error messages. I didn't find any other good way to
> >> > notify the users.
> >>
> >> I can think of another way, either.  But my question wasn't about "how",
> >> it was about "why".  The answer depends on the impact of these errors.
> >> Which I can't judge.  Can you?
> >>
> >
> > OK, I get your point. Actually users might have no way to handle those
> > errors. And there is no real impact on users since those errors mean
> > the resources have been cleaned up in other places or by other
> > processes. So I choose to ignore this error, but it triggers a
> > Coverity warning.
>
> If we genuinely want to ignore errors from ioctl(), we can mark the
> Coverity complaint as false positive.
>

OK, if so, I think I can drop this patch.

Thanks,
Yongji

