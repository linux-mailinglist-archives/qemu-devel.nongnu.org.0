Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474AC417215
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:43:43 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkYG-0001MN-RW
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mTkKI-0005JP-L2
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mTkKF-0001No-AI
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9ixLJPgf4KWX6q3QyS4Ezc+f3Kr3abhG1blgRRhw9c=;
 b=OZA8iZiWRl+vEqWjcNLq95ykq8shAaJE1ztbksi+8DCzoMHi17CGP5tL5vOsNGtToMmgFL
 etBuMtqTMjeRrUT2Jql7KV0p4TWG7j90tEoEYCfpdscxohMfnjODnTJCkZpNOJaG26QtUn
 8Eu5lWIW2qHFTvBjIoj8DjYkQ2RAzQg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-vcj8G13dOMiIZm1orYVIKQ-1; Fri, 24 Sep 2021 08:29:09 -0400
X-MC-Unique: vcj8G13dOMiIZm1orYVIKQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 v7-20020a1709029a0700b0013daaeaa33eso3040117plp.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9ixLJPgf4KWX6q3QyS4Ezc+f3Kr3abhG1blgRRhw9c=;
 b=Oo6YQKE668wBC3Actgo4ZjNUp4Vb+CCyciD4NgcLeRMh+vWBFXGJclkA2ZZYUl+/pk
 wnR/VapvJs/laC2nLJX6L6cIAjpdM2MvW7IbVYend3pRJ2iW6/7Txx9R9Uzn0soLQHIO
 w9T/dsCRQkkbEny3MVyumqkeY11QDqoBCFhTsCxH8wbLJvIlaZBeK2+SYHqCqKfmo/Q0
 t9pjeyGbn7bgDVMSwqPzaKrWJpuE36ToXCQnsju3sLg4ZSr9QGoQBZLnRb5vXx8H1kKV
 O5ABzqJRv4bJGRfhyJWIQET3YfX8FYdgWMsMs+yEKGYq+7Oa6yhkuf0QWcvWmu5q0vu0
 Xx+A==
X-Gm-Message-State: AOAM532CfExQ3tqfbQkXQGkPeY0Zmz3aU1VFwWmcvgKD1qdp1cMo4ylN
 o0FmdEg3q0R5TPcsXtuz7FICdS+TJz8T+r0Fo5yMMbHweD7DpT/8nh8e26KYL6b1o2YkEhOXxMX
 BFkAwq4cLuwrESDvSqhtTXNT/4o9JcOE=
X-Received: by 2002:a17:90a:1942:: with SMTP id 2mr1993469pjh.36.1632486547917; 
 Fri, 24 Sep 2021 05:29:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAcZYpFAvLDReKtNnLLyymHhURmBNSgBcaL5ApXelV9UoZgdaUuh1gisXmFABtCwgwIdI/OnybbauZK7ek5Lc=
X-Received: by 2002:a17:90a:1942:: with SMTP id 2mr1993442pjh.36.1632486547604; 
 Fri, 24 Sep 2021 05:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
 <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
 <874kaarwou.fsf@dusky.pond.sub.org>
In-Reply-To: <874kaarwou.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 24 Sep 2021 16:28:56 +0400
Message-ID: <CAMxuvawZ65aPw2Cs2torjoHBjYcS1ePDC16fEiHDt7N486A83Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c5670f05ccbce452"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5670f05ccbce452
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 24, 2021 at 4:21 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 18 Feb 2019 at 14:19, Markus Armbruster <armbru@redhat.com>
> wrote:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> A few targets don't emit RTC_CHANGE, we could restrict the event to
> >> the tagets that do emit it.
> >>
> >> Note: There is a lot more of events & commands that we could restrict
> >> to capable targets, with the cost of some additional complexity, but
> >> the benefit of added correctness and better introspection.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> Message-Id: <20190214152251.2073-19-armbru@redhat.com>
> >
> > Hi; I've just run into this starting from Eric's patch to add
> > RTC_CHANGE event support to the pl031 RTC. It seems kind of
> > awkward to me:
> >
> >> diff --git a/qapi/target.json b/qapi/target.json
> >> index 5c41a0aee7..da7b4be51e 100644
> >> --- a/qapi/target.json
> >> +++ b/qapi/target.json
> >> @@ -7,6 +7,29 @@
> >>
> >>  { 'include': 'misc.json' }
> >>
> >> +##
> >> +# @RTC_CHANGE:
> >> +#
> >> +# Emitted when the guest changes the RTC time.
> >> +#
> >> +# @offset: offset between base RTC clock (as specified by -rtc base),
> and
> >> +#          new RTC clock value
> >> +#
> >> +# Note: This event is rate-limited.
> >> +#
> >> +# Since: 0.13.0
> >> +#
> >> +# Example:
> >> +#
> >> +# <-   { "event": "RTC_CHANGE",
> >> +#        "data": { "offset": 78 },
> >> +#        "timestamp": { "seconds": 1267020223, "microseconds": 435656
> } }
> >> +#
> >> +##
> >> +{ 'event': 'RTC_CHANGE',
> >> +  'data': { 'offset': 'int' },
> >> +  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) ||
> defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) ||
> defined(TARGET_MIPS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) ||
> defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) ||
> defined(TARGET_SPARC)' }
> >> +
> >
> > Now we have a massive list of TARGET if conditions. As a general
> > principle if we can avoid long TARGET if-lists we should, because
> > it is yet another thing that needs updating when a new target
> > is added.
>
> On the other hand, we really want to have the schema reflect
> target-specifity, to make it visible in introspection, as the commit
> message says.  However, ...
>
> >           In this case any new architecture that can handle an
> > ISA device would need to update this list. I pretty much guarantee
> > nobody is going to remember to do that.
> >
> > It also doesn't actually usefully tell the thing on the other
> > end whether it can expect to see RTC_CHANGE events, because
> > whether it will actually get them depends not on the target
> > architecture but on the specific combination of machine type
> > and plugged-in devices. If there's a need for the other end of
> > the QMP connection to tell in advance whether it's going to get
> > RTC_CHANGE events then we should probably have an event or
> > something for that, and make all rtc-change aware RTC devices
> > cause QMP to send that event on startup (or otherwise register
> > themselves as being present).
> >
> > It also means that now rtc devices that emit this event need to
> > change in meson.build from softmmu_ss to specific_ss, because the
> > qapi_event_send_rtc_change() prototype is in the generated
> > qapi/qapi-events-misc-target.h header, and that header uses
> > TARGET_* defines which are poisoned for softmmu compiles.
> > So instead of being able to build the RTC device once for
> > all targets, we need to build it over and over again for
> > each target.
>
> ... this isn't really *target*-specific, it's *device*-specific: some
> devices implement the event, some don't.
>
> Ideally, we'd just fix that.
>
> If we can't, we should document which devices don't implement it.  Since
> users typically get these devices indirectly via machine type, we should
> also document which machine types are affected.
>
> We may need to make the "RTC_CHANGE not implemented" bit observable in
> QMP somehow.  I'd ignore that until we have a use case.
>
> > Could we reconsider this change? It seems to me to be adding
> > complexity and build time and I don't really see the advantage
> > that compensates for that.
>
> No objection.  Marc-Andr=C3=A9?
>

Not at this point. As hinted in the commit note, the patch was more of an
RFC, I wasn't so sure about it either.

--000000000000c5670f05ccbce452
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 4:21 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Pe=
ter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blan=
k">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Mon, 18 Feb 2019 at 14:19, Markus Armbruster &lt;<a href=3D"mailto:=
armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; A few targets don&#39;t emit RTC_CHANGE, we could restrict the eve=
nt to<br>
&gt;&gt; the tagets that do emit it.<br>
&gt;&gt;<br>
&gt;&gt; Note: There is a lot more of events &amp; commands that we could r=
estrict<br>
&gt;&gt; to capable targets, with the cost of some additional complexity, b=
ut<br>
&gt;&gt; the benefit of added correctness and better introspection.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcan=
dre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt=
;<br>
&gt;&gt; Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat=
.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt; Message-Id: &lt;<a href=3D"mailto:20190214152251.2073-19-armbru@re=
dhat.com" target=3D"_blank">20190214152251.2073-19-armbru@redhat.com</a>&gt=
;<br>
&gt;<br>
&gt; Hi; I&#39;ve just run into this starting from Eric&#39;s patch to add<=
br>
&gt; RTC_CHANGE event support to the pl031 RTC. It seems kind of<br>
&gt; awkward to me:<br>
&gt;<br>
&gt;&gt; diff --git a/qapi/target.json b/qapi/target.json<br>
&gt;&gt; index 5c41a0aee7..da7b4be51e 100644<br>
&gt;&gt; --- a/qapi/target.json<br>
&gt;&gt; +++ b/qapi/target.json<br>
&gt;&gt; @@ -7,6 +7,29 @@<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 { &#39;include&#39;: &#39;misc.json&#39; }<br>
&gt;&gt;<br>
&gt;&gt; +##<br>
&gt;&gt; +# @RTC_CHANGE:<br>
&gt;&gt; +#<br>
&gt;&gt; +# Emitted when the guest changes the RTC time.<br>
&gt;&gt; +#<br>
&gt;&gt; +# @offset: offset between base RTC clock (as specified by -rtc ba=
se), and<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new RTC clock value<br>
&gt;&gt; +#<br>
&gt;&gt; +# Note: This event is rate-limited.<br>
&gt;&gt; +#<br>
&gt;&gt; +# Since: 0.13.0<br>
&gt;&gt; +#<br>
&gt;&gt; +# Example:<br>
&gt;&gt; +#<br>
&gt;&gt; +# &lt;-=C2=A0 =C2=A0{ &quot;event&quot;: &quot;RTC_CHANGE&quot;,<=
br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;data&quot;: { &quot;offset&quo=
t;: 78 },<br>
&gt;&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timestamp&quot;: { &quot;secon=
ds&quot;: 1267020223, &quot;microseconds&quot;: 435656 } }<br>
&gt;&gt; +#<br>
&gt;&gt; +##<br>
&gt;&gt; +{ &#39;event&#39;: &#39;RTC_CHANGE&#39;,<br>
&gt;&gt; +=C2=A0 &#39;data&#39;: { &#39;offset&#39;: &#39;int&#39; },<br>
&gt;&gt; +=C2=A0 &#39;if&#39;: &#39;defined(TARGET_ALPHA) || defined(TARGET=
_ARM) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIP=
S) || defined(TARGET_MIPS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC=
) || defined(TARGET_PPC64) || defined(TARGET_S390X) || defined(TARGET_SH4) =
|| defined(TARGET_SPARC)&#39; }<br>
&gt;&gt; +<br>
&gt;<br>
&gt; Now we have a massive list of TARGET if conditions. As a general<br>
&gt; principle if we can avoid long TARGET if-lists we should, because<br>
&gt; it is yet another thing that needs updating when a new target<br>
&gt; is added.<br>
<br>
On the other hand, we really want to have the schema reflect<br>
target-specifity, to make it visible in introspection, as the commit<br>
message says.=C2=A0 However, ...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In this case any new architect=
ure that can handle an<br>
&gt; ISA device would need to update this list. I pretty much guarantee<br>
&gt; nobody is going to remember to do that.<br>
&gt;<br>
&gt; It also doesn&#39;t actually usefully tell the thing on the other<br>
&gt; end whether it can expect to see RTC_CHANGE events, because<br>
&gt; whether it will actually get them depends not on the target<br>
&gt; architecture but on the specific combination of machine type<br>
&gt; and plugged-in devices. If there&#39;s a need for the other end of<br>
&gt; the QMP connection to tell in advance whether it&#39;s going to get<br=
>
&gt; RTC_CHANGE events then we should probably have an event or<br>
&gt; something for that, and make all rtc-change aware RTC devices<br>
&gt; cause QMP to send that event on startup (or otherwise register<br>
&gt; themselves as being present).<br>
&gt;<br>
&gt; It also means that now rtc devices that emit this event need to<br>
&gt; change in meson.build from softmmu_ss to specific_ss, because the<br>
&gt; qapi_event_send_rtc_change() prototype is in the generated<br>
&gt; qapi/qapi-events-misc-target.h header, and that header uses<br>
&gt; TARGET_* defines which are poisoned for softmmu compiles.<br>
&gt; So instead of being able to build the RTC device once for<br>
&gt; all targets, we need to build it over and over again for<br>
&gt; each target.<br>
<br>
... this isn&#39;t really *target*-specific, it&#39;s *device*-specific: so=
me<br>
devices implement the event, some don&#39;t.<br>
<br>
Ideally, we&#39;d just fix that.<br>
<br>
If we can&#39;t, we should document which devices don&#39;t implement it.=
=C2=A0 Since<br>
users typically get these devices indirectly via machine type, we should<br=
>
also document which machine types are affected.<br>
<br>
We may need to make the &quot;RTC_CHANGE not implemented&quot; bit observab=
le in<br>
QMP somehow.=C2=A0 I&#39;d ignore that until we have a use case.<br>
<br>
&gt; Could we reconsider this change? It seems to me to be adding<br>
&gt; complexity and build time and I don&#39;t really see the advantage<br>
&gt; that compensates for that.<br>
<br>
No objection.=C2=A0 Marc-Andr=C3=A9?<br></blockquote><div><br></div><div>No=
t at this point. As hinted in the commit note, the patch was more of an RFC=
, I wasn&#39;t so sure about it either.<br></div></div></div>

--000000000000c5670f05ccbce452--


