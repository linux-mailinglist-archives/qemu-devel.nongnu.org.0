Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B541184F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:33:52 +0200 (CEST)
Received: from localhost ([::1]:60860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLIl-0007qQ-Eu
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mSLBu-0005kJ-D9
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:26:46 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mSLBs-00066V-NA
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:26:46 -0400
Received: by mail-il1-x136.google.com with SMTP id b15so19095026ils.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hh/vZ3lK1sPdA0agemNUs8PHHz4JqCpykGUlpwpkGA8=;
 b=X9NlNjB2sVoab/DmX0nOaK5ieEml+ijzZDcoUcoMHu14YI4aWMtHnWWQafgjtlraLz
 WHvrq4Y1uc9O3+U1VgaUKw0ijMi3Jegcw4KsGm75FFLwignKZ1JgqpyWjxabZPfjiseV
 ZWuhNyZpYWHMUBvAK/pJB/gIv6dCS+yPMxOtFffDmnCxaFdzbTdABGz4D2f4lG07Hy1S
 FXPZR/tOVVhwr46JICKup+kDcSxfqokUJIhzXFQBjTiE3YV9b97V5V4hXDSkgX4N2qIl
 kHMha0AaZ9toZ1zt2VXae44EtlJXNS/LSoB32UNujvcgn+l/fWUdy7ELIhUggWFa/mJq
 NDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hh/vZ3lK1sPdA0agemNUs8PHHz4JqCpykGUlpwpkGA8=;
 b=TCA7pNnbKpv8JoLFVGpZhxdTMI8NyqlIu/+3SOHY67hbKIC9ZWOIocsNWMWtMJsd2i
 P2+7He3P7O/Z7VQCh4uaUVneZhwsoz4l6lLCLaaHM00JNlGKxwBQtVragSicUc6E7qFw
 mA9OGCMTl4DgTwW81c0Wnoewrm0fAidDnO50pWb5KdaRkbeI9KaZ9zQwYGkvQtbQHcb/
 BBjwsxHK0cu7WdY/Fo8alNDjOjiZIlH+yE0MBGEsm34GnDfZ7YeWlMeI6/1VwbsdL0FM
 pQcq06dQinivP7xfhg02vFwOtnBedMrlwqmUAQRIfqCKHa9Wfhr/IKl9iuTSkD/VsUIV
 PNSw==
X-Gm-Message-State: AOAM531Jyw/7ZdfIsgm4T0Rh92WpY1UE8D4tD791LfUjJYf4E9w5Ce7V
 3PlFD3lifGMdxxdGj3qzG+SADAxcCALy/bRAZ7jcWu6QDSg=
X-Google-Smtp-Source: ABdhPJyz80l5mYMnJGC/c0A6tL0DVwO+Cdv7k+jS5pELtqowYRUUfgSzrSLEo4Gr/jq4ISDTiN2XNtBljwI62LR1Bx8=
X-Received: by 2002:a05:6e02:20e8:: with SMTP id
 q8mr16690306ilv.202.1632151600721; 
 Mon, 20 Sep 2021 08:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
In-Reply-To: <20210810134844.166490-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 20 Sep 2021 17:26:29 +0200
Message-ID: <CAD-LL6juA6Am9T2-uHRZ1Mp17aPYH0YPHcAdgamw=Z6OCGG5+g@mail.gmail.com>
Subject: Re: [PATCH 0/5] plugins/cache: L2 cache modelling and a minor leak fix
To: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000061731205cc6ee8f8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000061731205cc6ee8f8
Content-Type: text/plain; charset="UTF-8"

Ping :-)

On Tue, Aug 10, 2021 at 3:48 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Hello,
>
> This series implements a simple L2 unified per-core cache emulation, the L2
> cache is not enabled by default and is only enabled on specifying so using
> the
> plugin arguments. L2 cache is only accessed if L1 does not contain the
> wanted
> block. If a miss occur in L1, the block is "fetched" to L1, and then L2 is
> interrogated. This effectively mean that on a cache miss, we bring the
> data to
> all the cache hierarchy, which is quite reasonable.
>
> Note: Some +80-column lines are left as is, since they're all 81~83 cols
> and I
> thought that it's so important to break them since breaking a line usually
> looks
> ugly when not sufficiently long(?) LMK if I need to fix this :)
>
> Mahmoud Mandour (5):
>   plugins/cache: freed heap-allocated mutexes
>   plugins/cache: implement unified L2 cache emulation
>   plugins/cache: split command line arguments into name and value
>   plugins/cache: make L2 emulation optional through args
>   docs/tcg-plugins: add L2 arguments to cache docs
>
>  contrib/plugins/cache.c    | 318 ++++++++++++++++++++++++++-----------
>  docs/devel/tcg-plugins.rst |  22 ++-
>  2 files changed, 244 insertions(+), 96 deletions(-)
>
> --
> 2.25.1
>
>

--00000000000061731205cc6ee8f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping :-)=C2=A0</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 3:48 PM Mahmoud Mand=
our &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello=
,<br>
<br>
This series implements a simple L2 unified per-core cache emulation, the L2=
<br>
cache is not enabled by default and is only enabled on specifying so using =
the<br>
plugin arguments. L2 cache is only accessed if L1 does not contain the want=
ed<br>
block. If a miss occur in L1, the block is &quot;fetched&quot; to L1, and t=
hen L2 is<br>
interrogated. This effectively mean that on a cache miss, we bring the data=
 to<br>
all the cache hierarchy, which is quite reasonable.<br>
<br>
Note: Some +80-column lines are left as is, since they&#39;re all 81~83 col=
s and I<br>
thought that it&#39;s so important to break them since breaking a line usua=
lly looks<br>
ugly when not sufficiently long(?) LMK if I need to fix this :)<br>
<br>
Mahmoud Mandour (5):<br>
=C2=A0 plugins/cache: freed heap-allocated mutexes<br>
=C2=A0 plugins/cache: implement unified L2 cache emulation<br>
=C2=A0 plugins/cache: split command line arguments into name and value<br>
=C2=A0 plugins/cache: make L2 emulation optional through args<br>
=C2=A0 docs/tcg-plugins: add L2 arguments to cache docs<br>
<br>
=C2=A0contrib/plugins/cache.c=C2=A0 =C2=A0 | 318 ++++++++++++++++++++++++++=
-----------<br>
=C2=A0docs/devel/tcg-plugins.rst |=C2=A0 22 ++-<br>
=C2=A02 files changed, 244 insertions(+), 96 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000061731205cc6ee8f8--

