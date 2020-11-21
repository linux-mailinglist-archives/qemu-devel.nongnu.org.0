Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3372BC03A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 16:25:35 +0100 (CET)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgUla-0001Uc-Cw
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 10:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kgUkb-00014f-Ga
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:24:33 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kgUkZ-000893-En
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:24:33 -0500
Received: by mail-oi1-x241.google.com with SMTP id m13so14258432oih.8
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 07:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vji2yxOTEtJm+bhg1j+TCYYbOH7gtqqH/bqsMXGCN9k=;
 b=0CfP6AnyI7v0g1Xt1tBMcepYsfGh5fN7Pz2ANeXsQxffaxOC+/YOJnpvYZm4aXZWrZ
 2gcpc23FsQ1N4q6K5JSexbDteAdd8hms8hKAUCi9IqhDmaO2ABYD/wGFNE601bCymMOr
 tAav7J/N19jn7KSr456ZK5MgaDt9LK6GF9FPKyCS/a2SdpqFE7c+gRVhisuGlJBOKEBw
 fIQoltmJuskp5kSfXZ0yMi3mx4zIBwo9V/efg2RPCCZ9I5SDJwhomcea0k2HO2yA6nMI
 CZ6gO8VTwpM6GG/CPu5O3lPzBrm9J62NcBgdHiVB05aMeNnAEwQSCQ15/U3YATUc8S6m
 JKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vji2yxOTEtJm+bhg1j+TCYYbOH7gtqqH/bqsMXGCN9k=;
 b=g5dKyaJFAXEwtauH7EpJVOBbJBHJKHCJ57QTYc9FQsKt+JWHLWGIcSsg09k8sZJjOm
 t7Ouf4KfObpfkn214pfA0oOqcAucbX9HMVT8aHenSdhGgnO/3upbHpwD28/C8lrNJQFo
 2XW8WAHZJsHhr2BhBDUh41o1fcQodHl3xuGBnFAFD47gjSyaxm9EM2sh1WIJSZtgR0qK
 Zi1uGHCfdONrseqV8cjzehGKr+CuR3HH7iitAgb00D0635M5fY04FtKBQSe71F0pBKFK
 rUhHEbD3J/6W6m9/72X9WxxvSIxXRo5bnD8DHwNyGnRMtfpVxOzByvLwHz97uqxLZBqZ
 VBCw==
X-Gm-Message-State: AOAM533I30FpIGG49S/Ta1WCbZ1mzFMag9Pk1HeulM8ITf+oVB1MbuYp
 agIIiFX+5vBh9AP/MSO2Jt8XOGB4SDH5FzOjl6OIpw==
X-Google-Smtp-Source: ABdhPJz32TWrIeKTxApHBq+YNH3dxLRy5tgTPuHWKesT4HEvFgoBU9AjCuJoO1Hvt9ztfAEj5OH5ram75uADRaedIwI=
X-Received: by 2002:aca:52cb:: with SMTP id g194mr9951905oib.91.1605972269817; 
 Sat, 21 Nov 2020 07:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
In-Reply-To: <874klk5gnc.fsf@dusky.pond.sub.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sat, 21 Nov 2020 17:24:18 +0200
Message-ID: <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a973cf05b49f8eda"
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a973cf05b49f8eda
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 2:58 PM Markus Armbruster <armbru@redhat.com> wrote:

> Andrew Melnichenko <andrew@daynix.com> writes:
>
> > Ping
> >
> > On Thu, Jul 16, 2020 at 6:26 AM <andrew@daynix.com> wrote:
> >
> >> From: Andrew Melnychenko <andrew@daynix.com>
> >>
> >> There is an issue, that netdev can't be removed if it was added using
> hmp.
> >> The bug appears after 08712fcb851034228b61f75bd922863a984a4f60 commit.
> >> It happens because of unclear QemuOpts that was created during
> >> hmp_netdev_add(), now it uses qmp analog function -
> >> qmp_marshal_netdev_add().
> >>
> >> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> >> ---
> >>  monitor/hmp-cmds.c | 15 +++------------
> >>  1 file changed, 3 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> >> index 2b0b58a336..b747935687 100644
> >> --- a/monitor/hmp-cmds.c
> >> +++ b/monitor/hmp-cmds.c
> >> @@ -1597,19 +1597,10 @@ void hmp_migrate(Monitor *mon, const QDict
> *qdict)
> >>  void hmp_netdev_add(Monitor *mon, const QDict *qdict)
> >>  {
> >>      Error *err = NULL;
> >> -    QemuOpts *opts;
> >> -
> >> -    opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict, &err);
> >> -    if (err) {
> >> -        goto out;
> >> -    }
> >> +    QDict *non_constant_dict = qdict_clone_shallow(qdict);
> >>
> >> -    netdev_add(opts, &err);
> >> -    if (err) {
> >> -        qemu_opts_del(opts);
> >> -    }
> >> -
> >> -out:
> >> +    qmp_marshal_netdev_add(non_constant_dict, NULL, &err);
> >> +    qobject_unref(non_constant_dict);
> >>      hmp_handle_error(mon, err);
> >>  }
>
> qmp_marshal_netdev_add() uses the QObject input visitor, which feels
> wrong for HMP input.
>
> What exactly is the problem you're trying to solve?  Can you show us a
> reproducer?
>
> The problem was found during work on hotplug/unplug problems with q35
run q35 VM with netdev and hotpluggable nic (virtio or e1000e)
unplug the nic (device_del)
delete the netdev ()
add netdev with the same id as before - fail (Duplicated ID)

--000000000000a973cf05b49f8eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 20, 2020 at 2:58 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Andr=
ew Melnichenko &lt;<a href=3D"mailto:andrew@daynix.com" target=3D"_blank">a=
ndrew@daynix.com</a>&gt; writes:<br>
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
ail (Duplicated ID)</div><div><br></div></div></div>

--000000000000a973cf05b49f8eda--

