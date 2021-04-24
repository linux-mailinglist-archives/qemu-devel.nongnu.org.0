Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9B36A286
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:19:33 +0200 (CEST)
Received: from localhost ([::1]:41034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMsO-0003zN-0K
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMo1-0002IH-A8
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:15:01 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMny-0001oo-IN
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:15:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id m12so16654227pgr.9
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g0u5MBLrWk/B3MTp2bsJ0prG4NNtghuMuFImd6RT9IY=;
 b=Y+P6JHnWUukof2cht0ERB36bSZA2zb9M7tdgzTLgOznfK1ounKGIiBw8eWyI/slLT9
 COYwwhIuW7PQqZ3POsjSxcanshwO0dblPDaZAjskSgrJy0TyytxwCjgcwMfcgYCnbzeT
 6X4pzmHXXsqh4lhGkp1bOP5OR5sMMl4uYnX7dkEIGTCJg5AWfX7Aj6pmG3zgHZntb4ph
 ZU685W7ZHTNeSdn5eeSWt3TJt5RQ0K3zYQRl2i1svqnLm0j00RXxpGUkIMjW+dlTeHnD
 T9PiFX9fRB7m7SHSCkK/PsbF9jhyhnKKDHlltcs2ziD7PlQGfHOqIgv8V9KJyvS1sDXc
 e7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g0u5MBLrWk/B3MTp2bsJ0prG4NNtghuMuFImd6RT9IY=;
 b=fCCS1WK454ayTPTbi3nXI7BMaXPEJlyPcUKuv9asPKn7OgAhYXT4a6dhBYYQbRH0gH
 U1/Rzy44QLeTuhxkffYcRxmAYhABynG79CQMwICTGD4zv7zI801PioLZ3HodwAWTeTHA
 r+fe9Hom4zKXd3nXhM0Lc5SfmfbT7hGsdsJY5rcTec7vScs1QM6kzJoK/c9o1ovtV+nz
 D9ovycqZHYKD+Z4rltY+xOIr78TT87MZxIWgAxTCsrw7vUuKWMp2hG7IuxtK9y67p++g
 EPmOnCHrEt8HEbMfv/eAkgPRqfvrzPja5J9FrQJaSEv1FWgqWsqtXg3gLQNadBzYegVz
 sP8Q==
X-Gm-Message-State: AOAM5339HWwh0CVnEnh/jsx2nCpArY0fe3gIxzB+NaqCU7BA4tNRSI8Z
 FztefozyjRDvSjF6a2T0KTW1Yg==
X-Google-Smtp-Source: ABdhPJwbJAw428wsX4zMVSBqe1xnoo8kYVVwT93v6+1tXVFeuRDEKRjzY7rb5OSS8N8SoUuOMwKEUg==
X-Received: by 2002:a62:e203:0:b029:260:d99:57bb with SMTP id
 a3-20020a62e2030000b02902600d9957bbmr9820524pfi.31.1619288094701; 
 Sat, 24 Apr 2021 11:14:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id g18sm7612097pfb.178.2021.04.24.11.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:14:54 -0700 (PDT)
Subject: Re: [PATCH v2 37/48] bsd-user: style tweak: don't assign in if
 statements
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-38-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f638660d-2005-4c9f-93e0-d26d29ac7587@linaro.org>
Date: Sat, 24 Apr 2021 11:14:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-38-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
>   bsd-user/uaccess.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


