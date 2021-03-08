Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F73317CD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:53:01 +0100 (CET)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLw4-0006q5-FT
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJLud-0006O2-Q2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:51:31 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJLuX-0007je-DV
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:51:31 -0500
Received: by mail-qk1-x72c.google.com with SMTP id g185so10620625qkf.6
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 11:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m24ScQIYlsX3uvRIV8BAdk+zRO0RhgVTzGivJSM55qQ=;
 b=m3MMlZ1n4Hyl0/6p/yaV7e/EeoACdnBdp8HZ99gW2aLENk/RSV21cTEvtwZzBrll0l
 IPAyTf5zhX1pSa/u1RX7xTHNlWf5Wwnq0OQTQxehrnmcdCrKcpaIcfIQ5jq2L5Dj6Apf
 EpOMVXM++0qccn79CoKJQGi2SSQ/0V+WkmQQDnhH6XSs9WTUq2bP02MY5j5j6viubfNN
 kcYY+KL2AGIbGTxvC7uRD/amgAvF7EgU92+9KTU9N1KgHjAQg8/2LhXOWV0rJRv0VweS
 ifzGaHH9l2gtxY6c+QXTtks8S+CdwSDaT382ua+hjTn9q2OOh358EByxyMcT9+oM24Nt
 g9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m24ScQIYlsX3uvRIV8BAdk+zRO0RhgVTzGivJSM55qQ=;
 b=O6VOV2qCU8H8QQB4ZLxhGl7SGezpknt1h0k0g+aU5UrxFd431S1JrRW0gnFAYx1cLO
 hVmECiIx73oP7vGwN+T8MIPAKK75PDLD9v8un5LgZ8EbwMbST46wyFr0NvJ0dtifepHG
 64ncsBUi9DtW0aISUeLbTTre2+Xcz9rYNsLPCcB/ALSM6Pwzzj3RayGZI90jFi+MuO4S
 ZPa3H/BZENyM19A+k+NeEx20mgll7bFwcKkjGdlP/gaERF/JH/SyZIziAkH1ORyJCB7Q
 jkE/ccgXLg/YCz81dlFk7d6w0PvXHl06eRWPZL01QhdoYdu7p9ricK0e01/EaNUO7lYu
 6RkA==
X-Gm-Message-State: AOAM532GDxUBh2hYS/XXZOR6fDeyNlhCuNnZi1qSGDkgSkAzDlIxqYtJ
 Lm/oRvphsJ66bdKhbcsEnZ0xCtnEfKtB3HbHM/hLNg==
X-Google-Smtp-Source: ABdhPJwCUmk8F4n6lzeMxlrhD8X5tFaLL758k4S3xnnhlCjwTIUhtR+P/q6mDo4ZR/qrd+pDhUpcdxQpJScZPFiBIos=
X-Received: by 2002:a37:7f83:: with SMTP id a125mr21355274qkd.44.1615233083945; 
 Mon, 08 Mar 2021 11:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
 <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
 <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>
 <f48b0f77-02e7-fcf7-a8bd-9d7990c8db33@redhat.com>
 <E0C80BD2-323B-4101-8DC4-8A920B6CE5AB@yadro.com>
In-Reply-To: <E0C80BD2-323B-4101-8DC4-8A920B6CE5AB@yadro.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Mar 2021 12:51:13 -0700
Message-ID: <CANCZdfrSCCNuOjQYciZexmvYao3ZS3Ad+2bRLi8vVcyfv9kfcw@mail.gmail.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: multipart/alternative; boundary="00000000000032c38905bd0bc2c1"
Received-SPF: none client-ip=2607:f8b0:4864:20::72c;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000032c38905bd0bc2c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 8, 2021 at 8:46 AM Roman Bolshakov <r.bolshakov@yadro.com>
wrote:

>
> > 8 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 18:41, Thomas Hut=
h <thuth@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
> >
> > =EF=BB=BFOn 08/03/2021 16.26, Warner Losh wrote:
> >> On Mon, Mar 8, 2021 at 6:30 AM Thomas Huth <thuth@redhat.com <mailto:
> thuth@redhat.com>> wrote:
> >>    On 07/03/2021 16.56, Warner Losh wrote:
> >>     > FreeBSD 12.1 has reached end of life. Use 12.2 instead so that
> FreeBSD's
> >>     > project's packages will work.  Update which timezone to pick. Wo=
rk
> >>    around a QEMU
> >>     > bug that incorrectly raises an exception on a CRC32 instruction
> with
> >>    the FPU
> >>     > disabled.  The qemu bug is described here:
> >>     > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.htm=
l
> >>    <https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html>
> >>     >
> >>     > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.co=
m
> >>
> >>     >
> >>     > ---
> >>     >   tests/vm/freebsd | 14 +++++++++-----
> >>     >   1 file changed, 9 insertions(+), 5 deletions(-)
> >>    I gave this a try, but it's currently failing in the unit tests:
> >>    Running test test-crypto-tlscredsx509
> >>    ** (tests/test-crypto-tlscredsx509:9999): CRITICAL **: 12:56:35.157=
:
> Failed
> >>    to sign certificate ASN1 parser: Value is not valid.
> >>    ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed t=
o
> sign
> >>    certificate ASN1 parser: Value is not valid.
> >>    gmake: *** [Makefile.mtest:576: run-test-70] Error 1
> >>    gmake: *** Waiting for unfinished jobs....
> >>    Running test test-crypto-tlssession
> >>    ** (tests/test-crypto-tlssession:10002): CRITICAL **: 12:56:35.288:
> Failed
> >>    to sign certificate ASN1 parser: Value is not valid.
> >>    ERROR test-crypto-tlssession - Bail out! FATAL-CRITICAL: Failed to
> sign
> >>    certificate ASN1 parser: Value is not valid.
> >> That's totally unrelated to my change. Was it failing before? What
> environment was it failing in because it all seemed to work for me...
> >
> > It's been a while since I last ran "make vm-build-freebsd", so I can't
> really tell whether the problem was already there before ... when I now t=
ry
> to run it without your patch, it fails for me, too, but rather due to
> FreeBSD 12.1 being out of service instead.
> >
> >>    I guess it's the same problem as:
> >>    https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html
> >>    <https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.htm=
l
> >
> >>    ... so this would require a bug fix in the libtasn of FreeBSD first=
?
> See:
> >>    https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> >>    <https://gitlab.com/gnutls/libtasn1/-/merge_requests/71>
> >>  Is this on the host that built qemu, or inside the VM or where exactl=
y?
> >
> > It's inside the VM ... I assume the libtasn there has the same bug as
> the one on macOS?
> >
>
> The gnutls failures on macOS and FreeBSD (with clang as main compiler)
> won=E2=80=99t happen only if libtasn1 from master is used. Otherwise libt=
asn1 has
> to be compiled with -O1/-O0.
>

Forgive my ignorance...

Does this come from a submodule? From something I've built and installed on
my FreeBSD host? Or something that's installed into the FreeBSD guest?

Warner


> =D0=9E=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=D0=BD=D0=BE =D1=81 iPhon=
e
>
> > Thomas
> >
>

--00000000000032c38905bd0bc2c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 8:46 AM Roman =
Bolshakov &lt;<a href=3D"mailto:r.bolshakov@yadro.com">r.bolshakov@yadro.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
&gt; 8 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 18:41, Thomas Hu=
th &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.c=
om</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):<br>
&gt; <br>
&gt; =EF=BB=BFOn 08/03/2021 16.26, Warner Losh wrote:<br>
&gt;&gt; On Mon, Mar 8, 2021 at 6:30 AM Thomas Huth &lt;<a href=3D"mailto:t=
huth@redhat.com" target=3D"_blank">thuth@redhat.com</a> &lt;mailto:<a href=
=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;&gt;=
 wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 On 07/03/2021 16.56, Warner Losh wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; FreeBSD 12.1 has reached end of life. Use =
12.2 instead so that FreeBSD&#39;s<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; project&#39;s packages will work.=C2=A0 Up=
date which timezone to pick. Work<br>
&gt;&gt;=C2=A0 =C2=A0 around a QEMU<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; bug that incorrectly raises an exception o=
n a CRC32 instruction with<br>
&gt;&gt;=C2=A0 =C2=A0 the FPU<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; disabled.=C2=A0 The qemu bug is described =
here:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://www.mail-archive.com/qe=
mu-devel@nongnu.org/msg784158.html" rel=3D"noreferrer" target=3D"_blank">ht=
tps://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html</a><br>
&gt;&gt;=C2=A0 =C2=A0 &lt;<a href=3D"https://www.mail-archive.com/qemu-deve=
l@nongnu.org/msg784158.html" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.mail-archive.com/qemu-devel@nongnu.org/msg784158.html</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Warner Losh &lt;<a href=3D"=
mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a h=
ref=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0tests/vm/freebsd | 14 ++++++++=
+-----<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+=
), 5 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0 I gave this a try, but it&#39;s currently failing in =
the unit tests:<br>
&gt;&gt;=C2=A0 =C2=A0 Running test test-crypto-tlscredsx509<br>
&gt;&gt;=C2=A0 =C2=A0 ** (tests/test-crypto-tlscredsx509:9999): CRITICAL **=
: 12:56:35.157: Failed<br>
&gt;&gt;=C2=A0 =C2=A0 to sign certificate ASN1 parser: Value is not valid.<=
br>
&gt;&gt;=C2=A0 =C2=A0 ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRIT=
ICAL: Failed to sign<br>
&gt;&gt;=C2=A0 =C2=A0 certificate ASN1 parser: Value is not valid.<br>
&gt;&gt;=C2=A0 =C2=A0 gmake: *** [Makefile.mtest:576: run-test-70] Error 1<=
br>
&gt;&gt;=C2=A0 =C2=A0 gmake: *** Waiting for unfinished jobs....<br>
&gt;&gt;=C2=A0 =C2=A0 Running test test-crypto-tlssession<br>
&gt;&gt;=C2=A0 =C2=A0 ** (tests/test-crypto-tlssession:10002): CRITICAL **:=
 12:56:35.288: Failed<br>
&gt;&gt;=C2=A0 =C2=A0 to sign certificate ASN1 parser: Value is not valid.<=
br>
&gt;&gt;=C2=A0 =C2=A0 ERROR test-crypto-tlssession - Bail out! FATAL-CRITIC=
AL: Failed to sign<br>
&gt;&gt;=C2=A0 =C2=A0 certificate ASN1 parser: Value is not valid.<br>
&gt;&gt; That&#39;s totally unrelated to my change. Was it failing before? =
What environment was it failing in because it all seemed to work for me...<=
br>
&gt; <br>
&gt; It&#39;s been a while since I last ran &quot;make vm-build-freebsd&quo=
t;, so I can&#39;t really tell whether the problem was already there before=
 ... when I now try to run it without your patch, it fails for me, too, but=
 rather due to FreeBSD 12.1 being out of service instead.<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 I guess it&#39;s the same problem as:<br>
&gt;&gt;=C2=A0 =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-de=
vel/2021-01/msg06750.html" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html</a><br>
&gt;&gt;=C2=A0 =C2=A0 &lt;<a href=3D"https://lists.gnu.org/archive/html/qem=
u-devel/2021-01/msg06750.html" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 ... so this would require a bug fix in the libtasn of=
 FreeBSD first? See:<br>
&gt;&gt;=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/gnutls/libtasn1/-/merge=
_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/gnutl=
s/libtasn1/-/merge_requests/71</a><br>
&gt;&gt;=C2=A0 =C2=A0 &lt;<a href=3D"https://gitlab.com/gnutls/libtasn1/-/m=
erge_requests/71" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/g=
nutls/libtasn1/-/merge_requests/71</a>&gt;<br>
&gt;&gt;=C2=A0 Is this on the host that built qemu, or inside the VM or whe=
re exactly?<br>
&gt; <br>
&gt; It&#39;s inside the VM ... I assume the libtasn there has the same bug=
 as the one on macOS?<br>
&gt; <br>
<br>
The gnutls failures on macOS and FreeBSD (with clang as main compiler) won=
=E2=80=99t happen only if libtasn1 from master is used. Otherwise libtasn1 =
has to be compiled with -O1/-O0.<br></blockquote><div><br></div><div>Forgiv=
e my ignorance...</div><div><br></div><div>Does this come from a submodule?=
 From something I&#39;ve built and installed on my FreeBSD host? Or somethi=
ng that&#39;s installed into the FreeBSD guest?</div><div><br></div><div>Wa=
rner</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
=D0=9E=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=D0=BD=D0=BE =D1=81 iPhone<=
br>
<br>
&gt; Thomas<br>
&gt; <br>
</blockquote></div></div>

--00000000000032c38905bd0bc2c1--

