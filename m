Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A494CC24E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:08:26 +0100 (CET)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPo09-000413-3h
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nPncF-00026K-RJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:43:48 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=45744
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nPncC-000227-UP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:43:43 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id w16so10992618ybi.12
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M1xZP6LCwyyJZ5arzrH9t05A5QkiXhpNeEFEAe6zgso=;
 b=XPmTXdTgL4XomgCeFpOfeZ4CE12mrjjRlIajKqBz6yol6CWyRQ7dUPXX6QztXuR+Ql
 vis04WB7Vv9scogEKe7sp59Dd+d7GdCwzLw008FWVLhQIKSASwSq262klxw9BY6YLqXD
 Og7sAm92g0TWU36i7BA52UBDcSQLqieNY2R0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1xZP6LCwyyJZ5arzrH9t05A5QkiXhpNeEFEAe6zgso=;
 b=mP8dyKMBY/x7Y60/GIFCTa2p2bWyUHJvpw+NaTFgqM9G185qT3TEpvgD6u/BQ9ASfG
 O9sIDRS2bnm/nbxrS0PGkaCmf1amgQfErZcUlBXkTA/9+zttDSykN1NuebGZG9e5707Y
 JWuTxLU0jRpRNQ2Yfx+f64UsQ3Y/bsvQZgAjYTApn0BjR6djp3OB5rw11zLyxJz4Ma/Z
 zP9FKAUQlIEx3b3qF3AxZkgwVJYB6oHNZ8KZZLWeGC8gBZBdIyrMF5iHK4fS/XD1Qf/U
 fkXXa5CN97DkLvX+AMctlQrjjB9CwVjV3Xez9zM5Q3fZxcSgCiZp62bQqQ9HqqcOeqel
 Jf5w==
X-Gm-Message-State: AOAM533cSI+PuAwj5bBfzMnOURDds5lJS3dw1X7qSF624fTeqPfM5oaj
 +8M0IinLmXy4vx3yruasc+bzDItiDZlfoBZNQiRzkw==
X-Google-Smtp-Source: ABdhPJz9rAXrlZ/zmrxZVtQXfUytPL/qAml1dkWLfdAEHhU5/F80tcI99enjgrTyv6vFioDd7VoI0RwgCYuCbNqooCA=
X-Received: by 2002:a25:ad48:0:b0:628:7267:e772 with SMTP id
 l8-20020a25ad48000000b006287267e772mr15559876ybe.286.1646322216191; Thu, 03
 Mar 2022 07:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
 <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
 <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
 <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
 <7b4e06fe-4d10-0870-5d6e-d2e70d7eb3a2@gmail.com>
 <CAGmdLqTqcESsiyTMavKZ3U8=5yPtqdq2tunZTH-tfrzwfUMGug@mail.gmail.com>
 <e5302fba-e773-c56d-388f-a3593bacd977@gmail.com>
In-Reply-To: <e5302fba-e773-c56d-388f-a3593bacd977@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Thu, 3 Mar 2022 18:43:25 +0300
Message-ID: <CAGmdLqRCSYzjWBT7OhfP-hZHYwP8F3=4hpwQ+E76ShxjmRTO5Q@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu Developers <qemu-devel@nongnu.org>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Markus Armbruster <armbru@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Roman Bolshakov <roman@roolebo.dev>, 
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000e1ec1005d95242b9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000e1ec1005d95242b9
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 11:21 AM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:
> >      > Not sure that only one field is enough, cause
> >      > we may have two states on bh execution start:
> >      > 1. There are packets in vmnet buffer s->packets_buf
> >      >      that were rejected by qemu_send_async and waiting
> >      >      to be sent. If this happens, we should complete sending
> >      >      these waiting packets with qemu_send_async firstly,
> >      >      and after that we should call vmnet_read to get
> >      >      new ones and send them to QEMU;
> >      > 2. There are no packets in s->packets_buf to be sent to
> >      >      qemu, we only need to get new packets from vmnet
> >      >      with vmnet_read and send them to QEMU
> >
> >     In case 1, you should just keep calling qemu_send_packet_async.
> >     Actually
> >     qemu_send_packet_async adds the packet to its internal queue and
> calls
> >     the callback when it is consumed.
> >
> >
> > I'm not sure we can keep calling qemu_send_packet_async,
> > because as docs from net/queue.c says:
> >
> > /* [...]
> >   * If a sent callback is provided to send(), the caller must handle a
> >   * zero return from the delivery handler by not sending any more packets
> >   * until we have invoked the callback. Only in that case will we queue
> >   * the packet.
> >   *
> >   * If a sent callback isn't provided, we just drop the packet to avoid
> >   * unbounded queueing.
> >   */
> >
> > So after we did vmnet_read and read N packets
> > into temporary s->packets_buf, we begin calling
> > qemu_send_packet_async. If it returns 0 - it says
> > "no more packets until sent_cb called please".
> > At this moment we have N packets in s->packets_buf
> > and already queued K < N of them. But, packets K..N
> > are not queued and keep waiting for sent_cb to be sent
> > with qemu_send_packet_async.
> > Thus when sent_cb called, we should finish
> > our transfer of packets K..N from s->packets_buf
> > to qemu calling qemu_send_packet_async.
> > I meant this.
>
> I missed the comment. The description is contradicting with the actual
> code; qemu_net_queue_send_iov appends the packet to the queue whenever
> it cannot send one immediately.
>
>
Yes, it appends, but (net/queue.c):
*  qemu_net_queue_send tries to deliver the packet
    immediately. If the packet cannot be delivered, the
    qemu_net_queue_append is called and 0 is returned
    to say the caller "the receiver is not ready, hold on";
*  qemu_net_queue_append does a probe before adding
    the packet to the queue:
    if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
        return; /* drop if queue full and no callback */
    }

The queue is not infinite, so we have three cases:
1. The queue is not full -> append the packet, no
    problems here
2. The queue is full, no callback -> we cannot notify
    a caller when we're ready, so just drop the packet
    if we can't append it.
3. The queue is full, callback present -> we can notify
    a caller when we are ready, so "let's queue this packet,
    but expect no more (!) packets is sent until I call
    sent_cb when the queue is ready"

Therefore if we provide a callback and keep sending
packets if 0 is returned, this may cause unlimited(!)
queue growth. To prevent this, we should stop sending
packets and wait for notification callback to continue.

I don't see any contradiction with that comment.

Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if
> calling qemu_send_packet_async is allowed after it returns 0?
>
>
It may be wrong, but I think it's not allowed to send
packets after qemu_send_packet_async returns 0.

Jason Wang, can you confirm please?

Best Regards,

Vladislav Yaroshchuk


> Regards,
> Akihiko Odaki
>

--000000000000e1ec1005d95242b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 1, 2022 at 11:21 AM Akihi=
ko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Not sure that only one field is enough, cause=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; we may have two states on bh execution start:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1. There are packets in vmnet buffer s-&gt;pa=
ckets_buf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 that were rejected by qem=
u_send_async and waiting<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 to be sent. If this happe=
ns, we should complete sending<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 these waiting packets wit=
h qemu_send_async firstly,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 and after that we should =
call vmnet_read to get<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 new ones and send them to=
 QEMU;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2. There are no packets in s-&gt;packets_buf =
to be sent to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 qemu, we only need to get=
 new packets from vmnet<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 with vmnet_read and send =
them to QEMU<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In case 1, you should just keep calling qemu_send_p=
acket_async.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Actually<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_send_packet_async adds the packet to its inter=
nal queue and calls<br>
&gt;=C2=A0 =C2=A0 =C2=A0the callback when it is consumed.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m not sure we can keep calling qemu_send_packet_async,<br>
&gt; because as docs from=C2=A0net/queue.c says:<br>
&gt; <br>
&gt; /* [...]<br>
&gt;=C2=A0 =C2=A0* If a sent callback is provided to send(), the caller mus=
t handle a<br>
&gt;=C2=A0 =C2=A0* zero return from the delivery handler by not sending any=
 more packets<br>
&gt;=C2=A0 =C2=A0* until we have invoked the callback. Only in that case wi=
ll we queue<br>
&gt;=C2=A0 =C2=A0* the packet.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* If a sent callback isn&#39;t provided, we just drop the =
packet to avoid<br>
&gt;=C2=A0 =C2=A0* unbounded queueing.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; <br>
&gt; So after we did vmnet_read and read N packets<br>
&gt; into temporary s-&gt;packets_buf, we begin calling<br>
&gt; qemu_send_packet_async. If it returns 0 - it says<br>
&gt; &quot;no more packets until sent_cb called please&quot;.<br>
&gt; At this moment we have N packets in s-&gt;packets_buf<br>
&gt; and already queued K &lt; N of them. But, packets K..N<br>
&gt; are not queued and keep waiting for sent_cb to be sent<br>
&gt; with qemu_send_packet_async.<br>
&gt; Thus when sent_cb called, we should finish<br>
&gt; our transfer of packets K..N from s-&gt;packets_buf<br>
&gt; to qemu calling qemu_send_packet_async.<br>
&gt; I meant this.<br>
<br>
I missed the comment. The description is contradicting with the actual <br>
code; qemu_net_queue_send_iov appends the packet to the queue whenever <br>
it cannot send one immediately.<br>
<br></blockquote><div><br></div><div>Yes, it appends, but (net/queue.c):</d=
iv><div>*=C2=A0 qemu_net_queue_send=C2=A0tries to deliver the packet<br>=C2=
=A0 =C2=A0 immediately. If the packet cannot be delivered, the<br>=C2=A0 =
=C2=A0 qemu_net_queue_append is called and 0 is returned<br>=C2=A0 =C2=A0 t=
o say the caller &quot;the receiver is not ready, hold on&quot;;</div><div>=
*=C2=A0 qemu_net_queue_append=C2=A0does a probe before adding<br>=C2=A0 =C2=
=A0 the packet to the queue:=C2=A0<br></div><div>=C2=A0 =C2=A0 if (queue-&g=
t;nq_count &gt;=3D queue-&gt;nq_maxlen &amp;&amp; !sent_cb) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return; /* drop if queue full and no callback */<br>=C2=
=A0 =C2=A0 }</div><div><br>The queue is not infinite, so we have three case=
s:<br>1. The queue is not full -&gt; append the packet, no<br>=C2=A0 =C2=A0=
 problems here<br>2. The queue is full, no callback -&gt; we cannot notify<=
br>=C2=A0 =C2=A0 a caller when we&#39;re ready, so just drop the packet<br>=
=C2=A0 =C2=A0 if we can&#39;t append it.<br>3. The queue is full, callback =
present -&gt; we can notify<br>=C2=A0 =C2=A0 a caller when we are ready, so=
 &quot;let&#39;s queue this packet,<br>=C2=A0 =C2=A0 but expect no more (!)=
 packets is sent until I call<br>=C2=A0 =C2=A0 sent_cb when the queue is re=
ady&quot;<br>=C2=A0=C2=A0</div><div>Therefore if we provide a callback and =
keep sending=C2=A0</div><div>packets if 0 is returned, this may cause unlim=
ited(!)</div><div>queue growth. To prevent this, we should stop sending<br>=
packets and wait for=C2=A0notification callback to continue.<br><br>I don&#=
39;t see any contradiction with that comment.</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if <br>
calling qemu_send_packet_async is allowed after it returns 0?<br>
<br></blockquote><div><br></div><div>It may be wrong, but I think it&#39;s =
not allowed to send<br>packets after qemu_send_packet_async returns 0.<br><=
br>Jason Wang, can you confirm please?<br><br><div>Best Regards,</div><div>=
<br>Vladislav Yaroshchuk=C2=A0</div></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br></blockquote><div><br></div><div><br></div></div></div>

--000000000000e1ec1005d95242b9--

