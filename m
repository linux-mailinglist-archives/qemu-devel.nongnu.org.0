Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651EC36B588
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:15:21 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb2xE-0000zM-2V
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lb2tD-0007PE-B3
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:11:11 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lb2t5-0002Ai-Ol
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:11:11 -0400
Received: by mail-qt1-x831.google.com with SMTP id f12so41796881qtf.2
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=27uosJosoTsOi571y7gT+wTB6P1bDFq68wl129LQCZs=;
 b=Rcb9lDSEt74Bp2rYF0XF9IBHUaopneExRXV9oqwzw46fE5vYYA3kMJynXQkhrR5D01
 p0JE0UqapJpi1puWfIxSMb5nAj7zu/nki/AT5q5j6nSAiYTtA+cNl3+UJCAXCzOv/nXB
 uukLYSrrq7+umKo6e8Re4N0SLZ+fnRl6XFJlr0VveJSF1rDXj8RY5gBgjt6o0s/7FRLB
 6/VHqFzxJG+nCsNc0lmP1nFO1It6wtyjf5L4ao0RIrcx/sw/ncu4mC0VikfuWbMogWoa
 PL5uXGHL6tMzaf7lXtusqVQpThK48Zy+qACfb+HhpWMtbMZJVvHxCaihjmD+nMfQbi0w
 grTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=27uosJosoTsOi571y7gT+wTB6P1bDFq68wl129LQCZs=;
 b=pSoqg+gVvGGc+ixvcxrAQs5MvjAp37glklJ2MkxBVAeCNLKQmXQUJXMW5Xe/Hu3a9E
 N3HqUTIrofMMUOpLXKTgETg7EVlkNGflbjymWHFD8NKhndACyBGN6UblRZU6yT4Jn8V/
 CR9sLYW7G1BYyvs2b9rO/B5/k/PBhtZ+zXx3PChQM7+l+Rndp8TegPHTnAINVwG9n9hZ
 6p9Beu7qP+6TARASPuBBVIaVbYMBfZNNEbQ7DsMDXrDi1rX7zQjQ4B6EIYhTe/+5YjKj
 sc/GbR7QCBOLkHLmKtSYo0qNcfaQxJ8ivf7jsHbOQkOyhtQ8tgon/Nmbv2xEJ19uj83m
 vQyQ==
X-Gm-Message-State: AOAM5313ILoV2BX3NZVKhvkCj6GTj6Z14tsbxCUop/EWgw0bMA6lh22K
 bwHK+dgAs4SWwNhepspbnqluZ6DA1Cph1f9B62etuQ==
X-Google-Smtp-Source: ABdhPJziVxcUCnuXAT9YDI5t08RB5bSLE16VU37sYAVyP0tqB4j+YoExq1XwSOoEm0h6JB2UZ0RvORKIww4ZH3gXwms=
X-Received: by 2002:a05:622a:1748:: with SMTP id
 l8mr17260310qtk.73.1619449858661; 
 Mon, 26 Apr 2021 08:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-6-imp@bsdimp.com>
 <YIaAVTahNvQ0+hKc@redhat.com>
 <CAFEAcA86i35cyoXkMp-PtWwOm+ELOR2zvS0Ze_duO6DkWu-q+Q@mail.gmail.com>
In-Reply-To: <CAFEAcA86i35cyoXkMp-PtWwOm+ELOR2zvS0Ze_duO6DkWu-q+Q@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 26 Apr 2021 09:10:47 -0600
Message-ID: <CANCZdfrzjksSsW6WQXS_5bVt7S+07a3zegKth=e4_Q87Ap+MTw@mail.gmail.com>
Subject: Re: [PULL 15/24] bsd-user: Fix commentary issues
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008eb3c205c0e18d46"
Received-SPF: none client-ip=2607:f8b0:4864:20::831;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x831.google.com
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
Cc: Alex Richardson <arichardson@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008eb3c205c0e18d46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 3:13 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 26 Apr 2021 at 10:01, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
> >
> > On Fri, Apr 23, 2021 at 02:39:50PM -0600, imp@bsdimp.com wrote:
> > > -#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080  /* previously
> misimplemented MAP_INHERIT */
> > > -#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100  /* previously
> unimplemented MAP_NOEXTEND */
> > > -#define TARGET_FREEBSD_MAP_STACK        0x0400  /* region grows down=
,
> like a stack */
> > > -#define TARGET_FREEBSD_MAP_NOSYNC       0x0800  /* page to but do no=
t
> sync underlying file */
> > > +#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080
> > > +                                 /* previously misimplemented
> MAP_INHERIT */
> > > +#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100
> > > +                                 /* previously unimplemented
> MAP_NOEXTEND */
> > > +#define TARGET_FREEBSD_MAP_STACK        0x0400
> > > +                                 /* region grows down, like a stack =
*/
> > > +#define TARGET_FREEBSD_MAP_NOSYNC       0x0800
> > > +                                 /* page to but do not sync
> underlying file */
> >
> > I find this indented following comment style more ambiguous as to
> > what constant the comment applies to. IMHO would be clearer as
> >
> >  /* previously misimplemented MAP_INHERIT */
> >  #define TARGET_FREEBSD_MAP_RESERVED0080 0x0080
> >
> >  /* previously unimplemented MAP_NOEXTEND */
> >  #define TARGET_FREEBSD_MAP_RESERVED0100 0x0100
> >
> >  /* region grows down, like a stack */
> >  #define TARGET_FREEBSD_MAP_STACK        0x0400
> >
> >  /* page to but do not sync underlying file */
> >  #define TARGET_FREEBSD_MAP_NOSYNC       0x0800
>
> Or alternatively decide that this is one of those cases where the coding
> style's "If wrapping the line at 80 columns is obviously less readable an=
d
> more awkward, prefer not to wrap it" advice applies. The lines as they
> stand
> are only 95 characters or so long.
>

I'm cool either way. Projects differ about how rigid or flexible style can
be.
I noticed this when cleaning up another thing. If we can apply that advice,
I'd prefer that.

Maybe it's better to just drop this entirely. In the final state, this file
is
here, but none of these flags are actually used. Not sure why they aren't,
but there's commentary that's explicit about using the host constants
in many places. Rather than take the time to sort this all out right now
(it is a minor detail I think in the scheme of things compared to all the
other changes coming), I'd propose dropping this hunk entirely, and
revisiting when the merging is done...

Warner

--0000000000008eb3c205c0e18d46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 26, 2021 at 3:13 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, 26 Apr 2021 at 10:01, Daniel P. Berrang=C3=A9 &lt;<a href=3D"=
mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; On Fri, Apr 23, 2021 at 02:39:50PM -0600, <a href=3D"mailto:imp@bsdimp=
.com" target=3D"_blank">imp@bsdimp.com</a> wrote:<br>
&gt; &gt; -#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080=C2=A0 /* previous=
ly misimplemented MAP_INHERIT */<br>
&gt; &gt; -#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100=C2=A0 /* previous=
ly unimplemented MAP_NOEXTEND */<br>
&gt; &gt; -#define TARGET_FREEBSD_MAP_STACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04=
00=C2=A0 /* region grows down, like a stack */<br>
&gt; &gt; -#define TARGET_FREEBSD_MAP_NOSYNC=C2=A0 =C2=A0 =C2=A0 =C2=A00x08=
00=C2=A0 /* page to but do not sync underlying file */<br>
&gt; &gt; +#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* previously misimp=
lemented MAP_INHERIT */<br>
&gt; &gt; +#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* previously unimpl=
emented MAP_NOEXTEND */<br>
&gt; &gt; +#define TARGET_FREEBSD_MAP_STACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04=
00<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* region grows down=
, like a stack */<br>
&gt; &gt; +#define TARGET_FREEBSD_MAP_NOSYNC=C2=A0 =C2=A0 =C2=A0 =C2=A00x08=
00<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* page to but do no=
t sync underlying file */<br>
&gt;<br>
&gt; I find this indented following comment style more ambiguous as to<br>
&gt; what constant the comment applies to. IMHO would be clearer as<br>
&gt;<br>
&gt;=C2=A0 /* previously misimplemented MAP_INHERIT */<br>
&gt;=C2=A0 #define TARGET_FREEBSD_MAP_RESERVED0080 0x0080<br>
&gt;<br>
&gt;=C2=A0 /* previously unimplemented MAP_NOEXTEND */<br>
&gt;=C2=A0 #define TARGET_FREEBSD_MAP_RESERVED0100 0x0100<br>
&gt;<br>
&gt;=C2=A0 /* region grows down, like a stack */<br>
&gt;=C2=A0 #define TARGET_FREEBSD_MAP_STACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04=
00<br>
&gt;<br>
&gt;=C2=A0 /* page to but do not sync underlying file */<br>
&gt;=C2=A0 #define TARGET_FREEBSD_MAP_NOSYNC=C2=A0 =C2=A0 =C2=A0 =C2=A00x08=
00<br>
<br>
Or alternatively decide that this is one of those cases where the coding<br=
>
style&#39;s &quot;If wrapping the line at 80 columns is obviously less read=
able and<br>
more awkward, prefer not to wrap it&quot; advice applies. The lines as they=
 stand<br>
are only 95 characters or so long.<br></blockquote><div><br></div><div>I&#3=
9;m cool either way. Projects differ about how rigid or flexible style can =
be.</div><div>I noticed this when cleaning up another thing. If we can appl=
y that advice,</div><div>I&#39;d prefer that.</div><div><br></div><div>Mayb=
e it&#39;s better to just drop this entirely. In the final state, this file=
 is</div><div>here, but none of these flags are actually used. Not sure why=
 they aren&#39;t,</div><div>but there&#39;s commentary=C2=A0that&#39;s expl=
icit about using the host constants</div><div>in many places. Rather than t=
ake the time to sort this all out right now</div><div>(it is a minor detail=
 I think in the scheme of things compared to all the</div><div>other change=
s coming), I&#39;d propose dropping this hunk entirely, and</div><div>revis=
iting when the merging is done...</div><div><br></div><div>Warner</div><div=
><br></div></div></div>

--0000000000008eb3c205c0e18d46--

