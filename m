Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9DD4A9D90
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:19:40 +0100 (CET)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2FH-0007ym-2P
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:19:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2AI-0005TO-Jn
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:14:31 -0500
Received: from [2a00:1450:4864:20::436] (port=42820
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2AG-0006Wm-QS
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:14:30 -0500
Received: by mail-wr1-x436.google.com with SMTP id d15so3791978wrb.9
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cMp5GXWifbsDRQz/PRIW9EDidnx8bTrMAZ88QWFGhs=;
 b=mx4AEzxXO+KH4gqSV5pSxi+FtoG0k9daWV747HZDQ1BkUiDkvfgwaibWpWZwZZz5/K
 sBiieHh01krhQn5JyuUkWVLYCMFiq6tOD4XR+Q9rv0SKO1BMdidTHUD0N/Zdb9QXU9rW
 9W4O+4wVXTDaeUf1u0Sq2utIi4KiP6ZXau6U4eh9V5Tw2PeaJR2ynLirgE8jz9Uf14Ft
 kNFr4tBkoyXr56uCXce3FMfUP4rFeYsGj0uBNfBn57vMj1NL+V2/o89nS+27OCKtKhvf
 wIVDkM4F7nNjww2hvRfATDeALwRxsHm7he9R1Un1mQFowlGkXuaTFlrqEfnRwSYI5X7q
 L5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cMp5GXWifbsDRQz/PRIW9EDidnx8bTrMAZ88QWFGhs=;
 b=RWrgglaH0l+0HHbG+3UERmy6wGIxRoMStVA+TrQS6d5d+kbdXTTNrJQL/tNRy7NH81
 olWvhOgFuHF9+nc0gFcVki1MDwO++QkWjGf2DLemxUiqfSWWV4XnJjbATkqxHAMKyDWk
 ADwSGW70ourdNoFfuew6LD/d1Kv4g0z8+jHmg3Pl7Tq4ktAmZX3pFJ4jmixU8Hbhk9ck
 LptJMG0lXVGbGL7ziHw7P5/7MzcsQAYlvXDsP2Whcvwg82TlvElBTzXD3Sjzzt5ke6p3
 ihcedNK0aZGkAh4W8Y6uUYaz2+mWY7/4aPLhxRndzc4x8FOAb8nqAIwMG6b3CLmfEAuD
 3eew==
X-Gm-Message-State: AOAM533ZyAtfgZ7Eda66pK/JCnpxiT0+h7CzxokyouqBGFL/UKkth6C6
 TWeoUmvH+8eo9glxCgam4r3Tg2cCNPSAO6r3+CrCHA==
X-Google-Smtp-Source: ABdhPJx3RTarmmmmJ//ozLFnqVkcWHIKAa1f+l4RxbJAWUIZHUXPsUTN6ZBxAQPM+SRKaKqM3wJv8aBqAPZC1H0BmVo=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr3376410wrq.172.1643994866983; 
 Fri, 04 Feb 2022 09:14:26 -0800 (PST)
MIME-Version: 1.0
References: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
In-Reply-To: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 17:14:16 +0000
Message-ID: <CAFEAcA-bn0mQw5Xsn4+-b6_Qa67TViKsVK4uVmNmNkkcq5FqTw@mail.gmail.com>
Subject: Re: [PATCH v1] an547: Correct typo that swaps ahb and apb peripherals
To: Jimmy Brisson <jimmy.brisson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 at 15:23, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
>
> Turns out that this manifests in being unable to configure
> the ethernet access permissions, as the IotKitPPC looks
> these up by name.
>
> With this fix, eth is configurable
>
> Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>

Can you explain the issue here in more detail, and maybe
provide a repro case ? The AN547 document definitely thinks
that APB PPC EXP 0 has the Memory Protection Controllers and
AHB PPC EXP 0 has the GPIO, USB and Ethernet devices:
https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
(tables 6-2 to 6-4 on pages 35, 36).

thanks
-- PMM

