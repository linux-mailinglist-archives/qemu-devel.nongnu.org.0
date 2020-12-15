Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538BD2DA49F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:24:14 +0100 (CET)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koy8O-0002Sf-Ko
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy0b-0003sl-3k
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:05 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy0X-0003Ng-Od
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:04 -0500
Received: by mail-lf1-x141.google.com with SMTP id o13so11651741lfr.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3g1iJDAIyFEiVT/bq3Ap4xE8y4oUGUzuZ5yr37NL4ys=;
 b=h9ePbcFR6AQixb1ocTPjefKkNGR7Z+RcmTSYrLcHDVWUhIyNT9Fwx+A3RFmRe9PlbZ
 rgsaRK36m6hQEOYoIFYzJzH98q5yzspAVwOxzrBvwZdm3xtQFr1Oj0Xq9cZh+70Ycffq
 t1oC0ZKFZ02fApNhi6od+SzGQNwJRcQhWpgYLyWrtPjbB3kpXkdKtrn2ICDT+dzUC+2i
 BG/K0wijIHDuSvKWLWMxYhXmWzKVfJPjM5SZDBYVAgXf/RuLClNXoEPJ560RgYc/TUtB
 stQydI2uX8f4f46rrRpCr+2E1SjSDL/Vkwq6sLqHT7yd+xJVphIgBujxKu5iio/hZK2m
 fXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3g1iJDAIyFEiVT/bq3Ap4xE8y4oUGUzuZ5yr37NL4ys=;
 b=XbQCpyVcvO3NCtxK6HFw94gqcgsAMFCSL/pzbR83/p+1nlI1BPWBqAQAe5CQMMNMGd
 sVOBZoKxcQZVKqkXk9jYDV0Y7rLMPyAaOuujnyYqvTQR20OvsJA8ioT6bojXdPgMqfbw
 jOLLp7KmNgTGuPSF4ejbBJWE2ATCPo1nvVeedhWfuvCCOqfrreI816yCETQ263pKM9Ah
 yPvs88YODckcjbARetqBYhdNHjmwkIJsT7R0dZBH/hXVIR/JjXL7NDLnV5VMUpgtZEY5
 mMqME6ekmV8CAWtd2o550hhZMbpklo7bzKk2jo2rOa0dG8s/6xR6u6NYvI1acWRskZYt
 pBZA==
X-Gm-Message-State: AOAM533TH4z13uKSuhVu9dLlMUIoz5JtkjGec2A3p+EREE5Ko7BTg3qK
 n17FQDm3BjMByz9AcKR4j2kUsvIjZ+YqRFmu1thUQw==
X-Google-Smtp-Source: ABdhPJxlcnkKOmZm8vXZiFpqWAvzNqgg/ty1o+boYkSglXzZioaW1KKHGZwtHB+OIpc6oTZGmI9ahQnSS2RDW38NEtA=
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr9417652ljj.393.1607991359509; 
 Mon, 14 Dec 2020 16:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-1-wuhaotsh@google.com>
Date: Mon, 14 Dec 2020 16:15:47 -0800
Message-ID: <CAGcCb11VRTUj+uMiikuDCgM2Y6op_mje+J+kazQSM9E9FF7zJA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Additional NPCM7xx devices
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c97ae905b675a95c"
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: minyard@acm.org, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--000000000000c97ae905b675a95c
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 4:13 PM Hao Wu <wuhaotsh@google.com> wrote:

> This patch series include a few more NPCM7XX devices including
>
> - Analog Digital Converter (ADC)
> - Pulse Width Modulation (PWM)
>
> We also modified the CLK module to generate clock values using qdev_clock.
> These clocks are used to determine various clocks in NPCM7XX devices.
>
> Thank you for your review.
>
> Changes since v2:
> - Split PWM test into a separate patch in the patch set
> - Add trace events for PWM's update_freq/update_duty
> - Add trace events for ioread/iowrite in ADC and PWM
> - Use timer_get_ns in hw/timer/npcm7xx_timer.c
> - Update commit message in ADC/PWM to mention qom-get/set method for usage
> - Fix typos
>
> Changes since v1:
> - We removed the IPMI and KCS related code from this patch set.
>
> Hao Wu (5):
>   hw/misc: Add clock converter in NPCM7XX CLK module
>   hw/timer: Refactor NPCM7XX Timer to use CLK clock
>   hw/adc: Add an ADC module for NPCM7XX
>   hw/misc: Add a PWM module for NPCM7XX
>   hw/misc: Add QTest for NPCM7XX PWM Module
>
>  docs/system/arm/nuvoton.rst      |   4 +-
>  hw/adc/meson.build               |   1 +
>  hw/adc/npcm7xx_adc.c             | 321 +++++++++++++
>  hw/adc/trace-events              |   5 +
>  hw/arm/npcm7xx.c                 |  55 ++-
>  hw/misc/meson.build              |   1 +
>  hw/misc/npcm7xx_clk.c            | 795 ++++++++++++++++++++++++++++++-
>  hw/misc/npcm7xx_pwm.c            | 559 ++++++++++++++++++++++
>  hw/misc/trace-events             |   6 +
>  hw/timer/npcm7xx_timer.c         |  23 +-
>  include/hw/adc/npcm7xx_adc.h     |  72 +++
>  include/hw/arm/npcm7xx.h         |   4 +
>  include/hw/misc/npcm7xx_clk.h    | 146 +++++-
>  include/hw/misc/npcm7xx_pwm.h    | 106 +++++
>  include/hw/timer/npcm7xx_timer.h |   1 +
>  meson.build                      |   1 +
>  tests/qtest/meson.build          |   4 +-
>  tests/qtest/npcm7xx_adc-test.c   | 400 ++++++++++++++++
>  tests/qtest/npcm7xx_pwm-test.c   | 490 +++++++++++++++++++
>  19 files changed, 2964 insertions(+), 30 deletions(-)
>  create mode 100644 hw/adc/npcm7xx_adc.c
>  create mode 100644 hw/adc/trace-events
>  create mode 100644 hw/misc/npcm7xx_pwm.c
>  create mode 100644 include/hw/adc/npcm7xx_adc.h
>  create mode 100644 include/hw/misc/npcm7xx_pwm.h
>  create mode 100644 tests/qtest/npcm7xx_adc-test.c
>  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
>
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
>

--000000000000c97ae905b675a95c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 2020 at 4:13 PM Hao Wu &l=
t;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch seri=
es include a few more NPCM7XX devices including<br>
<br>
- Analog Digital Converter (ADC)<br>
- Pulse Width Modulation (PWM)<br>
<br>
We also modified the CLK module to generate clock values using qdev_clock.<=
br>
These clocks are used to determine various clocks in NPCM7XX devices.<br>
<br>
Thank you for your review.<br>
<br>
Changes since v2:<br>
- Split PWM test into a separate patch in the patch set<br>
- Add trace events for PWM&#39;s update_freq/update_duty<br>
- Add trace events for ioread/iowrite in ADC and PWM<br>
- Use timer_get_ns in hw/timer/npcm7xx_timer.c<br>
- Update commit message in ADC/PWM to mention qom-get/set method for usage<=
br>
- Fix typos<br>
<br>
Changes since v1:<br>
- We removed the IPMI and KCS related code from this patch set.<br>
<br>
Hao Wu (5):<br>
=C2=A0 hw/misc: Add clock converter in NPCM7XX CLK module<br>
=C2=A0 hw/timer: Refactor NPCM7XX Timer to use CLK clock<br>
=C2=A0 hw/adc: Add an ADC module for NPCM7XX<br>
=C2=A0 hw/misc: Add a PWM module for NPCM7XX<br>
=C2=A0 hw/misc: Add QTest for NPCM7XX PWM Module<br>
<br>
=C2=A0docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br=
>
=C2=A0hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 321 +++++++++++++<br>
=C2=A0hw/adc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
=C2=A0hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 55 ++-<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/misc/npcm7xx_clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 795 =
++++++++++++++++++++++++++++++-<br>
=C2=A0hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 559 =
++++++++++++++++++++++<br>
=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +<br>
=C2=A0hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 =
+-<br>
=C2=A0include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 72 +++<br>
=C2=A0include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A04 +<br>
=C2=A0include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 | 146 +++++-<br>
=C2=A0include/hw/misc/npcm7xx_pwm.h=C2=A0 =C2=A0 | 106 +++++<br>
=C2=A0include/hw/timer/npcm7xx_timer.h |=C2=A0 =C2=A01 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0tests/qtest/npcm7xx_adc-test.c=C2=A0 =C2=A0| 400 ++++++++++++++++<br>
=C2=A0tests/qtest/npcm7xx_pwm-test.c=C2=A0 =C2=A0| 490 +++++++++++++++++++<=
br>
=C2=A019 files changed, 2964 insertions(+), 30 deletions(-)<br>
=C2=A0create mode 100644 hw/adc/npcm7xx_adc.c<br>
=C2=A0create mode 100644 hw/adc/trace-events<br>
=C2=A0create mode 100644 hw/misc/npcm7xx_pwm.c<br>
=C2=A0create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
=C2=A0create mode 100644 include/hw/misc/npcm7xx_pwm.h<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_pwm-test.c<br>
<br>
-- <br>
2.29.2.684.gfbc64c5ab5-goog<br>
<br>
</blockquote></div></div>

--000000000000c97ae905b675a95c--

