Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3D2C1810
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:59:53 +0100 (CET)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJsF-0005dG-J9
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khJpq-00055g-NZ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 16:57:22 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khJpm-0001R1-GN
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 16:57:22 -0500
Received: by mail-oi1-x241.google.com with SMTP id m13so21395076oih.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d7uyXmjsSZzzgR9qvvjOBjUaW5TzZMh1a0Ph1rC7u4M=;
 b=fIGrB9jaw9l+ygO2KLtkkuau/IDyZZ4Mtj001lA1NsF6oDWeuuPgLf4/Fk46mfAvs3
 iJDoTOJMUOfzDHcNyzXEhP+eDg3ehpGfxYu9domMumZGqFJEXpi/t1vXdvbZ82Y316jl
 Yb1+JIXvCUVA4n+CsXCgRwhiaVI9HEqKDkRZhGCKWXWZ3Zi8ZyFrew97IJcm8Q90RpCR
 VKnA2y3ToN7fNelvVzWoyRBq2+vEuhmzxwZeM5Eri5YSbDFtzbBu5o0/CMqPMHeJUIc5
 dL+YCVfJf+EU+d8rSCv8X8ZyduSAf9aRDZFp3zmWGSPxb3lmqDoJ4TAXIV52KWwba+VD
 UeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d7uyXmjsSZzzgR9qvvjOBjUaW5TzZMh1a0Ph1rC7u4M=;
 b=XCEaJviOthX4zfzeDOwye8Adwc/jVsEm16bwnIrtiSK+wOLLxDHgiXywNKeddf4H+6
 sW5G3vvZcD5FiOOypE9wRTYy4UYSAycFNw6FKjkXPWVcPsYJvHOp9byF6w6xbH/U+9r6
 Fw5SdM8W0iyqaHzbPx8ZyKF4IP0FG5jrmasxbVEtMDQedMFqS6+KmR0uTqIh6wL/KeCu
 cfoxamDpHHB85eJBr+lzQKlvl9QKIOF6GdBcoqvWUu8NdVaIUo6+RmUVgL3EVJb4Qcrr
 xE02cVfyTkw7YVMsyo0JtMHh/ztw7N/9zuycr1IJTXfaY72JgcUg/Cl51WPvUVM/T7Rw
 8NVQ==
X-Gm-Message-State: AOAM530U+wQZV603hEGlAj9dqslQyCWyGAXicBhnsTwjsoVREzRvAsKd
 6GwUdzOblSqPt2StXQVSVT6EgkGAjNEXSYr4AdtE6A==
X-Google-Smtp-Source: ABdhPJz0gcOKlM89zdF55Adzrq7c1a2wRoXaWrG61MuYqt1JBfcp2zvhsBaAGgLy0VrINpCMbWCAyXsb4aFj5L724bo=
X-Received: by 2002:aca:5286:: with SMTP id g128mr722094oib.91.1606168636175; 
 Mon, 23 Nov 2020 13:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 <87lfesv2zu.fsf@dusky.pond.sub.org>
 <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
In-Reply-To: <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 23 Nov 2020 23:57:04 +0200
Message-ID: <CAOEp5Of_4R5gXLT3AoGYhLwX46jhB7RXZzojNN6DsQ91Gbz1Yg@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000024db005b4cd471a"
Received-SPF: none client-ip=2607:f8b0:4864:20::241;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x241.google.com
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000024db005b4cd471a
Content-Type: text/plain; charset="UTF-8"

The patch below solves both issues: with netdev created by hmp and with
netdev created from command-line:

diff --git a/net/net.c b/net/net.c
index bcd5da4aa0..98294f24ed 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1155,6 +1155,11 @@ void qmp_netdev_del(const char *id, Error **errp)
     }

     qemu_del_net_client(nc);
+
+    QemuOpts *opts = qemu_opts_find(qemu_find_opts("netdev"), id);
+    if (opts) {
+        qemu_opts_del(opts);
+    }
 }

static void netfilter_print_info(Monitor *mon, NetFilterState *nf)

Please let me know if you have any objections.
If not, I'll send it as a patch.


On Mon, Nov 23, 2020 at 5:35 PM Yuri Benditovich <
yuri.benditovich@daynix.com> wrote:

>
>
> On Mon, Nov 23, 2020 at 11:25 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Andrew Melnichenko <andrew@daynix.com> writes:
>>
>> > --000000000000f73b2205b4aef0c5
>> > Content-Type: text/plain; charset="UTF-8"
>> >
>> > Hi, the bug can be reproduced like that:
>> >
>> >> QEMU 5.1.50 monitor - type 'help' for more information
>> >> (qemu) netdev_add
>> >> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> >> (qemu) info network
>> >> hub 0
>> >>  \ hub0port1: __org.qemu.net1:
>> index=0,type=user,net=10.0.2.0,restrict=off
>> >>  \ hub0port0: e1000e.0:
>> >> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> >> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> >> net0:
>> >>
>> index=0,type=tap,ifname=tap0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> >> (qemu) netdev_del net0
>> >> (qemu) info network
>> >> hub 0
>> >>  \ hub0port1: __org.qemu.net1:
>> index=0,type=user,net=10.0.2.0,restrict=off
>> >>  \ hub0port0: e1000e.0:
>> >> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> >> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> >> (qemu) netdev_add
>> >> type=tap,id=net0,script=/home/and/SRCS/qemu/ifup.sh,downscript=no
>> >> Try "help netdev_add" for more information
>> >> (qemu) info network
>> >> hub 0
>> >>  \ hub0port1: __org.qemu.net1:
>> index=0,type=user,net=10.0.2.0,restrict=off
>> >>  \ hub0port0: e1000e.0:
>> >> index=0,type=nic,model=e1000e,macaddr=52:54:00:12:34:56
>> >> dnet0: index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:57
>> >> (qemu)
>> >>
>> >>
>> > Its still actual bug - I've checked it with the
>> > master(2c6605389c1f76973d92b69b85d40d94b8f1092c).
>>
>> I can see this with an even simpler reproducer:
>>
>>     $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
>>     QEMU 5.1.92 monitor - type 'help' for more information
>>     (qemu) netdev_add user,id=net0
>>     (qemu) info network
>>     net0: index=0,type=user,net=10.0.2.0,restrict=off
>>     (qemu) netdev_del net0
>>     (qemu) info network
>>     (qemu) netdev_add user,id=net0
>>     upstream-qemu: Duplicate ID 'net0' for netdev
>>     Try "help netdev_add" for more information
>>
>> The appended patch fixes it for me.  It relies on nothing using the
>> "netdev" QemuOpts anymore.  Eric, what do you think?
>>
>>
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index a6a6684df1..8bc6b7bcc6 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1638,9 +1638,7 @@ void hmp_netdev_add(Monitor *mon, const QDict
>> *qdict)
>>      }
>>
>>      netdev_add(opts, &err);
>> -    if (err) {
>> -        qemu_opts_del(opts);
>> -    }
>> +    qemu_opts_del(opts);
>>
>>
> Unfortunately, if I'm not mistaken, with this fix qemu will be able to
> create from hmp several devices with the same id
> (which is not expected).
> For example:
> netdev_add user,id=net0
> netdev_add user,id=net0
> info network lists 2 devices net0
>
>
>
>>  out:
>>      hmp_handle_error(mon, err);
>>
>>

--000000000000024db005b4cd471a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The patch below solves both=C2=A0issues: with netdev creat=
ed by hmp and with netdev created from command-line:<div><br></div><div>dif=
f --git a/net/net.c b/net/net.c<br>index bcd5da4aa0..98294f24ed 100644<br>-=
-- a/net/net.c<br>+++ b/net/net.c<br>@@ -1155,6 +1155,11 @@ void qmp_netdev=
_del(const char *id, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0}<br><br>=C2=A0 =
=C2=A0 =C2=A0qemu_del_net_client(nc);<br>+<br>+ =C2=A0 =C2=A0QemuOpts *opts=
 =3D qemu_opts_find(qemu_find_opts(&quot;netdev&quot;), id);<br>+ =C2=A0 =
=C2=A0if (opts) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_del(opts);<br>+=
 =C2=A0 =C2=A0}<br>=C2=A0}</div><div><br></div><div>static void netfilter_p=
rint_info(Monitor *mon, NetFilterState *nf)<br></div><div><br></div><div>Pl=
ease let me know if you have=C2=A0any objections.</div><div>If not, I&#39;l=
l send it as a patch.</div><div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 23, 2020 at 5:35 PM Y=
uri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com">yuri.ben=
ditovich@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 23, 20=
20 at 11:25 AM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Andrew Melnichenko &lt;<a href=3D"mailto:=
andrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt; writes:<br>
<br>
&gt; --000000000000f73b2205b4aef0c5<br>
&gt; Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
&gt;<br>
&gt; Hi, the bug can be reproduced like that:<br>
&gt;<br>
&gt;&gt; QEMU 5.1.50 monitor - type &#39;help&#39; for more information<br>
&gt;&gt; (qemu) netdev_add<br>
&gt;&gt; type=3Dtap,id=3Dnet0,script=3D/home/and/SRCS/qemu/ifup.sh,downscri=
pt=3Dno<br>
&gt;&gt; (qemu) info network<br>
&gt;&gt; hub 0<br>
&gt;&gt;=C2=A0 \ hub0port1: __org.qemu.net1: index=3D0,type=3Duser,net=3D10=
.0.2.0,restrict=3Doff<br>
&gt;&gt;=C2=A0 \ hub0port0: e1000e.0:<br>
&gt;&gt; index=3D0,type=3Dnic,model=3De1000e,macaddr=3D52:54:00:12:34:56<br=
>
&gt;&gt; dnet0: index=3D0,type=3Dnic,model=3Dvirtio-net-pci,macaddr=3D52:54=
:00:12:34:57<br>
&gt;&gt; net0:<br>
&gt;&gt; index=3D0,type=3Dtap,ifname=3Dtap0,script=3D/home/and/SRCS/qemu/if=
up.sh,downscript=3Dno<br>
&gt;&gt; (qemu) netdev_del net0<br>
&gt;&gt; (qemu) info network<br>
&gt;&gt; hub 0<br>
&gt;&gt;=C2=A0 \ hub0port1: __org.qemu.net1: index=3D0,type=3Duser,net=3D10=
.0.2.0,restrict=3Doff<br>
&gt;&gt;=C2=A0 \ hub0port0: e1000e.0:<br>
&gt;&gt; index=3D0,type=3Dnic,model=3De1000e,macaddr=3D52:54:00:12:34:56<br=
>
&gt;&gt; dnet0: index=3D0,type=3Dnic,model=3Dvirtio-net-pci,macaddr=3D52:54=
:00:12:34:57<br>
&gt;&gt; (qemu) netdev_add<br>
&gt;&gt; type=3Dtap,id=3Dnet0,script=3D/home/and/SRCS/qemu/ifup.sh,downscri=
pt=3Dno<br>
&gt;&gt; Try &quot;help netdev_add&quot; for more information<br>
&gt;&gt; (qemu) info network<br>
&gt;&gt; hub 0<br>
&gt;&gt;=C2=A0 \ hub0port1: __org.qemu.net1: index=3D0,type=3Duser,net=3D10=
.0.2.0,restrict=3Doff<br>
&gt;&gt;=C2=A0 \ hub0port0: e1000e.0:<br>
&gt;&gt; index=3D0,type=3Dnic,model=3De1000e,macaddr=3D52:54:00:12:34:56<br=
>
&gt;&gt; dnet0: index=3D0,type=3Dnic,model=3Dvirtio-net-pci,macaddr=3D52:54=
:00:12:34:57<br>
&gt;&gt; (qemu)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Its still actual bug - I&#39;ve checked it with the<br>
&gt; master(2c6605389c1f76973d92b69b85d40d94b8f1092c).<br>
<br>
I can see this with an even simpler reproducer:<br>
<br>
=C2=A0 =C2=A0 $ qemu-system-x86_64 -S -display none -nodefaults -monitor st=
dio<br>
=C2=A0 =C2=A0 QEMU 5.1.92 monitor - type &#39;help&#39; for more informatio=
n<br>
=C2=A0 =C2=A0 (qemu) netdev_add user,id=3Dnet0<br>
=C2=A0 =C2=A0 (qemu) info network<br>
=C2=A0 =C2=A0 net0: index=3D0,type=3Duser,net=3D10.0.2.0,restrict=3Doff<br>
=C2=A0 =C2=A0 (qemu) netdev_del net0<br>
=C2=A0 =C2=A0 (qemu) info network<br>
=C2=A0 =C2=A0 (qemu) netdev_add user,id=3Dnet0<br>
=C2=A0 =C2=A0 upstream-qemu: Duplicate ID &#39;net0&#39; for netdev<br>
=C2=A0 =C2=A0 Try &quot;help netdev_add&quot; for more information<br>
<br>
The appended patch fixes it for me.=C2=A0 It relies on nothing using the<br=
>
&quot;netdev&quot; QemuOpts anymore.=C2=A0 Eric, what do you think?<br>
<br>
<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index a6a6684df1..8bc6b7bcc6 100644<br>
--- a/monitor/hmp-cmds.c<br>
+++ b/monitor/hmp-cmds.c<br>
@@ -1638,9 +1638,7 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict)=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0netdev_add(opts, &amp;err);<br>
-=C2=A0 =C2=A0 if (err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_del(opts);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qemu_opts_del(opts);<br>
<br></blockquote><div><br></div><div>Unfortunately, if I&#39;m not mistaken=
, with this fix qemu will be able to create from hmp several devices with t=
he same id</div><div>(which is not expected).</div><div>For example:</div><=
div>netdev_add user,id=3Dnet0</div><div>netdev_add user,id=3Dnet0</div><div=
>info network lists 2 devices net0</div><div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0out:<br>
=C2=A0 =C2=A0 =C2=A0hmp_handle_error(mon, err);<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000024db005b4cd471a--

