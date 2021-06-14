Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F453A6B46
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:07:44 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsp7l-0000tQ-FO
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsote-00024n-KP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:53:06 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsotc-0007nw-N7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:53:06 -0400
Received: by mail-ed1-x536.google.com with SMTP id f5so42168756eds.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enW6cODi1lOqBa73zLBTRFvVIBtyeyh3uErQRu8sivE=;
 b=x3xS1ddeAG1zu8cByzOm7OsHI0qbkZxj7SyPa8OeZDUMvbUhVAZxet4IVw7eShyHyY
 PkQercGdWdEZG2Pbqmqd8aCboeb21yBE3QGjeGtM8JJ6wikZotHM2j6N4cdUvjutCEL+
 /bXoHrel4i6arnBcCDzZOVBvAaGZiP0gzfDzp9n54Z12l/VdrB0hwmshZDxceyFtnjFm
 bGUCv5z6+MEo3hMiZ+LnnmHp9SQZ7zuKlwebPpoJFdF8q8psWDnA+z8zfy7SQCcUc1iq
 XEw91HRDa26wJI/qjKWkmCP7BbT8KoTty+AyzbmRZcax3aESnHVHLCPjAfn8rrYphyT/
 vTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enW6cODi1lOqBa73zLBTRFvVIBtyeyh3uErQRu8sivE=;
 b=TdYQcB/yMglz6jqIymx5B/q1fgq+SZY7ZiobxTPcjrxK01IRGskz/Nli0lFpuFtFcr
 ng6g6KUlMDiMA7h9alIMry8h6btxEt2Av5vy++FDHJPa3hM5eR6191PQVg6Hm+b3gz6Y
 EL7RkMO198CiVcyqNRA9YCk5MPVVMKxjc7j4h2omOrU/Q3TmI57bcSe8c/8RtTuZm+M4
 Guxye1u+UmNU5qA2WMiuMRGuWPe7L1KScW+C7a8ZjYZiXoORUmY18Mbp2qjGQyp3+Oz0
 8cPY4T9d2hbCbl5qUK6OQpuqZxyWjomCQcLOd8aj9wdUmqBeLFwZO7TDE5xZfaDCriO7
 zEqQ==
X-Gm-Message-State: AOAM531RKLWbO7A3MldlW85WudlDsArDwsFwu737Hb92YrzniyY9Qari
 zm24MwlUykL3qhA3ekPxwJiR4a8nUL4WJXjLt7QKkss2TKU3Tw==
X-Google-Smtp-Source: ABdhPJx5m2ih//ydaGy+2/MOwIVaI1e2kavYEpUjZCznC26zF4KPUWPXs6URUYMLg4J/vbAFxomU0QUsjEFgQcsYuD0=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr18049253eds.146.1623685980406; 
 Mon, 14 Jun 2021 08:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-3-erdnaxe@crans.org>
In-Reply-To: <20210608161028.4159582-3-erdnaxe@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 16:52:26 +0100
Message-ID: <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 17:10, Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This is a Cortex-M3 based machine. Information can be found at:
> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>

The commit message says this is Cortex-M3 based, but the
code gives it a Cortex-M4. Which is correct?

> ---
>  MAINTAINERS                             |  6 +++
>  default-configs/devices/arm-softmmu.mak |  1 +
>  hw/arm/Kconfig                          |  4 ++
>  hw/arm/meson.build                      |  1 +
>  hw/arm/stm32vldiscovery.c               | 66 +++++++++++++++++++++++++
>  5 files changed, 78 insertions(+)
>  create mode 100644 hw/arm/stm32vldiscovery.c

Could you add some documentation for the new board, please?
This lives in docs/system/arm. Commit c9f8511ea8d2b807 gives
an example of adding docs for a board.

thanks
-- PMM

