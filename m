Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355703E826D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:10:31 +0200 (CEST)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDWCr-0003R6-TB
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDWBK-0001jC-0j
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:08:54 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDWBI-0007Iq-8l
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:08:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so315899pjl.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 11:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fC8HVL149TyuQmpdVC+p/ZnfAg1l6RZZEsH+WD470co=;
 b=RGsjuN9+XpDCMJfLwGTXsieEujT1XgmimQ5/vbeGsVe7lBj5Zo5fbqGA00sGIY3GYU
 eQWrVKxXICGqBHhg82+fwykx/GiBDYm2J44WVicYRR5n9G7rPDG0TuNErc+CDjHI1/ke
 FREQkz0536PErGFebMHJfGmECAiAAOxhyDs58cd7Ghqz0LlBfO56XnZB9d6Q3984f+Eb
 ooCcy7Ke+qtQBIlLiNhhpOHwuXXf/4KnlWyvXRLYfDpQXekVrpYC06sIvhVt9EGfBOXF
 dQDI3dRXHM+cYRS7tOtHyTnS1YLc5i3DTYRYLgd/sYhThirY1f9JpCvHNWrU9xq9swAi
 8Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fC8HVL149TyuQmpdVC+p/ZnfAg1l6RZZEsH+WD470co=;
 b=bAGsqWD2ixAryKxdHIXsMAcoDVHDL7roO8mV5/vfdqoN1t5sRboC2+G8yXQSpNpF43
 6c0iqKLrmyK58vveH2+bfuJYVW8Y1y+QV8HESSV2yHX0QMRvXNatSfEg1L25jv61ybnY
 MCFZZ9xpxaXB5dGAT1dUBIU5Ta/XNu/6+LqCVYcPV36g6DwbB49H5iWwBqql8V7bHNIn
 Jez0wfMtCzfWv1VFEG/FLGhqWB/iaXZlk0nVWrJ7V0onWfp6QeNgjjcgkBlsVcld6Ypv
 Zr28GltQrsBr+weex+t5A00EEjDQtv3p0gsRum9jo4VbJ7hN8jyTjrulMuMCMQ2VRBJa
 JDnA==
X-Gm-Message-State: AOAM530Os9MzNvfCqtNLHtJU/wz28XZ35Ygb+PUJKprxyxEPIkDC/wfY
 yvJQI70k6KnQ7lSCYNFPWa4uKg==
X-Google-Smtp-Source: ABdhPJzuOI8r2WbKVl1SK2X6uB4aFV50oPkSoe2GL/aOC02ZeVvz1Pn+jgBlcBbgWiwCasXfLKIFXA==
X-Received: by 2002:aa7:9f45:0:b029:3cd:cd1b:bd76 with SMTP id
 h5-20020aa79f450000b02903cdcd1bbd76mr5084898pfr.50.1628618930763; 
 Tue, 10 Aug 2021 11:08:50 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 143sm25071882pfz.13.2021.08.10.11.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 11:08:41 -0700 (PDT)
Subject: Re: [PATCH for 6.2 49/49] bsd-user: Add '-0 argv0' option to
 bsd-user/main.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-50-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da23294b-7917-3f49-d64f-d75c6f091a7a@linaro.org>
Date: Tue, 10 Aug 2021 08:08:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-50-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: kevans@freebsd.org, Colin Percival <cperciva@tarsnap.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Colin Percival<cperciva@tarsnap.com>
> 
> Previously it was impossible to emulate a program with a file name
> different from its argv[0].  With this change, you can run
>      qemu -0 fakename realname args
> which runs the program "realname" with an argv of "fakename args".
> 
> Signed-off-by: Colin Percival<cperciva@tarsnap.com>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

