Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B7D39E2E5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:34:42 +0200 (CEST)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqID3-00039Z-Mx
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lqIC6-0002VF-SC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:33:42 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lqIC3-00074G-EM
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:33:42 -0400
Received: by mail-qk1-x72a.google.com with SMTP id d196so12143571qkg.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W+iRjzPE6+pzWNkGjRVJlZ+pTbj08nHN3KKWrZpNulg=;
 b=a/eIEAK1upW4GcRWMwvPgZJB1N//eBHYX+FFjTgy974pGfFIEPxP0KKF2rmFOap7fh
 tbfN4GWZUrWqeUw83E/o8XtNtVbDC0nyLG0b//weO3Ll5xNtMpsyrqTNy/gwD8PPjzbe
 4aNrEJhWD0WULCWrHpzIaNU0IpTw+1w4ef9CcPg8KesM2WVXjF1nANnRBmSrWH8bghnP
 XpaTepsmrlfyf8B5gAsNNn/aa7bTIXyhZ+8AJEWYdmuqNps1A77FvUw8T+Eb+B/oC8Lu
 4xk0weMLD2IMvks57zPcox9xjEURz4bgMBUi8rzeJ9CfQkLkDHepqqnpptM4vwcI8WWN
 jvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+iRjzPE6+pzWNkGjRVJlZ+pTbj08nHN3KKWrZpNulg=;
 b=iFmAB3LGV5BW6Jfg3vatDrM54B67CakfQHnhaPcy3mfl93S4xWLrY7h8B8QG6me8BQ
 uDyf8OgwmZB+cVwOSRuuYRTq0959dm4KHkWlPlJ0Yie6m1Wi/VWr0Ga4Sm3Nig7UURLp
 lzUx9kWurjqvjRlrF4JYH1jpXWsTS3+xGfYkshVwuU/g6qzjnzRPvaCObFyjRsCOWgfZ
 sJbj1Uj9KpDWEZVmDROmHoZYUogYWthA9MV+4wl8gKLV0rEBHooZEpY7oVjR94pe4Sb6
 +jO/fe4EZOjVlYObbt/+YArfTlNcsbBtBhkRIbCgTplRrZd00v/gCJR85y/vnHsf9jmG
 b63w==
X-Gm-Message-State: AOAM532ti383GBdY2aGJV1K1MUxn4wEUi3TSnoHNxzvRVoVxwuolNpgY
 Ii9EtBD7J4fwK5FfSWgnlxWst7KtcHHuiBaTfgPkNw==
X-Google-Smtp-Source: ABdhPJwHxWR5bO4i+s2v8wuKWEgJfBOW5wteIVU2mC8mlycaBnLPmdwZdADIubfYqIKdcJaxZ4DhU9RN3nN7JQqkUUI=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr15029140qke.44.1623083617332; 
 Mon, 07 Jun 2021 09:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
In-Reply-To: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 7 Jun 2021 10:33:26 -0600
Message-ID: <CANCZdfoxTXpm_5pbnLPUTCRhgJFH_1Pa2MjpsGDcoHf_Z-1AxQ@mail.gmail.com>
Subject: Re: Regarding commit a9bcedd (SD card size has to be power of 2)
To: Tom Yan <tom.ty89@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000073ef2805c42f9a05"
Received-SPF: none client-ip=2607:f8b0:4864:20::72a;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair.francis@wdc.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000073ef2805c42f9a05
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 2:31 AM Tom Yan <tom.ty89@gmail.com> wrote:

> Hi philmd (and others),
>
> So I just noticed your commit of requiring the size of an emulated SD
> card to be a power of 2, when I was trying to emulate one for an
> actual one (well, it's a microSD, but still), as it errored out.
>
> You claim that the kernel will consider it to be a firmware bug and
> "correct" the capacity by rounding it up. Could you provide a concrete
> reference to the code that does such a thing? I'm not ruling out that
> some crazy code could have gone upstream because some reviewers might
> not be doing their job right, but if that really happened, it's a
> kernel bug/regression and qemu should not do an equally-crazy thing to
> "fix" it.
>
> No offense but what you claimed really sounds absurd and ridiculous.
> Although I don't have hundreds of SD cards in hand, I owned quite a
> few at least, like most people do, with capacities ranging from ~2G to
> ~128G, and I don't even recall seeing a single one that has the
> capacity being a power of 2. (Just like vendors of HDDs and SSDs, they
> literally never do that AFAICT, for whatever reasons.)
>
> Besides, even if there's a proper reason for the kernel to "fix" the
> capacity, there's no reason for it to round it up either, because
> obviously there will never be actual storage for the "virtual blocks".
> I've never seen such a behavior so far either with the "mmcblk" hosts
> I've used so far.
>

Some data points: I have several 224GB SD cards. FreeBSD specifically uses
a size
just a little smaller than the rated size because so many capacity points
are a bit
smaller (1GB cards also tend to be only 1% larger 1E9 bytes, nowhere near a
power
of two). FreeBSD's kernel never adjusts the size of SD or MMC cards, and
there's
nothing in the Simplified SD standard nor in the various MMC standards
requiring a
power of two.

Warner

--00000000000073ef2805c42f9a05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 7, 2021 at 2:31 AM Tom Ya=
n &lt;<a href=3D"mailto:tom.ty89@gmail.com">tom.ty89@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi philmd (an=
d others),<br>
<br>
So I just noticed your commit of requiring the size of an emulated SD<br>
card to be a power of 2, when I was trying to emulate one for an<br>
actual one (well, it&#39;s a microSD, but still), as it errored out.<br>
<br>
You claim that the kernel will consider it to be a firmware bug and<br>
&quot;correct&quot; the capacity by rounding it up. Could you provide a con=
crete<br>
reference to the code that does such a thing? I&#39;m not ruling out that<b=
r>
some crazy code could have gone upstream because some reviewers might<br>
not be doing their job right, but if that really happened, it&#39;s a<br>
kernel bug/regression and qemu should not do an equally-crazy thing to<br>
&quot;fix&quot; it.<br>
<br>
No offense but what you claimed really sounds absurd and ridiculous.<br>
Although I don&#39;t have hundreds of SD cards in hand, I owned quite a<br>
few at least, like most people do, with capacities ranging from ~2G to<br>
~128G, and I don&#39;t even recall seeing a single one that has the<br>
capacity being a power of 2. (Just like vendors of HDDs and SSDs, they<br>
literally never do that AFAICT, for whatever reasons.)<br>
<br>
Besides, even if there&#39;s a proper reason for the kernel to &quot;fix&qu=
ot; the<br>
capacity, there&#39;s no reason for it to round it up either, because<br>
obviously there will never be actual storage for the &quot;virtual blocks&q=
uot;.<br>
I&#39;ve never seen such a behavior so far either with the &quot;mmcblk&quo=
t; hosts<br>
I&#39;ve used so far.<br></blockquote><div><br></div><div>Some data points:=
 I have several 224GB SD cards. FreeBSD specifically uses a size</div><div>=
just a little smaller than the rated size because so many capacity points a=
re a bit</div><div>smaller (1GB cards also tend to be only 1% larger 1E9 by=
tes, nowhere near a power</div><div>of two). FreeBSD&#39;s kernel never adj=
usts the size of SD or MMC cards, and there&#39;s</div><div>nothing in the =
Simplified SD standard nor in the various MMC standards requiring a</div><d=
iv>power of two.</div><div><br></div><div>Warner</div></div></div>

--00000000000073ef2805c42f9a05--

