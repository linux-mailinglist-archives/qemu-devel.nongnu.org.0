Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B49691F5B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSv9-0002XS-6X; Fri, 10 Feb 2023 07:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSv6-0002WZ-Qb
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:54:28 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSv5-0006vT-4t
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:54:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id r18so3743421wmq.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ppil0Pna8uyMv/XYe07cI0IM1j2gNPrTntCt3B6B+hI=;
 b=Urj66IgXYpt2XGp2BbxAdT/oMnBVoVYRr8XyAQQmFosa/jxkI8zFcj+sTUiIM3ss9j
 qg8X644G46DIoF0Lkvv0iLFQwYxu5gKXFt5Wl0aKhT+GamtQKIrAigSV9eGU0F/szbWO
 g+DeGqnFAD59hk5Anb5dwOP/nOQLGY20XgE+egSPsqac9CCPbZRk451Vx1SENDe8HJ7/
 9lSRpiLzclUmePAmsdSqYccMEQGFkWd+I2VW1Utltvo4iXlm3ynWFKBbtErrPO0CVY4b
 W2vEEywGchPFYnqrPoA+Am854Y6VlAeWn63R3v9pKFqg4eEHqEtpS2Dj0LNrHOX/KbBY
 Wq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ppil0Pna8uyMv/XYe07cI0IM1j2gNPrTntCt3B6B+hI=;
 b=z/ok9iBT15qj1r7xObhk4VF96bSj1gx7W8ifJrAXO1CwoZsZDqC2vy9j6rC8avVVPg
 VBvK+ubeqE/8/jTBUC+/lm+PcAKXNcBQ/EUG41YRy+x4xb4sO2JzUPZ82nIzZERkiOhY
 i7k2zjCPdDEBZmqtr84VUlo1rua3Le85J/LQ5YyutBWGWHFAJt/mwCe9tkCbsHaB0ETk
 opYEZWCi5CeSzAqbNl3sO07EJ90RKynyh+ZGwM3u0oCNSL/oa6/nvKEGHymuTl5qd59S
 8PDrDuR9+Q4W/D4BRGFgy49/gW+eFONo5os22hm7YueUp83EDCdh/o+uiBzqDalvq5yx
 /tYg==
X-Gm-Message-State: AO0yUKVysTNoCgKeevYbb20XRHk4oODqQs6sl65qCjhD0bJCh+hlBXpM
 ZdsXKMLypqS07zzMeVodjrcGCg==
X-Google-Smtp-Source: AK7set/kIRHk3ItDYTwdn/GlZlx7zan0ihVIz45yb9YOpera6GNf+M078y+IkoVvq9pyWRV/tdBN6w==
X-Received: by 2002:a05:600c:a695:b0:3da:1f6a:7b36 with SMTP id
 ip21-20020a05600ca69500b003da1f6a7b36mr16803145wmb.0.1676033665848; 
 Fri, 10 Feb 2023 04:54:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003dfe8c4c497sm8160388wml.39.2023.02.10.04.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:54:25 -0800 (PST)
Message-ID: <a08449a5-951f-74f1-2ffb-a8fc559a9cfe@linaro.org>
Date: Fri, 10 Feb 2023 13:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] target/riscv: avoid env_archcpu() in
 cpu_get_tb_cpu_state()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230210123836.506286-1-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210123836.506286-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 10/2/23 13:38, Daniel Henrique Barboza wrote:
> We have a RISCVCPU *cpu pointer available at the start of the function.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


