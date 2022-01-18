Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04199492C4B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:26:46 +0100 (CET)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sFo-0006DL-Rc
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n9rco-0006if-57
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:46:26 -0500
Received: from [2607:f8b0:4864:20::936] (port=39810
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n9rcl-0007eg-2N
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:46:25 -0500
Received: by mail-ua1-x936.google.com with SMTP id m15so37893753uap.6
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xCXKPmlsFMG4gntn+kfQ9ReTGeRzf/fESlH4itnk7dg=;
 b=anoB43IWkj8VMAP/pUwjKTFs6mdEQPCXuQhBt64ZuTutb2NiKGNGDqp0kDf19l0Ym5
 Xw0ZWZdJ/ukpF2e0uuKdKTkgIH1jStxg3BNWHeCBdjGRlG9Db/q4pZBMJCJHruk3HRaD
 0lrgK/9GcFMXUAyyLc8YPyWaJVqaENbB2mQrv9LggPOgU7bt7NvLX06VvwSgNpKCK0jp
 +3zoJ+Ao6iDNHapTTLers03qI8jtdXel4P82cl+fXLCKvF5UCvKyYWyPpQOkPy73hNhy
 J1cQ04vsXhvpkXJvyUmwzJn+upw6I65sPFNqXpz8MQ/vMqec88/bkaWWS4Y+vMj9DvEY
 btTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xCXKPmlsFMG4gntn+kfQ9ReTGeRzf/fESlH4itnk7dg=;
 b=DEsmPwczOlDY9KPk8hq4VZQHtmaRyrrQhMv27TZZFViYWjANCeIe6+MBSzcgtUrPTk
 GQSu1IIpJuez/zMMgHuFdurei5jPTXOIS3E8vWlkE1aeYZV2755q5fMc8/JYhBv1kYHl
 +LGblK1XIVL3FbDa7rovvkMEqbY4qHrK0PFUx8XA9a5Pd2M9vnmxJPjYRlgoDm7XT9/N
 qpzUw0bUwtWFUJeifrThiayuTsJcKJYqFbfXhLQ5a6NCpaWgBa/T1zwwEYOc5ozVE+eD
 KD8oZVhtUUKJ4FXPnNV1VB6bd52pdA0OoTRhqK19eqQKsqIPglb2KZkQTB5XpJJGkpCn
 uwYg==
X-Gm-Message-State: AOAM532dIcPRC/AQ556dcYnzcdv7CHPY53esTR/lmVguV6lvfQkHMvM7
 N0mjnoQ1k5Z9zS9DM3XOoBtUmMQoWsHfY9WtVpI=
X-Google-Smtp-Source: ABdhPJwG/II/+Mh180WfdBVtzqkgSkZ/bdpL46XSafCuucqG7UTMSJQ5LVzSLwI1+6LLWuu8EP6wRCHowFkubVobWsc=
X-Received: by 2002:ab0:13ee:: with SMTP id n43mr10189656uae.9.1642524381989; 
 Tue, 18 Jan 2022 08:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <87r19584xc.fsf@dusky.pond.sub.org>
 <CADO9X9TWscKRoJMTNQt+v84xCyc5SX8H71XcGchZ1dNF_WLQtw@mail.gmail.com>
 <87fspl6mdb.fsf@dusky.pond.sub.org>
In-Reply-To: <87fspl6mdb.fsf@dusky.pond.sub.org>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 18 Jan 2022 19:46:11 +0300
Message-ID: <CADO9X9TJMvu+sYRE6o+uUwXm8z53BHUD-9qogZuNxRAjjOtosw@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000052ce1d05d5de0272"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <roman@roolebo.dev>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052ce1d05d5de0272
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 18 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 19:35, Markus Armb=
ruster <armbru@redhat.com>:

> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
>
> > =D0=B2=D1=82, 18 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 18:01, Markus =
Armbruster <armbru@redhat.com>:
> >
> >> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
> >>
> >> > Create separate netdevs for each vmnet operating mode:
> >> > - vmnet-host
> >> > - vmnet-shared
> >> > - vmnet-bridged
> >> >
> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >>
> >> I acked v8 of the QAPI schema part.  You should add Acked-by and
> >> Reviewed-by you receive in later revisions, unless you make changes th=
at
> >> invalidate them.  When in doubt, drop them.
> >>
> >>
> > Oh ok, I'll do that next time.
>
> Thanks :)
>
> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> > index 7fab2e7cd8..b922e2e34f 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -452,6 +452,120 @@
> >> >      '*vhostdev':     'str',
> >> >      '*queues':       'int' } }
> >> >
> >> > +##
> >> > +# @NetdevVmnetHostOptions:
> >> > +#
> >> > +# vmnet (host mode) network backend.
> >> > +#
> >> > +# Allows the vmnet interface to communicate with other vmnet
> >> > +# interfaces that are in host mode and also with the host.
> >> > +#
> >> > +# @start-address: The starting IPv4 address to use for the interfac=
e.
> >> > +#                 Must be in the private IP range (RFC 1918). Must =
be
> >> > +#                 specified along with @end-address and @subnet-mas=
k.
> >> > +#                 This address is used as the gateway address. The
> >> > +#                 subsequent address up to and including end-addres=
s
> are
> >> > +#                 placed in the DHCP pool.
> >> > +#
> >> > +# @end-address: The DHCP IPv4 range end address to use for the
> >> > +#               interface. Must be in the private IP range (RFC
> 1918).
> >> > +#               Must be specified along with @start-address and
> >> > +#               @subnet-mask.
> >> > +#
> >> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> >> > +#               be specified along with @start-address and
> @subnet-mask.
> >> > +#
> >> > +# @isolated: Enable isolation for this interface. Interface isolati=
on
> >> > +#            ensures that vmnet interface is not able to communicat=
e
> >> > +#            with any other vmnet interfaces. Only communication wi=
th
> >> > +#            host is allowed. Available since macOS Big Sur 11.0.
> >>
> >> What happens when the host is too old?
> >>
> >>
> > In this case netdev creation will fail with
> > corresponding message (error_setg() used).
>
> "Available" feels slightly misleading.  It's always available, it just
> doesn't work unless the host OS is new enough.  Suggest something like
> "Requires at least macOS Big Sur 11.0."
>
>
Yep, "Requires" sounds much more suitable. Will update
the description in the next version along with other fixes.

Thank you!

Same for the others.
>
> QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
> [...]
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--00000000000052ce1d05d5de0272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 18 =D1=8F=D0=BD=D0=B2. =
2022 =D0=B3. =D0=B2 19:35, Markus Armbruster &lt;<a href=3D"mailto:armbru@r=
edhat.com">armbru@redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk=
2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt; writes:<=
br>
<br>
&gt; =D0=B2=D1=82, 18 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 18:01, Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">armb=
ru@redhat.com</a>&gt;:<br>
&gt;<br>
&gt;&gt; Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk2000@gmail.co=
m" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Create separate netdevs for each vmnet operating mode:<br>
&gt;&gt; &gt; - vmnet-host<br>
&gt;&gt; &gt; - vmnet-shared<br>
&gt;&gt; &gt; - vmnet-bridged<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yar=
oshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<b=
r>
&gt;&gt;<br>
&gt;&gt; I acked v8 of the QAPI schema part.=C2=A0 You should add Acked-by =
and<br>
&gt;&gt; Reviewed-by you receive in later revisions, unless you make change=
s that<br>
&gt;&gt; invalidate them.=C2=A0 When in doubt, drop them.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Oh ok, I&#39;ll do that next time.<br>
<br>
Thanks :)<br>
<br>
&gt;&gt; &gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt;&gt; &gt; index 7fab2e7cd8..b922e2e34f 100644<br>
&gt;&gt; &gt; --- a/qapi/net.json<br>
&gt;&gt; &gt; +++ b/qapi/net.json<br>
&gt;&gt; &gt; @@ -452,6 +452,120 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&=
#39;str&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;int&#39; } }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +# @NetdevVmnetHostOptions:<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# vmnet (host mode) network backend.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Allows the vmnet interface to communicate with other vmnet=
<br>
&gt;&gt; &gt; +# interfaces that are in host mode and also with the host.<b=
r>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @start-address: The starting IPv4 address to use for the i=
nterface.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Must be in the private IP range (RFC 1918). Must be<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0specified along with @end-address and @subnet-mask.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0This address is used as the gateway address. The<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0subsequent address up to and including end-address are<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0placed in the DHCP pool.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @end-address: The DHCP IPv4 range end address to use for t=
he<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inte=
rface. Must be in the private IP range (RFC 1918).<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must=
 be specified along with @start-address and<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@sub=
net-mask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @subnet-mask: The IPv4 subnet mask to use on the interface=
. Must<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be s=
pecified along with @start-address and @subnet-mask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @isolated: Enable isolation for this interface. Interface =
isolation<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmne=
t interface is not able to communicate<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vm=
net interfaces. Only communication with<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. =
Available since macOS Big Sur 11.0.<br>
&gt;&gt;<br>
&gt;&gt; What happens when the host is too old?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; In this case netdev creation will fail with<br>
&gt; corresponding message (error_setg() used).<br>
<br>
&quot;Available&quot; feels slightly misleading.=C2=A0 It&#39;s always avai=
lable, it just<br>
doesn&#39;t work unless the host OS is new enough.=C2=A0 Suggest something =
like<br>
&quot;Requires at least macOS Big Sur 11.0.&quot;<br>
<br></blockquote><div><br></div><div>Yep, &quot;Requires&quot; sounds much =
more suitable. Will update=C2=A0</div><div>the description in the next vers=
ion along with other fixes.</div><div><br></div><div>Thank you!</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Same for the others.<br>
<br>
QAPI schema<br>
Acked-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt;<br>
<br>
[...]<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div>=
</div>

--00000000000052ce1d05d5de0272--

