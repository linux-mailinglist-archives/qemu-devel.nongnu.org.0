Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45C39D082
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 20:48:14 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpxoj-0007pq-UC
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 14:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpxmr-0005PM-27; Sun, 06 Jun 2021 14:46:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpxmo-0003wV-IH; Sun, 06 Jun 2021 14:46:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id r13so8567866wmq.1;
 Sun, 06 Jun 2021 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KUBXWeV9EehxaFqMEfmBZl3sQBdMZ4TYWaQ5KkI9sgk=;
 b=OiDsJv4YwsT36l7ee0qLZMFYy+mH7lkGlFVIbP+/p7Giw89g0IkAeWgWomQWZD2d7b
 c+fxn1GJ+6L6KglW157pL7iXeBS/A7LuXBT2KZ2/xgMHofHE6pl8YjXcsEaEC5Kau/ze
 v9K8PI973PeiVGrLD+IzBvTWPWgi4+EeiYCoa7LGh+s7QdCsj3ULQhbTzBJkPUl8+2V9
 HbYDZjeQu4j2lzOcnlkPnJHmDalsmU9+7rK7XR55uL9G5fWJXNoQZtpcH2WhW2TbXvwd
 Ip/+P07xWh5f6oSLnk784pZKo8ApSrVbtU+DHQ9fM9nmxX87Ak2KRvZnOtfXv/WbiZ9e
 vqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUBXWeV9EehxaFqMEfmBZl3sQBdMZ4TYWaQ5KkI9sgk=;
 b=J3VaMJWqGanpy5io+dmHqvNgjH4zo+61RfnttHQEqyInn66viSmyM1b4vbGbhVzHLz
 yvfXG6qr9caG2gop6b9tqg+QGTTBSxCEvdfRUFZ8y6DoAtsIBUYDG6LWwMBplLMpbZVh
 E7EFZnsdoAblmjYhiF3NHM2BmNzJb7dlxOi2oYeb72WDuBLMQdEroLBDK2vkFcShahch
 q+5lLP1C3JddOoRvwxIQAD8eBXsL891vxSvI7pydbDOBoyyKPkd+BY7mWeIICuWAdMKI
 sM4ApwjRU3rqGaalV0W6MfN7cI8kZyDv84iP3YLajyGGEx2+iRWkmfQsYT5PmlDoNqh+
 ArJw==
X-Gm-Message-State: AOAM532B0WkpuX2kz9ov3h4oPEAPTY3cFmtXNQmRbBzZKxynJKxBiBXn
 5Cd4gIFqzudi8FuFhUNiQX/lUtHQCo1Jig==
X-Google-Smtp-Source: ABdhPJyM0ikzungzTXNryMdn7nZcn1BdUNDnEy20Sbfxb1g1kJ0vBd+cBlF0+bBnJcc9wT+7yyUQAQ==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr13014600wmb.80.1623005171690; 
 Sun, 06 Jun 2021 11:46:11 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l9sm11597643wme.21.2021.06.06.11.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 11:46:10 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/arm: Remove fprintf from disas_simd_mod_imm
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210604183506.916654-1-richard.henderson@linaro.org>
 <20210604183506.916654-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8111e43a-73af-b78b-9d0a-73779c1649ab@amsat.org>
Date: Sun, 6 Jun 2021 20:46:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604183506.916654-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:35 PM, Richard Henderson wrote:
> The default of this switch is truly unreachable.
> The switch selector is 3 bits, and all 8 cases are present.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

