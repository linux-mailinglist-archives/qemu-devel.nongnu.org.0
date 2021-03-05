Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F032DEF3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:12:56 +0100 (CET)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHz1T-0006yH-UL
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lHyyT-0005SK-O0
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:09:49 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:36082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lHyyP-0002IX-Kp
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:09:48 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id q17so153763vkd.3
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 17:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rfPcFoTPUR3q5rpML+ShDN1KSLOatjT1IXSAIFRALWs=;
 b=dgmWk0y+1T662eThDQMQiZMwIBpupPQBLdGMax8JpeDjeRjSIARxovIiF4cr2dKZtL
 SaGI5DvWKvTGNdxS1PO+g6YTyGqDe2p1k+F3cE3KJhpdF18jE4f2uQR6lU/1czgydm6e
 yKnHFN7LZU5mVei8sa8j9Vru5LFWbdBtLpQlBu9mjDnhEz7y+z3Wjcf29gAJwkCpH09M
 ESSfxcONUowf4nVMlHVZDqjBEtQA1TMitiOEO3RA5qUUztrm3PHFeOUjHlyQtFc3UWq4
 X2r8huMqzS25EQ6c7aCDF/2DJAGnUTbqOW4SCsk9Vb3LzfTDOG36jXn2FRbDwGTARrOR
 nwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfPcFoTPUR3q5rpML+ShDN1KSLOatjT1IXSAIFRALWs=;
 b=GA2kM8D9BcPpj27QCaQImCo/cleS3ZJsSmRUu7PNlT2/QVi34hUhuP+DKZVdPzBwGW
 4ZWZec7puaJ7X+0KCRs0J7gqaLQLGNu7u6VsVs2t8jUrlI/M4DaaPgEj/U97bcPZyRXy
 qgmdk3IAWCmOG/LOsxWPLMlNgQY0dBaodbHMTC8qGcgisqkuo7/ftUWn3phGhSWF516H
 CKbTWOjtHPPMjMZ29kC1rNTp0wakFaEgYQYEQNyas79mGPtqKoLWLPaedkC2YjLUGElL
 HbOZPzn5cLom8VjPeYWr6xb0vMnmtsljgHdnKVtZbHuQcxYX9Ev3PuiULpv6uwmihGux
 YMiA==
X-Gm-Message-State: AOAM532nJZQDVoyXwS1rRb0H1MtkSQPqLevA/496P1vlz3MQAV/nSD7/
 wZl2NIi12YzVO0I529JIZH6TF8zGm6oQgDW1B4D2A2ZUNtY=
X-Google-Smtp-Source: ABdhPJxgUpcfJuT7bEFydZOA7wFrh9yLQ6Bio/YoHPX/bXc6FgJgpwm7YOo5DNEbtS27uL7Q1yMpwVt8diWiGnXk5uU=
X-Received: by 2002:a1f:2ecb:: with SMTP id u194mr4979547vku.13.1614906582090; 
 Thu, 04 Mar 2021 17:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20210218212453.831406-1-dje@google.com>
In-Reply-To: <20210218212453.831406-1-dje@google.com>
From: Doug Evans <dje@google.com>
Date: Thu, 4 Mar 2021 17:09:05 -0800
Message-ID: <CADPb22RvaNo+esLE_=5u6mUNto0Q3B-GB6YAxfNRMR5thMxaFw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add npcm7xx emc model
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>
Content-Type: multipart/alternative; boundary="0000000000002c3e7d05bcbfbd66"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=dje@google.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002c3e7d05bcbfbd66
Content-Type: text/plain; charset="UTF-8"

Ping.

On Thu, Feb 18, 2021 at 1:24 PM Doug Evans <dje@google.com> wrote:

> This is a 10/100 ethernet device that has several features.
> Only the ones needed by the Linux driver have been implemented.
> See npcm7xx_emc.c for a list of unimplemented features.
>
> Doug Evans (3):
>   hw/net: Add npcm7xx emc model
>   hw/arm: Add npcm7xx emc model
>   tests/qtests: Add npcm7xx emc model test
>
>  docs/system/arm/nuvoton.rst    |   3 +-
>  hw/arm/npcm7xx.c               |  50 +-
>  hw/net/meson.build             |   1 +
>  hw/net/npcm7xx_emc.c           | 857 ++++++++++++++++++++++++++++++++
>  hw/net/trace-events            |  17 +
>  include/hw/arm/npcm7xx.h       |   2 +
>  include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
>  tests/qtest/meson.build        |   3 +-
>  tests/qtest/npcm7xx_emc-test.c | 862 +++++++++++++++++++++++++++++++++
>  9 files changed, 2077 insertions(+), 4 deletions(-)
>  create mode 100644 hw/net/npcm7xx_emc.c
>  create mode 100644 include/hw/net/npcm7xx_emc.h
>  create mode 100644 tests/qtest/npcm7xx_emc-test.c
>
> --
> 2.30.0.617.g56c4b15f3c-goog
>
> Differences from v4:
>
> 1/3 hw/net: Add npcm7xx emc model
> - no change
>
> 2/3 hw/arm: Add npcm7xx emc model
> - no change
>
> 3/3 tests/qtests: Add npcm7xx emc model test
> - handle --disable-slirp
>
> Differences from v3:
>
> 1/3 hw/net: Add npcm7xx emc model
> - no change
>
> 2/3 hw/arm: Add npcm7xx emc model
> - no change
>
> 3/3 tests/qtests: Add npcm7xx emc model test
> - handle big endian hosts, tested on sparc64
>
> Differences from v2:
>
> 1/3 hw/net: Add npcm7xx emc model
> - move call to qemu_set_irq
> - remove use of C99 mixed decls/statements
> - add use of g_autofree
>
> 2/3 hw/arm: Add npcm7xx emc model
> - none, patch ok as is
>
> 3/3 tests/qtests: Add npcm7xx emc model test
> - remove use of C99 mixed decls/statements
>

--0000000000002c3e7d05bcbfbd66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Pin=
g.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Feb 18, 2021 at 1:24 PM Doug Evans &lt;<a href=3D"mailto:dj=
e@google.com">dje@google.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">This is a 10/100 ethernet device that has sever=
al features.<br>
Only the ones needed by the Linux driver have been implemented.<br>
See npcm7xx_emc.c for a list of unimplemented features.<br>
<br>
Doug Evans (3):<br>
=C2=A0 hw/net: Add npcm7xx emc model<br>
=C2=A0 hw/arm: Add npcm7xx emc model<br>
=C2=A0 tests/qtests: Add npcm7xx emc model test<br>
<br>
=C2=A0docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 50 +-<br>
=C2=A0hw/net/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/net/npcm7xx_emc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 857 ++=
++++++++++++++++++++++++++++++<br>
=C2=A0hw/net/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
17 +<br>
=C2=A0include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<=
br>
=C2=A0include/hw/net/npcm7xx_emc.h=C2=A0 =C2=A0| 286 +++++++++++<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-=
<br>
=C2=A0tests/qtest/npcm7xx_emc-test.c | 862 ++++++++++++++++++++++++++++++++=
+<br>
=C2=A09 files changed, 2077 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 hw/net/npcm7xx_emc.c<br>
=C2=A0create mode 100644 include/hw/net/npcm7xx_emc.h<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_emc-test.c<br>
<br>
-- <br>
2.30.0.617.g56c4b15f3c-goog<br>
<br>
Differences from v4:<br>
<br>
1/3 hw/net: Add npcm7xx emc model<br>
- no change<br>
<br>
2/3 hw/arm: Add npcm7xx emc model<br>
- no change<br>
<br>
3/3 tests/qtests: Add npcm7xx emc model test<br>
- handle --disable-slirp<br>
<br>
Differences from v3:<br>
<br>
1/3 hw/net: Add npcm7xx emc model<br>
- no change<br>
<br>
2/3 hw/arm: Add npcm7xx emc model<br>
- no change<br>
<br>
3/3 tests/qtests: Add npcm7xx emc model test<br>
- handle big endian hosts, tested on sparc64<br>
<br>
Differences from v2:<br>
<br>
1/3 hw/net: Add npcm7xx emc model<br>
- move call to qemu_set_irq<br>
- remove use of C99 mixed decls/statements<br>
- add use of g_autofree<br>
<br>
2/3 hw/arm: Add npcm7xx emc model<br>
- none, patch ok as is<br>
<br>
3/3 tests/qtests: Add npcm7xx emc model test<br>
- remove use of C99 mixed decls/statements<br>
</blockquote></div>

--0000000000002c3e7d05bcbfbd66--

