Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610E3DE33D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:49:23 +0200 (CEST)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAhgP-0000Jv-S3
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mAheX-0007LE-Du
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:47:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mAheR-0000xE-9Q
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:47:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k4so12484264wrc.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 16:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Gnh2BL/YaAev2kp7sWf6wiomBc66Ln111dWfzDoiwQ=;
 b=Gc5UkcGOU0XGthWRmUSPvH+29F++2GZP/Tcx8Ony8bbLPScdNPlqwusiJsROXScOxj
 a5JMnV56J5ZLvMsY+e+RKPP7J0/87VZupFUABthjsUXqTCicB4h8Wso9tuoYQmhz6Nf2
 RuVj/iNoOAG0J/1B43jesD7OWnRVbwhkPlf0zRPgAkrXXCi22J7riGPOYYJfspXfS/ch
 H4aZ3ZR92LBOu9003lq61zpmiNiShMi8i8PQ4zxV+wXm+pc63nGcvG5XwNc8O2S+xfj9
 zaG5oyBf1bOQ1fKy3dQ39/NvJZDIC3qiv+7p+cSA5oh5eA7Ca3O0CbShJDT4XKzqQfSg
 frlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Gnh2BL/YaAev2kp7sWf6wiomBc66Ln111dWfzDoiwQ=;
 b=gDJyNGYAXP1mjOsJVQsJDQig+0UGNh76K23ruYTv1sm8kV2b3QYxcL+ozPTphV9Nur
 7v0H8BnjseKlxa3y29XcaLhf7gEstO0x5vlj76t8djvEXfetI1xwiqy2kGsPwJCXU3wh
 EwiSLCKBKjADSHVhUnYvoLZI0S/wEQki+KbNdFhSZXHf6t0AuMz4NTXyugr28l9S0HQU
 57LmG482ixTJnEDtptw3K+2nsySStuolHX9dhG9vqAnBf1wVCDFpCG9GSx4D3UoCP3i5
 cJgbsgDaj/jSr2bAmnHchutjf4pQvdHlhdICfebK74bRQ945H0L9bBSvxk6KmmK6J2GS
 mJag==
X-Gm-Message-State: AOAM531+GutPHGp2od5YS9eGdeBTJPuWrAJjrQbeR5u1P54BTdE0iSLi
 BQ3gSE5R4+oLtKMQ7XZZI+LfmzWu2cDrLccpTjcP4Q==
X-Google-Smtp-Source: ABdhPJyHD80TdEVasrxjMKMlw7JIt4eFhtSA59IJnWBx2Bo4AN/PHpef/GtFnDLVRv38ucVaQO2hOMjls5lkMugIK6M=
X-Received: by 2002:a5d:6d82:: with SMTP id l2mr18463294wrs.225.1627948035411; 
 Mon, 02 Aug 2021 16:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210802230323.1164787-1-stmao@google.com>
In-Reply-To: <20210802230323.1164787-1-stmao@google.com>
From: Shengtan Mao <stmao@google.com>
Date: Mon, 2 Aug 2021 19:47:04 -0400
Message-ID: <CAMiADQ_85zWP+mLKL5JfcWr=xSr3+32mFag6Dd7zL8by4+AAXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Add remote I2C device to support external I2C
 device
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>, maoshengtan2011@gmail.com
Content-Type: multipart/alternative; boundary="0000000000005dc76d05c89c30bc"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=stmao@google.com; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005dc76d05c89c30bc
Content-Type: text/plain; charset="UTF-8"

This patch set was sent in error (duplicates and bad version names). Please
ignore it.

Sorry for the inconvenience,
Shengtan Mao

On Mon, Aug 2, 2021 at 7:03 PM Shengtan Mao <stmao@google.com> wrote:

> This patch implements the remote I2C device.
> The remote I2C device allows an external I2C device to communicate with
> the I2C controller in QEMU through the remote I2C protocol.
> Users no longer have to directly modify QEMU to add new I2C devices and
> can instead implement the emulated device externally and connect it to the
> remote I2C device.
>
> Previous work by Wolfram Sang (
> https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough)
> was referenced.
> It shares the similar idea of redirecting the actual I2C device
> functionalities, but Sang focuses on physical devices, and we focus on
> emulated devices.
> The work by Sang mainly utilizes file descriptors while ours utilizes
> character devices, which offers better support for emulated devices.
> The work by Sang is not meant to offer full I2C device support; it only
> implements the receive functionality.
> Our work implements full support for I2C devices: send, recv, and event
> (match_and_add is not applicable for external devices).
>
> Shengtan Mao (1):
>   hw/i2c: add remote I2C device
>
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/Kconfig                |   4 +
>  hw/i2c/meson.build            |   1 +
>  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
>  6 files changed, 340 insertions(+)
>  create mode 100644 hw/i2c/remote-i2c.c
>  create mode 100644 tests/qtest/remote-i2c-test.c
>
> --
> 2.32.0.554.ge1b32706d8-goog
>
>

--0000000000005dc76d05c89c30bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch set was sent in error (duplicates and bad versi=
on names). Please ignore it.=C2=A0<div><br></div><div>Sorry for the inconve=
nience,</div><div>Shengtan Mao</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 7:03 PM Shengtan=
 Mao &lt;<a href=3D"mailto:stmao@google.com">stmao@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch imp=
lements the remote I2C device.<br>
The remote I2C device allows an external I2C device to communicate with the=
 I2C controller in QEMU through the remote I2C protocol.<br>
Users no longer have to directly modify QEMU to add new I2C devices and can=
 instead implement the emulated device externally and connect it to the rem=
ote I2C device.<br>
<br>
Previous work by Wolfram Sang (<a href=3D"https://git.kernel.org/pub/scm/vi=
rt/qemu/wsa/qemu.git/commit/?h=3Di2c-passthrough" rel=3D"noreferrer" target=
=3D"_blank">https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=
=3Di2c-passthrough</a>) was referenced.<br>
It shares the similar idea of redirecting the actual I2C device functionali=
ties, but Sang focuses on physical devices, and we focus on emulated device=
s.<br>
The work by Sang mainly utilizes file descriptors while ours utilizes chara=
cter devices, which offers better support for emulated devices.<br>
The work by Sang is not meant to offer full I2C device support; it only imp=
lements the receive functionality.<br>
Our work implements full support for I2C devices: send, recv, and event (ma=
tch_and_add is not applicable for external devices).<br>
<br>
Shengtan Mao (1):<br>
=C2=A0 hw/i2c: add remote I2C device<br>
<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +<br>
=C2=A0hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/i2c/remote-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 117 +++=
+++++++++++++++<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A0tests/qtest/remote-i2c-test.c | 216 +++++++++++++++++++++++++++++++++=
+<br>
=C2=A06 files changed, 340 insertions(+)<br>
=C2=A0create mode 100644 hw/i2c/remote-i2c.c<br>
=C2=A0create mode 100644 tests/qtest/remote-i2c-test.c<br>
<br>
-- <br>
2.32.0.554.ge1b32706d8-goog<br>
<br>
</blockquote></div>

--0000000000005dc76d05c89c30bc--

