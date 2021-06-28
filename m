Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D753B6019
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:19:56 +0200 (CEST)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxs78-0000bt-7S
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrw8-00044i-Mv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:08:32 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrw6-0001tL-CR
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:08:32 -0400
Received: by mail-ed1-x52c.google.com with SMTP id i24so26122106edx.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EFLrL9OrLLi2HeINqX7M48N+rOXrbw+6gHzvInvhcc4=;
 b=fxQM8PWijU6VV8jANRH++raNoExFi/g8DaPwunMzle6/TEkVCJ+qL7mfgOB8cz44W1
 GaXPDs+Nu1j6KyVQrDT7FuZOdwto/K/B45i0mbLDDKvYPPHVWHBILPrMftvsOPbNiIM7
 /A6MzmhMokOdR5R3y+a+1UJpryTI2aE2ESAsm93Wn41KKp6t62wPuBOruRyMxzx1mxu9
 1oFUuYsPvtIE0tAJpAg+Ph6R3MFh1py1pT1mx3jgj0N6DRNQ/AyBqQk1Zs4aE1UAyewl
 T69+1EWra8kdArLBUuwjaU+eiaSQgZ0ZPomju+VVOz/3VYrLudwiDoMiPiLWvyvKzh35
 NxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFLrL9OrLLi2HeINqX7M48N+rOXrbw+6gHzvInvhcc4=;
 b=lMGvDCMKLxg1FnBEXR7qcS6YV2FJpL/tdXhzQ9n80Szrrzt3UwoqbU4tnnudcmva6F
 31e9O5TBtS5dK7ocL4fsnkQ+8ylfY08J6VAFv+VeTxGC45ry/y5T0JHfGbB5Xip9PGxR
 eC0Siqpg87HAPDvMH7HauQawC83MurMQNunv6Yfg7ISqxaRtT3GTAp9slTEJqBQmMNtE
 2M+RrR9xI57HbSB1pHHCJ9ZXOFuPs1qE6ah+5y2VNmC+4+29ZnlNOhwMr7Sg3t2/LA83
 zCwS6sL5A1FRUaNufbYOvfuRDcw9IRqiS01HNLM/C6dr2qSY6CvK/kQw7eQKpmMGHng6
 jKyg==
X-Gm-Message-State: AOAM531K8oLX1BiLXxFYnYVbFxoF8DtyBX7Oph9THZAPmJkM9PeC5lUX
 mRhQK8436IKwOzFUa33v8mQWjiWHfxhsQUEK3Y7Mlw==
X-Google-Smtp-Source: ABdhPJzOA+a00TcNYMptspL8au7rDeulgKv3QElU7D8hCk4Pvu7mHZD5ymDxO17JGqdmi3KK6nWVa6i0XbR9Gc8vGWw=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr33110745edz.44.1624889308918; 
 Mon, 28 Jun 2021 07:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
In-Reply-To: <20210615192848.1065297-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 15:07:52 +0100
Message-ID: <CAFEAcA9mqyn6J-W_qiZ_T=JbsBuahZuLAXXc8c9ASarVASbg7g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Updates docs/system/arm to include new bmc machines
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021 at 20:28, Patrick Venture <venture@google.com> wrote:
>
>
> Patrick Venture (2):
>   docs/system/arm: Add quanta-q7l1-bmc reference
>   docs/system/arm: Add quanta-gbs-bmc reference
>
>  docs/system/arm/aspeed.rst  | 1 +
>  docs/system/arm/nuvoton.rst | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

