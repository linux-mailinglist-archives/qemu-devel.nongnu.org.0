Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2B3B71A2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 13:53:49 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyCJI-0005ds-Ry
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 07:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCII-0004Iq-U3
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:52:46 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCIH-0006x7-BV
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:52:46 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t3so30893947edc.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZUo6PjyKXJp+ST1laQsH2J4Vi7OmOLYX4JKN7NdF+c8=;
 b=K7xwxsb52beJ8s9loGSl1tiKZW/Ncb1Ylg/LXPfZ3kthf3iu4gsECwvO42rHDB+ncr
 Baf+7ur0eO0u83VqqptTVfC52XhRX8AlYJews49LiFxexYWBdeLjjM5Z0OKfYGCQS7me
 TVvIJ/cvkREiZkdW21tzw4LQKQ8BIQ246N44tvYGd3W1DFLAZehtPZS/tqzyOml64KVt
 ok7ZW/2LwjpH18c2cHMkBK+/QQPG8aTQ/df5vRi9zwbxO0MusluKcJDfJdxRoAnzPpJH
 rJxw9NXjDO9mpb9+SQkoLyp2cXeSLEDTvAG0TDtWSkSNkFsGFrTWv7d6hkYk2cRrfD09
 D+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUo6PjyKXJp+ST1laQsH2J4Vi7OmOLYX4JKN7NdF+c8=;
 b=RP9YvC/QdABN4rJgL6qvNcRXBzocwcQYUy5TUFi2Cnoy+BS784h4U2yTRjyYj3NiGB
 Fk4MuUQtwe1j02o/CuTpzjtAlO7UDeu8wbCnuD2oifogkgEGoZ/38glH09ZbtToMOBJK
 +vlVgnD3WEvt6dPYOLS5JPLQmdIOg28gCLGXYrx2PwO750e2Z9ogjvHIgm8FwrsKZ9fu
 1IqFHSCZyDk0yoD6FlGzTbytEa4qp8I9WWQiJYpgGniNC1h2J0Sl98UOLfHJLX20YLLg
 ry8iGEp/+wts0G44bgrmu60OVhcfRZNvlVrAdWrfoQ9CiiZ2dLIIUCZIXPnhKx+MBvHH
 vIfg==
X-Gm-Message-State: AOAM532psX0iPoQ9RXvYhjl01yj92avcPO6A2lJ95zJoSLZb34bYbfW9
 oQFF+oyQCii9Zv7xkoXVINtfc3/z1/+B5tiX19LyV+jnqtC7yg==
X-Google-Smtp-Source: ABdhPJxNsNzdtCR51YV52B9BQosBJB0ggrUJzd6RetptoQRFxtznVgor2jeMbcEWxUfRhJDFnq9K8GnEvTwTwHOObJk=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr39429852eds.251.1624967564002; 
 Tue, 29 Jun 2021 04:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
In-Reply-To: <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 12:52:07 +0100
Message-ID: <CAFEAcA_i7TozS=VP+5KzWxcsmDRTqX1aGeKky_iGzSC8AtxTGw@mail.gmail.com>
Subject: Re: [PATCH 01/20] target/loongarch: Add README
To: Song Gao <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bibo Mao <maobibo@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 13:04, Song Gao <gaosong@loongson.cn> wrote:
>
> This patch give an introduction to the LoongArch target.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---

> +There are several code directories
> +
> +    1 qemu/target/loongarch
> +        This is the instruction emulation directory
> +    2 qemu/linux-user/loongarch64
> +        Linux-user simulation
> +    3 qemu/hw/loongarch
> +        System simulation
> +    4 qemu/tests/tcg/loongarch
> +        Linux-user test

This isn't particularly specific to loongarch -- it's how
all QEMU targets are structured. So I'm not sure you need
to document it in an loongarch-specific README.

thanks
-- PMM

