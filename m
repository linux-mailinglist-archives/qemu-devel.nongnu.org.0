Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851451799A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:00:48 +0200 (CEST)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nle63-0007DU-53
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle2r-0004fZ-Lg
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:57:31 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle2o-0005Ky-No
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:57:28 -0400
Received: by mail-pj1-x102f.google.com with SMTP id p6so13782966pjm.1
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2MFpc9UoJb66Myur5mXYclicV2EjoibroDNEcr2wn48=;
 b=EkcGVsDJT6UcYCiSIjl+Mrnd77U1Kv2BCTQfR+TF/ZtK0xjEfHOwni35K074SPKA7M
 OortHwPPcc0N8AXa5VN+aadHOZ5i9yckjd4tK4J+8bHdJdVHLIzrZniPu0vI/F+sS8pa
 lGyrb1Vu/Vl97QUh+WX8FHr4P9rDcknvHrqfxPilv8zPb5RVFn2WF27SVOpvhRGIyIqp
 JTg29uaGoxHTj1oT0hErxd9GnK/OGaFD5GEiwf7ak+w5/bDloAlchHZARJbpzb3vHYHj
 c31bEOneOReHFOXpfyeWE4kDV7OEBqhbEHmBUK96udXxcyYqduV2bF+k2JQszjZqs9lT
 W4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2MFpc9UoJb66Myur5mXYclicV2EjoibroDNEcr2wn48=;
 b=ROSRHgCzYWQYjubsmHOeGXF7ZM1r1ZkDgtfjWZexY9F8QXI76gHBOw4L6hZjpcYqBR
 wSn2Qm/OkQCnKyzbggHV5nd99VmlzYwfvnlmyVhFwSIyVKMFCPlhP7kni27/+bPHHQ6+
 T19cyZe7NaRyaanToR/UMsnrD0853UT2SENj8Kj+Ln861ZC1j2H2NePcpuo+c5VxvgDJ
 AcUSWqlIbLDw2M9lvNJTWip7jPR8Q2raw5Caaq11mWedC6GT2HH+hvdP4P0XN0LKQ5RS
 ClYoIOPPB+nQ1WCZmJezYL96inoWPwM6E/itRJsC88xP2vHcO00FY7a714d792qO9LvB
 aB4A==
X-Gm-Message-State: AOAM532VwJWbZXkPq4MwX0jiT33ljdqwYOwpOkq5aR/VsZdxXLXBLCFe
 5g3d2L9rpzp88fjQsaWDAHWH2g==
X-Google-Smtp-Source: ABdhPJyaQ90s5lujWDOZRNKVYvUAicP5UL+6pO5DQLK/I1tRYnsemicnWfjetbohEkdk5b0OKfuP/Q==
X-Received: by 2002:a17:902:d4ce:b0:15e:8d66:d20d with SMTP id
 o14-20020a170902d4ce00b0015e8d66d20dmr12868438plg.70.1651528645218; 
 Mon, 02 May 2022 14:57:25 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a170902c7d100b0015eab1ad02esm1851609pla.215.2022.05.02.14.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:57:24 -0700 (PDT)
Message-ID: <7f27cc68-0116-b1a6-a7b6-af1ae721b3e3@linaro.org>
Date: Mon, 2 May 2022 14:57:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 03/21] target/ppc: Remove msr_pr macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-4-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
> msr_pr macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v2: Remove M_MSR_PR and use FIELD_EX64 instead
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


