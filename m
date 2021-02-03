Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E930D4F6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:36 +0100 (CET)
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7DJ5-0000l6-Ba
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 03:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l7DI3-0000Ej-Bu
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l7DHy-0005Ca-Kt
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 03:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612340004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VJAoHZGtsFON4Beh/u8ciqvyzbyk5o2Ufa1KXYmp6FM=;
 b=OFY/Ly/e2FVi6LQMiW+FLgF6HHnjD7Axc0qa1Hxfhus5kCMKfPADxj4x4i7+W5oeq/XhiZ
 VlxlW6osc5x4YPgwicKoHDlYOAexlqVZU/LUJbWQPxax6iyZ6ZkhWWCWsTOhkp1/QgUWzE
 UCe2uymnqb2nm2DmDckQ3TmB4SAuKeU=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-hb2q1GA3Mp-bV1BGXbwdTQ-1; Wed, 03 Feb 2021 03:13:22 -0500
X-MC-Unique: hb2q1GA3Mp-bV1BGXbwdTQ-1
Received: by mail-io1-f72.google.com with SMTP id e10so8038978ioc.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 00:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJAoHZGtsFON4Beh/u8ciqvyzbyk5o2Ufa1KXYmp6FM=;
 b=BBGk55ivDJX44XMEb9aQlUpjcQQvvKujLjqcZNRbtfngFRcqSqfaret7WIRds6suzQ
 ogbXWmpCPUr4kJI/hgeuQTtg06eNluNxh6wdPvWkDUHWmAvjWiv6DJlUoSrurXdyWB0L
 t0m4ExW5OOfYPUS51CNQ6PZ1t1X4q4NgMfmi9D7/eP9zsagYl/FTr2gzXXlTD+TmF24G
 L5kbRMRDiepQluZyn8aXyXcSU4FiaJFEAuJDCnk4DNwfB+BVd1MFm4ac7uDn0FrQGGVz
 H16bstT/VtcEqYblz3V4Dna+rrzvLXgqBHya2DKLtSDBokeuqhhrEUNHrC44fNNxdPgJ
 tgHw==
X-Gm-Message-State: AOAM532MuSor8XLFCvbI7sVYzf1GObFwcqMdCkVEMoW138law76ltgdA
 /xoYO2IX+WmkrqE14xBsxM+aQwVIZcm4LaQH0+PMUc6ZJ4JvPKYMIkgcfaC+AVzDVIBO9TEYeZz
 sFoXnw5tf7NkwKIrYtY9wE57s78HJnFk=
X-Received: by 2002:a05:6e02:8a6:: with SMTP id
 a6mr1727000ilt.161.1612340001665; 
 Wed, 03 Feb 2021 00:13:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd8QZZLEX+Lzi+GzmSeqQ0FlMxlhEXfW7GS5OuQqvl1KRg4jtSWh4a1BTK3zaNnswaVb4VbiiLwqwc58V9EqM=
X-Received: by 2002:a05:6e02:8a6:: with SMTP id
 a6mr1726992ilt.161.1612340001489; 
 Wed, 03 Feb 2021 00:13:21 -0800 (PST)
MIME-Version: 1.0
References: <161224971122.79781.8594358970645859667.stgit@pasha-ThinkPad-X280>
 <CAMxuvax4eUGGfLH4sQpS4ocD43bsMVFjiFsv2xcywwbXZ0-JJA@mail.gmail.com>
 <1a5d134b-c826-9620-094e-48fc6bb931b0@ispras.ru>
In-Reply-To: <1a5d134b-c826-9620-094e-48fc6bb931b0@ispras.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 3 Feb 2021 12:13:10 +0400
Message-ID: <CAMxuvay_mLwsLB51Ar4-Usu610QnC7VAzD95BFmvL=VumCcRtA@mail.gmail.com>
Subject: Re: [PATCH] char: don't fail when client is not connected
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000bdc9705ba6a29cd"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000bdc9705ba6a29cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 2, 2021 at 11:33 AM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
wrote:

> On 02.02.2021 10:27, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, Feb 2, 2021 at 11:18 AM Pavel Dovgalyuk
> > <pavel.dovgalyuk@ispras.ru <mailto:pavel.dovgalyuk@ispras.ru>> wrote:
> >
> >     This patch checks that ioc is not null before
> >     using it in tcp socket tcp_chr_add_watch function.
> >
> >     Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru
> >     <mailto:Pavel.Dovgalyuk@ispras.ru>>
> >
> >
> > Do you have a backtrace or a reproducer when this happens?
> > thanks
>
> Here is the backtrace:
>
> Thread 4 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
> [Switching to Thread 0x7ffff2506700 (LWP 64988)]
> object_get_class (obj=3Dobj@entry=3D0x0) at ../qom/object.c:999
> 999         return obj->class;
> (gdb) bt
> #0  object_get_class (obj=3Dobj@entry=3D0x0) at ../qom/object.c:999
> #1  0x0000555555b70e26 in QIO_CHANNEL_GET_CLASS (obj=3D0x0) at
> /home/pasha/ispras/qemu-test/include/io/channel.h:29
> #2  qio_channel_create_watch (ioc=3D0x0, condition=3D(G_IO_OUT | G_IO_HUP=
))
> at ../io/channel.c:281
> #3  0x0000555555c1bf9b in qemu_chr_fe_add_watch
>      (be=3Dbe@entry=3D0x555556981648, cond=3Dcond@entry=3D(G_IO_OUT | G_I=
O_HUP),
> func=3Dfunc@entry=3D0x55555597f170 <serial_watch_cb>,
> user_data=3Duser_data@entry=3D0x5555569815a0)
>      at /home/pasha/ispras/qemu-test/include/chardev/char.h:229
> #4  0x000055555597f042 in serial_xmit (s=3Ds@entry=3D0x5555569815a0) at
> ../hw/char/serial.c:265
> #5  0x000055555597f437 in serial_ioport_write (opaque=3D0x5555569815a0,
> addr=3D<optimized out>, val=3D91, size=3D<optimized out>) at
> ../hw/char/serial.c:359
>

Thanks, I don't understand how this could happen.

serial_xmit:
           int rc =3D qemu_chr_fe_write(&s->chr, &s->tsr, 1);

            if ((rc =3D=3D 0 ||
                 (rc =3D=3D -1 && errno =3D=3D EAGAIN)) &&
                s->tsr_retry < MAX_XMIT_RETRY) {
                assert(s->watch_tag =3D=3D 0);
                s->watch_tag =3D
                    qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
                                          serial_watch_cb, s);

The watch is added only if fe_write() returned 0 || -1 with EAGAIN.

But tcp_chr_write() should return -1 with EIO if the state is disconnected
(and ioc is NULL), or other errors on disconnect.

Can you provide a reproducer?

thanks


> >
> >     ---
> >       chardev/char-socket.c |    3 +++
> >       1 file changed, 3 insertions(+)
> >
> >     diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> >     index 213a4c8dd0..cef1d9438f 100644
> >     --- a/chardev/char-socket.c
> >     +++ b/chardev/char-socket.c
> >     @@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Chardev *chr, char
> >     *buf, size_t len)
> >       static GSource *tcp_chr_add_watch(Chardev *chr, GIOCondition cond=
)
> >       {
> >           SocketChardev *s =3D SOCKET_CHARDEV(chr);
> >     +    if (!s->ioc) {
> >     +        return NULL;
> >     +    }
> >           return qio_channel_create_watch(s->ioc, cond);
> >       }
> >
> >
>
>

--0000000000000bdc9705ba6a29cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2, 2021 at 11:33 AM Pav=
el Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru">pavel.dovgaly=
uk@ispras.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 02.02.2021 10:27, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Tue, Feb 2, 2021 at 11:18 AM Pavel Dovgalyuk <br>
&gt; &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru" target=3D"_blank">pav=
el.dovgalyuk@ispras.ru</a> &lt;mailto:<a href=3D"mailto:pavel.dovgalyuk@isp=
ras.ru" target=3D"_blank">pavel.dovgalyuk@ispras.ru</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This patch checks that ioc is not null before<br>
&gt;=C2=A0 =C2=A0 =C2=A0using it in tcp socket tcp_chr_add_watch function.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Pavel Dovgalyuk &lt;<a href=3D"mailt=
o:Pavel.Dovgalyuk@ispras.ru" target=3D"_blank">Pavel.Dovgalyuk@ispras.ru</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Pavel.Dovgalyuk@ispras=
.ru" target=3D"_blank">Pavel.Dovgalyuk@ispras.ru</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Do you have a backtrace or a reproducer when this happens?<br>
&gt; thanks<br>
<br>
Here is the backtrace:<br>
<br>
Thread 4 &quot;qemu-system-x86&quot; received signal SIGSEGV, Segmentation =
fault.<br>
[Switching to Thread 0x7ffff2506700 (LWP 64988)]<br>
object_get_class (obj=3Dobj@entry=3D0x0) at ../qom/object.c:999<br>
999=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return obj-&gt;class;<br>
(gdb) bt<br>
#0=C2=A0 object_get_class (obj=3Dobj@entry=3D0x0) at ../qom/object.c:999<br=
>
#1=C2=A0 0x0000555555b70e26 in QIO_CHANNEL_GET_CLASS (obj=3D0x0) at <br>
/home/pasha/ispras/qemu-test/include/io/channel.h:29<br>
#2=C2=A0 qio_channel_create_watch (ioc=3D0x0, condition=3D(G_IO_OUT | G_IO_=
HUP)) <br>
at ../io/channel.c:281<br>
#3=C2=A0 0x0000555555c1bf9b in qemu_chr_fe_add_watch<br>
=C2=A0 =C2=A0 =C2=A0(be=3Dbe@entry=3D0x555556981648, cond=3Dcond@entry=3D(G=
_IO_OUT | G_IO_HUP), <br>
func=3Dfunc@entry=3D0x55555597f170 &lt;serial_watch_cb&gt;, <br>
user_data=3Duser_data@entry=3D0x5555569815a0)<br>
=C2=A0 =C2=A0 =C2=A0at /home/pasha/ispras/qemu-test/include/chardev/char.h:=
229<br>
#4=C2=A0 0x000055555597f042 in serial_xmit (s=3Ds@entry=3D0x5555569815a0) a=
t <br>
../hw/char/serial.c:265<br>
#5=C2=A0 0x000055555597f437 in serial_ioport_write (opaque=3D0x5555569815a0=
, <br>
addr=3D&lt;optimized out&gt;, val=3D91, size=3D&lt;optimized out&gt;) at <b=
r>
../hw/char/serial.c:359<br></blockquote></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">Thanks, I don&#39;t understand how this =
could happen.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote">serial_xmit:<br></div><div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0 int rc =3D qemu_chr_fe_write(&amp;s-&gt;chr, &amp;s=
-&gt;tsr, 1);<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rc =3D=
=3D 0 ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
rc =3D=3D -1 &amp;&amp; errno =3D=3D EAGAIN)) &amp;&amp;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;tsr_retry &lt; MAX_XMIT_RET=
RY) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(s-&=
gt;watch_tag =3D=3D 0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 s-&gt;watch_tag =3D<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_add_watch(&amp;s-&gt;chr, G_IO_OUT =
| G_IO_HUP,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 serial_watch_cb, s);</div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">The watch is added only if fe_write() returned=
 0 || -1 with EAGAIN.</div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">But tcp_chr_write() should return -1 with EIO if the state=
 is disconnected (and ioc is NULL), or other errors on disconnect.</div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Can you provid=
e a reproducer?</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">thanks<br></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chardev/char-socket.c |=C2=A0 =C2=A0 3 +++<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/chardev/char-socket.c b/chardev/char-s=
ocket.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 213a4c8dd0..cef1d9438f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/chardev/char-socket.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/chardev/char-socket.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -385,6 +385,9 @@ static ssize_t tcp_chr_recv(Cha=
rdev *chr, char<br>
&gt;=C2=A0 =C2=A0 =C2=A0*buf, size_t len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0static GSource *tcp_chr_add_watch(Chardev *c=
hr, GIOCondition cond)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CH=
ARDEV(chr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (!s-&gt;ioc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return qio_channel_create_watc=
h(s-&gt;ioc, cond);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000000bdc9705ba6a29cd--


