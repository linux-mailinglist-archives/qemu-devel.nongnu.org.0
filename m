Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C762050EC43
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 00:48:14 +0200 (CEST)
Received: from localhost ([::1]:53874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj7V7-000838-FQ
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 18:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7Tt-0006Kh-Ib
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:46:57 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj7Ts-0000hW-1y
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:46:57 -0400
Received: by mail-pg1-x530.google.com with SMTP id k29so14497726pgm.12
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 15:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hzRAjEzPzU4YeZJm1BdaqHGFb4j4Hbz8i4U1hQX3ETw=;
 b=e87d2HLLduPOaXbutmm7g33jUFBeA5ePKYoRVTgYx2OavlD/Yywc/fdbt5FigBf35Y
 9sqhbPPx5fZF0oS53CSOeuW1YohwakJdpzFvVYdJi+OEzv74CR3n34H9b/80eOSSPXVo
 KboR0bmHDY8jIXZw9FoLBnvBw+L4/LezzZS3TfYamDohq8VWQXo3A2WDEqFd1hDm0J2X
 zgHWSjBqXVmZvGA6lcJ6XJDJw2JDPe70H0UqdBZ6Sfo6Y9QbXOUq3iiacZKzzxbcPcXl
 5oZ9ohhAqFyN3YUj51G1QvaKD60n799F9mlc67SFJKhfaqLnv7xPp9fpsCbA5t6F5/cd
 Ckjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hzRAjEzPzU4YeZJm1BdaqHGFb4j4Hbz8i4U1hQX3ETw=;
 b=oFQ8sHeW2pKwJdVXJCln0agxvyauB+EgblBSHmRg2sxBiss61zzAc1b4Slu/sXb8jL
 52Ls2HCIUWqX2kbFzyT+lYfOxl+iWN9OhctSb0KLCEAAp5M5wOitonyocHYbX7eH2EXJ
 Le2UELnO4oiPsohG9wPcr1ZCg22Fy25wbYbWbbsHzaAdVVBYZFcyEvbq2y26ccUwN6gz
 JSZEFus4mhUdOVLX51qLZPyIKz9X3c8pSJNYPpdCuf/gze0+xaF6jbDWF+JJKZs3o0eh
 oP96HqOfWZuMiWQyxz4mPVnYhZ3p1K3De/lGWHJ+1WHEpZWy+jcVgPcTj8pGRpm3mRgX
 adaQ==
X-Gm-Message-State: AOAM531goYZb8Tz5IAEWVmS0uLQ6FBUZ9bb7eguAFL2lviMbt/shZOGB
 qeD5hseKk7WopyTEukdIioGW5A==
X-Google-Smtp-Source: ABdhPJxQpHosXJ7ZEsd/pPQ/fDVorsCP/qrPWeeFp7FdiumAi0cDfLniPhB0fq2WqVjh0kvrIgUa9w==
X-Received: by 2002:a05:6a00:2482:b0:50d:481d:b516 with SMTP id
 c2-20020a056a00248200b0050d481db516mr4339994pfv.10.1650926814488; 
 Mon, 25 Apr 2022 15:46:54 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a17090ab38900b001cd4989fecdsm354799pjr.25.2022.04.25.15.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:46:53 -0700 (PDT)
Message-ID: <d624aaf7-96eb-3350-2dc0-80810870f141@linaro.org>
Date: Mon, 25 Apr 2022 15:46:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 20/43] target/loongarch: Add basic vmstate description
 of CPU.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-21-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-21-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> +        VMSTATE_UINT64(env.CSR_CPUID, LoongArchCPU),

Again, using cpu->cpu_index.

r~

