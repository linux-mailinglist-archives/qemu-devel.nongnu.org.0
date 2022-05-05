Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D851C400
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:33:23 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdTl-0007FP-QM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmdPX-0004tE-QA
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:28:59 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:36377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmdPV-0001To-VW
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:28:59 -0400
Received: by mail-oi1-x235.google.com with SMTP id v66so4692487oib.3
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GC02ai4N+8FCrxAVSooWJAjxyvHt9EYZ5H6pr9hhG28=;
 b=rENPsHdBeBKdNedq5tvUchq8+ehbVX4Mml35NRjKx8QaB9e+jQiJlUaOr9dBjQUQ51
 BSsThIrRmX4lNtG3QKvZZ/DXbX/WH6xr8wztbvNCDopirxcBAk5sTdAA4mnfzGw/2YAf
 xATbBi3tfFA1Zz7kjc0zn4WkGrH/zrXPJQlcRAM/jm18Pac1M29rWusui2n0Iyv54Lur
 r1pbToGgCkAnaSX3EtZ8heMcfl2B3Ie9g+REeM3ehtiAjNAGGavYsKdm6fhCAuKM+bzr
 qrRw5Z5kwD/HEUhboHhchDTDcJAtHx9fAnFzcdmyXNGECA9rEgxVrbHcDiN/ahZaSZ9N
 7qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GC02ai4N+8FCrxAVSooWJAjxyvHt9EYZ5H6pr9hhG28=;
 b=mTPcsyR2PRMgsROOvFWdIJtTu1zI3HnCRmqtGf4T0dRFwrmzI65oOi8ASt7riS8xCp
 hJXG4qt8DUBBmCxTnuGYew42EvADizLBJyiVesPwdQs0459/CeL3s8kExxlGRNo/xZqV
 ioZaq21pRQXXxTFI3edJKGUJ4SH4dxy7OpBI8FmD6PzHNVmlOg/FJTD4v/MLMWZKvaQx
 V1hjfM5forFO3wqAtJM1j6SjlOYx4m0tH1CYy9fKf2F0l9g9ugODFvWm9Ry6L50jSreA
 TsdL6GPy/Y0OZtAmLiByoBp9DLbyZ1Cgi29TNH1NgoKqij0AI6859cSqll2bYRpiwXMd
 uTVA==
X-Gm-Message-State: AOAM530iovWpVo2/jgj8nnBJ4xGs+dhwGx6eoGkrdh8yoT7XEtpljy2U
 g8RgFiZm81TEbapohVadMlhtHg==
X-Google-Smtp-Source: ABdhPJy5a+3N7pOixYkcKFDctGJpyn45VPMeaD/bY1sG7WOB/THG2N9SjrizE4QIKbSTBJUYmHwobw==
X-Received: by 2002:aca:502:0:b0:2cd:c24:278f with SMTP id
 2-20020aca0502000000b002cd0c24278fmr2675217oif.150.1651764536763; 
 Thu, 05 May 2022 08:28:56 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 w8-20020a4aaf08000000b0035eb4e5a6b6sm903527oon.12.2022.05.05.08.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 08:28:56 -0700 (PDT)
Message-ID: <e06097e2-f23b-c9d6-6bec-5704e6ed4a60@linaro.org>
Date: Thu, 5 May 2022 10:28:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 20/22] target/ppc: Remove msr_de macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
 <20220504210541.115256-21-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504210541.115256-21-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

On 5/4/22 16:05, Víctor Colombo wrote:
> msr_de macro hides the usage of env->msr, which is a bad
> behavior. Substitute it with FIELD_EX64 calls that explicitly use
> env->msr as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v4: Add this patch as an usage of msr_de was added in another patch
>      https://patchew.org/QEMU/20220421011729.1148727-1-bmeng.cn@gmail.com/
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h         | 3 +--
>   target/ppc/helper_regs.c | 4 ++--
>   2 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

