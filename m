Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC92960E994
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:49:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmOQ-0003n4-F2; Wed, 26 Oct 2022 15:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmOM-0003Oe-5V
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:48:47 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmOK-0007Ep-4n
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:48:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w14so3947996wru.8
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KvQC77ra2WKqp5QC303UPWG+6Y13q5B3h+PglOEzQgc=;
 b=p2i40YzkgcQ4/fNIfUiI/tD4LnbRqdwlBwlrrChT+kY5roHhxJNgI+efNHOIAbYaP+
 sP/qoOwZMnfalWB//0PYoxCixrwPinTZU9eQtKN0TZOzVHPF6PM2IiVAkV1hik+xvaQW
 fw7wVNSq99o5fr8g9uxmqql57/laF4vzqAr6p9J5DLxiHmaJ98iZKiSy/o5vRShBItQA
 8eQsIi0Jdn6uxi2pSxZulyor0Q7mwPDnw5aj7jhbgbWVhYQnn0SuqpcFJKn7PV8hiJZf
 6YRjPqMohKNDnJ9SuRfelAPXHopEGo6X9gzrIzQdi/xFsK5Gr1a8BexjaF7hPMBUA5pU
 uCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KvQC77ra2WKqp5QC303UPWG+6Y13q5B3h+PglOEzQgc=;
 b=mvAvkG3LEvdD0Q46nS+nDbeIurdy8dnXib69bJnMc1bRuFFkiXBXHk6rf3+EnX1I39
 X4Ni9gpJZFO7cOmPdyzZM7OEivMzb6BnFZ41uNZzBjsV3bLIgHm4Gt2VCyJmuv4Y7FQl
 OrZMvpFdQnSJbedSeulAhMiL25LJKJP4W2nWeZl5ogetLovJ95SAr+6mXKwDTxuhmR2y
 NVGutWCnCZx2zfP8K5su0FMj0zFDNSLrEiJr4qRgkDl7+VVxZCVtm7pR911Uc4W0QYGe
 i6DpUlN7AYQYiqbXHoqCsKPZjhjqUvYEzjDAdJwjP7+zPwqRvNwP/+F7WP8t4oD7S9Ld
 xTOw==
X-Gm-Message-State: ACrzQf2Tc+44k04+1J1sVVx5H/w8/WG9e/pKn++A/OGH2vQJgSE6XiLN
 3TcZyoyfYJ/WAnAhOysCICwXpw==
X-Google-Smtp-Source: AMsMyM7Mwi06YLNO5HMsNtbJkYCVS+ulkdyRHyPtloP58zxJaA4C1eYJDi5FFq6Mv7UYN4jxZ09d4g==
X-Received: by 2002:a05:6000:788:b0:22e:412b:7959 with SMTP id
 bu8-20020a056000078800b0022e412b7959mr29699631wrb.491.1666813722520; 
 Wed, 26 Oct 2022 12:48:42 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a11-20020adfe5cb000000b0023655e51c33sm6078935wrn.4.2022.10.26.12.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 12:48:42 -0700 (PDT)
Message-ID: <28241d37-b604-e392-945f-37316f9ea364@linaro.org>
Date: Wed, 26 Oct 2022 21:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 0/3] hw/isa/piix4: Remove MIPS Malta specific bits
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221026194619.28880-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026194619.28880-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/22 21:46, Philippe Mathieu-Daudé wrote:
> Bernhard posted a series merging both PIIX3/PIIX4 models
> in one [1]. Due to Malta-specific board code forced into
> the PIIX4 reset values, Bernhard had to include an array
> of "register values at reset" as a class property. This
> is not wrong, but to model properly the model, we should
> simply use the hardware real reset values, not try to
> bend the model to please the Malta board.
> 
> This series fix this issue by having the Malta bootloader
> code setting the board-specific PIIX4 IRQ routing values.
> 
> Note patch 2 still misses an equivalent nanoMIPS code.
> 
> Regards,
> 
> Phil.
> 
> [1] https://lore.kernel.org/qemu-devel/20221022150508.26830-1-shentey@gmail.com/
> 
> Philippe Mathieu-Daudé (3):
>    hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>    hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>    hw/isa/piix4: Correct IRQRC[A:D] reset values

Based-on: <20221026191821.28167-1-philmd@linaro.org>
https://lore.kernel.org/qemu-devel/20221026191821.28167-1-philmd@linaro.org/

