Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B2550228
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 04:51:30 +0200 (CEST)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2OYb-0001u2-7T
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 22:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OX3-0000mH-FN
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:49:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OX1-0000uz-QM
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:49:53 -0400
Received: by mail-pj1-x1029.google.com with SMTP id f16so4296718pjj.1
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 19:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o5XS2sEBvbh2C+hbju63z6kTe250Y8eg4r+onf0jPFI=;
 b=f+MSVPNh5crSTkcE9QGCTlBZFQ8jfo102LCIbD4Px+bTnB6Lvx+HDeClqjwl2y97l1
 kg89GyKBGVaMBFdPt2p/b7YW6tfq4hg5zh8TBP4r9udSasivZiAF9BYSku2yVruSdu6R
 HRoz1fMj+viC9W/bAU9OBxD0YSQsT2vA0RBBMtagNhDqDlqQrP4dInSzZv6EZv0W0DA6
 LUD47HRN+380WGKYzbw83APQDh+UZhKX5t/nMCFc3mM3BikTGJDZbWhIc7Ffo5T/+tWm
 4DWL7NznrocKCQm6nAn8nGbzEHybQW5enPACjN8euhFohG2ibB5bmyVQtbqLAk5qef+G
 u/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o5XS2sEBvbh2C+hbju63z6kTe250Y8eg4r+onf0jPFI=;
 b=ulGlrEtLngH4Z79oqdbdkgKHhX7R7RXby95R6Ha3fkkts5lhlG0FutUxUv+MEs31ZL
 NQaXoISN3lXH4nvsS/dmM29RLzMvps6AbASfkmqq8IQm6UZ0a2ZSRR+4rq8fzLnsDawV
 3Q0yJGI5OHj6vOOI5ftjQVPxFFI00ZXlVfaVWdk7pUGqtR31axJ33AGn5Wekk2gl/JmM
 s4BkZombILUrT3Tt/SBGRHpaW2xAsEsdEVzNDYs7tnKQfLyIPsH7RVF7gRD0CfIrzpPx
 pIHjxTnWCfP9PZqwVv1eOfkzl24Nl+5KobqW5yZSTUunq53nD+ZitxgFqUDpjgjkPkKZ
 KjOw==
X-Gm-Message-State: AJIora+5QAykf+WYFuEHSpeXcvOCDpgST3cP6RHml7c+brbQccHCJ2QD
 kftkbp4c4nrabORXWsHAmRMOug==
X-Google-Smtp-Source: AGRyM1uEzngZD/RgV7IdwBQjMi9RmdFtXNzWj5/XrDGJave2LsazsgsxNTKkkveHEYJLf1gfF3Be2w==
X-Received: by 2002:a17:90b:1bc8:b0:1ec:881d:86ad with SMTP id
 oa8-20020a17090b1bc800b001ec881d86admr1612026pjb.4.1655520590361; 
 Fri, 17 Jun 2022 19:49:50 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:da58:e2:88d1:d15b?
 ([2602:47:d49e:3c01:da58:e2:88d1:d15b])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709027fc500b001690d398401sm3158701plb.88.2022.06.17.19.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 19:49:49 -0700 (PDT)
Message-ID: <18161e6d-d0f7-7062-6411-d95c0e10e90d@linaro.org>
Date: Fri, 17 Jun 2022 19:49:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v17 08/13] target/loongarch: Fix missing update CSR_BADV
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
 <20220616121611.3316074-9-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616121611.3316074-9-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/22 05:16, Song Gao wrote:
> loongarch_cpu_do_interrupt() should update CSR_BADV for some EXCCODE.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

