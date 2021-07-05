Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FC63BBD3E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:03:21 +0200 (CEST)
Received: from localhost ([::1]:44488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OFs-00007H-7H
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ODu-0007Ot-J8
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:01:18 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ODs-0006su-Mn
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:01:18 -0400
Received: by mail-ej1-x629.google.com with SMTP id i20so28629802ejw.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oq3k3fSlR9b/ax/Xy3ruobjxw1xyHz1X2Yf4fLl4b+8=;
 b=ewEAxIhbqdM5dKqqB6QqFJANp2X9S0bSUGFjvGeYmkzHeapwxAfznpKBdbHGMYKI2v
 bzG28KAshQQywIrcRcnKcWfIfv1fYQt+kbo/ChKkdJvVLu+pTKK9cKQTNg/P3uqBE3Qj
 4id7aJn72Hgr6PkAXh1S1xkQt/tJKw1I5zMyx6z5rQ519DdCGovo7rYFm3YPIOFnH2LL
 l6nSSMI6NvKkhgkef+d5LnhbUS0rSZGdowiuIHAhwjxZx9kMfdIsEnr8mRV9A5EBRFwk
 bk77CESYRzMBOYVR0iIqmENL8SkcP2Imw+qL1s/LuMpr5qCKbEte9MXbvsPy54bgMiCp
 O3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq3k3fSlR9b/ax/Xy3ruobjxw1xyHz1X2Yf4fLl4b+8=;
 b=YuQl/07SkBENwfYKJcbmJqamfgsX5DBtiMhfaFJcHoWU0tOQlSLXLZfc5faHM4Yuqf
 yzzvjg1OFDMC6PHCO74FjvRVPiwaVRjAUmI42Yky6GXG1OhV84hdnYR/c6LxkSw6OGtu
 51ybXtacrTduVuuSEm1dlaVkNY+xaxHFrbEEmI2Jb27R4wWLRmeu6OP3yl5O5lANP59I
 LE4rvI0awXMj5RpJsu7i1LLYRkHJCXW7Z5SYULCcTV6stz1dvkxa+Ozvzq5XCoJvugIT
 V+33b24jCQHOgcE2TT7Pbwg9SDzDDI/VbUn7a40yyniUr6OTFVJ8ZULeAv2xleEEPQkS
 01pQ==
X-Gm-Message-State: AOAM533t873E20vGZa14Y1yDVEk2EqvtzeN/ceMpq8ernrk0Snfnoga7
 4xINbJQIp5X/ofsvZOtDbTFNpCj6m6anwiS5Quc7Lg==
X-Google-Smtp-Source: ABdhPJxQZk3WkcLCj/U3CG4173rZic5zIyYbpCZti64/VavSGEriduZaw+Xp2b7Brq+diDLIHtLD6VL8cfxwSSiTmRA=
X-Received: by 2002:a17:906:99c2:: with SMTP id
 s2mr7815750ejn.482.1625490075339; 
 Mon, 05 Jul 2021 06:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210617165647.2575955-1-erdnaxe@crans.org>
In-Reply-To: <20210617165647.2575955-1-erdnaxe@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 14:00:37 +0100
Message-ID: <CAFEAcA8s8zBEjkGfFrtZVXcQfmajfxz38LuDOkEPE7y1LyVxWQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] STM32VLDISCOVERY Machine Model
To: Alexandre Iooss <erdnaxe@crans.org>
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
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 at 17:56, Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This patch series adds the STM32VLDISCOVERY Machine to QEMU
>
> Information on the board is available at:
> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>
> v3:
>  - Add test for STM32VLDISCOVERY USART1
>
> v2:
>  - Add documentation of STM32 boards
>  - Fixed number of interrupts
>  - Fixed Cortex-M3 name
>
> Alexandre Iooss (4):
>   stm32f100: Add the stm32f100 SoC
>   stm32vldiscovery: Add the STM32VLDISCOVERY Machine
>   docs/system: arm: Add stm32 boards description
>   tests/boot-serial-test: Add STM32VLDISCOVERY board testcase

Oops, nearly lost this patchset in the pile somehow.

Applied to target-arm.next, thanks, since Alistair has
kindly reviewed it all.

-- PMM

