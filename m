Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C249EAA7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:56:54 +0100 (CET)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9wr-0003nQ-Ds
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:56:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD9ew-000834-15
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:38:16 -0500
Received: from [2a00:1450:4864:20::333] (port=54001
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD9et-0001pA-Ag
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:38:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id n8so2573194wmk.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 10:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q6v17n9HAxjPVsN5eEB1JV+1qlKp//pqJpM4+FUnNZc=;
 b=ILZ0aDzBX4zQ82ZtgGxrnncIjPMVP4YAcM+MKgqsMooszOlJzCTyqcUrQfV//6vZjU
 igsC7ri8IgnZ1xgfIy+WR4gDcJMrTQpd7BkCDCGyKR601U6/txXS69QdpItJlt+AFrOM
 ut3/7x6I7xqkqg2Cv3GNQBPN941LyMrrBWz6pxLnLXLP+Ylqjf8uXEa7MyEyPspeeCBb
 ICZRS1eun73/K1PJSNFvqpTGasmcWviKnZ7zYcM+spWKJ1JCksOVjB9Lr6N/DcoHKu7F
 AMgySH9pawV8uwqJhAhHYg7riiUYZR/xU5Yh/wPHgVYUzaxpsJAN01J84DcW71RNzAqw
 J0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6v17n9HAxjPVsN5eEB1JV+1qlKp//pqJpM4+FUnNZc=;
 b=fG3ehyiZFe42QCm09a6kftrBgwF/c0GkeLlMKx53Flbd2hnduZcNVUFjghHCI4u8TW
 4Z5f6X1JplgutLnW6Nmq8mGfPebiewozT02i+KQRgF9nSSvBD/YW4U9Fy0VKhXv7qVKt
 heUJgLSfBXDV5PGJf/9Q8nFTbXFpfAElRrfOQj3uanEgJxTpFIOlEMLmMgJdJquwwqH+
 ZO1Ye8zqZZ1iU7dHqeGcb6c72XyeETB3SUGykPZuD+4o/CnCZog8VR4yqJyqvTqE6RAs
 F6VR7tgDUmt7u5mCKM8MYjVKTix3kyeCPGF3kG2DdxWBd3GpuOWqC8amk1+DAk3SYB1H
 laDQ==
X-Gm-Message-State: AOAM531BUViJIAlF8553JX7Lz/ZomN8oqNSI7INWB2e2qqlX1rmGlcgR
 yM/L1xqbjC/QSP7StLMp9ockYvJVPD5bFTD8hoKixw==
X-Google-Smtp-Source: ABdhPJzkvCdOyhvOj+F2sue5dq2n1HocN8AknXbOrMnbOUtff5VAoOC0dbbdA1vOQkjbihs/GXhgyjtR59GfkcuXZjc=
X-Received: by 2002:a05:600c:3551:: with SMTP id
 i17mr12814701wmq.21.1643308687885; 
 Thu, 27 Jan 2022 10:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
 <20220110175607.591401-3-venture@google.com>
In-Reply-To: <20220110175607.591401-3-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 18:37:56 +0000
Message-ID: <CAFEAcA_KdE6GtzvCGShtYWSENDcp7byV7o25OumrR6Md=5K0Lg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm: Add PCI mailbox module to Nuvoton SoC
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joe Komlodi <komlodi@google.com>, hskinnemoen@google.com,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 17:56, Patrick Venture <venture@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> This patch wires the PCI mailbox module to Nuvoton SoC.
>
> Reviewed-by: Patrick Venture <venture@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

