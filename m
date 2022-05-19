Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE9652D247
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:20:20 +0200 (CEST)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrf8X-0001xT-OY
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrf0j-0005cX-VR
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:12:10 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrf0h-0001DT-94
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:12:09 -0400
Received: by mail-yb1-xb29.google.com with SMTP id i11so8666734ybq.9
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BetFvIc0HVsaHteoQ6Rjz1VwkaGhJjTCasD6WIXwSM=;
 b=NqJk8MGLheXUYWFaT1tl8PNvo4A6IL2fe6eq4Irk4y6AYJsMB1MyYnrCkIluHqlrR7
 +yHg96uaFZ1VdqYYm2fhNiY1ii9xLQWDczFM8l4r9KbFumtgALManvc9wi7zja0fLiKY
 cdd3zNzcIhJHV2sVBGaG6jtuFRnaRy0DbhYzzFmwtJLXVsxLxvYtoZDF6QIGMJ2LBaz6
 BhV8sZLsU0vHns4k5QE7Lp68ArU/gdP2oQ2Kn6YtKynsY5xor9v4LKCAEgrY+Pnv7cgm
 XhqNx397dFdJ+d+xGGQe23K0l28ues2T48Ah9MmknC8ObNa7E8buDd47Pzy0aGce6KJZ
 4PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BetFvIc0HVsaHteoQ6Rjz1VwkaGhJjTCasD6WIXwSM=;
 b=TFskaL4zp+cEHAAUw/O03rvxkGrXHotY4q2mtgFvpr47yZFtwPUXvtN/2o07LAHvu0
 S4QE5RaWePCrv3SF46YA4LJVShv1UynM8WJ9m5gh9a2aC5fV7nAu9vraXDoLXy1KS3Nc
 MAwU0iWoq/GYRIlyQ2DgWMRXb9CbUPEfbWE/v7hHVLFYrVi2s502XTD05ZuMIOX7yny4
 l+07kHEYlIMWAFRaWrGR0ROpLif9BPOISMqxnQ0nKh+G2irVUv29yZYYlYtxIxmOy/Xq
 oFC0HG2xaxD48CV3+nOHTWA/mAbP159Z/2IJhfBUyXFci/EzbrhcP+j2iYGQAI5eoTDA
 BN8g==
X-Gm-Message-State: AOAM532LIqQR97farilNW6sZL2HSJnh7C/Gu+k5Bs1scFs4ZmBt92f6I
 YY2HfEDIiu30VbGwbMj9ZtVMZLFQPWV5n2HoQupexyTwbTE=
X-Google-Smtp-Source: ABdhPJw3pH4j5CQDe9DhKc+iXzIfgXaSyVntnESMT9Rr6o4GPHkoz38kSjHIYbK/7ck7yZRWl9F8f2ETjxswjZBZK10=
X-Received: by 2002:a25:257:0:b0:64e:b1fd:2d54 with SMTP id
 84-20020a250257000000b0064eb1fd2d54mr3924116ybc.193.1652962326415; Thu, 19
 May 2022 05:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 13:11:55 +0100
Message-ID: <CAFEAcA-8NFhgZEYdbT7wFSOPdMhNhO4jSYYa+Ff-+1Jm-bLvWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/arm: SME prep patches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Tue, 17 May 2022 at 06:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   * Fixed the errors PMM noticed in patch 2.
>   * Cleanups for SVE vector length selection.
>   * Cleanups for SVE exception el selection.
>   * Add el_is_in_host -- I'm not sure this one will really help,
>     but it's certainly appearing more and more in the pseudocode.
>
>

I've applied the first 2 patches to target-arm.next.

thanks
-- PMM

