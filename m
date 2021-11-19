Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5A45687A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 04:15:00 +0100 (CET)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnuMc-0005nC-UR
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 22:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnuL8-0004qL-1U
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mnuL4-00036J-R6
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637291601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7KWoPp1r7ItMD61SrHlsc351O58KyCY2KWC1XGxhg0=;
 b=geRwwDSxE8Wfi/AS9jgQny1hPUmLw1gKNRe1Ms2Z/vgaKlDI63rW+WmlQuqKf4BjgvG148
 xsbKufftPNI8jbwod/aKtXsuMlhXLFenabgid8VqKIQfdhAWoKrRLJGpEgzysbANhrHuPA
 GcB00lurYpLJrWDM5whzstchDidsYcg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-y_GvwhWoMr6gkGxR2TDcEw-1; Thu, 18 Nov 2021 22:13:18 -0500
X-MC-Unique: y_GvwhWoMr6gkGxR2TDcEw-1
Received: by mail-pf1-f198.google.com with SMTP id
 c131-20020a621c89000000b004a343484969so1777959pfc.3
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 19:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z7KWoPp1r7ItMD61SrHlsc351O58KyCY2KWC1XGxhg0=;
 b=tOSNHvFWpOcKVgjgIf/lOiFYxDe9muWVT/x0XOOIBZ4O2nD156lkEJcI/SzwjsBtNL
 hzlc+WHjDgUUGNNByn7X9zK4Q9utUaJ5oMa1b3a8PnhlhYJNL0AhjwunbA8Ju4eOZtPS
 H+9YqsgaEvCyRKY6JBFC3wQ0EezA9jAWoDgXpIgHstrqLinN6W9TvL/ACe2YPKrXUs8u
 JDJuO4UNI+Tbs7lrnMHMLMkiW5/eJKo44v4mVSQBk/SQ1aQxPZ+kqX99w7ATQYEzMpdR
 O1PxKFVFpeVJ8hS47JX2id31AdHomZhwGzPvp7xbn83K8/xjP/MHLhCWeSNJ28QNtHjr
 KVlA==
X-Gm-Message-State: AOAM530zqDOzH6+hTz8JtB8r1w72m7U/Op8Gc+cT+lZKtgbHnKKQZlpH
 2CNGErFsFWrDnJ/bEzsPUwVMr3ZnLMa1jryyQzBU793Ow4MHswWN4FPkP7uYPhip/X9DIL7ODag
 gMZ/km+rIa946T/+2Uvh3Kh9XoBgQLBo=
X-Received: by 2002:a17:902:8544:b0:142:66e7:afbb with SMTP id
 d4-20020a170902854400b0014266e7afbbmr73361205plo.62.1637291597066; 
 Thu, 18 Nov 2021 19:13:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXndTp28PTxl3JCV5B8IRw4T2X65Uv3lUaIZ8uAo6d35TiwMJqAnxDlqaWLgzokoyb5t3HqoNs6uR/lVsLybs=
X-Received: by 2002:a17:902:8544:b0:142:66e7:afbb with SMTP id
 d4-20020a170902854400b0014266e7afbbmr73361167plo.62.1637291596777; Thu, 18
 Nov 2021 19:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
 <a2891f6d-f383-f252-4b82-da08b2a2c1d7@redhat.com>
 <3e55da77-66e1-d9ac-e23a-3fa0beceec8e@redhat.com>
In-Reply-To: <3e55da77-66e1-d9ac-e23a-3fa0beceec8e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 19 Nov 2021 04:13:03 +0100
Message-ID: <CABgObfYnJ+TjDbbBcpnx39q+sNA8_ec_mNV7FVUCp3qDDY5R-A@mail.gmail.com>
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000005299f05d11ba8d3"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005299f05d11ba8d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El jue., 18 nov. 2021 16:31, Hanna Reitz <hreitz@redhat.com> escribi=C3=B3:

> On 18.11.21 14:50, Paolo Bonzini wrote:
> > On 11/15/21 17:03, Hanna Reitz wrote:
> >>
> >> I only really see four solutions for this:
> >> (1) We somehow make the amend job run in the main context under the
> >> BQL and have it prevent all concurrent I/O access (seems bad)
> >> (2) We can make the permission functions part of the I/O path (seems
> >> wrong and probably impossible?)
> >> (3) We can drop the permissions update and permanently require the
> >> permissions that we need when updating keys (I think this might break
> >> existing use cases)
> >> (4) We can acquire the BQL around the permission update call and
> >> perhaps that works?
> >>
> >> I don=E2=80=99t know how (4) would work but it=E2=80=99s basically the=
 only
> >> reasonable solution I can come up with.  Would this be a way to call
> >> a BQL function from an I/O function?
> >
> > I think that would deadlock:
> >
> >     main                I/O thread
> >     --------            -----
> >     start bdrv_co_amend
> >                     take BQL
> >     bdrv_drain
> >     ... hangs ...
>
> :/
>
> Is there really nothing we can do?  Forgive me if I=E2=80=99m talking com=
plete
> nonsense here (because frankly I don=E2=80=99t even really know what a bo=
ttom
> half is exactly), but can=E2=80=99t we schedule some coroutine in the mai=
n
> thread to do the perm notifications and wait for them in the I/O thread?
>

I think you still get a deadlock, just one with a longer chain. You still
have a cycle of things depending on each other, but one of them is now the
I/O thread waiting for the bottom half.

Hmm...  Perhaps.  We would need to undo the permission change when the
> job finishes, though, i.e. in JobDriver.prepare() or JobDriver.clean().
> Doing the change in qmp_x_blockdev_amend() would be asymmetric then, so
> we=E2=80=99d probably want a new JobDriver method that runs in the main t=
hread
> before .run() is invoked. (Unfortunately, =E2=80=9C.prepare()=E2=80=9D is=
 now taken
> already...)
>

Ok at least it's feasible.

Doesn=E2=80=99t solve the FUSE problem, but there we could try to just take=
 the
> RESIZE permission permanently and if that fails, we just don=E2=80=99t al=
low
> truncates for that export.  Not nice, but should work for common cases.
>

Yeah definitely not nice. Probably permissions could be protected by their
own mutex, even a global one like the one we have for jobs. For now I
suggest just ignoring the problem and adding a comment, since it's not
really something that didn't exist.

Paolo

--00000000000005299f05d11ba8d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">El jue., 18 nov. 2021 16:31, Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; escribi=C3=B3:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 18.11.21 14:50, Paolo Bonzini wrote:=
<br>
&gt; On 11/15/21 17:03, Hanna Reitz wrote:<br>
&gt;&gt;<br>
&gt;&gt; I only really see four solutions for this:<br>
&gt;&gt; (1) We somehow make the amend job run in the main context under th=
e <br>
&gt;&gt; BQL and have it prevent all concurrent I/O access (seems bad)<br>
&gt;&gt; (2) We can make the permission functions part of the I/O path (see=
ms <br>
&gt;&gt; wrong and probably impossible?)<br>
&gt;&gt; (3) We can drop the permissions update and permanently require the=
 <br>
&gt;&gt; permissions that we need when updating keys (I think this might br=
eak <br>
&gt;&gt; existing use cases)<br>
&gt;&gt; (4) We can acquire the BQL around the permission update call and <=
br>
&gt;&gt; perhaps that works?<br>
&gt;&gt;<br>
&gt;&gt; I don=E2=80=99t know how (4) would work but it=E2=80=99s basically=
 the only <br>
&gt;&gt; reasonable solution I can come up with.=C2=A0 Would this be a way =
to call <br>
&gt;&gt; a BQL function from an I/O function?<br>
&gt;<br>
&gt; I think that would deadlock:<br>
&gt;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0main=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I/O thread<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0--------=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -----<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0start bdrv_co_amend<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 take BQL<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0bdrv_drain<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0... hangs ...<br>
<br>
:/<br>
<br>
Is there really nothing we can do?=C2=A0 Forgive me if I=E2=80=99m talking =
complete <br>
nonsense here (because frankly I don=E2=80=99t even really know what a bott=
om <br>
half is exactly), but can=E2=80=99t we schedule some coroutine in the main =
<br>
thread to do the perm notifications and wait for them in the I/O thread?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I t=
hink you still get a deadlock, just one with a longer chain. You still have=
 a cycle of things depending on each other, but one of them is now the I/O =
thread waiting for the bottom half.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hmm..=
.=C2=A0 Perhaps.=C2=A0 We would need to undo the permission change when the=
 <br>
job finishes, though, i.e. in JobDriver.prepare() or JobDriver.clean().=C2=
=A0 <br>
Doing the change in qmp_x_blockdev_amend() would be asymmetric then, so <br=
>
we=E2=80=99d probably want a new JobDriver method that runs in the main thr=
ead <br>
before .run() is invoked. (Unfortunately, =E2=80=9C.prepare()=E2=80=9D is n=
ow taken <br>
already...)<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Ok at least it&#39;s feasible.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Doesn=E2=80=99t solve the FUSE problem, but there we could try to just tak=
e the <br>
RESIZE permission permanently and if that fails, we just don=E2=80=99t allo=
w <br>
truncates for that export.=C2=A0 Not nice, but should work for common cases=
.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Yeah definitely not nice. Probably permissions could be protected by their=
 own mutex, even a global one like the one we have for jobs. For now I sugg=
est just ignoring the problem and adding a comment, since it&#39;s not real=
ly something that didn&#39;t exist.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Paolo</div></div>

--00000000000005299f05d11ba8d3--


