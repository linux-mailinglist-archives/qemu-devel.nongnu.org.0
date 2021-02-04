Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62A30EAAC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:10:02 +0100 (CET)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7V1t-0004F6-GU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Udc-0006ZF-B4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:45:00 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UdZ-0004zf-Rq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:44:56 -0500
Received: by mail-pf1-x42c.google.com with SMTP id b145so1159478pfb.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HtT0YMmU6aL+QLGSmwBmHPi8ufDySA1z2CzAw/LR6C0=;
 b=I/ZU3p/r2BQE+9CxVKvutnDDmnUQgVEAe8FPNCVTa2EGY+jsTTr6HHcAw+g4Eqdtp+
 pbToE6C45CgJntxow9saYNymG49PAKipOT9aPL7aRgeZRDqfKMrH6xJJS41L2dTUE+qg
 uPwX0FJGuG9ldOED7nP60ZIKWKYo/cZUQcQBAMqJrGv1RxZdvk91N40wy7+jzr7GZA0l
 uB+IM2nEEk2Ut2UOWBQz67qG1gSxCGIedpK4WQnkKbNNgglizN+5+V+yrtwMjFoqT50/
 Kzm9uAk3RVgQUjgd+r8ZLgLDRw8gjtOEP2CBYTfR4w6Qw6WrmlSvm53uAQrECZM9V2uk
 Oa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HtT0YMmU6aL+QLGSmwBmHPi8ufDySA1z2CzAw/LR6C0=;
 b=NvGeqa0VF4ASwsaB9o80gU14j0CCK+E3sGbkPpReMdnG5mR7q09KyLnJq8mQhhkb9Q
 R4w7aRTYLuMttQJyp/6rmGD00DK6iGKSJb1rRCp5a4Ll8XVYkPgT7UMSIuRQnp7UwPkH
 QealWPs6/QG3phB7+IecD09HxZ76EHCG4jDj2TFSL7kw1B5y6vdM90E++8BU3/dY5i82
 YZvHeQv6gnnKBiwW8fRysKC9RSmkhC/Ftq5g2Q2dHe4ww21ro1B8/lF7Zbh/OHnSb8LA
 o7Uqy4UvweoD6uCq8Eb+qaCeejvBciGZ6fY7+XAfDC/zgosBmBBVoWCs8w9yjwI/GdPj
 SPIw==
X-Gm-Message-State: AOAM530UEF/xx+he15VSL5H3XVa1GxX/f1NX1E9UISz9WzDYGL+dU0Os
 6xRkSkWyEshxETIJodThAO446A==
X-Google-Smtp-Source: ABdhPJykJDZ3gCAc1g7LMRVt5Jh/9Befa4onNdAHys/HI/ETQA4y+r8zSFVeprW5koXCNj95JtiHcw==
X-Received: by 2002:a62:a108:0:b029:1c1:119b:8713 with SMTP id
 b8-20020a62a1080000b02901c1119b8713mr5947740pff.74.1612406692476; 
 Wed, 03 Feb 2021 18:44:52 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id a31sm4028991pgb.93.2021.02.03.18.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:44:51 -0800 (PST)
Subject: Re: [PATCH 1/2] target/nios2: Replace magic value by MMU definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210127234119.3537399-1-f4bug@amsat.org>
 <20210127234119.3537399-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c14ccd2f-58fa-5ca1-480a-6204a248a09a@linaro.org>
Date: Wed, 3 Feb 2021 16:44:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127234119.3537399-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 1:41 PM, Philippe Mathieu-Daudé wrote:
> cpu_get_phys_page_debug() uses 'DATA LOAD' MMU access type.
> The first MMU is the supervisor one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/nios2/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'll note that mmu_idx isn't used by mmu_translate.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


