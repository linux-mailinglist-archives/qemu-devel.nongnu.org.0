Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E24414CAB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:04:44 +0200 (CEST)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3ne-0005ow-G2
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3j0-0002VC-9r
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:59:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3iw-0007ki-IP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:59:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 z14-20020a17090a8b8e00b0019cc29ceef1so4693657pjn.1
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jhZsj3oK+wL+QkbwkqVaGY/v/rDtYGVQCVx3yevGXlo=;
 b=AEL5Qm+7yoVcZaKjJSWIYtJyqFWRe1hsRu4jc4UcaJfrEWF4vMZziKwOAgmbQXgOrw
 ovVnBG81j8gLCF4ZObDihiGKcWWyYoBkEfMvfLWBlIKFGCxspjSzZ/jVvKwXUBra06w9
 YqBd4O9D210qlVAcNmQSTasgWbXmPxwhLM8y/Ny7jkE0HSZy/AlJWd7O3PHats74Yuj6
 kOB8Vrs2ZIKXvM6GuX/lvltma23aOqFbtcSQAmv/klMMPbGNcqxVcma7PllKAUMueJ/v
 r4so8fqF6mJPxOJSNa/chSad0eGeEd3Odc+FpcR5A7pV4R3XYbUkujHR+bZY2fxQJ5LV
 x4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jhZsj3oK+wL+QkbwkqVaGY/v/rDtYGVQCVx3yevGXlo=;
 b=EB+w/Y7Of0fLkwMPf/nVuY3tWtSakc1Mb7exPWSquBTdXNJ0AZwuo8gI48N3fZUUsV
 etxLNcgdVdauSO66x1+3NmJHnxU20i6kQIPV/CQ1+dptqQ1GnFqsExmR5Nl/Ezu+141Q
 KzZnFYx7PWvDcbmzfF21isB3Fv2+VhgjbXRzo7hjiwsK2S4WFcd1EL52PPp9iTs9BmlO
 LXbxat2vQgF2mWB6eQpNR4fbVxO9+8nAkQnMgvC4tXhPzVy9857qVFH67eoIrsVuot4g
 ACearHGO3WxAtc8UZSbzN6pv1jKjAyv0MYPK9/f+vPDL46EpIBPY6UQ03mg12jQOz+1r
 1KUg==
X-Gm-Message-State: AOAM530SVPt7utdyguhWJ+zCDbKS5mDS4XIQ4GJfexNrmsO60uzVghGE
 0I9ai31gdqogIgAoEbcWBzpEf1i3Ng5P1w==
X-Google-Smtp-Source: ABdhPJxWRHppVkio4GpDdE4gLgVdzCVU6LtNHW1pSKx+XK0uVPidUP7OcvtzQDEEecdKRQ1tAmnyfQ==
X-Received: by 2002:a17:90b:20b:: with SMTP id
 fy11mr4258920pjb.214.1632322789082; 
 Wed, 22 Sep 2021 07:59:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm3235448pgg.92.2021.09.22.07.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:59:48 -0700 (PDT)
Subject: Re: [PATCH v2 16/30] tcg/loongarch64: Implement shl/shr/sar/rotl/rotr
 ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-17-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a4f91c4-b3eb-3e24-2b7f-65110493ce1c@linaro.org>
Date: Wed, 22 Sep 2021 07:59:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-17-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  1 +
>   tcg/loongarch64/tcg-target.c.inc     | 91 ++++++++++++++++++++++++++++
>   2 files changed, 92 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

