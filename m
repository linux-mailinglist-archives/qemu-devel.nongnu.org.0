Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F64C35ED
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:32:41 +0100 (CET)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJqy-0005ir-Tb
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:32:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNJRN-00020P-SU
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:06:15 -0500
Received: from [2607:f8b0:4864:20::634] (port=42934
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNJRL-0007jw-Uo
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:06:13 -0500
Received: by mail-pl1-x634.google.com with SMTP id p17so2632682plo.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDSBMYcb6tkoi0hrlkLAMkcZIEKb67DacdYnNK1Yf40=;
 b=Nf9UcntKzaAaAODI5RM0dZGM9wvf1d+J9RcPWePEfxGVDqQO9dTSuKBZPz9Ix5dPU8
 TgbNLXsn4GRQVWD64h/O9n/+r7AxDb/fswbpK8OuUGMZAULmRWaumBnQxRc81ujXHmoc
 FcgpFKx6BC062x8YCskQqi2PpWVwlD0vfFoD87CIQibEdCpPFFME5aDiUR95GptCuyoo
 MHxFKHQ2c+6FYpFBx3k2/8qYHbTtDHs9uUaNkn65fm+incWOyvcC6P4iW+mTjqIpQyrO
 rO9V9bJC0MpqO3kKsiwgMoSTPcY/e0mcTUEJPORCjEctvU2gS0T8I9vUI+mEnLVMQbe8
 Uf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDSBMYcb6tkoi0hrlkLAMkcZIEKb67DacdYnNK1Yf40=;
 b=I0sk/XzxMej2MPT3NG4y+ieaX9O1yl3+T1oRMjCvwDQLDIoEdiJY/xkWNnPGmbCEag
 uR63WRJr6bD+AZXCWLMZ0rsCBPieWL2yqRlvM9nn8+E5s48+q3b9GLBTANUpjdP8kOSC
 YCEjqGJNUq49rJsQwg81xoBTqfbk7px/mAfTeL1ixvPUggH6qesWMfqRvir3LziS57Zv
 9mQYiypQtDYAQ9RfnRvd6Yb3AVx8h+8VB+nb+XxTMPWVTLi5NUX/IZNWKwpVLUDvgIXe
 o5JYXRr65jUSCW9dV7rhMC5Rm3+AhjSJBGeZqwUxJG7mWNaAD+DZbgaNNpZcn1kMiP1f
 FllA==
X-Gm-Message-State: AOAM531DjlNBxl1lymodgPlnCksK8UGK5JGyfOnYvcE+50avrt3gspo3
 NuyzLgEShyHDQk7UUTORPhi3U7k5rimm3M69JY7Vr4LyN4c=
X-Google-Smtp-Source: ABdhPJwIp7J0sJdaDTXolbLBZk5s8OWI6kBLRQAwIAdC4n10FcT6WkGVUPfTIN3LX8Hzyu+gUHkLPfmHlmv5fzJV3IM=
X-Received: by 2002:a05:6102:356c:b0:31a:fb45:b81c with SMTP id
 bh12-20020a056102356c00b0031afb45b81cmr1700255vsb.35.1645729143422; Thu, 24
 Feb 2022 10:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 24 Feb 2022 10:58:52 -0800
Message-ID: <CAO=notwF3TYULgZn_w_1g-4Tq=7Fros8-jvwvm4XKaODu30ZEw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fixups for PMBus and new sensors
To: Titus Rwantare <titusr@google.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Corey Minyard <minyard@acm.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fe0f3f05d8c82c56"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=venture@google.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000fe0f3f05d8c82c56
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 6, 2022 at 3:09 PM Titus Rwantare <titusr@google.com> wrote:

> This patch series contains updates to PMBus in QEMU along with some PMBus
> device models for Renesas regulators.
> I have also added myself to MAINTAINERS as this code is in use daily,
> where I am responsible for it.
>
> Shengtan Mao (1):
>   hw/i2c: Added linear mode translation for pmbus devices
>
> Titus Rwantare (4):
>   hw/i2c: pmbus updates
>   hw/sensor: add Intersil ISL69260 device model
>   hw/sensor: add Renesas raa229004 PMBus device
>   hw/misc: add Renesas raa228000 device
>
>  MAINTAINERS                   |  15 +-
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/pmbus_device.c         | 106 +++++++-
>  hw/sensor/Kconfig             |   5 +
>  hw/sensor/isl_pmbus.c         | 278 ++++++++++++++++++++
>  hw/sensor/meson.build         |   1 +
>  include/hw/i2c/pmbus_device.h |  23 +-
>  include/hw/sensor/isl_pmbus.h |  52 ++++
>  tests/qtest/isl_pmbus-test.c  | 460 ++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  10 files changed, 930 insertions(+), 12 deletions(-)
>  create mode 100644 hw/sensor/isl_pmbus.c
>  create mode 100644 include/hw/sensor/isl_pmbus.h
>  create mode 100644 tests/qtest/isl_pmbus-test.c
>
>
Friendly ping - I believe I saw some of these have picked up Reviewer tags,
but ideally this will get into 7.0 before next month's soft-freeze.


> --
> 2.34.1.448.ga2b2bfdf31-goog
>
>

--000000000000fe0f3f05d8c82c56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 6, 2022 at 3:09 PM Titus =
Rwantare &lt;<a href=3D"mailto:titusr@google.com" target=3D"_blank">titusr@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This patch series contains updates to PMBus in QEMU along with s=
ome PMBus<br>
device models for Renesas regulators.<br>
I have also added myself to MAINTAINERS as this code is in use daily,<br>
where I am responsible for it.<br>
<br>
Shengtan Mao (1):<br>
=C2=A0 hw/i2c: Added linear mode translation for pmbus devices<br>
<br>
Titus Rwantare (4):<br>
=C2=A0 hw/i2c: pmbus updates<br>
=C2=A0 hw/sensor: add Intersil ISL69260 device model<br>
=C2=A0 hw/sensor: add Renesas raa229004 PMBus device<br>
=C2=A0 hw/misc: add Renesas raa228000 device<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 +-<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/i2c/pmbus_device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 106 +++++++-=
<br>
=C2=A0hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A05 +<br>
=C2=A0hw/sensor/isl_pmbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 278 ++++++++=
++++++++++++<br>
=C2=A0hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0include/hw/i2c/pmbus_device.h |=C2=A0 23 +-<br>
=C2=A0include/hw/sensor/isl_pmbus.h |=C2=A0 52 ++++<br>
=C2=A0tests/qtest/isl_pmbus-test.c=C2=A0 | 460 ++++++++++++++++++++++++++++=
++++++<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A010 files changed, 930 insertions(+), 12 deletions(-)<br>
=C2=A0create mode 100644 hw/sensor/isl_pmbus.c<br>
=C2=A0create mode 100644 include/hw/sensor/isl_pmbus.h<br>
=C2=A0create mode 100644 tests/qtest/isl_pmbus-test.c<br>
<br></blockquote><div><br></div><div>Friendly ping - I believe I saw some o=
f these have picked up Reviewer tags, but ideally this will get into 7.0 be=
fore next month&#39;s soft-freeze.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
-- <br>
2.34.1.448.ga2b2bfdf31-goog<br>
<br>
</blockquote></div></div>

--000000000000fe0f3f05d8c82c56--

