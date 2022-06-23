Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5743557292
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 07:30:11 +0200 (CEST)
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4FPu-0007nC-4l
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 01:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FLX-0006YK-Sq; Thu, 23 Jun 2022 01:25:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FLT-0001qP-Fw; Thu, 23 Jun 2022 01:25:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id v14so26282456wra.5;
 Wed, 22 Jun 2022 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMYfBYFBtSZQ/UGSiZfn6+vx30kd6A0Eim4w7N+lFig=;
 b=O0NKP20LyFM0izRlYZMNZt6xvpVhWYNIla0QDimPMYGK3UgVrB51JOlPgR0OqrPTPF
 iSiR4g2PPb7Az9CP5KZBFlzmxrXMYsJsxS+0t5xFuvoCmsneaSVCW0k8qrbjYOS/hy21
 3XUTFopvGQDNvq/nKalqKciOAmfZ4/yHsF6NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMYfBYFBtSZQ/UGSiZfn6+vx30kd6A0Eim4w7N+lFig=;
 b=bru8B6f253+4c/L1Nrf2XIU4rDMHPMScrWPyehhpSTjnrxFp6EYacACvCqAv3JuODf
 513Wu6IvkFgL8jCuFzk6Zm18li1Dp+kENkdAsE0ALnfuQBICVIOumd3fmQLz4cT9U+xu
 ptgwXOVadkH8lpdYh5pddIreXfci4CghngIop2G5a6TQ7TUnpZ1qgp+fqB7Iqe875kNg
 v+8uvrqlWdcHAea/Y08hvwBUy10mLkT+TtaJvpILC58GtodhfFZ5Q/yTJoNTCqXeP8vi
 IHlsNNTYJM5GbOuqxgQqshQUU/pRrG82Mudf8iSpQbUXJ8FSlM/eIm5b3Y52KXH4UqoO
 rX3g==
X-Gm-Message-State: AJIora/hJeIUdFlHFGRuoO8W8tgNLchWLg1FeiedKGnJr2grZ0CGx/sx
 HS0QcFX6+J1COeLe6yf7MpcFuXdC5Bcwlciz0ds=
X-Google-Smtp-Source: AGRyM1vq8g6sG6jR6v3z+6Fs3HVorXRpCXxtDFVXN5wWfWdt4iud1kScG3E+3/FQVNybBIeAjK5gt8cD7QEAdUtDxKQ=
X-Received: by 2002:a05:6000:993:b0:21b:8f16:5b3f with SMTP id
 by19-20020a056000099300b0021b8f165b3fmr6488340wrb.628.1655961931637; Wed, 22
 Jun 2022 22:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:25:19 +0000
Message-ID: <CACPK8Xcfyu0BxEhVZDQ=mfw0OcPgSm6nVSzpmT5nviq7X+rFTA@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add Qualcomm BMC machines
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Hello,
>
> I'm sending a series to add Qualcomm BMC machines that are equipped with
> Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
> emulation. Please help to review.

Thanks for the MAX31785 model, that's handy to have.

I'm all for more emulation and testing using Qemu models, but I wonder
if you need to add all three of your boards. They seem to be a
progression (evb-proto -> dc-scm -> firework). Could you get away with
just one or two of those?


>
> Thanks,
>
> Jae
>
> Graeme Gregory (2):
>   hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
>   hw/arm/aspeed: add Qualcomm Firework machine and FRU device
>
> Jae Hyun Yoo (3):
>   hw/arm/aspeed: add support for the Qualcomm EVB proto board
>   hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
>   hw/arm/aspeed: firework: add I2C MUXes for VR channels
>
> Maheswara Kurapati (4):
>   hw/i2c: pmbus: Page #255 is valid page for read requests.
>   hw/sensor: add Maxim MAX31785 device
>   hw/arm/aspeed: firework: Add MAX31785 Fan controllers
>   hw/arm/aspeed: firework: Add Thermal Diodes
>
>  hw/arm/Kconfig        |   1 +
>  hw/arm/aspeed.c       | 158 +++++++++++-
>  hw/i2c/pmbus_device.c |   1 -
>  hw/sensor/Kconfig     |   4 +
>  hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build |   1 +
>  6 files changed, 742 insertions(+), 3 deletions(-)
>  create mode 100644 hw/sensor/max31785.c
>
> --
> 2.25.1
>

