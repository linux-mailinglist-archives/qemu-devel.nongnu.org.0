Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913D32DB6E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:52:11 +0100 (CET)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHux8-0001wM-6T
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHulJ-0005d0-Em
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:39:57 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHulG-0006ka-TQ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:39:57 -0500
Received: by mail-pf1-x434.google.com with SMTP id t29so19790967pfg.11
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GFgVY9MhRS6JvvQ4x+7F7gmoUKzOmPmyyCoR+mC3eYw=;
 b=kwX7s6c6hQ2lALNnoYYhOSczw+8pDcnB2bl8jMCBdwiFnezQXYY7I64Wu/o1g5Y5wt
 Nox2MiZAYezvgxF/aLKmTVXIBcyHtdilcDobd06HMojDkf/Q5+9R41TUG4cj9ALsFzoQ
 FLBv9E/to/BBV3Y2idem4enbxgzotBMTcZOs1Lo7jJaVq7Pbn5eupJgR7KYGhcUQv6/z
 SgWyLA8xladoeRPKOoouoUCuckywAXZuc6K6Nc259NvEEj1XKh+WPpmcyjwXZsf1ElFy
 EXpvoe9sBRyaaco+fvnuApr1tKBwYZhAa7/KsfYuSHT4NcVRtJexYCaqQj+1LLSCDLVU
 SgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GFgVY9MhRS6JvvQ4x+7F7gmoUKzOmPmyyCoR+mC3eYw=;
 b=Rtk8AnLhWHNDo481ExXsRC/Yuhzx/80hLlPt9huVIv6z9fVxbPSmxP32q9kGJ4M1OA
 hd1xbFWntGY+zcgPeMN8Q29MvGjBxVBcBO0w+DFWaPYHSi0zY9BkKRvn2KoNntbB0ry6
 F8RJL4n3kXubx3UYJ8dXvL3cg14jodm1cRhyMMYdC2faJKH0y8pOrATEDswkFioQbx8B
 t3z9udomsbWhTXpFPYJR0o0BLA8kQhYOiDWxOVVIFc4pHQ7QFYXDa6NzIHN7Xom3BfVX
 Hq1ttx5BOy4AN/yzjqrcDCM6u4CpKZ96qJgPgL4BO918PdPNMbATDxDU2CrjEARli/ED
 OIaw==
X-Gm-Message-State: AOAM531r30VT24dUD3MzuHE4f5P/E/SBKpCYqqElAxN6cWF0cr5AGLUm
 fkI+J30k5dnWIikHUzhAZwSZqnK+Lvg7SQ==
X-Google-Smtp-Source: ABdhPJwPaZZmicR1HceMQqnoZwpE6QQapHgzXlKUG6tpMogSm1YwfMXcNLGRmnylgSKOh/RH//yzbQ==
X-Received: by 2002:a63:1f1e:: with SMTP id f30mr5261092pgf.141.1614890391110; 
 Thu, 04 Mar 2021 12:39:51 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 15sm255078pfa.58.2021.03.04.12.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:39:50 -0800 (PST)
Subject: Re: [PATCH 35/44] hw/arm/armsse: Add SSE-300 support
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8a7d9b2-28ac-9d04-d45c-54c6e6541970@linaro.org>
Date: Thu, 4 Mar 2021 12:39:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Now we have sufficiently parameterised the code, we can add SSE-300
> support by adding a new entry to the armsse_variants[] array.
> 
> Note that the main watchdog (unlike the s32k watchdog) in the SSE-300
> is a different device from the CMSDK watchdog; we don't have a model
> of it so we leave it as a TYPE_UNIMPLEMENTED_DEVICE stub.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

