Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1914C5A6383
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:37:30 +0200 (CEST)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0Ui-00027X-SZ
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oT0Nt-0004Mt-8f
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:30:26 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:36641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oT0Nr-0002Vh-1G
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:30:24 -0400
Received: by mail-lf1-x133.google.com with SMTP id p7so4173226lfu.3
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=tMKW6BoIEOPTRNwrv54nqam5eQtgF2zz/BUoSs/XhrI=;
 b=A9xpgdyS/W39aJAXAdeJMKCXS3d7tLa8LEmAEVo5wjnH7m+SvnI1B68O49eSFZEYed
 Id3qKJhto2oebHKn4Bni1amrIPeULjZkeZx/PPuaKNz8bROtBEZq00Ah0oqZB8rkISIB
 J0qkMPr0YezX0WlsbJ+8sc8TiTBhNN6ONYYTxwtJvQ6cdNWtidqnEjXX7YbBEzkSjHhL
 LqWekjylu9XIZouSWiY0lsEwgos1yfYmemhXtMyWvZE83WPNvcm9969tBjQpoAaoJp/u
 TjgmRuN4wR5ox9FZF33mttPEKnE415kK8z1EjrrSBkxyB0zNRQBs96QBSH+C7Eq3M6G1
 2mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tMKW6BoIEOPTRNwrv54nqam5eQtgF2zz/BUoSs/XhrI=;
 b=L05CbMTM+7sR4tlNC/xJegBkwUs1FqYGyos+BO7ihPsOZo0FQIZn2W7j/yTWAI/upN
 qKeot+fH93cGJ8RGv8nvqcWRE5ZQ84OR1nvkawcjz9e8twEy/ZGCpvfQaw49690pLjz3
 LQ1xAVWrzG4i7lhm8hDvm742FaX68tK9A2jnrE5pMp4vJIqVBOoONeT2+VTxBii5cjrC
 qgGtZ7yb5suamSP/lWHiQzgKWoIm/eNCa4oXrpZ88lrohQiat5XC2D4uejnDkdZ3Cov6
 phjoG+zKN5IujawUftaDluygqml1lBTzfyveDaNWi1s7QXDFmBsqVNMDlW35z7QZk/fq
 NDFw==
X-Gm-Message-State: ACgBeo2DDBZ8JoxgEBWiwKLo1Bb7uWEJmBBOE6PSD6rnx+59aAhJqB4w
 YIWlsg5ZpW6Hlxu5nPbpJQva5oFAbVamrjel3mo=
X-Google-Smtp-Source: AA6agR5+XPafPSZbIPmYSzRR7FkYGLlnNEZktit8zuo+xCeNphPoP2NAmnxbLgvfqKSxiCGDipLAbFBuQE1wkOQVlmA=
X-Received: by 2002:a05:6512:12d6:b0:492:cfab:ffae with SMTP id
 p22-20020a05651212d600b00492cfabffaemr8119820lfg.329.1661862620953; Tue, 30
 Aug 2022 05:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-41-bmeng.cn@gmail.com>
 <CAMxuvawYwmo=-TicWwgn-JRB0u_9a04-Rx80TphOybNQ89Pf6Q@mail.gmail.com>
 <CAEUhbmV28TJGxf9JCrN-D8rDA47vgMJ4nO0gSGBcKcyEqPxEUA@mail.gmail.com>
 <CAJ+F1CKMcAfOAYbN3TXqjiiW-yqOYdoroN6BHp+PV+24-Ty7mg@mail.gmail.com>
 <CAEUhbmXkZCWJ86wnLNMoxKzP5Qpi5HMtLSCki0-MrLyMEEM7gw@mail.gmail.com>
In-Reply-To: <CAEUhbmXkZCWJ86wnLNMoxKzP5Qpi5HMtLSCki0-MrLyMEEM7gw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Aug 2022 16:30:09 +0400
Message-ID: <CAJ+F1CJL0mTPhn5euhgDWsNSKh8y729TECoG9=R_Oc+Pyjo5Yg@mail.gmail.com>
Subject: Re: [PATCH 40/51] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000300a1a05e7748b7c"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000300a1a05e7748b7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Aug 28, 2022 at 3:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Fri, Aug 26, 2022 at 9:23 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Fri, Aug 26, 2022 at 5:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Thu, Aug 25, 2022 at 3:59 PM Marc-Andr=C3=A9 Lureau
> >> <marcandre.lureau@redhat.com> wrote:
> >> >
> >> > Hi
> >> >
> >> > On Wed, Aug 24, 2022 at 1:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >> > >
> >> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> > >
> >> > > The combination of GENERIC_WRITE and FILE_SHARE_READ options does
> >> > > not allow the same file to be opened again by CreateFile() from
> >> > > another QEMU process with the same options when the previous QEMU
> >> > > process still holds the file handle openned.
> >> >
> >> > opened
> >> >
> >> > >
> >> > > As per [1] we should add FILE_SHARE_WRITE to the share mode to all=
ow
> >> > > such use case. This change makes the behavior be consisten with th=
e
> >> > > POSIX platforms.
> >> > >
> >> >
> >> > consistent
> >> >
> >> > > [1]
> https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-openin=
g-files
> >> > >
> >> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> > > ---
> >> >
> >> >
> >> > What's the benefit to allow multiple processes write access to the
> >> > same file? It seems it could easily lead to corruption or unexpected
> >> > results.
> >>
> >> This was triggered by running the test_multifd_tcp_cancel() case on
> >> windows, which cancels the migration, and launches another QEMU
> >> process to migrate with the same file opened for write. Chances are
> >> that the previous QEMU process does not quit before the new QEMU
> >> process runs hence the new one still holds the file handle that does
> >> not allow shared write permission then the new QEMU process will fail.
> >>
> >
> > Thanks for the details, that's worth to add in commit message imho.
>
> Sure, I can add this in the commit message.
>
> >
> > But can't we fix the test instead to use different paths?
> >
>
> Yeah, the test case fix is here:
>
> https://lore.kernel.org/qemu-devel/20220824094029.1634519-42-bmeng.cn@gma=
il.com/
>
> I think this patch is still needed as it makes the Windows char-file
> behavior be consistent with the posix because there is no lock
> mechanism in posix.
>

In this case, I would rather make posix consistent with the windows
behaviour :)

I am not sure how to proceed from there, but I would discard your windows
patch for now.

--000000000000300a1a05e7748b7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 28, 2022 at 3:19 AM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, A=
ug 26, 2022 at 9:23 PM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Fri, Aug 26, 2022 at 5:16 PM Bin Meng &lt;<a href=3D"mailto:bmeng.c=
n@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Aug 25, 2022 at 3:59 PM Marc-Andr=C3=A9 Lureau<br>
&gt;&gt; &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blan=
k">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Aug 24, 2022 at 1:43 PM Bin Meng &lt;<a href=3D"mailt=
o:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@wi=
ndriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; The combination of GENERIC_WRITE and FILE_SHARE_READ opt=
ions does<br>
&gt;&gt; &gt; &gt; not allow the same file to be opened again by CreateFile=
() from<br>
&gt;&gt; &gt; &gt; another QEMU process with the same options when the prev=
ious QEMU<br>
&gt;&gt; &gt; &gt; process still holds the file handle openned.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; opened<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; As per [1] we should add FILE_SHARE_WRITE to the share m=
ode to allow<br>
&gt;&gt; &gt; &gt; such use case. This change makes the behavior be consist=
en with the<br>
&gt;&gt; &gt; &gt; POSIX platforms.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; consistent<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; [1] <a href=3D"https://docs.microsoft.com/en-us/windows/=
win32/fileio/creating-and-opening-files" rel=3D"noreferrer" target=3D"_blan=
k">https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-openi=
ng-files</a><br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou=
.cheng@windriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<=
br>
&gt;&gt; &gt; &gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@w=
indriver.com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What&#39;s the benefit to allow multiple processes write acce=
ss to the<br>
&gt;&gt; &gt; same file? It seems it could easily lead to corruption or une=
xpected<br>
&gt;&gt; &gt; results.<br>
&gt;&gt;<br>
&gt;&gt; This was triggered by running the test_multifd_tcp_cancel() case o=
n<br>
&gt;&gt; windows, which cancels the migration, and launches another QEMU<br=
>
&gt;&gt; process to migrate with the same file opened for write. Chances ar=
e<br>
&gt;&gt; that the previous QEMU process does not quit before the new QEMU<b=
r>
&gt;&gt; process runs hence the new one still holds the file handle that do=
es<br>
&gt;&gt; not allow shared write permission then the new QEMU process will f=
ail.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Thanks for the details, that&#39;s worth to add in commit message imho=
.<br>
<br>
Sure, I can add this in the commit message.<br>
<br>
&gt;<br>
&gt; But can&#39;t we fix the test instead to use different paths?<br>
&gt;<br>
<br>
Yeah, the test case fix is here:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20220824094029.1634519-42-bme=
ng.cn@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/qemu-devel/20220824094029.1634519-42-bmeng.cn@gmail.com/</a><br>
<br>
I think this patch is still needed as it makes the Windows char-file<br>
behavior be consistent with the posix because there is no lock<br>
mechanism in posix.<br></blockquote><div><br></div><div>In this case, I wou=
ld rather make posix consistent with the windows behaviour :)</div><div><br=
></div><div>I am not sure how to proceed from there, but I would discard yo=
ur windows patch for now.<br></div><br></div></div>

--000000000000300a1a05e7748b7c--

