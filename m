Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907B4E7677
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:14:22 +0100 (CET)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXldt-0003Yb-H2
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:14:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXlbI-0001py-Ff
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXlbD-0006XP-K8
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648221094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KvuhQVYZFvpcoGt0K8QuKFoZK90lq7ElgtihbTpkqZ4=;
 b=SJXle9Fv7GNRnKBBRLpOpgJLfDMtkKLevt30G5g89DJTMXA/wGY5Sck/2DI6MrmqW/Y99w
 aW8i0OWT747shrFcvEgDKajA6srsGDjCZIzEdn9GuDp1WZBuu2fpoCZAPJ4rYGfkLgWkwQ
 bvdpqtrGCuMdEf5Eri1w9f9o1oc9X2c=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-yHZAio9aML-nWm3rRNZq9g-1; Fri, 25 Mar 2022 11:11:33 -0400
X-MC-Unique: yHZAio9aML-nWm3rRNZq9g-1
Received: by mail-vs1-f69.google.com with SMTP id
 s18-20020a67df12000000b00324c903413cso1750973vsk.23
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 08:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvuhQVYZFvpcoGt0K8QuKFoZK90lq7ElgtihbTpkqZ4=;
 b=Rhq2ViD7PAljr8UPi+qVOXhixMEdBg16r6KfZg1mBLrCg91tNKu5LVKRUoYO992ofP
 5evKPAjbsn0gTyG33pt0Aw0O3u1RdP4r99p4ORx8j+cvi4R/MNSJWNdy+j9BoZJWLU2j
 8RT/6wNLj/ZxU0ZJ62z5/9duoPwtF28mhNymaT3TpVIfoO7DaIb1zCrovnzUKECHWtS8
 yzU1LDmZvyJM89NqWs6mgDDAcA8+jRf8k0m7YoM8WGovOlxnizmClycjVIrIo2NX1L6q
 hUHX8/wyKKSh19i8L0rxrxq7255Kj+d9Fc6xpyPJmAzvp9FUXeP7RbFZTCfRTYnP00zh
 OTwg==
X-Gm-Message-State: AOAM53392PxbVnDjHw5AfFJS+l5CgIgsFKK7Sy95uRJgklSHbZzYnwQN
 u7CEsBuhEJKauHd1KLa2NeaqTLu80ItRoN9IYLZybusAy+uqI3l+/Pe1OgQ5fjss5PgQmjvmZ3g
 sSrOW37tfGku0yDHfeMR7QomaIlpwTjI=
X-Received: by 2002:a05:6122:2186:b0:33f:c30b:9b46 with SMTP id
 j6-20020a056122218600b0033fc30b9b46mr3896593vkd.26.1648221092410; 
 Fri, 25 Mar 2022 08:11:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/IKOazYjRnZMGTyw4u4jjX0bYrbtW+lRNq8ArggjTxlgW1b8vQHH/+A0BJiBWF3dS/qVXLzPjwYv83m6uyZ0=
X-Received: by 2002:a05:6122:2186:b0:33f:c30b:9b46 with SMTP id
 j6-20020a056122218600b0033fc30b9b46mr3896558vkd.26.1648221092103; Fri, 25 Mar
 2022 08:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-2-victortoso@redhat.com> <87tubmnrde.fsf@pond.sub.org>
In-Reply-To: <87tubmnrde.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 25 Mar 2022 11:11:23 -0400
Message-ID: <CAFn=p-bS-at1xvCok2LZzXhgFtc14E-2GfTCZf6Se2Fm6Q6PWA@mail.gmail.com>
Subject: Re: [PATCH 01/14] qapi: BlockExportRemoveMode: move comments to TODO
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b4d5e005db0c60e9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b4d5e005db0c60e9
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 25, 2022, 8:33 AM Markus Armbruster <armbru@redhat.com> wrote:

> Victor Toso <victortoso@redhat.com> writes:
>
> > @hide and @soft are potential additions which fits the TODO section
> > perfectly.
> >
> > The main motivation is to avoid this whole block of comment entering
> > the wrong section in the python parser.
> >
> > Signed-off-by: Victor Toso <victortoso@redhat.com>
> > ---
> >  qapi/block-export.json | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/qapi/block-export.json b/qapi/block-export.json
> > index f183522d0d..1e34927f85 100644
> > --- a/qapi/block-export.json
> > +++ b/qapi/block-export.json
> > @@ -219,13 +219,13 @@
> >  #
> >  # @hard: Drop all connections immediately and remove export.
> >  #
> > -# Potential additional modes to be added in the future:
> > +# TODO: Potential additional modes to be added in the future:
> >  #
> > -# hide: Just hide export from new clients, leave existing connections
> as is.
> > -# Remove export after all clients are disconnected.
> > +#       hide: Just hide export from new clients, leave existing
> connections as is.
> > +#       Remove export after all clients are disconnected.
> >  #
> > -# soft: Hide export from new clients, answer with ESHUTDOWN for all
> further
> > -# requests from existing clients.
> > +#       soft: Hide export from new clients, answer with ESHUTDOWN for
> all further
> > +#       requests from existing clients.
> >  #
> >  # Since: 2.12
> >  ##
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Doc comments embed user documentation in the source code.  The doc
> generator extracts it.
>
> TODOs are generally for developers.  Should the doc generator suppress
> TODO sections?
>

Needs an audit to make sure we're using it consistently with that semantic,
but broadly it's probably a good idea to squelch "internal" todos, yes.

Things like "Watch out, were definitely gonna deprecate this soon probably
maybe!" can stay outside of the TODO section. (Sometimes heads up are
legitimate, even if most won't read them. the faithful and diligent will be
rewarded with painless upgrades.)

Anyway, if Markus is happy with this change, I am too, I was just curious
to know if there were bigger cleanups to do here and what the impact was.

Anyway:

Reviewed-by: John Snow <jsnow@redhat.com>

>

--000000000000b4d5e005db0c60e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022, 8:33 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Victor Toso &lt;<a href=3D"mailto:victorto=
so@redhat.com" target=3D"_blank" rel=3D"noreferrer">victortoso@redhat.com</=
a>&gt; writes:<br>
<br>
&gt; @hide and @soft are potential additions which fits the TODO section<br=
>
&gt; perfectly.<br>
&gt;<br>
&gt; The main motivation is to avoid this whole block of comment entering<b=
r>
&gt; the wrong section in the python parser.<br>
&gt;<br>
&gt; Signed-off-by: Victor Toso &lt;<a href=3D"mailto:victortoso@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">victortoso@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qapi/block-export.json | 10 +++++-----<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/qapi/block-export.json b/qapi/block-export.json<br>
&gt; index f183522d0d..1e34927f85 100644<br>
&gt; --- a/qapi/block-export.json<br>
&gt; +++ b/qapi/block-export.json<br>
&gt; @@ -219,13 +219,13 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # @hard: Drop all connections immediately and remove export.<br>
&gt;=C2=A0 #<br>
&gt; -# Potential additional modes to be added in the future:<br>
&gt; +# TODO: Potential additional modes to be added in the future:<br>
&gt;=C2=A0 #<br>
&gt; -# hide: Just hide export from new clients, leave existing connections=
 as is.<br>
&gt; -# Remove export after all clients are disconnected.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0hide: Just hide export from new clients, =
leave existing connections as is.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0Remove export after all clients are disco=
nnected.<br>
&gt;=C2=A0 #<br>
&gt; -# soft: Hide export from new clients, answer with ESHUTDOWN for all f=
urther<br>
&gt; -# requests from existing clients.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0soft: Hide export from new clients, answe=
r with ESHUTDOWN for all further<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0requests from existing clients.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Since: 2.12<br>
&gt;=C2=A0 ##<br>
<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt;<br>
<br>
Doc comments embed user documentation in the source code.=C2=A0 The doc<br>
generator extracts it.<br>
<br>
TODOs are generally for developers.=C2=A0 Should the doc generator suppress=
<br>
TODO sections?<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Needs an audit to make sure we&#39;re using it consistently w=
ith that semantic, but broadly it&#39;s probably a good idea to squelch &qu=
ot;internal&quot; todos, yes.=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Things like &quot;Watch out, were definitely gonna deprecate th=
is soon probably maybe!&quot; can stay outside of the TODO section. (Someti=
mes heads up are legitimate, even if most won&#39;t read them. the faithful=
 and diligent will be rewarded with painless upgrades.)</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Anyway, if Markus is happy with this change=
, I am too, I was just curious to know if there were bigger cleanups to do =
here and what the impact was.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Anyway:</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-b=
y: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&g=
t;</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"></blockquote></div></div></div>

--000000000000b4d5e005db0c60e9--


