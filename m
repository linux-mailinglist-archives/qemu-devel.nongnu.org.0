Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40BE2CDC48
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:22:39 +0100 (CET)
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksJS-0004oy-Nc
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kksCZ-0007Px-9L
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:15:31 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kksCX-00015i-32
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:15:31 -0500
Received: by mail-oi1-x241.google.com with SMTP id k26so2978812oiw.0
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tkX1L2NGLMB/axOms6Hhh7D4TuviErNIKjqsPIVDxBk=;
 b=C1xHSdLQP00hPDk3WCClzScsGR8VYRrh2I+wOSlTYqxyaC5nMQEn3u+xEh6P3kAgXI
 ESnfmetdTEJRYh4jwoRbYG/eBHjDzlqzk7USCnJ55doeXgfE9sOsLG65G8qOp5vF2kHb
 v/+J7ZNP6pEmsAh69I5PpT1MP3xF6Ma6eJCWd5Cvvs8Zb8QHi8nR6x9j3qeBcxIZroI0
 HQb5OK+SooRsT2WM/I7sENd81UonjJrCFYmHo/R+lS6oayBN6x3tGf+n7iB5CnDjtZPQ
 FbsiqL2UqfLdINztbmsShTBy1nXIICGaanfC/8myiLcGfaGEBbBSNXS9J6IrxHYBlDr4
 pmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tkX1L2NGLMB/axOms6Hhh7D4TuviErNIKjqsPIVDxBk=;
 b=rS7IfydaAPgC+7Cpd1EP7rAJ6liII47kkrQS7iE6gjFhrHxM4Zk3QFXBzUTc2ofvGw
 bEfKQcWxFo0Rzg29r1p+d4eTNpjpYI3SD3Rd9psMEhoKPFhQMhDDyw+jyVH0BdvShReB
 0dZt/kIgDjIOt3M0DZAovoCa/ZC5ZOq0jDTeW1AIwrGBCpE6itf4bIWn0x2Pl/jIJL5J
 +crY/tNdlEF/KnmRezjDyl4IGYifUMtIE7yRL9ppVpHN4oI2QEBXHcH/qxySDjWiel3c
 EhRTi0rbeDGgLgmd5uefG2wdNm6fVUoqrwn8DbKtb+liem6iVxjKskmz9ofcP3WBKxIR
 KaQQ==
X-Gm-Message-State: AOAM53257PvnQZw0ZYPl0pZP9Lig5fFRD6Sk+eHS0oa9bHjbSZU61pNX
 osvrHwEiExrxI6RVt1m/3H2Lyg==
X-Google-Smtp-Source: ABdhPJydWoHFuhiXh2/cYdK26Y6Gy9BzSFapMm6g6xhz1JvrsmPp5owyC8Iq3BW/6Sr9pOR+dMTc2w==
X-Received: by 2002:aca:5fc2:: with SMTP id t185mr85405oib.113.1607015727868; 
 Thu, 03 Dec 2020 09:15:27 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g82sm429160oib.38.2020.12.03.09.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 09:15:27 -0800 (PST)
Subject: Re: [PATCH 5/9] target/mips: Remove now unused ASE_MSA definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b55b94f8-d0c8-2ac4-b9e6-3f39399be22c@linaro.org>
Date: Thu, 3 Dec 2020 11:15:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> We don't use ASE_MSA anymore (replaced by ase_msa_available()
> checking MSAP bit from CP0_Config3). Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h          | 1 -
>  target/mips/translate_init.c.inc | 8 ++++----
>  2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


