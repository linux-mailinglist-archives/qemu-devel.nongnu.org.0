Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1395032F5D8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 23:22:50 +0100 (CET)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIIqO-0007AC-Jw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 17:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lIIpb-0006kS-E0
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:21:59 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:38127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lIIpV-0008Pb-Dv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:21:59 -0500
Received: by mail-ua1-x92c.google.com with SMTP id y35so1289194uad.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 14:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zPe8lu2TZMlPxhIcgYxZxZ8wKfaB/yTv7p4P5ajzQF8=;
 b=OXoBWFpglM/KwYIKgNG1G9TSikOSREMlcCLRxjtOeMK82I5iRcR1b6qjUPeD4gHt2l
 xSd0BpMU0MDYxNH3W1ulyrie75e5KoW8KXsEIhFwWonSM2nspwc/Az2+qSbdKvxhsavJ
 8CkV2/Hl//L0gDZvGyth7pe+XSFy8tBl4TGFxTrgWi8Wo9i9qCSgvp90xA50Ss/cWRJf
 q4zNEEunGuqSZXccYYYchrt2fEhs6I6U+sun5aXqUjErpuVP+YyLQSfJ7FWSrQ8k6Kyv
 ChpYoU/AoPMh5sGIwvX2qtXqbhO6DojA7QGiXwmydc5ZHAXyHloFTqoEkvSrsK5lIp0Q
 94Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zPe8lu2TZMlPxhIcgYxZxZ8wKfaB/yTv7p4P5ajzQF8=;
 b=uBBogenbkGbv19YK04ZTUXJLvaghfEZM/arrllxk1oDQ9y+oq5W0Y97OaqCZL8NRXC
 36oYv29Z9jqxeGe4IsLjkoP1JY1SghGKgiOw0QrT0W1kWMRSWLc8ymxxuuvmakUx+lmh
 8fgakKUK3eiSwNz3UMo9EPcvUoy+a5FMzGsj/1E5amimHLjmTAc18TU3NT8tdi8XkH3p
 V1VJcJX2i+Hz3fuQypleQf+x341a2M2p6IMZvEF9GVJ4TpCqc6Ei4NQvyeh9jzuAb0Ji
 lVAwfoOQrWpqVWVo8tDom922livnsHvvF3Zp1/DvgkDxWEfdvNniWtqoYA2XV6sHzA52
 3akg==
X-Gm-Message-State: AOAM532tpblawWxLq4NiPtns3/ELl/Z0YBP/BbgzWI2ONh7DGXzGAwQN
 ZS3fDtd2vCfF8F3OzdMRdjZRI6Wwib5PmWXH3Op4jQ==
X-Google-Smtp-Source: ABdhPJwt8xJOEYx6DMCPxTJTZ0WIRsnOxU3vuLcrKQRfLHxyZH111dsgJtCuqTDTGDpPAit9SEAJj3p9X4px8xpBHfM=
X-Received: by 2002:ab0:48c2:: with SMTP id y2mr8088655uac.22.1614982911166;
 Fri, 05 Mar 2021 14:21:51 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
 <YD/RXfECJ4TshqsT@redhat.com> <20210305212806.kx62ycfr7k4wxdlq@begin>
 <CADPb22S+zaLrGb8ht05p6SosmJKAJUrBfUD5K9FUxSvJuvouLA@mail.gmail.com>
In-Reply-To: <CADPb22S+zaLrGb8ht05p6SosmJKAJUrBfUD5K9FUxSvJuvouLA@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Fri, 5 Mar 2021 14:21:13 -0800
Message-ID: <CADPb22T=wRaVkq9d5M5rvBf4JRskziVVhmgzFrU5tD+NzS4GbA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bd8bff05bcd182af"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=dje@google.com; helo=mail-ua1-x92c.google.com
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

--000000000000bd8bff05bcd182af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 5, 2021 at 1:51 PM Doug Evans <dje@google.com> wrote:

> On Fri, Mar 5, 2021 at 1:28 PM Samuel Thibault <samuel.thibault@gnu.org>
> wrote:
>
>> Daniel P. Berrang=C3=A9, le mer. 03 mars 2021 18:11:41 +0000, a ecrit:
>> > On Wed, Mar 03, 2021 at 10:06:50AM -0800, Doug Evans wrote:
>> > > On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <
>> samuel.thibault@gnu.org>
>> > > wrote:
>> > >
>> > > > > +  Examples:
>> > > > > +  hostfwd_add net0 tcp:127.0.0.1:10022-:22
>> > > > > +  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
>> > > >
>> > > > Yep, that looks good to me.
>> > >
>> > > Daniel, you wanted me to use inet_parse().
>> > > Is the above syntax ok with you?
>> > > You must have had some expectation that at least some of
>> > > the various flags that inet_parse() recognizes would be needed here.
>> >
>> > It feels like the ,ipv4=3Don|off,ipv6=3Don|off flags are relevant here=
,
>> > especially in the empty address case. eg
>> >
>> >    tcp::10022          - attempt to listen on both ipv4 + ipv6
>> >    tcp::10022,ipv4=3Doff - listen on default address, but only for ipv=
6
>> >    tcp::10022,ipv6=3Doff - listen on default address, but only for ipv=
4
>> >
>> > Basically this ends up bringing the hostfwd stuff into alignment with
>> > the way other backends deal with this
>>
>> I'm fine with this yes, better have a coherent user interface.
>>
>
> Cool. Here's the current help text I have:
>
> ---snip---
> #ifdef CONFIG_SLIRP
>     {
>         .name       =3D "hostfwd_add",
>         .args_type  =3D "arg1:s,arg2:s?",
>         .params     =3D "[netdev_id]
> [tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport",
>         .help       =3D "redirect TCP or UDP connections from host to gue=
st
> (requires -net user)",
>         .cmd        =3D hmp_hostfwd_add,
>     },
> #endif
> SRST
> ``hostfwd_add``
>   Redirect TCP or UDP connections from host to guest (requires -net user)=
.
>   IPv6 addresses are wrapped in square brackets, IPv4 addresses are not.
>
>   Examples:
>   hostfwd_add net0 tcp:127.0.0.1:10022-:22
>   hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
>
>   Empty host addresses:
>   An empty address for the host, expressed as either "" or "[]", is
>   interpreted as listen at any address for both IPv4 and IPv6. To listen =
on
>   only IPv4 one can use "0.0.0.0". The equivalent IPv6 address, "[::]", i=
s
>   interpreted as listen on both IPv4 and IPv6 addresses. To listen on onl=
y
>   IPv6 addresses, add ",ipv4=3Doff" to the address. E.g.,
>   hostfwd_add net0 tcp::10022,ipv4=3Doff-[fe80::1:2:3:4]:22
>   hostfwd_add net0 tcp:[]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22
>   hostfwd_add net0 tcp:[::]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22
>   And similarly for IPv4 only:
>   hostfwd_add net0 tcp::10022,ipv6=3Doff-[fe80::1:2:3:4]:22
>   hostfwd_add net0 tcp:[]:10022,ipv6=3Doff-[fe80::1:2:3:4]:22
>
>   Empty guest addresses:
>   An empty guest address for IPv4 is translated to the guest's address,
>   assuming that the guest is using DHCP to acquire its address.
>   Note that Libslirp currently only provides a "stateless" DHCPv6 server,=
 a
>   consequence of which is that it cannot do the "addr-any" translation to
> the
>   guest address that is done for IPv4. In other words, the following is
>   currently not supported: hostfwd_add net0 tcp::10022-:22, the guest
>   address is required.
> ERST
> ---snip---
>
> Any corrections or suggestions?
>


For those following along, there are problems with the above help text
(e.g., it's wrong to say "tcp::10022-:22" is not supported, because it
obviously is! - the issue is more nuanced than that).
And I'm sure there are more that I have yet to find.
I'll give reviewers some time to comment on what's there now
before sending an updated proposed text.

--000000000000bd8bff05bcd182af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Mar 5, 2021 at 1:51 PM Doug Evans &lt;<a href=3D"mail=
to:dje@google.com">dje@google.com</a>&gt; wrote:<br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">On Fri, Mar 5, 202=
1 at 1:28 PM Samuel Thibault &lt;<a href=3D"mailto:samuel.thibault@gnu.org"=
 target=3D"_blank">samuel.thibault@gnu.org</a>&gt; wrote:<br></div></div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Daniel P. Berrang=C3=A9, le mer. 03 mars 2021 18:11:41 +0000, a ecrit:<br>
&gt; On Wed, Mar 03, 2021 at 10:06:50AM -0800, Doug Evans wrote:<br>
&gt; &gt; On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault &lt;<a href=3D"ma=
ilto:samuel.thibault@gnu.org" target=3D"_blank">samuel.thibault@gnu.org</a>=
&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; +=C2=A0 Examples:<br>
&gt; &gt; &gt; &gt; +=C2=A0 hostfwd_add net0 tcp:127.0.0.1:10022-:22<br>
&gt; &gt; &gt; &gt; +=C2=A0 hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4=
]:22<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yep, that looks good to me.<br>
&gt; &gt; <br>
&gt; &gt; Daniel, you wanted me to use inet_parse().<br>
&gt; &gt; Is the above syntax ok with you?<br>
&gt; &gt; You must have had some expectation that at least some of<br>
&gt; &gt; the various flags that inet_parse() recognizes would be needed he=
re.<br>
&gt; <br>
&gt; It feels like the ,ipv4=3Don|off,ipv6=3Don|off flags are relevant here=
,<br>
&gt; especially in the empty address case. eg<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 tcp::10022=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - attempt to=
 listen on both ipv4 + ipv6<br>
&gt;=C2=A0 =C2=A0 tcp::10022,ipv4=3Doff - listen on default address, but on=
ly for ipv6<br>
&gt;=C2=A0 =C2=A0 tcp::10022,ipv6=3Doff - listen on default address, but on=
ly for ipv4<br>
&gt; <br>
&gt; Basically this ends up bringing the hostfwd stuff into alignment with<=
br>
&gt; the way other backends deal with this<br>
<br>
I&#39;m fine with this yes, better have a coherent user interface.<br></blo=
ckquote><div><br></div><div style=3D"font-size:small"></div><div style=3D"f=
ont-size:small">Cool. Here&#39;s the current help text I have:</div><div st=
yle=3D"font-size:small"><br></div><div style=3D"font-size:small">---snip---=
</div>#ifdef CONFIG_SLIRP<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 .name =C2=A0 =C2=A0 =C2=A0 =3D &quot;hostfwd_add&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .args_type =C2=A0=3D &quot;arg1:s,arg2:s?&quot;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 .params =C2=A0 =C2=A0 =3D &quot;[netdev_id] [tcp|udp]:=
[hostaddr]:hostport-[guestaddr]:guestport&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 .help =C2=A0 =C2=A0 =C2=A0 =3D &quot;redirect TCP or UDP connections=
 from host to guest (requires -net user)&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .cmd =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D hmp_hostfwd_add,<br>=C2=A0 =C2=A0 }=
,<br>#endif<br>SRST<br>``hostfwd_add``<br>=C2=A0 Redirect TCP or UDP connec=
tions from host to guest (requires -net user).<br>=C2=A0 IPv6 addresses are=
 wrapped in square bracke<span class=3D"gmail_default" style=3D"font-size:s=
mall">t</span>s, IPv4 addresses are not.<br><br>=C2=A0 Examples:<br>=C2=A0 =
hostfwd_add net0 tcp:127.0.0.1:10022-:22<br>=C2=A0 hostfwd_add net0 tcp:[::=
1]:10022-[fe80::1:2:3:4]:22<br><br>=C2=A0 Empty host addresses:<br>=C2=A0 A=
n empty address for the host, expressed as either &quot;&quot; or &quot;[]&=
quot;, is<br>=C2=A0 interpreted as listen at any address for both IPv4 and =
IPv6. To listen on<br>=C2=A0 only IPv4 one can use &quot;0.0.0.0&quot;. The=
 equivalent IPv6 address, &quot;[::]&quot;, is<br>=C2=A0 interpreted as lis=
ten on both IPv4 and IPv6 addresses. To listen on only<br>=C2=A0 IPv6 addre=
sses, add &quot;,ipv4=3Doff&quot; to the address. E.g.,<br>=C2=A0 hostfwd_a=
dd net0 tcp::10022,ipv4=3Doff-[fe80::1:2:3:4]:22<br>=C2=A0 hostfwd_add net0=
 tcp:[]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22<br>=C2=A0 hostfwd_add net0 tcp:=
[::]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22<br>=C2=A0 And similarly for IPv4 o=
nly:<br>=C2=A0 hostfwd_add net0 tcp::10022,ipv6=3Doff-[fe80::1:2:3:4]:22<br=
>=C2=A0 hostfwd_add net0 tcp:[]:10022,ipv6=3Doff-[fe80::1:2:3:4]:22<br><br>=
=C2=A0 Empty guest addresses:<br>=C2=A0 An empty guest address for IPv4 is =
translated to the guest&#39;s address,<br>=C2=A0 assuming that the guest is=
 using DHCP to acquire its address.<br>=C2=A0 Note that Libslirp currently =
only provides a &quot;stateless&quot; DHCPv6 server, a<br>=C2=A0 consequenc=
e of which is that it cannot do the &quot;addr-any&quot; translation to the=
<br>=C2=A0 guest address that is done for IPv4. In other words, the followi=
ng is<br>=C2=A0 currently not supported: hostfwd_add net0 tcp::10022-:22, t=
he guest<br>=C2=A0 address is required.<br>ERST<br><div style=3D"font-size:=
small">---snip---</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">Any corrections or suggestions?</div></div></div></blo=
ckquote><div><br></div><div><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">For those following along, there are problems with the ab=
ove help text</div><div class=3D"gmail_default" style=3D"font-size:small">(=
e.g., it&#39;s wrong to say &quot;tcp::10022-:22&quot; is not supported, be=
cause it</div><div class=3D"gmail_default" style=3D"font-size:small">obviou=
sly is! - the issue is more nuanced than that).</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">And I&#39;m sure there are more that I hav=
e yet to find.</div><div class=3D"gmail_default" style=3D"font-size:small">=
I&#39;ll give reviewers some time to comment on what&#39;s there now</div><=
div class=3D"gmail_default" style=3D"font-size:small">before sending an upd=
ated proposed text.</div></div></div>

--000000000000bd8bff05bcd182af--

