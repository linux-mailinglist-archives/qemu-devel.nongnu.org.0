Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223EC4C014B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:30:07 +0100 (CET)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZvJ-0006LV-LN
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:30:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZtg-0004lE-Ra
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:28:24 -0500
Received: from [2607:f8b0:4864:20::1030] (port=54857
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZtf-0004ih-88
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:28:24 -0500
Received: by mail-pj1-x1030.google.com with SMTP id b8so425749pjb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 10:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lxF0AEBeq6o9F1n5e1ekuWVooBLofAbeZ0tcyN4VsGY=;
 b=fawk5pjRjzggtfLzsqi9yJpdMMXsFIETCLUayLiLk8nL+ubG0YFWJRTFLaLEe5Ehzh
 KtF0/XQd/ShHu+sVPIc6EI/Q/y1pDSox9QvGhjPrqzpKRUA7KZX1HxzjVft5W1BAF/3j
 9eDRDxvE4XVo9oQmv+XpCpW/trcOa1itMTAfi9N3597UpzTRkxl8bw06XpqPbrc8gyje
 06gw4fWJF98+qKrXKz83qFhKMu3qM/HG2bx9FZ6c/aslBHX8AD3hph0t9X1x4wpY27kT
 u5fWXJYqCfiV17DxnP/6WdBEhBTbH3YMcZy2Exouln7bdBcw39KYPjLf7KMQUlkHRL8j
 xw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lxF0AEBeq6o9F1n5e1ekuWVooBLofAbeZ0tcyN4VsGY=;
 b=ekyW9SzkD9bDXzaOKCOw+S6wRkCTSry8S0yYPst5pgwZHKhMsno0USWl8qtAOy3yg6
 YnXgGyZhHS84hWxV4AdcgPWeUkqOODtVpKM5yJOvsMGvuOaT4+J49sRrzYa6ExV9B4EB
 /was0BJTvd2bBDLPC/6Bw8rFbcWJtNk6f5q4WDAvczm2lLN/D+gIEiRCVkBxA02xntq1
 pIDz2lNh/I5KGE00OTob6P4iz7eOL6rfiQpo13T8QH+W33qez/Wcbsjsf1pKcSIVKPYd
 kplOQNETzIiJSKO5K14C9ADCNptmv84MBg8NHhuISo9Lla+4xhXoPanR99oIVjCOz3ae
 9KBw==
X-Gm-Message-State: AOAM531rJ5zYdozUXgs6YBvpW6/gyQYnOMW2VVAi5TpQ+hZrHSi/YdtC
 bLbDh1TXQrwOJoAMeKb7awpTfw==
X-Google-Smtp-Source: ABdhPJxxZxCCggmEs3gl1vowuuWDGdVD6fV2zeZjncBhDTcZXIdPX967ULOkVd2ySHC2TatlwW/zZQ==
X-Received: by 2002:a17:902:ec90:b0:14f:686a:7558 with SMTP id
 x16-20020a170902ec9000b0014f686a7558mr22294995plg.31.1645554501755; 
 Tue, 22 Feb 2022 10:28:21 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id p27sm19474265pfh.98.2022.02.22.10.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:28:21 -0800 (PST)
Message-ID: <97060d03-dc73-5f28-a762-709395696a96@linaro.org>
Date: Tue, 22 Feb 2022 08:28:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 05/47] target/ppc: Implement vmsumcud instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Based on [1] by Lijun Pan<ljp@linux.ibm.com>, which was never merged
> into master.
> 
> [1]:https://lists.gnu.org/archive/html/qemu-ppc/2020-07/msg00419.html
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> Changes in v4:
> 
> Fixed dead move into tmp1
> ---
>   target/ppc/insn32.decode            |  4 +++
>   target/ppc/translate/vmx-impl.c.inc | 53 +++++++++++++++++++++++++++++
>   2 files changed, 57 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

