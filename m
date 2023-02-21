Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C869DB06
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:15:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMrB-0003nd-Lm; Tue, 21 Feb 2023 02:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMr8-0003hI-On
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:14:30 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMr7-00036T-24
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:14:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id v3so3220465wrp.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wf1MQPuxatJmmu/y6kl7TakTBmw760iOz8YwyMKGumA=;
 b=e+iX3M/nZ8ET9ktIugY8N/8irhInh4KdIMDZPCNYvXJroQbf+5bnW1+5vSxWGDd98m
 717+Dtb61G8SauPrYjCIid8RmUxjwcaWteyoOT7fbO0RDMA+zio04FcEdlLQqo1P1hIe
 K1wHKshXBKPxl6fMEquNMSXkFMhOoSuay0vppen5sDglDi4vzWYjtVbHca+JTQh1Rjok
 ZuGf08JH4yFcW7aMVZYcizdI3VujXsYQCVhsxg6ZDIy3i20uFBcvIUR7QgCpm5pylUzq
 ma03jlBVPsAGjYZc62yoB2LwIE1f4A511BiiuR0yHpbge5yf/vUNVoaznjTTJAojJ94b
 peqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wf1MQPuxatJmmu/y6kl7TakTBmw760iOz8YwyMKGumA=;
 b=fxBcZFYHKxi5JE6nV6B5Kqgkdgq8ZKaZRm5stLZaNeGf9bmWfuJPFXDpaDlDojVIxB
 mGHfWt8TELuzSQxDRZQkYfuG9tAuOLzxVXNQin6LW2gnHvJRCKuN/xtX3Tl7yBgXmRYW
 tDLp9BuORV0VGu6FW+kGLGys7b4IdMxbkPVhiHSoQLekFsedJj4yTlL5F0+gNtuqV/mU
 kqyG4OD2lfMnxbRjMvCTx4Kw9sX58+R4UupLAkMX1paBA9Uy3ehxPgY45B+JlEoP0QEU
 2SUzfndsCjga1cYA9M0eXWJANCR09VimXIA+/wJNnmB6YjCZNphva/rEporvG2JGYFlk
 Vk4w==
X-Gm-Message-State: AO0yUKW7IBiNR5DDiWZ44wFCKWWdVmKtyKjJM8Pw68lTUBLEXCgG/M/o
 Eh+TBYjtb0iOHrX4k+iGCA2c8P09vqg941ZT
X-Google-Smtp-Source: AK7set+HesNiozxf8MDyWnDUL7caWzvTU6iBQXkhog5lrM1NgMZmpw5oVLvHvLLPCc1FPymMul5Nyw==
X-Received: by 2002:a5d:474a:0:b0:2c5:52b7:8436 with SMTP id
 o10-20020a5d474a000000b002c552b78436mr3742441wrs.21.1676963667298; 
 Mon, 20 Feb 2023 23:14:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d6991000000b002c54911f50bsm4292800wru.84.2023.02.20.23.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:14:26 -0800 (PST)
Message-ID: <2b6fb761-00fd-4ff2-32f2-5e185ece2c84@linaro.org>
Date: Tue, 21 Feb 2023 08:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/2/23 03:19, Richard Henderson wrote:
> This function is not used outside gdbstub.c.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h     | 1 -
>   target/arm/gdbstub.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


