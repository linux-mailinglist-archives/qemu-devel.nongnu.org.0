Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E204A2BC041
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 16:32:48 +0100 (CET)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgUsa-0004OU-11
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 10:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kgUrk-0003rB-W5
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:31:57 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kgUri-0002Ox-8s
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:31:56 -0500
Received: by mail-oi1-x244.google.com with SMTP id k26so14321671oiw.0
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 07:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0tvY057wV7FqxE4yeWNAUuM5dNmGGEe3F1d01MfN/48=;
 b=w0Av8tEXuQ8q7O4Bi5JH9BFUuMVvZcQpFBuoFq37PuwVG5CjUUGO47Ck/OUPwdEffV
 XraUGXpCcchpghwa/fL9IX+M7liZceZyUmxijNImSf25NAb45q7wJCxDuq36Wx+WWFeR
 nBZE3z+edmQGlhhz5oYgkILUOS63WHbgQ1iE0P7vaFT1VcPgYDaTbpryRr1WnwPi4IUT
 3I7LIdE48kROoXS2E4//qlL1y1/lGPAFGXEKaAUsUI5wRr3F4pZp2FUG5WLoFVOsqaN8
 sceM3v3XzQcq6ICe74mbRLg1UmlUJD8E0In4J5Wk9uC3Ta5EHaGVQQNso9n5+d9b3c9f
 1lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tvY057wV7FqxE4yeWNAUuM5dNmGGEe3F1d01MfN/48=;
 b=PggHa0fPQ6tqA+M1BXI+F2Ops3Su8iyLll84ErrT0yfl4+pfnR1GXi6CpV33P4Jqdm
 NUU4o8+xohlfAUWKBTypTdwpb2NXTSj8GD5KvqEJqxGJo+EDAP4zH16YMHO3GNS/SdoE
 jiyz/ps7x06dfI3ceyS3py0QWzlFGktLOfEm0D57ahHazsXxlkPVOi+TBSfRbwqeJ5CE
 A94dg+7EwLoA4t0r0FtBli7YG3g/jNtq/v40LBXx5YjqCVYetiOEKiwIgUq7A18nTPco
 Uwl17ynsnaJoo0zMjc+xsZYgoZFGXenhrCgilewcHA8Ty0ZdeDzg9KZ1J8aNYkYCo89O
 YLqA==
X-Gm-Message-State: AOAM5318N+dKjF7fleiR6mlA6XnzxEvJ+izQw4flz8KFJI2jNgbcAB5L
 H7uBbCpaI12f/FTNfJckxmJ3nepUhVA9YLuAqkXT1A==
X-Google-Smtp-Source: ABdhPJy/T3IK6FVAC0EfuqfttTdjw4qwGpR59wSnXg1jHMdGrc1oE3W6z/ESqFEAyixNsHXFUF2yO8pn45+6n0lM4io=
X-Received: by 2002:aca:8c1:: with SMTP id 184mr10168314oii.137.1605972712886; 
 Sat, 21 Nov 2020 07:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
In-Reply-To: <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sat, 21 Nov 2020 17:31:36 +0200
Message-ID: <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000012253305b49fa901"
Received-SPF: none client-ip=2607:f8b0:4864:20::244;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x244.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnichenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000012253305b49fa901
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 21, 2020 at 5:24 PM Yuri Benditovich <
yuri.benditovich@daynix.com> wrote:

>
>
> On Fri, Nov 20, 2020 at 2:58 PM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Andrew Melnichenko <andrew@daynix.com> writes:
>>
>> > Ping
>> >
>> > On Thu, Jul 16, 2020 at 6:26 AM <andrew@daynix.com> wrote:
>> >
>> >> From: Andrew Melnychenko <andrew@daynix.com>
>> >>
>> >> There is an issue, that netdev can't be removed if it was added using
>> hmp.
>> >> The bug appears after 08712fcb851034228b61f75bd922863a984a4f60 commit.
>> >> It happens because of unclear QemuOpts that was created during
>> >> hmp_netdev_add(), now it uses qmp analog function -
>> >> qmp_marshal_netdev_add().
>> >>
>> >> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
>> >> ---
>> >>  monitor/hmp-cmds.c | 15 +++------------
>> >>  1 file changed, 3 insertions(+), 12 deletions(-)
>> >>
>> >> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> >> index 2b0b58a336..b747935687 100644
>> >> --- a/monitor/hmp-cmds.c
>> >> +++ b/monitor/hmp-cmds.c
>> >> @@ -1597,19 +1597,10 @@ void hmp_migrate(Monitor *mon, const QDict
>> *qdict)
>> >>  void hmp_netdev_add(Monitor *mon, const QDict *qdict)
>> >>  {
>> >>      Error *err = NULL;
>> >> -    QemuOpts *opts;
>> >> -
>> >> -    opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict,
>> &err);
>> >> -    if (err) {
>> >> -        goto out;
>> >> -    }
>> >> +    QDict *non_constant_dict = qdict_clone_shallow(qdict);
>> >>
>> >> -    netdev_add(opts, &err);
>> >> -    if (err) {
>> >> -        qemu_opts_del(opts);
>> >> -    }
>> >> -
>> >> -out:
>> >> +    qmp_marshal_netdev_add(non_constant_dict, NULL, &err);
>> >> +    qobject_unref(non_constant_dict);
>> >>      hmp_handle_error(mon, err);
>> >>  }
>>
>> qmp_marshal_netdev_add() uses the QObject input visitor, which feels
>> wrong for HMP input.
>>
>> What exactly is the problem you're trying to solve?  Can you show us a
>> reproducer?
>>
>> The problem was found during work on hotplug/unplug problems with q35
> run q35 VM with netdev and hotpluggable nic (virtio or e1000e)
> unplug the nic (device_del)
> delete the netdev ()
> add netdev with the same id as before - fail (Duplicated ID)
>
> Q35 is not mandatory for reproduction, the same with '-machine pc'

--00000000000012253305b49fa901
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 21, 2020 at 5:24 PM Yuri =
Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com">yuri.bendito=
vich@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 20, 2020=
 at 2:58 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" targ=
et=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Andrew Melnichenko &lt;<a href=3D"mailto:a=
ndrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt; writes:<br>
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

--00000000000012253305b49fa901--

