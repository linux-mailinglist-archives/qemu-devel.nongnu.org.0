Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6B51955A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 04:09:19 +0200 (CEST)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm4S6-0002qx-K4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 22:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Qg-0001xq-Rc
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:07:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Qf-00046O-BA
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:07:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so3937270pjb.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 19:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JV618TXYuI0qmNg0s+iNtR8lSFuGFUxPwe2OlooYpyE=;
 b=U5YegX3b34yKc20KReR3VToQQ/2Qk1mHIidu5FEq/IsWW6KtshZt38vKMZQuRrss6+
 HzHPC0Z8STIN7jhJyNKJYIH/OKGoSDPO+HyfWfDsbAxD/5nNEhHpynLHzlpXd/Go9tNp
 3WmoEf5Uc68CIO8k8X/SWl7T96NLBx+wvAP5PZVXucJ6VWJpSIo2sNnQgPn6F6uzt1rE
 85fB4djoHcmIeJi0zsxl6+Ul4NxgfcbhVgCZfUx6DLP9oqi5DEURXW9dwdrC57lyYeXb
 gzcAx/ND8F0MvRXzRxDdIHDhPaadckEHY29wkLy3muKgQOLvTZFlWz1QIab9ZfOvVGon
 XZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JV618TXYuI0qmNg0s+iNtR8lSFuGFUxPwe2OlooYpyE=;
 b=KeowWcN4maz9KHw+8DXLINbYFEmXFnVlyKFO4ZChkS0qxshoxJoc1ZJA7kG8RZP23M
 NcJZKxocDq/2Ey+ZONPgq/YwbmVcp7t5qr+o0cwoxDqkpPrVU+rnFqyh/GvCB8SbK0/r
 jCYvWW6XqgL4Ja1qwMvJVa0CNO3l85cbxL5+ezm3lEtqmjNzVuSvgYPot06Rk3f3oePg
 7ieki9UpVRSmj8OeeRGD3HSkREPTJELaBACp2HzrDplmZsK84GDoWXEntPTbqrbqUGAM
 K6xSBp/tSa/EptDQe9ZpcJeyPOSmAQ9qel1s1hObKmTngVfYLXse21UGJMCSBU6T56xg
 G02A==
X-Gm-Message-State: AOAM532aE82fiE8FfN0h4Ku+voFv9C+jrq2fEZPPa8KSzcZqPSd5arig
 jmMNcIPOitX0zXuwnTP8IJzA5A==
X-Google-Smtp-Source: ABdhPJzbBnSH0/XLq166Kn8MHNhYANkvjVUi1pXt/GSAUxa0ShuZEK4y182GaP7+CWnKkRBc/qOcrw==
X-Received: by 2002:a17:902:f28b:b0:15c:5c21:dc15 with SMTP id
 k11-20020a170902f28b00b0015c5c21dc15mr19805535plc.16.1651630068168; 
 Tue, 03 May 2022 19:07:48 -0700 (PDT)
Received: from [192.168.4.112] (50-206-49-78-static.hfc.comcastbusiness.net.
 [50.206.49.78]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170902690b00b0015eab1b097dsm3717501plk.22.2022.05.03.19.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 19:07:47 -0700 (PDT)
Message-ID: <c3763346-d355-f239-8c73-21c2c4b27976@linaro.org>
Date: Tue, 3 May 2022 19:07:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 15/21] target/ppc: Remove msr_dr macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
 <20220503202441.129549-16-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503202441.129549-16-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 13:24, Víctor Colombo wrote:
> msr_dr macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v3: Fix the difference check to use a xor
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h         |  2 +-
>   target/ppc/helper_regs.c |  3 +--
>   target/ppc/mmu_common.c  | 10 ++++++----
>   3 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

