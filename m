Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F8B6611CF
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 22:31:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEGlI-0001hh-I1; Sat, 07 Jan 2023 16:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEGlG-0001hU-Mr
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 16:29:54 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEGlF-0005SG-0H
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 16:29:54 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso5393961pjf.1
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 13:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nTfhspaYpDVr7ZdmPwbWsrfAQJ0nlDHwy4IWnJ4SI5I=;
 b=S+rrNa3GkbiH8qAiWvlHM+KTW0biWsCPiurlnOJx4cbDwx6i+9YajBG6rCNUlOJC1c
 uV6LQXws8+ULx9oAt83kSHNAbyS21n22R/j5zOkD32i1KlSZO9Yqp1mz+EJ6/j6w9EXx
 G6xic2+iaadT2E1PacafIcGFeutWUZCaPiuOTCGfBJ2sWj2cXoDLKrelI3fxA5Oi9t7A
 h5WWag6RUtahwTKMCvc6RbFeZ3mwhrHWp/d/J01MX4EWxvGF0bT3k1Thg8QO8n0X7j3+
 AmyZe0QFFmnadZPQFAB+7ivAfvb/3FFWkMVNy3iKfMIPktr8//ieXEWnddDSNt+0Miot
 0ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTfhspaYpDVr7ZdmPwbWsrfAQJ0nlDHwy4IWnJ4SI5I=;
 b=2o5GHRmHGeRUMNsnU2S2YaSN2YG5lOrH1FGLv6ANbzsjMB63L/x9wPsMgjNCl0CsDn
 P03H1X7sKsVYOn+T+gYzUO7g6LYSXOYVDzHul/enpbIkxXgOTDvtwWIkFSOW6NhfBCUj
 Jfcucmg8XhYlhUSqrO8kf6U9UkOb0DqxaOrrlNj9Ho24Dn8TPoF5HpD23kVgXyCsCrMJ
 +ofSaeeKta0T3v9TVvC/2mIKCPmXqZdMQCIi61mXTbfcMTrMurAErW/v74ZltyXuUv6P
 Z/GJ+8Isalq8a8q4GieilT07mv0Xc1ri4p38cbWu4B4Irxru1pFkGWWt8OR4MVlOKgL0
 gUgw==
X-Gm-Message-State: AFqh2krnE3KZ5VHDSHMFt+HnmM9z6hEV4a2vbmJ1QUdtf8/CznczhPCH
 YDxG9VuQsyLsTxH0+fIk1TkpczIyBmYu6t6WDzVWSw==
X-Google-Smtp-Source: AMrXdXsBSmF4oXGyZbYVwIFQr/A4RkdSDWTu8L6MfnBpUi7EghCcGoz5iRNzkpjGt2UbrB6SkghVpVLgTFnpgG+3Jjc=
X-Received: by 2002:a17:902:690a:b0:193:1f3a:4977 with SMTP id
 j10-20020a170902690a00b001931f3a4977mr179476plk.168.1673126990890; Sat, 07
 Jan 2023 13:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20230106063305.3919094-1-gaosong@loongson.cn>
In-Reply-To: <20230106063305.3919094-1-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Jan 2023 21:29:39 +0000
Message-ID: <CAFEAcA8w5ST9XsNZKzx8_XyPA98dwTy2ekMjWgwuNBmkyDDKPg@mail.gmail.com>
Subject: Re: [PULL 0/3] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 6 Jan 2023 at 06:33, Song Gao <gaosong@loongson.cn> wrote:
>
> The following changes since commit d1852caab131ea898134fdcea8c14bc2ee75fbe9:
>
>   Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2023-01-05 16:59:22 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gaosong/qemu.git pull-loongarch-20230106
>
> for you to fetch changes up to f4d10ce8aa545266a0b6df223a7f8ea2afca18b2:
>
>   hw/intc/loongarch_pch: Change default irq number of pch irq controller (2023-01-06 14:12:43 +0800)
>
> ----------------------------------------------------------------
>
> Add irq number property for loongarch pch interrupt controller
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

