Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5811F632FF2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:44:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFW8-0005dz-W0; Mon, 21 Nov 2022 17:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFW7-0005c4-Lj
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:43:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFW6-0004Ww-4G
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:43:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id i12so18238477wrb.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V9AzE0CZGGa1zN7cGWCvvr6mF8o9Guz53YIPokpjzCU=;
 b=Zt/ai4JIbt3IZjBQc6NRVPPzl3loS6o+qNq9UTjsBdQXdJustPCfiKQovdaayJFShN
 aqhAaEZPD0xpgWPSR1OaBA7d8zeCkJ4J6UoLe/dpHK+tf0IekteCg6kUkNpGIVeUMWls
 4eAR9fHGUzxI9LLuOuYpktixGuStQfcoiEa16GtTVfWZ4GqEtwX2ZgM1DtYUc00ZEy3C
 74A8DQsudw6jJ2km5ceiVynjHfXjfXuXKZma5fkuGCPuqgr7V80fNgMfuz6ZplrIpPYO
 VqizwjuKfxBJxqiGWV9zfPOCm8a8uqUtxXxB+m2+WJlY4j8WHdNnFDilvgSkrBF75xOm
 NPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V9AzE0CZGGa1zN7cGWCvvr6mF8o9Guz53YIPokpjzCU=;
 b=lcVSGZufMJRZY/PXmeh3hInzr1Zn7MfFtCw2PhkO1lfRA2nZnhZlaUWLTuYbJYwHwz
 U0/cA1QcfTzasmED6FkNLHHngd1lU0gxTzpXcWzPzMU+of5EmTud9P2zd/4DZNYTy6/S
 1fFDAbLaEfL7BUlPQv+yjxjh93yflaB8CpIlui5hnpM5qy/oYO3y6yBF497+RcvS3z3b
 EazxjpxwT89lgXTK21v+dow6ZXmDkNnrsTSqkLh7CXLBuQKv0zdlnjFkC9Yt4a/1YJjJ
 dUxnzratLtj8xhiEYruLvm37xDt1m1IcBVrfb/isPR169saiHACV90b88uEvWqrNrmZO
 pitQ==
X-Gm-Message-State: ANoB5pkJYYYlXDyPCbRVtRZ6VBzjxNmR9NAJEVKdl+BEYfZEA0ZCZLAk
 sWWEvWYW2mfpz9rB6OzFUwoPQA==
X-Google-Smtp-Source: AA0mqf5kOptbA8Lru0r/JFTwwAi8Xc3wzFklmYkPedyynLantfK8yf4HGfCYt0LrTqFSctIX7STLlQ==
X-Received: by 2002:a5d:5955:0:b0:241:553e:5040 with SMTP id
 e21-20020a5d5955000000b00241553e5040mr5886554wri.578.1669070632318; 
 Mon, 21 Nov 2022 14:43:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b002417f35767asm12645515wrb.40.2022.11.21.14.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:43:51 -0800 (PST)
Message-ID: <29561bcc-a8d2-639a-8662-cf15fbeb5928@linaro.org>
Date: Mon, 21 Nov 2022 23:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/3] hw/mips/malta: Set PIIX4 IRQ routes in embedded
 bootloader
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-3-philmd@linaro.org>
 <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9F566248-59DA-46E2-BD56-5DB98E9DB446@gmail.com>
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

On 21/11/22 16:34, Bernhard Beschow wrote:
> 
> 
> Am 27. Oktober 2022 20:47:19 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Linux kernel expects the northbridge & southbridge chipsets
>> configured by the BIOS firmware. We emulate that by writing
>> a tiny bootloader code in write_bootloader().
>>
>> Upon introduction in commit 5c2b87e34d ("PIIX4 support"),
>> the PIIX4 configuration space included values specific to
>> the Malta board.
>>
>> Set the Malta-specific IRQ routing values in the embedded
>> bootloader, so the next commit can remove the Malta specific
>> bits from the PIIX4 PCI-ISA bridge and make it generic
>> (matching the real hardware).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> FIXME: Missing the nanoMIPS counter-part!
> 
> Who will be taking care of this? I have absolutely no clue how the write_bootloader functions work, so I don't see how to fix it.

Oh actually I wrote that and tested it but context switched and forgot
about it... I'll look back when I get some time, probably around the
release.

> Couldn't we just do it like in pegasos2_init() where the registers are initialized by QEMU directly if there is no bootloader binary configured? I could do that.
I rather mimic bootloaders... maybe a matter of taste?

Regards,

Phil.

