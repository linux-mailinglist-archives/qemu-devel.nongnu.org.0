Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9DC33A7B5
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 20:54:57 +0100 (CET)
Received: from localhost ([::1]:56268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLWpE-0005fo-Cd
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 15:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lLWny-0005BS-Pw
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 15:53:38 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lLWnv-0006co-RJ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 15:53:38 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id a12so15278611vsd.3
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 12:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZxpU7UpXBQNG4dcoxC2nhZOdE0UeCZDiX6N+jo3xfuc=;
 b=ctx4CD6FH+Wf6kB10KqTg/EYnwb9hplrq8MFr1vk5nGIPEGHyKNS3Wtt2ce7H2xAMC
 Y7/1YnORK8LXTzofUZmiQgvXjcwVIP75a3gKh3kGRq3DQI7ZXibToJSS6KLXo6AajTnD
 tRwlNPP+wwYiDN82VlRUP1UWw9GvsEdqj1WTOaiBqTNbE8B6w0jK7FrxxR2JA/U15uJn
 h4bfsJykrDsPW2WaP5cZt8n8R43oWs9QucnVd/SIqGPvhPwiPhLQkbOmMwArS62qXyi5
 mWZstyPwvXO0jjWBsHVUDwI4WcogPl4rplxWNrkHbd8qw8OA3REJ+Qr9caLslqTIFHFC
 BWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZxpU7UpXBQNG4dcoxC2nhZOdE0UeCZDiX6N+jo3xfuc=;
 b=QRzJn9FHsVrOxUfCJeXygvhr2mok5etkJPqkKej8P0YapX9U5iTEN4fyqw+m0oFKh6
 USzuW9TUw9cg0eGu3mggiGmyfhI72i6vGscsPIgLibpst1twvFOo4vYNMzQG7wQc6zVc
 hBPFOzG9uGGcrfqFjDHwJtp+06XNmF0ON+b2nLxmM5par/3uCNAYKxpNYJk1lV10dQg2
 4zM9s3oQXFjYPVT7ukBJW4NRaMJmh8CktsBhiEuHZtHB3lstbQ9ta73+Xu0EgRxFw/qJ
 ACHuCxGkKWutfAh4+PUispIgDv3lNNUnxjV3MqvogpB0pB7kp1RtjmgrRLKkoe2yKpp1
 LUzA==
X-Gm-Message-State: AOAM533xiyuC3giS4vHFyWFUI7bo3hqDk+ysPwcuoq1HNcSIO1axiU2f
 2/AvF5vjoz8SjY/LgVaizZQWOJcPbPG/ZYxvsciZJQ==
X-Google-Smtp-Source: ABdhPJxBw0/wd+YPWZK+qymqAB7nb/obh7+ChSddQpaF1LWREQJX5tXGOfPx1f5s46O76tQ2Y5YGsfexoRHr/wNe9aA=
X-Received: by 2002:a05:6102:2270:: with SMTP id
 v16mr3176965vsd.29.1615751613412; 
 Sun, 14 Mar 2021 12:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
 <YD/RXfECJ4TshqsT@redhat.com> <20210305212806.kx62ycfr7k4wxdlq@begin>
 <CADPb22Tv0-oXhxu7Fke3hDq+yq1_n5RTcAC4efmZ0iniAUxVQg@mail.gmail.com>
 <20210306001014.zsvg35ku4647wpr4@begin>
 <CADPb22SXEZx-qvvDNBbb0NbohUWaddYuUvT2zBNH4bFQPp9QZA@mail.gmail.com>
 <20210306192912.wzs5d7pynxztnvxb@begin>
In-Reply-To: <20210306192912.wzs5d7pynxztnvxb@begin>
From: Doug Evans <dje@google.com>
Date: Sun, 14 Mar 2021 12:52:55 -0700
Message-ID: <CADPb22QyMDfwDzaLk1711X+SYxvSKR=m8NTHM1==rkXGLkjoNA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f6d86705bd847cb0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=dje@google.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f6d86705bd847cb0
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 6, 2021 at 11:29 AM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> Hello,
>
> Doug Evans, le ven. 05 mars 2021 17:00:13 -0800, a ecrit:
> > Is it possible for QEMU to lazily determine the guest's IPv6
> > address? I.e., postpone the ""->guest address mapping until it's
> > needed and then, say, take the first entry in the NDP table?
>
> That would probably be possible, yes, by moving the
>
> if (!guest_addr.s_addr) {
>     guest_addr = slirp->vdhcp_startaddr;
> }
>
> from slirp_add_hostfwd() and alike to tcp_connect() and sorecvfrom()
> (along the other sotranslate call).
>
> > That feels a bit fragile: what if someone else gets the first entry in
> > the NDP table? But is that any more fragile than assuming the first
> > handed out DHCP address is to the guest?
>
> I don't think it's really more fragile.
>


Good to know, thanks.


> > [<<-- Honest question, can we assume the first handed out DHCP address
> > will necessarily be the guest?]
>
> It "cannot" be anything else. What could happen is a PXE loader that
> uses DHCP/NDP, and then the OS that does it again.
>
> > But that would mean the defaults for the guest would have to be
> > different than for the host. E.g.,
> > host: ",ipv4" means both,
>
> Why would it mean both? I don't follow you here.
>
> > whereas guest: ",ipv4" (ideally) means ipv4 (since both is meaningless)
>


I guess one has to define:
- how these flags work,
- do they have defaults,
- and if they do have defaults what is the default value?

For the host, neither flag present means "both are on", which could mean,
effectively, that the defaults for
ipv4[={off,on}] and ipv6[={off,on}] are both "on".
[Assuming they have defaults. See above: Do they?
For the guest ipv4=on,ipv6=on is an error.]
But does that then mean that the presence of only "ipv4=on" or "ipv6=on" is
a no-op?
After all, why specify "ipv4=on" at all if it's the default?
I think a reader would get confused if they saw only one of "ipv4=on" or
"ipv6=on"
specified and learned that both were on.
It also means that to specify only one of ipv4 or ipv6 you have to turn the
other off.
It's a bit awkward, but it is consistent and easy to explain (if awkward to
use and read).

On the other hand, for the host, one could, for example,
make these flags tri-state (or call it whatever).
Is specifying only "ipv4=off" the equivalent of specifying only "ipv6=on"?
Presumably it must (it makes the most sense).
There is also the invalid setting of ipv4=off,ipv6=off.
One also needs to specify the order in which the flags are processed,
to define what ipv6=on,ipv6=off means.
Either that or document that specifying them multiple times is undefined.

This is getting a bit verbose to have to explain in documentation,
but it is what it is.
I don't have a say in the decision. I just need to know what to implement.

--000000000000f6d86705bd847cb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Sat, Mar 6, 2021 at 11:29 AM Samuel Thibault &lt;<a href=
=3D"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<=
br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello,<br>
<br>
Doug Evans, le ven. 05 mars 2021 17:00:13 -0800, a ecrit:<br>
&gt; Is it possible for QEMU to lazily determine the guest&#39;s IPv6<br>
&gt; address? I.e., postpone the &quot;&quot;-&gt;guest address mapping unt=
il it&#39;s<br>
&gt; needed and then, say, take the first entry in the NDP table?<br>
<br>
That would probably be possible, yes, by moving the <br>
<br>
if (!guest_addr.s_addr) {<br>
=C2=A0 =C2=A0 guest_addr =3D slirp-&gt;vdhcp_startaddr;<br>
}<br>
<br>
from slirp_add_hostfwd() and alike to tcp_connect() and sorecvfrom()<br>
(along the other sotranslate call).<br>
<br>
&gt; That feels a bit fragile: what if someone else gets the first entry in=
<br>
&gt; the NDP table? But is that any more fragile than assuming the first<br=
>
&gt; handed out DHCP address is to the guest?<br>
<br>
I don&#39;t think it&#39;s really more fragile.<br></blockquote><div><br></=
div><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">G=
ood to know, thanks.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small"></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; [&lt;&lt;-- Honest question, can we assume the first handed out DHCP a=
ddress<br>
&gt; will necessarily be the guest?]<br>
<br>
It &quot;cannot&quot; be anything else. What could happen is a PXE loader t=
hat<br>
uses DHCP/NDP, and then the OS that does it again.<br>
<br>
&gt; But that would mean the defaults for the guest would have to be<br>
&gt; different than for the host. E.g.,<br>
&gt; host: &quot;,ipv4&quot; means both,<br>
<br>
Why would it mean both? I don&#39;t follow you here.<br>
<br>
&gt; whereas guest: &quot;,ipv4&quot; (ideally) means ipv4 (since both is m=
eaningless)<br></blockquote><div><br></div><div><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">I guess one has to define:</div><div =
class=3D"gmail_default" style=3D"font-size:small">- how these flags work,</=
div><div class=3D"gmail_default" style=3D"font-size:small">- do they have d=
efaults,</div><div class=3D"gmail_default" style=3D"font-size:small">- and =
if they do have defaults what is the default value?</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">For the host, neither flag present means &quot;b=
oth are on&quot;, which could mean, effectively, that the defaults for</div=
><div class=3D"gmail_default" style=3D"font-size:small">ipv4[=3D{off,on}] a=
nd ipv6[=3D{off,on}] are both &quot;on&quot;.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">[Assuming they have defaults. See above: Do =
they?</div><div class=3D"gmail_default" style=3D"font-size:small">For the g=
uest ipv4=3Don,ipv6=3Don is an error.]</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">But does that then mean that the presence of only &=
quot;ipv4=3Don&quot; or &quot;ipv6=3Don&quot; is a no-op?<br>After all, why=
 specify &quot;ipv4=3Don&quot; at all if it&#39;s the default?</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I think a reader would get =
confused if they saw only one of &quot;ipv4=3Don&quot; or &quot;ipv6=3Don&q=
uot;</div><div class=3D"gmail_default" style=3D"font-size:small">specified =
and learned that both were on.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">It also means that to specify only one of ipv4 or ipv6 you =
have to turn the other off.</div><div class=3D"gmail_default" style=3D"font=
-size:small">It&#39;s a bit awkward, but it is consistent and easy to expla=
in (if awkward to use and read).</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">On the other hand, for the host, one could, for example,</div><div =
class=3D"gmail_default" style=3D"font-size:small">make these flags tri-stat=
e (or call it whatever).</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Is specifying only &quot;ipv4=3Doff&quot; the equivalent of speci=
fying only &quot;ipv6=3Don&quot;?<br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Presumably it must (it makes the most sense).</div><=
div class=3D"gmail_default" style=3D"font-size:small">There is also the inv=
alid setting of ipv4=3Doff,ipv6=3Doff.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">One also needs to=C2=A0specify the order in which t=
he flags are processed,</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">to define what ipv6=3Don,ipv6=3Doff means.</div><div class=3D"gmai=
l_default" style=3D"font-size:small">Either that or document that specifyin=
g them multiple times is undefined.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">This is getting a bit verbose to have to explain in documentatio=
n,<br></div><div class=3D"gmail_default" style=3D"font-size:small">but it=
=C2=A0is what it is.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I don&#39;t have a say in the decision. I just need to know what to i=
mplement.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div></div=
></div>

--000000000000f6d86705bd847cb0--

