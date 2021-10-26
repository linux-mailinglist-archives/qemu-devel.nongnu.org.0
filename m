Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D244043B7EA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:09:22 +0200 (CEST)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPwv-0001GD-Fw
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfPvS-0008EY-AF
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfPvP-0007EK-5a
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635268065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MMA5GC+aN7XdmlakOwOw2zofaWGqViC9y/1CHeZpiMU=;
 b=Q6DpLHyrGmEXxstCykq0z1d0yECEVKVQycYuOkzw93AJGHfZhgBAmADfR1TowW+6VqypdY
 omVmMd0/jzFJ0OAeHJj0IJ+jfRx6iTJJ64sd+thLPQZCOjvTD2SCRnAd/Kry8haBk8noQy
 bD4LRwnQEfHyIJeE/HuHLCNg1UdjHRg=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-eDQwNPYbMfOKvmjJ8Vxmzg-1; Tue, 26 Oct 2021 13:07:44 -0400
X-MC-Unique: eDQwNPYbMfOKvmjJ8Vxmzg-1
Received: by mail-vk1-f200.google.com with SMTP id
 n6-20020a1f2706000000b002a45b52f52dso24257vkn.22
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MMA5GC+aN7XdmlakOwOw2zofaWGqViC9y/1CHeZpiMU=;
 b=VhCtOiI9XQ2hG605SkwueW1Hv8Hsdd9dWuADIBOKuh3IeG2J0T4ZEvVsR8u2BzIcDG
 AVi7zjcUX0/7PgdmSuHxX+pyeWfVLfB/pjJvs+/8JTN+uEyhMzPJl0s972TAXwvfyQx8
 cm4oher3ZiofB8hbrnLUqm9Rx/bS5MW42LYJ09zUVAuUbqlb9LlImQp1iBDEft1LzSco
 Lj3bGZpb7CycDWU0+1NKw/HBC7ysEfPEnKVRvCgoAK2LJ1tZO6rkPbbEdsaVpkxyqXSm
 c+Mw0YaMkI8qcKoVq2inhiGEaJBs6aLk+yGKLFSt4Gg4Se9UaBLxFsdcZriufeiJhEPF
 L18g==
X-Gm-Message-State: AOAM531nj+4BJ9rRGBedDS2zeDKKg5VBjHmmET+iMyItd12NKRL8ZSvk
 TU16qdvsjp814EeBD2VHWVbj7SqG8QZ1DEzdG7j3SI04v3+iu/2CMNkOgXYh6cIu7Q2iAT+Aovr
 cJduec8SAL3/Vkc4qeR9vMhQU3Rt2WMA=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr24593414vsp.40.1635268063502; 
 Tue, 26 Oct 2021 10:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxafJ3fz5r2nwkt8MHknWs1gOHF5TzWcEe/W/U9i9qH7EvIcJrtcOSGdwcXy9295qY0T+medxBXsJDlIGV3wzw=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr24593375vsp.40.1635268063248; 
 Tue, 26 Oct 2021 10:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211013215748.2154908-1-jsnow@redhat.com>
 <20211013215748.2154908-7-jsnow@redhat.com>
 <53d27c1f-c9de-5608-7f6a-f64bc39fb159@redhat.com>
In-Reply-To: <53d27c1f-c9de-5608-7f6a-f64bc39fb159@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 13:07:32 -0400
Message-ID: <CAFn=p-Y3nCHY4Kp+9ngG077-kZXLOCo8Uv0hr9FTqreNvA58yQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] iotests/300: avoid abnormal shutdown race condition
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000005d63705cf448423"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005d63705cf448423
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 9:20 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 13.10.21 23:57, John Snow wrote:
> > Wait for the destination VM to close itself instead of racing to shut i=
t
> > down first, which produces different error log messages from AQMP
> > depending on precisely when we tried to shut it down.
> >
> > (For example: We may try to issue 'quit' immediately prior to the targe=
t
> > VM closing its QMP socket, which will cause an ECONNRESET error to be
> > logged. Waiting for the VM to exit itself avoids the race on shutdown
> > behavior.)
> >
> > Reported-by: Hanna Reitz <hreitz@redhat.com>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/300 | 12 ++++--------
> >   1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
> > index 10f9f2a8da6..bbea7248005 100755
> > --- a/tests/qemu-iotests/300
> > +++ b/tests/qemu-iotests/300
> > @@ -24,8 +24,6 @@ import random
> >   import re
> >   from typing import Dict, List, Optional
> >
> > -from qemu.machine import machine
> > -
> >   import iotests
> >
> >
> > @@ -461,12 +459,10 @@ class
> TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
> >                         f"'{self.src_node_name}': Name is longer than
> 255 bytes",
> >                         log)
> >
> > -        # Expect abnormal shutdown of the destination VM because of
> > -        # the failed migration
> > -        try:
> > -            self.vm_b.shutdown()
> > -        except machine.AbnormalShutdown:
> > -            pass
> > +        # Destination VM will terminate w/ error of its own accord
> > +        # due to the failed migration.
> > +        self.vm_b.wait()
> > +        assert self.vm_b.exitcode() > 0
>
> Trying to test, I can see that this fails iotest 297, because
> `.exitcode()` is `Optional[int]`...
>
> (I can=E2=80=99t believe how long it took me to figure this out =E2=80=93=
 the message
> =E2=80=9C300:465: Unsupported operand types for < ("int" and "None")=E2=
=80=9D made me
> believe that it was 300 that was failing, because `exitcode()` was
> returning `None` for some inconceivable reason.  I couldn=E2=80=99t under=
stand
> why my usual test setup failed on every run, but I couldn=E2=80=99t get 3=
00 to
> fail manually...  Until I noticed that the message came below the =E2=80=
=9C297=E2=80=9D
> line, not the =E2=80=9C300=E2=80=9D line...)
>
>
Oops. Is there anything we can do to improve the visual clarity there?


> Hanna
>
>
Embarrassing. I scrutinized the other series I sent out, but forgot to
apply the same tests to this one. :(
Fixed, sorry for the noise.

--js

--00000000000005d63705cf448423
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 9:20 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 13.10.2=
1 23:57, John Snow wrote:<br>
&gt; Wait for the destination VM to close itself instead of racing to shut =
it<br>
&gt; down first, which produces different error log messages from AQMP<br>
&gt; depending on precisely when we tried to shut it down.<br>
&gt;<br>
&gt; (For example: We may try to issue &#39;quit&#39; immediately prior to =
the target<br>
&gt; VM closing its QMP socket, which will cause an ECONNRESET error to be<=
br>
&gt; logged. Waiting for the VM to exit itself avoids the race on shutdown<=
br>
&gt; behavior.)<br>
&gt;<br>
&gt; Reported-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" targ=
et=3D"_blank">hreitz@redhat.com</a>&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/300 | 12 ++++--------<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300<br>
&gt; index 10f9f2a8da6..bbea7248005 100755<br>
&gt; --- a/tests/qemu-iotests/300<br>
&gt; +++ b/tests/qemu-iotests/300<br>
&gt; @@ -24,8 +24,6 @@ import random<br>
&gt;=C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0from typing import Dict, List, Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -from qemu.machine import machine<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0import iotests<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -461,12 +459,10 @@ class TestBlockBitmapMappingErrors(TestDirtyBitm=
apMigration):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0f&quot;&#39;{self.src_node_name}&#39;: Name is longer t=
han 255 bytes&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0log)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Expect abnormal shutdown of the destina=
tion VM because of<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the failed migration<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm_b.shutdown()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 except machine.AbnormalShutdown:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Destination VM will terminate w/ error =
of its own accord<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # due to the failed migration.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm_b.wait()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert self.vm_b.exitcode() &gt; 0<br>
<br>
Trying to test, I can see that this fails iotest 297, because <br>
`.exitcode()` is `Optional[int]`...<br>
<br>
(I can=E2=80=99t believe how long it took me to figure this out =E2=80=93 t=
he message <br>
=E2=80=9C300:465: Unsupported operand types for &lt; (&quot;int&quot; and &=
quot;None&quot;)=E2=80=9D made me <br>
believe that it was 300 that was failing, because `exitcode()` was <br>
returning `None` for some inconceivable reason.=C2=A0 I couldn=E2=80=99t un=
derstand <br>
why my usual test setup failed on every run, but I couldn=E2=80=99t get 300=
 to <br>
fail manually...=C2=A0 Until I noticed that the message came below the =E2=
=80=9C297=E2=80=9D <br>
line, not the =E2=80=9C300=E2=80=9D line...)<br>
<br></blockquote><div><br></div><div>Oops. Is there anything we can do to i=
mprove the visual clarity there?<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Hanna<br>
<br></blockquote><div><br></div><div>Embarrassing. I scrutinized the other =
series I sent out, but forgot to apply the same tests to this one. :(</div>=
<div>Fixed, sorry for the noise.</div><div><br></div><div>--js<br></div><di=
v><br></div><div><br></div><div><br></div><div><br></div><div><br></div><di=
v> <br></div></div></div>

--00000000000005d63705cf448423--


