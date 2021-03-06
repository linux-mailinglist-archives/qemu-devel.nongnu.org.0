Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4F732F76A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 02:03:51 +0100 (CET)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lILMD-0007gy-VD
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 20:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lILJW-0007FI-4C
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 20:01:05 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:36913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lILJO-0000pK-To
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 20:01:00 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id l27so1940898vsj.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 17:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z8IMeqYfD/EQObvyoPEiRyJq2ubmEVOtPhTYh+l5dBc=;
 b=EhvY1uWjGzF/INaDPQBpywDRjbe2+eK+J/AKhhlm8pC8v7fj+q2AMW4zucn1V+NM1m
 KzOGrSTmy4CpdX4qxbvqT+Bb7NLa6rXB4e9YJsGVMXnTA3LjQRkTV+7JLU44pCu/sUvo
 rJCtmZEUf/YaPjtbTHOhBbkeBxIJ9l0LulLjwUaCLoznYiRUA14KyxpRq+EjaJ5Pwl8M
 RYlE671XWcN5yArkATX4nBgVD6+E9j9sHWr2s8qnzgGgKkFREl5Opy6P4MrsSJHpTm1o
 wWC7As1udD5g5mWFV1ArfcAYIgVkMkhvYDiZcLhBMVmiEKwTSCTIB8Dh5SUpYCk/vTvl
 VulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8IMeqYfD/EQObvyoPEiRyJq2ubmEVOtPhTYh+l5dBc=;
 b=Sn3mQ6IX6ZtJ4T7nLzHX6VCtFanImV+lrIbcCiq220ZpzFQI4xjg0ugo1ECcFK+ZYv
 13JKZwIGtLea6JY51nr1855R3WvMy3tgc+wcy/ix0ZqMEINnXCw3O72BQn3NeDRb+wA1
 MlS/E96xm841/jXA6QRvSvhVqockfTyGck3m0UkQq5g9p19TR7Lbh1LTEX5GqtKdUQRC
 m6pFYN1Xb5n6tzwybL9tUMShpuT1uUGcH/SzWsQdlusRg+T0N4Th62l2sjyogVAQ/yEC
 XQ6tQR+g6DrbOuj77VPk3UZVIhMpFedOF/uHm7FG/Q+sulGgSjOTm8io5698D70ZYIAs
 WIAg==
X-Gm-Message-State: AOAM5339FD/5008oTasg72+D53TfsvuR2DyjaAN9YQ3NHsSbcIbKlsyh
 stfmMed8+met8cVQI3KvQpLOqxbl6QtZ9MmHFouDWw==
X-Google-Smtp-Source: ABdhPJw8qpL6VLSZy8Q9gybWEb07Cz3JThqQI9S32cBzdzMnSFJq12GxGd0+OpDM8GJgyDDF2fTMOy+93QZkajTiL8Q=
X-Received: by 2002:a67:f714:: with SMTP id m20mr8097926vso.29.1614992451788; 
 Fri, 05 Mar 2021 17:00:51 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
 <YD/RXfECJ4TshqsT@redhat.com> <20210305212806.kx62ycfr7k4wxdlq@begin>
 <CADPb22Tv0-oXhxu7Fke3hDq+yq1_n5RTcAC4efmZ0iniAUxVQg@mail.gmail.com>
 <20210306001014.zsvg35ku4647wpr4@begin>
In-Reply-To: <20210306001014.zsvg35ku4647wpr4@begin>
From: Doug Evans <dje@google.com>
Date: Fri, 5 Mar 2021 17:00:13 -0800
Message-ID: <CADPb22SXEZx-qvvDNBbb0NbohUWaddYuUvT2zBNH4bFQPp9QZA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000683cb305bcd3bb71"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=dje@google.com; helo=mail-vs1-xe2d.google.com
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

--000000000000683cb305bcd3bb71
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 5, 2021 at 4:10 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> Doug Evans, le ven. 05 mars 2021 16:05:05 -0800, a ecrit:
> > Given that the code is not supposed to be able to know brackets were
> present
> > (they're stripped off early on), what does the above mean w.r.t. the
> guest?
> > For the host we can have "" mean listen on both IPv4 and IPv6
> > (by default, absent extra options like ipv4=off).
> > But what does a guest address of "" mean?
> > IPv4? IPv6? Both?
>
> It cannot really be "both" since it'd need to know.
>
> The 0.0.0.0 address used to mean the dhcp-provided address, and we don't
> have a way to know the ipv6 address used with the stateless selection,
> so I would say that empty address would be just the dhcp-provided
> address. Most probably the guest will pick it up anyway, and guests
> usually listen the same on ipv4 and ipv6, so I'd say empty most probably
> means the user wants to just connect to ipv4 (whatever protocol was used
> to connect to the host).
>


I realize IPv6 obviates the need for a stateful DHCPv6 server.
Alas setting the hostfwd on the command line is *nice*, but it is currently
*impossible* for IPv6: many system's macaddrs are random,
and their IPv6 address is (at least often) derived from their macaddr.
Thus for those systems the hostfwds have to be set up after the guest has
booted enough to announce its address, and then the user can obtain the
address to pass to hostfwd_add either by logging in and running
ifconfig or some such (which can't be done
via ssh from the host with user-mode networking because the hostfwd
doesn't exist yet), or querying the NDP table and hope it's there.
[I'm probably missing a better alternative though, and just haven't come
up with it yet. Is it possible for QEMU to lazily determine the
guest's IPv6 address? I.e., postpone the ""->guest address mapping
until it's needed and then, say, take the first entry in the NDP table?
That feels a bit fragile: what if someone else gets the first entry in
the NDP table? But is that any more fragile than assuming the first
handed out DHCP address is to the guest?  [<<-- Honest question,
can we assume the first handed out DHCP address will necessarily
be the guest?]

Anyways,
If we eventually want a way to say "take this place-holder address
and map it to the guest's IPv6 address" and follow the current spec,
the preferable syntax would be ",ipv4" or ",ipv6" (fortunately that works -
using
",ipv6=off" or ",ipv4=off" is pretty clumsy). And then we'll have to of
course
flag ",ipv4=off,ipv6=off" and ",ipv4=on,ipv6=on" as errors.
But that would mean the defaults for the guest would have to be
different than for the host. E.g.,
host: ",ipv4" means both, whereas
guest: ",ipv4" (ideally) means ipv4 (since both is meaningless)

--000000000000683cb305bcd3bb71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Mar 5, 2021 at 4:10 PM Samuel Thibault &lt;<a href=3D=
"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Doug Evans, le ven. 05 mars 2021 16:05:05 -0800, a ecrit:<br>
&gt; Given that the code is not supposed to be able to know brackets were p=
resent<br>
&gt; (they&#39;re stripped off early on), what does the above mean w.r.t. t=
he guest?<br>
&gt; For the host we can have &quot;&quot; mean listen on both IPv4 and IPv=
6<br>
&gt; (by default, absent extra options like ipv4=3Doff).<br>
&gt; But what does a guest address of &quot;&quot; mean?<br>
&gt; IPv4? IPv6? Both?<br>
<br>
It cannot really be &quot;both&quot; since it&#39;d need to know.<br>
<br>
The 0.0.0.0 address used to mean the dhcp-provided address, and we don&#39;=
t<br>
have a way to know the ipv6 address used with the stateless selection,<br>
so I would say that empty address would be just the dhcp-provided<br>
address. Most probably the guest will pick it up anyway, and guests<br>
usually listen the same on ipv4 and ipv6, so I&#39;d say empty most probabl=
y<br>
means the user wants to just connect to ipv4 (whatever protocol was used<br=
>
to connect to the host).<br></blockquote><div><br></div><div><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">I realize IPv6 obviates =
the need for a stateful DHCPv6 server.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Alas setting the hostfwd on the command line is *ni=
ce*, but it is currently</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">*impossible* for IPv6: many system&#39;s macaddrs are random,</di=
v><div class=3D"gmail_default" style=3D"font-size:small">and their IPv6 add=
ress is (at least often) derived from their macaddr.</div><div class=3D"gma=
il_default" style=3D"font-size:small">Thus for those systems the=C2=A0hostf=
wds=C2=A0have to be set up after the guest has</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">booted enough to announce its address, and =
then the user can obtain the</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">address to pass to hostfwd_add either by logging in and runni=
ng</div><div class=3D"gmail_default" style=3D"font-size:small">ifconfig or =
some such (which can&#39;t be done</div><div class=3D"gmail_default" style=
=3D"font-size:small">via ssh from the host with user-mode networking becaus=
e the hostfwd</div><div class=3D"gmail_default" style=3D"font-size:small">d=
oesn&#39;t exist yet), or querying the NDP table and hope it&#39;s there.</=
div><div class=3D"gmail_default" style=3D"font-size:small">[I&#39;m probabl=
y missing a better alternative though, and just haven&#39;t come</div><div =
class=3D"gmail_default" style=3D"font-size:small">up with it yet. Is it pos=
sible for QEMU to lazily determine the</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">guest&#39;s IPv6 address? I.e., postpone the &quot;=
&quot;-&gt;guest address mapping</div><div class=3D"gmail_default" style=3D=
"font-size:small">until it&#39;s needed and then, say, take the first entry=
 in the NDP table?</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">That feels a bit fragile: what if someone else gets the first entry in<=
/div><div class=3D"gmail_default" style=3D"font-size:small">the NDP table? =
But is that any more fragile than assuming the first</div><div class=3D"gma=
il_default" style=3D"font-size:small">handed out DHCP address is to the gue=
st?=C2=A0 [&lt;&lt;-- Honest question,</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">can we assume the first handed out DHCP address wil=
l necessarily</div><div class=3D"gmail_default" style=3D"font-size:small">b=
e the guest?]</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Anyways,</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">If we eventually =
want a way to say &quot;take this place-holder address</div><div class=3D"g=
mail_default" style=3D"font-size:small">and map it to the guest&#39;s IPv6 =
address&quot; and follow the current spec,</div><div class=3D"gmail_default=
" style=3D"font-size:small">the preferable syntax would be &quot;,ipv4&quot=
; or &quot;,ipv6&quot; (fortunately that works - using</div><div class=3D"g=
mail_default" style=3D"font-size:small">&quot;,ipv6=3Doff&quot; or &quot;,i=
pv4=3Doff&quot; is pretty clumsy). And then we&#39;ll have to of course</di=
v><div class=3D"gmail_default" style=3D"font-size:small">flag &quot;,ipv4=
=3Doff,ipv6=3Doff&quot; and &quot;,ipv4=3Don,ipv6=3Don&quot; as errors.</di=
v><div class=3D"gmail_default" style=3D"font-size:small">But that would mea=
n the defaults for the guest would have to be</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">different than for the host. E.g.,</div><div=
 class=3D"gmail_default" style=3D"font-size:small">host: &quot;,ipv4&quot; =
means both, whereas</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">guest: &quot;,ipv4&quot; (ideally) means ipv4 (since both is meaningle=
ss)</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div></div></div>

--000000000000683cb305bcd3bb71--

