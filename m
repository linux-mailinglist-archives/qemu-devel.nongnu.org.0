Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A42B7648
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 07:27:31 +0100 (CET)
Received: from localhost ([::1]:53076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfGwD-0008Jq-S7
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 01:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kfGul-0007ti-Mv
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:26:00 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kfGui-0007NF-KI
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:25:58 -0500
Received: by mail-oi1-x244.google.com with SMTP id m143so1033569oig.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qzjaOxq+O36Qoa7Z1KDpy3FBBCKtjJ3X9UOulodouJE=;
 b=I9q3QgcbobYICmK6NBoMaIBKK+KS1szAp2fSSm+SZ+cXliOZVzbQr+fOfygFfVYX2D
 BI6K3AJUxomcy08yWTqweC+VMQ8bp+r1yVnvCe1HiqZ4W4fuRb+7hQZ+qrBgqU5LPU/Z
 NCye4SxNL7r4FgPeWRrur1wXRnv1UVSc441O4pZ2cx76hvTEU7IHwrX/kGJGenf+ecKo
 UrQiOvz6poZrrG1pNNTZqflmCe72wH4F9iQlMgpcZ8No/SMLWEgHFPHxSntfXsbBzqm9
 Lu2Y0UnKL5gD4QJajA+GDIatvX8C61H/9X/Sq+XaF6b1RYDnZdexE+9UOTHko5IqLrwB
 wRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzjaOxq+O36Qoa7Z1KDpy3FBBCKtjJ3X9UOulodouJE=;
 b=ACA5gIvWu3Vp/LInfCk718YihGBm5w/VydBi54/H+vYxtndZwOyqMorx1GJSaGV08X
 ipZMGm8FF8Pbg/J5X3+/B7OdBd6m5glWxhVSxtWGNnCRHuwscs/xoKDFuVO9GhDtIAwX
 o9X8bGYIkQCPVomv4Z4JfgH/9DGMPZOYV1zIo151LZGxIZ2gKbNOomfk+vXmjcd3N2Qa
 F3CYY5Ov+EJvJvlWnGycjZsDc06+lnj17cHVVvU6xmC2QRxkUgtAxmUYCqkaZzcUwJd8
 qR/hbXrJ4ehPUQk/W0yPc89WJX/JELRW0q4pic6ZIDPdtTQAUlgVdL897A2Twzbniqcc
 Mgvg==
X-Gm-Message-State: AOAM5328rII3s5qZZHe3Q98zS1QsI+qiwGf/0FKJj+V0fKWNewAtj2FS
 rr8TKcMyzpSFGiOs3LGlpOBOH/xcIcTCEdiRUEWKyQ==
X-Google-Smtp-Source: ABdhPJyRx93qSOyPto4yYq1nUYxVqu2zQC7wD53yBPdwud9jFSG6GdfwKm7WHlGv9S75qjxjQc4SLqUCwuu/c4R4xSQ=
X-Received: by 2002:aca:8c1:: with SMTP id 184mr1847902oii.137.1605680754661; 
 Tue, 17 Nov 2020 22:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20201112094653.20255-1-yuri.benditovich@daynix.com>
 <5d0d2522-43e4-e0c4-7667-12e723858be0@redhat.com>
In-Reply-To: <5d0d2522-43e4-e0c4-7667-12e723858be0@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 18 Nov 2020 08:25:41 +0200
Message-ID: <CAOEp5OetSKWKea+F6P07J_mrG5F2+xx+ds3g_BJ+g6wAMqeixw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: purge queued rx packets on queue deletion
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000001316805b45baf7a"
Received-SPF: none client-ip=2607:f8b0:4864:20::244;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000001316805b45baf7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason,
Sorry, there is a mistake in the title: should be 'net' instead of
'virtio-net'.
Can you please fix it?

Thanks,
Yuri Benditovich


On Wed, Nov 18, 2020 at 5:59 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2020/11/12 =E4=B8=8B=E5=8D=885:46, Yuri Benditovich wrote:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1829272
> > When deleting queue pair, purge pending RX packets if any.
> > Example of problematic flow:
> > 1. Bring up q35 VM with tap (vhost off) and virtio-net or e1000e
> > 2. Run ping flood to the VM NIC ( 1 ms interval)
> > 3. Hot unplug the NIC device (device_del)
> >     During unplug process one or more packets come, the NIC
> >     can't receive, tap disables read_poll
> > 4. Hot plug the device (device_add) with the same netdev
> > The tap stays with read_poll disabled and does not receive
> > any packets anymore (tap_send never triggered)
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
>
>
> Applied.
>
> Thanks
>
>
> > ---
> >   net/net.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/net/net.c b/net/net.c
> > index 7a2a0fb5ac..a95b417300 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -411,10 +411,14 @@ void qemu_del_nic(NICState *nic)
> >
> >       qemu_macaddr_set_free(&nic->conf->macaddr);
> >
> > -    /* If this is a peer NIC and peer has already been deleted, free i=
t
> now. */
> > -    if (nic->peer_deleted) {
> > -        for (i =3D 0; i < queues; i++) {
> > -            qemu_free_net_client(qemu_get_subqueue(nic, i)->peer);
> > +    for (i =3D 0; i < queues; i++) {
> > +        NetClientState *nc =3D qemu_get_subqueue(nic, i);
> > +        /* If this is a peer NIC and peer has already been deleted,
> free it now. */
> > +        if (nic->peer_deleted) {
> > +            qemu_free_net_client(nc->peer);
> > +        } else if (nc->peer) {
> > +            /* if there are RX packets pending, complete them */
> > +            qemu_purge_queued_packets(nc->peer);
> >           }
> >       }
> >
>
>

--00000000000001316805b45baf7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jason,<div>Sorry, there is a mistake in the title: shou=
ld be &#39;net&#39; instead of &#39;virtio-net&#39;.</div><div>Can you plea=
se fix it?</div><div><br></div><div>Thanks,</div><div>Yuri Benditovich</div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 18, 2020 at 5:59 AM Jason Wang &lt;<a href=3D"m=
ailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2020/11/12 =E4=B8=8B=E5=8D=885:46, Yuri Benditovich wrote:<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1829272" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1829272</a><br>
&gt; When deleting queue pair, purge pending RX packets if any.<br>
&gt; Example of problematic flow:<br>
&gt; 1. Bring up q35 VM with tap (vhost off) and virtio-net or e1000e<br>
&gt; 2. Run ping flood to the VM NIC ( 1 ms interval)<br>
&gt; 3. Hot unplug the NIC device (device_del)<br>
&gt;=C2=A0 =C2=A0 =C2=A0During unplug process one or more packets come, the=
 NIC<br>
&gt;=C2=A0 =C2=A0 =C2=A0can&#39;t receive, tap disables read_poll<br>
&gt; 4. Hot plug the device (device_add) with the same netdev<br>
&gt; The tap stays with read_poll disabled and does not receive<br>
&gt; any packets anymore (tap_send never triggered)<br>
&gt;<br>
&gt; Signed-off-by: Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich=
@daynix.com" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt;<br>
<br>
<br>
Applied.<br>
<br>
Thanks<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/net.c | 12 ++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/net/net.c b/net/net.c<br>
&gt; index 7a2a0fb5ac..a95b417300 100644<br>
&gt; --- a/net/net.c<br>
&gt; +++ b/net/net.c<br>
&gt; @@ -411,10 +411,14 @@ void qemu_del_nic(NICState *nic)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_macaddr_set_free(&amp;nic-&gt;conf-&gt;=
macaddr);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 /* If this is a peer NIC and peer has already been dele=
ted, free it now. */<br>
&gt; -=C2=A0 =C2=A0 if (nic-&gt;peer_deleted) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; queues; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_free_net_client(qemu_g=
et_subqueue(nic, i)-&gt;peer);<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; queues; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *nc =3D qemu_get_subqueue(=
nic, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If this is a peer NIC and peer has alr=
eady been deleted, free it now. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nic-&gt;peer_deleted) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_free_net_client(nc-&gt=
;peer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (nc-&gt;peer) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if there are RX packets =
pending, complete them */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_purge_queued_packets(n=
c-&gt;peer);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div>

--00000000000001316805b45baf7a--

