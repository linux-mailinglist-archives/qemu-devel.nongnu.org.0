Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57D6AC524
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCpu-00012Q-T7; Mon, 06 Mar 2023 10:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCpg-0000h3-Nj
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:33:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCnQ-00017l-ME
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:30:45 -0500
Received: by mail-wr1-x431.google.com with SMTP id v16so9299093wrn.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aqG/eBUiK+6rnGgEpRQ9KBqIslKFePvqNfyfCjZoEks=;
 b=Ti1llu051fd4OAtIrX6+bYgi7hHIL/jaM2WuWH5QfLexafbcHttvG2hk7b3ulervAz
 995kh5oZ1zejaNgONYzJYX/I7AVjnkKZ7ZQloIM3dVCJwdg4//qMfPQwtMMvwxkrUP79
 +PPgpJhzy2pWmmJEriFi+II/3/cq37vZXznsh2M6Z+WDy9WA+xRqp63Q/174hR3AI7cA
 LZwXtDPOMDyAFFSd6/DgGjB0NO86d1vaBZacgKY/CgRAizUwfivZbNOU7n19dDAoIGPh
 m8bM23yLRbeN9VhvO+tLqT8DnT9Rj1DPG6sRTEcB+LPZ+vVTvXpiDNEjNhzx5AdnKwL3
 sxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aqG/eBUiK+6rnGgEpRQ9KBqIslKFePvqNfyfCjZoEks=;
 b=Qu8lsvyUTlmucEoCJiXqtnP0wrDxHtW8bLTz8RX7SKENUjJUGwj3RXD4LL20I35JTZ
 j2qAaoGL92Og27ohGh1ESKTnN+1EYHnBAZAtq7+shmP4GBxW/n2jJ6awo/MmhH8pDjSo
 VzPVTJq9ZLJTpat4pJQo3k7GiR3RfP6XKcwdaqlG/w9lhzQ9yPqOKegZ9MJyXHwz5s4/
 EZICuqODkAQTMqjYRdPwhYAyrcGbIyT19rFIGGNT9FEKxt1fXIDftbNR9vC9oNLwZAmA
 xl9Qb6OABBgCg/Dioz2V1hXIVUi/0EMdhyGMl7f02VegbQqp9j6T5XtZ5xG8tnjl5PRO
 oXOQ==
X-Gm-Message-State: AO0yUKW9V2nNfYo1/VagYk6lDgPcZGSzkjw0SKY1ZdNya2eFiwPZ0ffg
 hwwGPqV8BXGKv3xu34SxHwbd7w==
X-Google-Smtp-Source: AK7set85HdHELzw76TBRGntBBDgyXXbvop7jHbpvDtmBnbSU2lkmia4VLTBOorTR+ACabG7hWo9tYA==
X-Received: by 2002:adf:e48b:0:b0:2c5:4c7d:53ab with SMTP id
 i11-20020adfe48b000000b002c54c7d53abmr7167207wrm.20.1678116629205; 
 Mon, 06 Mar 2023 07:30:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a13-20020a5d508d000000b002c54536c662sm10371923wrt.34.2023.03.06.07.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:30:28 -0800 (PST)
Message-ID: <19988edf-fdb1-5c57-7ea3-1a50f38d972b@linaro.org>
Date: Mon, 6 Mar 2023 16:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 70/70] tcg: Drop tcg_const_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-71-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-71-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 27/2/23 06:42, Richard Henderson wrote:
> These functions are no longer used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op.h |  4 ----
>   include/tcg/tcg.h    |  6 ------
>   tcg/tcg.c            | 16 ----------------
>   3 files changed, 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



