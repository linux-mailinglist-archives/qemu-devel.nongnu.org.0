Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D0498FC9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:56:53 +0100 (CET)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5SN-0000fK-Ui
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:56:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nC5OC-0007PC-PO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:52:42 -0500
Received: from [2607:f8b0:4864:20::935] (port=46963
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nC5OB-0007x6-8Z
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:52:32 -0500
Received: by mail-ua1-x935.google.com with SMTP id c36so33110294uae.13
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 11:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vtx+vY16iKD466AnCdmWfLGh855EKBIUatlw7LN1K9M=;
 b=JQ0k8ZVrlU6VwGIxbc+HR+NqsG1adxE7gbrhqBLDZuTJ7ZBACkuIMAdtxmFDuRhG+d
 baRzhq74X+dcwqJ2TjKQ3xxcB+y3ukhZMOmH89ERHduZjScLPhZrNtQr0vx3meKsuL3H
 DjsGme0H2ZrBrD4DOnoTWEk6LZUe2K0P0NKsqjbB0E/TA34Snb0ICW3rS8c1btJW8spP
 DCJZjBKhw1c/pAvX/7yxNZQ2juBd2ocTwOzLhG5yoWvsy8vjMRebJF/oEQgrx2i74Gy2
 fXTAfh/DfL//gjA/dS5OOkpgTwpR9phN0pMukAxbqgRrm+d7oE8kvkTdtbd9gg20dajO
 9ZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtx+vY16iKD466AnCdmWfLGh855EKBIUatlw7LN1K9M=;
 b=KUw1ZBZ39IGqSST+Sgt7SNTKFJqPJnGAyZFcHIM0Vu9SKX/7bDYvqBjrVsqlIRBpjF
 G1Jkb19whWb5bKyWOknsRQumkifOueitZo6jXvM97uywN36FvNX9MbtV+UiNeeNl0wKN
 l/ADmv6sDiS1GiE8yH8sF+jzbF4UR7hQDCeCdQEZ59HG5EZ/bdrxou+AMgskfIuPdnfB
 uSOfmQqsxNlnc3o7HleQGJa/MMTzTxqrt7lpAEu/f1hYkkcu6NqNMJuUH9GHB6dnIUV3
 TgXudk75Qw+czyssdNGU3JIeW0l1zbwwJ/xWJ0Cab3dX9zSZMQA49qtOStF+7NVTsfJP
 ghbQ==
X-Gm-Message-State: AOAM5307Vjfw+mAyt3+b2PvwpFstPHl0m461iCLE3oqm2TWm02QIpvJ9
 lGS+DIK6hchtlZwEXKjd3gPoh7WO13vZYRJ3Dj6AVQ==
X-Google-Smtp-Source: ABdhPJys1fDcGY9Vb8cXDdFCG32ABTvts+Rsc8+q+pYbHzBk9/kfW2mD14NlJZd0eVEdQ3h8zt4Baxa75Igfv6sSFTg=
X-Received: by 2002:ab0:77da:: with SMTP id y26mr6427251uar.68.1643053950193; 
 Mon, 24 Jan 2022 11:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20220106223316.3661625-1-venture@google.com>
 <20220111141332.4e0de6af@redhat.com>
 <CAO=notxVi7-pGoJS9kXuEcC8nBdhEbW=+Wu6V5qP7UVvzubcNQ@mail.gmail.com>
 <20220119083658.200bb541@redhat.com>
In-Reply-To: <20220119083658.200bb541@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 24 Jan 2022 11:52:18 -0800
Message-ID: <CAO=notwpV1kjkKfUKoZoNwYFBsBA2xbVW3RAta7k4mz-MqvLqA@mail.gmail.com>
Subject: Re: [PATCH] hw/smbios: Add table 4 parameter, "processor-id"
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, ani@anisinha.ca, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Foley <pefoley@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="0000000000000caf4e05d6594f19"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=venture@google.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000caf4e05d6594f19
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 18, 2022 at 11:37 PM Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue, 18 Jan 2022 09:15:42 -0800
> Patrick Venture <venture@google.com> wrote:
>
> > On Tue, Jan 11, 2022 at 5:13 AM Igor Mammedov <imammedo@redhat.com>
> wrote:
> >
> > > On Thu,  6 Jan 2022 14:33:16 -0800
> > > Patrick Venture <venture@google.com> wrote:
> > >
> [...]
> > > > diff --git a/qemu-options.hx b/qemu-options.hx
> > > > index ec90505d84..3c51b6cf8f 100644
> > > > --- a/qemu-options.hx
> > > > +++ b/qemu-options.hx
> > > > @@ -2527,6 +2527,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
> > > >      "                specify SMBIOS type 3 fields\n"
> > > >      "-smbios
> > >
> type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
> > > >      "
> > > [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
> > > > +    "              [,processor-id=%d]\n"
> > > >      "                specify SMBIOS type 4 fields\n"
> > > >      "-smbios type=11[,value=str][,path=filename]\n"
> > > >      "                specify SMBIOS type 11 fields\n"
> > >
> > > missing update of SRST part
> > >
> >
> > I grepped for SRST, where is this that I need to update also?
>
> option definition has 2 parts DEF() and SRST that follows right
> after it, the later is used as help text for the option
> SRST


Ahh, yeah, I grepped in the wrong place :)

Working on validating v2 presently then sending out.


>
> ``-smbios file=binary``
> ...
>
> >
> > Thanks!
>

Thanks!

--0000000000000caf4e05d6594f19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 18, 2022 at 11:37 PM Igor=
 Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tue, 18 Jan 2022 09:15:42 -0800<br>
Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank"=
>venture@google.com</a>&gt; wrote:<br>
<br>
&gt; On Tue, Jan 11, 2022 at 5:13 AM Igor Mammedov &lt;<a href=3D"mailto:im=
ammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu,=C2=A0 6 Jan 2022 14:33:16 -0800<br>
&gt; &gt; Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=
=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
[...]<br>
&gt; &gt; &gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; &gt; &gt; index ec90505d84..3c51b6cf8f 100644<br>
&gt; &gt; &gt; --- a/qemu-options.hx<br>
&gt; &gt; &gt; +++ b/qemu-options.hx<br>
&gt; &gt; &gt; @@ -2527,6 +2527,7 @@ DEF(&quot;smbios&quot;, HAS_ARG, QEMU_=
OPTION_smbios,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 specify SMBIOS type 3 fields\n&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;-smbios=C2=A0 <br>
&gt; &gt; type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Dstr][,s=
erial=3Dstr]\n&quot;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 <br>
&gt; &gt; [,asset=3Dstr][,part=3Dstr][,max-speed=3D%d][,current-speed=3D%d]=
\n&quot;=C2=A0 <br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [,processor-id=3D%d]\n&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 specify SMBIOS type 4 fields\n&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;-smbios type=3D11[,value=3Dstr][,p=
ath=3Dfilename]\n&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 specify SMBIOS type 11 fields\n&quot;=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; missing update of SRST part<br>
&gt; &gt;=C2=A0 <br>
&gt; <br>
&gt; I grepped for SRST, where is this that I need to update also?<br>
<br>
option definition has 2 parts DEF() and SRST that follows right<br>
after it, the later is used as help text for the option<br>
SRST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0</blockquote><div><br></div><div>Ahh, yeah, I grepp=
ed in the wrong place :)</div><div><br></div><div>Working on validating v2 =
presently then sending out.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
``-smbios file=3Dbinary`` <br>
...<br>
<br>
&gt; <br>
&gt; Thanks!<br></blockquote><div><br></div><div>Thanks!=C2=A0</div></div><=
/div>

--0000000000000caf4e05d6594f19--

