Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9423FAF02
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 00:40:56 +0200 (CEST)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKTTy-00073A-U5
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 18:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKTSk-0006Kv-GB
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 18:39:38 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:40472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKTSi-0000q6-WB
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 18:39:38 -0400
Received: by mail-oi1-f180.google.com with SMTP id h133so17607344oib.7
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 15:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NaLfr/6crNE6x1Rboj3QMd5/jLQkDFMgvpWnkwRMZRM=;
 b=OwmmromX82moo6ZHmVOnZI/QtsJbNE0VnQFMGWICUjh6IVmHGrNzIjOc9t3ONw9+iC
 wBD/5QVlTJ57RRLR2n316s13wnwHv3U/c2OHYwfBmvfjLQlywypGW3aL66Oy6IQ62Nyy
 Y1ZbhEhnbg5XWitRncLm3kzKV2iyw3yqfC+hrdiOWnvf8TGMGoX1PElmZt10dazELxGG
 O3O9IAl94ceZleat88KHwEf0DCHiDdO1xeZHEvPlLOv2ZNCaF8p+cJkKdZ49jAuqfy7q
 mLqAolx+D/8+WW77fxhfSA21mFPhKW0bmO5zHnJhFMnVewindbV574Ihso/QpaHhX6Vw
 Aapw==
X-Gm-Message-State: AOAM532xiaKfgUeOCBo8mJgOk3UIEvOHAuBm+39yfIPRyGN8k3NyJL+p
 RA6lPeX/BLL9LBt0Wj20Lb+ppLYjJef+OpTc0qU=
X-Google-Smtp-Source: ABdhPJwmwbRKJY+ekg58J7tPhpYT/TVpQO278p3qbeA/iXkDawUVWB+nRs5Wk41JXTpEgCGgOfXzVWDPJ8xqB9MA0mQ=
X-Received: by 2002:a05:6808:10c8:: with SMTP id
 s8mr22208268ois.175.1630276775252; 
 Sun, 29 Aug 2021 15:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
 <CAM2a4uxp29QKMaLFOseS5dHRNuooVY6sghzD22NEtGE=3g5wVA@mail.gmail.com>
 <CAFEAcA_eQrd+Hiky+tUZSoNDkcmz5MwpM2=2RQp-gnCDTV4wvw@mail.gmail.com>
 <CAM2a4uwkY85PaPKBKbA1b_xc6LkeTkR4Me_S9d1HRi2y8TwOiw@mail.gmail.com>
 <CAFEAcA-i5RUxh9=jmz-hN+LLg6_nk3TaanUy-2DDvtfdF7wyeg@mail.gmail.com>
 <CAM2a4uwq8z043puuLG0WvzpBn0paa5sWeFeHUnwuysezXv67DA@mail.gmail.com>
In-Reply-To: <CAM2a4uwq8z043puuLG0WvzpBn0paa5sWeFeHUnwuysezXv67DA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 30 Aug 2021 00:39:23 +0200
Message-ID: <CAAdtpL4RoKE=j+RzfYK3CuC=Q6zLPUp=bsn8DPSGHvQ7Si3hCA@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Gautam Bhat <mindentropy@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001315f505caba64a5"
Received-SPF: pass client-ip=209.85.167.180;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001315f505caba64a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 29 ao=C3=BBt 2021 23:34, Gautam Bhat <mindentropy@gmail.com> a =C3=
=A9crit :

> > Just create a minimal machine with some RAM in it, and use
> > the generic-loader to load the test binary into the RAM, then.
> >
> > -- PMM
>
> I should be using the -bios switch for loading the bare metal firmware,
> correct?
>

No:

-device generic-loader

-Gautam.
>

--0000000000001315f505caba64a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le dim. 29 ao=C3=BBt 2021 23:34, Gautam Bhat &lt;<a hr=
ef=3D"mailto:mindentropy@gmail.com">mindentropy@gmail.com</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; Just create a minim=
al machine with some RAM in it, and use<br>
&gt; the generic-loader to load the test binary into the RAM, then.<br>
&gt;<br>
&gt; -- PMM<br>
<br>
I should be using the -bios switch for loading the bare metal firmware, cor=
rect?<br></blockquote></div></div><div><br></div><div>No:</div><div><br></d=
iv><div>-device=C2=A0<span style=3D"font-family:sans-serif;font-size:13.696=
px">generic-loader</span></div><div><span style=3D"font-family:sans-serif;f=
ont-size:13.696px"><br></span></div><div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
-Gautam.<br>
</blockquote></div></div></div>

--0000000000001315f505caba64a5--

