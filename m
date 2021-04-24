Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F036A29F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:29:56 +0200 (CEST)
Received: from localhost ([::1]:35714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laN2R-00052X-V8
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMui-0007Tn-2T
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:21:56 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMug-0005VC-Hf
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:21:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id m17so775021plc.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WY10GCjM545q7SxnrP13BDuEKjzR4bd9WgsTu2x7kV8=;
 b=vNz3Quj4xhcj3p5iiN2n0xqEMp+46U3DWEKEqn/rlG0/4OmW7qRCCGafv47Fp8qK3f
 GViBEWEzVIK4bi6w4anAcQX/sSUu+CBMItAw5eMyXdAVTTfxls2uba7gG8hIdsRX2ouq
 vBpSQjWk+p2eZfeK6ebIqP94QAb7toRlmkySYS6TVmeVfUIqC7MAxPOdn6uJbVk5zvJv
 SCIcjX/G3Us/YFvS6N86fNUjtga1fTMWWnE2rDpbBPV3HzzVBNVuRyzS006tAmF0pm4p
 op25HKeRHzhw46d/cL2z+lr1BZFdRQjatgqhS3a1cCIoV6M+CMVkyBK74V/ZNY6uAibd
 RuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WY10GCjM545q7SxnrP13BDuEKjzR4bd9WgsTu2x7kV8=;
 b=sNmHcwxThBvhOTHbAc3XxBZIqgqesDXMNczRbHqHGmQL2zBbD+xNw3GyAS8s/bsTLh
 oR3GfAbg32M5E1eclCg3nPWK9u9czMRuCuBvmUdzVv9AnRfUK5phOzftReqVFWDvkShh
 VD8mbQe2KSSkGujpe+ckfjMnSqkpNNmFnuhORWUN5GouAkOGSWD/5YzGH2hSA7c+SkY5
 w88qJmBfbGXT53hWYD26hZkgV/d0efb+l8Rf+hdh/UNyW37C/K7uUSeZq5JQW/B7tdZD
 ihi0RbkB9UU5PIiu/WmczfqnfL363a36ww7cwo1YJdtycFHkrPvj1LCENVAoS/vJFvnt
 Ykcg==
X-Gm-Message-State: AOAM533lDYLjFsYJR+RkMJohYIaSQAp0tZuCPYj4c+mNap81K7ME2+L8
 jB05bRiLTAaEoNwWXhIqqLlTxA==
X-Google-Smtp-Source: ABdhPJzOnwjYDfe6b9Zbn2M06v0pbGl9EUnkJDczlXuCQo8sSHtm35OHIEVdFACrcgV1S1O8GO/P6g==
X-Received: by 2002:a17:90a:288:: with SMTP id
 w8mr11245830pja.163.1619288513047; 
 Sat, 24 Apr 2021 11:21:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o3sm7236277pfk.203.2021.04.24.11.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:21:52 -0700 (PDT)
Subject: Re: [PATCH v2 47/48] bsd-user: style tweak: don't assign in if
 statement.
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-48-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ccf5097-45bc-e98e-632c-44d02e641170@linaro.org>
Date: Sat, 24 Apr 2021 11:21:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-48-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 40 +++++++++++++++++++++++++++-------------
>   1 file changed, 27 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


