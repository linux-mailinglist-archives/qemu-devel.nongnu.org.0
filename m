Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C75570D39
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 00:16:42 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB1hp-0006Qh-3A
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 18:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaidehideshpande23@gmail.com>)
 id 1oB0Ay-0001Gy-T5
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:38:40 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vaidehideshpande23@gmail.com>)
 id 1oB0Ax-0003uW-Cl
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:38:40 -0400
Received: by mail-io1-xd2d.google.com with SMTP id u20so6037394iob.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 13:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=SolTUqN6hK6lUAmVPyQhArXiqVOZzOy2t6bijYm5wNs=;
 b=ksbAQ+eOkuRsh1gl8vSmdkMlBeM6PfohkT5nEasIgEVKApbuajS3vtzsEpwqMMx92Y
 YdO2FfeRacegRUd5cVb0NvzaKY+S3kABNGXiKHgjAan+U7ih5V5XxdjmE57X8DymYRED
 45LbLFEnYtU6HBmoGTxSw/4tM8x30NbS3m822on6zQfzMQAUSxLpPa4RK0GlqoFBw68V
 RICfNlmvNIdQrapgs+Mm9tICy3XE+zrtIVb9L5UNCC4boA5IIWGt2CDuvsedTETi9quU
 +HF4CeJFNrNYZYECO7hk3E8gP5dTULQEnNqu9+vVGxgK80rU+mtw60CUoZWQUUijkvsq
 T7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=SolTUqN6hK6lUAmVPyQhArXiqVOZzOy2t6bijYm5wNs=;
 b=BvHa3sxZWH5gbimUWI39OZnBZRfHAWYv2XUPTAU59vpBKVKe/Nzz7S8+Cr/ffGFHtu
 BhU9o4l7bUDLhVjay8dBjmBVelMhy/YivMgh6X3dIapKwJyqpo+Sw5HM4Ir76g9sqDXL
 xtp9LzCjMLLc2ur/t78p6LBXCGN92vKcv+7lJ81GXhnqZCuAbXz228ZldTsXpCGU/aCK
 hfbI0VRxN9MMzRB/RFxb+BFZZ4BaPCu+4BzXJYkocybXUUvIDTvThDkT2OIVVSpClB9p
 KG8P2yZ0Yt6Lh272ijDWpmUleEnDcr/ux3VnTLgDxAD6pB3YAae3h3jQ+aG9ZDDL0lWn
 QPSA==
X-Gm-Message-State: AJIora/VH1juZB+Jw9ulwc14xBxRwW5BdyiqaIsc42mPEn5uZe2xz5ZI
 RkFytMYGNmHNbWxYJ+OTpWtHvebSrV8NJFq0SApWVBOk
X-Google-Smtp-Source: AGRyM1u9YL/Yfy5njf/ttWbW1VncSEx7wYgxO7jfNk6P3wjRQPDwP+KziwPFL5EYopPunlgzULeQsarCH33LxHyKvOA=
X-Received: by 2002:a05:6638:1441:b0:33f:64ae:aabe with SMTP id
 l1-20020a056638144100b0033f64aeaabemr1987392jad.89.1657571917057; Mon, 11 Jul
 2022 13:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAM8HSEbqGL4vA3c3Z-biKZ8+bOgjnwjma53uC0Cn_brqY1ny+A@mail.gmail.com>
In-Reply-To: <CAM8HSEbqGL4vA3c3Z-biKZ8+bOgjnwjma53uC0Cn_brqY1ny+A@mail.gmail.com>
From: Vaidehi Deshpande <vaidehideshpande23@gmail.com>
Date: Mon, 11 Jul 2022 13:38:23 -0700
Message-ID: <CAM8HSEa-ARKQ1VL3St9-2S6QTrM41m_55YtmNVzb68OhxxMVYA@mail.gmail.com>
Subject: Re: Regarding QEMU on eclipse IDE:
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004e556d05e38d896d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=vaidehideshpande23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Jul 2022 18:13:46 -0400
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

--0000000000004e556d05e38d896d
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jul 2022 at 13:34, Vaidehi Deshpande <
vaidehideshpande23@gmail.com> wrote:

> Hello,
>
> I am Vaidehi and I am new to QEMU. I am working on emulating STM32F407
> board on QEMU and I am using eclipse IDE v4.24.0 and QEMU v7.0.0. I am
> trying to check the SPI loopback but the loop gets stuck at the
> BSY register check. And the xPacks is not installing
> qemu-system-gnuarmeclipse of the same version but installs
> qemu-system-gnuarmeclipse v2.8.0. I tried the blinky code and it works
> fine. Not sure about why the SPI is not functioning properly and why I
> couldn't install the qemu-system-gnuarmeclipse v7.0.0.
>
> Best regards,
> Vaidehi. D
>

--0000000000004e556d05e38d896d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 11 Jul 2022 at 13:34, Vaidehi Deshpande &lt;<a=
 href=3D"mailto:vaidehideshpande23@gmail.com">vaidehideshpande23@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">Hello,<div><br></div><div>I am Vaidehi and I am new to QEMU=
. I am working on emulating STM32F407 board on QEMU and I am using eclipse =
IDE v4.24.0 and QEMU v7.0.0. I am trying to check the SPI loopback but the =
loop gets stuck at the BSY=C2=A0register check. And the xPacks is not insta=
lling qemu-system-gnuarmeclipse of the same version but installs qemu-syste=
m-gnuarmeclipse v2.8.0. I tried the blinky code and it works fine. Not sure=
 about why the SPI is not functioning properly and why I couldn&#39;t insta=
ll the qemu-system-gnuarmeclipse v7.0.0.</div><div><br></div><div>Best rega=
rds,</div><div>Vaidehi. D</div></div>
</blockquote></div>

--0000000000004e556d05e38d896d--

