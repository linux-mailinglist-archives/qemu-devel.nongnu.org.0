Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89F380B87
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:17:28 +0200 (CEST)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYd3-0002vf-T2
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lhYbd-0002B4-II
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:15:57 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lhYbb-0004bK-1K
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:15:57 -0400
Received: by mail-qt1-x829.google.com with SMTP id g13so22283160qts.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4v9XCW24o810lmizJP07sZ6Z7cViJoJm+q/eGjTNqs=;
 b=OdqhCZcxsupW04Yj05sRL496nzKBYjA7lMuurXZkPnDtt4gTz3fVjSeMMpid7Sy4TB
 nmpqi4mTVglmMq0EjxHCjPXoqaciH0/13ZSbKjzajQT4XIgW+vvpNEyNy2ABjbh8S4D/
 FBavmLamVrYDTslDcPuqO+gAW/t9nypRFfvrHU6t0/DkZfHioMDtg0jZIFs1daqnSYwL
 nRIdR9vkNd3OpeSTP0qFpLBDj8IXtrsHUHEZlR5pnKuaWbxra1yQrZkp/FQqEi2zeOOp
 I2flr7kjtpuX+9251EoEcaEZs/AH/YKJDa4xXX4qoVV2B7h8SUbTU/OQUIGZl2MBzJZw
 AroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4v9XCW24o810lmizJP07sZ6Z7cViJoJm+q/eGjTNqs=;
 b=Btjt2Ogjr8LV4qd+jSeKn4l9zQzJoUEINLOFsbyZcwFx1ROcj88acKJbozewcJuI1q
 iDR+UjgIZ6Lz14mUiGm9w08VzJPk4SJNS6ihYUq3wIbuYnA0LZV9wQe5I6fq9LsSvsvV
 ucGkBpMADunrnMkzA5J8G9IgOfcjMpYVU/Fku/g6W3ezjP0lP2TEIHk/m9nw29775cy5
 +e8nX+1mvwxqtWCH+3whWvwJa8mN9KPeS6KdGPFLvyCEB+bH47umXIFtkjNbPN7I2xNn
 eq0/kZGkAftdq5/hXYn05ZYbPXTDCEw9Oy9dGcUgrXqPzXGIy62f0Kl/1Ay8p6I66qbT
 F0MQ==
X-Gm-Message-State: AOAM533LWoyxVADloyXdrTLpSpvV8rePqEyiRP4Hjm7PXmuNCWsnIM8f
 xeDSwPRDLrt0kBya5AB6b65ZQoE9gHXZ1xrm1G8kCA==
X-Google-Smtp-Source: ABdhPJwOarypKG2XwxheDAyFlixQhRtiaUOvwkQSHkurZu7qVXaKmjCIa7timAE3Iv74mIvUUDbIu3DElDthTYdjwSo=
X-Received: by 2002:ac8:6d08:: with SMTP id o8mr43845220qtt.73.1621001753057; 
 Fri, 14 May 2021 07:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210506173826.72832-1-imp@bsdimp.com>
 <f8db526d-cb19-c633-1327-2282333c7fe3@linaro.org>
 <CANCZdfo3RwMYtHvH4c03Gj0+YL-QHi_Bpu5SRMB6SWrMHiQiwQ@mail.gmail.com>
 <d2850457-b564-2f83-9656-76a3667cf619@linaro.org>
In-Reply-To: <d2850457-b564-2f83-9656-76a3667cf619@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 14 May 2021 08:15:40 -0600
Message-ID: <CANCZdfoLMx5GgU0EhFg7Wks5YufYRR24wqPNZDf3Ts6VpgxFLw@mail.gmail.com>
Subject: Re: [PATCH v2] tcg: Use correct trap number for page faults on *BSD
 systems
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000abf3a005c24ae18e"
Received-SPF: none client-ip=2607:f8b0:4864:20::829;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x829.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>, Mark Johnston <markj@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000abf3a005c24ae18e
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 6:23 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 5/6/21 12:53 PM, Warner Losh wrote:
> >
> >
> > On Thu, May 6, 2021 at 11:51 AM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     On 5/6/21 10:38 AM, Warner Losh wrote:
> >      > The trap number for a page fault on BSD systems is T_PAGEFLT not
> 0xe. 0xe is
> >      > used by Linux and represents the intel hardware trap vector. The
> BSD
> >     kernels,
> >      > however, translate this to T_PAGEFLT in their Xpage, Xtrap0e,
> Xtrap14,
> >     etc fault
> >      > handlers. This is true for i386 and x86_64, though the name of
> the trap
> >     hanlder
> >      > can very on the flavor of BSD. As far as I can tell, Linux
> doesn't provide a
> >      > define for this value. Invent a new one (PAGE_FAULT_TRAP) and use
> it
> >     instead to
> >      > avoid uglier ifdefs.
> >      >
> >      > Signed-off-by: Mark Johnston<markj@FreeBSD.org>
> >      > Signed-off-by: Juergen Lock<nox@FreeBSD.org>
> >      > [ Rework to avoid ifdefs and expand it to i386 ]
> >      > Signed-off-by: Warner Losh<imp@bsdimp.com <mailto:imp@bsdimp.com
> >>
> >      > ---
> >      >   accel/tcg/user-exec.c | 14 ++++++++++++--
> >      >   1 file changed, 12 insertions(+), 2 deletions(-)
> >
> >     Queued to tcg-next, thanks.
> >
> >     Looks like this area could use a bit of cleanup...
> >
> >
> > No arguments from me there... Thanks!
>
> Dequeueing.
>
> This doesn't work on our "make vm-build-{freebsd,openbsd} images, as Peter
> helpfully pointed out after I sent the pull request.  I don't know enough
> about
> any of the BSDs to know what's expected.
>

OK. I'll take a closer look. It's survived the make vm-build-freebsd in the
past, so
I'm a little surprised at this...

Warner

--000000000000abf3a005c24ae18e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 14, 2021 at 6:23 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 5/6/21 12:53 PM, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, May 6, 2021 at 11:51 AM Richard Henderson &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.=
org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 5/6/21 10:38 AM, Warner Losh wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The trap number for a page fault on BSD syste=
ms is T_PAGEFLT not 0xe. 0xe is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; used by Linux and represents the intel hardwa=
re trap vector. The BSD<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernels,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; however, translate this to T_PAGEFLT in their=
 Xpage, Xtrap0e, Xtrap14,<br>
&gt;=C2=A0 =C2=A0 =C2=A0etc fault<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; handlers. This is true for i386 and x86_64, t=
hough the name of the trap<br>
&gt;=C2=A0 =C2=A0 =C2=A0hanlder<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; can very on the flavor of BSD. As far as I ca=
n tell, Linux doesn&#39;t provide a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; define for this value. Invent a new one (PAGE=
_FAULT_TRAP) and use it<br>
&gt;=C2=A0 =C2=A0 =C2=A0instead to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; avoid uglier ifdefs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Mark Johnston&lt;markj@FreeBSD=
.org&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Juergen Lock&lt;nox@FreeBSD.or=
g&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [ Rework to avoid ifdefs and expand it to i38=
6 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Warner Losh&lt;<a href=3D"mail=
to:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a href=
=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0accel/tcg/user-exec.c | 14 ++++++=
++++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 12 insertions(+),=
 2 deletions(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Queued to tcg-next, thanks.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Looks like this area could use a bit of cleanup...<=
br>
&gt; <br>
&gt; <br>
&gt; No arguments from me there... Thanks!<br>
<br>
Dequeueing.<br>
<br>
This doesn&#39;t work on our &quot;make vm-build-{freebsd,openbsd} images, =
as Peter <br>
helpfully pointed out after I sent the pull request.=C2=A0 I don&#39;t know=
 enough about <br>
any of the BSDs to know what&#39;s expected.<br></blockquote><div><br></div=
><div>OK. I&#39;ll take a closer look. It&#39;s survived the make vm-build-=
freebsd in the past, so</div><div>I&#39;m a little surprised at this...</di=
v><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000abf3a005c24ae18e--

