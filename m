Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99725A28CD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:48:48 +0200 (CEST)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZhX-0001nt-Sn
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRZIt-0003vS-3n
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:23:19 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRZIr-0004J7-0s
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:23:18 -0400
Received: by mail-lj1-x229.google.com with SMTP id s8so1582973ljj.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Xwib9nS5kdiDsF/PkhXRhAVpAWd2iGm4K6w+DKlC+1w=;
 b=Hvc8EmNp+TXKWQ6C6XnjI86TiMXoXOI4rRZlIObT987BwIqPJaPIFaD30ACI2Fbvwo
 dW+BG7fbVlANanKdsaMfd8zGnWMNNukHtR+CtMQhzvyixqqRM9GR6/bSkv2DvC58k6rl
 eLukHqkQGNVk4Wv7K88QS3VjBlntFLQ+gv2uIlNp7dEjd7ZzU8Xvbs2eWHWF9SKC9roC
 XDOIZrdMPJndIQzzJ759MuvxnT1xRVp42Y8uGjdcgPb0qebC/9lpEk99GTzDlNbMnv/O
 4ixX1zWsyT/xv0kirN5UBlwZAUrmwABrDjwCj0DTCgavZzs01gLhN1LEfSSSRE47Qx4u
 xF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Xwib9nS5kdiDsF/PkhXRhAVpAWd2iGm4K6w+DKlC+1w=;
 b=KliKqfOIzo2uf3Zj13icM8KQClTNeemqXe5O07P+BwSP4PuAu14b7fi8o8FAkfuEh1
 B4EMUWeDPZf1TKokFRNuWKpSzTliPN+frx7dCaOirkMUlBWAjtNQPeu+KHn2CmLIDbDQ
 DZzNRX6OS7J5uU+p+jL8R6HIC0Uy14HBFMyOH86LNylSwpkppKY4PO7gKJyTJTktULMJ
 NFfumiR0208IkLRjycR2+EGkjuYg+wbV4n+jz6f1T7wNZbdX/XIBLlebF7ZhBQY6vIfs
 YOFuDftYlZNCP1SE3zEFt6Knzhbo9awA7ElpaaDEJ1tEv0yFxMaPhOZZZI80pJLmyfKO
 dNMw==
X-Gm-Message-State: ACgBeo2L4OgkYW2RJfaezu3dpP+cPpYIXIjQ4oZn6T+NCbbaZFFS0uaq
 dOmESQ+9aBpA+LUdkaNumwSikTNjfOt3lLnHW6c=
X-Google-Smtp-Source: AA6agR44U+EmSU1ba1jahpcIVQZSVYmHASPyNbAdmKiG+8uzcRfGTOYPQA9wr9iGFqBtWanKmGk+IY0iWMREoSXeaHw=
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr2342668ljq.529.1661520194917; Fri, 26
 Aug 2022 06:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-41-bmeng.cn@gmail.com>
 <CAMxuvawYwmo=-TicWwgn-JRB0u_9a04-Rx80TphOybNQ89Pf6Q@mail.gmail.com>
 <CAEUhbmV28TJGxf9JCrN-D8rDA47vgMJ4nO0gSGBcKcyEqPxEUA@mail.gmail.com>
In-Reply-To: <CAEUhbmV28TJGxf9JCrN-D8rDA47vgMJ4nO0gSGBcKcyEqPxEUA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Aug 2022 17:23:03 +0400
Message-ID: <CAJ+F1CKMcAfOAYbN3TXqjiiW-yqOYdoroN6BHp+PV+24-Ty7mg@mail.gmail.com>
Subject: Re: [PATCH 40/51] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000001592605e724d14a"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

--00000000000001592605e724d14a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 26, 2022 at 5:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Thu, Aug 25, 2022 at 3:59 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Hi
> >
> > On Wed, Aug 24, 2022 at 1:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >
> > > The combination of GENERIC_WRITE and FILE_SHARE_READ options does
> > > not allow the same file to be opened again by CreateFile() from
> > > another QEMU process with the same options when the previous QEMU
> > > process still holds the file handle openned.
> >
> > opened
> >
> > >
> > > As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
> > > such use case. This change makes the behavior be consisten with the
> > > POSIX platforms.
> > >
> >
> > consistent
> >
> > > [1]
> https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-openin=
g-files
> > >
> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> >
> >
> > What's the benefit to allow multiple processes write access to the
> > same file? It seems it could easily lead to corruption or unexpected
> > results.
>
> This was triggered by running the test_multifd_tcp_cancel() case on
> windows, which cancels the migration, and launches another QEMU
> process to migrate with the same file opened for write. Chances are
> that the previous QEMU process does not quit before the new QEMU
> process runs hence the new one still holds the file handle that does
> not allow shared write permission then the new QEMU process will fail.
>
>
Thanks for the details, that's worth to add in commit message imho.

But can't we fix the test instead to use different paths?

--=20
Marc-Andr=C3=A9 Lureau

--00000000000001592605e724d14a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 5:16 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, A=
ug 25, 2022 at 3:59 PM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Wed, Aug 24, 2022 at 1:43 PM Bin Meng &lt;<a href=3D"mailto:bmeng.c=
n@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.c=
om" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The combination of GENERIC_WRITE and FILE_SHARE_READ options does=
<br>
&gt; &gt; not allow the same file to be opened again by CreateFile() from<b=
r>
&gt; &gt; another QEMU process with the same options when the previous QEMU=
<br>
&gt; &gt; process still holds the file handle openned.<br>
&gt;<br>
&gt; opened<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; As per [1] we should add FILE_SHARE_WRITE to the share mode to al=
low<br>
&gt; &gt; such use case. This change makes the behavior be consisten with t=
he<br>
&gt; &gt; POSIX platforms.<br>
&gt; &gt;<br>
&gt;<br>
&gt; consistent<br>
&gt;<br>
&gt; &gt; [1] <a href=3D"https://docs.microsoft.com/en-us/windows/win32/fil=
eio/creating-and-opening-files" rel=3D"noreferrer" target=3D"_blank">https:=
//docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files<=
/a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@wi=
ndriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.=
com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt;<br>
&gt;<br>
&gt; What&#39;s the benefit to allow multiple processes write access to the=
<br>
&gt; same file? It seems it could easily lead to corruption or unexpected<b=
r>
&gt; results.<br>
<br>
This was triggered by running the test_multifd_tcp_cancel() case on<br>
windows, which cancels the migration, and launches another QEMU<br>
process to migrate with the same file opened for write. Chances are<br>
that the previous QEMU process does not quit before the new QEMU<br>
process runs hence the new one still holds the file handle that does<br>
not allow shared write permission then the new QEMU process will fail.<br>
<br></blockquote><div><br></div><div>Thanks for the details, that&#39;s wor=
th to add in commit message imho.</div><div><br></div><div>But can&#39;t we=
 fix the test instead to use different paths?<br></div><div><br></div>-- <b=
r></div><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<b=
r></div></div>

--00000000000001592605e724d14a--

