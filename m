Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B060937F92F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:54:05 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBmu-00063k-Q0
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBld-00056b-5S
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:52:45 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBla-0005ZS-Nw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:52:44 -0400
Received: by mail-ej1-x62a.google.com with SMTP id w3so39989465ejc.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awOl4kkRLfFKp3F8DhUo9jdhNL3A5trvAAb8ywp6EhY=;
 b=YWb3Mdn9W522tDe2aUWcFN6o1bB0/FI+MtMweTzA7ejm9zCEyA559F1+ZmndyL31Di
 AOngokAZRzD3DVTx5xp8dFFgOQEUpdo6KjVGdMftf5hSl63gQcu02x/lC4w2Wo1wUMF7
 esTrO0zDr1O32S2FHuqZ8dTajfQOpOAjVR5hff3vRXL83iCaGeBIhHVWHlLwNJ2T/KLO
 U0w5unFvmNyS8ei3iC0OkM5yQCmWin3o93bf61djdC70wion0YL9iYVmfdGaq0tazVLH
 94d3L7iOHP+92WACPNXUjCG9noafytJqtd312Se7m++2xvcE6vNc5L6i4o34rlTnl0CE
 Hezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awOl4kkRLfFKp3F8DhUo9jdhNL3A5trvAAb8ywp6EhY=;
 b=iJB7Wo5SYYTOJ7w8wxuFJWS4PN1Nq9sRAyED0Bl8dL9q2+kvqaZQ2xxoL1BPzSJIbh
 c4u/LDNmgB4A3O0x0lgS0ircK8NJggZmnXoaB4th/9wvPikp6MSryrYBA/3+hbGbiPYi
 jtG/6O/O9QmziO8TThK2LNhAcd7C13XvZ0IOTQhYPWBFuS8ZtimGZ5aXfyCvaes5y7OA
 stbU77Kh+5klxigbfGIWZVehgC02gYT/WsIrCl/ApAc+KepyNqPQJBT+48H9ZeNS0gU2
 /qhIRaJA9VEURzKh9UiA5n2QErscw5Ttd2VkiEsKX6FXsGWHJqpFHli4QpgJYIJAVKGf
 dtNw==
X-Gm-Message-State: AOAM533pyMH/cwuWaeSIFIEfSM1WovsSkjskHoeDkNYO4cz/TJRKergt
 J051ECZ95jWWSknQxEKoucbv+XPwNDnXWImJtmQjbg==
X-Google-Smtp-Source: ABdhPJzLW47U9JnNGPI9kJcVkbbNNVJeTJujLEdftCwteWTnrkKh62wilQPUzSX7DJG8aY7Au7T2Vu+bVLddC3OQxRo=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr21859704ejb.56.1620913961093; 
 Thu, 13 May 2021 06:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-64-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:52:29 +0100
Message-ID: <CAFEAcA8KJaun7ifacGbtvFboiqieB+gB3+9pcMzi7NL-GYF9=A@mail.gmail.com>
Subject: Re: [PATCH v6 63/82] target/arm: Implement SVE2 crypto constructive
 binary operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++++
>  target/arm/sve.decode      |  4 ++++
>  target/arm/translate-sve.c | 16 ++++++++++++++++
>  3 files changed, 25 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

