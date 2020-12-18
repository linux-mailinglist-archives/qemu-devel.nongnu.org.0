Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A2E2DE1CA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:09:56 +0100 (CET)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDdz-0003YQ-PN
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kqDbq-0001LB-5j
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:07:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kqDbo-0004dB-9C
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608289659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u9JzHOVEWFb3Mc4DOsLcD+j16vmURHxf0Ez2Vz0spBc=;
 b=ctuKs6wC5q4c3i8zRrrsZhkMo9OPMW6Xo2+qVc8F61RcAPaJgp1GZFqHL0rOtO30iV9mh2
 39RG7L5wawr/OstK/+lZ29PXaQWT5vFeRjXCEGmR9I0lTJe+EHrm2+qp1K7ol/chN7wMY2
 gdRyJS6/MxCMg0odcSO5wW8upwQaOCE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-TB06yNyrNi2s1QgnyGuowg-1; Fri, 18 Dec 2020 06:07:35 -0500
X-MC-Unique: TB06yNyrNi2s1QgnyGuowg-1
Received: by mail-io1-f72.google.com with SMTP id y197so1505651iof.3
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9JzHOVEWFb3Mc4DOsLcD+j16vmURHxf0Ez2Vz0spBc=;
 b=QZ6uubXFX6TkW+JgLUlrEXwp6XQTmwwVq2D/fLAuGoW0raRUZ9gioJ6JOmykdPMOEi
 ZACKfPJQb+18tKT3G+8VVmTMICRyz37OUIv5qVoLU1eqmXvT7EWrEYM1fhZ0ff7uMJoW
 W/PYiyzgkxu9uynffYZVqKlC62FtbjauoSOLTvasBg/0PxzuLdy7OlvIQ6bLb7s34ITO
 L3CpCQ1EcjNtPQeXb+RUYIbGTU5/yJWYSLANTmqcpTi5KMp0719NUTbiG4UXRXFHAMA9
 Ia8qe19Ld7ZNBYaH9UlJX3rxaKjPwb1plMWLTboWZG2dKEdyoRb1kX+TFHg3RVR0ED9f
 2IDw==
X-Gm-Message-State: AOAM533AKNjHh7FCHmyTr2T7qj/POkolsIMuaFEZxzbrP5znvDX7Oxc8
 pi/ahFWWyndABvsxDHsowjU6HgL2e9IL2pJZur/4LFP9oirJwg6AwfwmubNv1gXfezo5projOSZ
 Ubwxzq2vcebpE7qik86aNpzTCZb/0ptY=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr3198895ilm.161.1608289654840; 
 Fri, 18 Dec 2020 03:07:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQmu6wLrdN1kMz4OYEhWQ6VQSFeLGe3qr78GXkoVFfQsUS3ZRrPVP3ycSBOcpW7D3saW9+ZKjxesL+qktAD7A=
X-Received: by 2002:a92:c6c9:: with SMTP id v9mr3198878ilm.161.1608289654583; 
 Fri, 18 Dec 2020 03:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20201218084611.634254-1-marcandre.lureau@redhat.com>
 <023ac901-2c57-15da-4dfe-62b1f4f1c23d@redhat.com>
 <CAMxuvayDzUmpBg8n10zD=7pYtKtwQZs1n0wAvPjMzKTZ4ZNuGQ@mail.gmail.com>
 <9ea55256-e3fd-e8e7-3b70-9c690b09dc74@redhat.com>
In-Reply-To: <9ea55256-e3fd-e8e7-3b70-9c690b09dc74@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 18 Dec 2020 15:07:23 +0400
Message-ID: <CAMxuvaw=koNfQbhVpaHWt0nCZhMzy703X=Hhxw_gi2wCJyjciA@mail.gmail.com>
Subject: Re: [PATCH] whpx: fix compilation
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008ec81605b6bb1d28"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: sunilmut@microsoft.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008ec81605b6bb1d28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 18, 2020 at 2:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 18/12/20 11:08, Marc-Andr=C3=A9 Lureau wrote:
> >      >   #ifdef CONFIG_WHPX
> >      >
> >      > -#include "whp-dispatch.h"
> >      > +#include <windows.h>
> >      > +#include <WinHvPlatform.h>
> >      > +#include <WinHvEmulation.h>
> >      >
> >      >   struct whpx_state {
> >      >       uint64_t mem_quota;
> >      >
> >
> >     This is wrong, just "git mv target/i386/whpx/whp-dispatch.h
> >     include/sysemu" instead (and possibly change the #include line to
> >     sysemu/whp-dispatch.h).
> >
> >
> > Wrong? It fixes the build. So whatever is in whp-dispatch, it's not
> > exactly necessary. Why should it be included?
>
> Did you read the code that initializes whp-dispatch, or even easier try
> to find the patch the introduced it ("git log --follow
> target/i386/whpx/whp-dispatch.h")?  Marc-Andr=C3=A9, I expect you to know
> better than "it fixes the build, ergo it is correct"...
>
>
I did try to follow. And it ends up with:
commit 93d1499c8119989e3eb9a6936c5a18aaaaca6330
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Wed Jun 6 15:41:58 2018 +0200

    whpx: commit missing file

    Not included by mistake in commit
327fccb288976f95808efa968082fc9d4a9ced84.

    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

then that commit didn't exactly help me to understand why this header
should be global in include/...



> > Furthermore, I tried your suggestion first. But it fails with other
> > include issues. I can probably solve them differently, but why should
> > whp-dispatch be in include/sysemu?
>
> It shouldn't indeed, hence the second suggestion:
>
> >     But I wonder if whp-dispatch.h is needed at all in this file.  If w=
e
> >     can just include it in whpx-all.c and whpx-apic.c, that would be mu=
ch
> >     better.
> >
> > May be, but how does this solve the issue with include/sysemu/whpx.h ?
>
> Because "just" including it in those two .c files implies removing it
> from include/sysemu/whpx.h.  I was a bit concise, I admit.
>
>
Perhaps, but whpx.h still is around with at least  WHV_PARTITION_HANDLE (if
not more from indirect includes with types from the windows headers)

So I still stand behind my suggestion. It merely reduces the amount of
includes to the windows system headers. We can try to further cleanup and
reduce the amount of includes or header later on. This is not my goal (why
do I always end up in side-track tasks that take days..)

--0000000000008ec81605b6bb1d28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 2:28 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 18/12/20 11:08, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#ifdef CONFIG_WHPX<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -#include &quot;whp-dispatch.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;windows.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;WinHvPlatform.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#include &lt;WinHvEmulation.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0struct whpx_state {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t mem_quota;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is wrong, just &quot;git mv target/i386/whpx/w=
hp-dispatch.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0include/sysemu&quot; instead (and possibly change t=
he #include line to<br>
&gt;=C2=A0 =C2=A0 =C2=A0sysemu/whp-dispatch.h).<br>
&gt; <br>
&gt; <br>
&gt; Wrong? It fixes the build. So whatever is in whp-dispatch, it&#39;s no=
t <br>
&gt; exactly necessary. Why should it be included?<br>
<br>
Did you read the code that initializes whp-dispatch, or even easier try <br=
>
to find the patch the introduced it (&quot;git log --follow <br>
target/i386/whpx/whp-dispatch.h&quot;)?=C2=A0 Marc-Andr=C3=A9, I expect you=
 to know <br>
better than &quot;it fixes the build, ergo it is correct&quot;...<br>
<br></blockquote><div><br></div><div>I did try to follow. And it ends up wi=
th:</div><div>commit 93d1499c8119989e3eb9a6936c5a18aaaaca6330<br>Author: Pa=
olo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com<=
/a>&gt;<br>Date: =C2=A0 Wed Jun 6 15:41:58 2018 +0200<br><br>=C2=A0 =C2=A0 =
whpx: commit missing file<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Not included b=
y mistake in commit 327fccb288976f95808efa968082fc9d4a9ced84.<br>=C2=A0 =C2=
=A0 <br>=C2=A0 =C2=A0 Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pb=
onzini@redhat.com">pbonzini@redhat.com</a>&gt;</div><div><br></div><div>the=
n that commit didn&#39;t exactly help me to understand why this header shou=
ld be global in include/...<br></div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; Furthermore, I tried your suggestion first. But it fails with other <b=
r>
&gt; include issues. I can probably solve them differently, but why should =
<br>
&gt; whp-dispatch be in include/sysemu?<br>
<br>
It shouldn&#39;t indeed, hence the second suggestion:<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0But I wonder if whp-dispatch.h is needed at all in =
this file.=C2=A0 If we<br>
&gt;=C2=A0 =C2=A0 =C2=A0can just include it in whpx-all.c and whpx-apic.c, =
that would be much<br>
&gt;=C2=A0 =C2=A0 =C2=A0better.<br>
&gt; <br>
&gt; May be, but how does this solve the issue with include/sysemu/whpx.h ?=
<br>
<br>
Because &quot;just&quot; including it in those two .c files implies removin=
g it <br>
from include/sysemu/whpx.h.=C2=A0 I was a bit concise, I admit.<br>
<br></blockquote><div><br></div><div>Perhaps, but whpx.h still is around wi=
th at least=C2=A0 WHV_PARTITION_HANDLE (if not more from indirect includes =
with types from the windows headers)</div><div><br></div><div>So I still st=
and behind my suggestion. It merely reduces the amount of includes to the w=
indows system headers. We can try to further cleanup and reduce the amount =
of includes or header later on. This is not my goal (why do I always end up=
 in side-track tasks that take days..)<br></div><div><br></div></div></div>

--0000000000008ec81605b6bb1d28--


