Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44333F0C8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:59:18 +0100 (CET)
Received: from localhost ([::1]:54700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVld-0002nT-EQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lMVkk-0002FQ-Lv
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:58:22 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:41776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lMVke-0006Gj-Ct
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:58:19 -0400
Received: by mail-qt1-x831.google.com with SMTP id x9so1251283qto.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HHNLMHWml3+ETB5EKTIw52cmZO7wwFIrbJzsM104Vk=;
 b=1J4ryd+DjpmM7rN+/SIxL7KATATXLyJvUfd50yalw7qYvmJ5boTWapASiC8O6fucGR
 Oe1bw1fy8n6zVRj9BJi0A1VVMppnE4Vy9d9ix23xPClXg2/0+5pws+lvApUzAWxGb77f
 TS8fQbO3n10E5rw79j9kexdhlQfirxQ85nsPm6gjQjoB94EiboRhuNO0BfjN4RtdhFtG
 4BKGxTWaLuG5b83opxXWljXbUSVj7N7vmfZIZ8YME/1jyh8pYRavFJAEtiVQmQeCQdyv
 +MuRNqB9BXNYJzdRQ6l8JJO4yeIiVIMQu4c7aj8bP/CkK9TKa/XJ4QvRS5S/bcjdBFqg
 E4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HHNLMHWml3+ETB5EKTIw52cmZO7wwFIrbJzsM104Vk=;
 b=UfzafDsy7+5m6JQuXgHwpiyE2VRjrtb8Yz96aBZaMJjc7OYPla7ODzBEWG+Jwwv5CR
 Je0ghsLRZjnXpbZNkbK62wbzIZ0HZbyniCM77sqS+5IQjDQLfjl1QYdxdJURjAmi53rL
 HPCwYPh5c4gIFYULkWKIPyWTt5nCfrSyoai7FAsMbHqAPP/Svcq1r4gth6iZWVS1JGJL
 1cErszWMk7MB91gmtG7uk0tZmtVBGmxZITqPlgZfr6X9rqrbJuPXlgEw21oS0BZKEyaS
 wYv72rHmpjEzsgcnlHgZjlCf6JkmjocryHZlbL6fVXpjp8EbcEv/LPgPmXvWG4adZeFS
 lNqg==
X-Gm-Message-State: AOAM531yM5/80MrXxtDXAYdh7cWys3KxLyF1bPEyFQ77Gb7E7oO5JzRr
 nYwp6+oXxPPmBoUruJzZwV+GIERZuUb7L7dL12mHJw==
X-Google-Smtp-Source: ABdhPJzQdwGqB/FgSJXLwyFPBoR6T2r2RpXpXLilDe23AY3/qmv9l9Lqmo2vpiyecPMwGIrdkAGpOGNEqYgKQfxuYcQ=
X-Received: by 2002:ac8:5c44:: with SMTP id j4mr2473220qtj.253.1615985879297; 
 Wed, 17 Mar 2021 05:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
 <YFHUbEdszo4nursr@stefanha-x1.localdomain> <1709993.NBFj2RoZ23@silver>
In-Reply-To: <1709993.NBFj2RoZ23@silver>
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Date: Wed, 17 Mar 2021 20:57:47 +0800
Message-ID: <CAFQAk7jmvzL3tT=7ExcUKyo9SKNdhT29F5y3f4K8YigA08=BWQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon crash
 reconnection
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000004dd13b05bdbb0845"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-qt1-x831.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, slp@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 virtio-fs@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004dd13b05bdbb0845
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 7:50 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 17. M=C3=A4rz 2021 11:05:32 CET Stefan Hajnoczi wrote:
> > On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> > > Thanks for the suggestions. Actually, we choose to save all state
> > > information to QEMU because a virtiofsd has the same lifecycle as its
> > > QEMU master. However, saving things to a file do avoid communication
> with
> > > QEMU, and we no longer need to increase the complexity of vhost-user
> > > protocol. The suggestion to save fds to the systemd is also very
> > > reasonable
> > > if we don't consider the lifecycle issues, we will try it.
> >
> > Hi,
> > We recently discussed crash recovery in the virtio-fs bi-weekly call an=
d
> > I read some of this email thread because it's a topic I'm interested in=
.
>
> I just had a quick fly over the patches so far. Shouldn't there be some
> kind
> of constraint for an automatic reconnection feature after a crash to
> prevent
> this being exploited by ROP brute force attacks?
>
> E.g. adding some (maybe continuously increasing) delay and/or limiting th=
e
> amount of reconnects within a certain time frame would come to my mind.
>
> Best regards,
> Christian Schoenebeck
>
>
>

Thanks, Christian. I am still trying to figure out the details of the ROP
attacks.

However, QEMU's vhost-user reconnection is based on chardev socket
reconnection. The socket reconnection can be enabled by the "--chardev
socket,...,reconnect=3DN" in QEMU command options, in which N means QEMU wi=
ll
try to connect the disconnected socket every N seconds. We can increase N
to increase the reconnect delay. If we want to change the reconnect delay
dynamically, I think we should change the chardev socket reconnection code.
It is a more generic mechanism than vhost-user-fs and vhost-user backend.

By the way, I also considered the socket reconnection delay time in the
performance aspect. As the reconnection delay increase, if an application
in the guest is doing I/Os, it will suffer larger tail latency. And for
now, the smallest delay is 1 second, which is rather large for
high-performance virtual I/O devices today. I think maybe a more performant
and safer reconnect delay adjustment mechanism should be considered in the
future. What are your thoughts?


Jiachen

--0000000000004dd13b05bdbb0845
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 17, 2021 at 7:50 PM Chris=
tian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@cru=
debyte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mittwoch, 17. M=C3=A4rz 2021 11:05:32 CET Stefan Hajnoczi wro=
te:<br>
&gt; On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:<br>
&gt; &gt; Thanks for the suggestions. Actually, we choose to save all state=
<br>
&gt; &gt; information to QEMU because a virtiofsd has the same lifecycle as=
 its<br>
&gt; &gt; QEMU master. However, saving things to a file do avoid communicat=
ion with<br>
&gt; &gt; QEMU, and we no longer need to increase the complexity of vhost-u=
ser<br>
&gt; &gt; protocol. The suggestion to save fds to the systemd is also very<=
br>
&gt; &gt; reasonable<br>
&gt; &gt; if we don&#39;t consider the lifecycle issues, we will try it.<br=
>
&gt; <br>
&gt; Hi,<br>
&gt; We recently discussed crash recovery in the virtio-fs bi-weekly call a=
nd<br>
&gt; I read some of this email thread because it&#39;s a topic I&#39;m inte=
rested in.<br>
<br>
I just had a quick fly over the patches so far. Shouldn&#39;t there be some=
 kind <br>
of constraint for an automatic reconnection feature after a crash to preven=
t <br>
this being exploited by ROP brute force attacks?<br>
<br>
E.g. adding some (maybe continuously increasing) delay and/or limiting the =
<br>
amount of reconnects within a certain time frame would come to my mind.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br></blockquote><div><br></div><div><br></div><div>Thanks,=C2=A0Christian.=
 I am still trying to figure out the details of the ROP attacks.=C2=A0</div=
><div><br></div><div>However, QEMU&#39;s vhost-user reconnection is based o=
n chardev socket reconnection. The socket reconnection can be enabled by th=
e &quot;--chardev socket,...,reconnect=3DN&quot; in QEMU command options, i=
n which N means QEMU will try to connect the disconnected socket every N se=
conds. We can increase N to increase the reconnect delay. If we want to cha=
nge the reconnect delay dynamically, I think we should change the chardev s=
ocket reconnection code. It is a more generic mechanism than vhost-user-fs =
and vhost-user backend.</div><div><br></div><div>By the way, I also conside=
red the socket reconnection delay time in the performance aspect. As the re=
connection delay increase, if an application in the guest is doing I/Os, it=
 will suffer larger tail latency. And for now, the smallest delay is 1 seco=
nd, which is rather large for high-performance virtual I/O devices today. I=
 think maybe a more performant and safer reconnect delay adjustment mechani=
sm should be considered in the future. What are your thoughts?</div><div><b=
r></div><div><br></div><div>Jiachen</div><div><br></div><div>=C2=A0</div></=
div></div>

--0000000000004dd13b05bdbb0845--

