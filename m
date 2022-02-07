Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37614AB309
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 02:12:35 +0100 (CET)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGsa2-0003YD-Os
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 20:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGsYK-0002m8-2T
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 20:10:49 -0500
Received: from [2a00:1450:4864:20::131] (port=40800
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGsYE-0000T3-CF
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 20:10:46 -0500
Received: by mail-lf1-x131.google.com with SMTP id a28so23782300lfl.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 17:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xoMZB4ohnNU2e1QV/2Wg2eRzPnpP79h3Cb7uY8wGFpY=;
 b=bAZmVaS0+HnPMVLWOgFJyx76IfDXH3BKDOl8ifCHtPINZ1Zcfb4p8V/mgsplw1+GFj
 2kL6hpJJYrz5AGTUgGWJtQdLfYaipy5+9kJe2c631bJZfiSuM3sgb6knLibn8wTQHXoP
 GSZgPv4/des/7pVSK31xFe2eLsJytcqEr5FK9VzOGVPeflqzG/jvWGbOCYqjOYNHthFb
 HLmB4rTTKzma9bGz3yGUqgJ3iTuSviNx/Fjd4TDjTx8Tu8xNhpDiiyVhpqRCf3EkOBQv
 UIlGlieqPp32YQu3OYzA57tVkT33r/Hs2qOxXmyuwwGclifn2OLPVS+k7RAe+d4P+jHI
 H7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xoMZB4ohnNU2e1QV/2Wg2eRzPnpP79h3Cb7uY8wGFpY=;
 b=OruX8fYUIUdemjkudUJNKkrMwlNApDVx0WSmYY5G16vXLitWD9Y3B/c1EnoCTZmt/T
 dH/awpogXT5hZ84Xfvs021LM8MgibNoDvYWe/3gUpomcUEZXZdU1MznwBZNemBIFmRX7
 oY5FILqQDrWER3OsYdxA6IswSOuV2WbhS5dsi7AObZsTlsse+8BePjNJ/eu3I7z9ncQJ
 59K/tDLaqoa+C5Qn+wojuoN7s9c0pMvXHJog5oc4jXAcH5lECVcRUmZRPtOlzTnYLIyt
 N7QvPWeawfVwEWCdccuf3gIvWgRaZtzCvY2uylIff+EDQytJeCnQq9/etXe0ud3bTUuv
 fpUw==
X-Gm-Message-State: AOAM532n6pdh0y4Cw7va9KDjPxXPCUwrRLFsP8ioryBgbZ55hJymRw2m
 MH2Zympa2k4vHgag6nFIH/MiLLNLQ3U3tZEYou0=
X-Google-Smtp-Source: ABdhPJws4epUTM9aF1hgTGjAsfEqFAJwzDJACQubtHRJ6Sx1QH7F5TNjibbDbTLE2+/zL58iwn3l+h3F26X9520fUwg=
X-Received: by 2002:a05:6512:3123:: with SMTP id
 p3mr7170690lfd.298.1644196235042; 
 Sun, 06 Feb 2022 17:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-10-wwcohen@gmail.com>
 <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
In-Reply-To: <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
From: Will Cohen <wwcohen@gmail.com>
Date: Sun, 6 Feb 2022 20:10:23 -0500
Message-ID: <CAB26zV1ZmpODTqv20Ae77+SWvG5Cf1GWdi7FuR_L_aWjFcgfnA@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000087e34a05d7634493"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000087e34a05d7634493
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch set currently places it in 9p-util only because 9p is the only
place where this issue seems to have come up so far and we were wary of
editing files too far afield, but I have no attachment to its specific
location!

On Sun, Feb 6, 2022 at 4:21 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> On 6/2/22 21:07, Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > Darwin does not support mknodat. However, to avoid race conditions
> > with later setting the permissions, we must avoid using mknod on
> > the full path instead. We could try to fchdir, but that would cause
> > problems if multiple threads try to call mknodat at the same time.
> > However, luckily there is a solution: Darwin includes a function
> > that sets the cwd for the current thread only.
> > This should suffice to use mknod safely.
> >
> > This function (pthread_fchdir_np) is protected by a check in
> > meson in a patch later in tihs series.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Adjust coding style
> >               - Replace clang references with gcc
> >               - Note radar filed with Apple for missing syscall
> >               - Replace direct syscall with pthread_fchdir_np and
> >                 adjust patch notes accordingly]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >   hw/9pfs/9p-local.c       |  5 +++--
> >   hw/9pfs/9p-util-darwin.c | 27 +++++++++++++++++++++++++++
> >   hw/9pfs/9p-util-linux.c  |  5 +++++
> >   hw/9pfs/9p-util.h        |  2 ++
> >   4 files changed, 37 insertions(+), 2 deletions(-)
>
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 8e610ad224..f6fed963bf 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -97,6 +97,8 @@ ssize_t flistxattrat_nofollow(int dirfd, const char
> *filename,
> >   ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> >                                   const char *name);
> >
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> dev);
>
> I think this belong to "osdep.h" & os-posix.c.
>

--00000000000087e34a05d7634493
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch set currently places it in 9p-util only because=
 9p is the only place where this issue seems to have come up so far and we =
were wary of editing files too far afield, but I have no attachment to its =
specific location!<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sun, Feb 6, 2022 at 4:21 PM Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 6/2/22 21:0=
7, Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; Darwin does not support mknodat. However, to avoid race conditions<br>
&gt; with later setting the permissions, we must avoid using mknod on<br>
&gt; the full path instead. We could try to fchdir, but that would cause<br=
>
&gt; problems if multiple threads try to call mknodat at the same time.<br>
&gt; However, luckily there is a solution: Darwin includes a function<br>
&gt; that sets the cwd for the current thread only.<br>
&gt; This should suffice to use mknod safely.<br>
&gt; <br>
&gt; This function (pthread_fchdir_np) is protected by a check in<br>
&gt; meson in a patch later in tihs series.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Adjust coding style<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Replace clang =
references with gcc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Note radar fil=
ed with Apple for missing syscall<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Replace direct=
 syscall with pthread_fchdir_np and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adjust pa=
tch notes accordingly]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++=
--<br>
&gt;=C2=A0 =C2=A0hw/9pfs/9p-util-darwin.c | 27 +++++++++++++++++++++++++++<=
br>
&gt;=C2=A0 =C2=A0hw/9pfs/9p-util-linux.c=C2=A0 |=C2=A0 5 +++++<br>
&gt;=C2=A0 =C2=A0hw/9pfs/9p-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<=
br>
&gt;=C2=A0 =C2=A04 files changed, 37 insertions(+), 2 deletions(-)<br>
<br>
&gt; diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
&gt; index 8e610ad224..f6fed963bf 100644<br>
&gt; --- a/hw/9pfs/9p-util.h<br>
&gt; +++ b/hw/9pfs/9p-util.h<br>
&gt; @@ -97,6 +97,8 @@ ssize_t flistxattrat_nofollow(int dirfd, const char =
*filename,<br>
&gt;=C2=A0 =C2=A0ssize_t fremovexattrat_nofollow(int dirfd, const char *fil=
ename,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name);<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt; +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t =
dev);<br>
<br>
I think this belong to &quot;osdep.h&quot; &amp; os-posix.c.<br>
</blockquote></div>

--00000000000087e34a05d7634493--

