Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACEF2C2445
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:38:13 +0100 (CET)
Received: from localhost ([::1]:52842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWeC-00006B-Kn
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khWd9-0007uX-BW
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:37:07 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khWd7-0002rV-AK
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:37:07 -0500
Received: by mail-ot1-x342.google.com with SMTP id f16so19000642otl.11
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 03:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9IxN94mRo7FNAgnnupAHU04Xgv2COA1pOCuCrOZVMFM=;
 b=pPbC8iKzyhpVo8iJQ/OYzkHO1NqqfPUT8viDEMyToGYAi1B52FDml5eXxeL/MFBxvb
 ggkRFUfoXLlGNH3eHWgazQtw55aNWXyX41X+NedsOyNla2W5RPOFDTsxOXvhlBDzzoZB
 ogDjlgUqbWqvoExTP1Nk+tFNcSrDhlgPjzdZRRptN31yTFIn7PKMJ0dTnNAzbjuQpw8Z
 mV0xou2rMELGPyCfbqIiZfGNyxz97LrE2K07mB347bRBioiorIx3iprVhHqBgOoaqLc4
 OXSVNo1b0PNidQ+h43pLg3EneK6glk3urVqMgBI+bntOWfTTfqNZCVgoVz9q2PntB16I
 1P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9IxN94mRo7FNAgnnupAHU04Xgv2COA1pOCuCrOZVMFM=;
 b=q3ts8x0bE+xQjCDFZEbjG4DF3SssZlsjJaODbvDUtfIINNuMUcfYQwe6Yr4QKVeLzB
 ZTAPOeQ/rE4tC97ELU7gEUDSARQ3Dxb5ZZicKp1I1bamds8QLElegrRKCkFBL/jmZO7N
 WOgk+uVD7hQ4e+XgjdGS6weUIZCdqkIxBJK6/cbn4CAnT+XKMV1fwjVURPtF1xcbGGpu
 8V8TXknRUFFS+Gfamee+cq4UNmXReBaaU2A2I4ca0arWhD6oYmLYzeujryn6ncwMlio8
 2rj3Y3uM91O8HiCHFP0ytiCyjmSVez5jyOs3hPIVrIkO/UlYaB4e3IHpn6/WAKhHv6/6
 jsog==
X-Gm-Message-State: AOAM533ZgWCO7okreUvNMDY2XTHqK9WBpiBi12koZve3iayquHS3TO3v
 g6p/kJHNhOOAsEwMFeNOQnhzizADWjEamrZMpNqE+w==
X-Google-Smtp-Source: ABdhPJw7prSAhLA8xxotpP8BXRvIJ8CKVr+lpXUtY+M5Sv91hMFcVw6dySsDyAYwjAmN+kuGA4B1kr2k/IP49eLDQCo=
X-Received: by 2002:a9d:4715:: with SMTP id a21mr2973739otf.220.1606217824164; 
 Tue, 24 Nov 2020 03:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 <87lfesv2zu.fsf@dusky.pond.sub.org>
 <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
 <87blfnp20k.fsf@dusky.pond.sub.org> <87lferm4x5.fsf@dusky.pond.sub.org>
In-Reply-To: <87lferm4x5.fsf@dusky.pond.sub.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 24 Nov 2020 13:36:53 +0200
Message-ID: <CAOEp5Oe18jtsgHVqwtm+-sqspD6KoJTOO9nNPmcWS++AVGjXKQ@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d7772605b4d8baae"
Received-SPF: none client-ip=2607:f8b0:4864:20::342;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x342.google.com
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

--000000000000d7772605b4d8baae
Content-Type: text/plain; charset="UTF-8"

Please confirm that this patch is intended to solve only the problem with
hmp (and disallow duplicated ids)
With it the netdev that was added from qemu's command line and was deleted
(for example by hmp) still can't be created, correct?

On Tue, Nov 24, 2020 at 12:21 PM Markus Armbruster <armbru@redhat.com>
wrote:

> Markus Armbruster <armbru@redhat.com> writes:
>
> > This means commit 08712fcb85 "net: Track netdevs in NetClientState
> > rather than QemuOpt" didn't actually replace QemuOpts completely.
> >
> > This affects QMP:
> >
> >     $ socat "READLINE,history=$HOME/.qmp_history,prompt=QMP>"
> UNIX-CONNECT:$HOME/work/images/test-qmp
> >     {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 5},
> "package": "v5.2.0-rc2-19-gff85db769f-dirty"}, "capabilities": ["oob"]}}
> >     QMP>{ "execute": "qmp_capabilities", "arguments": { "enable":
> ["oob"] } }
> >     {"return": {}}
> >     QMP>{"execute": "netdev_add", "arguments": {"type": "user",
> "id":"net0"}}
> >     {"return": {}}
> >     QMP>{"execute": "netdev_add", "arguments": {"type": "user",
> "id":"net0"}}
> >     {"return": {}}
> >
> > Results in two netdevs called "net0".  Needs fixing.
>
> Here's my attempt.  If it looks good to you, I'll post it as a proper
> patch.
>
>
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a6a6684df1..8bc6b7bcc6 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1638,9 +1638,7 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict)
>      }
>
>      netdev_add(opts, &err);
> -    if (err) {
> -        qemu_opts_del(opts);
> -    }
> +    qemu_opts_del(opts);
>
>  out:
>      hmp_handle_error(mon, err);
> diff --git a/net/net.c b/net/net.c
> index 794c652282..eb743aca23 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -978,6 +978,7 @@ static int (* const
> net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>  static int net_client_init1(const Netdev *netdev, bool is_netdev, Error
> **errp)
>  {
>      NetClientState *peer = NULL;
> +    NetClientState *nc;
>
>      if (is_netdev) {
>          if (netdev->type == NET_CLIENT_DRIVER_NIC ||
> @@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev,
> bool is_netdev, Error **errp)
>          }
>      }
>
> +    nc = qemu_find_netdev(netdev->id);
> +    if (nc) {
> +        error_setg(errp, "Duplicate ID '%s'", netdev->id);
> +        return -1;
> +    }
> +
>      if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp)
> < 0) {
>          /* FIXME drop when all init functions store an Error */
>          if (errp && !*errp) {
> @@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev,
> bool is_netdev, Error **errp)
>      }
>
>      if (is_netdev) {
> -        NetClientState *nc;
> -
>          nc = qemu_find_netdev(netdev->id);
>          assert(nc);
>          nc->is_netdev = true;
> --
> 2.26.2
>
>

--000000000000d7772605b4d8baae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please confirm that this patch is intended to solve only t=
he problem with hmp (and disallow duplicated ids)<div>With it the netdev th=
at was added from qemu&#39;s command line and was deleted (for example by h=
mp) still can&#39;t be created, correct?=C2=A0=C2=A0</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2=
020 at 12:21 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">=
armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com"=
 target=3D"_blank">armbru@redhat.com</a>&gt; writes:<br>
<br>
&gt; This means commit 08712fcb85 &quot;net: Track netdevs in NetClientStat=
e<br>
&gt; rather than QemuOpt&quot; didn&#39;t actually replace QemuOpts complet=
ely.<br>
&gt;<br>
&gt; This affects QMP:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$ socat &quot;READLINE,history=3D$HOME/.qmp_history=
,prompt=3DQMP&gt;&quot; UNIX-CONNECT:$HOME/work/images/test-qmp <br>
&gt;=C2=A0 =C2=A0 =C2=A0{&quot;QMP&quot;: {&quot;version&quot;: {&quot;qemu=
&quot;: {&quot;micro&quot;: 92, &quot;minor&quot;: 1, &quot;major&quot;: 5}=
, &quot;package&quot;: &quot;v5.2.0-rc2-19-gff85db769f-dirty&quot;}, &quot;=
capabilities&quot;: [&quot;oob&quot;]}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0QMP&gt;{ &quot;execute&quot;: &quot;qmp_capabilitie=
s&quot;, &quot;arguments&quot;: { &quot;enable&quot;: [&quot;oob&quot;] } }=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0{&quot;return&quot;: {}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0QMP&gt;{&quot;execute&quot;: &quot;netdev_add&quot;=
, &quot;arguments&quot;: {&quot;type&quot;: &quot;user&quot;, &quot;id&quot=
;:&quot;net0&quot;}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0{&quot;return&quot;: {}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0QMP&gt;{&quot;execute&quot;: &quot;netdev_add&quot;=
, &quot;arguments&quot;: {&quot;type&quot;: &quot;user&quot;, &quot;id&quot=
;:&quot;net0&quot;}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0{&quot;return&quot;: {}}<br>
&gt;<br>
&gt; Results in two netdevs called &quot;net0&quot;.=C2=A0 Needs fixing.<br=
>
<br>
Here&#39;s my attempt.=C2=A0 If it looks good to you, I&#39;ll post it as a=
 proper<br>
patch.<br>
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
<br>
=C2=A0out:<br>
=C2=A0 =C2=A0 =C2=A0hmp_handle_error(mon, err);<br>
diff --git a/net/net.c b/net/net.c<br>
index 794c652282..eb743aca23 100644<br>
--- a/net/net.c<br>
+++ b/net/net.c<br>
@@ -978,6 +978,7 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIV=
ER__MAX])(<br>
=C2=A0static int net_client_init1(const Netdev *netdev, bool is_netdev, Err=
or **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NetClientState *peer =3D NULL;<br>
+=C2=A0 =C2=A0 NetClientState *nc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (is_netdev) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (netdev-&gt;type =3D=3D NET_CLIENT_DRI=
VER_NIC ||<br>
@@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev, bo=
ol is_netdev, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 nc =3D qemu_find_netdev(netdev-&gt;id);<br>
+=C2=A0 =C2=A0 if (nc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Duplicate ID &#39;%s&#3=
9;&quot;, netdev-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (net_client_init_fun[netdev-&gt;type](netdev, netdev=
-&gt;id, peer, errp) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME drop when all init functions sto=
re an Error */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errp &amp;&amp; !*errp) {<br>
@@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev, boo=
l is_netdev, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (is_netdev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *nc;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nc =3D qemu_find_netdev(netdev-&gt;id);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(nc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nc-&gt;is_netdev =3D true;<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div>

--000000000000d7772605b4d8baae--

