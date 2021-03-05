Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFDD32F58F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 22:53:16 +0100 (CET)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIINn-0000UO-NM
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 16:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lIIMg-0008Ri-9E
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 16:52:06 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:46704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lIIMe-0003aM-7m
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 16:52:05 -0500
Received: by mail-vs1-xe32.google.com with SMTP id p24so1731302vsj.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 13:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HmmEsGzH2HFVqFZK3mrhn3Opfk9dthLeJa8b9LgsjNw=;
 b=JIudGWHJjg0tSMZz/zyzfVbbwhl8v1UAvSkUqz/vA5rI6zIlgAfIbQlgpyPfWWTZOb
 UQuyZ+pdFhrind9/jkHYyLfjqmXlCoBpiMQpbPUkYS/V/qFkUAwMFXc2ZXFq3Z4Aar4N
 dz5E9XS5zf8RYFIrqs676TjUjHoOO5bnUMHF4+gqdzYtPtX6eil2UzOpsT85c7SZZITS
 ITwyqaT4JtKhtac/bZIZFuiRstSIOotIPlc69qkOuWSZCy6l3hc740aU4OcdYHj/xvRO
 Lu/b6AffhtY105Q4Y2olMW3xviubD/glq2XKXYItC/G8qhaOViEtdeyFU+lGqyg2uHr6
 5y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmmEsGzH2HFVqFZK3mrhn3Opfk9dthLeJa8b9LgsjNw=;
 b=Kqbq4N596uxQK8k06OB6Pn/npJSc6czC7pxngunFq0Rr9E6OUUDpsxVfipzUvlCuJP
 xLzb0Z87Vn261wtaSurEFv5smPtsrWc6/TKaVwu+kRS5j2QCCDP+LAKuRpOHesVzMlcZ
 ZQtA1IP6pOBt9M1zVH6SYClcnBghu3u29gbpd0umYThhRLYc2s9tZA+ghD+GRCf/KA+x
 pYo+dQXflZXD4XMekHeBXQBtd2WDdnK8VDc5jLf9RTedhWtlgF7JhguHTOkd5mPWWgfz
 fk3mqejHH+EM7M75GyZjWWq4M6G64ScORTuoDSdBiIzSFtu4dn7LFiwR3pKUE89DVmlp
 QPGw==
X-Gm-Message-State: AOAM530PGZbU1Y6ebFWvF+VhMB4ubHZ24vDa0quEDfIrY9euXYbTaGcP
 NkAt6lz2gOmhkwZDprdGJho/Sa3sYXekR9vtAKXBTA==
X-Google-Smtp-Source: ABdhPJylzZ/e0bSaRgUNmGRucaglJZC4542rDPYH9JwXKZDCQZDWBTF+tklyZij+070rS4HWSBDwhZ1QWvufffva3X4=
X-Received: by 2002:a05:6102:b11:: with SMTP id
 b17mr7986316vst.43.1614981122656; 
 Fri, 05 Mar 2021 13:52:02 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
 <YD/RXfECJ4TshqsT@redhat.com> <20210305212806.kx62ycfr7k4wxdlq@begin>
In-Reply-To: <20210305212806.kx62ycfr7k4wxdlq@begin>
From: Doug Evans <dje@google.com>
Date: Fri, 5 Mar 2021 13:51:25 -0800
Message-ID: <CADPb22S+zaLrGb8ht05p6SosmJKAJUrBfUD5K9FUxSvJuvouLA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002327e505bcd11889"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=dje@google.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000002327e505bcd11889
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 5, 2021 at 1:28 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> Daniel P. Berrang=C3=A9, le mer. 03 mars 2021 18:11:41 +0000, a ecrit:
> > On Wed, Mar 03, 2021 at 10:06:50AM -0800, Doug Evans wrote:
> > > On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <
> samuel.thibault@gnu.org>
> > > wrote:
> > >
> > > > > +  Examples:
> > > > > +  hostfwd_add net0 tcp:127.0.0.1:10022-:22
> > > > > +  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
> > > >
> > > > Yep, that looks good to me.
> > >
> > > Daniel, you wanted me to use inet_parse().
> > > Is the above syntax ok with you?
> > > You must have had some expectation that at least some of
> > > the various flags that inet_parse() recognizes would be needed here.
> >
> > It feels like the ,ipv4=3Don|off,ipv6=3Don|off flags are relevant here,
> > especially in the empty address case. eg
> >
> >    tcp::10022          - attempt to listen on both ipv4 + ipv6
> >    tcp::10022,ipv4=3Doff - listen on default address, but only for ipv6
> >    tcp::10022,ipv6=3Doff - listen on default address, but only for ipv4
> >
> > Basically this ends up bringing the hostfwd stuff into alignment with
> > the way other backends deal with this
>
> I'm fine with this yes, better have a coherent user interface.
>

Cool. Here's the current help text I have:

---snip---
#ifdef CONFIG_SLIRP
    {
        .name       =3D "hostfwd_add",
        .args_type  =3D "arg1:s,arg2:s?",
        .params     =3D "[netdev_id]
[tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport",
        .help       =3D "redirect TCP or UDP connections from host to guest
(requires -net user)",
        .cmd        =3D hmp_hostfwd_add,
    },
#endif
SRST
``hostfwd_add``
  Redirect TCP or UDP connections from host to guest (requires -net user).
  IPv6 addresses are wrapped in square brackets, IPv4 addresses are not.

  Examples:
  hostfwd_add net0 tcp:127.0.0.1:10022-:22
  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22

  Empty host addresses:
  An empty address for the host, expressed as either "" or "[]", is
  interpreted as listen at any address for both IPv4 and IPv6. To listen on
  only IPv4 one can use "0.0.0.0". The equivalent IPv6 address, "[::]", is
  interpreted as listen on both IPv4 and IPv6 addresses. To listen on only
  IPv6 addresses, add ",ipv4=3Doff" to the address. E.g.,
  hostfwd_add net0 tcp::10022,ipv4=3Doff-[fe80::1:2:3:4]:22
  hostfwd_add net0 tcp:[]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22
  hostfwd_add net0 tcp:[::]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22
  And similarly for IPv4 only:
  hostfwd_add net0 tcp::10022,ipv6=3Doff-[fe80::1:2:3:4]:22
  hostfwd_add net0 tcp:[]:10022,ipv6=3Doff-[fe80::1:2:3:4]:22

  Empty guest addresses:
  An empty guest address for IPv4 is translated to the guest's address,
  assuming that the guest is using DHCP to acquire its address.
  Note that Libslirp currently only provides a "stateless" DHCPv6 server, a
  consequence of which is that it cannot do the "addr-any" translation to
the
  guest address that is done for IPv4. In other words, the following is
  currently not supported: hostfwd_add net0 tcp::10022-:22, the guest
  address is required.
ERST
---snip---

Any corrections or suggestions?

--0000000000002327e505bcd11889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Mar 5, 2021 at 1:28 PM Samuel Thibault &lt;<a href=3D=
"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Daniel P. Berrang=C3=A9, le mer. 03 mars 2021 18:11:41 +0000,=
 a ecrit:<br>
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
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l"></div><div class=3D"gmail_default" style=3D"font-size:small">Cool. Here&=
#39;s the current help text I have:</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">---snip---</div>#ifdef CONFIG_SLIRP<br>=C2=A0 =C2=A0 {<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =3D &quot;hostfwd_add&quot=
;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .args_type =C2=A0=3D &quot;arg1:s,arg2:s?=
&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .params =C2=A0 =C2=A0 =3D &quot;[net=
dev_id] [tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport&quot;,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .help =C2=A0 =C2=A0 =C2=A0 =3D &quot;redirect TCP =
or UDP connections from host to guest (requires -net user)&quot;,<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 .cmd =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D hmp_hostfwd_add,<=
br>=C2=A0 =C2=A0 },<br>#endif<br>SRST<br>``hostfwd_add``<br>=C2=A0 Redirect=
 TCP or UDP connections from host to guest (requires -net user).<br>=C2=A0 =
IPv6 addresses are wrapped in square bracke<span class=3D"gmail_default" st=
yle=3D"font-size:small">t</span>s, IPv4 addresses are not.<br><br>=C2=A0 Ex=
amples:<br>=C2=A0 hostfwd_add net0 tcp:127.0.0.1:10022-:22<br>=C2=A0 hostfw=
d_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22<br><br>=C2=A0 Empty host addr=
esses:<br>=C2=A0 An empty address for the host, expressed as either &quot;&=
quot; or &quot;[]&quot;, is<br>=C2=A0 interpreted as listen at any address =
for both IPv4 and IPv6. To listen on<br>=C2=A0 only IPv4 one can use &quot;=
0.0.0.0&quot;. The equivalent IPv6 address, &quot;[::]&quot;, is<br>=C2=A0 =
interpreted as listen on both IPv4 and IPv6 addresses. To listen on only<br=
>=C2=A0 IPv6 addresses, add &quot;,ipv4=3Doff&quot; to the address. E.g.,<b=
r>=C2=A0 hostfwd_add net0 tcp::10022,ipv4=3Doff-[fe80::1:2:3:4]:22<br>=C2=
=A0 hostfwd_add net0 tcp:[]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22<br>=C2=A0 h=
ostfwd_add net0 tcp:[::]:10022,ipv4=3Doff-[fe80::1:2:3:4]:22<br>=C2=A0 And =
similarly for IPv4 only:<br>=C2=A0 hostfwd_add net0 tcp::10022,ipv6=3Doff-[=
fe80::1:2:3:4]:22<br>=C2=A0 hostfwd_add net0 tcp:[]:10022,ipv6=3Doff-[fe80:=
:1:2:3:4]:22<br><br>=C2=A0 Empty guest addresses:<br>=C2=A0 An empty guest =
address for IPv4 is translated to the guest&#39;s address,<br>=C2=A0 assumi=
ng that the guest is using DHCP to acquire its address.<br>=C2=A0 Note that=
 Libslirp currently only provides a &quot;stateless&quot; DHCPv6 server, a<=
br>=C2=A0 consequence of which is that it cannot do the &quot;addr-any&quot=
; translation to the<br>=C2=A0 guest address that is done for IPv4. In othe=
r words, the following is<br>=C2=A0 currently not supported: hostfwd_add ne=
t0 tcp::10022-:22, the guest<br>=C2=A0 address is required.<br>ERST<br><div=
 class=3D"gmail_default" style=3D"font-size:small">---snip---</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Any corrections or suggestions?</div><=
/div></div>

--0000000000002327e505bcd11889--

