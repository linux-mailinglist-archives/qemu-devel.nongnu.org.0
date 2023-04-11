Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071F86DCFC7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 04:38:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm3t4-0003hU-BW; Mon, 10 Apr 2023 22:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pm3t2-0003gp-00
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 22:37:36 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pm3sz-0005vj-R8
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 22:37:35 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94a356c7419so161713266b.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 19:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681180652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/i35c6MSwopX4YelE+SWRpNAHs9WxWYNeFg6l00sizk=;
 b=EMB0bNkHrkeq/SXFsgr+NauicaBNrlYla+C6hK+fk4AVSw3kLRCkvHEROvqAX38oUS
 ONI4RMD5An+pyGOIOeAQ6AUwZTdG9x24iDY1TSsFHoivUqucnWarx/ApSdh+DmiJ1af7
 /e8jUBrmyWjLcX0U14Z3d11yCyJkdHsyWBLVs0SU5WrMyzXnVFIu8xx+qKu/sCFGwWlD
 l8IwL86gx+AdGgPIHmVo2VRXn5L6RDqWQsaPGBQH/T99kOOkiz1SPgnRgNxqMgI/uFt0
 qxVKX370g2rD72OjFku3abGYSCmxhywQLrJyRMQOvoD4AqnE51QOj9eM9Qh+tdUmgCYT
 p7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681180652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/i35c6MSwopX4YelE+SWRpNAHs9WxWYNeFg6l00sizk=;
 b=33V6sn1cktEvZ6QS6TfNjCJO4iECGOU/z/TAbwdApPZXgzqq1y/IylkFsGDUbO855y
 i2qX4yIX/KHtBnxOZyDIwwrUY0NNGxoX5TP+6U1p/pNZCyYTxlVs0lXZbTW03z2Nt9cw
 q8y8e9L2revskNpR6lhqFcX6weQ+K78QLGToGMihV0xGxP/znJeLcWJ85+cqwv4vn1uo
 sZYWmbhv56WeIMgU3G5RNPxJ/aUTT3wMwa0UMJ2SAStGs5n4TN9nBsBY9TwYR5t49500
 iacS0ji5lYpctXBx+ByKBitWHFL9MXzOGaPVQeyMuX2EiVbL67rqgfmX6e6r/gcsrBsy
 2Hvg==
X-Gm-Message-State: AAQBX9cOkDvxU/oCxH3is1h3tO5P2HLAoqCGwPlqxI0exIqGjNaR1zI2
 IxfQloxHsfXZY9LV7jf8t8ePieYnFsnsq6PcNZ6LUg==
X-Google-Smtp-Source: AKy350Ya/g9pDq+PstZ7qd2YWV9yYDGEkRpbiGHC8eXJF5CQ9T/Viu2JviP1lTCnSIc9uUZVT2pBJwjFKPxAxWsd3QM=
X-Received: by 2002:a50:8e0d:0:b0:504:7857:d739 with SMTP id
 13-20020a508e0d000000b005047857d739mr4227304edw.7.1681180651909; Mon, 10 Apr
 2023 19:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230410182056.320-1-imp@bsdimp.com>
 <20230410182056.320-19-imp@bsdimp.com>
 <29131a8f-f7e1-ece1-4dbb-f07d07b4f8c3@linaro.org>
In-Reply-To: <29131a8f-f7e1-ece1-4dbb-f07d07b4f8c3@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 10 Apr 2023 20:37:21 -0600
Message-ID: <CANCZdfrQ-SV0+ft5DXtvkhbRqbS62u=4bYwOuQxeu4fABYJtZw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] bsd-user: Update system call list
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, jrtc27@jrtc27.com, riastradh@netbsd.org, 
 Kyle Evans <kevans@freebsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, reinoud@netbsd.org
Content-Type: multipart/alternative; boundary="0000000000008f863205f9065f5e"
Received-SPF: none client-ip=2a00:1450:4864:20::62b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62b.google.com
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

--0000000000008f863205f9065f5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 7:37=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/10/23 11:20, Warner Losh wrote:
> > Update the system call list. We have one hokey thing in here for swapof=
f
> > that depends on the version number (so this is not completely generated
> > at the moment). For this, we need to include sys/param.h. The method of
> > generation has changed, so this diff looks way bigger than it needs to
> > be to add the few lines of code for the new system calls.
> >
> > Signed-off-by: Warner Losh<imp@bsdimp.com>
> > ---
> >   bsd-user/freebsd/os-syscall.h |    2 +
> >   bsd-user/freebsd/syscall_nr.h | 1035 +++++++++++++++++---------------=
-
> >   2 files changed, 529 insertions(+), 508 deletions(-)
>
> What is the method of generation?
>
> If it's complicated, it should be in scripts/.
> If it's trivial, e.g.
>
>      sed 's/xxx/yyy/' < in.h > out.h
>
> it is worth including the command in the commit message.
>

I'll add it to the commit message... but I'm also contemplating generating
it
on the fly if it's not too hard... Thanks for the suggestion... It's
usually a sed,
but someone (likely me) edited it directly for an unwise hack that Ineed to
unwind first...


> Anyway,
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>

Warner

--0000000000008f863205f9065f5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 10, 2023 at 7:37=E2=80=AF=
PM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ri=
chard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 4/10/23 11:20, Warner Losh wrote:<br>
&gt; Update the system call list. We have one hokey thing in here for swapo=
ff<br>
&gt; that depends on the version number (so this is not completely generate=
d<br>
&gt; at the moment). For this, we need to include sys/param.h. The method o=
f<br>
&gt; generation has changed, so this diff looks way bigger than it needs to=
<br>
&gt; be to add the few lines of code for the new system calls.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh&lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-syscall.h |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/syscall_nr.h | 1035 +++++++++++++++++----=
------------<br>
&gt;=C2=A0 =C2=A02 files changed, 529 insertions(+), 508 deletions(-)<br>
<br>
What is the method of generation?<br>
<br>
If it&#39;s complicated, it should be in scripts/.<br>
If it&#39;s trivial, e.g.<br>
<br>
=C2=A0 =C2=A0 =C2=A0sed &#39;s/xxx/yyy/&#39; &lt; in.h &gt; out.h<br>
<br>
it is worth including the command in the commit message.<br></blockquote><d=
iv><br></div><div>I&#39;ll add it to the commit message... but I&#39;m also=
 contemplating generating it</div><div>on the fly if it&#39;s not too hard.=
.. Thanks for the suggestion... It&#39;s usually a sed,</div><div>but someo=
ne (likely me) edited it directly for an unwise hack that Ineed to</div><di=
v>unwind first... <br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Anyway,<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockquote=
><div><br></div><div>Warner <br></div></div></div>

--0000000000008f863205f9065f5e--

