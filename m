Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DB5179B5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:04:38 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nle9l-0004z5-Nz
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3T-0005Mn-IF
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3R-0005Om-4N
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:07 -0400
Received: by mail-pl1-x629.google.com with SMTP id n14so6630391plf.3
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uwbNtCTtyf0rnpg5ChhGm8zqU4XFLUY3WkEnPoW7DWk=;
 b=mdCYB+wZkP17h9Rdlre0mnE/3m1ScdtD32iApGHJZuKylWI+p7kd2RdtYmDC1ew9Jx
 tRE1rUX0XeTjeWltT77pZKDJkeBbJEnpwcNzwffeeuoi//xwAz1oxVka94+ILMcVKLry
 FNdo10R13yHMHTTcrwQgLAoxiywh5t5hVE4qgBjNh+vdjAWhvy9TkkPBDFMMTOMSQbd/
 q3GktO9W+YsGeQgE18NyldHTlPxBk3PqSFo667Tkjb3kfTcT4uoVu6LjNrnPTC8TSoMK
 kQ0JiYT57XrH86A996L0xwyI82V6JxRU90pOVoWbNpPXF2AfjdCT1+ei883uVjWeFayS
 eYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uwbNtCTtyf0rnpg5ChhGm8zqU4XFLUY3WkEnPoW7DWk=;
 b=RlguTiS9oMhgjxcLn7XZ9gfsdGa9thUqmRUCG/BOftmJhxxjqK9Xosr9jfkgmLVg1k
 vZE2KMtXUBI3I1QPQMdlIuPh76/GvrGX/dsE5OdHKZ5fwyXWtvKp7kSewcVRbleKrC/l
 7pg7Qx1kU2r4nJPHciOQz54x7HiU/940veS+NUXAKx6L+l0AxhTGX8umTXy0uF8u3kQ3
 tPS+7RI6RWtHG+j15dcpm6HqKH++x8msypgaZ4S9aCmGP1lkkHm77ERwzeGnSFL1t0qq
 Ha2XFRHkGVFnIbm6MTgCkVR3sSxuFmFfLXNh8AoAexgQkdE4xpPNT0FjjSCBtg2ARUUb
 86vw==
X-Gm-Message-State: AOAM531bTG5Bt/hxISBhLUb7vt++iRbfOpMB4PFP5md470xw3ouuMimM
 uH79X9sUP1k/Gg8LNfUFoWCL2g==
X-Google-Smtp-Source: ABdhPJzWpDmmU7cp8fCMOafb/Uohb+VA3iSk2wwJDdic1Ra6Og9ZzaWO/+a+MQN5AhX06A37pQXz2Q==
X-Received: by 2002:a17:90b:33c5:b0:1dc:35c:9e2c with SMTP id
 lk5-20020a17090b33c500b001dc035c9e2cmr1286129pjb.163.1651528683885; 
 Mon, 02 May 2022 14:58:03 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090aa78b00b001d5793b6f71sm181660pjq.13.2022.05.02.14.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:03 -0700 (PDT)
Message-ID: <21097f0a-7e54-42c9-3695-d737c69a79b3@linaro.org>
Date: Mon, 2 May 2022 14:58:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/21] target/ppc: Remove msr_ile macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-7-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-7-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_ile macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

