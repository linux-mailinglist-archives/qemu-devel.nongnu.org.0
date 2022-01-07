Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1598486EBC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:25:33 +0100 (CET)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5d4X-0007eW-0U
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:25:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d0F-0002HI-16
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:21:07 -0500
Received: from [2607:f8b0:4864:20::52b] (port=34494
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d0B-0004dt-14
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:21:06 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g22so4011059pgn.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0tS2qXixoLPtsZb2dfxChQEiI64mUkERXoUjHixx/bc=;
 b=Yc2nrTbYtUOIj4li9yBcm6o91/6nINoqQeSt+Zt0jyXi3cECdsXlFj72gTBuX6RPOJ
 kSwxzGrBZkECiC2+pVpZdvq5nF2BDyKoHozg4e6Hw/uEHxQwdWG2TMHDt/Wv/VtqQy5F
 LH7S3LnMKCfvwlO46v7OpfNXUEwujf8ZUsTvzbSOTQZBPuM/lWBt7E41GDEfoUir51eQ
 JFywj9L3IxsbNy2nzDm9axr4xlGyIHae2jMmop1N5SbQrHMEsefoI1JyklfWeRF+kvRy
 P611zScJbZLop9mhiBoojFdlNoxx/+mSZ5gFLVveCWWX1Th0kuGimYrTgXIj+9KoebwJ
 4u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0tS2qXixoLPtsZb2dfxChQEiI64mUkERXoUjHixx/bc=;
 b=CddxOm3uXZrXMHLP+/jk/5sdYFiD4fSAzYsLM2ATJ5BDB0ZSdcx/lT7snm9RtKdezM
 6P9QRGP9GfwE3Z5rg6G+uIrN0OXqCYD6hwsyWizYr7kwmyYF69crTwurPlD4UjXKRXmU
 HPDttZ4gqUcnY55QXz9e+u40vhFmFxZIUBwQ6WIe0nw7L/RflEImVMXXb4crav32h5sr
 1AsM/5oACt2KHFaHmojqFY3/C4Fakc51K2t1RRYMWH+3L1V/I2nfcescR52sjaGSKuwX
 vnE3VPwvhDdwYhYaZPZQqMrIeQje4kDefMj6wlQ7iMNUwzN0NMwfhvxhsH4E+JaDhGb/
 NFkg==
X-Gm-Message-State: AOAM532x8aQJCFCLDEbyAOusLKwJk+3TSIWwL0GGMBOYwgNG1GhiZNow
 tb5t5f2OcakTnHSGdHbrS5Y+WA==
X-Google-Smtp-Source: ABdhPJwr0yDjcMeFKLULTm+nwHaJ+RhXz7cCsJlU8sgIlM6pJ9/nd6F97GTZsqe9eFMpu6qncnd74w==
X-Received: by 2002:a62:1b0e:0:b0:4bb:68f4:26e2 with SMTP id
 b14-20020a621b0e000000b004bb68f426e2mr62727094pfb.34.1641514861753; 
 Thu, 06 Jan 2022 16:21:01 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id r10sm3612926pff.120.2022.01.06.16.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:21:01 -0800 (PST)
Subject: Re: [PATCH v2 4/9] hw/dma: Remove CONFIG_USER_ONLY check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2282448-55c2-88fe-2e0c-c6ff969205af@linaro.org>
Date: Thu, 6 Jan 2022 16:20:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> DMA API should not be included in user-mode emulation.
> If so, build should fail. Remove the CONFIG_USER_ONLY check.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/dma.h | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

