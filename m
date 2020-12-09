Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D092D3765
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:09:47 +0100 (CET)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmn3C-0006f8-Cf
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmn0B-0005gJ-46
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:06:39 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmn00-0002k3-UM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:06:38 -0500
Received: by mail-oi1-x242.google.com with SMTP id s2so557269oij.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 16:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iLfF/auN5FqC6XsYYZYg7CT5IU2mXfpaFhjc8pnl7Gg=;
 b=O0NS3c3NweixraG3VE7iL7wYjawbit6h2j9uonlFjT7XYBQvm4CzsIVasM8QCQTjR+
 64o1NAviP+cW08O2w640tII1oveqWtbeVU1Zjxt2Jnlye9CGvBQN99IzguYZEU6G0vSf
 IceS5JosPHCj5MQwbH2+7ktR3ng9hCZNi2h46zH+0ZpwHr2qxZ2t/qbsBzMZbxaNGvWH
 NihX8CEaxBqWjeuteWspY634lMvpuvOWdJkTss9McldKY6c/p4FiJM2JGTXhU1P+378s
 svMWdzVSYJh85KniVYeXhTs3d/sPVzEzLaa4+Lx1gaCcm+KRkIL0Y8TDBnTNgbgvFCU7
 Ihgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iLfF/auN5FqC6XsYYZYg7CT5IU2mXfpaFhjc8pnl7Gg=;
 b=r2i8zxcPd2gOx8iFBhw6aI+K4CudDwUlSgP5SRCC6mostoE7s+WVzcyeYjVzbpYf/a
 tnnmA9INKaqKvID44Y5VudRx04SZL+DcqbiLrN6jqTYWhL4lfGrUVHSG2INGdbVPabYd
 R2YZ+MUpfws/Czh2v2lvSMq6QQ/FaWUodLTz/Cuy9JEmyK58ffRnEqYjtG46qIBb1aAn
 a3+kepmd4NTCXUt9wqQ6Srqpj9r6sbfKEO7Y4evt86f/J+Qq0OLxgq2nj67Od9T3L56x
 0228grIZQiDR5a+nUmehkf7N4TEulFqj14dAy4nK9Mezxmo1Auh1K2NJ7nqa4BGlSrru
 1tLQ==
X-Gm-Message-State: AOAM532DwR7Zn7UP6+L+i/AdqZy84jXHn+21nsttQL/ngQLmgiuJUtvC
 kTorTE2cruYeQIbKo2/LpxFaJw==
X-Google-Smtp-Source: ABdhPJwS4kusTkUzvtisK6YutAeclGp/etspSFf37NpLEeeNYi+9pjzIcBmpewU1gA2GdwWlPTaUSg==
X-Received: by 2002:aca:5093:: with SMTP id e141mr23554oib.76.1607472387813;
 Tue, 08 Dec 2020 16:06:27 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o63sm138636ooa.10.2020.12.08.16.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 16:06:27 -0800 (PST)
Subject: Re: [PATCH 17/17] target/mips: Use decode_msa32() generated from
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e52d498-d82a-be10-ae77-d98900035132@linaro.org>
Date: Tue, 8 Dec 2020 18:06:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208003702.4088927-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:37 PM, Philippe Mathieu-Daudé wrote:
> Now that we can decode the MSA ASE opcodes with decode_msa32(),
> use it and remove the unreachable code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/fpu_translate.h     | 10 ----------
>  target/mips/translate.h         |  2 --
>  target/mips/mod-msa_translate.c | 29 +----------------------------
>  target/mips/translate.c         | 31 ++++++++++---------------------
>  4 files changed, 11 insertions(+), 61 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


