Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540D6BAB0E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 09:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcMnV-0005qm-35; Wed, 15 Mar 2023 04:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcMnQ-0005pT-DX
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:47:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcMnO-0005mH-OT
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:47:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id t15so16541929wrz.7
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678870061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4yerwE9+4vPstoVuHRhEh4PA689XsXccyStWiJuEUPQ=;
 b=xoDAAUjW1475zxjbgGmouLq71XvjXUzUgsA3Gb2SW1DYgntPfDPV/SBPJ/8blG55qe
 SD7E8sQXlEiKycN1uTenVsmySOobnK6CwoV0TOAJ02Szi+y8IDhmMvDg5cLGdU2BRp0b
 xXopvT3DmWyVww9lDIY5zS86mdGJrttgHy2APUD48qAvA1vBXJW36YX9dIu/mfAnXM58
 USK5Cmn/Tg/jDD45MqasSl8H3AtSGe8m/I+8cuJWQYWnhnH61UNh2sr9vYE/KKY3U4Kf
 7Nw+Igt637haeoMN80PilySMLqMWUJtUZRy8JLY9+672e6a1tBlilRND39cVY2T9bmX7
 OTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4yerwE9+4vPstoVuHRhEh4PA689XsXccyStWiJuEUPQ=;
 b=FTuis81YlAwdXrrPi9tEBbwMSxjqoew+nZ1rVwW8dkbx3MMIRd8WFT0pTIYiruxT6V
 q/raECAiaZq7V75I21BIFbUA10MNta6jvtHQx3UXhZvps0A+vlANyhvM2JCD9VgNKjNl
 qEGdg2/KHQwg6xrHqKu0bsBswVeVYB/rbS8BW2CtLTAfopBV9U/J+VLUwtwgcCMGFUBd
 Ph8a80Q/Nz6ja5NIfyTTEAxdYeVa1sWwZuh3VMuMyKt7XYqeJqiAj6bGhkiJQpHKVNSE
 d6XSzX9RElV/VYoEakGO8yE58HkVVtcANBnTZsrcF6BbqbXpUeHgn30g+la3MCkX7XRv
 Nd4w==
X-Gm-Message-State: AO0yUKXQMLuoN1djKjHVv7GQhrDvIvmbRGhHH5u9RyVJYYBkaLfZ9C+g
 cBgGibeNLEuBuyGe5fyMvbG+gQ==
X-Google-Smtp-Source: AK7set/F6qeimT3Ri2ekl6SnLyGjDGWWqEY9/U1lLTPgyRwkJshPnAR7d37ESL3WSXeA/fILUTLNRA==
X-Received: by 2002:a05:6000:128f:b0:2d0:4321:b9de with SMTP id
 f15-20020a056000128f00b002d04321b9demr648390wrx.39.1678870061189; 
 Wed, 15 Mar 2023 01:47:41 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d60c8000000b002cea8664304sm3990672wrt.91.2023.03.15.01.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:47:40 -0700 (PDT)
Message-ID: <158de4e2-47e5-d3f7-84a9-56fe5882986c@linaro.org>
Date: Wed, 15 Mar 2023 09:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 14/3/23 18:08, Peter Maydell wrote:
> The cadence UART attempts to avoid allowing the guset to set invalid
> baud rate register values in the uart_write() function.  However it
> does the "mask to the size of the register field" and "check for
> invalid values" in the wrong order, which means that a malicious
> guest can get a bogus value into the register by setting also some
> high bits in the value, and cause QEMU to crash by division-by-zero.
> 
> Do the mask before the bounds check instead of afterwards.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/cadence_uart.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


