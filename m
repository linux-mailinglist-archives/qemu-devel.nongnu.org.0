Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6D55E58D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:56:33 +0200 (CEST)
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Cdj-0001iC-PI
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o6Cbe-0000iI-Uz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:54:22 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:41485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o6Cbd-0001QP-3d
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:54:22 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id r1so4990404vke.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6jlHexNdraPGgV0Fndr824ScPeLMK/AymMR/fc8vwak=;
 b=ELkOs3uakN6N6oI6dCnPo1hHrc2GRokf+l+3Fp+MhC3yvWmbr7q9YpVzSmt+ZqurOb
 k3KRxYXcrDJUxrMp2NKGotY2mWc4GLMeYoLCvBTkYhJAQUgT4m+bSlFmlVVj6kmXkvD+
 IjbcokqL9NM+tI+SLXI4JOSr7xtloHDjCBYJAQvciSPjQkZgg3PsY3AxSQYfRU91EZo5
 Xt+Sbvblb10rz1TeDFh32aQYlRoJSYgDkU/np4L2es9AmA1Zea0eOWs1C7NDB1X5qiLV
 I6rebL5l+sMKf1Ak+6zl9FdEgbjAUB71UnpRrMC1UDK0Kndbl36zQ2FOvA+970TuWNpX
 02Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6jlHexNdraPGgV0Fndr824ScPeLMK/AymMR/fc8vwak=;
 b=Gzod+tZNW5tKYaWbBtyPvMGDmpnOqCo0noR3hgH6kmKU+L/DYATcEHJCims4883DxU
 E7gNJT7N9OkzvqTJJrw2JAIsM22Nf42VyUJ8V/Bd1PDMWwEhzWa6VWP5jdg3xR3+Xt1f
 DjZLwum+QqkaNXmpynW4bmRPT5zMWH3itLp2fHk6nsRrPZuoXOFXczrK6Sm/FenhWv3l
 5vQjBdbxi+OQB2A2T1RYQxOqQ6RdiF/ud54QS1j3a868+kSFnEa7ZIvEZaiPIImqfDMG
 4tuoTud/J6s3lQRhc8s2VOehzDzQq5cLDM2B2+HIJu8QICloLlIxO1Tp7tycIaaKIdRT
 Hf/Q==
X-Gm-Message-State: AJIora/xaeVQgIKco0hZqwH1W5LnEg63ZgWnkqOJYGuxfWYaBHTY8hK2
 /7hk1QBZFznh6GMopoTJQY9Px68HReI7gJu451BJAw==
X-Google-Smtp-Source: AGRyM1uRkUMbrpMd5RcfYh9XUmhJHOPs85/BTulfUkBu22aTjOF1D1xs+B21Ts4q+HBR/syYG//MutEV8A7auP9dBRg=
X-Received: by 2002:a1f:85:0:b0:36c:509a:bf65 with SMTP id
 127-20020a1f0085000000b0036c509abf65mr2346752vka.21.1656428058055; 
 Tue, 28 Jun 2022 07:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <CAFEAcA985ardY5zWkrZYgWjj+tdVNUnRcaBUChGFX0-o99cjQA@mail.gmail.com>
 <20220628064831-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628064831-mutt-send-email-mst@kernel.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 28 Jun 2022 08:54:07 -0600
Message-ID: <CANCZdfrG=HVS0DLTucfBxH+2pTPNDYhERyQgViHP0=YdNKE+jg@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ff2c3805e28335e8"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff2c3805e28335e8
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 5:10 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> git submodules are awkward basically because they are an automated wget.
> I don't think an explicit wget is much better ... but
> looks like I'm alone in this. Oh well.
>

submodules are 90% of the hassles I have  in upstreaming and updating the
bsd-user stuff. They play terribly with branches, rebases, and any number of
other things and are a pain to reset at times. They are easily the most
brittle,
error-prone and difficult to use feature of git.

I hate them with a burning passion. You are not alone.

Warner

--000000000000ff2c3805e28335e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 28, 2022 at 5:10 AM Micha=
el S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">git submo=
dules are awkward basically because they are an automated wget.<br>
I don&#39;t think an explicit wget is much better ... but<br>
looks like I&#39;m alone in this. Oh well.<br></blockquote><div><br></div><=
div>submodules are 90% of the hassles I have=C2=A0 in upstreaming and updat=
ing the</div><div>bsd-user stuff. They play terribly with branches, rebases=
, and any number of</div><div>other things and are a pain to reset at times=
. They are easily the most brittle,</div><div>error-prone and difficult to =
use feature of git.</div><div><br></div><div>I hate them with a burning pas=
sion. You are not alone.</div><div><br></div><div>Warner</div></div></div>

--000000000000ff2c3805e28335e8--

