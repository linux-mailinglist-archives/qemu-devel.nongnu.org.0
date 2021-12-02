Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA19466BC6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 22:53:20 +0100 (CET)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msu10-00069l-Kl
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 16:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mstzU-00057w-Ef
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 16:51:44 -0500
Received: from [2607:f8b0:4864:20::430] (port=44860
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mstzS-0001xh-MP
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 16:51:44 -0500
Received: by mail-pf1-x430.google.com with SMTP id b68so854378pfg.11
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 13:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xDojBfwXOfXsiC8c8mskyM1t9EGG7TCI3Vg4fyen7PE=;
 b=DYklyWZLbsrY9wdSXYwre+NdfLvOvqLrZQDzv+MGZhrtpXA4JMIAaqVg+cneoZWCDo
 DpiA3DDRY+T2aQtIHffja+pHZ3gO2+HpFWdZbOyXKIHjgIHuB3NVTxTLMGcZsaHHqO64
 SP+W08GvC8mI3JOpqAHPcZl9yCQ9Rg+DWAA+34p3di6Ae7I3CX34ieV3OB4uNTHHotLS
 eZNIuGpyFbh+MB8x+aN4ZwWUJVYc6FjuLOH/K6Fdei9dvkloqfY7ShfaqkFEwyY7ecc1
 03sJU4fz6Kk1vmtcE3nFlAFKIS+CSR78EcJFL+ijc5/bv2qX6Z3fT19AG/RpYKLj5Jdw
 0bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xDojBfwXOfXsiC8c8mskyM1t9EGG7TCI3Vg4fyen7PE=;
 b=gJnF9oS+YAy+8h2z0WrhiOp3XQc4y6haSpnQ69H+XfgOvghTqY/y4t4Kqe83jXRNaJ
 e0QD+gN8iiHTcYXT+TNjJ4437RCCmebaKybrnltG4cOawV79bZlmAEQA8Ie+a1MAo+Q0
 DyYvnT5Il6RUHh433BYwD2f8P4dGQy/NT0skeyzLAmvS9UKSa7e4j6VE0vOCqz9+Iaap
 RqZraWc6mcGMA2FmDLkU1hlvJa+gmDlgx3woTbbMGi4SjKNLBlNWDqZ+r/Q8k/h7iToj
 tTw50NItNursWwaac1irsI4rZq0zVKEBsr0FJwT9q07VztJ+2fqku0tEnzdwMkw8AqMR
 UcDA==
X-Gm-Message-State: AOAM530PTJ3KhivLI94e5Qm/g27m9jOIsZOpoPncBX8tZndblTVzRGMf
 ul7kAia2w1OQuFMtCd+vVF/ZAw==
X-Google-Smtp-Source: ABdhPJx0luWr7mB+xe611YzzjpoMdsew/DOZbBzoiebPhyqrVbntXRg7s//rubAalz5ZGuXJJVNRcA==
X-Received: by 2002:a62:150e:0:b0:49f:9a61:962f with SMTP id
 14-20020a62150e000000b0049f9a61962fmr14903788pfv.58.1638481900636; 
 Thu, 02 Dec 2021 13:51:40 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id j15sm735102pfh.35.2021.12.02.13.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 13:51:40 -0800 (PST)
Subject: Re: [PATCH] target/ppc: remove 401/403 CPUs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202191108.1291515-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15b71086-3e31-6c97-36b8-041d08b313f7@linaro.org>
Date: Thu, 2 Dec 2021 13:51:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211202191108.1291515-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 11:11 AM, Cédric Le Goater wrote:
> They have been there since 2007 without any board using them, most
> were protected by a TODO define. Drop support.
> 
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/cpu-models.h  |  19 --
>   target/ppc/cpu-qom.h     |   4 -
>   target/ppc/cpu-models.c  |  34 ---
>   target/ppc/cpu_init.c    | 512 ---------------------------------------
>   target/ppc/excp_helper.c |   1 -
>   target/ppc/mmu_common.c  |  41 +---
>   target/ppc/mmu_helper.c  |   1 -
>   7 files changed, 4 insertions(+), 608 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

