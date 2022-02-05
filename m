Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2074AAD05
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:24:17 +0100 (CET)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUPg-0008GF-92
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUNo-0007Xo-7s
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:22:21 -0500
Received: from [2607:f8b0:4864:20::102d] (port=52977
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUNl-00028c-Hb
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:22:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id v4so3324910pjh.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3fIeX2q6kynjjDCUafXGjBeaS2h02iHbZEOqQBdKPqY=;
 b=TPejM+yLTqHtexRlkTd08cZk8MsyMjLe3uw62c5WxBXXQ2q2rRsVF4Vc9Zy8Dcj7Uo
 zQKS0Vgu15urJ/zmcqpobe/5JmaIAC1PJ4hzabkCWdqe7h20tSywjw3Ckl1cmhqDb9++
 NPo2bPDQk5k+M5fUbbZQ3qe2+GVDIwZggluLaDStFAv26/ynJyhlI6YnPWd5+qmJ6Isd
 svPYJCj3aW19DjZgg/tyDZoDNf8UiSngGsgGmIezUWSdbDOw5xA2jj9hkHoFjYJmvxZL
 BjP9KJCUWP6qWf14iJdT3tXAYfxWIgLzSYb30Yf1SPRSi7ps/J+WwTaEOVbrM8+xEnH+
 ZCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3fIeX2q6kynjjDCUafXGjBeaS2h02iHbZEOqQBdKPqY=;
 b=3oAGiRuXcKYPU9cMyegEhnby9ZCojdbJFZZZvRVfHDr5Ne92ouwlG3KLlnRRXTqFkN
 6YWAE4MXKHcMEufjrDsc9z2PnwVWMp24dYfUs1QYvnOMigmpRO3d4727yh71cWfteWmN
 HI4gBnjXt7QjIFGQp6qNI7d/HTa6ij7hFCbfWbiZZV30o7k9n6C/QNBXndz2Ey9Psd23
 9jGf24vHtkNpD4v5gxO4gqlezSe1PwlI+gUShBgSIOlPzw5vJu3nbkeM4X1hvrhOUNEy
 tRyYT17eBUZ57FHfzGqlECTnqr17Bt9+6CViFsBmScdY2cPtKE4WLtx50XjvwGk4UMMZ
 E7UQ==
X-Gm-Message-State: AOAM531AK83ko25X8zpMVrYNjGy4Ix5tZRTwu1cprwylUnQk2BUdePyz
 AIs6AHuMQP1vAwqYZ98D4uBmdQ==
X-Google-Smtp-Source: ABdhPJy+8hxk1nhtz71rq4WASIri5cwF8Fvxta0hQlLoBhi/ToL0CRTLl1AMdjck8ea1IPmguJI6eA==
X-Received: by 2002:a17:902:bf06:: with SMTP id
 bi6mr10070463plb.24.1644103336017; 
 Sat, 05 Feb 2022 15:22:16 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id g8sm7186455pfc.193.2022.02.05.15.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:22:15 -0800 (PST)
Message-ID: <2e07525a-580b-1a76-fa3d-cc4f01efc73a@linaro.org>
Date: Sun, 6 Feb 2022 10:22:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/21] accel: Introduce
 AccelOpsClass::cpu_thread_is_idle()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-11-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:18, Philippe Mathieu-Daudé wrote:
> Add cpu_thread_is_idle() to AccelOps, and implement it for the
> KVM / WHPX accelerators.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/kvm/kvm-accel-ops.c         | 6 ++++++
>   include/sysemu/accel-ops.h        | 1 +
>   softmmu/cpus.c                    | 6 ++++--
>   target/i386/whpx/whpx-accel-ops.c | 6 ++++++
>   4 files changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

