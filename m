Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E7E4341E5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 01:07:31 +0200 (CEST)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcyCg-0001Fp-3z
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 19:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcyB8-0000LM-SV
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 19:05:54 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcyB6-0001fy-SG
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 19:05:54 -0400
Received: by mail-ed1-x536.google.com with SMTP id 5so18187155edw.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpDPMPh3+ZiwWZiqHctGUNwk9moPp/7l51T7L+cbgXc=;
 b=Puy+GWlyYYRIvGx6tQ/mOKivmrJSZb5XiPgBUIFWk+ZOehcwFY5GrutvguJ1JSA3Se
 r5+GnOrR5ga5oN7pq1asidfWl1/3BuBPUmFDfwwl5NKYgrafSSza+aO5seXTq+I6+xwx
 EuppQVAcZKJV28kIE7v/YD1J9aoZYClww9391dRQOY+pG8QnV3b6qNG0CnFR7HrfdcDv
 zqu+aqdwtI6qexpC8x7eD3gz+XvRthwPSKSgSyjB4A1xzoUgttzWOePRib2Jtvt81o8z
 Qc7aaaj6qLyQrTi8Uf+4syxIqPiXAwOV+YyXE7C2Rw6q99sjnXp5w0K6hx0SE4XEqiXw
 VNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpDPMPh3+ZiwWZiqHctGUNwk9moPp/7l51T7L+cbgXc=;
 b=xlO2kmzkTcBuXYuYwLwBJoDcHXzVSzDCJu/goCgAGhqYaO5Xliq6oQ4XkxNb2A1E9K
 p4VQoyW2Ke7xKDYCJWrcGMW5GhPhtdEaUKuHGnyOw794+3Gq0lpw2rwIlyXuTFfgHZ2l
 bqecmznSQsZIrGmeVbV7/eo+jAx2+MPVC90H92wXxOsUWXJUcKyXwL/+iEy7CxbT6nEJ
 RUoZMmiFVEvrxg3cx9tPy4nIH3MrtruGQs31omwy/JQaKSHHrQs1550m157n2U7vM2I5
 GQBpjgfIk3xjesk7UewPtrVbbNg9LWbLRYpb0QQNsjXU1yYETd4fOKqgdB0YR1DmcmrB
 DZWw==
X-Gm-Message-State: AOAM533fXnMhSMkKKXMm8GAI/jrzPQ0IcKiSbztcHxaYnMmd67NKwMzX
 p3x5KbyBpRjIqKGmGYbjnl8GcE67tqT/hGYwBgeP4A==
X-Google-Smtp-Source: ABdhPJz5VE8f1zmhNz27sb+PTQ7/+R8BeaPy1X948uPxc59zmmGl742MJuGwwIygCwQM7DQuSh+gK2DhM/++M6O7794=
X-Received: by 2002:a17:906:f85b:: with SMTP id
 ks27mr42486932ejb.430.1634684751081; 
 Tue, 19 Oct 2021 16:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211019140944.152419-1-michael.roth@amd.com>
 <alpine.DEB.2.22.394.2110192010430.172612@anisinha-lenovo>
 <163466776130.169626.15936594200289260492@amd.com>
In-Reply-To: <163466776130.169626.15936594200289260492@amd.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 20 Oct 2021 04:35:40 +0530
Message-ID: <CAARzgwy23K3vGs76ra4QXeK=NxswEyrpPPXnK336TfAC+NzRCw@mail.gmail.com>
Subject: Re: [PATCH 00/64] Patch Round-up for stable 6.0.1,
 freeze on 2021-10-26
To: Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000e88c0405cebcb31e"
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
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
Cc: imammedo@redhat.com, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e88c0405cebcb31e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 23:53 Michael Roth <michael.roth@amd.com> wrote:

> Quoting Ani Sinha (2021-10-19 09:43:52)
> >
> >
> > On Tue, 19 Oct 2021, Michael Roth wrote:
> >
> > > Hi everyone,
> > >
> > > The following new patches are queued for QEMU stable v6.0.1:
> > >
> > >   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.0-staging/
> > >
> > > Patch freeze is 2021-10-26, and the release is planned for 2021-10-28=
:
> > >
> > >   https://wiki.qemu.org/Planning/6.0
> > >
> > > Please respond here or CC qemu-stable@nongnu.org on any additional
> patches
> > > you think should (or shouldn't) be included in the release.
> >
> > I believe we should also include this patch:
> >
> https://lore.kernel.org/qemu-devel/20210916132838.3469580-2-ani@anisinha.=
ca/T/
> >
> > It is also CC'd to qemu-stable@ but the patch itself was not tagged so
> (my
> > apologies for that).
>
> It looks like this patch is a fix for:
>
>   commit caf108bc587908f7608729f39639dccdfa53010b
>   Author: Julia Suvorova <jusual@redhat.com>
>   Date:   Tue Jul 13 02:42:00 2021 +0200
>
>       hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
>
> which is in 6.1.0, but not 6.0.0, so it didn't seem like it was needed
> for 6.0.1. Let me know if that's incorrect.
>
> Will definitely pull it in for 6.1.1 though.


Yes you are correct. This should be pulled in for 6.1.1 and not 6.0.1. In
fact for 6.0.1 there will likely be a conflict and the patch won=E2=80=99t =
apply.
Apologies for the noise.

>
>

--000000000000e88c0405cebcb31e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 19, 2021 at 23:53 Michael Roth &lt;<a href=3D"m=
ailto:michael.roth@amd.com">michael.roth@amd.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">Quoting Ani Sinha (2021-10-19 09:43:52)<br>
&gt; <br>
&gt; <br>
&gt; On Tue, 19 Oct 2021, Michael Roth wrote:<br>
&gt; <br>
&gt; &gt; Hi everyone,<br>
&gt; &gt;<br>
&gt; &gt; The following new patches are queued for QEMU stable v6.0.1:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/com=
mits/stable-6.0-staging/" rel=3D"noreferrer" target=3D"_blank">https://gitl=
ab.com/qemu-project/qemu/-/commits/stable-6.0-staging/</a><br>
&gt; &gt;<br>
&gt; &gt; Patch freeze is 2021-10-26, and the release is planned for 2021-1=
0-28:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://wiki.qemu.org/Planning/6.0" rel=3D=
"noreferrer" target=3D"_blank">https://wiki.qemu.org/Planning/6.0</a><br>
&gt; &gt;<br>
&gt; &gt; Please respond here or CC <a href=3D"mailto:qemu-stable@nongnu.or=
g" target=3D"_blank">qemu-stable@nongnu.org</a> on any additional patches<b=
r>
&gt; &gt; you think should (or shouldn&#39;t) be included in the release.<b=
r>
&gt; <br>
&gt; I believe we should also include this patch:<br>
&gt; <a href=3D"https://lore.kernel.org/qemu-devel/20210916132838.3469580-2=
-ani@anisinha.ca/T/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/qemu-devel/20210916132838.3469580-2-ani@anisinha.ca/T/</a><br>
&gt; <br>
&gt; It is also CC&#39;d to qemu-stable@ but the patch itself was not tagge=
d so (my<br>
&gt; apologies for that).<br>
<br>
It looks like this patch is a fix for:<br>
<br>
=C2=A0 commit caf108bc587908f7608729f39639dccdfa53010b<br>
=C2=A0 Author: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" targ=
et=3D"_blank">jusual@redhat.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Tue Jul 13 02:42:00 2021 +0200<br>
<br>
=C2=A0 =C2=A0 =C2=A0 hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q=
35<br>
<br>
which is in 6.1.0, but not 6.0.0, so it didn&#39;t seem like it was needed<=
br>
for 6.0.1. Let me know if that&#39;s incorrect.<br>
<br>
Will definitely pull it in for 6.1.1 though.</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Yes you are correct. This should be pulled in f=
or 6.1.1 and not 6.0.1. In fact for 6.0.1 there will likely be a conflict a=
nd the patch won=E2=80=99t apply. Apologies for the noise.=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)" dir=3D"auto"><br>
</blockquote></div></div>

--000000000000e88c0405cebcb31e--

