Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992314ECC68
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:37:32 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdCF-0003Jr-Mr
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:37:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcr8-0004o8-E5
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:15:42 -0400
Received: from [2001:4860:4864:20::2c] (port=45830
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcr6-0007Xg-Us
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:15:42 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-d6ca46da48so22844565fac.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h0ouw7Pv7xxfXwG8JVA7+1/iSiQXoAk4aGghGeyks+g=;
 b=yEgxpLZHuVj8DNh5+TdDqNoEkINFvlve6yEgUOAJ8U23unJkF2OJ5CYs8V3k0Kxx9t
 63afOhi89EyA8PVresxi8MSklhrx1R4hXvaSqAMAsA0V10edePrmGPVJbYfSsrYRK22H
 jkwYvTwIuyd7Ku+UJcCrVI9vaUEOFppRl1AvY+u5jfaLVtwoendtAsXyGX5G92T4YAfx
 lx8sCWRabjwMk5m2s0tQNmm930etNceV7aDen5RT8/XpNGo9vNg9VxKQoQIAIkadyGWi
 TqDqNSmSzIS05otw/6pdkDWXgM+Mvwggix2UaxlDji/ZjNL1Szlo+Kui8aMK14hdB2Oh
 pxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h0ouw7Pv7xxfXwG8JVA7+1/iSiQXoAk4aGghGeyks+g=;
 b=fPgtRGVKi/bk3Lji4qQVzbGKaK0OvwhQsTbGsx/lBFvvkTRPscVmbFSpX6jSH1orwy
 QNef5+7YggfPZLZaq4zaXkCAX8PEQ8hR86Wf5rE+u2W27NpHwfdHtq0YCm05pC6qaBDI
 0u94bNkvQVcAcV0FR6TJscvF1iTO9JOygGrJ8wW5S/FoDL4m5ZYVnXCAMaWa8a2tG/dY
 gKQ5NfC1IbA5VNPBntBltX3BUfW2fNPZzpLt3YSfNQ1ASdNXvgW69oXyyM/d69T2enq2
 R9QkVMeiXIlaAGD7XN0IoboohedWMSA32u939EAWJPquaNS+6F0shPnksMbvTXAP3tUP
 nAow==
X-Gm-Message-State: AOAM532+7DMS5yYTAAf/inm0vVAFnMTREfqyhfCrKPkpyBh38YMrXTKm
 bzbw39qpGXwaaUSXLKduknUEtA==
X-Google-Smtp-Source: ABdhPJy96wXauDaQj08CmUy69w5obj2K2Up0/XeEw+dird0JB90obNjwRbFzuO/gAL/KuahfUOrAhQ==
X-Received: by 2002:a05:6870:d1c7:b0:dd:b68b:8d4a with SMTP id
 b7-20020a056870d1c700b000ddb68b8d4amr484971oac.255.1648664139468; 
 Wed, 30 Mar 2022 11:15:39 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 g8-20020a9d2d88000000b005b238f7551csm10517563otb.53.2022.03.30.11.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:15:39 -0700 (PDT)
Message-ID: <e09bda29-7d7d-d720-c653-e796b8749786@linaro.org>
Date: Wed, 30 Mar 2022 12:15:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 7/8] target/ppc: implement xscv[su]qqp
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-8-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-8-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 11:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xscvsqqp: VSX Scalar Convert with round Signed Quadword to
>            Quad-Precision
> xscvuqqp: VSX Scalar Convert with round Unsigned Quadword to
>            Quad-Precision format
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 12 ++++++++++++
>   target/ppc/helper.h                 |  2 ++
>   target/ppc/insn32.decode            |  5 +++++
>   target/ppc/translate/vsx-impl.c.inc | 20 ++++++++++++++++++++
>   4 files changed, 39 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

