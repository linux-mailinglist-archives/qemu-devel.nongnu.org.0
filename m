Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E769F211
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUlfw-00027G-R6; Wed, 22 Feb 2023 04:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlfu-000247-IW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:44:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlfs-0007n3-Jz
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:44:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id k37so2245608wms.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/h1eOX6xhRMSZNMG+ynl07GSlK6R/9wcuNRBp1fL4hc=;
 b=i5kD92VseiHvlum0ywcrxkM3x/3FZzBa7a4uj+sNKD5DJI/rXQBOx79iqIassH35xd
 Uptgs6v5GkUBAeW5Ib8CkXNEf0ezs2Wkk9lFnTav+s7AweCW/2FEX+onYxe9yQpAjHGj
 C9uh6toqYGvmSHqyxMIpL01SkhiMkoDHBSP0gvH5Ad9rHRQkaQG+JQn969ufT8YMwYzV
 psl1n8yFJORjbkMaLOd4YBL+Lpm8Cd2cJrWP6fOHRL3Mbxmql7Iu/MRahyhcyGCQhMLO
 cHkHovTGGuDIFossrPA/E0wjstIbUYEsetEBusymwqaHdI2X7znz5W2lnOz9cex6y62N
 LtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/h1eOX6xhRMSZNMG+ynl07GSlK6R/9wcuNRBp1fL4hc=;
 b=rnRaeDASrTnWwHs+t9tfE7DMPbtSG4GRK73V2DCu+2ucVu9AJ6YDABkn91P7QaULik
 3Duz6NkZn0V28jrSwoaeS6zzL5olg2SqNnDTHKx/AHlf6HDHm9SIUMVYKvFVrauPTqZG
 5bRoNLwo/Qvl4AYPz4mTTyw475cloTfiPXP8AqERx103wWNIDB0nt9IH28T3ldGtd03M
 6urWaH9jPkjJBQ3LCZSFczIys8XYgjtj9uu49WFdjwTGOY5j18xsAvqymqltjeELlXac
 v51G2+3XNO7fFjpHt2qoKHNVopoNAfdGLY0iSipuXqQZQL3z1JZzeda8FN17qet3kMiH
 2Yng==
X-Gm-Message-State: AO0yUKVsCRtGUpww7AFdXcmmd5dMEN9U57m1PIQaKvjhU4zPKQUiJph+
 P2CRvePUYO4LoTXctUabB3I3Gg==
X-Google-Smtp-Source: AK7set8Gs5B66RiH8637P0XlAPNZ+OneqbMgDqGHFDOQO/OlFBSYp37hqEQAXG1/lVttc47Bz/RtcQ==
X-Received: by 2002:a05:600c:2e83:b0:3e0:6c4:6a38 with SMTP id
 p3-20020a05600c2e8300b003e006c46a38mr11765461wmn.33.1677059071172; 
 Wed, 22 Feb 2023 01:44:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ay14-20020a05600c1e0e00b003e20cf0408esm8238536wmb.40.2023.02.22.01.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:44:30 -0800 (PST)
Message-ID: <4772634f-dd43-77c9-9c99-e93369e8b320@linaro.org>
Date: Wed, 22 Feb 2023 10:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 13/25] target/arm: Remove __attribute__((nonnull)) from
 ptw.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 22/2/23 03:33, Richard Henderson wrote:
> This was added in 7e98e21c098 as part of a reorg in which
> one of the argument had been legally NULL, and this caught
> actual instances.  Now that the reorg is complete, this
> serves little purpose.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


