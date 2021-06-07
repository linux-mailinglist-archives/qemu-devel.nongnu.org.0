Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA7539D4EA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:24:13 +0200 (CEST)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8gG-0006iK-Hg
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8dn-0004Ot-1n
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8dk-00035K-1t
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623046895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rb13MJx3FVuXNrPBnv3qwXzKGVCjIbBypefMp4vai7s=;
 b=SmuDdi8sBUzmthpj7U+IcT0+zlX66PxMjDDydn1TR+ZAQ1f/nlshierBntQY0mVx+i2VAN
 2FHp2I53eMEjjs83boEwAZZAEvQetM+kAqJqY4zUKcuNF0QLk2oU+mHswyB8KRzr1/9CR2
 yXhcjWXMSYLQEpNJbTDGlWwq0vLkPiI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-0ZXzJqyWMKmOkNqArW0PuQ-1; Mon, 07 Jun 2021 02:21:31 -0400
X-MC-Unique: 0ZXzJqyWMKmOkNqArW0PuQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 n8-20020a1709067b48b02904171dc68f87so388152ejo.21
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rb13MJx3FVuXNrPBnv3qwXzKGVCjIbBypefMp4vai7s=;
 b=ctzn/vxtaaCBELkgUdNhQiHxrHPaYUvG4wSA5kD6ePY7jaZjyV1Cu/7zTz3XnBK94N
 fYNbVOlFvq2a2igRF5bPDJRqoNKgL0730258u7qvGPK+a7dvxUsnTeY9Q8fd77Yn+vfW
 hdPYJTncwQOHB+DTqIcIgkqrmq4nWBkSOK5aNL6rVJoBdkUu6bfEXw1gyq3/ydrlsDFd
 lFlYkHsptozlyni8YeeLq8tXiDCKIFLsLhG5S/yZc67v3t0bGtrJoGdbu5tVaZMJIZV3
 BkRNw+4uFNzpQZ8snZYka4mPvwVFL3g13YruAcPsSDK4H8AjmQGo0bdoZ0WbVUgZ8pKJ
 f0zw==
X-Gm-Message-State: AOAM532Q4y2+ukj2nvJWGl9gvQEx/DZ52Hp3pnPEfIsQspyr1IU6F4OD
 oiUyITedlPCMlWVmTvkA/5cSZsmHu1pGQyXjXwRM1V/l+Q1aOrG3nCC7k8LdCpcBXgEKOEcKMKj
 BqrHI08CB0dvICKNclovqY843LbB0jjM=
X-Received: by 2002:a17:907:7808:: with SMTP id
 la8mr14301851ejc.13.1623046890762; 
 Sun, 06 Jun 2021 23:21:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw7Mn18G5RXDK5JZWgc4SsHz6ZPxDM2Qk799sr+txW7+yideKscvagLEHZxpZpSmjzPYwLokQPp5t1lP2QrMk=
X-Received: by 2002:a17:907:7808:: with SMTP id
 la8mr14301841ejc.13.1623046890535; 
 Sun, 06 Jun 2021 23:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-11-lulu@redhat.com>
 <08a7316a-688a-faca-df7d-938e522a2423@redhat.com>
In-Reply-To: <08a7316a-688a-faca-df7d-938e522a2423@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 7 Jun 2021 14:20:54 +0800
Message-ID: <CACLfguWwDfMQLvVrn+h2VZHj7Aed6ciA3TSmr=LTmhj1KPYyqQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] virtio-net: add peer_deleted check in
 virtio_net_handle_rx
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005d4e3505c4270d7d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005d4e3505c4270d7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 3, 2021 at 2:58 PM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/6/2 =E4=B8=8A=E5=8D=8811:47, Cindy Lu =E5=86=99=E9=81=93:
> > During the test, We found this function will continue running
> > while the peer is deleted, this will cause the crash. so add
> > check for this. this only exist in  machines type microvm
>
>
> Any idea why it only happens on microvm?
>
>
> >
> > reproduce step :
> > load the VM with
> > qemu-system-x86_64 -M microvm
> > ...
> >      -netdev tap,id=3Dtap0,vhost=3Don,script=3Dno,downscript=3Dno \
> >      -device virtio-net-device,netdev=3Dtap0 \
> > ..
> > enter the VM's console
> > shutdown the VM
> > (gdb) bt
> >
> > 0  0x000055555595b926 in qemu_net_queue_flush (queue=3D0x0) at
> ../net/queue.c:275
>
>
> So which piece of code trigger this? When the nc has a NIC peer we don't
> free it until the NIC is freed.
>
>
> > 1  0x0000555555a046ea in qemu_flush_or_purge_queued_packets
> (nc=3D0x555556ccb920, purge=3Dfalse)
> >      at ../net/net.c:624
> > 2  0x0000555555a04736 in qemu_flush_queued_packets (nc=3D0x555556ccb920=
)
> at ../net/net.c:637
> > 3  0x0000555555ccc01a in virtio_net_handle_rx (vdev=3D0x555557360ed0,
> vq=3D0x7ffff40d6010)
> >      at ../hw/net/virtio-net.c:1401
> > 4  0x0000555555ce907a in virtio_queue_notify_vq (vq=3D0x7ffff40d6010) a=
t
> ../hw/virtio/virtio.c:2346
> > 5  0x0000555555cec07c in virtio_queue_host_notifier_read
> (n=3D0x7ffff40d608c)
> >      at ../hw/virtio/virtio.c:3606
> > 6  0x00005555560376ac in aio_dispatch_handler (ctx=3D0x555556a857e0,
> node=3D0x555556f013d0)
> >      at ../util/aio-posix.c:329
> > 7  0x00005555560377a4 in aio_dispatch_ready_handlers (ctx=3D0x555556a85=
7e0,
> >      ready_list=3D0x7fffffffdfe0) at ../util/aio-posix.c:359
> > 8  0x0000555556038209 in aio_poll (ctx=3D0x555556a857e0, blocking=3Dfal=
se)
> at ../util/aio-posix.c:662
> > 9  0x0000555555e51c6f in monitor_cleanup () at ../monitor/monitor.c:637
> > 10 0x0000555555d2d626 in qemu_cleanup () at ../softmmu/runstate.c:821
> > 11 0x000055555585b19b in main (argc=3D21, argv=3D0x7fffffffe1c8,
> envp=3D0x7fffffffe278)
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/net/virtio-net.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 02033be748..927a808654 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -1397,7 +1397,9 @@ static void virtio_net_handle_rx(VirtIODevice
> *vdev, VirtQueue *vq)
> >   {
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       int queue_index =3D vq2q(virtio_get_queue_index(vq));
> > -
> > +    if (n->nic->peer_deleted) {
> > +        return;
>
>
> This needs to be fixed in the network core instead of virtio-net.
>
> Thanks
>
>
> sure I will fix this problem

> > +    }
> >       qemu_flush_queued_packets(qemu_get_subqueue(n->nic, queue_index))=
;
> >   }
> >
>
>

--0000000000005d4e3505c4270d7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 3, 2021 at 2:58 PM Jason =
Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2021/6/2 =E4=B8=8A=E5=8D=8811:47, Cindy Lu =E5=86=99=E9=81=93:<br=
>
&gt; During the test, We found this function will continue running<br>
&gt; while the peer is deleted, this will cause the crash. so add<br>
&gt; check for this. this only exist in=C2=A0 machines type microvm<br>
<br>
<br>
Any idea why it only happens on microvm?<br>
<br>
<br>
&gt;<br>
&gt; reproduce step :<br>
&gt; load the VM with<br>
&gt; qemu-system-x86_64 -M microvm<br>
&gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -netdev tap,id=3Dtap0,vhost=3Don,script=3Dno,downs=
cript=3Dno \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -device virtio-net-device,netdev=3Dtap0 \<br>
&gt; ..<br>
&gt; enter the VM&#39;s console<br>
&gt; shutdown the VM<br>
&gt; (gdb) bt<br>
&gt;<br>
&gt; 0=C2=A0 0x000055555595b926 in qemu_net_queue_flush (queue=3D0x0) at ..=
/net/queue.c:275<br>
<br>
<br>
So which piece of code trigger this? When the nc has a NIC peer we don&#39;=
t <br>
free it until the NIC is freed.<br>
<br>
<br>
&gt; 1=C2=A0 0x0000555555a046ea in qemu_flush_or_purge_queued_packets (nc=
=3D0x555556ccb920, purge=3Dfalse)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 at ../net/net.c:624<br>
&gt; 2=C2=A0 0x0000555555a04736 in qemu_flush_queued_packets (nc=3D0x555556=
ccb920) at ../net/net.c:637<br>
&gt; 3=C2=A0 0x0000555555ccc01a in virtio_net_handle_rx (vdev=3D0x555557360=
ed0, vq=3D0x7ffff40d6010)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 at ../hw/net/virtio-net.c:1401<br>
&gt; 4=C2=A0 0x0000555555ce907a in virtio_queue_notify_vq (vq=3D0x7ffff40d6=
010) at ../hw/virtio/virtio.c:2346<br>
&gt; 5=C2=A0 0x0000555555cec07c in virtio_queue_host_notifier_read (n=3D0x7=
ffff40d608c)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 at ../hw/virtio/virtio.c:3606<br>
&gt; 6=C2=A0 0x00005555560376ac in aio_dispatch_handler (ctx=3D0x555556a857=
e0, node=3D0x555556f013d0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 at ../util/aio-posix.c:329<br>
&gt; 7=C2=A0 0x00005555560377a4 in aio_dispatch_ready_handlers (ctx=3D0x555=
556a857e0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ready_list=3D0x7fffffffdfe0) at ../util/aio-posix.=
c:359<br>
&gt; 8=C2=A0 0x0000555556038209 in aio_poll (ctx=3D0x555556a857e0, blocking=
=3Dfalse) at ../util/aio-posix.c:662<br>
&gt; 9=C2=A0 0x0000555555e51c6f in monitor_cleanup () at ../monitor/monitor=
.c:637<br>
&gt; 10 0x0000555555d2d626 in qemu_cleanup () at ../softmmu/runstate.c:821<=
br>
&gt; 11 0x000055555585b19b in main (argc=3D21, argv=3D0x7fffffffe1c8, envp=
=3D0x7fffffffe278)<br>
&gt;<br>
&gt; Signed-off-by: Cindy Lu &lt;<a href=3D"mailto:lulu@redhat.com" target=
=3D"_blank">lulu@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/net/virtio-net.c | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c<br>
&gt; index 02033be748..927a808654 100644<br>
&gt; --- a/hw/net/virtio-net.c<br>
&gt; +++ b/hw/net/virtio-net.c<br>
&gt; @@ -1397,7 +1397,9 @@ static void virtio_net_handle_rx(VirtIODevice *v=
dev, VirtQueue *vq)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VirtIONet *n =3D VIRTIO_NET(vdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int queue_index =3D vq2q(virtio_get_queue_in=
dex(vq));<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 if (n-&gt;nic-&gt;peer_deleted) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
<br>
This needs to be fixed in the network core instead of virtio-net.<br>
<br>
Thanks<br>
<br>
<br></blockquote><div>sure I will fix this problem=C2=A0=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_flush_queued_packets(qemu_get_subqueue(=
n-&gt;nic, queue_index));<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div></div>

--0000000000005d4e3505c4270d7d--


