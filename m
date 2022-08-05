Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EC58A9C5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:54:59 +0200 (CEST)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuyn-0008Bh-Pn
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oJuu3-0002ul-MP
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:50:04 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oJuu1-0004Vm-Ni
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:50:03 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3246910dac3so20197427b3.12
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xzCFSPf9c7Ya433AJe2wDOELvyyiyg5kqIpd4QOfNYk=;
 b=cK298WYdoZmEA89WBzrkfFcrnYBMATxjk5t6/AdeKBd3L4vPzaNrdss9yMiaxzuLeE
 2fQJl1iSOKIhtw0SJ6cYOVko+JKVJzogO47MAv/IJZgX8goFyhV1nOske45A9wX/dYj2
 uc0tT+qHz0rDIhiTbMfeFJBE5vXKUOHHdPzRXB4Wr4aRdcjWoXkRtwJuPSPesn4hjLsO
 hq4hsI06ivKj/iL59YfcnYTwO7qaW/nka/pASlg13AK19DdEyNgDov/fURcym7raVin4
 aRjg/8SIDQFIlbW3/s6+EUFtJA2VEgtWuMD6Bm90JoT84iQyty6gt/IFx6fMWpCevRnh
 zQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xzCFSPf9c7Ya433AJe2wDOELvyyiyg5kqIpd4QOfNYk=;
 b=H6/j1wlFHp3YB1TKkJbGmFxYQR1/m68EUN4mJMI9DdGrHpNbYgEC4j30DEIpv9JKe0
 hHZ32fznIzIV8qEeqDpcEVUSEwuEACsLPebCHs9h6JkJb4ObVhA9TegA5RWXJADfMB1B
 8Jo4x9zdmlnc83Gkw9ZDnotCsYVl20tZZwmRXOEy+DJm7BkR6KXZSdWLqq54sxd3+2ee
 B4Ukekol4aBagSkZut301XbbScYPTsG4vzSIFjD3XUtSlyvm1xFZIM/DL2bEHObM4ng2
 yHidEV4ii8Juf/NBU1sfd8KMH3tIozhiy5qHivLx20GYB5nSK/zF5BV6QAlvArzjKBGi
 CYdQ==
X-Gm-Message-State: ACgBeo0zJptN/zMEJlDFGpKQ1TwJf58z9nQZSLTsLOk4ZzvF47t2LNFm
 B5o5cVKt0qkk8GEZ9UQWceO1YHxYTmBUqsq4OSY=
X-Google-Smtp-Source: AA6agR4U970JEoyrcUPxHT3liSkWwFI8CdA5kaAT11kwfsQ86/Fl45ULYPNbxICiGSBCYH8ptC+lGG2Up/7lG15kKww=
X-Received: by 2002:a81:8746:0:b0:31d:c5a6:ad8f with SMTP id
 x67-20020a818746000000b0031dc5a6ad8fmr5434978ywf.206.1659696600693; Fri, 05
 Aug 2022 03:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220803162824.948023-1-stefanha@redhat.com>
 <17d794db-4c17-b438-b71b-f6224791a496@redhat.com>
In-Reply-To: <17d794db-4c17-b438-b71b-f6224791a496@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 5 Aug 2022 06:49:47 -0400
Message-ID: <CAJSP0QXMg84qrYSq-aSm272CwXQn1-w2eCvfUQmr=xb5=6LwGw@mail.gmail.com>
Subject: Re: [PATCH] virtio-scsi: fix race in virtio_scsi_dataplane_start()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Qing Wang <qinwang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000051c1f805e57c3a14"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000051c1f805e57c3a14
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 5, 2022, 05:59 Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 8/3/22 18:28, Stefan Hajnoczi wrote:
> > diff --git a/hw/scsi/virtio-scsi-dataplane.c
> b/hw/scsi/virtio-scsi-dataplane.c
> > index 8bb6e6acfc..a575c3f0cd 100644
> > --- a/hw/scsi/virtio-scsi-dataplane.c
> > +++ b/hw/scsi/virtio-scsi-dataplane.c
> > @@ -66,6 +66,21 @@ static int virtio_scsi_set_host_notifier(VirtIOSCSI
> *s, VirtQueue *vq, int n)
> >       return 0;
> >   }
> >
> > +/* Context: BH in IOThread */
> > +static void virtio_scsi_dataplane_start_bh(void *opaque)
> > +{
> > +    VirtIOSCSI *s = opaque;
> > +    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
> > +    int i;
> > +
> > +    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
> > +    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
> > +
> > +    for (i = 0; i < vs->conf.num_queues; i++) {
> > +        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
> > +    }
> > +}
> > +
> >   /* Context: BH in IOThread */
> >   static void virtio_scsi_dataplane_stop_bh(void *opaque)
> >   {
> > @@ -136,16 +151,18 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
> >
> >       memory_region_transaction_commit();
> >
> > -    aio_context_acquire(s->ctx);
> > -    virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
> > -    virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
> > -
> > -    for (i = 0; i < vs->conf.num_queues; i++) {
> > -        virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
> > -    }
> > -
> >       s->dataplane_starting = false;
> >       s->dataplane_started = true;
> > +
> > +    /*
> > +     * Attach notifiers from within the IOThread. It's possible to
> attach
> > +     * notifiers from our thread directly but this approach has the
> advantages
> > +     * that virtio_scsi_dataplane_start_bh() is symmetric with
> > +     * virtio_scsi_dataplane_stop_bh() and the s->dataplane_started
> assignment
> > +     * above doesn't require explicit synchronization.
> > +     */
> > +    aio_context_acquire(s->ctx);
> > +    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_start_bh, s);
> >       aio_context_release(s->ctx);
>
> Taking the AioContext lock for code that is running in another thread
> seems wrong.  But really there is no need to take the lock: I think it
> wanted to protect against the handler running before
> s->dataplane_starting/started were set, but it's not needed now because
> the iothread is busy running the bottom half.
>

The lock must be taken solely because aio_wait_bh_oneshot() requires that
the caller holds it. Emanuele is working on removing the lock from
AIO_WAIT_WHILE() but for now it's necessary to hold the lock.


> Also, please do the same in virtio-blk as well.
>

Okay. There are a few other differences between virtio-scsi and virtio-blk
dataplane code that I'll investigate. Maybe they can share common
start/stop functions.

Stefan

>

--00000000000051c1f805e57c3a14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Aug 5, 2022, 05:59 Paolo Bonzini &lt;<a href=
=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 8/3/22 18:28, Stefan Hajnoczi wrote:<br>
&gt; diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dat=
aplane.c<br>
&gt; index 8bb6e6acfc..a575c3f0cd 100644<br>
&gt; --- a/hw/scsi/virtio-scsi-dataplane.c<br>
&gt; +++ b/hw/scsi/virtio-scsi-dataplane.c<br>
&gt; @@ -66,6 +66,21 @@ static int virtio_scsi_set_host_notifier(VirtIOSCSI=
 *s, VirtQueue *vq, int n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Context: BH in IOThread */<br>
&gt; +static void virtio_scsi_dataplane_start_bh(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VirtIOSCSI *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 VirtIOSCSICommon *vs =3D VIRTIO_SCSI_COMMON(s);<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 virtio_queue_aio_attach_host_notifier(vs-&gt;ctrl_vq, s=
-&gt;ctx);<br>
&gt; +=C2=A0 =C2=A0 virtio_queue_aio_attach_host_notifier_no_poll(vs-&gt;ev=
ent_vq, s-&gt;ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; vs-&gt;conf.num_queues; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_queue_aio_attach_host_notifier(vs-=
&gt;cmd_vqs[i], s-&gt;ctx);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Context: BH in IOThread */<br>
&gt;=C2=A0 =C2=A0static void virtio_scsi_dataplane_stop_bh(void *opaque)<br=
>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -136,16 +151,18 @@ int virtio_scsi_dataplane_start(VirtIODevice *vd=
ev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_transaction_commit();<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 aio_context_acquire(s-&gt;ctx);<br>
&gt; -=C2=A0 =C2=A0 virtio_queue_aio_attach_host_notifier(vs-&gt;ctrl_vq, s=
-&gt;ctx);<br>
&gt; -=C2=A0 =C2=A0 virtio_queue_aio_attach_host_notifier_no_poll(vs-&gt;ev=
ent_vq, s-&gt;ctx);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 for (i =3D 0; i &lt; vs-&gt;conf.num_queues; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_queue_aio_attach_host_notifier(vs-=
&gt;cmd_vqs[i], s-&gt;ctx);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;dataplane_starting =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;dataplane_started =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Attach notifiers from within the IOThread. It&#=
39;s possible to attach<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* notifiers from our thread directly but this app=
roach has the advantages<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* that virtio_scsi_dataplane_start_bh() is symmet=
ric with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* virtio_scsi_dataplane_stop_bh() and the s-&gt;d=
ataplane_started assignment<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* above doesn&#39;t require explicit synchronizat=
ion.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 aio_context_acquire(s-&gt;ctx);<br>
&gt; +=C2=A0 =C2=A0 aio_wait_bh_oneshot(s-&gt;ctx, virtio_scsi_dataplane_st=
art_bh, s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aio_context_release(s-&gt;ctx);<br>
<br>
Taking the AioContext lock for code that is running in another thread <br>
seems wrong.=C2=A0 But really there is no need to take the lock: I think it=
 <br>
wanted to protect against the handler running before <br>
s-&gt;dataplane_starting/started were set, but it&#39;s not needed now beca=
use <br>
the iothread is busy running the bottom half.<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">The lock must be taken solely =
because aio_wait_bh_oneshot() requires that the caller holds it. Emanuele i=
s working on removing the lock from AIO_WAIT_WHILE() but for now it&#39;s n=
ecessary to hold the lock.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Also, please do the same in virtio-blk as well.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Okay. There are a few other =
differences between virtio-scsi and virtio-blk dataplane code that I&#39;ll=
 investigate. Maybe they can share common start/stop functions.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Stefan</div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000051c1f805e57c3a14--

