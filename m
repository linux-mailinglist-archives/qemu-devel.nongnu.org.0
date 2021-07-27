Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E33D7BE4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:11:35 +0200 (CEST)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QcA-0004qQ-7w
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QXJ-00031R-FV
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:06:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QXH-0007zk-UF
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:06:33 -0400
Received: by mail-ej1-x62c.google.com with SMTP id qk33so4654957ejc.12
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=erqCUn6fHQ6JNAQyZL50fVbjnFuXlzyqyq8g/oUB+wk=;
 b=zP04g7h3nvC+6238kd8VkjA/AhJfe0QlhKNLNdF28+wbAXsM+SS2AO7daNVW8VxK7V
 2IGUXppk1pmyCUeM9ypM6Wp5D0eo0fLl91eBxMn6wBxz52In8MNePWU1I8T2ccrEj531
 FRDnqA2lxDXzAK/Vy0Huwn4pIsBr1ZtA9YM4LQP8z/268I/+twI/57AiZcoRhd4ZyDmb
 OjO10xCkMKn6TnoTDle4yLsDApNwjFdFjgvNRk3Ax+tZPC1V2uccAUmvmt06h1a92aiH
 a7SqJPNw4QVhhO6Y/s2T9qLi5XQ+Ecs16iwmGl5s1kZQ+68dqogr1e/DxNvk5QbMz0jI
 gquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=erqCUn6fHQ6JNAQyZL50fVbjnFuXlzyqyq8g/oUB+wk=;
 b=i4KaogpeSnhZtjZQ/kRJnwCasFV0r+f6JeisNtGsVq6RApX+yB4d7hmgkMMSnhmzYy
 B8OKDTY30eqmiKHsBkYj6E4VwINyKdskwe6CmNqf9TxlDwqWRLa+7fLk7JpXQFAdbOl8
 TSATesh3rtW9G6dki/eMB1Qbtq+KHloij1zZSEMLL7Nk11X5cK6qZ6XQzDxuH2YMUb9S
 Z0/mYtTVUBT4jIiLkuJ4hjWHzWMyPxaMiNOZV2sMlTHIWbQgiAm4OUOzCzA94YRIqP99
 R0WsQ9UGJhoZmhFuIZ8+CpHuBRrD/KEIuULjVuOVJmYCwTlsGN60HyyTEiwcy3JDTn9j
 zyzQ==
X-Gm-Message-State: AOAM532ElAWOg/dI43ChSI3ZurxHLkVAC0Ugg8EcfGQAFKJmBF5WG8K3
 ReL3oaNdX2PCnuz1cPRFoffnLpqI9/DIfRdPhEtH0tc3zWM=
X-Google-Smtp-Source: ABdhPJy9agYXxpu9EmrbNrhvBSw3RcIvv3dt6FRyumchL1oBCxD+T7tAAsP85x7ovTBPuX1ULHYC+MQqeMqPfhENZI8=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr9535695ejb.382.1627405589724; 
 Tue, 27 Jul 2021 10:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210727104801.29728-1-peter.maydell@linaro.org>
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 18:05:47 +0100
Message-ID: <CAFEAcA8=qgwVZ7vVK_jbwGdR6DOn30Y2avbpp0GUNcib2E9wVA@mail.gmail.com>
Subject: Re: [PULL 00/14] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 at 11:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> arm pullreq for rc1. All minor bugfixes, except for the sve-default-vector-length
> patches, which are somewhere between a bugfix and a new feature.
>
> thanks
> -- PMM
>
> The following changes since commit c08ccd1b53f488ac86c1f65cf7623dc91acc249a:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210726' into staging (2021-07-27 08:35:01 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210727
>
> for you to fetch changes up to e229a179a503f2aee43a76888cf12fbdfe8a3749:
>
>   hw: aspeed_gpio: Fix memory size (2021-07-27 11:00:00 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/arm/smmuv3: Check 31st bit to see if CD is valid
>  * qemu-options.hx: Fix formatting of -machine memory-backend option
>  * hw: aspeed_gpio: Fix memory size
>  * hw/arm/nseries: Display hexadecimal value with '0x' prefix
>  * Add sve-default-vector-length cpu property
>  * docs: Update path that mentions deprecated.rst
>  * hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides S exceptions from NS
>  * hw/intc/armv7m_nvic: Correct size of ICSR.VECTPENDING
>  * hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for non-enabled pending interrupts
>  * target/arm: Report M-profile alignment faults correctly to the guest
>  * target/arm: Add missing 'return's after calling v7m_exception_taken()
>  * target/arm: Enforce that M-profile SP low 2 bits are always zero
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

