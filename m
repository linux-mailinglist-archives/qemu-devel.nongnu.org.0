Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7012B9514
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:50:33 +0100 (CET)
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kflGa-00031O-LL
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kflCc-0007NC-Rn
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:46:26 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:33545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kflCa-0005SI-M5
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:46:26 -0500
Received: by mail-ed1-x543.google.com with SMTP id k4so6121004edl.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 06:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JxEM0y46RviXzrTrzLzjZjn8Zt/gB2HogaN48idvaTo=;
 b=foU0HJH/p6Lp6hOwZOBprnR4lFEPpzeocIKGadLg1MpAlimUFjeEG/Rvj+ksgGj8L0
 pbnExGkn7PBoE7ShesgCgboedfmNyVn2kO4Di1zof3yOXcLFNrv9GqbsyO6wP9pDverY
 ATOeSpsbsVlkFw19grVlKuyH8x2T11AOpHS5Hmc7HcWsOEnLWc2dmnvwLzpJsESkNDIO
 cFfpparY17O1D0l5XbJoEEhwgnCgem7h0k2OYzQeq8c3zS8bGbHhUC8ttX8OE/A5K8R9
 yMttMZ8BQ0jItA0yEEtJr6NhJ85Gr2qbPKsdcevGNadBnk5aZNL7MpkcAUP/dzT3485E
 9o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JxEM0y46RviXzrTrzLzjZjn8Zt/gB2HogaN48idvaTo=;
 b=l4VRNJ94tZbmf7Z3wP1Lwj7EBIdFVjvVgGgKRtb8kwTyQmud/yg8o3uhX21Gn+zHsa
 SN+Y+Uxa4202Zkat1QyX16dvM0PSjTSJYSQXu5mskG4w72mbEoTNdePutORJ5WxqMYs+
 LCnXzuXfj9BIrm5YnBrZQRelPR7VcuofJHUET+4WO48Bk6lmTOOsx0nVrS+ProgxZuY8
 yb5odgrG7Vs1G+6TyYlaYyQzp2LpYrd9xl2pjdFzJJupqYmlGgQIk7UsfYiydhEM2XZU
 5oDEcCqRj8EIi1gNEpUYkGv2Z2Q5xaj0GPd30rdfGiQ1eFpIZnDsKFY/r8ZvEpmD7cT5
 xQZQ==
X-Gm-Message-State: AOAM532t8Qy+kw1A4f9LxBjOFAWmCb0IxF5mjj+XNEcPL474NkIUA1Q/
 oXT1NZVSnuAxWxvnMkT39Y1+os1Lmu3pZ2wpmQg=
X-Google-Smtp-Source: ABdhPJyOzFqy00nzcgWSpmfAkshIeBHvYSMDSFsNtU8SFGaiKkROXstgFRwS/IY00XhlQmNE/BUWX00wiXR8PPn1K1o=
X-Received: by 2002:aa7:c3c4:: with SMTP id l4mr7803104edr.314.1605797183130; 
 Thu, 19 Nov 2020 06:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20201119084557.27870-1-lma@suse.com>
In-Reply-To: <20201119084557.27870-1-lma@suse.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 19 Nov 2020 18:46:11 +0400
Message-ID: <CAJ+F1C+wUoeT-xTA1Rv6XWBBQfEB_mzOXHBBbEt7OcEQ9+84bQ@mail.gmail.com>
Subject: Re: [PATCH] qga: Correct loop count in qmp_guest_get_vcpus()
To: Lin Ma <lma@suse.com>
Content-Type: multipart/alternative; boundary="000000000000ae92e905b476ca9e"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ae92e905b476ca9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Nov 19, 2020 at 12:48 PM Lin Ma <lma@suse.com> wrote:

> The guest-get-vcpus returns incorrect vcpu info in case we hotunplug
> vcpus(not
> the last one).
> e.g.:
> A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and
> cpu3).
> Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.
>
> ./qmp-shell /tmp/qmp-monitor.sock
> (QEMU) query-hotpluggable-cpus
> {"return": [
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": =
1,
>  "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
> ]}
>
> (QEMU) device_del id=3Dcpu2
> {"return": {}}
>
> (QEMU) query-hotpluggable-cpus
> {"return": [
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, "vcpus-count": =
1,
>  "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, "vcpus-count": =
1,
>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "vcpus-count": =
1,
>  "qom-path": "/machine/unattached/device[0]", "type": "host-x86_64-cpu"}
> ]}
>
> Before:
> ./qmp-shell -N /tmp/qmp-ga.sock
> Welcome to the QMP low-level shell!
> Connected
> (QEMU) guest-get-vcpus
> {"return": [
> {"online": true, "can-offline": false, "logical-id": 0},
> {"online": true, "can-offline": true, "logical-id": 1}]}
>
> After:
> ./qmp-shell -N /tmp/qmp-ga.sock
> Welcome to the QMP low-level shell!
> Connected
> (QEMU) guest-get-vcpus
> {"execute":"guest-get-vcpus"}
> {"return": [
> {"online": true, "can-offline": false, "logical-id": 0},
> {"online": true, "can-offline": true, "logical-id": 1},
> {"online": true, "can-offline": true, "logical-id": 3}]}
>
> Signed-off-by: Lin Ma <lma@suse.com>
> ---
>  qga/commands-posix.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 3bffee99d4..accc893373 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2182,15 +2182,15 @@ GuestLogicalProcessorList
> *qmp_guest_get_vcpus(Error **errp)
>  {
>      int64_t current;
>      GuestLogicalProcessorList *head, **link;
> -    long sc_max;
> +    long max_loop_count;
>      Error *local_err =3D NULL;
>
>      current =3D 0;
>      head =3D NULL;
>      link =3D &head;
> -    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
> +    max_loop_count =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
>
> -    while (local_err =3D=3D NULL && current < sc_max) {
> +    while (local_err =3D=3D NULL && current < max_loop_count) {
>          GuestLogicalProcessor *vcpu;
>          GuestLogicalProcessorList *entry;
>          int64_t id =3D current++;
> @@ -2206,6 +2206,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r
> **errp)
>              entry->value =3D vcpu;
>              *link =3D entry;
>              link =3D &entry->next;
> +        } else {
> +            max_loop_count +=3D 1;
>

This looks like a recipe for infinite loop on error.

Shouldn't we loop over all the /sys/devices/system/cpu/cpu#/ instead?

(possibly parse /sys/devices/system/cpu/present, but I doubt it's necessary=
)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ae92e905b476ca9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 19, 2020 at 12:48 PM Li=
n Ma &lt;<a href=3D"mailto:lma@suse.com">lma@suse.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">The guest-get-vcpus re=
turns incorrect vcpu info in case we hotunplug vcpus(not<br>
the last one).<br>
e.g.:<br>
A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and cpu3)=
.<br>
Hotunplug cpu2,=C2=A0 Now only cpu0, cpu1 and cpu3 are present &amp; online=
.<br>
<br>
./qmp-shell /tmp/qmp-monitor.sock<br>
(QEMU) query-hotpluggable-cpus<br>
{&quot;return&quot;: [<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 3}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu3&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 2}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu2&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 1}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu1&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 0}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/unattached/device[0]&quot;, &quo=
t;type&quot;: &quot;host-x86_64-cpu&quot;}<br>
]}<br>
<br>
(QEMU) device_del id=3Dcpu2<br>
{&quot;return&quot;: {}}<br>
<br>
(QEMU) query-hotpluggable-cpus<br>
{&quot;return&quot;: [<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 3}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu3&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 2}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 1}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/peripheral/cpu1&quot;, &quot;typ=
e&quot;: &quot;host-x86_64-cpu&quot;},<br>
{&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;: 0, &quo=
t;socket-id&quot;: 0}, &quot;vcpus-count&quot;: 1,<br>
=C2=A0&quot;qom-path&quot;: &quot;/machine/unattached/device[0]&quot;, &quo=
t;type&quot;: &quot;host-x86_64-cpu&quot;}<br>
]}<br>
<br>
Before:<br>
./qmp-shell -N /tmp/qmp-ga.sock<br>
Welcome to the QMP low-level shell!<br>
Connected<br>
(QEMU) guest-get-vcpus<br>
{&quot;return&quot;: [<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: false, &quot;logical-id=
&quot;: 0},<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;logical-id&=
quot;: 1}]}<br>
<br>
After:<br>
./qmp-shell -N /tmp/qmp-ga.sock<br>
Welcome to the QMP low-level shell!<br>
Connected<br>
(QEMU) guest-get-vcpus<br>
{&quot;execute&quot;:&quot;guest-get-vcpus&quot;}<br>
{&quot;return&quot;: [<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: false, &quot;logical-id=
&quot;: 0},<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;logical-id&=
quot;: 1},<br>
{&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;logical-id&=
quot;: 3}]}<br>
<br>
Signed-off-by: Lin Ma &lt;<a href=3D"mailto:lma@suse.com" target=3D"_blank"=
>lma@suse.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 3bffee99d4..accc893373 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2182,15 +2182,15 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Erro=
r **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int64_t current;<br>
=C2=A0 =C2=A0 =C2=A0GuestLogicalProcessorList *head, **link;<br>
-=C2=A0 =C2=A0 long sc_max;<br>
+=C2=A0 =C2=A0 long max_loop_count;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0current =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0head =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0link =3D &amp;head;<br>
-=C2=A0 =C2=A0 sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &amp;local_er=
r);<br>
+=C2=A0 =C2=A0 max_loop_count =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &amp;=
local_err);<br>
<br>
-=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; current &lt; sc_max)=
 {<br>
+=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; current &lt; max_loo=
p_count) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestLogicalProcessor *vcpu;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GuestLogicalProcessorList *entry;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t id =3D current++;<br>
@@ -2206,6 +2206,8 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;value =3D vcpu;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*link =3D entry;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link =3D &amp;entry-&gt;nex=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_loop_count +=3D 1;<br></bloc=
kquote><div><br></div><div>This looks like a recipe for infinite loop on er=
ror.</div><div><br></div><div>Shouldn&#39;t we loop over all the /sys/devic=
es/system/cpu/cpu#/ instead?<br></div></div><div class=3D"gmail_quote"><br>=
</div>(possibly parse /sys/devices/system/cpu/present, but I doubt it&#39;s=
 necessary)<br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ae92e905b476ca9e--

