Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF84BCF45
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 16:14:56 +0100 (CET)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLnvL-0002kO-Fb
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 10:14:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLntJ-0001yI-Iv
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 10:12:53 -0500
Received: from [2607:f8b0:4864:20::1132] (port=33308
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLntH-0002fw-HX
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 10:12:49 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d66f95f1d1so113076557b3.0
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 07:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRUlGOszQrMqSwk2t0E5JOdSeW0lsRmTqY8L+bKCvJw=;
 b=f1Dgo2ShOLMFc8Q5TkGx+2nZgE4jUDwtF/2JMDDLnWg4ImvFYfGefU8U/JaeUKavwq
 iGQ5CionTQCG6hhzF7mIp4ngIlZxm86OG1GgJECbAwiS+aaOt6iqw77jA96W1b4IGN5+
 rqPdUfXKaffcOcefPh2YE0cyAmnyBJmI/oOzHLXcfd+2QFwtbmmN6eFdSaln4mx9ptgb
 V9yXR6SOImRl4XPWk+tkC911g+XGvgKoUk/W5Br/4vNr4EMNoQe8x5rTmqb0GsslDY9d
 OlHbhEeyMvHPeRSOrEUDbbEsIsfxDCHBwzf2Q2ivwlNMZh/GYvfTbIX9+IRVvIJiSIkX
 X4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRUlGOszQrMqSwk2t0E5JOdSeW0lsRmTqY8L+bKCvJw=;
 b=jMKUI60JpZNwNf/u1FywQnNTDyrTZSxJDK2ZQFbS8KzCalpi3r80CH4gq5N3tBcgKD
 VNTXn7uJolOBLeXSbgdJ/9p4ZHguvy/Lfph5cNM+L1Wz/SxsJ1qoJIsgsEYvD1HsqY/y
 de4yVm8fjI1sSxeLwhEJc8/R1ziLH1FAuZnyIpN93W/tpqUKapZmS5fUz0c7KJ4z/n2U
 6pHbeWelCJgG8b4YYrPcfcVES7EfbGyr5gB3JmGhK0vFsKat8UtestzFz/D5iak99S1H
 pd2X88JWYGkuAyitASXXjjmvyV9piU89SclEcQhS1V5RUnT9g4HS34VeMIgOn/nRgdy8
 fvPw==
X-Gm-Message-State: AOAM533JW3Jhd+wQWFD2+f3qhuR6pvS/jbT/2GWu1jQGpaiUWUQnYph/
 /zjNfjl+E/0pyrgDZXoXRp6vxS2cxaBLD1jNLRxN+g==
X-Google-Smtp-Source: ABdhPJy6nr5BS+2h8m5Q1nOHT3K5B3viAKZdEeeMnXm8DNXokBoC7371zU4xjiuv4kPcpmqG8lbkP4feY3NhfzQpXT4=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr16061088ywb.257.1645369966601; Sun, 20
 Feb 2022 07:12:46 -0800 (PST)
MIME-Version: 1.0
References: <a0b237cd-8351-4389-bd7a-450586323e7a@VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com>
In-Reply-To: <a0b237cd-8351-4389-bd7a-450586323e7a@VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Feb 2022 15:12:35 +0000
Message-ID: <CAFEAcA_iv9Xm0c_CNzez4fQmXfWaA_dMjUOsgxqx9JoKFj_HGg@mail.gmail.com>
Subject: Re: [PATCH] target/nios2: Shadow register set, EIC and VIC
To: amir.gonnen@neuroblade.ai
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Feb 2022 at 13:07, <amir.gonnen@neuroblade.ai> wrote:
>
> From 99efcd655e83f034bce25271fe592d8789529e54 Mon Sep 17 00:00:00 2001
> From: Amir Gonnen <amir.gonnen@neuroblade.ai>
> Date: Thu, 17 Feb 2022 15:43:14 +0200
> Subject: [PATCH] target/nios2: Shadow register set, EIC and VIC
>
> Implement nios2 Vectored Interrupt Controller (VIC).
> This includes Exteral Interrupt Controller interface (EIC) and Shadow
> Register set implementation on the nios2 cpu.
> Implemented missing wrprs and rdprs instructions, and fixed eret.
> Added intc_present property, true by default. When set to false, nios2
> uses the EIC interface when handling IRQ.

Hi; this patch seems to be trying to fix multiple things
at once. Could you split it up into a multi-patch patch series,
where each patch does one logical thing, please? In particular
bug fixes to existing code ("fixed eret") should be their
own patches, separate from patches adding new features.

> To use VIC, the nios2 board should set VIC cpu property, disable
> intc_present, connect VIC irq to cpu and connect VIC gpios.

Is there a patch which wires up one of the nios2 boards to do this ?

https://www.qemu.org/docs/master/devel/submitting-a-patch.html
is our guidelines on patch formatting.

thanks
-- PMM

