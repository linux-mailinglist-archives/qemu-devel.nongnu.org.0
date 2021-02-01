Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E6130AD89
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:15:53 +0100 (CET)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cnp-0007eQ-0I
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cjY-0005bK-2K
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:11:29 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cjR-0005fY-RY
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:11:27 -0500
Received: by mail-ed1-x529.google.com with SMTP id c6so19768655ede.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEESc4F3S0N5RVPdvkW6JAOxHzeW4SUzvkJlAr5AvO8=;
 b=pvXoGfcMFkDKETsu/Rt4aaaORAJrxp0p9qdL1tRE/iueWrcCqfFxcmL3CMHmiiaaiU
 sHPYpBymuvSoY6xmtIryIgg4OI9QdYjayJAILmLA5h/ttxzTQweyOACpG8ZzK/Q8jUrP
 EEcWqxdENS1G6R7baMjzPejawF4gLQxwtVEoNSOxNQX5CGICqQ7gpU4pZyjm0x7r6i+p
 y0G9L69bKgEBORPkV1e1To1jBHoJWUQaAPsQ0iWeJ5xul7xWxF8iewxvFgb5/OmiZo3h
 Qi9jxwzzGKhEZWQ+fRG4PzCqpkZaDlQj8LulRmKSfCVQenIlUPgqrdxJQ3xEFkbDoO9k
 Y8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEESc4F3S0N5RVPdvkW6JAOxHzeW4SUzvkJlAr5AvO8=;
 b=QpMHFJfHUORU9wyAp380V1xdEEsOq+sMBQRVJkZMa/h9NmbUbEdBXCyP1n9QILhEda
 aGdu3bvV9E21zGnm4xjNpotLFwpA1BIbw2eFluqQSHLlkC3SuaoGpLaHa/AgSZ8GUOQh
 HlLYzUB8qJFhJwmbw/gBH1tbi/H3MtS/dIGnck+Xa3LkOZpt1tRjxSYFYfRPBb8422KX
 FnKRT4mdRPkDjxdeK20V2xpmKPLOK+TArkg3CqLRrRD/e5Edw783gAt387GVPxUldrL3
 K4Azp2cj4dbmgd/QYvE264P8ZxMnhJT4w5t17yfWZjhNPqacaRUu0B8uoz7ZUj2o6AtZ
 9ZVA==
X-Gm-Message-State: AOAM530VhtmXBK4mXTwi824QZhNr9q00BuFV9Lws57VNaqtCqjGt5Ywn
 vCwNcLvbnMIcmEJ/oC29zOzaB10d6eExLevBI1lb7g==
X-Google-Smtp-Source: ABdhPJwtMCLGNcAZ1CDkZMnwkNWGFrMiYsfqoy9FvbAJ+sf0+Xlc/AWSOPaSyUnNDRdwd3+bd59PXIbvM0nMGhLGCmk=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr19781738eds.204.1612199480390; 
 Mon, 01 Feb 2021 09:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20210122003226.824488-1-dje@google.com>
In-Reply-To: <20210122003226.824488-1-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 17:11:09 +0000
Message-ID: <CAFEAcA-YHn=SUM5X1ziB03iOw_YMi8BidF9kCU5crYf14zq1Aw@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Add npcm7xx emc model
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 00:34, dje--- via <qemu-devel@nongnu.org> wrote:
>
> This is a 10/100 ethernet device that has several features.
> Only the ones needed by the Linux driver have been implemented.
> See npcm7xx_emc.c for a list of unimplemented features.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  docs/system/arm/nuvoton.rst    |   3 +-
>  hw/arm/npcm7xx.c               |  50 +-
>  hw/net/meson.build             |   1 +
>  hw/net/npcm7xx_emc.c           | 852 +++++++++++++++++++++++++++++++++
>  hw/net/trace-events            |  17 +
>  include/hw/arm/npcm7xx.h       |   2 +
>  include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
>  tests/qtest/meson.build        |   1 +
>  tests/qtest/npcm7xx_emc-test.c | 793 ++++++++++++++++++++++++++++++
>  9 files changed, 2002 insertions(+), 3 deletions(-)
>  create mode 100644 hw/net/npcm7xx_emc.c
>  create mode 100644 include/hw/net/npcm7xx_emc.h
>  create mode 100644 tests/qtest/npcm7xx_emc-test.c

Hi; could you split this into a multi-patch series so it's
a bit more digestible to review, please ?
 patch 1: new device
 patch 2: add new device to the npcm7xx board
 patch 3: device test case

thanks
-- PMM

