Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14584102ED
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 04:16:32 +0200 (CEST)
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRPu4-0008CT-3Q
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 22:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRPrw-0006Y0-7X
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 22:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mRPrt-0003Oj-2b
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 22:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631931255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LK95A3s2mRSQavK5ywiTWN4qCdGRcBxGCulAbHMY6Mk=;
 b=DO59z153Q2KooMBJnfKPxATPkiKNJ51UhnK3vRm4uDqKVj7yV2P3iVuqNerCon/ypOqQRS
 1L1ZYNrowogH85ngLqhbvzsBn8mTzNWiqZlvUNyIEyge7TqaVz/M2IM2Czt5TNYwjXHWvA
 1vsdRvjvCdi6MnfLfBFZX0FIEgneHTg=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Phxwyp4NMpaR9gJeF9sM5A-1; Fri, 17 Sep 2021 22:14:12 -0400
X-MC-Unique: Phxwyp4NMpaR9gJeF9sM5A-1
Received: by mail-oo1-f72.google.com with SMTP id
 bc36-20020a05682016a400b0028c8e8a2746so39591619oob.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 19:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LK95A3s2mRSQavK5ywiTWN4qCdGRcBxGCulAbHMY6Mk=;
 b=WI1lh+Y9/OqkiSbAcYRr9tLDg6MroSKYzv1cMvTZdrqFaXO6vBjrHlM2RsCaFP/lrl
 BpV/bKDhdNitMeL2iJcUK1hkgBhH8bR7zWLOx0shzXrAX1n/J1YlJFJIlJ+/mbpr01bv
 wA+x9gQE3XI/pXxca3aRNdKDmJs2akG0O+nCpsXWbZEMNNOqJMfsb58rHm1clHAN3YB1
 /16q+ZfAe/MdWQ47PcmgkSiDI92cjQU/bNInCJRSAnoNOYU38aUxZkXSh6jADQFpLrUO
 FyyTf252NB8ZIEcg+c8l3lzePCvCGTpKjnX+QfxKH6q3rF/DWnbwatme3L/VYog0atbT
 7Ydg==
X-Gm-Message-State: AOAM532d3mTMRqOHRjDI6N2kwlQBEWDwlT2d7F38Zj1YQXoDs45QxMmd
 b5UVxnkdGF6n5M10DCEP/5CCalVF1sXEiQD8OGkm10cNCyakWmQBf+CZQxG4Xk7mZS0gCqlTRLh
 /5yTScpW5fRecgAGO1+i3ODhPjZ20FcY=
X-Received: by 2002:aca:3887:: with SMTP id f129mr7979086oia.112.1631931251642; 
 Fri, 17 Sep 2021 19:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypvjZcHS2VvSt5ggJYk5+Ho8ttetUiTLw4ysM6jywUkKD3ssCzP3pgS4hqjvWo+ichu9+8aG1CdUPUfS/QKdA=
X-Received: by 2002:aca:3887:: with SMTP id f129mr7979077oia.112.1631931251479; 
 Fri, 17 Sep 2021 19:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-13-jsnow@redhat.com>
 <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
 <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
In-Reply-To: <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 22:14:00 -0400
Message-ID: <CAFn=p-bTtRWdLhMuaQdH=pSy26KytrfXcidO4RePBunXxwUbSA@mail.gmail.com>
Subject: Re: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008aea6a05cc3b9ab3"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000008aea6a05cc3b9ab3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 8:58 PM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>> On 17.09.21 07:40, John Snow wrote:
>> > Disable the aqmp logger, which likes to (at the moment) print out
>> > intermediate warnings and errors that cause session termination; disab=
le
>> > them so they don't interfere with the job output.
>> >
>> > Leave any "CRITICAL" warnings enabled though, those are ones that we
>> > should never see, no matter what.
>>
>> I mean, looks OK to me, but from what I understand (i.e. little),
>> qmp_client doesn=E2=80=99t log CRITICAL messages, at least I can=E2=80=
=99t see any. Only
>> ERRORs.
>>
>>
> There's *one* critical message in protocol.py, used for a circumstance
> that I *think* should be impossible. I do not think I currently use any
> WARNING level statements.
>
>
>> I guess I=E2=80=99m missing some CRITICAL messages in external functions=
 called
>> from qmp_client.py, but shouldn=E2=80=99t we still keep ERRORs?
>>
>
> ...Mayyyyyybe?
>
> The errors logged by AQMP are *almost always* raised as Exceptions
> somewhere else, eventually. Sometimes when we encounter them in one
> context, we need to save them and then re-raise them in a different
> execution context. There's one good exception to this: My pal, EOFError.
>
> If the reader context encounters EOF, it raises EOFError and this causes =
a
> disconnect to be scheduled asynchronously. *Any* Exception that causes a
> disconnect to be scheduled asynchronously is dutifully logged as an ERROR=
.
> At this point in the code, we don't really know if the user of the librar=
y
> considers this an "error" yet or not. I've waffled a lot on how exactly t=
o
> treat this circumstance. ...Hm, I guess that's really the only case where=
 I
> have an error that really ought to be suppressed. I suppose what I will d=
o
> here is: if the exception happens to be an EOFError I will drop the
> severity of the log message down to INFO. I don't know why it takes being
> challenged on this stuff to start thinking clearly about it, but here we
> are. Thank you for your feedback :~)
>
> --js
>

Oh, CI testing reminds me of why I am a liar here.

the mirror-top-perms test intentionally expects not to be able to connect,
but we're treated to these two additional lines of output:

+ERROR:qemu.aqmp.qmp_client.qemub-2536319:Negotiation failed: EOFError
+ERROR:qemu.aqmp.qmp_client.qemub-2536319:Failed to establish session:
EOFError

Uh. I guess a temporary suppression in mirror-top-perms, then ...? In most
other cases I rather imagine we do want to see this kind of output to help
give more information about how things have failed -- they ARE errors. We
just happen to not care about them right here. The only thing I don't
exactly like about this is that it requires some knowledge by the caller to
know to disable it. It makes writing negative tests a bit more annoying
because the library leans so heavily on yelling loudly when it encounters
problems.

--0000000000008aea6a05cc3b9ab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 8:58 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz &lt;<a=
 href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17=
.09.21 07:40, John Snow wrote:<br>
&gt; Disable the aqmp logger, which likes to (at the moment) print out<br>
&gt; intermediate warnings and errors that cause session termination; disab=
le<br>
&gt; them so they don&#39;t interfere with the job output.<br>
&gt;<br>
&gt; Leave any &quot;CRITICAL&quot; warnings enabled though, those are ones=
 that we<br>
&gt; should never see, no matter what.<br>
<br>
I mean, looks OK to me, but from what I understand (i.e. little), <br>
qmp_client doesn=E2=80=99t log CRITICAL messages, at least I can=E2=80=99t =
see any. Only <br>
ERRORs.<br>
<br></blockquote><div><br></div><div>There&#39;s *one* critical message in =
protocol.py, used for a circumstance that I *think* should be impossible. I=
 do not think I currently use any WARNING level statements.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I guess I=E2=80=99m missing some CRITICAL messages in external functions ca=
lled <br>
from qmp_client.py, but shouldn=E2=80=99t we still keep ERRORs?<br></blockq=
uote><div><br></div><div>...Mayyyyyybe?</div><div><br></div><div>The errors=
 logged by AQMP are *almost always* raised as Exceptions somewhere else, ev=
entually. Sometimes when we encounter them in one context, we need to save =
them and then re-raise them in a different execution context. There&#39;s o=
ne good exception to this: My pal, EOFError.</div><div><br></div><div>If th=
e reader context encounters EOF, it raises EOFError and this causes a disco=
nnect to be scheduled asynchronously. *Any* Exception that causes a disconn=
ect to be scheduled asynchronously is dutifully logged as an ERROR. At this=
 point in the code, we don&#39;t really know if the user of the library con=
siders this an &quot;error&quot; yet or not. I&#39;ve waffled a lot on how =
exactly to treat this circumstance. ...Hm, I guess that&#39;s really the on=
ly case where I have an error that really ought to be suppressed. I suppose=
 what I will do here is: if the exception happens to be an EOFError I will =
drop the severity of the log message down to INFO. I don&#39;t know why it =
takes being challenged on this stuff to start thinking clearly about it, bu=
t here we are. Thank you for your feedback :~)</div><div><br></div><div>--j=
s<br></div></div></div></blockquote><div><br></div><div>Oh, CI testing remi=
nds me of why I am a liar here.<br><br></div><div>the mirror-top-perms test=
 intentionally expects not to be able to connect, but we&#39;re treated to =
these two additional lines of output:<br><br>+ERROR:qemu.aqmp.qmp_client.qe=
mub-2536319:Negotiation failed: EOFError<br>+ERROR:qemu.aqmp.qmp_client.qem=
ub-2536319:Failed to establish session: EOFError<br></div><div><br></div><d=
iv>Uh. I guess a temporary suppression in mirror-top-perms, then ...? In mo=
st other cases I rather imagine we do want to see this kind of output to he=
lp give more information about how things have failed -- they ARE errors. W=
e just happen to not care about them right here. The only thing I don&#39;t=
 exactly like about this is that it requires some knowledge by the caller t=
o know to disable it. It makes writing negative tests a bit more annoying b=
ecause the library leans so heavily on yelling loudly when it encounters pr=
oblems.<br></div></div></div>

--0000000000008aea6a05cc3b9ab3--


