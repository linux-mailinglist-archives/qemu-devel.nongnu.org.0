Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1306A31FED0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:33:08 +0100 (CET)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDAaQ-0006Wg-Nw
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lDAWP-00059I-Kw
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:28:57 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:41507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lDAWM-0002v3-SD
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:28:57 -0500
Received: by mail-qv1-xf31.google.com with SMTP id t18so3041824qvn.8
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 10:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ldfite04+u58DKYJCbh4oXayneKm6/XuTukDzRmic3s=;
 b=uLaWWO2/UiEAETjVqKoIwVcS8JqFg1sfqUzXku7H5hxvYnRuUB2Cda4MibNgrQc07u
 s6eiLPCANlaxnpn65btsij5fxQjFrRXDUyO2mqBKnG4GKRIUkXPP0f9f4a1Yc6uwG/3X
 OVKIUBX/buYoSSfDc2/IEHOocw1MZEc/UswCueCzulWrkVUo9q6k+9lPbQjQeiW+/Woq
 FZO4cbFvE0QV0XBtFXCgwBs9FX/ZzLjvG25VkRdixpil2VA0AncuZSMTNgvWiHmr3GOU
 5+Ycrs6Ul4n5iI9nZfGdZfxjQvy3hrkkVCswZL7wJfHfed8/hJ3GcyHWeXOI/YaiLHW0
 fSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ldfite04+u58DKYJCbh4oXayneKm6/XuTukDzRmic3s=;
 b=uJfQUM/+beSFUF/i6rHxTvfaKTMHs2hMlX2TSYCj6etjyAt7uPA/KC6U0pcvbO4S0z
 dB8g8P7Z9OrIB6AKNcqHsnbh7RF6O1cvDwts9E+vm8BJ3Wr6SKaEgr5weGsmHYvwJIFK
 i7a5pp6GTGMPH4+xEfa/poThRbD1tJ7Q7neaymYZdU/q5sgntkSf6PCI84Prgt8mSWBz
 PhRK9vEPdgnXhWqW/BM7783T+BTEZqPVrgIe5WtEL4IuPTlyHEPYxpJfCHMZLxi6/9/s
 iqlJ3bTW105N8Q2BWfYD4K4k7aqB9xdB/KtyZs4mUv1IrdQTQeRp+ZFMwHuTvZz2FkPJ
 eXIg==
X-Gm-Message-State: AOAM530KQduoMdqFs0qR5D7s08DvgIZMI0Omv2K6NvOlxdXmGDAZRxYd
 gh3lwK+ptVV9FT8+FCDDqzZUxEHpFSpltwTP2jbjIA==
X-Google-Smtp-Source: ABdhPJyphfWMPdhdRiwpKMFj6zj8o9NlDaRXzv00KtsDLTWWAekDjFZGwTpFRZd7rdv5E0aoS/vABP69KefeZ0jlq98=
X-Received: by 2002:a05:6214:174d:: with SMTP id
 dc13mr2682448qvb.62.1613759333643; 
 Fri, 19 Feb 2021 10:28:53 -0800 (PST)
MIME-Version: 1.0
References: <8735xss5q3.fsf@linaro.org>
 <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
 <20210219152408.34ibwagyqzgye4yd@sirius.home.kraxel.org>
 <CANCZdfqx+kCTkkw3jbDUwJB77DH0Qm3q8BpOY6-YJzKdY1eJeQ@mail.gmail.com>
 <CAFEAcA9hW-hvjrS+tFt9KAkvVH+cCS_4JkMx+TUNEy5uFU-qaw@mail.gmail.com>
In-Reply-To: <CAFEAcA9hW-hvjrS+tFt9KAkvVH+cCS_4JkMx+TUNEy5uFU-qaw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 19 Feb 2021 11:28:42 -0700
Message-ID: <CANCZdfpcDhWt0fh3kvM_+RfEaggkeWFTKJLy0CSofstFjOQkbg@mail.gmail.com>
Subject: Re: FreeBSD build regressions
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d5cd0005bbb49f4b"
Received-SPF: none client-ip=2607:f8b0:4864:20::f31;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf31.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <gerd@kraxel.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d5cd0005bbb49f4b
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 19, 2021 at 9:14 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 19 Feb 2021 at 16:08, Warner Losh <imp@bsdimp.com> wrote:
> > FreeBSD builds packages on the oldest supported version in the stable
> branch. Due to forward compatibility, that means all supported versions of
> FreeBSD 12.x will work. Recently, FreeBSD 12.1 became unsupported, so the
> build machines clicked forward to 12.2. Since there's no 'forward
> compatibility' guarantees, this problem was hit. While you can run binaries
> compiled on old versions of the software on new versions of the system, you
> can't necessarily do the inverse because new symbols are introduced (in
> this case close_range).
>
> It makes perfect sense that you don't want to support older
> versions forever and that at some point newer packages aren't
> valid on old systems, but I don't understand why an
> older 12.1 system then says "but I'm going to go ahead and
> install these won't-work packages anyway" rather than
> "oh dear, I'm out of support, there are no newer packages
> available, I will install whatever the last archived version
> of the package for my OS version is" (or "I will install nothing").
> I'm surprised this doesn't break a lot of real-world users...
>

That's a reasonable expectation. I'd kinda expected that to be the default,
but it looks like it might not be. I'll see if I can get the freebsd vm
updated to use something safer and/or work with the pkg folks to get it to
do the safe thing here if there's no easy way to do this with command line
/ config settings. I think the issue is that we set IGNORE_OSVERSION which
is needed for the case when we were running 12.0 packages on 12.1, but it's
harmful for this case. This highlights, I think, a rough edge in pkg.

Short term, I'll bump things up to 12.2 which will take care of the
immediate issue. I should have a patch by later in the day.... I may also
have a patch to detect the mismatch directly and report it until this issue
can be resolved in FreeBSD's pkg.

Warner

--000000000000d5cd0005bbb49f4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 9:14 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, 19 Feb 2021 at 16:08, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; FreeBSD builds packages on the oldest supported version in the stable =
branch. Due to forward compatibility, that means all supported versions of =
FreeBSD 12.x will work. Recently, FreeBSD 12.1 became unsupported, so the b=
uild machines clicked forward to 12.2. Since there&#39;s no &#39;forward co=
mpatibility&#39; guarantees, this problem was hit. While you can run binari=
es compiled on old versions of the software on new versions of the system, =
you can&#39;t necessarily do the inverse because new symbols are introduced=
 (in this case close_range).<br>
<br>
It makes perfect sense that you don&#39;t want to support older<br>
versions forever and that at some point newer packages aren&#39;t<br>
valid on old systems, but I don&#39;t understand why an<br>
older 12.1 system then says &quot;but I&#39;m going to go ahead and<br>
install these won&#39;t-work packages anyway&quot; rather than<br>
&quot;oh dear, I&#39;m out of support, there are no newer packages<br>
available, I will install whatever the last archived version<br>
of the package for my OS version is&quot; (or &quot;I will install nothing&=
quot;).<br>
I&#39;m surprised this doesn&#39;t break a lot of real-world users...<br></=
blockquote><div><br></div><div>That&#39;s a reasonable expectation. I&#39;d=
 kinda expected that to be the default, but it looks like it might not be. =
I&#39;ll see if I can get the freebsd vm updated to use something safer and=
/or work with the pkg folks to get it to do the safe thing here if there&#3=
9;s no easy way to do this with command line / config settings. I think the=
 issue is that we set IGNORE_OSVERSION which is needed for the case when we=
 were running 12.0 packages on 12.1, but it&#39;s harmful for this case. Th=
is highlights, I think, a rough edge in pkg.</div><div><br></div><div>Short=
 term, I&#39;ll bump things up to 12.2 which will take care of the immediat=
e issue. I should have a patch by later in the day.... I may also have a pa=
tch to detect the mismatch directly and report it until this issue can be r=
esolved in FreeBSD&#39;s pkg.</div><div><br></div><div>Warner</div></div></=
div>

--000000000000d5cd0005bbb49f4b--

