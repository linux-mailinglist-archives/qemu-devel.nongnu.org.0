Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFDF66E3E9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHp3j-0006nP-Jj; Tue, 17 Jan 2023 11:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pHp3e-0006mv-FS
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:43:34 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pHp3b-0000E9-5k
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:43:34 -0500
Received: by mail-ed1-x533.google.com with SMTP id m21so45880291edc.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SWiDyz/yaGcRkAFkiKUKNgY+ekiu1e8SxDEERbiBc70=;
 b=NDNnleMeU1e5X0D8XVh6V3olTZuesQpo7fd5jvyMixGLGQTQF4IdXqFwP8pAZlT+9+
 DMBEwYLp0WPeZ8m0Zu9SRMq+bcFI2w8OdhM0pif5X7i7fAX56RtLKNG9pDlWg5ngWgqb
 ZemW7frzUabSQNFfPJjJRpGxBBtgCK7eloS1mZqgN5Q1OZMd5hBf/xzX/nhlNKg4il3f
 mZ94ZUXkBRPPxfAxuMwGi/gpDpPX90ByPH5q4X7OuPxRAGzFgsRGjUR1r1OIug0czY7A
 cm5Yy1QvsYTwutYB1f/j24l8cm8RVr5naKhyMmkI45p5Z/AcosWoPJwXAjORAwyjMCIZ
 CkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SWiDyz/yaGcRkAFkiKUKNgY+ekiu1e8SxDEERbiBc70=;
 b=UOMqbXC9BYesgG58hYfhtG5PhMaXBGFholmejIqvcQ9yKwuZeuduCg5qhLLY2SPd5j
 HikmpfD5PNWmhV2ntE4FbfR9vaMr1w7/2m+7fmDiDv0ssxJizpxudsrPMcoVnCCKTShR
 OQh+DPgYCBJGmuDoTPiGrHe5U+8zJWNz6kdmeyctw3ZycGcX37wSFRqSDdk0C6fPf36N
 jKvq/NZ2EfWdL53iCPtw6yMwnh4reIRc9c1XwNt1LKm1Ux/U84PwurBNvqfQ9yCFbnwt
 341PMgQEaolJ/OlFkmrcx2+ZRvad8JTRzp/RI4oL8Mi2kg+0gqUol3wrrXnM7UPwOBgj
 +YVA==
X-Gm-Message-State: AFqh2kpLfIjA2gZh7c9JLGxHxV0dOY4VhNFFd6MM7h5I0rHfpXbiuP3v
 HKYx8Q+uySFSNGoAjFuBdurIJK1CnB0XevlSp3rsqA==
X-Google-Smtp-Source: AMrXdXt+mIfo+zlJ40A5asWYa1u2hIM9m1UVdmM0cicK/yag+QGfxK7igYuPfXAKcoMSV9gQrH6cxD6jwFIubGnyeOE=
X-Received: by 2002:aa7:d718:0:b0:49d:c012:3f32 with SMTP id
 t24-20020aa7d718000000b0049dc0123f32mr537757edq.173.1673973809219; Tue, 17
 Jan 2023 08:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
 <Y8bMBZFqVP+EFzA8@redhat.com>
In-Reply-To: <Y8bMBZFqVP+EFzA8@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 17 Jan 2023 09:43:18 -0700
Message-ID: <CANCZdfrg+S-EsjzcJe78aWr3pBaESv1+MUkLa-H6i=o-S0LaqQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
To: Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org, 
 Kyle Evans <kevans@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000431f0105f2786613"
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000431f0105f2786613
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
> > On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
> > eesposit@redhat.com> wrote:
> >
> > > QEMU does not compile when enabling clang's thread safety analysis
> > > (TSA),
> > > because some functions create wrappers for pthread mutexes but do
> > > not use any TSA macro. Therefore the compiler fails.
> > >
> > > In order to make the compiler happy and avoid adding all the
> > > necessary macros to all callers (lock functions should use
> > > TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of
> > > pthread_mutex_lock/pthread_mutex_unlock),
> > > simply use TSA_NO_TSA to supppress such warnings.
> >
> > I'm not sure I understand this quite right. Maybe a clarifying question
> > will help me understand: Why is this needed for bsd-user but not
> > linux-user? How are they different here?
>
> FreeBSD's pthread headers include TSA annotations for some functions
> that force us to do something about them (for now: suppress the warnings
> in their callers) before we can enable -Wthread-safety for the purposes
> where we really want it. Without this, calling functions like
> pthread_mutex_lock() would cause compiler errors.
>
> glibc's headers don't contain such annotations, so the same is not
> necessary on Linux
>

Thanks Kevin. With that explanation, these patches and their explanation
make perfect sense now. Often when there's a patch to bsd-user but not
linux-user, it's because bsd-user needs to do more in some way (which I try
to keep up on).

In this case, it's because FreeBSD's libc is a bit ahead of the curve. So I
understand why it's needed, and what I need to do next (though I think that
I may have to wait for the rest of qemu to be annotated)...

It might be better, though, to put some of this information in the commit
message so it isn't just on the mailing list. Just a suggestion:

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000431f0105f2786613
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 17, 2023 at 9:25 AM Kevin=
 Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 17.01.2023=
 um 17:16 hat Warner Losh geschrieben:<br>
&gt; On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito &lt;<br>
&gt; <a href=3D"mailto:eesposit@redhat.com" target=3D"_blank">eesposit@redh=
at.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; QEMU does not compile when enabling clang&#39;s thread safety ana=
lysis<br>
&gt; &gt; (TSA),<br>
&gt; &gt; because some functions create wrappers for pthread mutexes but do=
<br>
&gt; &gt; not use any TSA macro. Therefore the compiler fails.<br>
&gt; &gt;<br>
&gt; &gt; In order to make the compiler happy and avoid adding all the<br>
&gt; &gt; necessary macros to all callers (lock functions should use<br>
&gt; &gt; TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to alluse=
rs of<br>
&gt; &gt; pthread_mutex_lock/pthread_mutex_unlock),<br>
&gt; &gt; simply use TSA_NO_TSA to supppress such warnings.<br>
&gt; <br>
&gt; I&#39;m not sure I understand this quite right. Maybe a clarifying que=
stion<br>
&gt; will help me understand: Why is this needed for bsd-user but not<br>
&gt; linux-user? How are they different here?<br>
<br>
FreeBSD&#39;s pthread headers include TSA annotations for some functions<br=
>
that force us to do something about them (for now: suppress the warnings<br=
>
in their callers) before we can enable -Wthread-safety for the purposes<br>
where we really want it. Without this, calling functions like<br>
pthread_mutex_lock() would cause compiler errors.<br>
<br>
glibc&#39;s headers don&#39;t contain such annotations, so the same is not<=
br>
necessary on Linux<br></blockquote><div><br></div><div>Thanks Kevin. With t=
hat explanation, these patches and their explanation make perfect sense now=
. Often when there&#39;s a patch to bsd-user but not linux-user, it&#39;s b=
ecause bsd-user needs to do more in some way (which I try to keep up on).</=
div><div><br></div><div>In this case, it&#39;s because FreeBSD&#39;s libc i=
s a bit ahead of the curve. So I understand why it&#39;s needed, and what I=
 need to do next (though I think that I may have to wait for the rest of qe=
mu to be annotated)...</div><div><br></div><div>It might be better, though,=
 to put some of this information in the commit message so it isn&#39;t just=
 on the mailing list. Just a suggestion:</div><div><br></div><div>Reviewed-=
by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt=
;</div></div></div>

--000000000000431f0105f2786613--

