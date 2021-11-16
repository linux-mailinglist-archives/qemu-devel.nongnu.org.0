Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C426A452B32
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 07:52:10 +0100 (CET)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmsK9-0000NA-CI
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 01:52:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmsIs-00088B-N3
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 01:50:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmsIo-0001nK-G8
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 01:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637045444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mc34j1W+U8K209D/3wV7PoUB4yYdYinoovn/QLbN4N8=;
 b=QvjHyhtOO9TLclucy5GyRjdxrGWt4wiYOjGZrl4Kz05/N2r30jrGoNiGR5zhMWl46tss3B
 0COHAYhviz1LmlTYn0+3ZWUM8hfeyQvLJxo1bL3oWMCJb1bBGx+THQZwABhOMJMUp4Yrfj
 6KIhj7N2CRQDL2WYmL0ZCU16ofQYWoY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-8wCMR9hLMcyr4SvdKXUyUA-1; Tue, 16 Nov 2021 01:50:41 -0500
X-MC-Unique: 8wCMR9hLMcyr4SvdKXUyUA-1
Received: by mail-pj1-f71.google.com with SMTP id
 gf12-20020a17090ac7cc00b001a968c11642so1141557pjb.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 22:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mc34j1W+U8K209D/3wV7PoUB4yYdYinoovn/QLbN4N8=;
 b=3aVLhix0GHTqHBiG8sEHrzSkWvfwkjL+0ReyJPyUSGldjXpDypQapyvn23PB8j4PTZ
 ClvJwxjJq9JvuaKOLrfxY15MhpwMLHGNJv5iBEZDMu3wy6Nd5IHKHkf0uBCPm7Q/BOTu
 AWHWLxvqu5v/fHzax38uwDUWNnt6s/bVps2VOqi7myZeM0/pWAGrF/6PIj4T5hy8HSSc
 Jw+JXDEpJUSuvEi8RCXLkbgB79tELPz7pCu6aX1zdi0TgbU0N1UhF2ZM/66fZUDZULq8
 diJPjZK+9cKvZu0jayle4ORI5WfSYtuRM0OSNSREzhddzFGMn6l7wtp39zeA9o7MJp4g
 17kw==
X-Gm-Message-State: AOAM532kHTd0sStFCHjkOv+DK0p9a8wM61Zl/aY/XWZmgfcJEwHRuRNW
 CYZfBkG5Q9zz1ulBJa8a6YNp26R0KIJrApOycFAcrn7ZljaIyLN+G3kCdFQ5Rpg/LJGBui2WgJe
 1kOLwonUg2fLXQebhCbSL24i3X3ZM5Hw=
X-Received: by 2002:a17:90a:4dcc:: with SMTP id
 r12mr71922689pjl.13.1637045440415; 
 Mon, 15 Nov 2021 22:50:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTdJM9f2yiCT+oW+4yiyRnQCGBp1BbKBAX4FtKSHiBqgog+ARNoiQLdsHo6raf2tDqFwiue/kRQaXQTqoK2PE=
X-Received: by 2002:a17:90a:4dcc:: with SMTP id
 r12mr71922653pjl.13.1637045440118; 
 Mon, 15 Nov 2021 22:50:40 -0800 (PST)
MIME-Version: 1.0
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
 <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com>
 <87pmr7rzls.fsf@dusky.pond.sub.org>
 <bc437ccb-0487-a5ff-8e6a-50067715c4d4@redhat.com>
 <87mtman4h1.fsf@dusky.pond.sub.org>
 <13efddef-cc30-9a6a-a700-060d6fca57e3@redhat.com>
 <87ee7lh9x2.fsf@dusky.pond.sub.org>
 <e1411df1-696c-ceec-ef77-8cc4d538de70@redhat.com>
 <87wnlcsd9q.fsf@dusky.pond.sub.org>
 <0fba39ee-4a1a-b388-82d3-4dc44cf3b9fb@redhat.com>
 <87tugdh1gl.fsf@dusky.pond.sub.org>
In-Reply-To: <87tugdh1gl.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Nov 2021 07:50:00 +0100
Message-ID: <CABgObfbPkKpE06-HhdW2OxOdzbhWZzrhNFKps3jH78Je8Nv12w@mail.gmail.com>
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f0985b05d0e25775"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f0985b05d0e25775
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun., 15 nov. 2021 16:40, Markus Armbruster <armbru@redhat.com> escribi=
=C3=B3:

> > Why do you care?  For another example, you can use "reboot" or
> > "systemctl isolate reboot.target" and they end up doing the same thing.
> >
> > As long as qemu_init invokes qmp_machine_set, qmp_accel_set,
> > qmp_device_add, qmp_plugin_add, qmp_cont, etc. to do its job, the
> > difference between qemu-system-* and qemu-qmp-* is a couple thousands
> > lines of boring code that all but disappears once the VM is up and
> > running.  IOW, with the right design (e.g. shortcut options for QOM
> > properties good; dozens of global variables bad), there's absolutely no
> > issue with some people using qemu-system-* and some using qemu-qmp-*.
>
> I think maintaining two binaries forever is madness.  I want the old one
> to wither away.


This seems a bit dogmatic to me. The difference between the two binaries
would be literally a single file, which basically disappears before
anything interesting happens.

Making the new binary capable of serving all use cases should not be
> hard, just work (see my design sketch).  I expect the result to serve
> *better* than the mess we have now.
>

Most of the mess is in the implementation. Not all, granted. But overall
softmmu/vl.c's ugliness is mostly due to the layers of backwards
compatibility, and that wouldn't go away very soon.

>>>> My point is that we still have quite a few commands without
> >>>> 'allow-preconfig' mostly because we are afraid of allowing them in
> >>>> preconfig state, not because of true phase dependencies.
> >>>
> >>> I think there's very few of them, if any (outside the block layer for
> >>> which patches exist), and those are due to distraction more than fear=
.
> >>
> >> qapi/*.json has 216 commands, of which 26 carry 'allow-preconfig'.
> >
> > Well,
> > https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg01597.html
> > alone would more than double that. :)
> >
> > Places like machine.json, machine-target.json, migration.json,
> > replay.json have a lot of commands that are, obviously, almost entirely
> > not suitable for preconfig.  I don't think there are many commands left=
,
> > I'd guess maybe 30 (meaning that ~60% are done).
>
> My point is that "very few" is not literally true, and I think you just
> confirmed it ;)


Ok, let me rephrase that as "most of the missing ones are block-layer
relates". ;)

Paolo

--000000000000f0985b05d0e25775
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">El lun., 15 nov. 2021 16:40, Markus Armbruster &lt;<a =
href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; escribi=C3=B3:<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
&gt; Why do you care?=C2=A0 For another example, you can use &quot;reboot&q=
uot; or <br>
&gt; &quot;systemctl isolate reboot.target&quot; and they end up doing the =
same thing.<br>
&gt;<br>
&gt; As long as qemu_init invokes qmp_machine_set, qmp_accel_set, <br>
&gt; qmp_device_add, qmp_plugin_add, qmp_cont, etc. to do its job, the <br>
&gt; difference between qemu-system-* and qemu-qmp-* is a couple thousands =
<br>
&gt; lines of boring code that all but disappears once the VM is up and <br=
>
&gt; running.=C2=A0 IOW, with the right design (e.g. shortcut options for Q=
OM <br>
&gt; properties good; dozens of global variables bad), there&#39;s absolute=
ly no <br>
&gt; issue with some people using qemu-system-* and some using qemu-qmp-*.<=
br>
<br>
I think maintaining two binaries forever is madness.=C2=A0 I want the old o=
ne<br>
to wither away.</blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">This seems a bit dogmatic to me. The difference between the two =
binaries would be literally a single file, which basically disappears befor=
e anything interesting happens.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Making the new binary capable of serving all use cases sho=
uld not be<br>
hard, just work (see my design sketch).=C2=A0 I expect the result to serve<=
br>
*better* than the mess we have now.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Most of the mess is in the implementatio=
n. Not all, granted. But overall softmmu/vl.c&#39;s ugliness is mostly due =
to the layers of backwards compatibility, and that wouldn&#39;t go away ver=
y soon.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
&gt;&gt;&gt;&gt; My point is that we still have quite a few commands withou=
t<br>
&gt;&gt;&gt;&gt; &#39;allow-preconfig&#39; mostly because we are afraid of =
allowing them in<br>
&gt;&gt;&gt;&gt; preconfig state, not because of true phase dependencies.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think there&#39;s very few of them, if any (outside the bloc=
k layer for<br>
&gt;&gt;&gt; which patches exist), and those are due to distraction more th=
an fear.<br>
&gt;&gt; <br>
&gt;&gt; qapi/*.json has 216 commands, of which 26 carry &#39;allow-preconf=
ig&#39;.<br>
&gt;<br>
&gt; Well, <br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg01=
597.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.gnu=
.org/archive/html/qemu-devel/2021-06/msg01597.html</a> <br>
&gt; alone would more than double that. :)<br>
&gt;<br>
&gt; Places like machine.json, machine-target.json, migration.json, <br>
&gt; replay.json have a lot of commands that are, obviously, almost entirel=
y <br>
&gt; not suitable for preconfig.=C2=A0 I don&#39;t think there are many com=
mands left, <br>
&gt; I&#39;d guess maybe 30 (meaning that ~60% are done).<br>
<br>
My point is that &quot;very few&quot; is not literally true, and I think yo=
u just<br>
confirmed it ;)</blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Ok, let me rephrase that as &quot;most of the missing ones are b=
lock-layer relates&quot;. ;)</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"></div></div>

--000000000000f0985b05d0e25775--


