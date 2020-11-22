Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DBB2BC4C3
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 10:47:05 +0100 (CET)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kglxY-0003i0-CO
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 04:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kglwK-0003H9-Qd
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 04:45:49 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kglwH-0004wQ-B8
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 04:45:47 -0500
Received: by mail-pf1-x441.google.com with SMTP id 10so12107020pfp.5
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PTofF/yxtheyxRyf+bMeiLclUaFOJ5b8C2DJXNcA6EA=;
 b=YJJxCWQyPKtAxuH+0QD/YnvvpB1AGvzP4XSXaExbeZzIhCf6RHyL42AkV80PVUfG7u
 QmpHPmGfgw55Hx7uvUnB+bQUnvDSZYnqZLbeYy9JWTRPHkMVuef0JhwvzTby/RPw+hJ6
 Hk4XQOv80SHtdrVbhdhqAgUwu96K4xWsWdtCJjGgRPzbxDCAKEI/IoZBe6cfOlk+e73f
 HBy0pZfhjlFUE2C22ksyla8sw7if+IB6cvDz+zGWXtWM44A9TehlZcixA+XojhZD5LxO
 Gl1oyt6MfR575Rtt6MekAcZ4hD0Sf3Vp44KzLXJZK0bm1i1EsweWlqDoQ8iNdpgUA6fQ
 VInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTofF/yxtheyxRyf+bMeiLclUaFOJ5b8C2DJXNcA6EA=;
 b=fZhffweBwKJAqoJuGVTq78T7shqrUo+d4IYNb5FeoeQ4YUkdqdi2uukx4R+GAa7KNH
 MUB09aQeTwSGkx22WcMq9xbgkUOUQayq1sjg5R8mGKD/OI+zJSTWNIV41VdFAs6bVxjp
 /BWyxmg5JWTAlwbLGK0gQvDCVoflNmGBvuM6T5GlWsm/qChrS3t3szjbEdRuKXXkW377
 yvUOAzzgxqVGeYekTsbBDngVH7XimytWPWhPGYqyv2NYuZIpI+oCVntpgRfZwfMVgIKI
 hVolsYAR9AYF2sPMzWHB3WpkzLDMgh+Taj+RzHaMTOqQcthkInn9l9AyohFM4fkmy11M
 3QAA==
X-Gm-Message-State: AOAM533Utz4FrYiF190HdUHgoSXVQD3TVs9W7+Ihfow1umMoX3F/rZ/g
 BgkvRSuoT26sPZyJ1kfJqijADMCt0APStCM3sd+Ksw==
X-Google-Smtp-Source: ABdhPJwzL5Movt/uNuu9u7Lz/maKZc4uOhIXeiLmckQPYDHsXlG45A6USyH3TZYuPMWtNqr2bJBtJ2dt/AW11xvfTsA=
X-Received: by 2002:aa7:9f0a:0:b029:197:e4a0:4e4d with SMTP id
 g10-20020aa79f0a0000b0290197e4a04e4dmr6935310pfr.68.1606038343591; Sun, 22
 Nov 2020 01:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
In-Reply-To: <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Sun, 22 Nov 2020 12:17:50 +0200
Message-ID: <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Content-Type: multipart/alternative; boundary="000000000000f73b2205b4aef0c5"
Received-SPF: none client-ip=2607:f8b0:4864:20::441;
 envelope-from=andrew@daynix.com; helo=mail-pf1-x441.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f73b2205b4aef0c5
Content-Type: text/plain; charset="UTF-8"

Hi, the bug can be reproduced like that:

> QEMU 5.1.50 monitor - type 'help' for more information
> (qemu) netdev_add
> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
> (qemu) info network
> hub 0
>  \ hub0port1: __org.qemu.net1: index=0,type=user,net=10.0.2.0,restrict=off
>  \ hub0port0: e1000e.0:
> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
> net0:
> index=0,type=tap,ifname=tap0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
> (qemu) netdev_del net0
> (qemu) info network
> hub 0
>  \ hub0port1: __org.qemu.net1: index=0,type=user,net=10.0.2.0,restrict=off
>  \ hub0port0: e1000e.0:
> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
> (qemu) netdev_add
> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
> Try "help netdev_add" for more information
> (qemu) info network
> hub 0
>  \ hub0port1: __org.qemu.net1: index=0,type=user,net=10.0.2.0,restrict=off
>  \ hub0port0: e1000e.0:
> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
> (qemu)
>
>
Its still actual bug - I've checked it with the
master(2c6605389c1f76973d92b69b85d40d94b8f1092c).

On Sat, Nov 21, 2020 at 5:31 PM Yuri Benditovich <
yuri.benditovich@daynix.com> wrote:

>
>
> On Sat, Nov 21, 2020 at 5:24 PM Yuri Benditovich <
> yuri.benditovich@daynix.com> wrote:
>
>>
>>
>> On Fri, Nov 20, 2020 at 2:58 PM Markus Armbruster <armbru@redhat.com>
>> wrote:
>>
>>> Andrew Melnichenko <andrew@daynix.com> writes:
>>>
>>> > Ping
>>> >
>>> > On Thu, Jul 16, 2020 at 6:26 AM <andrew@daynix.com> wrote:
>>> >
>>> >> From: Andrew Melnychenko <andrew@daynix.com>
>>> >>
>>> >> There is an issue, that netdev can't be removed if it was added using
>>> hmp.
>>> >> The bug appears after 08712fcb851034228b61f75bd922863a984a4f60 commit.
>>> >> It happens because of unclear QemuOpts that was created during
>>> >> hmp_netdev_add(), now it uses qmp analog function -
>>> >> qmp_marshal_netdev_add().
>>> >>
>>> >> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>>> >> ---
>>> >>  monitor/hmp-cmds.c | 15 +++------------
>>> >>  1 file changed, 3 insertions(+), 12 deletions(-)
>>> >>
>>> >> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> >> index 2b0b58a336..b747935687 100644
>>> >> --- a/monitor/hmp-cmds.c
>>> >> +++ b/monitor/hmp-cmds.c
>>> >> @@ -1597,19 +1597,10 @@ void hmp_migrate(Monitor *mon, const QDict
>>> *qdict)
>>> >>  void hmp_netdev_add(Monitor *mon, const QDict *qdict)
>>> >>  {
>>> >>      Error *err = NULL;
>>> >> -    QemuOpts *opts;
>>> >> -
>>> >> -    opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict,
>>> &err);
>>> >> -    if (err) {
>>> >> -        goto out;
>>> >> -    }
>>> >> +    QDict *non_constant_dict = qdict_clone_shallow(qdict);
>>> >>
>>> >> -    netdev_add(opts, &err);
>>> >> -    if (err) {
>>> >> -        qemu_opts_del(opts);
>>> >> -    }
>>> >> -
>>> >> -out:
>>> >> +    qmp_marshal_netdev_add(non_constant_dict, NULL, &err);
>>> >> +    qobject_unref(non_constant_dict);
>>> >>      hmp_handle_error(mon, err);
>>> >>  }
>>>
>>> qmp_marshal_netdev_add() uses the QObject input visitor, which feels
>>> wrong for HMP input.
>>>
>>> What exactly is the problem you're trying to solve?  Can you show us a
>>> reproducer?
>>>
>>> The problem was found during work on hotplug/unplug problems with q35
>> run q35 VM with netdev and hotpluggable nic (virtio or e1000e)
>> unplug the nic (device_del)
>> delete the netdev ()
>> add netdev with the same id as before - fail (Duplicated ID)
>>
>> Q35 is not mandatory for reproduction, the same with '-machine pc'
>
>

--000000000000f73b2205b4aef0c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, the bug can be reproduced like that:</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div>QEMU 5.1.50 monitor - type =
&#39;help&#39; for more information<br>(qemu) netdev_add type=3Dtap,id=3Dne=
t0,script=3D/home/and/SRCS/qemu/ifup.sh,downscript=3Dno<br>(qemu) info netw=
ork<br>hub 0<br>=C2=A0\ hub0port1: __org.qemu.net1: index=3D0,type=3Duser,n=
et=3D10.0.2.0,restrict=3Doff<br>=C2=A0\ hub0port0: e1000e.0: index=3D0,type=
=3Dnic,model=3De1000e,macaddr=3D52:54:00:12:34:56<br>dnet0: index=3D0,type=
=3Dnic,model=3Dvirtio-net-pci,macaddr=3D52:54:00:12:34:57<br>net0: index=3D=
0,type=3Dtap,ifname=3Dtap0,script=3D/home/and/SRCS/qemu/ifup.sh,downscript=
=3Dno<br>(qemu) netdev_del net0<br>(qemu) info network<br>hub 0<br>=C2=A0\ =
hub0port1: __org.qemu.net1: index=3D0,type=3Duser,net=3D10.0.2.0,restrict=
=3Doff<br>=C2=A0\ hub0port0: e1000e.0: index=3D0,type=3Dnic,model=3De1000e,=
macaddr=3D52:54:00:12:34:56<br>dnet0: index=3D0,type=3Dnic,model=3Dvirtio-n=
et-pci,macaddr=3D52:54:00:12:34:57<br>(qemu) netdev_add type=3Dtap,id=3Dnet=
0,script=3D/home/and/SRCS/qemu/ifup.sh,downscript=3Dno<br>Try &quot;help ne=
tdev_add&quot; for more information<br>(qemu) info network<br>hub 0<br>=C2=
=A0\ hub0port1: __org.qemu.net1: index=3D0,type=3Duser,net=3D10.0.2.0,restr=
ict=3Doff<br>=C2=A0\ hub0port0: e1000e.0: index=3D0,type=3Dnic,model=3De100=
0e,macaddr=3D52:54:00:12:34:56<br>dnet0: index=3D0,type=3Dnic,model=3Dvirti=
o-net-pci,macaddr=3D52:54:00:12:34:57<br>(qemu) <br><br></div></blockquote>=
<div><br></div><div>Its still actual bug - I&#39;ve checked it with the mas=
ter(2c6605389c1f76973d92b69b85d40d94b8f1092c). </div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 21, 2020=
 at 5:31 PM Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.=
com">yuri.benditovich@daynix.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
at, Nov 21, 2020 at 5:24 PM Yuri Benditovich &lt;<a href=3D"mailto:yuri.ben=
ditovich@daynix.com" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Nov 20, 2020 at 2:58 PM Markus Armbru=
ster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Andrew Melnichenko &lt;<a href=3D"mailto:andrew@daynix.com" target=3D=
"_blank">andrew@daynix.com</a>&gt; writes:<br>
<br>
&gt; Ping<br>
&gt;<br>
&gt; On Thu, Jul 16, 2020 at 6:26 AM &lt;<a href=3D"mailto:andrew@daynix.co=
m" target=3D"_blank">andrew@daynix.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; From: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.com" =
target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; There is an issue, that netdev can&#39;t be removed if it was adde=
d using hmp.<br>
&gt;&gt; The bug appears after 08712fcb851034228b61f75bd922863a984a4f60 com=
mit.<br>
&gt;&gt; It happens because of unclear QemuOpts that was created during<br>
&gt;&gt; hmp_netdev_add(), now it uses qmp analog function -<br>
&gt;&gt; qmp_marshal_netdev_add().<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@day=
nix.com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 monitor/hmp-cmds.c | 15 +++------------<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 12 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
&gt;&gt; index 2b0b58a336..b747935687 100644<br>
&gt;&gt; --- a/monitor/hmp-cmds.c<br>
&gt;&gt; +++ b/monitor/hmp-cmds.c<br>
&gt;&gt; @@ -1597,19 +1597,10 @@ void hmp_migrate(Monitor *mon, const QDict=
 *qdict)<br>
&gt;&gt;=C2=A0 void hmp_netdev_add(Monitor *mon, const QDict *qdict)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;&gt; -=C2=A0 =C2=A0 QemuOpts *opts;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 opts =3D qemu_opts_from_qdict(qemu_find_opts(&quot;=
netdev&quot;), qdict, &amp;err);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 QDict *non_constant_dict =3D qdict_clone_shallow(qd=
ict);<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 netdev_add(opts, &amp;err);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_del(opts);<br>
&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt; -<br>
&gt;&gt; -out:<br>
&gt;&gt; +=C2=A0 =C2=A0 qmp_marshal_netdev_add(non_constant_dict, NULL, &am=
p;err);<br>
&gt;&gt; +=C2=A0 =C2=A0 qobject_unref(non_constant_dict);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 hmp_handle_error(mon, err);<br>
&gt;&gt;=C2=A0 }<br>
<br>
qmp_marshal_netdev_add() uses the QObject input visitor, which feels<br>
wrong for HMP input.<br>
<br>
What exactly is the problem you&#39;re trying to solve?=C2=A0 Can you show =
us a<br>
reproducer?<br><br></blockquote><div>The problem was found during work on h=
otplug/unplug problems with q35</div><div>run q35 VM with netdev and hotplu=
ggable nic (virtio or e1000e)</div><div>unplug the nic (device_del)</div><d=
iv>delete the netdev ()</div><div>add netdev with the same id as before - f=
ail (Duplicated ID)</div><div><br></div></div></div></blockquote><div>Q35 i=
s not mandatory for reproduction, the same with &#39;-machine pc&#39;</div>=
<div><br></div></div></div>
</blockquote></div>

--000000000000f73b2205b4aef0c5--

