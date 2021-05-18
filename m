Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A631C387D1A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 18:12:16 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj2KN-0002wb-4A
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 12:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj2F5-0005mq-Fp
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:06:47 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj2F2-0001y7-Df
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:06:47 -0400
Received: by mail-ej1-x629.google.com with SMTP id b25so15443350eju.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zkc9LooPnZUpbQU+lh3TNAGdJxYUvfX3JI5THA3IFAE=;
 b=r7zpGj3a6Dz2M+kxhubNXsnvGpJgj5mlyPKspHFWVT6cRIbdE86zMC5eMFz9Hl9qFb
 G1cNGmjS1UhF2QB0UI5zEV1wM69XWS9ICBsVzhjthdJzFhiwbNOud0nTwFp32Qo48VeK
 yeikpGxRbEsJTayMxoh3OM3Xd/SSLSBtbfpn8urOastR/lwU/M8E5F7jfvv69LMwJIZC
 ydHifmT7gRX+g0YeNQDBZcxZ79Ip9PgPrE/QHJ4+PJvShqLeW3ABxOGPOOjuJx5AQSPm
 ldGFMVSWjIEH/oVNFHS2OqAXzr0JwjSoOI3tmXLYp4AnHpNcucCkXGGQEPyOcd0XqyDW
 y2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zkc9LooPnZUpbQU+lh3TNAGdJxYUvfX3JI5THA3IFAE=;
 b=eVFPOZG9QdXl/PCfUyGAi2ApvbepLBDcwLu6S/vavU4+fRhvSennAlk83saK8lOHNg
 pYqMgFn5Bhf0wE9FOseRnbG1n1c6wHNO7yF1aq9tMyNz2BfeK/QuMqxx3KNvbkqlfzd0
 nwX1R1JllXQiZOt+HV1SydSDaK7pWfYMhE3KEe70dtEk+W4qjGQ+1MBG9JOVTvdbNHpC
 x6YAbdD7YDdEvVfG3KWyQoG7dS2KUgvL8I/UL27mnAPqvLOfKoefvJRO6Y8j40z3mhDZ
 yGZum+RSdUrfVocKr/BKkCv8vIDrw3kPkwqbu+wfRF/ZQcvjI6reRdas+FOwKoxCDeG8
 ZoMA==
X-Gm-Message-State: AOAM531JzOPIEoY4VTOSPjvyhruczMMnrK89UIYAjzVxMOmvV/aq+Mnr
 Qh9rBeEQXwjmB9OUFwtn2uFRT19o1Upl8eRT8ECZHA==
X-Google-Smtp-Source: ABdhPJzRPv9PIm2OCgxW4YEfCoDxGI/r+X13fijT375h6VNxyAZEbk2QIiSwKs0beuJKxXVRMoMeRBGhCUjbovf4gYI=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr6859454ejb.85.1621354002991; 
 Tue, 18 May 2021 09:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-9-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-9-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 17:06:26 +0100
Message-ID: <CAFEAcA9u3mR1ERWzE6kKsb33ZDEJX-ZabnPUJm7DLQpxHbXy-A@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] hw/arm/virt: add ITS support in virt GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of virt platform GIC
> initialization.This Emulated ITS model now co-exists with kvm

Missing space after '.'.

> ITS and is enabled in absence of kvm irq kernel support in a
> platform.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

