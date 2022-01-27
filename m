Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6549EDC7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:52:29 +0100 (CET)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCgu-0003Dp-Dv
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDCcx-0000mY-5G
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:48:23 -0500
Received: from [2a00:1450:4864:20::230] (port=36613
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDCcv-0004Mb-BN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:48:22 -0500
Received: by mail-lj1-x230.google.com with SMTP id j14so6302833lja.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 13:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyP0lvxtT9uGS8Lqm4uWUNRMyoyTvjoBz8u991uEkqY=;
 b=E1vRQvbWpO951W7AH7uaZLwTZAY00LDcTJ2MxfJADglNBW/WuBL5sjj9EuyxDnQMfX
 mzN/QC/CHSZFcHjW9+RLTfRzF0+2vr+HYlti6v3I0f5iTVvuVqFiXFDMaCoidKyAC6UN
 SQJlG+eCNrbkoHEafiI/daxuAzqWOME1iAmLSBDF4JS5V9BZoQ3dHEq0yugC0zw+xM2L
 gvZ6ScThPv0Goq12zxeaI44fm9SimEUqODjbTTdwMNHrl5IwwdsV2ny6oWEHNF5CIWpH
 zk3Pf4ieM+u0iI8KFf56TaXoipW6ObyTg/TTJtojxMZWbyAdkPQQoKJjNfF92LcpZaAQ
 +NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyP0lvxtT9uGS8Lqm4uWUNRMyoyTvjoBz8u991uEkqY=;
 b=nlm0UfBGUrTcbLqPuKFmE3JtfHcpfSDA7oTyuD5HKrfqv0XH2a7o7KQAXOjHCA3rrs
 Z9CxInS3sBLDvKHuD8/Kh2NePnIJVsu451xd5DRnYdCTZvvXzBUL/nCx1eEt8EOujevU
 oiqOmoUJH8gvIbXrf1o8ZN6l7h6fQ+LRvF4Zdipk+Ve6OvrVv0VZQzzh8b3DcZUfw5Km
 pyPiKT+jQwAxwC+WAHjY1T2Z/KM6UePbmjyDtU4ZghIk3KHH0HYjmS3ATG6cTpqwqHFm
 pnljNJFBLFDe9hJTrjrq6e73LCcJCArahiPSEU1maleJS6GfDxBMVuK5Dc+B8ni9/Oxz
 /0ww==
X-Gm-Message-State: AOAM531NrVxUXyhVSA6F3a5pCHRMGD/SU3eizVICJiL+vRnf9iFcrA6E
 +K/L2iqFjaQ5S+r8N4/hjLJrYduGWUzXCZuZycJyqxU31eY=
X-Google-Smtp-Source: ABdhPJw7glsYMkGGljMf7ZHI+eHBvarbQpDmWwbyDBdT5NKnSveU8NxH/quplepIcATVvZWvM2AzTYocexfFU7LI+5M=
X-Received: by 2002:a2e:b0ca:: with SMTP id g10mr3998637ljl.216.1643320093499; 
 Thu, 27 Jan 2022 13:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <60659730.p4icJFLGV9@silver>
 <2B4D46DD-074E-4070-BAF0-AADAD1183B33@icloud.com> <1746653.fRNRREnWfK@silver>
In-Reply-To: <1746653.fRNRREnWfK@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 27 Jan 2022 16:48:02 -0500
Message-ID: <CAB26zV0T+mwNCDt9fYKy5hkV=8dnA=CFcu8K5X6Lo+WhFtEO2Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] 9p: darwin: Handle struct dirent differences
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000006ce55e05d6974646"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, qemu-devel@nongnu.org,
 hi@alyssa.is, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006ce55e05d6974646
Content-Type: text/plain; charset="UTF-8"

If acceptable, we'd still propose leaving these changes as is for
expediency's sake, rather than using our dirent and then translating it all
to save one read from the FS layer.

For v3, the synth tests will pass. We did have to modify the local
fs_unlinkat_dir test to correct AT_REMOVEDIR to P9_DOTL_AT_REMOVEDIR to get
that test to pass, but those now pass as well.


On Wed, Nov 24, 2021 at 2:09 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 24. November 2021 16:45:30 CET Michael Roitzsch wrote:
> > Hi,
> >
> > > Are you sure d_seekoff doesn't work on macOS?
> >
> > I just tried on an APFS volume on macOS Monterey and d_seekoff is always
> 0,
> > while telldir() outputs useful values.
> > > Because using telldir() instead
> > > is not the same thing. Accessing d_*off is just POD access, whereas
> > > telldir() is a syscall.
> >
> > I am not sure this is the case. I have tried a quick test program:
> >
> > #include <dirent.h>
> >
> > int main(void)
> > {
> >       int result = 0;
> >       DIR *dir = opendir(".");
> >       while (readdir(dir)) {
> >               result += telldir(dir);
> >       }
> >       closedir(dir);
> >       return result;
> > }
> >
> > I ran it with 'sudo dtruss ./test', which should give me a trace of the
> > system calls. The relevant portion is:
> >
> > open_nocancel(".\0", 0x1100004, 0x0)           = 3 0
> > sysctlbyname(kern.secure_kernel, 0x12, 0x7FF7BE49810C, 0x7FF7BE498110,
> > 0x0)           = 0 0 fstatfs64(0x3, 0x7FF7BE498110, 0x0)               =
> 0 0
> > getdirentries64(0x3, 0x7FF4A5808A00, 0x2000)           = 1472 0
> > close_nocancel(0x3)            = 0 0
> >
> > The directory has more than 30 entries, but the loop does not appear to
> > cause individual system calls. Instead, readdir() and telldir() appear to
> > be library functions powered by this getdirentries64 syscall.
>
> Right, telldir() is part of Apple's libc, no (fs) syscall involved:
>
> https://opensource.apple.com/source/Libc/Libc-167/gen.subproj/telldir.c.auto.html
>
> However instead of changing the (fs driver independent) 9p server [9p.c]
> code
> and using fidp there, I would probably rather address this issue for macOS
> in
> the individual fs drivers [9p-local.c, 9p-synth.c, 9p-proxy.c] directly on
> dirent instead, and not rely on fidp not having mutated on server.
>
> And please make sure the 9p test cases pass.
>
> Best regards,
> Christian Schoenebeck
>
>
>

--0000000000006ce55e05d6974646
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If acceptable, we&#39;d still propose leaving these c=
hanges as is for expediency&#39;s sake, rather than using our dirent and th=
en translating it all to save one read from the FS layer.<br></div><div><br=
></div><div>For v3, the synth tests will pass. We did have to modify the lo=
cal fs_unlinkat_dir test to correct AT_REMOVEDIR to P9_DOTL_AT_REMOVEDIR to=
 get that test to pass, but those now pass as well.<br></div><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, No=
v 24, 2021 at 2:09 PM Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@=
crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mittwoch, 24. Nov=
ember 2021 16:45:30 CET Michael Roitzsch wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; &gt; Are you sure d_seekoff doesn&#39;t work on macOS?<br>
&gt; <br>
&gt; I just tried on an APFS volume on macOS Monterey and d_seekoff is alwa=
ys 0,<br>
&gt; while telldir() outputs useful values.<br>
&gt; &gt; Because using telldir() instead<br>
&gt; &gt; is not the same thing. Accessing d_*off is just POD access, where=
as<br>
&gt; &gt; telldir() is a syscall.<br>
&gt; <br>
&gt; I am not sure this is the case. I have tried a quick test program:<br>
&gt; <br>
&gt; #include &lt;dirent.h&gt;<br>
&gt; <br>
&gt; int main(void)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int result =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DIR *dir =3D opendir(&quot;.&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0while (readdir(dir)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result +=3D tell=
dir(dir);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0closedir(dir);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
&gt; }<br>
&gt; <br>
&gt; I ran it with &#39;sudo dtruss ./test&#39;, which should give me a tra=
ce of the<br>
&gt; system calls. The relevant portion is:<br>
&gt; <br>
&gt; open_nocancel(&quot;.\0&quot;, 0x1100004, 0x0)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 3 0<br>
&gt; sysctlbyname(kern.secure_kernel, 0x12, 0x7FF7BE49810C, 0x7FF7BE498110,=
<br>
&gt; 0x0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0 0 fstatfs64(0x3, 0x=
7FF7BE498110, 0x0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0 0<br>
&gt; getdirentries64(0x3, 0x7FF4A5808A00, 0x2000)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 1472 0<br>
&gt; close_nocancel(0x3)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0 0<b=
r>
&gt; <br>
&gt; The directory has more than 30 entries, but the loop does not appear t=
o<br>
&gt; cause individual system calls. Instead, readdir() and telldir() appear=
 to<br>
&gt; be library functions powered by this getdirentries64 syscall.<br>
<br>
Right, telldir() is part of Apple&#39;s libc, no (fs) syscall involved:<br>
<a href=3D"https://opensource.apple.com/source/Libc/Libc-167/gen.subproj/te=
lldir.c.auto.html" rel=3D"noreferrer" target=3D"_blank">https://opensource.=
apple.com/source/Libc/Libc-167/gen.subproj/telldir.c.auto.html</a><br>
<br>
However instead of changing the (fs driver independent) 9p server [9p.c] co=
de<br>
and using fidp there, I would probably rather address this issue for macOS =
in<br>
the individual fs drivers [9p-local.c, 9p-synth.c, 9p-proxy.c] directly on<=
br>
dirent instead, and not rely on fidp not having mutated on server.<br>
<br>
And please make sure the 9p test cases pass.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>

--0000000000006ce55e05d6974646--

