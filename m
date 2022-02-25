Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9B4C3A19
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 01:07:47 +0100 (CET)
Received: from localhost ([::1]:49476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNO9C-0005pQ-Ix
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 19:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNO6V-0004jq-MY
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:04:59 -0500
Received: from [2607:f8b0:4864:20::534] (port=36420
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNO6T-00085D-JH
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:04:58 -0500
Received: by mail-pg1-x534.google.com with SMTP id t14so189847pgr.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 16:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=25M3W1HFrGME+DxeJQnyj3R1yS8pC8dcZB3aH1tY9IQ=;
 b=xe9GQefMkI/WH7xu7H+4qePJa9b4g5ycJKG8DVdzE7nbpU41XFV7heToAnd6NtfrKi
 OrMtAXmZj0al9YQlqXzI/nJ13byWbCC+OcNQUuQv8cDgcc8GxBltcZBqBJgR7FOYr6zI
 7Q1ponaHB05tp9IpA6Vig44M0L1R5ARjZQctJu77kMI2tcoD120CiUHdvtQbFlcHLVYq
 gTvR5XDyP2UWDdENuLNhKaNiJhjL1Fhdy6+6EPMp3qv4feEqCsOsMa7FBDl42ZOR1IAT
 UmPD4vvhSggh7K1ZG2mBHYc8KD7NCPdCjgsftGl15YqU1VNOSOysfwvuo3ADLrzQZYZT
 lrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=25M3W1HFrGME+DxeJQnyj3R1yS8pC8dcZB3aH1tY9IQ=;
 b=b1ihwag9hDMdSbK7cqPpSr1KqdrFDgWY4otf7p7W3qNHvmLruUBl61bq80H+6uPbhf
 a+VefB1FrHAxAAcamNjVFfun/NlAnTs40venxLQzsHXUuPyZ3w9eD9ho5tzTYfpBRf2g
 vYfktYbpJM/oOVeIuJFfRBgPIxoMVpioi2y0hMMuBFk2H7SCt2rHdkemeKlnyVCQ1fef
 WXLSokUt8aP0OLbY2g3z0bkh0Zg0IBZMmKByNYNQq3qbJ6BQ1TQyPjQqP/8x+9YZrKP9
 HDBXvti4wMsiK5WCESiVIBJBw39VZNlJ4fJsYXxPG1t+98+qEymVqDUV6KyAPgpM6nHr
 ktww==
X-Gm-Message-State: AOAM532H+2gzbnZsolI5sk+ocxK9WosN2aIBY5gC75zWLZETs268XF2z
 L6cak6UYOK9CY1F+mIrkuHqMsA==
X-Google-Smtp-Source: ABdhPJyOBcEuCykKRwQ1tISGpl5YGfKtAv9TMxpjemWPxnPOEKCEIqSrp+SD7pfiRdTm158pD4C97w==
X-Received: by 2002:a62:7617:0:b0:4e1:5f3b:2643 with SMTP id
 r23-20020a627617000000b004e15f3b2643mr5092223pfc.13.1645747495832; 
 Thu, 24 Feb 2022 16:04:55 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q24-20020aa79618000000b004e0e89985eesm588433pfg.156.2022.02.24.16.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 16:04:55 -0800 (PST)
Message-ID: <75519d95-7c55-63d4-513b-9e8c499f22f9@linaro.org>
Date: Thu, 24 Feb 2022 14:04:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/14] target/hexagon: Add missing 'hw/core/cpu.h'
 include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220214183144.27402-1-f4bug@amsat.org>
 <20220214183144.27402-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220214183144.27402-11-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 08:31, Philippe Mathieu-Daudé wrote:
> HexagonCPU field parent_class is of type CPUClass, which
> is declared in "hw/core/cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hexagon/cpu.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

