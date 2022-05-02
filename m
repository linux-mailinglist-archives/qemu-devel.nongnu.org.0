Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E375179B8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:05:50 +0200 (CEST)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nleAv-0006mW-Nm
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3x-0005va-KJ
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:37 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle3v-0005RS-Vk
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:37 -0400
Received: by mail-pf1-x432.google.com with SMTP id d25so459003pfo.10
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VwexWvuzvAZJIRgbrRtoGv1Z/Xw67lsBd+d8D7Howg4=;
 b=qNjJm0cCf8uKcvieHvyszqgwmgHZS7pdP2dxzFPnYrdtyKDio2bcW2w7/+vVDtYEG1
 LgCMjMGPQpy9/1+3bK9RRGSJ8XeVUO3hShyPu7nxZdm3v0Sec4EHNq4BFcEwgDbe1M1h
 zvpxVUxSNtulg1XPHJmesUgdxuxvi12vAxVT8O0BOuZyaOJ3riwc5k5Tfi+11zu3X2N+
 gZu3VxrKQK2XmeikPyYE33HLW5MJZKdqoXn0CcuYv/ShS9z4L50g69fzpreNKRjmzGr1
 kcdoH/cnaD0Alqw+D5oqdmqnQgXRmHLx5SPFczyMNdA3mEOvgd0Z+SfdccT5uriB5M05
 S4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VwexWvuzvAZJIRgbrRtoGv1Z/Xw67lsBd+d8D7Howg4=;
 b=OuG5k48rQl4hpg8G83pjgM0Y48geXriD9oBQ8K6OntMvVgSP3Vygizh6jzZY67/W75
 IjhiSd2lD0Q1bxxHwtCyU2ltuhiXXVdx2NREK+pwyQswanGD+CpxQRI8kbfHmqDhoyT+
 KJ7JCeV7vl31diHPWb6QBuZhmK0Ubt7BwFmnO5AA++huYn1qcjZuE7UXczMbtF9q5DPv
 NLnGm6UNB75fKscqwXEl8dAZ4ykOZm5oE7aCTwvpCMqggf4PJtviFZJYiCbPi/6xoRog
 hO1lnuzj+RLJHOOt9ekisLPKLb9cR0kiJPIvOionS2T9EhZ9itqWwVKXaiGiauJKQPWW
 3luQ==
X-Gm-Message-State: AOAM530KgoKNUGnmoE2Sq87gfBWDZhxDdCq5HNM15JH76W4CgphOf83q
 IfnZBfX4nqcu9RWIdrqjhg16VAz4oe/afA==
X-Google-Smtp-Source: ABdhPJwDTGWNAar3Cgd9fqQIbaTguGxOiummHhmp008ZUjW8d+UMWbGbARhqNhsxdcytAm9mCAvv/A==
X-Received: by 2002:a63:1114:0:b0:3aa:30b3:dd5f with SMTP id
 g20-20020a631114000000b003aa30b3dd5fmr11379852pgl.222.1651528709315; 
 Mon, 02 May 2022 14:58:29 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170902e38200b0015e8d4eb2d8sm881216ple.290.2022.05.02.14.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:28 -0700 (PDT)
Message-ID: <711cb3a1-a3f2-9dec-8a05-21c467f3bb35@linaro.org>
Date: Mon, 2 May 2022 14:58:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 09/21] target/ppc: Remove msr_pow macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-10-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-10-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
> msr_pow macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

