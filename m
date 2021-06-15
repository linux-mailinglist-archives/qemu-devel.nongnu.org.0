Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4723A8634
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:17:19 +0200 (CEST)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBkc-0007bi-A2
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBH1-0000M3-Ul
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:46:45 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBGt-00028P-6S
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:46:43 -0400
Received: by mail-ej1-x634.google.com with SMTP id nd37so15619096ejc.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bV7c96rHNe2WmjgcB3+xFNRZavyNgVjiMdEmpMT00Nc=;
 b=QVI4x4rnM5Sswa6UDuJOTiBkfbVXRon5e0BkNRrVN3WHNCR6kMXIof6JOdPKqMoGLm
 VKNyzSOFdAlO6JQS+mgzJVy3uvb73gKiWafnGgHmgL7BQeAe8AsVJHFamES9AgJJjXXe
 iLNKDPAdqv8sVtgNVt1Zo3v6+6gtY1/AU2+tuYT7UVp9T/u5+nxsDInf+I0QpRWuzY7V
 mbQcxLYbsJFdHpYUFrz5q9os+zu84HScQl6MHiwOQjBSUslFCM7DLEhvZYUMHN+SZzAL
 EQ4ZYDpaw1FDsg9AVHhgsrylycNHCa9X7bDKZA4bz8Z+pFoJg4/znZQBED6jcflw5R4n
 biqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bV7c96rHNe2WmjgcB3+xFNRZavyNgVjiMdEmpMT00Nc=;
 b=SRoMKgxlmT8sKe3xmT76YlfDHl4hZ9/7unmZ/mqafgMRlaJsV8jvQ3o63SEsziOZWL
 LCCqqxacWu+8RjcSOEIbZrxus/PJsREfnbUcxADZRMYLgt850KtV293Gt+YgOuNadqKg
 LTqh1Udx+NVM4GeoM95K0P1opxAIjNk4WtxpIyaepAL8LwL3oLA3kWn4EN3N6HpgUDLS
 AGD+ciR9uR3iTRG97RAmRCphWL1eMihb0j5VoZ31F11E5/8DPCEEu/TtIEfYeJob7LR5
 g/ZLJq/kAnYubRzg8r81vv+XXt1kdElGVWQdEQltTnAHBPNjEUNkxbeuK1DiKDRWqUdW
 yHDA==
X-Gm-Message-State: AOAM530uMdvSUpnXmkcfC3JriJSfCZbRM/aEJjr9zfcGZxSpHobkLc9W
 woo2C4jE1sw9e9FkpZo07ccoTnckwjAtTwUzilpvEw==
X-Google-Smtp-Source: ABdhPJysj/oAEtP6U419YESdxHU1C+3n4r6BeaElqCSXBInknN4aGhSihsN/29IzPwh9PVuSzOo/H/xGNP2Y9N77yww=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr144058ejy.407.1623771993240; 
 Tue, 15 Jun 2021 08:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
In-Reply-To: <20210608193605.2611114-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 16:45:58 +0100
Message-ID: <CAFEAcA_gbkwwZw36UuA5VC3dTn345bxcHGBiJrnunytrphq7Jg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 20:36, Patrick Venture <venture@google.com> wrote:
>
> This is a board supported by OpenBmc.
>
> v2:
> - Fixed missing hyphen in Cortex name and dropped TODO on hardware
> strap value.
>
> Patrick Venture (2):
>   hw/arm: add quanta-gbs-bmc machine
>   hw/arm: quanta-gbs-bmc add i2c comments

Forgot to ask for this earlier, but could you send a followup
patch that adds documentation for this new machine to
docs/system/arm/nuvoton.rst please ?

thanks
-- PMM

