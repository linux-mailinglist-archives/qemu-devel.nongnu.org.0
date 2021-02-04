Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB5430F4C9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:21:20 +0100 (CET)
Received: from localhost ([::1]:45514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fVW-00074F-Uq
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1l7fUf-0006TH-KP
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:20:26 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:33200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1l7fUV-0008KW-FE
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:20:19 -0500
Received: by mail-qk1-x72f.google.com with SMTP id x81so3434093qkb.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aVWMu4BQWRyHyd01ehyCVpNb0rwxHTCgoW7Sb+vyrGs=;
 b=nnflVOw1rYD89HVoVW59Wlh+vCmKjuZ2sBSWZmQya7EHHQe9a7V+J2qE/JCFTt25yx
 yr1tfzKFG7KvOnSZkUUQkLfIdBG+YqK136kIBadCgOTFCUkopvwKjJzJtJeThNduUY+4
 oKyQ1vV8IVFqFX1oCD9FNXcG3YlrtTt4G7TEUktkBfL/06k+ttW3P6L1CZtiEj2goEIS
 tKPdqkd9TTHdVeoPICBmPcV78o5pcTzyrtHO2XB5NTGzKa7V8qa5ytPGSFHQYVcgXiQj
 el6foHJV99w5hJ3hEEncZZ2tjLcSkLTe1G3xLtox0rkfT+kirIIHAA/GLq57JV71a11s
 t69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVWMu4BQWRyHyd01ehyCVpNb0rwxHTCgoW7Sb+vyrGs=;
 b=JBg0UghqrH/VzcU+wig4kHugqLhpgwF8gDaASyejDRsRTO/Lh+5txlM5aKFGeh2Dmn
 OEF1h0Du61l2bxBy2cU/iUT0iR9qY9/jYC0RUeCfImJwma3c2pv1nwubKZqVXLXbLTVC
 1uSOt17wKmCXDXMmE0lT2qYa2/nI1/1NH1/CKZoJBRdqTXqRMpf12BU9yD9P9bxIwaza
 Lu5u0hYU2jkT9MdgF/+fiwzln3/8MJ1/dMjZhVLrTMiJDXp3akbTSM4dp8zK5TZTq1qj
 6wdzejCMUECefIPouDDaflJBtki7//tuSdi6gYGxydvXf+zSgaril2yCJBgc7uauwbsh
 Q2rg==
X-Gm-Message-State: AOAM530EQm38kGH7jYOQEDyZnQo/PeMtaLuP6j2GL1DbAC9QQT/MIA9g
 TYYjZ+yo7vT+m90m0llg2GnQm5SPDurSKjJCBsPZEg==
X-Google-Smtp-Source: ABdhPJxzkcUrGt30tFwjALZ2fpuBftaBUaeQCe9Xd0D/4jrifPFFiTb+s+ddOex4QB1pNiJ0UVFpoZAdcYBTkRpspCk=
X-Received: by 2002:a37:b105:: with SMTP id a5mr7470186qkf.83.1612448414377;
 Thu, 04 Feb 2021 06:20:14 -0800 (PST)
MIME-Version: 1.0
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <20201215162119.27360-10-zhangjiachen.jaycee@bytedance.com>
 <20210204121538.GH3039@work-vm>
In-Reply-To: <20210204121538.GH3039@work-vm>
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Date: Thu, 4 Feb 2021 22:20:05 +0800
Message-ID: <CAFQAk7jEsMD_FM0D+MyL4rzDPUOXsRpKw53nPmLoH_7-Tx3pDw@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 9/9] virtiofsd: (work around) Comment
 qsort in inflight I/O tracking
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f54dbb05ba83661c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 QEMU <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f54dbb05ba83661c
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 8:16 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Jiachen Zhang (zhangjiachen.jaycee@bytedance.com) wrote:
> > This is a work around. The qsort function will malloc memory instead of
> use
> > stack memory when the resubmit_num is larger than 64 (total size larger
> than
> > 1024 Bytes). This will cause seccomp kill virtiofsd, so we comment qsort.
> > This work around will not affect the correctness of inflight I/O
> tracking.
> >
> > Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>
> That's an odd hack!   Just follow the audit log to see what seccomp was
> upset by and add the right syscall.
>
> Dave
>
>
We recently found the cause is sysinfo (2). We will revert this and add
sysinfo to the
whitelist in the 2nd version patchset. Thanks!

Jiachen



> > ---
> >  contrib/libvhost-user/libvhost-user.c | 18 ------------------
> >  1 file changed, 18 deletions(-)
> >
> > diff --git a/contrib/libvhost-user/libvhost-user.c
> b/contrib/libvhost-user/libvhost-user.c
> > index 8c97013e59..c226d5d915 100644
> > --- a/contrib/libvhost-user/libvhost-user.c
> > +++ b/contrib/libvhost-user/libvhost-user.c
> > @@ -1167,20 +1167,6 @@ vu_check_queue_msg_file(VuDev *dev, VhostUserMsg
> *vmsg)
> >      return true;
> >  }
> >
> > -static int
> > -inflight_desc_compare(const void *a, const void *b)
> > -{
> > -    VuVirtqInflightDesc *desc0 = (VuVirtqInflightDesc *)a,
> > -                        *desc1 = (VuVirtqInflightDesc *)b;
> > -
> > -    if (desc1->counter > desc0->counter &&
> > -        (desc1->counter - desc0->counter) < VIRTQUEUE_MAX_SIZE * 2) {
> > -        return 1;
> > -    }
> > -
> > -    return -1;
> > -}
> > -
> >  static int
> >  vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
> >  {
> > @@ -1236,10 +1222,6 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
> >              }
> >          }
> >
> > -        if (vq->resubmit_num > 1) {
> > -            qsort(vq->resubmit_list, vq->resubmit_num,
> > -                  sizeof(VuVirtqInflightDesc), inflight_desc_compare);
> > -        }
> >          vq->counter = vq->resubmit_list[0].counter + 1;
> >      }
> >
> > --
> > 2.20.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

--000000000000f54dbb05ba83661c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 4, 2021 at 8:16 PM Dr. Da=
vid Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">* Jiachen Zhang (<a href=3D"mailto:zhangjiachen.jaycee@bytedance.com" t=
arget=3D"_blank">zhangjiachen.jaycee@bytedance.com</a>) wrote:<br>
&gt; This is a work around. The qsort function will malloc memory instead o=
f use<br>
&gt; stack memory when the resubmit_num is larger than 64 (total size large=
r than<br>
&gt; 1024 Bytes). This will cause seccomp kill virtiofsd, so we comment qso=
rt.<br>
&gt; This work around will not affect the correctness of inflight I/O track=
ing.<br>
&gt; <br>
&gt; Signed-off-by: Jiachen Zhang &lt;<a href=3D"mailto:zhangjiachen.jaycee=
@bytedance.com" target=3D"_blank">zhangjiachen.jaycee@bytedance.com</a>&gt;=
<br>
&gt; Signed-off-by: Xie Yongji &lt;<a href=3D"mailto:xieyongji@bytedance.co=
m" target=3D"_blank">xieyongji@bytedance.com</a>&gt;<br>
<br>
That&#39;s an odd hack!=C2=A0 =C2=A0Just follow the audit log to see what s=
eccomp was<br>
upset by and add the right syscall.<br>
<br>
Dave<br>
<br></blockquote><div><br></div><div>We recently found the cause is sysinfo=
 (2). We will revert this and add sysinfo to the</div><div>whitelist in the=
 2nd version patchset. Thanks!</div><div><br></div><div>Jiachen</div><div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; ---<br>
&gt;=C2=A0 contrib/libvhost-user/libvhost-user.c | 18 ------------------<br=
>
&gt;=C2=A0 1 file changed, 18 deletions(-)<br>
&gt; <br>
&gt; diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-=
user/libvhost-user.c<br>
&gt; index 8c97013e59..c226d5d915 100644<br>
&gt; --- a/contrib/libvhost-user/libvhost-user.c<br>
&gt; +++ b/contrib/libvhost-user/libvhost-user.c<br>
&gt; @@ -1167,20 +1167,6 @@ vu_check_queue_msg_file(VuDev *dev, VhostUserMs=
g *vmsg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int<br>
&gt; -inflight_desc_compare(const void *a, const void *b)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 VuVirtqInflightDesc *desc0 =3D (VuVirtqInflightDesc *)a=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *desc1 =3D (VuVirtqInflightDesc *)b;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (desc1-&gt;counter &gt; desc0-&gt;counter &amp;&amp;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 (desc1-&gt;counter - desc0-&gt;counter) &=
lt; VIRTQUEUE_MAX_SIZE * 2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 return -1;<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 static int<br>
&gt;=C2=A0 vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)<br>
&gt;=C2=A0 {<br>
&gt; @@ -1236,10 +1222,6 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *v=
q)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vq-&gt;resubmit_num &gt; 1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qsort(vq-&gt;resubmit_list,=
 vq-&gt;resubmit_num,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof=
(VuVirtqInflightDesc), inflight_desc_compare);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vq-&gt;counter =3D vq-&gt;resubmit_l=
ist[0].counter + 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div></div>

--000000000000f54dbb05ba83661c--

