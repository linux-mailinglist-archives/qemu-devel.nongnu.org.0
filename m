Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B85610378
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:54:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9sY-0002lA-GC; Thu, 27 Oct 2022 16:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oo9sU-0002l1-NY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:53:26 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oo9sS-0008Iw-Ds
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:53:26 -0400
Received: by mail-ej1-x630.google.com with SMTP id kt23so8097316ejc.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b5lxpKjf/PZOUPNZabqX95ZIxyD9c/5zN5ET+EZJveE=;
 b=HEWOAAiGwXvIFLA0LuHFRxFgizI6jFY+EcMkMiYUHgGvx/37wmWiE1zXlQpEw4Y9MS
 9VmtUYPQ5jX7byoEf3zeBYvCKU360z2JjX9vQY9PGhY4yXQSbcrHjdAqVlSSuricqpdF
 Rfgx31+W534QJeAShYmlCuu9m9oXhswroGMGnTg1qppM1/IIhw+/CXQjG+IJVs1t54pC
 9EjMpPSgJYUGBa31ArIDWNdvVgr/KXkPuSgsTI+N+KUL6hpBmAhjFuNqkyBgy7sNq6Td
 dMMcFCLVY5V7zRtaVm2ijnFQS+2lSDLW0wTjPpVgdB0jv2hjuTHAsIVZ/JxjEO+Kzzjd
 ZTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b5lxpKjf/PZOUPNZabqX95ZIxyD9c/5zN5ET+EZJveE=;
 b=cEUP5snJoCZdMYMrvxNdxdq25cpqDpiOgV7ASZbGcHIz0Bg8VeFEj67Ye0/m3vcEsq
 ov970K4nEZBDqXzV05ea945i6cguOVoc9JFfh7Jk0fUZtJGvS5BgkmXEPxn5qA9ZhD+2
 MgatQQpFTDUCCy/Z94O0TzFS/FO8Ait3fopJg89Z73RfGLCEbJTyclCFkEMTlEDvL3Oa
 0D7K0u0WGg6vkZJUTIARaMm64oW6Sum/Y62j4ecOCNhHW6C20JpzaFh6iifA5o9m1HxZ
 1jhq3sQrPJwZmGnP2NPebPR68SrT/pM2glZDfgT/s2DdfLwxRZsLNtGj0JWdvtOpWOHK
 8/VA==
X-Gm-Message-State: ACrzQf3KkqW0ASvo1vUD8dWnJOuPYY3xwWmLE+LDAQqntHrpzAzC7Bbg
 95t3MlOIm864FcpWVPCmyo2E+cOQH2Vwn/whxUo1wg==
X-Google-Smtp-Source: AMsMyM5+Nsd20udA/dufEjE6Um3Sn0xfaZLzraS5VY4YqGdQvU7L3g8GNoFu1UepsQ9vpQ22SajXwU5/8lTw7G1OvzM=
X-Received: by 2002:a17:906:730f:b0:791:9b75:2ca1 with SMTP id
 di15-20020a170906730f00b007919b752ca1mr41996171ejc.140.1666904002075; Thu, 27
 Oct 2022 13:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
 <3438372.x9l1EUDYgq@silver>
 <CAJSP0QU62wy6sN7CULhDtcXMufQvpF8CgRQDOSVw5w7JYC_p-g@mail.gmail.com>
 <11340963.ZY6gCF45se@silver>
In-Reply-To: <11340963.ZY6gCF45se@silver>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 27 Oct 2022 14:53:10 -0600
Message-ID: <CANCZdfq8WdeB9NqovMSFdm+tJoiPK6zAv6Tfgd5HaE6OSXS7oA@mail.gmail.com>
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, 
 Linus Heckemann <git@sphalerite.org>, Bin Meng <bin.meng@windriver.com>, 
 Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000eb386605ec0a5492"
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000eb386605ec0a5492
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022, 1:45 PM Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> On Thursday, October 27, 2022 7:37:07 PM CEST Stefan Hajnoczi wrote:
> > On Thu, 27 Oct 2022 at 12:38, Christian Schoenebeck
> > <qemu_oss@crudebyte.com> wrote:
> > >
> > > On Thursday, October 27, 2022 5:53:47 PM CEST Thomas Huth wrote:
> > > > On 24/10/2022 12.54, Christian Schoenebeck wrote:
> > > > > The following changes since commit
> 0529245488865038344d64fff7ee05864d3d17f6:
> > > > >
> > > > >    Merge tag 'pull-target-arm-20221020' of
> https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20
> 14:36:12 -0400)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024
> > > > >
> > > > > for you to fetch changes up to
> 3ce77865bf813f313cf79c00fd951bfc95a50165:
> > > > >
> > > > >    tests/9p: remove unnecessary g_strdup() calls (2022-10-24
> 12:24:32 +0200)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > 9pfs: performance, Windows host prep, tests restructure
> > > > >
> > > > > * Highlight of this PR is Linus Heckemann's GHashTable patch which
> > > > >    brings massive general performance improvements of 9p server
> > > > >    somewhere between factor 6 .. 12.
> > > > >
> > > > > * Bin Meng's g_mkdir patch is a preparatory patch for upcoming
> > > > >    Windows host support of 9p server.
> > > > >
> > > > > * The rest of the patches in this PR are 9p test code restructuring
> > > > >    and refactoring changes to improve readability and to ease
> > > > >    maintenance of 9p test code on the long-term.
> > > >
> > > >   Hi Christian,
> > > >
> > > > I think this PR broke the FreeBSD CI jobs:
> > > >
> > > >   https://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116
> > > >
> > > >   https://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372
> > > >
> > > > Could you please have a look?
> > > >
> > > >   Thanks!
> > > >    Thomas
> > >
> > > I try, but will certainly take some days, especially as I currently
> don't have
> > > a BSD installation at hand to try the changes.
> >
> > QEMU has the automation to run FreeBSD builds locally (in a VM):
> > $ make vm-build-freebsd
> >
> > Not sure if that FreeBSD environment matches the one in Cirrus CI
> > though. If they are different then maybe it won't reproduce locally.
>
> Something must be different, because
> e750a7ace492f0b450653d4ad368a77d6f660fb8
> compiles fine locally with `make vm-build-freebsd` and all tests pass, too.
>

I have a pull request I'm sending tomorrow that fixes a build issue on
FreeBSD for about 6 or so months on FreeBSD current. If it's hitting
that... but I didn't think our normal CI hit that... I'd submit it today,
but I'm traveling and there is an issue getting to my machines at home, but
I'll be home tomorrow.

Warner


Ideas?
>
> Best regards,
> Christian Schoenebeck
>
>
>
>

--000000000000eb386605ec0a5492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Oct 27, 2022, 1:45 PM Christian Schoenebeck &l=
t;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Thursday, October 27, 202=
2 7:37:07 PM CEST Stefan Hajnoczi wrote:<br>
&gt; On Thu, 27 Oct 2022 at 12:38, Christian Schoenebeck<br>
&gt; &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank" rel=3D=
"noreferrer">qemu_oss@crudebyte.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thursday, October 27, 2022 5:53:47 PM CEST Thomas Huth wrote:<=
br>
&gt; &gt; &gt; On 24/10/2022 12.54, Christian Schoenebeck wrote:<br>
&gt; &gt; &gt; &gt; The following changes since commit 0529245488865038344d=
64fff7ee05864d3d17f6:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 Merge tag &#39;pull-target-arm-20221020&#3=
9; of <a href=3D"https://git.linaro.org/people/pmaydell/qemu-arm" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://git.linaro.org/people/pmayde=
ll/qemu-arm</a> into staging (2022-10-20 14:36:12 -0400)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; are available in the Git repository at:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/cschoenebeck=
/qemu.git" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/cschoenebeck/qemu.git</a> tags/pull-9p-20221024<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; for you to fetch changes up to 3ce77865bf813f313cf79c00=
fd951bfc95a50165:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 tests/9p: remove unnecessary g_strdup() ca=
lls (2022-10-24 12:24:32 +0200)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -------------------------------------------------------=
---------<br>
&gt; &gt; &gt; &gt; 9pfs: performance, Windows host prep, tests restructure=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; * Highlight of this PR is Linus Heckemann&#39;s GHashTa=
ble patch which<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 brings massive general performance improve=
ments of 9p server<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 somewhere between factor 6 .. 12.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; * Bin Meng&#39;s g_mkdir patch is a preparatory patch f=
or upcoming<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 Windows host support of 9p server.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; * The rest of the patches in this PR are 9p test code r=
estructuring<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 and refactoring changes to improve readabi=
lity and to ease<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 maintenance of 9p test code on the long-te=
rm.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Hi Christian,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think this PR broke the FreeBSD CI jobs:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/=
-/jobs/3219611457#L3116" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/qemu-project/qemu/=
-/jobs/3219611460#L3372" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Could you please have a look?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Thanks!<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 Thomas<br>
&gt; &gt;<br>
&gt; &gt; I try, but will certainly take some days, especially as I current=
ly don&#39;t have<br>
&gt; &gt; a BSD installation at hand to try the changes.<br>
&gt; <br>
&gt; QEMU has the automation to run FreeBSD builds locally (in a VM):<br>
&gt; $ make vm-build-freebsd<br>
&gt; <br>
&gt; Not sure if that FreeBSD environment matches the one in Cirrus CI<br>
&gt; though. If they are different then maybe it won&#39;t reproduce locall=
y.<br>
<br>
Something must be different, because e750a7ace492f0b450653d4ad368a77d6f660f=
b8<br>
compiles fine locally with `make vm-build-freebsd` and all tests pass, too.=
<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
I have a pull request I&#39;m sending tomorrow that fixes a build issue on =
FreeBSD for about 6 or so months on FreeBSD current. If it&#39;s hitting th=
at... but I didn&#39;t think our normal CI hit that... I&#39;d submit it to=
day, but I&#39;m traveling and there is an issue getting to my machines at =
home, but I&#39;ll be home tomorrow.=C2=A0</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Warner</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
Ideas?<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000eb386605ec0a5492--

