Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062763141EA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:35:57 +0100 (CET)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ECK-0003g2-2h
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9ADF-0008Co-QQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:20:37 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9ADE-0008Lw-5H
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:20:37 -0500
Received: by mail-ed1-x52c.google.com with SMTP id t5so19276486eds.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pb/FL2gxWBCn2MPXFktPxv2/ivGctJtsLMBYhS0Dm94=;
 b=H+entsgEpURvMANRiqnahqZBb6cKtmVjYvpXHSpORHbEr1x3BP3uN010Ac8tP0aEtt
 Zv+LYya6FRVjW3WiRz6ETIydELo8LbbnIfeoTWGjQ+0lkHxxQ0tOT7ibT5jLzn9eU2QU
 s2P036jNqoIjIpoSa9uVUjx4wBrysOIeEK6Yv4VRdl+P5M5PEMdBOrQIxN2+JcRrG6uu
 PHKHum6fEMZGSrupI6ZGwo49EJ+7adW27r0bnc5XjdPpci1Mq1omqxQAKyVB9Yvoke1x
 szev8WSTHJc+pSyGLXqYxGZRUzmL7/R484lYpXNqiueOjodk4sNs/nNBrfbpu93SzTY3
 1Tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pb/FL2gxWBCn2MPXFktPxv2/ivGctJtsLMBYhS0Dm94=;
 b=jYGc2q9J/IoZe8umswocDIHVYsbrQNfyGDHse/Hm4U9ZcAsv+g700I644+CqqkMut6
 n8OavW7RebKGw2EVwYbMqpjxQQZ7jC1W5ZmqpTuSu8k1/e556NgNj7olF59Zrl5v8bZe
 +rQUlYzwsM5wMg2Nje12DgUqxtufbXMf6l4YqidoAAA5fQSENyihPR+Dgt9O+tTwu9Mp
 aRbSuGsCZXWCZZoYDNgHDlaXDI8nmecsBujPOFDGLKGd1JwBc3xu942NDvwpH0bOK9SD
 YztyrUBQxkch2gsb0fcbAlgAOQ+och7a5GdYr6xZrTILaVyYz0drTheZjfHL1QrY//Q9
 gwTg==
X-Gm-Message-State: AOAM530MvFd15mXdkNmrgmB0qcsLc0hvzYuufsYaV7eVxGqJi1DwcZSi
 dmw+DUWa2iE0vD9nF5eNw1aBLT+XFjPPebhmXMlxgo9BH/c=
X-Google-Smtp-Source: ABdhPJwL2+vQq0tvuCVapQaaN/kLhnRus4ZRRDtL6N41i4T4eHLVMH+lpZsAsVsNjxaJHnCYZ4MjGRdWRVahwd47FFU=
X-Received: by 2002:a50:d307:: with SMTP id g7mr17203050edh.204.1612804831401; 
 Mon, 08 Feb 2021 09:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20210202232838.1641382-1-dje@google.com>
 <20210202232838.1641382-3-dje@google.com>
In-Reply-To: <20210202232838.1641382-3-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:20:20 +0000
Message-ID: <CAFEAcA9uHP+2_DiV8qPYM_HkCewWu9bORce=K+7Lz=HWDjBvpg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/arm: Add npcm7xx emc model
To: Doug Evans <dje@google.com>
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 23:29, Doug Evans <dje@google.com> wrote:
>
> This is a 10/100 ethernet device that has several features.
> Only the ones needed by the Linux driver have been implemented.
> See npcm7xx_emc.c for a list of unimplemented features.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  docs/system/arm/nuvoton.rst |  3 ++-
>  hw/arm/npcm7xx.c            | 50 +++++++++++++++++++++++++++++++++++--
>  include/hw/arm/npcm7xx.h    |  2 ++
>  3 files changed, 52 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

