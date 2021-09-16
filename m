Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E6540EB22
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 21:51:25 +0200 (CEST)
Received: from localhost ([::1]:36610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQxPo-0005mR-FG
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 15:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQxNt-0004n7-41
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQxNp-00034r-Ia
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631821758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dPn2qqU0bKo34+6HyvsSo50Lp3Jr+UfW3s6jQx2nnyY=;
 b=YZAzqHLrt5skQJRaeob4JoNhSpWLXX43FGKbCeWoR1A5uEh/wHlTxfwhtsMfWex7DaD7Dr
 TJsBhqIs5QZoRuo5H0d9RbPzgL5s0Ego3WlXGdZLfODAthxjjsX5EXCeLq6WgeweBM5FjC
 dm6gMKYnNqaiUxRUPnznlEZiNU9JjbQ=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-DegI3wA4MR6orlz9_HzZ4A-1; Thu, 16 Sep 2021 15:49:16 -0400
X-MC-Unique: DegI3wA4MR6orlz9_HzZ4A-1
Received: by mail-pf1-f197.google.com with SMTP id
 127-20020a621685000000b0043376b0ce1dso5568005pfw.22
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 12:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPn2qqU0bKo34+6HyvsSo50Lp3Jr+UfW3s6jQx2nnyY=;
 b=To6FkBUpo7gnSaGyYy/EV0nLojDLsiB4ErEE8huXsbwrjEP+tlOwADPtjE2hsM7h5g
 TG6Ngtw0f51EOqJ3US+KJtGPr0+CB2Rj92k4bEXKbuWaOXQCnX2PXGC3sMInDZlpt3xo
 2AkdtnP4J8xlhgE2D0VWGAA2s+lvlWcdHU4YTmLav790Sq897eV/wCYqiws6YhlZxKE+
 dMSM89VWac5dHokz3EEM4OWbpgq/edw1MdYwzbFxaCvHDZY4oo1qBLYvxuqiVPjBS5M1
 hvCyCU9XTPtVcdr3dpO54eIJt9WICb7QUWjsHOyV1pjCJjBxpKirRGUHXStkf8uL1Gb7
 IoRw==
X-Gm-Message-State: AOAM530v3KAr3pN+I0yOAYVKh9FOC6iHwZoOIQUc8ajojpwF2Jua/JMw
 sFCi6OkJN7/3YewQgXO7mE7Bo+fevpbCat6YprotbLo9GSPhrojSDBT/1dz7UUGNcxUbTRN/ENw
 HJ97mMQxbaLw0qAMr3LCSV4/BYO/WFW4=
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr16618317pjk.13.1631821755324; 
 Thu, 16 Sep 2021 12:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2+cRfPgMyU7PVoKWb0I2HmKQlseV9vkUoDANQf9aJZtygfqf+gMjT2hffXDiAvbj3uJyFOwESYI8sMjCIaiA=
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr16618281pjk.13.1631821754953; 
 Thu, 16 Sep 2021 12:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210908131021.774533-1-eesposit@redhat.com>
 <YT9NuK84J2hvMXs2@stefanha-x1.localdomain>
 <916c8456-9433-42a0-df2d-3e62ced283fd@redhat.com>
 <YUIGlyfL+SleHCAc@stefanha-x1.localdomain>
 <7bf39273-3349-c378-25c4-6a72129bd3fd@redhat.com>
In-Reply-To: <7bf39273-3349-c378-25c4-6a72129bd3fd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 16 Sep 2021 21:49:02 +0200
Message-ID: <CABgObfYtR_a3EgTN18V8XyuN6pPGw-hb2VMQGcCoZ9NBQhm=tA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] block layer: split block APIs in graph and I/O
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000a8e4405cc221cbe"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000a8e4405cc221cbe
Content-Type: text/plain; charset="UTF-8"

I think either -global or -global-state.

Paolo


Il gio 16 set 2021, 16:03 Emanuele Giuseppe Esposito <eesposit@redhat.com>
ha scritto:

>
>
> On 15/09/2021 16:43, Stefan Hajnoczi wrote:
> > On Wed, Sep 15, 2021 at 02:11:41PM +0200, Paolo Bonzini wrote:
> >> On 13/09/21 15:10, Stefan Hajnoczi wrote:
> >>> On Wed, Sep 08, 2021 at 09:10:17AM -0400, Emanuele Giuseppe Esposito
> wrote:
> >>>> Currently, block layer APIs like block-backend.h contain a mix of
> >>>> functions that are either running in the main loop and under the
> >>>> BQL, or are thread-safe functions and run in iothreads performing I/O.
> >>>> The functions running under BQL also take care of modifying the
> >>>> block graph, by using drain and/or aio_context_acquire/release.
> >>>> This makes it very confusing to understand where each function
> >>>> runs, and what assumptions it provided with regards to thread
> >>>> safety.
> >>>>
> >>>> We call the functions running under BQL "graph API", and
> >>>> distinguish them from the thread-safe "I/O API".
> >>>
> >>> Maybe "BQL" is clearer than "graph" because not all functions
> classified
> >>> as "graph" need to traverse/modify the graph.
> >>
> >> Bikeshedding, I like it! :)
> >>
> >> ... on the other hand, qemu-storage-daemon does not have a BQL (see
> patch
> >> 1); "graph API" functions run from the main (monitor) thread.
> >>
> >> The characteristic of the "graph API" is that they affect global state,
> so
> >> another possibility could be "global state API".  But is there any
> global
> >> state apart from the BlockDriverState graph and the associated
> >> BlockBackends?
> >
> > I would be happy with that name too.
> >
>
> Sounds good to me too, thanks.
> One more minor cosmetic thing: should I name the header
> block-backend-global-state.h or using block-backend-gs.h is
> straightforward enough?
>
> Thank you,
> Emanuele
>
>

--0000000000000a8e4405cc221cbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think either -global or -global-state.<div dir=3D"auto"=
><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il gio =
16 set 2021, 16:03 Emanuele Giuseppe Esposito &lt;<a href=3D"mailto:eesposi=
t@redhat.com">eesposit@redhat.com</a>&gt; ha scritto:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><br>
<br>
On 15/09/2021 16:43, Stefan Hajnoczi wrote:<br>
&gt; On Wed, Sep 15, 2021 at 02:11:41PM +0200, Paolo Bonzini wrote:<br>
&gt;&gt; On 13/09/21 15:10, Stefan Hajnoczi wrote:<br>
&gt;&gt;&gt; On Wed, Sep 08, 2021 at 09:10:17AM -0400, Emanuele Giuseppe Es=
posito wrote:<br>
&gt;&gt;&gt;&gt; Currently, block layer APIs like block-backend.h contain a=
 mix of<br>
&gt;&gt;&gt;&gt; functions that are either running in the main loop and und=
er the<br>
&gt;&gt;&gt;&gt; BQL, or are thread-safe functions and run in iothreads per=
forming I/O.<br>
&gt;&gt;&gt;&gt; The functions running under BQL also take care of modifyin=
g the<br>
&gt;&gt;&gt;&gt; block graph, by using drain and/or aio_context_acquire/rel=
ease.<br>
&gt;&gt;&gt;&gt; This makes it very confusing to understand where each func=
tion<br>
&gt;&gt;&gt;&gt; runs, and what assumptions it provided with regards to thr=
ead<br>
&gt;&gt;&gt;&gt; safety.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; We call the functions running under BQL &quot;graph API&qu=
ot;, and<br>
&gt;&gt;&gt;&gt; distinguish them from the thread-safe &quot;I/O API&quot;.=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Maybe &quot;BQL&quot; is clearer than &quot;graph&quot; becaus=
e not all functions classified<br>
&gt;&gt;&gt; as &quot;graph&quot; need to traverse/modify the graph.<br>
&gt;&gt;<br>
&gt;&gt; Bikeshedding, I like it! :)<br>
&gt;&gt;<br>
&gt;&gt; ... on the other hand, qemu-storage-daemon does not have a BQL (se=
e patch<br>
&gt;&gt; 1); &quot;graph API&quot; functions run from the main (monitor) th=
read.<br>
&gt;&gt;<br>
&gt;&gt; The characteristic of the &quot;graph API&quot; is that they affec=
t global state, so<br>
&gt;&gt; another possibility could be &quot;global state API&quot;.=C2=A0 B=
ut is there any global<br>
&gt;&gt; state apart from the BlockDriverState graph and the associated<br>
&gt;&gt; BlockBackends?<br>
&gt; <br>
&gt; I would be happy with that name too.<br>
&gt; <br>
<br>
Sounds good to me too, thanks.<br>
One more minor cosmetic thing: should I name the header <br>
block-backend-global-state.h or using block-backend-gs.h is <br>
straightforward enough?<br>
<br>
Thank you,<br>
Emanuele<br>
<br>
</blockquote></div>

--0000000000000a8e4405cc221cbe--


