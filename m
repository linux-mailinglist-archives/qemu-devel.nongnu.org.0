Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C47438B53
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 20:17:14 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mei3V-0003oB-QA
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 14:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehzA-00010h-Bg
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:12:45 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehz6-0008Bg-M3
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:12:43 -0400
Received: by mail-pg1-x534.google.com with SMTP id m21so8644496pgu.13
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 11:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=on7U9Ps/dv5dpmgcY5skhLSO2I6nyU/xxpCAxoEd8Yc=;
 b=zdeyyQ40q+pirwOpPfGXQKWQFo/YMAHIz8aHTTO94YSYOq2AnuEixdnRzTWElriGt7
 PqW/onl0Ln0a8vTa3S60jgaBlVMbwEleMyuz9lLIF9Wg4KRxp13gHF63Yd7xiHaDw2P8
 vNjTKheaHIOeN7MIiycZ7YexUqLIYFtO0sxJCevJKuLz1ArA2+91/UW/oPprXZ6HNvJQ
 wj8tSiONmHY8I4NA98EtXGXJhL1O12WqjvIDLaMBjr9bRYO46visl/O3ydL2WatBEnwk
 l19HpYemY/hNa1ChSRxQSdRB6nz6KlK2Snp1Ild5u4Eowsh/t3zvR3Xub4ELPPZURrmA
 8VmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=on7U9Ps/dv5dpmgcY5skhLSO2I6nyU/xxpCAxoEd8Yc=;
 b=VOk/tSlC9fSn1e2qhn/FggqQVBM+LjnSSaCcWLBCV/QQX17ivG0XiYVlB7OZ/eVq5M
 yhhr/5li0t6w1XjaSHRVCDK8g/W3rn50CuLdCbN2VSf9HvkuyKhTpiHLoznjsf3vPHwQ
 zpJ75H+H5LIhj1kpBBHKFNnJzedgGet7fbgJIlyiXjojdBabVsO07WHhQ26sgUAFE1R4
 GBWIUoAotT5Zalhsv6R+0LJDhqmmmLhDTY1gbu9DDaFZ42lgyMSouXHP++iRPf4rWVCP
 wYXdw9kFLU5FO7s45TIglJNb4G0E8jR5Il3mK8CyM9L7NKxsbvJIJcOW2CvtS0rydQpE
 K6NA==
X-Gm-Message-State: AOAM532hWkLVpiuwFk7ZsC5cX2F0UO2ggnDaINIbFebeGDqBQvAMPz9q
 2U0Yh4/0btY3xpWC6HvMPsx/Ti83na4V3g==
X-Google-Smtp-Source: ABdhPJxx7n5MAzU+CSvZbGKRG+YVwER4Az+KSr/HnpjVBFr2m7dktomff5XhpLRTbkzCDFuPVk2zMA==
X-Received: by 2002:a63:374b:: with SMTP id g11mr9796611pgn.459.1635099159332; 
 Sun, 24 Oct 2021 11:12:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q18sm18068975pfj.46.2021.10.24.11.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 11:12:38 -0700 (PDT)
Subject: Re: [PATCH 25/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 4/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-26-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57f32b5a-d7d5-a3e3-cfbe-d9ac003a4121@linaro.org>
Date: Sun, 24 Oct 2021 11:12:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> Convert 3-register operations to decodetree.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      |  53 ++
>   target/mips/tcg/msa_translate.c | 916 ++------------------------------
>   2 files changed, 106 insertions(+), 863 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

