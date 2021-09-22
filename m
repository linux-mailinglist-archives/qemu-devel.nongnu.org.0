Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7E41506C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:21:18 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7nx-0003oY-05
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT7LY-0004Vk-HN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:51:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT7LT-0007RF-0B
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:51:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 il14-20020a17090b164e00b0019c7a7c362dso4366447pjb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h9c9VClxDKEjlftcISAiLKBiZ1Chyor0Fm2tNd8WX/Y=;
 b=xaGaDfUZGiP0w2QxCkaGVtDaWPUCCz6UcELpq26sZ38pI6OGni8Va1fZZc8UTE8Xo0
 HPGitY80FWLKrsfv7MVRuVqO8DkQXaU9m67h9ZGOYoz8YAKnKd4bO/koXLYB4rW4HQa0
 AJ0WR6J8atmoDcPSFAFdUkbi69rv1or30W/dohTLB6/hmo+3OdKb0D2BJQsIkDIOQJm6
 FYGbo5JowQ81dPNJIrySoRbPf1sxKhR/HwAUAGKjuLpKU1tz3PDreBU7AzIvWrqc8Opb
 kBff08ZPIIi/7q8N3O5UaEjfn+S4d2frrjElGjk2l8mWpc1KPR5QL6LOsrcPg8wqjGMA
 dRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h9c9VClxDKEjlftcISAiLKBiZ1Chyor0Fm2tNd8WX/Y=;
 b=ojxlVF6LiNA5Kgf9v5RHfPGs/IR/4gKsWSjKJeCAridudxH2Epk7sPvCd/kKjQr4Xy
 4yUbSMDIIpw+nYtsBq7LA6CdH/XD5cjxKYD0tPPOqX9lQzGn1SEnA/9AghgYxBrRnK95
 em9oe89nunZoND0pnhlRRg3gO9ciNF8FGexz/AJXJDOuMMAmkSorTNkzVa+ogjaAABiC
 R99h15rNlsxbv/WDnqSgZrUgcmhtLJa4mI2WYw8vXXDWMSs9YO85JZ6x1mG3FJJF+mMM
 gsJfBMAyPrFvrbriZrOd1hz4IDFCFlvyFzUdE7EcqBzE/gdac3o9yd8zegaMJC6yIXiz
 avmg==
X-Gm-Message-State: AOAM530C7D7M5O5rnU5UXD/gaV/ePL/CxOZ2ZrIfnxe6WUATyG4dlR6C
 ycDy885HPmeFoBqcqfguqC2wfA==
X-Google-Smtp-Source: ABdhPJyq9d7OLyUdVE/dT4UuvIxgVLVjEUDkwQ+pd7ls0oaRs3m5lEgtX88whibYWYbDwDsce5VK9g==
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr563844pjn.195.1632336709370; 
 Wed, 22 Sep 2021 11:51:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a11sm3466984pgj.75.2021.09.22.11.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:51:49 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08290515-e717-714e-b0cd-f8284a47313a@linaro.org>
Date: Wed, 22 Sep 2021 11:51:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922180927.666273-10-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:09 AM, WANG Xuerui wrote:
> +    if (sextreg(val, 0, 52) == val) {
> +        /*
> +         * Fits in 52-bits, upper bits are already properly sign-extended by
> +         * cu32i.d.
> +         */
> +        return;
> +    }
> +    tcg_out_opc_cu52i_d(s, rd, rd, top);
> +}

Oh, future improvement: constants with 52 low zero bits can be loaded with cu52i(rd, zero, 
val >> 52).

Which means there's a set of interesting constants:

   abc0_0000_0000_0def

	ori	rd, zero, 0xdef
	cu52i	rd, rd, 0xabc

   abcf_ffff_ffff_fdef

	cu52i	rd, zero, 0xabc - 1
	addi.d	rd, rd, 0xdef

Also,

> +    tcg_out_opc_lu12i_w(s, rd, upper);
> +    if (low != 0) {
> +        tcg_out_opc_ori(s, rd, rd, low & 0xfff);
> +    }

when upper == 0 and low != 0, we can omit the lu12i.


r~

