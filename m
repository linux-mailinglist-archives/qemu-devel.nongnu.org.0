Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F35559E8C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:28:34 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4mAc-0000KK-2N
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4m8a-0006xJ-FB
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:26:28 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4m8Y-0007qY-Rg
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 12:26:28 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x184so2591287ybg.12
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hzo5s5E41Fv0KHhXhiynqGOtoIeIIyCWgRBQaPBNRdI=;
 b=qZ6sjZ01SgiB/61qlpZgYVwF4BxHOCq2HI4tYnyPKgupM9Yk6bSqXJKuyWAXOqql6j
 kp/YUMtWnbrMpMtfk1I44y0QWrJjCBRQyxSYDKPP3Yil2N1HE0xLT+ghivKb2jrLNPxv
 0qGo/bDzmg2TS1ZwjcbjWn1FBNOK10b5S3iSZvN2ppli08kHz+1kUJ9pPSb2ektEtaYH
 C4jCxSGVliXVtp5yFuhsERZRDYw6X6KhWbdR1uoWHwpAFp7ayUBZl3StCMCRtEJ3+gJp
 3IGU0n5nHeGWb3vOKu7TyRxJVtxoGgU/bj9bKOGWabE9v/t2KGlAhonRmbFHZGXNPJ4b
 eJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hzo5s5E41Fv0KHhXhiynqGOtoIeIIyCWgRBQaPBNRdI=;
 b=tNNjyVtyi3IxvzoR1jYu8Ky9lE8GKl16WHInQc9RGeSU2V4o43y4Wp7dNVZvSx5Brp
 5x0O6QuBc8VfapG247LBShvH3kNagEhSQuKmYdOwxBVI/NtR2St/22BS9FFMByO6j9Q0
 I2KLbVt5T5mEQfgTB8yhikzuhdaQCqZTXOv0GxgK3G1wDlF6OtKor/reYQtKotNAA2/V
 PwMjIFl4HUk/R9BJqT8RKJwVP9qmmsNg4eixTXBqfeu5pAsOMBUZq0mZpD9mJAo3vOvI
 iYgqzwe5p0z1uBLN+znz6+FRq78FR3Me9EwaV5IEQIvkUszKGBCrGe2M2b9pZT9eqRjf
 +bTA==
X-Gm-Message-State: AJIora9en/FRURaVJwAKbJa/XOn4YpJOpzgS1orcgRVglGZSC1t6hyaV
 RUqniEjwxcKruHaFGTilSDFgRIG5Jur1dEt0Mm635g==
X-Google-Smtp-Source: AGRyM1sKxDUs8ghn4AJDdgQNjwJQU7hF2AVdRt4f8Gcz7DyFzsQoi398s8yjmIePB7vGbgMJemUA/E1M9o/EXQxpmF8=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr13023171ybk.479.1656087985804; Fri, 24
 Jun 2022 09:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220619001541.131672-1-richard.henderson@linaro.org>
 <20220619001541.131672-2-richard.henderson@linaro.org>
In-Reply-To: <20220619001541.131672-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:25:48 +0100
Message-ID: <CAFEAcA_cp9iSK+V2VV0cDXAz0rRtkEGOWiYF-33eDgv++C3P+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Extend arm_pamax to more than aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 19 Jun 2022 at 01:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the code from hw/arm/virt.c that is supposed
> to handle v7 into the one function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/virt.c    | 10 +---------
>  target/arm/ptw.c | 24 ++++++++++++++++--------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

