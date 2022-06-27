Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B455BB41
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:14:58 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sK6-0004tB-5k
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o5rxk-0006Xa-SZ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:51:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o5rxZ-00085A-Rg
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:51:48 -0400
Received: by mail-ed1-x52e.google.com with SMTP id eo8so13993374edb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eFvZLsfdGBlvibyhFd5fb9m2dvkqQTlHIMCewxOHEUg=;
 b=idna7nFiFqrSDI/vLtYqJmO5E4Wf0i7CaY8NtGeQcwUh7FlpnQKwxO9jnkaeNyi9td
 Arq8H5nVbhTQvjk4khQNm7lrKhXzx+KLwzbd4giBckIGba6CY+wjKqpyRU+We0Ovn0rH
 N9nYEs3UEJK5rFQGlEQMPDTNUJ4xQfh/5UnaDQOTf5NZ5F8IyrGKod36Cmi3hfc4mVrr
 tKWTZm8KceI68QXURUJVICPGWIVsZmmtDGAjTf4aoh0hWTimKzyJQnCze290U0W14vLQ
 5VRcXhqta/VebtXLo8aMgrCGi1/cw10jARx3TJWPQ0Vm5t+MJvIptXUWRJSpjqDi652a
 NDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eFvZLsfdGBlvibyhFd5fb9m2dvkqQTlHIMCewxOHEUg=;
 b=BeccqzDdYvTl9SiGUwsNICTMf8MeUAgzQRxYVPtj1QSyvuWmIqlpZmLv6N9PTrqoq1
 7WAXgrXVQwh9qsl4uvVo08/tMNpoTV0BfaosNZry+ud0FgSj3Hj0dQ0deIVKYzWLyage
 4LD5kcE4to1VU25sxRSODVuNyoepZCz8ofXIvblyG/HMrmux5FiEkyeVUiD/UlakCOky
 gJ9eddoEnHeSbjrbTpKDgHmS2tMxNEbdTu/MGc3NR7AVATGo+v7TH5lt2217MmGNyTXh
 F1s0u6IenEeeAIrdy+2+fkJ8Oquo5icBOPdJ6BedZpzsnIoDAgHOAt2ZSTPNLTe2Brno
 IRbA==
X-Gm-Message-State: AJIora8uTAeAMYTZNkn++znq2JFfMW7FvLT6lCSjwIB4QhdIsydICCYd
 WnyZzDukHBERBBHYxeI+/VNHdm9roFpyidJI3ms0Xg==
X-Google-Smtp-Source: AGRyM1tmnDF2g1BmHxjRYABh1xlqw5nDKGAJ1I/K+XhWUchofCnejLWDdi1wBURDBF6seAFKDDIv5zWvQtNahJVubJA=
X-Received: by 2002:a05:6402:201:b0:431:665f:11f1 with SMTP id
 t1-20020a056402020100b00431665f11f1mr17781386edv.378.1656348692998; Mon, 27
 Jun 2022 09:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <f4866421-06b2-a2b5-5c60-8a3cf3457e9e@kaod.org>
In-Reply-To: <f4866421-06b2-a2b5-5c60-8a3cf3457e9e@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 27 Jun 2022 09:50:56 -0700
Message-ID: <CAMvPwGouvvqCi4ZYxp1D3Qw-5jrK00deOyK9gLi7ohEstMnq_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add Qualcomm BMC machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Patrick Venture <venture@google.com>, 
 Hao Wu <wuhaotsh@google.com>, Graeme Gregory <quic_ggregory@quicinc.com>, 
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=titusr@google.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

You can take them through the aspeed branch.

Thanks.

-Titus

On Mon, 27 Jun 2022 at 09:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Titus,
>
> On 6/27/22 17:46, Jae Hyun Yoo wrote:
> > Hello,
> >
> > I'm sending a series to add Qualcomm BMC machines that are equipped wit=
h
> > Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller devi=
ce
> > emulation. Please help to review.
> >
> > Thanks,
> >
> > Jae
> >
> > Changes in v2:
> > * Fixed a typo in QCOM DC-SCM V1 HW strap value comment. (Rebecca)
> > * Removed a useless change which is reverted by the next patch. (Joel)
> > * Changed machine name to 'qcom-firework-bmc'. (Cedric)
> > * Dropped FRU eeprom initialization part. (Patrick)
> > * Fixed comment for a case of PB_ALL_PAGES. (Titus)
> > * Removed an error log printing when it handles PB_ALL_PAGES. (Jae)
> > * Fixed a typo in copyright in max31785.c. (Rebecca)
> > * Fixed indentation issues in max31785.c. (Titus)
> > * Fixed license identifier style and refined indentation of defines. (J=
ae)
> > * Added PMBUS and MAX31785 config selection under ASPEED_SOC. (Titus)
> > * Moved machine updating part from the previous patch. (Cedric)
> > * Refined code to avoid retouching by the next patch. (Joel)
> >
> > Graeme Gregory (1):
> >    hw/arm/aspeed: add Qualcomm Firework BMC machine
> >
> > Jae Hyun Yoo (2):
> >    hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
> >    hw/arm/aspeed: firework: add I2C MUXes for VR channels
> >
> > Maheswara Kurapati (4):
> >    hw/i2c: pmbus: Page #255 is valid page for read requests.
> >    hw/sensor: add Maxim MAX31785 device
> >    hw/arm/aspeed: Add MAX31785 Fan controllers
> >    hw/arm/aspeed: firework: Add Thermal Diodes
> >
> >   hw/arm/Kconfig        |   2 +
> >   hw/arm/aspeed.c       |  95 ++++++-
> >   hw/i2c/pmbus_device.c |   6 +-
> >   hw/sensor/Kconfig     |   4 +
> >   hw/sensor/max31785.c  | 573 +++++++++++++++++++++++++++++++++++++++++=
+
> >   hw/sensor/meson.build |   1 +
> >   6 files changed, 674 insertions(+), 7 deletions(-)
> >   create mode 100644 hw/sensor/max31785.c
>
> Will you handle the pmbus/sensor patches or would you mind if I took them
> through the aspeed branch ?
>
> Thanks,
>
> C.
>
>

