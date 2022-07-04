Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDDE56524C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:29:20 +0200 (CEST)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JKR-0007nz-O1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JHT-0004jL-Dj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:26:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8JHF-0004qb-Qj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:26:14 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so2914893pjn.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RjydZm+EhzT5qv2NHeJyCOJOQYnCchnfrhWyvuQ49lk=;
 b=CbdJlkE2e/DeFnumG3EftUFXgS/iSWx2XpS/iWPKA6AZaC2Hll3Gxhxb3Ale1fAi0/
 9+ulOAIdzjYcHLD9iyFGI7vXwrWbAgy5aK/VCnr4tBgLvVdvonV552QIvsWEU3mFiP8W
 u+iynU0RKU7HFYjPx+knwwkpMDGRM3+aIuZLHfC1hlBk82ksqkSffR7qoyCpApWBMC+Z
 E4pK/Bs5VkfuEpNt0d0NgOkyXHEc2VdNBNb+ynaKJtE7A+H5VKYTr2LTGhDUsDAAIBqa
 y7fcijZg5ItzwHNzzKwKiYkLr0JADw0aztocqHYMSUaJrZISmYODpsA+KmGPQMOGv2Zx
 66yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RjydZm+EhzT5qv2NHeJyCOJOQYnCchnfrhWyvuQ49lk=;
 b=iNqFViVnYxpW1Zqb0BRdeKccXAhfjf7G/5jn4xnnxusnzcnfbV8AOR7sW3Pg+5eQU8
 4w+zsNT09gmNnfL3T5trFRfOfGBIr1DfKEFfABPRHyOkJUqv2mKUISlhf9/SyefRASjZ
 RlQOBVKOYw3QxHZfvs91B8KnSvroQ78WcnQGuvf+cYJXsFnkekABK/u53VWc7vg4tGXe
 CptVlEY0y398FISRxJ6JnkujEmK2Er0+YzdeE5rIBZxoobVLqt20YApQqCYFOLLpqRha
 Mq9l604godXCAScY+4qmNOkmERB3iEmykC4uzpn2JdO5yNGLIz3YYSjRlvoHQpXdMcbz
 1Jkw==
X-Gm-Message-State: AJIora8jUdH/R+WaCQCJwJ39czxuVtR5/Xz6oKex6I24Wyz/FWjGm8Ce
 tde+RCrfRdFno+8g628UNOo8bw==
X-Google-Smtp-Source: AGRyM1vHlITKiE0ELKBPerd8N/WUvQcpuoA98RAtFUvSJMRRp1ht4meIyoMlxQqAJ+UD4F7/S5ue/Q==
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d4b with SMTP id
 q18-20020a17090311d200b001678a0f8d4bmr35549317plh.78.1656930359288; 
 Mon, 04 Jul 2022 03:25:59 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 i72-20020a62874b000000b0051b9d15fc18sm20668046pfe.156.2022.07.04.03.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:25:58 -0700 (PDT)
Message-ID: <1687d5c8-b1f9-a51e-5280-f8da99500e6b@linaro.org>
Date: Mon, 4 Jul 2022 15:55:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 11/11] docs/system: openrisc: Add OpenRISC documentation
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-12-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-12-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/4/22 02:58, Stafford Horne wrote:
> Signed-off-by: Stafford Horne<shorne@gmail.com>
> ---
>   docs/system/openrisc/cpu-features.rst | 15 ++++++
>   docs/system/openrisc/emulation.rst    | 17 +++++++
>   docs/system/openrisc/or1k-sim.rst     | 43 ++++++++++++++++
>   docs/system/openrisc/virt.rst         | 50 +++++++++++++++++++
>   docs/system/target-openrisc.rst       | 72 +++++++++++++++++++++++++++
>   docs/system/targets.rst               |  1 +
>   6 files changed, 198 insertions(+)
>   create mode 100644 docs/system/openrisc/cpu-features.rst
>   create mode 100644 docs/system/openrisc/emulation.rst
>   create mode 100644 docs/system/openrisc/or1k-sim.rst
>   create mode 100644 docs/system/openrisc/virt.rst
>   create mode 100644 docs/system/target-openrisc.rst

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

