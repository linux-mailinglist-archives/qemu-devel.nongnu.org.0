Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ED0391C2B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:37:18 +0200 (CEST)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvav-0000x8-LL
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1llvZw-0000Gp-NM
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:36:16 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1llvZv-00044w-3M
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:36:16 -0400
Received: by mail-io1-xd2e.google.com with SMTP id b81so1457450iof.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=magaFaT/vqbAHD2ufL6VJw3jVfSh1EWEZln0Nq7lExU=;
 b=Mk+8ZqXn8c42fwlzKFGhn2uYqSkev6ga73mD6dV68Wk4Vi1pEh6LBANLoUCDbAzvoM
 4qvG7frblfeioEpLCW21wWyAu3VWB7tREJCC3snEjIMJFL5sBX2BSuUWeRm0drH3CLgv
 lq/E/Rqbd3MVMPi9R2p8oyPfMISMCGGYwbx92QK6YRa+ivmDm5nAo62v4WrC3UK0ID3d
 hnClAdxyZ9RX3LnVnwIgthm6Ql8I2CUZd0t2IYMUUg6APXW2sgacHAfHvfJlmfFU4Ywy
 VZRI7xX8IJ8vo/XaOKo/sG2i2J5tY3aG5oFmUYKhS+xuVABLK9qa+nVqUX8diY4gi3/2
 8WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=magaFaT/vqbAHD2ufL6VJw3jVfSh1EWEZln0Nq7lExU=;
 b=a/Emh5iLHC8vuI+Ph3A705jyEzunHIqS5S8vttJkPr37A1A136Z8AQIySP+rNrnoGu
 prQpXVQzcMUuVRrcGQ1f+CWgDRmTbVa9m6SAk0Qie5Wm1rqPmvTjQlPqHdu3GpiaZLul
 phhead9kDFbDhA8z9xvRMsFztycSWLc50H48De+IzxgPgIUROVnAx4XkR1nkonUSradU
 yjA9EG4VCN0nHu4BXYZqhYgclAoFzHtQcp20Jpie2PYGDWXX2d+L3e0EYi45jqzY85Vh
 EVriLk709MZDpr0g1diHzB2+ZqELPJgSfGoqD3BbcUczljeaaYVpr+1LvqgUVCCp6Kvf
 SaOA==
X-Gm-Message-State: AOAM532o9u416f1EdtI3lWlvhgPhwRYl2tvpV7s/RxYba+Y6mB94zvfv
 1kcsXd7JWaVI3UcD4pfqEiFvO+BG0oboe9orw8w=
X-Google-Smtp-Source: ABdhPJzHMjZGLkO5W21dsg5uxWajiMsqDkLhEqiR2DcQYiYFo9ets+kyAnoBNTW3O5qWlhRtE9NxqCHFT/Y0S3tiiGE=
X-Received: by 2002:a05:6602:2186:: with SMTP id
 b6mr24697418iob.128.1622043372508; 
 Wed, 26 May 2021 08:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
In-Reply-To: <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 26 May 2021 21:05:43 +0530
Message-ID: <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
Subject: Re: Fwd: GSoC Intro - TUI interface for QMP
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000075c1a05c33d6777"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, armbru@redhat.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000075c1a05c33d6777
Content-Type: text/plain; charset="UTF-8"

Hello Stefan,

On Mon, May 24, 2021 at 7:02 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Sat, May 22, 2021 at 12:32:00AM +0530, Niteesh G. S. wrote:
> > By end of this summer, I would like to get a basic TUI with some
> desirable
> > features working. Some of the features I would like to get working are
> > 1) Syntax checking
> > 2) Syntax highlighting
> > 3) Code completion
> > 4) Logging
> >
> > I would like to hear some of the features you would like to have and also
> > your
> > advice's on implementation.
>
> Welcome Niteesh!
>
> It would be great to have an QMP API documentation viewer built into the
> TUI. When you enter a command like 'migrate' it would automatically
> display the associated QMP command documentation from qapi/*.json.
>
That's a great idea.
Do you want the documentation as a popup or in a separate tab?
By separate tab what I mean is a full window dedicated to documentation
with some kind of search functionality.

Thanks,
Niteesh.

>
> Stefan
>

--000000000000075c1a05c33d6777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hello Stefan,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, May 24, 2021 at 7:02 PM Stefan Haj=
noczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat,=
 May 22, 2021 at 12:32:00AM +0530, Niteesh G. S. wrote:<br>
&gt; By end of this summer, I would like to get a basic TUI with some desir=
able<br>
&gt; features working. Some of the features I would like to get working are=
<br>
&gt; 1) Syntax checking<br>
&gt; 2) Syntax highlighting<br>
&gt; 3) Code completion<br>
&gt; 4) Logging<br>
&gt; <br>
&gt; I would like to hear some of the features you would like to have and a=
lso<br>
&gt; your<br>
&gt; advice&#39;s on implementation.<br>
<br>
Welcome Niteesh!<br>
<br>
It would be great to have an QMP API documentation viewer built into the<br=
>
TUI. When you enter a command like &#39;migrate&#39; it would automatically=
<br>
display the associated QMP command documentation from qapi/*.json.<br></blo=
ckquote><div><span class=3D"gmail_default" style=3D"font-size:small">That&#=
39;s a great idea.</span></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Do you want the documentation as a popup or in a separate tab?</=
div><div class=3D"gmail_default" style=3D"font-size:small">By separate=C2=
=A0tab what I mean is a full window dedicated to documentation</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">with some kind of search fu=
nctionality.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Thanks,</div=
><div class=3D"gmail_default" style=3D"font-size:small">Niteesh.</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Stefan<br>
</blockquote></div></div>

--000000000000075c1a05c33d6777--

