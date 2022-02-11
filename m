Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D978D4B2258
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:45:11 +0100 (CET)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nISUJ-0001Qk-1K
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:45:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISSV-0000TV-GP
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:43:19 -0500
Received: from [2607:f8b0:4864:20::736] (port=39858
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nISST-0000To-8b
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:43:18 -0500
Received: by mail-qk1-x736.google.com with SMTP id b35so7819209qkp.6
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xa2h5Iu4fSnOA645R2aEvGvJXhS14Qv8IX+0F2UBZyI=;
 b=omCWeKsw+3smwEBbWHc0zQTmN1xilMIkIv5i+82rrccDRUplWVCL7JrF9Ef8rb0PaW
 djEB9yBeEhQpexJEB+d+UdwwHTwZmzi0d9lGjZMKZ4qY0dCNAWVNMw9q0Lfv9YO+Il69
 UyscUTKFBAGte4ss7O7l5FfC+ISeVNs3bnSputLKXu8zk6auWZTbhHhquTqKAVTHmJWe
 P6i2RMhN6wMRtwDyRwp8DoXD9gJT6B92ZiJEARMWYS9jZkYYyCuv/jYseEprP5NRBruD
 NMmgxCAv+Pizt5frNu/l/QjYwZzkRdkw+aDTB9Xlp6fXmjFG6dynEysvLU/jOHCeS3x3
 /OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xa2h5Iu4fSnOA645R2aEvGvJXhS14Qv8IX+0F2UBZyI=;
 b=1a1/guN8oQ7S23HOgO2+/1BTUj3C54mhTyGHPLoEuwqq+H8tZ8obxXYBz4+pzT/Axn
 eW5wugQsiATlwyXRBN7rG7iaxzCJPHUce8vqri/7b+tKxX9WNSNTVXbl4SVhhS0Br2R2
 ZM3c8q03z6Kvs4k0DGBbsdZjdssDMVDByeSxYsBfsCIONhcW3DuA/5+BUPxC+Hma+wt9
 pjvic9EK1lsiZs8CqP3hA2dHur+K8SNCkLAfyzo11LsZ8s7LSj3dOUmd+zcwBWJMJjjM
 c2nMoDyVr/oeDwWPxmbM9ez6j/Y4N+7Obi7d895oNQdA2Bl4TBu0NwxjwBHzR8ghRRnk
 FU+A==
X-Gm-Message-State: AOAM5338QCvFiVdvxx/EFSyUgXQYIsHhtpa+3JhSRAAZZKQATRUL2AvF
 i+da5oYj5s5cnYBFQQ1/UMg=
X-Google-Smtp-Source: ABdhPJwXGyCCaZWL2q361iF181KBorJqKz2wWd+mRFCOLPkDCOHj4OOhG5pPQcNHOI2voJhXerDCLw==
X-Received: by 2002:a37:a7c6:: with SMTP id q189mr288122qke.126.1644572593625; 
 Fri, 11 Feb 2022 01:43:13 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u35sm12611321qtc.26.2022.02.11.01.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:43:13 -0800 (PST)
Message-ID: <cb2ca72a-5a61-917c-27c4-4827158c89e8@amsat.org>
Date: Fri, 11 Feb 2022 10:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, ale@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220211033034.21107-1-tsimpson@quicinc.com>
In-Reply-To: <20220211033034.21107-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/2/22 04:30, Taylor Simpson wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index 58a0d3870b..e3efbb2303 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -1,5 +1,5 @@
>   /*
> - *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
>    *
>    *  This program is free software; you can redistribute it and/or modify
>    *  it under the terms of the GNU General Public License as published by
> @@ -131,12 +131,7 @@ struct CPUHexagonState {
>       VTCMStoreLog vtcm_log;
>   };
>   
> -#define HEXAGON_CPU_CLASS(klass) \
> -    OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
> -#define HEXAGON_CPU(obj) \
> -    OBJECT_CHECK(HexagonCPU, (obj), TYPE_HEXAGON_CPU)
> -#define HEXAGON_CPU_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(HexagonCPUClass, (obj), TYPE_HEXAGON_CPU)
> +OBJECT_DECLARE_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)

Including "qom/object.h":

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

