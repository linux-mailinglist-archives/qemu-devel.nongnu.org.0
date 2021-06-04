Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7839C1CE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:04:31 +0200 (CEST)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGzW-0001Gn-Rh
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGyF-0008A4-SM
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:03:11 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGyD-0005Ap-JQ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:03:11 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 69so5285848plc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OWaMTKWGQMObSLPgd20FSe0a88QTy8C5hfuU/lSHefA=;
 b=pWEuL93YZ1kgmrE/umrbkV9Kg4O+AjeJYd1spOKNnotFQ0W/DDJFfGeWPvaP+kABV6
 RG2VvkaQFG0/udV+XX9/pRZBLLplQEVf4ny8Wcy8zaCMGUjejWu3ae7RMM7ts6+pEm76
 8VC7a0owN9JWotSZPToz/N6OK9VLYgvecpjekXZdu69j9Q9KneY8mB5AssGkOKugULyl
 HrYFB5GiNxSKfEheyLC83pF6nEQiQQM6wwjCkR07Zwk1bnS9n+8venQXTO8MLaUPN1+Q
 K37tZLNUgUI5d5RzV2SxD1eoDBgyrp3BtL3skBjNUiHFhYhccZmUjciQKnHpnunmvqw1
 9+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OWaMTKWGQMObSLPgd20FSe0a88QTy8C5hfuU/lSHefA=;
 b=mwB+QnfqgwCaTOwEnBW19LG8PnOh0ydv0a1LPrSjOo76sQB9WV+euElEWZTdKtJ8W1
 XYSvHIOxe3AjkBKAovMvG1FLlzVNNe+vdcbeFa5UnTcSVYWLOb4fiOfE3m9p2ue2Ljj5
 lXTCa5zbp1vefO7a9lMQD5/02p2J9tr0ndgM93bhqJCk0CBMZT+dyXZ9UmoSZRuAqi5w
 hlLuxGDi2ZYIrNYGodQLhwuB0JXHi5RTXipRfQORVu8usCd3AgJAgk5Uti33nNZxrfQT
 5fRwipYC+7E1NyyGFBuKWXf8vLuDXFPiBY+UeCS5R079CwFNJP7GP0/S4TkdYplTxiEn
 JJ7g==
X-Gm-Message-State: AOAM5313+N1nDWZgt+DNfCGfDoYrtlL1L/sJbJ4JXdEKbJdkR7nsMkns
 qHBamI8y9WGZWECDARA05gAL2Q==
X-Google-Smtp-Source: ABdhPJy6NJVH5WHLvvLYCT78ihjCOpJnEzjB5c2NAZIF4MLnNhAEzO+6QcVTryexEdV/vBk2pJriCQ==
X-Received: by 2002:a17:902:ce90:b029:f7:72be:b420 with SMTP id
 f16-20020a170902ce90b02900f772beb420mr6273001plg.67.1622840588222; 
 Fri, 04 Jun 2021 14:03:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v14sm2044613pgo.89.2021.06.04.14.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:03:08 -0700 (PDT)
Subject: Re: [PATCH v16 06/99] qtest/arm-cpu-features: Remove TCG fallback to
 KVM specific tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <596cea97-75df-5f89-d10a-5ea8ff15be09@linaro.org>
Date: Fri, 4 Jun 2021 14:03:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
> tests are now only being run if KVM is available. Drop the TCG
> fallback.
> 
> Suggested-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-7-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

