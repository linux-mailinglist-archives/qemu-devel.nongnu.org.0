Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713554EF989
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 20:09:21 +0200 (CEST)
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naLi4-0001iL-BA
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 14:09:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naLgs-0000SB-Ic
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:08:06 -0400
Received: from [2a00:1450:4864:20::52e] (port=36444
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naLgr-0000oF-6R
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:08:06 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h4so3874465edr.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 11:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=4RUzUg2nWAwDet+aAYHmJECel3GdjhXtno3eaDypI5E=;
 b=hUpKMKsw9AVefbIXU7Hf/dVAlcu1M/id7jWbG3MMb3Wf5Uh/mL7BT1/S14bpRTRTGa
 XziJc4nGPh5umUMkvy4+/sFv2RJyo3qPEIMZE60h2xrkRVc79f6739l8T6A0VyMAQVB7
 FdB13WCbluFXYSBwPeAGljD4NqoQp+XFEqasCVYKLU3WkNnZFTXYkxBVfucs2uTjfEeb
 rrtrrT7pHAxtdQaudk4qmIg1zaW5Ynumw4H58UGjWzc5SiIjD4A7ElOekw+72MBp9ijQ
 qO19UfRuOx8d2Tj7EqyFRPPBb/TYfoHpT1Tl3zsSHQHUcH2570St3UTk9v7CwT8kHIuG
 TH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=4RUzUg2nWAwDet+aAYHmJECel3GdjhXtno3eaDypI5E=;
 b=DrUSQzXsBiKL0vkcpwW1uZPlDaixyDfVfVwZ6U8VEknDB6KWiRKsE6mVVTl+k4uS5I
 jYN7dUM6HzX/Twi/mzRvO1LzFgRMrjYno7P3y9+rfux2Wk8Yl5Qal6Yi5kW4SIwx8LyC
 YpJoxgJxqPP2N8Za483KhziUmhT97XU3Dly7ywVnIn73huVIDesYzH7pZRpAglHuoJk8
 WhURbrZ9Kcx+ak8NQAXCddFz+cd0h3YQ3VH+QoDlkmBiPjrdyX5h25QTQXwLtwNi31Bq
 AlrGJRg43SXACFutr1BLxXgZeLy7RE53Ghx/6NfOk21h9zcxPzG0xJ0eKFR7J49ofL9r
 8REA==
X-Gm-Message-State: AOAM531BClLdq5hNrQ3razVEibaxSibQDsfileD1A0WkA5heeH64GB4h
 nHyRlgg8JiCktrCoRZsCOvA7mgV75BdiLtEgLDE=
X-Google-Smtp-Source: ABdhPJwmkW40s0enz7W+9EKxWR1jqQJikB8Uqp1wGv/yuGNOymF2if1xVTjHjOzx+OhRWP8IxnB+Rg==
X-Received: by 2002:a05:6402:270b:b0:419:3383:7a9f with SMTP id
 y11-20020a056402270b00b0041933837a9fmr22275685edd.191.1648836483273; 
 Fri, 01 Apr 2022 11:08:03 -0700 (PDT)
Received: from [192.168.249.227] ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 bp8-20020a170907918800b006e0daaa63ddsm1271761ejb.60.2022.04.01.11.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 11:08:02 -0700 (PDT)
Message-ID: <a368bfa7-484a-6adf-33c6-5d85e16524b0@linaro.org>
Date: Fri, 1 Apr 2022 12:07:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] softfloat: Fix declaration of partsN_compare
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220401132240.79730-1-richard.henderson@linaro.org>
 <20220401132240.79730-2-richard.henderson@linaro.org>
In-Reply-To: <20220401132240.79730-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 07:22, Richard Henderson wrote:
> The declaration used 'int', while the definition used 'FloatRelation'.
> This should have resulted in a compiler error, but mysteriously didn't.

Bah, of course there's no error -- this is C not C++.

The enumeration has values -1 ... 2, which means that the enumeration is compatible with 
an implementation defined signed integer type, which for our set of hosts will be 'int'. 
So, no conflict.

I'll edit the commit message.


r~

