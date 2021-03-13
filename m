Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7B339D7E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 11:06:56 +0100 (CET)
Received: from localhost ([::1]:33662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL1Ad-0002gA-4B
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 05:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL19U-00028N-31
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 05:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL19S-0000NB-6v
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 05:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615629941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDRuux+fKj38+t/AkJDOyYNJj6wA/8dRWw5CzEjTOAQ=;
 b=UhDJCNceSylHBpyHJCEsjJXHi3I1f/Q/KQjye5mtXddp7KfiuqFsEbS9PNZOPJ/GllLYrK
 7Kuprep/MU5+21Xe5GzhAkCmNiQA+6JepQvirHsx2GApIAPIJq2b9+2xzuqs8L0F3Ch/FS
 ftpZ3fDpvyHk5KIaHHyt9e9mPFpkdHI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-qFYPSI0IMEyS9pRR555_kQ-1; Sat, 13 Mar 2021 05:05:38 -0500
X-MC-Unique: qFYPSI0IMEyS9pRR555_kQ-1
Received: by mail-pf1-f199.google.com with SMTP id g6so10840352pfo.2
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 02:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gDRuux+fKj38+t/AkJDOyYNJj6wA/8dRWw5CzEjTOAQ=;
 b=t3/ZwzCemBYvgV+1rffQ26jJBWuAfSzx9MgPCvAAVUL7IG78WnIU9GyASw7a0GfHre
 U+Y1X2aPSou3JIFoNNMvqryuhWFshPe7oAiWLNl6bWj/ChtilmpLgm7hMmqPEgl7x3GS
 Dp0kXWZ6iYV7maaWYAkfSR6uDS4nLbRGKPlmpEWnk3mf9d0gH3A6J8JJRo6nuiA+Ky4T
 CijPuEWhWacCHzaNnTWWDyiCsYfHZMZ2nT3bezgbZdjM8jXx6NjHst46MHrJpTr7uMze
 zCpqt46MdgK0xBcOneF39ZmNb/t+zUtfReKkbHvkC3XjYVTQjMhJj29NMo7CKxkQYRnK
 pSbQ==
X-Gm-Message-State: AOAM533JwVHytUVq06+fvPt1P0hIzhn52Y3d9S1+M4VwqLu8g6LT0TKN
 +QXjHE4AGgNWMRph51NrvIs1YRNlFIDXpBvzyb/xc/4Pru5no4a5sVnebttbA1/1yyDHcPtOe/+
 AECEeTJVm0mP447KU+kita8LqirIOl4k=
X-Received: by 2002:a17:90a:5d14:: with SMTP id
 s20mr2916459pji.6.1615629937411; 
 Sat, 13 Mar 2021 02:05:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJHZOxPsg1uj+o4r8G6+f8sW2dlOm4a+wZJom1cxa6bZu1iLuDCnceCVOipaaaKTMsHxAistg8llm50jZAqa4=
X-Received: by 2002:a17:90a:5d14:: with SMTP id
 s20mr2916441pji.6.1615629937131; 
 Sat, 13 Mar 2021 02:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-3-pbonzini@redhat.com>
 <87im5vv0j4.fsf@dusky.pond.sub.org>
In-Reply-To: <87im5vv0j4.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 13 Mar 2021 11:05:25 +0100
Message-ID: <CABgObfZbaqiEeNcm7XrEMAgAzp8_xrROFof3VuUKsfK1CCeTdA@mail.gmail.com>
Subject: Re: [PATCH 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007dd5b205bd682844"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007dd5b205bd682844
Content-Type: text/plain; charset="UTF-8"

I will use ObjectOptionsQueue like the typedef just above.

Paolo


Il sab 13 mar 2021, 10:57 Markus Armbruster <armbru@redhat.com> ha scritto:

> One more little thing...
>
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > Emulators are currently using OptsVisitor (via user_creatable_add_opts)
> > to parse the -object command line option.  This has one extra feature,
> > compared to keyval, which is automatic conversion of integers to lists
> > as well as support for lists as repeated options:
> >
> >   -object
> memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind
> >
> > So we cannot replace OptsVisitor with keyval right now.  Still, this
> > patch moves the user_creatable_add_opts logic to vl.c since it is
> > not needed anywhere else, and makes it go through
> user_creatable_add_qapi.
> >
> > In order to minimize code changes, the predicate still takes a string.
> > This can be changed later to use the ObjectType QAPI enum directly.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [...]
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index ff488ea3e7..b245e912e5 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -117,6 +117,7 @@
> >  #include "qapi/qapi-commands-block-core.h"
> >  #include "qapi/qapi-commands-migration.h"
> >  #include "qapi/qapi-commands-misc.h"
> > +#include "qapi/qapi-visit-qom.h"
> >  #include "qapi/qapi-commands-ui.h"
> >  #include "qapi/qmp/qerror.h"
> >  #include "sysemu/iothread.h"
> > @@ -132,10 +133,16 @@ typedef struct BlockdevOptionsQueueEntry {
> >
> >  typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
> >
> > +typedef struct ObjectOption {
> > +    ObjectOptions *opts;
> > +    QTAILQ_ENTRY(ObjectOption) next;
> > +} ObjectOption;
> > +
>
> The names feel awkward.
>
> ObjectOption represents a -object option.  Fair enough.
>
> ObjectOptions represents the "options" in its option argument.
>
> Confusing.  Calling the whole thing and one of its parts the same is a
> bad idea.
>
> I never liked calling the key=value things in option arguments
> "options".  They aren't CLI options, they are optional CLI option
> parameters.
>
> I also don't like calling so many different things "object" (QObject,
> Object, ObjectOption, ObjectOptions), but that feels out of scope here.
>
> Can we please rename ObjectOptions?
>
> A naming convention for CLI option argument types and boxed QMP command
> argument types would be nice.
>
> [...]
>
>

--0000000000007dd5b205bd682844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I will use ObjectOptionsQueue like the typedef just =
above.</div><div dir=3D"auto"><br><div dir=3D"auto">Paolo</div><br><br><div=
 class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">I=
l sab 13 mar 2021, 10:57 Markus Armbruster &lt;<a href=3D"mailto:armbru@red=
hat.com">armbru@redhat.com</a>&gt; ha scritto:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">One more little thing...<br>
<br>
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; writes:<br>
<br>
&gt; Emulators are currently using OptsVisitor (via user_creatable_add_opts=
)<br>
&gt; to parse the -object command line option.=C2=A0 This has one extra fea=
ture,<br>
&gt; compared to keyval, which is automatic conversion of integers to lists=
<br>
&gt; as well as support for lists as repeated options:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0-object memory-backend-ram,id=3Dpc.ram,size=3D1048576000,h=
ost-nodes=3D0,policy=3Dbind<br>
&gt;<br>
&gt; So we cannot replace OptsVisitor with keyval right now.=C2=A0 Still, t=
his<br>
&gt; patch moves the user_creatable_add_opts logic to vl.c since it is<br>
&gt; not needed anywhere else, and makes it go through user_creatable_add_q=
api.<br>
&gt;<br>
&gt; In order to minimize code changes, the predicate still takes a string.=
<br>
&gt; This can be changed later to use the ObjectType QAPI enum directly.<br=
>
&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
[...]<br>
&gt; diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
&gt; index ff488ea3e7..b245e912e5 100644<br>
&gt; --- a/softmmu/vl.c<br>
&gt; +++ b/softmmu/vl.c<br>
&gt; @@ -117,6 +117,7 @@<br>
&gt;=C2=A0 #include &quot;qapi/qapi-commands-block-core.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qapi-commands-migration.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qapi-commands-misc.h&quot;<br>
&gt; +#include &quot;qapi/qapi-visit-qom.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qapi-commands-ui.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/qmp/qerror.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/iothread.h&quot;<br>
&gt; @@ -132,10 +133,16 @@ typedef struct BlockdevOptionsQueueEntry {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptio=
nsQueue;<br>
&gt;=C2=A0 <br>
&gt; +typedef struct ObjectOption {<br>
&gt; +=C2=A0 =C2=A0 ObjectOptions *opts;<br>
&gt; +=C2=A0 =C2=A0 QTAILQ_ENTRY(ObjectOption) next;<br>
&gt; +} ObjectOption;<br>
&gt; +<br>
<br>
The names feel awkward.<br>
<br>
ObjectOption represents a -object option.=C2=A0 Fair enough.<br>
<br>
ObjectOptions represents the &quot;options&quot; in its option argument.<br=
>
<br>
Confusing.=C2=A0 Calling the whole thing and one of its parts the same is a=
<br>
bad idea.<br>
<br>
I never liked calling the key=3Dvalue things in option arguments<br>
&quot;options&quot;.=C2=A0 They aren&#39;t CLI options, they are optional C=
LI option<br>
parameters.<br>
<br>
I also don&#39;t like calling so many different things &quot;object&quot; (=
QObject,<br>
Object, ObjectOption, ObjectOptions), but that feels out of scope here.<br>
<br>
Can we please rename ObjectOptions?<br>
<br>
A naming convention for CLI option argument types and boxed QMP command<br>
argument types would be nice.<br>
<br>
[...]<br>
<br>
</blockquote></div></div></div>

--0000000000007dd5b205bd682844--


