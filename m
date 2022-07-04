Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6B565A66
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:53:53 +0200 (CEST)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OOW-0003S0-MC
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8ONb-0002hr-NO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:52:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:41818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8ONa-0007Ik-5Z
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:52:55 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c8bb90d09so32049107b3.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qrJEiWWPU/RKCJdb42vzNBINDtCcBLu8oBNm0JW3cVo=;
 b=WOfbl417F2sY/qT0QPFI4SWI2pTEpwPpd4zJ1PLEs9yvRCJv9BEUJTZ4zcllNum0ir
 dZXMU4V3Y2iPxXTeOjK8BysjEtepYz/EcDH4ULNUl0+iDSHqzCmmZGYDFyPrw0RDFhc5
 AmyB+kLVaE6wsdg158FxFHiDc4ljyfaCy8/d9bT/q8nA24nm6OY6eyEiC9bfUpg0HYgL
 j8k5Lng3l2Fbj9tUUUrf3juMoFnIOS0HS5KlivTm7ILPdjr3Y+Bil8sM07vb/B54lSR+
 9JdRDYNq52lkmzDvvDkp4PQnWV2B5dnbPDEdDqv1sWfLpzp7u1TOgWB8Z2DWsesjLpJE
 /x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qrJEiWWPU/RKCJdb42vzNBINDtCcBLu8oBNm0JW3cVo=;
 b=uYT2FrJC5K8rbxLVr3gOoqq1pm9N/4hnCxYi8oCvE4aM6Bn+bMWTUXYjs4FIacvWWE
 BsXhihib4BiTgFrPZbMzy2wbhnmDh/8Kzx87OxYOELwRkRIbxu/F9XsThjmhiR1IiZvE
 NW7BOd+Iv92HJfHGBETTzLrBTbdPFvhwZVPVThQw/jTisCZ7dpXIPzPXxM6ayhskl9J5
 bz2RiBntydaLb312uF9ySEm1TnEomq/DMlMD/kxzK8G99QVXSo8Z4ChSMWjFLWqzqovx
 0ELa6y4Y3t2jpn7Ru/apLnGV9xZDmJrreCywx54nWSoAOh3WLZAGyp0iCs988SZCATes
 mNIw==
X-Gm-Message-State: AJIora/TGWSCjyfMLnX/AuxYFag/TDFo2MD3oBMv+QrzaUTXwQWeriPw
 uU/lwJO+1Wgct+Mn7AALcTKfPtmCLzFj/Y2XbPTgJA==
X-Google-Smtp-Source: AGRyM1sPFvjXkMzf59+2s1skb9zRVVA2Z57lTa8o8NwPd8IfPnk85xYgEBbVgliiqGONZp8FZ0fOIury1SLpRoTzdYY=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr12078870ywc.64.1656949971703; Mon, 04
 Jul 2022 08:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-5-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-5-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:52:40 +0100
Message-ID: <CAFEAcA9=cKaD=LoBheRfU610nOQVjVWmqCT=ONUpD6OhBX9WxA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] misc: fix commonly doubled up words
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---

> --- a/docs/tools/qemu-pr-helper.rst
> +++ b/docs/tools/qemu-pr-helper.rst
> @@ -22,7 +22,7 @@ storage fabric. QEMU's SCSI passthrough devices ``scsi-=
block``
>  and ``scsi-generic`` support passing guest persistent reservation
>  requests to a privileged external helper program. :program:`qemu-pr-help=
er`
>  is that external helper; it creates a socket which QEMU can
> -connect to to communicate with it.
> +connect to communicate with it.

This text is correct as it stands, and the change is wrong.

> diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
> index 04e199ec33..6cc1f5d932 100644
> --- a/tests/qtest/microbit-test.c
> +++ b/tests/qtest/microbit-test.c
> @@ -449,9 +449,9 @@ static void test_nrf51_timer(void)
>      timer_set_prescaler(qts, 0);
>      /* Swept over in first step */
>      timer_set_cc(qts, 0, 2);
> -    /* Barely miss on first step */
> +    /* Barely miss in first step */
>      timer_set_cc(qts, 1, 162);
> -    /* Spot on on third step */
> +    /* Spot on in third step */
>      timer_set_cc(qts, 2, 480);

These changes also look wrong.

The rest seems OK.

thanks
-- PMM

