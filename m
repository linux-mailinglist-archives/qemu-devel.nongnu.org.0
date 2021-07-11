Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBD3C39A1
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 02:14:08 +0200 (CEST)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2N6k-0003UZ-VU
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 20:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2N5s-0002eu-EG
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 20:13:12 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:34670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2N5q-0003v6-JP
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 20:13:11 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id y38so21512985ybi.1
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 17:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lAVjCTcXGGyqlWMDJJBvCNObxTE2b/bU36QObMu58nA=;
 b=XLsK5gc5sPUS2nhv3NTQZOWU7Co2V09hsAYqRNOqpiNn26zAbeDGkAELsA3ZRssFaa
 8zPCnlK9DJEvNYr6zR1ND3ssWCUK3Bbr/PcZs3mSjJ02YmYeWdLfDWkdgn/ZvceSLa/l
 mn1V4yPj3wu+96amkWgLHTPTmiaZ/OXBWrgiYVMuML1nDeQA3U2l+Whh72G5tak0xUn6
 w09eA043kXyb3j+NjM1/8/AdgxaQU9jmvShp4JUQbIXUmlf7/HwL0l1+2d/RdkRej6ad
 Y26DGgjlDtITn5SvH1APeozlVHvZQGIddzQvK991nL7iUYwqeZtyGVutSzJ4+vwGqq5I
 wrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAVjCTcXGGyqlWMDJJBvCNObxTE2b/bU36QObMu58nA=;
 b=lPVtqpN9nPCdgBFQUPP1edH/N95DZ4iyW0rL1a4pgnloY2VyszvqRp18iHfPJ8pESH
 6Zx4EtZPA+kJec+e/SMVGmvgM3rUzo9Ba9ymHs0F3cv9ejHsL7xlk1XxVIOW98gfAvv0
 3isKTFDnk1JxQOllnPvUf6SXb7P/zsdh9NZHNL8gvSFds5RoKkLNgn+G5qTgKSO24B1o
 hHLHyHOt6daKgGHsz1RlGX4THYMsZEDb3irgzMKFQwSmJOUWLum6DeBYa+OgFitogwQv
 7TEbaQ4ohKNHxzcd/WyBA6nWv7ARqpPiDnP76kXEa8PebmALXZ3uaZQ6E2iLJ1bZCETH
 ye5w==
X-Gm-Message-State: AOAM5321ipdm4l8cXC6zLKF7wdDyN0wELXsh7nyXDgrnWdXFCXUuYJV1
 HLdiMDUSutUNJwAQtzjibtG0TBc90rUhEG5PYGPi4Q==
X-Google-Smtp-Source: ABdhPJzyU4Q3v1g3ozPAOgFABMUKqssny2qRjoGbnOeCjTYdWxlZHudzrhmlaB3X7236pFyZ/U9Uaas8EA1Ca87Zd4g=
X-Received: by 2002:a25:6dc5:: with SMTP id
 i188mr58977497ybc.420.1625962389059; 
 Sat, 10 Jul 2021 17:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
 <CAFEAcA_27xmAsRqTU6x6biqkPFZqHNT+LM2Q92HkSMW5OdFoJA@mail.gmail.com>
In-Reply-To: <CAFEAcA_27xmAsRqTU6x6biqkPFZqHNT+LM2Q92HkSMW5OdFoJA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Sat, 10 Jul 2021 17:12:56 -0700
Message-ID: <CAFXwXrnwtFiSy5nhwvbhoEdQjUYXcSc4LUEW-KSw5QPdV4kYXA@mail.gmail.com>
Subject: Re: [PATCH 00/41] tcg patch queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009e4fca05c6cdde1c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e4fca05c6cdde1c
Content-Type: text/plain; charset="UTF-8"

Oops, yes.

r~

On Sat, 10 Jul 2021, 09:24 Peter Maydell, <peter.maydell@linaro.org> wrote:

> On Sat, 10 Jul 2021 at 16:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > The following changes since commit
> 05de778b5b8ab0b402996769117b88c7ea5c7c61:
> >
> >   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into
> staging (2021-07-09 14:30:01 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210710
> >
> > for you to fetch changes up to ad1a706f386c2281adb0b09257d892735e405834:
> >
> >   cpu: Add breakpoint tracepoints (2021-07-09 21:31:11 -0700)
> >
> > ----------------------------------------------------------------
> > Add translator_use_goto_tb.
> > Cleanups in prep of breakpoint fixes.
> > Misc fixes.
> >
> > ----------------------------------------------------------------
>
> Is this intended as a pullreq despite the "PATCH" in the subject?
>
> thanks
> -- PMM
>

--0000000000009e4fca05c6cdde1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oops, yes.<br><br><div data-smartmail=3D"gmail_signature"=
>r~</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sat, 10 Jul 2021, 09:24 Peter Maydell, &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Sat, 10 Jul 2021 at 16:33, Richard Henderso=
n<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank" rel=
=3D"noreferrer">richard.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5=
c7c61:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/mst/tags/for_ups=
tream&#39; into staging (2021-07-09 14:30:01 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/rth7680/qemu.git" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://gitlab.com/rth7680/qemu.git</=
a> tags/pull-tcg-20210710<br>
&gt;<br>
&gt; for you to fetch changes up to ad1a706f386c2281adb0b09257d892735e40583=
4:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0cpu: Add breakpoint tracepoints (2021-07-09 21:31:11 -0700=
)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Add translator_use_goto_tb.<br>
&gt; Cleanups in prep of breakpoint fixes.<br>
&gt; Misc fixes.<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
<br>
Is this intended as a pullreq despite the &quot;PATCH&quot; in the subject?=
<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000009e4fca05c6cdde1c--

