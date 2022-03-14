Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176644D79D5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 05:11:44 +0100 (CET)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTc3a-0006fh-K6
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 00:11:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTc1G-0005Uf-Gd
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:09:18 -0400
Received: from [2607:f8b0:4864:20::e34] (port=39508
 helo=mail-vs1-xe34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nTc1E-0008CM-8m
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:09:18 -0400
Received: by mail-vs1-xe34.google.com with SMTP id g21so15701984vsp.6
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 21:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+33St0kmLtushbxf9/c6mrNidf0wifZ4wpPdFHAKae0=;
 b=NhWK2pj/pev22OHN6apybncXsyl/wA6kBVb6E5MxbGJrg973GViAtTmMdeiQ0ax+mB
 yqwHofKwH+VfpicObfaLHB8HIHHhcpc2lNFSi7VSQ6mAp0MJjFSOr+UbQjpODcROLcWC
 W0nA35apyD/ukeczx3POhQ+M9ILDj+zIwYvMwTAUXQCg5hMcnGmnv0wrRDX0pOQl/sKd
 c7OBRVDkYSN9KLTplSrbp/qnkH6rSQB0FmGNEFW1BLUcN+Bji+JCeGRMSCZCi8Gjc0aU
 0ZvyfIPVM6F7KIvS+DQPQfMS7q9w0NfXcAZFpljikWvVGUd0wNxbgdMxGWfWvLi8W40H
 LciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+33St0kmLtushbxf9/c6mrNidf0wifZ4wpPdFHAKae0=;
 b=0iloMzCnlxDbbOdh7SYiZwpkeR2lQ9a+pD/s6N6Q7x7/bTFBS2hK99LCqV4vbAhFhk
 8+kFIBi8HjaP3eLKKiHe2crTZg5VHdhinDSXbSBCCp2qMuYkt286LKqC0HDOMKT8CjT3
 NAqvZQ4X1gPo516gzI5dJAXJsPkt0M5F3iAx5zZaEEiS1HaRK1xRTmJrZSRuYzVjXQoi
 x+dC4Us6C4IH1JISRYEP5NM4QNXkNBnIk+dC4/zBm1ayxHHkw6erbRIx/3DUXbWjoMC6
 0OD5cdanzIxXYzOkTGXKxaYfK8oo6H+o9g1UvKEox9IWiDAR3l6lh6uBK3bWFZ0SJWsP
 /6Sg==
X-Gm-Message-State: AOAM531DYcyvodrzhBWgvRrOTPsOw7lb/LwXwf+AKMaybRDh2M2OzVwv
 wGOWR32zcwn4ZVF97LQySPOHmtcJhZ4MikjBB+oUIg==
X-Google-Smtp-Source: ABdhPJxV+1CaYbKII5hTErt3STXcIZfryuxza+Sf1qOElo/kM3lNRLMa/F8SQlVM3TlEETiOrrWnwzmf7Z2ktz2/uXU=
X-Received: by 2002:a05:6102:ed5:b0:322:ba55:d279 with SMTP id
 m21-20020a0561020ed500b00322ba55d279mr4805867vst.77.1647230954686; Sun, 13
 Mar 2022 21:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
 <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
 <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
 <d8e85004-de8d-fe7f-6bd3-a86ea5bb8e6a@linaro.org>
In-Reply-To: <d8e85004-de8d-fe7f-6bd3-a86ea5bb8e6a@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 13 Mar 2022 22:09:05 -0600
Message-ID: <CANCZdfrTNdXx7xz9mcw5rXK0bbwh0mF2iLX1JGeAXWHv8zn4+Q@mail.gmail.com>
Subject: Re: Question about atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000eae3ee05da25d7c3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::e34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eae3ee05da25d7c3
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 13, 2022 at 2:19 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/13/22 11:29, Warner Losh wrote:
> > So I was assuming that the cas instructions for arm use
> start/end_exclsive under the covers.
> > Is that the case?
>
> Nope.  The store exclusive guest insn is implemented with a host cmpxchg.
>

Oh? Out of paranoia, how can I verify that this is the case when compiled
on FreeBSD?
Perhaps the atomic sequence FreeBSD uses differs a little from Linux and we
don't trigger
that code? Or there's some adjustment that I've not made yet... the code
seems to work
on 3.1 but not on latest, and there's been a lot of changes to tcg, so I'd
like to rule it
out since there's a lot of other change too and there's too many
variables...


> Oh, I'd forgotten about the old arm cmpxchg64 syscall, which is still
> implemented with
> start/end_exclusive.  That should get fixed...
>

FreeBSD doesn't have this helper. So bsd-user doesn't implement it... The
only
good thing about that is that there's nothing for me to fix :/...

Warner


>
> r~
>

--000000000000eae3ee05da25d7c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 13, 2022 at 2:19 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 3/13/22 11:29, Warner Losh wrote:<br>
&gt; So I was assuming that the cas instructions for arm use start/end_excl=
sive under the covers.<br>
&gt; Is that the case?<br>
<br>
Nope.=C2=A0 The store exclusive guest insn is implemented with a host cmpxc=
hg.<br></blockquote><div><br></div><div>Oh? Out of paranoia, how can I veri=
fy that this is the case when compiled on FreeBSD?</div><div>Perhaps the at=
omic sequence FreeBSD uses differs a little from Linux and we don&#39;t tri=
gger</div><div>that code? Or there&#39;s some adjustment that I&#39;ve not =
made yet... the code seems to work</div><div>on 3.1 but not on latest, and =
there&#39;s been a lot of changes to tcg, so I&#39;d like to rule it</div><=
div>out since there&#39;s a lot of other change too and there&#39;s too man=
y variables...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
Oh, I&#39;d forgotten about the old arm cmpxchg64 syscall, which is still i=
mplemented with <br>
start/end_exclusive.=C2=A0 That should get fixed...<br></blockquote><div><b=
r></div><div>FreeBSD doesn&#39;t have this helper. So bsd-user doesn&#39;t =
implement it... The only</div><div>good thing about that is that there&#39;=
s nothing for me to fix :/...</div><div><br></div><div>Warner<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--000000000000eae3ee05da25d7c3--

