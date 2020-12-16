Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390FC2DC6F3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:16:44 +0100 (CET)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcHz-0000Fv-9B
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcF9-0007PT-HZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:47 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:33842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcF6-00088L-9k
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:13:46 -0500
Received: by mail-oi1-x233.google.com with SMTP id s75so28823387oih.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNM4Yz5Woo/TpdyyOEU4Jku6TrZPrcKDJm6cVINrwz4=;
 b=YMDeCw847NPL5tGE0ChXdoh2FQlBcAD3zQH41/7soSGlFIqjhtPfq97PTZm0iJUtNu
 GKt6cSd5Qdr+Jfmid4SDOIlHHvvgsgZ4oUGgUtUkeolW41WDRu2mb2PZ12eKhV+kF86v
 DJFwZSzTPmK1k4Myxhq26fAb8rw0skuCcSNTDq7A9wu40SfrE4t4sw8VKFGK6rltWULT
 6TVUSTXXxJZY0cOguBLhMuDaEWEs3zkhNmKn2rEeMaIzU5I1ApNf18aI6at7GONMGgW3
 RC05jn7EDDXB+YiyA48dSPDYXIDS9deA32TJfRhHmRn7v9IS5RnmuMHE9xeYLwdZpjqc
 pNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNM4Yz5Woo/TpdyyOEU4Jku6TrZPrcKDJm6cVINrwz4=;
 b=bVf2pX7jOnjSZcxqQt5AnGO0mpH89nQIivMI3iSY40eQTdVkAUqbiMwl7OatljzU2k
 2dzfxz5dCJs1SLgBX39sjs+CukNUyAbqQK2wldcsFvlVpT3ZqFJ7NM8cMgtge+ln3kfg
 FP2Q+jvPV5pLOo62ybYa2/cphlwZEpVOSZslODI/AjxW2JPaF6xdXKcGDsJ9j/JvojPX
 M9rGznpCkhVOnFoJ7VopcRh+/rfu5xvQe1VPt7wUCVHhMVA2yQO9zK0yoEuqKVMPIlO8
 zCA0VaJM3jknGPV5qBrsfdNzHttSJxtSEj+k21AOQ3Am+X3yoKawUVomQ6wvNXj2z+/O
 fZKQ==
X-Gm-Message-State: AOAM53259b5hKdbPxA9e+cDFurf7wTgdgxYhEAdsXu/0JdEznV6HT0O+
 O/W3aLpmSqB5evOlsmlsP3NBnA==
X-Google-Smtp-Source: ABdhPJzBQnggeZbZsjzrRPXx65Aau6O9Ne5YTnwIzAP0r8lpi4PGLPwrhkTAZ9AocA7j91CbAHtTZQ==
X-Received: by 2002:aca:f15:: with SMTP id 21mr2941404oip.109.1608146022646;
 Wed, 16 Dec 2020 11:13:42 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r13sm641971oti.49.2020.12.16.11.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:13:42 -0800 (PST)
Subject: Re: [PATCH v2 07/12] target/mips/mips-defs: Use ISA_MIPS32R6
 definition to check Release 6
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d87a62a-9afe-c69b-ffb2-013ad4fa21ea@linaro.org>
Date: Wed, 16 Dec 2020 13:13:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> Use the single ISA_MIPS32R6 definition to check if the Release 6
> ISA is supported, whether the CPU support 32/64-bit.
> 
> For now we keep '32' in the definition name, we will rename it
> as ISA_MIPS_R6 in few commits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h     | 2 +-
>  target/mips/mips-defs.h    | 3 +--
>  linux-user/elfload.c       | 2 +-
>  linux-user/mips/cpu_loop.c | 3 +--
>  target/mips/tlb_helper.c   | 6 +++---
>  target/mips/translate.c    | 2 +-
>  6 files changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


