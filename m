Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C92BA688
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:49:50 +0100 (CET)
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg337-0005ws-CV
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kg31l-0005U4-PH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:48:25 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kg31h-0005Et-VE
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:48:25 -0500
Received: by mail-ej1-x643.google.com with SMTP id f20so12000453ejz.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 01:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EbKQMc4LtJV0p9UtSyoANtdm5T2HgtnN00xf5OLSSCU=;
 b=YZS2f9l6qGNIUKaPO6eqkL2Vo0aJsNa7VKAjTQos6uHQ6ICD2oeMgxfyentTOB5nUh
 HAlJQjznKwzJM0Hk3iFvuoPWyBoCa0RJ2VhSluIPYcJGfAt5f2CTtOW0lGKEsj/BKbwi
 SK9iOJn0pLNyCFFon0TktfGOHJ2mdMbcgRbDjgJwQNh/gBQiPj7dFSrOgQGiFveWoNVt
 IaE7tCSOhM5BaJK3NapSe+qfFUypUZIKPXI2sYdORu5gJGP13MjHCzWhBY/1AGTBHvqz
 acV7CH3sJCNXQgmzTvjDxdDemhjkgp9MiTM/xvpX0+WyWVboKRpfQCcUvmj2DcMkdPRF
 LkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EbKQMc4LtJV0p9UtSyoANtdm5T2HgtnN00xf5OLSSCU=;
 b=FJFj2svF28pIIDNIStRR84jVOycwhbo0nWLLv9yOC1Yn1MoRIPK/Yd6uQ+qR7gKx6s
 7kkYT0ffJd3YwWq3vm1VPtIL3KessqzQK9JSfopiBQeGFIiwuSKZvFAwtAvot3lrUnj2
 +Sm9aNmG1TQ+kG3Fmsa0C0aWul/gBCwv53x+H7pHI4jVAaVhaoxJjdxw1yCnACa32Q0t
 JB00ZUgBj5X0uScThOEk3mCrXOLStluMrFxZYNiIRTbrG9xw0WpFyXH8wd/WV6Jtj/Zd
 eNOKgZiqAwqmLQYuZvnB7e8Eu4yczZm7xqgDiakvn7XppXKZ2h3v7f7dwK5KsPL2q47c
 tf2A==
X-Gm-Message-State: AOAM530MW+Fp3c8Fh6J2OENa593gsSFLBMWT9tBemZVvDywLaX7lOB1g
 P68QaKngEV3DgHM1vL3oEA2omRLLdJdXmcO2BEA=
X-Google-Smtp-Source: ABdhPJyOGmbfcjiv9RtHq8NdYzoSlgHQQaXS7IkrNDIh18s/AkFMWmVQTOTB/fbmKOBiT8GZMba3G+PskGNDRXWyyIk=
X-Received: by 2002:a17:906:c298:: with SMTP id
 r24mr14325371ejz.381.1605865700210; 
 Fri, 20 Nov 2020 01:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20201119084557.27870-1-lma@suse.com>
 <CAJ+F1C+wUoeT-xTA1Rv6XWBBQfEB_mzOXHBBbEt7OcEQ9+84bQ@mail.gmail.com>
 <7594e6cebc51b395c98dbc8714beb7ff@suse.de>
In-Reply-To: <7594e6cebc51b395c98dbc8714beb7ff@suse.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 20 Nov 2020 13:48:07 +0400
Message-ID: <CAJ+F1CJO-+yRj9Lm1BnL-i-AurHnXN4fYsjdeD_0jmLUHNSSHA@mail.gmail.com>
Subject: Re: [PATCH] qga: Correct loop count in qmp_guest_get_vcpus()
To: Lin Ma <lma@suse.de>
Content-Type: multipart/alternative; boundary="0000000000009e410c05b486beca"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>,
 Lin Ma <lma@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e410c05b486beca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Nov 20, 2020 at 1:28 PM Lin Ma <lma@suse.de> wrote:

> On 2020-11-19 14:46, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Nov 19, 2020 at 12:48 PM Lin Ma <lma@suse.com> wrote:
> >
> >> The guest-get-vcpus returns incorrect vcpu info in case we hotunplug
> >> vcpus(not
> >> the last one).
> >> e.g.:
> >> A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and
> >> cpu3).
> >> Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.
> >>
> >> ./qmp-shell /tmp/qmp-monitor.sock
> >> (QEMU) query-hotpluggable-cpus
> >> {"return": [
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3},
> >> "vcpus-count": 1,
> >>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2},
> >> "vcpus-count": 1,
> >>  "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1},
> >> "vcpus-count": 1,
> >>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0},
> >> "vcpus-count": 1,
> >>  "qom-path": "/machine/unattached/device[0]", "type":
> >> "host-x86_64-cpu"}
> >> ]}
> >>
> >> (QEMU) device_del id=3Dcpu2
> >> {"return": {}}
> >>
> >> (QEMU) query-hotpluggable-cpus
> >> {"return": [
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3},
> >> "vcpus-count": 1,
> >>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2},
> >> "vcpus-count": 1,
> >>  "type": "host-x86_64-cpu"},
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1},
> >> "vcpus-count": 1,
> >>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
> >> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0},
> >> "vcpus-count": 1,
> >>  "qom-path": "/machine/unattached/device[0]", "type":
> >> "host-x86_64-cpu"}
> >> ]}
> >>
> >> Before:
> >> ./qmp-shell -N /tmp/qmp-ga.sock
> >> Welcome to the QMP low-level shell!
> >> Connected
> >> (QEMU) guest-get-vcpus
> >> {"return": [
> >> {"online": true, "can-offline": false, "logical-id": 0},
> >> {"online": true, "can-offline": true, "logical-id": 1}]}
> >>
> >> After:
> >> ./qmp-shell -N /tmp/qmp-ga.sock
> >> Welcome to the QMP low-level shell!
> >> Connected
> >> (QEMU) guest-get-vcpus
> >> {"execute":"guest-get-vcpus"}
> >> {"return": [
> >> {"online": true, "can-offline": false, "logical-id": 0},
> >> {"online": true, "can-offline": true, "logical-id": 1},
> >> {"online": true, "can-offline": true, "logical-id": 3}]}
> >>
> >> Signed-off-by: Lin Ma <lma@suse.com>
> >> ---
> >>  qga/commands-posix.c | 8 +++++---
> >>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> >> index 3bffee99d4..accc893373 100644
> >> --- a/qga/commands-posix.c
> >> +++ b/qga/commands-posix.c
> >> @@ -2182,15 +2182,15 @@ GuestLogicalProcessorList
> >> *qmp_guest_get_vcpus(Error **errp)
> >>  {
> >>      int64_t current;
> >>      GuestLogicalProcessorList *head, **link;
> >> -    long sc_max;
> >> +    long max_loop_count;
> >>      Error *local_err =3D NULL;
> >>
> >>      current =3D 0;
> >>      head =3D NULL;
> >>      link =3D &head;
> >> -    sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
> >> +    max_loop_count =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err=
);
> >>
> >> -    while (local_err =3D=3D NULL && current < sc_max) {
> >> +    while (local_err =3D=3D NULL && current < max_loop_count) {
> >>          GuestLogicalProcessor *vcpu;
> >>          GuestLogicalProcessorList *entry;
> >>          int64_t id =3D current++;
> >> @@ -2206,6 +2206,8 @@ GuestLogicalProcessorList
> >> *qmp_guest_get_vcpus(Error
> >> **errp)
> >>              entry->value =3D vcpu;
> >>              *link =3D entry;
> >>              link =3D &entry->next;
> >> +        } else {
> >> +            max_loop_count +=3D 1;
> >>
> >
> > This looks like a recipe for infinite loop on error.
> Emm...It is possible.
> >
> > Shouldn't we loop over all the /sys/devices/system/cpu/cpu#/ instead?
> Originally I'd like to use the function fnmatch to handle pattern cpu#
> to
> loop over all of the /sys/devices/system/cpu/cpu#/, But it introduces
> the
> header file fnmatch.h and make things complicated a little.
>
>
Why use fnmatch?
g_dir_open & g_dir_read_name, then you can sscanf for the matching entries.


> >
> > (possibly parse /sys/devices/system/cpu/present, but I doubt it's
> > necessary)
> IMO the 'present' won't help.
>
> I'm about to post the V2, I made tiny change in the V2, Please help to
> review.
>
> BTW, The local_err will be set in case of error, right? It could avoid
> infinite loop.
>
> I think it should.


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009e410c05b486beca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 20, 2020 at 1:28 PM Lin=
 Ma &lt;<a href=3D"mailto:lma@suse.de">lma@suse.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-11-19 14:46, Marc=
-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Thu, Nov 19, 2020 at 12:48 PM Lin Ma &lt;<a href=3D"mailto:lma@suse=
.com" target=3D"_blank">lma@suse.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; The guest-get-vcpus returns incorrect vcpu info in case we hotunpl=
ug<br>
&gt;&gt; vcpus(not<br>
&gt;&gt; the last one).<br>
&gt;&gt; e.g.:<br>
&gt;&gt; A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 =
and<br>
&gt;&gt; cpu3).<br>
&gt;&gt; Hotunplug cpu2,=C2=A0 Now only cpu0, cpu1 and cpu3 are present &am=
p; online.<br>
&gt;&gt; <br>
&gt;&gt; ./qmp-shell /tmp/qmp-monitor.sock<br>
&gt;&gt; (QEMU) query-hotpluggable-cpus<br>
&gt;&gt; {&quot;return&quot;: [<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 3}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;qom-path&quot;: &quot;/machine/peripheral/cpu3&quot;, =
&quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 2}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;qom-path&quot;: &quot;/machine/peripheral/cpu2&quot;, =
&quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 1}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;qom-path&quot;: &quot;/machine/peripheral/cpu1&quot;, =
&quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 0}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;qom-path&quot;: &quot;/machine/unattached/device[0]&qu=
ot;, &quot;type&quot;: <br>
&gt;&gt; &quot;host-x86_64-cpu&quot;}<br>
&gt;&gt; ]}<br>
&gt;&gt; <br>
&gt;&gt; (QEMU) device_del id=3Dcpu2<br>
&gt;&gt; {&quot;return&quot;: {}}<br>
&gt;&gt; <br>
&gt;&gt; (QEMU) query-hotpluggable-cpus<br>
&gt;&gt; {&quot;return&quot;: [<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 3}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;qom-path&quot;: &quot;/machine/peripheral/cpu3&quot;, =
&quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 2}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 1}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;qom-path&quot;: &quot;/machine/peripheral/cpu1&quot;, =
&quot;type&quot;: &quot;host-x86_64-cpu&quot;},<br>
&gt;&gt; {&quot;props&quot;: {&quot;core-id&quot;: 0, &quot;thread-id&quot;=
: 0, &quot;socket-id&quot;: 0}, <br>
&gt;&gt; &quot;vcpus-count&quot;: 1,<br>
&gt;&gt;=C2=A0 &quot;qom-path&quot;: &quot;/machine/unattached/device[0]&qu=
ot;, &quot;type&quot;: <br>
&gt;&gt; &quot;host-x86_64-cpu&quot;}<br>
&gt;&gt; ]}<br>
&gt;&gt; <br>
&gt;&gt; Before:<br>
&gt;&gt; ./qmp-shell -N /tmp/qmp-ga.sock<br>
&gt;&gt; Welcome to the QMP low-level shell!<br>
&gt;&gt; Connected<br>
&gt;&gt; (QEMU) guest-get-vcpus<br>
&gt;&gt; {&quot;return&quot;: [<br>
&gt;&gt; {&quot;online&quot;: true, &quot;can-offline&quot;: false, &quot;l=
ogical-id&quot;: 0},<br>
&gt;&gt; {&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;lo=
gical-id&quot;: 1}]}<br>
&gt;&gt; <br>
&gt;&gt; After:<br>
&gt;&gt; ./qmp-shell -N /tmp/qmp-ga.sock<br>
&gt;&gt; Welcome to the QMP low-level shell!<br>
&gt;&gt; Connected<br>
&gt;&gt; (QEMU) guest-get-vcpus<br>
&gt;&gt; {&quot;execute&quot;:&quot;guest-get-vcpus&quot;}<br>
&gt;&gt; {&quot;return&quot;: [<br>
&gt;&gt; {&quot;online&quot;: true, &quot;can-offline&quot;: false, &quot;l=
ogical-id&quot;: 0},<br>
&gt;&gt; {&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;lo=
gical-id&quot;: 1},<br>
&gt;&gt; {&quot;online&quot;: true, &quot;can-offline&quot;: true, &quot;lo=
gical-id&quot;: 3}]}<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Lin Ma &lt;<a href=3D"mailto:lma@suse.com" target=
=3D"_blank">lma@suse.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 qga/commands-posix.c | 8 +++++---<br>
&gt;&gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
&gt;&gt; index 3bffee99d4..accc893373 100644<br>
&gt;&gt; --- a/qga/commands-posix.c<br>
&gt;&gt; +++ b/qga/commands-posix.c<br>
&gt;&gt; @@ -2182,15 +2182,15 @@ GuestLogicalProcessorList<br>
&gt;&gt; *qmp_guest_get_vcpus(Error **errp)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int64_t current;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 GuestLogicalProcessorList *head, **link;<br>
&gt;&gt; -=C2=A0 =C2=A0 long sc_max;<br>
&gt;&gt; +=C2=A0 =C2=A0 long max_loop_count;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 current =3D 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 head =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 link =3D &amp;head;<br>
&gt;&gt; -=C2=A0 =C2=A0 sc_max =3D SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &amp=
;local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 max_loop_count =3D SYSCONF_EXACT(_SC_NPROCESSORS_CO=
NF, &amp;local_err);<br>
&gt;&gt; <br>
&gt;&gt; -=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; current &lt=
; sc_max) {<br>
&gt;&gt; +=C2=A0 =C2=A0 while (local_err =3D=3D NULL &amp;&amp; current &lt=
; max_loop_count) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestLogicalProcessor *vcpu;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestLogicalProcessorList *entry=
;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t id =3D current++;<br>
&gt;&gt; @@ -2206,6 +2206,8 @@ GuestLogicalProcessorList <br>
&gt;&gt; *qmp_guest_get_vcpus(Error<br>
&gt;&gt; **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;value =
=3D vcpu;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *link =3D entry;<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link =3D &amp;entr=
y-&gt;next;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_loop_count +=3D 1;<=
br>
&gt;&gt; <br>
&gt; <br>
&gt; This looks like a recipe for infinite loop on error.<br>
Emm...It is possible.<br>
&gt; <br>
&gt; Shouldn&#39;t we loop over all the /sys/devices/system/cpu/cpu#/ inste=
ad?<br>
Originally I&#39;d like to use the function fnmatch to handle pattern cpu# =
<br>
to<br>
loop over all of the /sys/devices/system/cpu/cpu#/, But it introduces <br>
the<br>
header file fnmatch.h and make things complicated a little.<br>
<br></blockquote><div><br></div><div>Why use fnmatch?</div><div>g_dir_open =
&amp; g_dir_read_name, then you can sscanf for the matching entries.<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; (possibly parse /sys/devices/system/cpu/present, but I doubt it&#39;s =
<br>
&gt; necessary)<br>
IMO the &#39;present&#39; won&#39;t help.<br>
<br>
I&#39;m about to post the V2, I made tiny change in the V2, Please help to =
<br>
review.<br>
<br>
BTW, The local_err will be set in case of error, right? It could avoid <br>
infinite loop.<br>
<br></blockquote><div>I think it should.<br></div></div><br clear=3D"all"><=
br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau=
<br></div></div>

--0000000000009e410c05b486beca--

