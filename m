Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138C53E3871
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:30:47 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCaSU-0001v3-3N
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaRa-000133-PY
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:29:50 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaRZ-0004S9-CL
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:29:50 -0400
Received: by mail-pj1-x102c.google.com with SMTP id j1so22739063pjv.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZgMDwssCxsEHomsZxVFDBaqvKN3BiTo8ZRooQyqlq5k=;
 b=YRrn9AXNke8j/O653Kf4zxQpdWtnBsCbTI0bJViqmTv8KaBSu64MW77xqFdqACsU1e
 azSwoMhTDnh9jGsaFXMFcTuPRo+dETubVVwEvhNTo44tUzYVhU8efG4/IirAh/FMdf2w
 +L8yznWHqBzqZkpcdJnH+u6qoWPUHgxZ5Mtrt7gwqYuejrrZh+BXWkJQYTl+I4tKGkVg
 9I2UniQxqy9DPyTbhAVMVntzS+PWemNDulJ+Vdipac7hfPlhA6DxkacIcOen55X/GIK7
 794LZ6BnfiWMDxbFUyu2SUu24Td3vT9dR7M+rtmzbDOeCqBVoxlBUOTKFTsCKIb1i0g/
 avGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZgMDwssCxsEHomsZxVFDBaqvKN3BiTo8ZRooQyqlq5k=;
 b=s3TrumemX2KId1jTTFx4yPnz9aiNHYh54HvgRnJ4xey4X10IRGB+fqqN5fO8weD21R
 bVOu9IRPvT7YaWzf3AUg/ocULXzl5uybH/RBtbpySAE3tVlbion5vlUSfI/rRn3El8QI
 AtDUx/UUF0GibhVGuaG3CaGDkkD+se2kraHlvAUsFUmu1ff+PzBF9VsWuIyzYhjJA7ZQ
 fXDA96NFbRgx9PVaVmy7ar2ydlqPoT1LJuBuW/ElBeoFdAnnGEo0XE+y+qSBe8ojnZnc
 c0u6rm5miIpvHVUixm0o+J72Eovu0LoKN2ZCSSP7SvcqQcjWW1Y1jgyp5iWv9xY/Xki2
 AKoA==
X-Gm-Message-State: AOAM532M177KZdCT50xkjf6KWGI6yLs6UCjNIvU5+fBvR4EXHS6zoWxX
 d0XvYnY3BncaETb5XMw1cYpnyA==
X-Google-Smtp-Source: ABdhPJziNrFcTtFZwPx5xtlItV5VbKpsS6RVqnOG++hH8gWxyhI3PrNBgGgsjSXCOg+7FMnSZBOXFw==
X-Received: by 2002:a17:902:7889:b029:12b:cf54:4bf1 with SMTP id
 q9-20020a1709027889b029012bcf544bf1mr15530584pll.85.1628396988035; 
 Sat, 07 Aug 2021 21:29:48 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id e27sm15874357pfj.23.2021.08.07.21.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:29:47 -0700 (PDT)
Subject: Re: [PATCH for 6.2 02/49] bsd-user: add copyright header to elfload.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04322b39-afe5-f1da-e6a4-0008183415d0@linaro.org>
Date: Sat, 7 Aug 2021 18:29:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:41 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Add Stacey's copyright to elfload.c
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

