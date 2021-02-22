Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505CD321B51
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:24:56 +0100 (CET)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lED4x-00067s-4N
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lECtR-0001Qv-7o
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:13:01 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lECtM-0000uU-NV
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:13:00 -0500
Received: by mail-qk1-x72d.google.com with SMTP id q85so12826931qke.8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 07:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tVDNS81LfFfcaq6f1jauFh4EhXfJMVZyKinQpeemO9A=;
 b=odprYQtuaktdKe5us7BxT4fUlaHeKzI9o0AVuasgYBnKHCdPTOfx9OSsdeY/g4r193
 09TLysKEA1MF61kQFukD67rTT2PZQ25UnzChv3fp7buJ1FmCF4wQUosCWTGpBHCZocKY
 fMj84N2h7v8snjfyG24nv5OCbCjdgiiHLKwazIZvb4IzMhCKfrrAFZ7sStEH4XQ6Bu7W
 K7fvhyYFAnGVDX6cQ96wWzEAMFkivOovRJfY2DTIFf8/LbkvJtsexM+wW/LsxoMeM7fb
 oayRP8T+cBvoUYxrNGspALcc7C86z0x5y8K8VgXuMOD2G4C24/qG2l1MX3V/2mHig5PH
 GCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tVDNS81LfFfcaq6f1jauFh4EhXfJMVZyKinQpeemO9A=;
 b=QFe+udL1Bpt4xbb46mF+un13K9BgAvL2rJhJ2oRVvBfPKdSrV0G88u1cpyL+fWym9z
 tbgbNjfGwlUNQvONgEw4v1TPpB7+P6LpShFG0HOnyzdA47KivDoWeqFdVIHXn8zdRki2
 bwYEG/vzzzVw5RiRH3affHOvaW8FdntQPBTF0c6mW/QREpctQ6E1Eq2zsagmMB3y7a+f
 dwk/pvE58DVuY1qRBUoY6qPs5b8O+RsHVOr2lhgC5vDYFovFEZR9oc34pJ2WL0R0A1dJ
 F2WV7qkMZA0wtihS5l68O/2HfgbEKSr4MduG382p4WNOclhGCCHSjkdo0bO+hCyOab0E
 iPqQ==
X-Gm-Message-State: AOAM531KbuQhlAeFmuhmux/3kFTVbGvDWwDYhbygUV+ild7KRqDeD2qe
 5lf6AGlopMDHIpURfzyPiFnQO5MyFGm6VkQS+SwHIQ==
X-Google-Smtp-Source: ABdhPJyaK+MTM7WxdrJ043mtnecNMUl1RIF2o1BN9qaMB6U0ZfGP8ePAaAx/9xMoXkUCnClJiXY+wF3UvS11PEJHVJg=
X-Received: by 2002:a05:620a:12d1:: with SMTP id
 e17mr21099079qkl.89.1614006772553; 
 Mon, 22 Feb 2021 07:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20210219212352.74172-1-imp@freefall.freebsd.org>
 <20210222132131.cnxc7a3c6fkbmkvj@sirius.home.kraxel.org>
In-Reply-To: <20210222132131.cnxc7a3c6fkbmkvj@sirius.home.kraxel.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 22 Feb 2021 08:12:41 -0700
Message-ID: <CANCZdfrhXf4j5vZw+bMdwVShVcYZocNcXYkJqNeKjGB2j8rtpA@mail.gmail.com>
Subject: Re: [PATCH] FreeBSD: Upgrade to 12.2 release
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000057ef9005bbee3cd9"
Received-SPF: none client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72d.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 Warner Losh <imp@freefall.freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057ef9005bbee3cd9
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 22, 2021 at 6:21 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Fri, Feb 19, 2021 at 02:23:52PM -0700, Warner Losh wrote:
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
> > project's packages will work.
>
> Not working.  There is a little change in the time zone selection
> dialog and we need adjust the install script ...
>
> -        self.console_wait_send("Time Zone Selector",    "a\n")
> +        self.console_wait_send("Time Zone Selector",    "0\n")
>
> Try "make vm-build-freebsd" to test changes, add "V=1" for
> trouble-shooting.
>

Thanks! I'll have to start doing that...


> With that change it seems to work fine (my test install is still busy
> fetching packages over my slow internet link ...).
>

I'll rebase and try it here...

Warner

--00000000000057ef9005bbee3cd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 22, 2021 at 6:21 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, =
Feb 19, 2021 at 02:23:52PM -0700, Warner Losh wrote:<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD=
&#39;s<br>
&gt; project&#39;s packages will work.<br>
<br>
Not working.=C2=A0 There is a little change in the time zone selection<br>
dialog and we need adjust the install script ...<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Time Zone Selecto=
r&quot;,=C2=A0 =C2=A0 &quot;a\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.console_wait_send(&quot;Time Zone Selecto=
r&quot;,=C2=A0 =C2=A0 &quot;0\n&quot;)<br>
<br>
Try &quot;make vm-build-freebsd&quot; to test changes, add &quot;V=3D1&quot=
; for<br>
trouble-shooting.<br></blockquote><div><br></div><div>Thanks! I&#39;ll have=
 to start doing that...</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
With that change it seems to work fine (my test install is still busy<br>
fetching packages over my slow internet link ...).<br></blockquote><div><br=
></div><div>I&#39;ll rebase and try it here...</div><div><br></div><div>War=
ner=C2=A0</div></div></div>

--00000000000057ef9005bbee3cd9--

