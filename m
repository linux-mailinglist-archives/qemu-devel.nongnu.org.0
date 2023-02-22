Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF869F210
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUlfb-0001ql-32; Wed, 22 Feb 2023 04:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlfZ-0001qI-Fb
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:44:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlfY-0007jI-3O
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:44:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso5732132wmq.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ZF1Gz2igiFt6DeaQb/emUw1vJTh8HArPaSuSijr7vw=;
 b=Zgs6EkNDAwGaXbFBoHi5KcuVSZejLYl/4Vq1z8tf8i8Je+qFzyRH26wc8Q+5P+j6g1
 0605sgR5FYEGr51uRc2YgJiQHNP+yjXergeMpBNUZeJlMfuQ+cYWkLGd5UXkNL2HezHt
 qRzM6fL88/M6QK+MfFUNoMiZc+Q0Dz9L7/QoTsIFqoB++1nEzgglelQfadchYPelv2R1
 iqdguXlOxGq6oNkFWk4pUKoBUJmtYR46HiIUTfaW7C8SUk3bFW7fBEV88TCxhSHD4eWS
 skpGXDVdyYc3oey0LSmxNcChoTbjfx0EKX25TF1l2n1/nxAvzsjPw9FAEe0P5aQ/9uvF
 rTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZF1Gz2igiFt6DeaQb/emUw1vJTh8HArPaSuSijr7vw=;
 b=OctcD7aaNZ+YLfW62wDpAWf+bRyQX187wOdogiNLmLNlFHxMLtuRdeMYtIlyv8MhTl
 LnNn67y44FuLe9+7wi3lKiYdMK1FSdxvB4OsIm+OqrzV15Ef0jkZLek+TVdIFRGIB9N3
 +mv5BURUP1wYdUxfFMLvllK/Fq41kc12DBP4+kPEOT+ho+YbynnpmxeNp9iRheq7RWRn
 MF457YJKrFDujZ2GBvEqyizmOsALt1EZU6FolTk1fxhKeTI08f1IGOaAsZobahMMgOdO
 lS/kda49nU1F9WKK3AR2i7betMObrxbx/hOr9kKuVxm36Ha3FvJ+tPpJfu8IlFW+Cvew
 WQsA==
X-Gm-Message-State: AO0yUKXgmiFSUK8ZqplcBPZG8An6J6gSAQs89lneogW4bokl37K0SXCf
 hO6iGrDRTGW52o8mpn3Z0ZGX/w==
X-Google-Smtp-Source: AK7set8wV0kvtrpcBI8AownFuAXjRf/F0g2IRJiX0vT6vlEu/qtbWpbYUVq5058QO8WNzvBvv1Ao1g==
X-Received: by 2002:a05:600c:43d2:b0:3e1:fc61:e0e1 with SMTP id
 f18-20020a05600c43d200b003e1fc61e0e1mr11236011wmn.11.1677059050322; 
 Wed, 22 Feb 2023 01:44:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a05600c348600b003df5be8987esm16050137wmq.20.2023.02.22.01.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:44:09 -0800 (PST)
Message-ID: <83ec6355-fe3b-cbe8-2d6b-8d4d81869c07@linaro.org>
Date: Wed, 22 Feb 2023 10:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 12/25] target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/2/23 03:33, Richard Henderson wrote:
> With FEAT_RME, there are four physical address spaces.
> For now, just define the symbols, and mention them in
> the same spots as the other Phys indexes in ptw.c.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-param.h |  2 +-
>   target/arm/cpu.h       | 23 +++++++++++++++++++++--
>   target/arm/ptw.c       | 10 ++++++++--
>   3 files changed, 30 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


