Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF348544DBC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:33:11 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIHe-00083i-Aa
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG2h-0002a1-4B
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:09:38 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG2d-00019m-UN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:09:34 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3137eb64b67so35670647b3.12
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y4RIo8lMEbYK3e591RWrfwNxeZleLc7RAKGzQTE9Jlc=;
 b=T218kZECvPMuSoGpT9GTxuH82rY2oeoCXGn/cHIR52Vt/Qkznnv9wEqh49h1UO5VPk
 S3cv9VBGC2Cb/hv+uhbPTEDiwxLurl+B4Gm9bUona+aAuWHHAFX5gweIixBjdwDjtyT8
 m8PzWTU+jeCCThJ1qdIxVrCK1SMGprRJ1NEHMvrV7+/zl7QdXSZUsd3Z5wpVQP3b7AHZ
 Ev9hsowwNc7I5FMik5PeLgbebNsaSDLLvaeOmoBLnnYGj6V0iqS+vfeBRPrMZexaDLvk
 SGbbb7udhFxPYb0lDL9jHwwhsZaOLu3BZOCSF2Tjsf6ShknU/1+eEPNcykND2WS5Gyq8
 TGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4RIo8lMEbYK3e591RWrfwNxeZleLc7RAKGzQTE9Jlc=;
 b=RyR4he7Jdi3L5ssrIlZ3qCPlQVO9EVf6m9sUya0Iw+82AA9Ug7MB/TizNwM3GJakmX
 aYpz869ABS0wHN3UPYEZARJGqarxWUs0Qs9vaK/IW9A8cifG6ckX9E+AF3RY4KPxZkL7
 jeDwRrTMJOXbnuD3sYZVSFds5ym4Gt/Lv9+VHMezhpjLn/1eKDJxrxqGeiYfxd9HSIxu
 yRNLUWELidAgkfu2RLtG6h3edqTZGn5sTq6f4chQ0FbTu68Cyb1uEefVfDfHtiEVNL8Y
 S2EhsiV3Gms7onjiw8gzI4WITm395IA/5yBoQOorqBK8x3IkdJpPAGWg7+/jpFao4qUd
 1ZBA==
X-Gm-Message-State: AOAM5318kmbNNUIkT0Y3hpDanxhYLgrQUavZDMIxTg/xgWpeVT9rfL9Z
 njdCZ4MU2JzAHXiLmOpLU4DLY/RW031BmLL6PPt9MA==
X-Google-Smtp-Source: ABdhPJxrNL/zEKyid2JjWej2I0Yhdi+2U+KiSRkrepmNUBZOiCOm5LZ26zzLmzD2dhabLoEEJeO5p+yWPCxq9xf+BSM=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr40968081ywa.455.1654772970121; Thu, 09
 Jun 2022 04:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-38-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-38-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:09:19 +0100
Message-ID: <CAFEAcA9rx0iz0FA2C8nefWtHtYKf5-OviyqzuG+_PLGJc-mfzA@mail.gmail.com>
Subject: Re: [PATCH 37/50] lasips2: QOMify LASIPS2State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Currently lasip2_init() creates a new LASIPS2State directly which is used by the HPPA
> machine. Introduce a new LASIPS2 QOM type that will soon be used to allow the HPPA
> machine to be wired up using standard qdev GPIOs.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

