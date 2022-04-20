Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326B509097
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:41:52 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGD1-0005Af-3t
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFmX-0005Ij-DI; Wed, 20 Apr 2022 15:14:29 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:37101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFmV-0002gC-3J; Wed, 20 Apr 2022 15:14:29 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e2a00f2cc8so3014423fac.4; 
 Wed, 20 Apr 2022 12:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3kmM25wyEH/u/wNa64nwovpMotU/SWRFIi8MqjpLLUY=;
 b=JTuAsT/4iTYWHhLretJuHbZIxIhOkWNFzZ9gy2SrSk/PBaHNPwltUFvUKjIi0QuukP
 z79GugQZXdwMqjWjn+gCH6BI/kh029IYJ6hTSk9u/IuA4yA2OjVKDN2b76OZ0glgphQq
 eFXK+SLFNmZM0N4jRFI8BmY0gSlFwRw8ZO0+iJ0kFzyIOmMKqPaLxxPBbf77DxxpafGl
 odW4aUDNv3ZhncbwsEJuMu3InX4yx2C15K80OYekso/DNyT7ZycBfwclNL0T0koIAI90
 CYOmzD18jXg6/r8zkUOAGS9Pb750cdvOuFa26bvfnfHJqaHkfxoM7T8k62j+xJzcPHqu
 K0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3kmM25wyEH/u/wNa64nwovpMotU/SWRFIi8MqjpLLUY=;
 b=RnaD8poByT8+Ifkeu4uz24ejTU933MAyAZ7ue2XXfopyY5Dv79FCgS2SmlUuJ80KzJ
 iHH6298wYSAY5ltIEA5HlVfAHTuGlzs7iz028H0YaCeLUJV4jPn2QqPVthEMyDVNqp2/
 frpd83ABUZz4cQxYSafp5hwloti1H2ts/Wn/suBt+Iag9ClMe0e528Rdnr4iBQShlXAR
 cX5j5Dc+jIC8e/on1+xCj2aFwdKd8tk2b3b0T50g/lkzEZdGbOo6rfs6n44jlFgVNbhN
 yM+yjlE3e/K6gLzW7z5W0jhIesgkRw65u2gBeRyvRAWirkKeBm0OGsWlYxSh4KEdXdWE
 WjhA==
X-Gm-Message-State: AOAM530o6E0jglz2QDP2q8YoIKcmxhCMm3ylFWvnSMEpqqcQlktqhcrU
 Rnowm/2BKd0DTYmQtqGrloI=
X-Google-Smtp-Source: ABdhPJyRoGpREgXu2magDcTbsX6Ptibz06CI58n4G/NjMfm6OheJnhCDrxw2UJszlxg14ZCEJiBqjg==
X-Received: by 2002:a05:6871:806:b0:e5:c518:12c8 with SMTP id
 q6-20020a056871080600b000e5c51812c8mr2409758oap.266.1650482065603; 
 Wed, 20 Apr 2022 12:14:25 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a544d9a000000b00322656e2988sm4803286oix.39.2022.04.20.12.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:14:25 -0700 (PDT)
Message-ID: <a352e967-2be9-5dac-3cf1-b2c14e615464@gmail.com>
Date: Wed, 20 Apr 2022 16:14:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/8] Alternative softfloat 128-bit integer support
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: groug@kaod.org, richard.henderson@linaro.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All patches but patch 01 queued in gitlab.com/danielhb/qemu/tree/ppc-next.


Thanks,


Daniel

On 3/30/22 14:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> This RFC is an alternative to [1] using Int128 types to implement the
> 128-bit integer conversion routines in softfloat required by the
> xscv[su]qqp and xscvqp[su]qz instructions of PowerISA v3.1.
> 
> Some improvements to int128.h are made in patches 1 and 2. Patches 3-6
> implement the conversion routines, and patches 7 and 8 implement the new
> instructions.
> 
> RFC: Int128 vs. pair of 64-bit values.
>   - Returning unsigned values through Int128 is not ideal, but creating
>     an "UInt128" just for this case seems excessive.
>   - OTOH, there are fewer cases to handle, especially in float->int.
> 
> [1] https://lists.gnu.org/archive/html/qemu-ppc/2022-03/msg00520.html
> 
> Matheus Ferst (8):
>    qemu/int128: avoid undefined behavior in int128_lshift
>    qemu/int128: add int128_urshift
>    softfloat: add uint128_to_float128
>    softfloat: add int128_to_float128
>    softfloat: add float128_to_uint128
>    softfloat: add float128_to_int128
>    target/ppc: implement xscv[su]qqp
>    target/ppc: implement xscvqp[su]qz
> 
>   fpu/softfloat.c                     | 183 ++++++++++++++++++++++++++++
>   include/fpu/softfloat.h             |   7 ++
>   include/qemu/int128.h               |  25 +++-
>   target/ppc/fpu_helper.c             |  33 +++++
>   target/ppc/helper.h                 |   4 +
>   target/ppc/insn32.decode            |   7 ++
>   target/ppc/translate/vsx-impl.c.inc |  22 ++++
>   tests/unit/test-int128.c            |  32 +++++
>   8 files changed, 311 insertions(+), 2 deletions(-)
> 

