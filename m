Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF566587E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:03:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXwq-00053R-SO; Wed, 11 Jan 2023 05:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFXwo-000538-IN
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:03:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFXwm-0002bs-Rj
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:03:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso9238216wmq.3
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/bTip/cgfr9aJ5yt9vRToMWJBzBnB0RFmniDo+23pC4=;
 b=vzfi6EqPbxFYU3PtVQyWKRaDO4Tz6HyO6y/uHkpJi5OzjJ8t0ClSxY7vQLpod9ONvx
 Fs5ijbh0ewo2QAfo1f4fAGvu7mHTpZ1tSDw6wWJSPnlidfalHSj741JWMenMIR6TkJjr
 Y1AN7aIeHRBsloXJMvurio9gGMNN2nQ3nyX0sAjMj+TaZIxO5RlzkfeoA+Y6FIGnGTUe
 BzvsP8bfCwh5aoaCkf/8CmapmRtpIjzjBBWjQUjNkkG+1X9pFIlqkF3lXFHnKVnX7pSa
 xAumJ9bR6Qs9ZI7KPzdGMMpDkV6vRG3U3SpRiPuWeKw6CZEON2GBiyfJkT1CUkXYecd+
 4dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/bTip/cgfr9aJ5yt9vRToMWJBzBnB0RFmniDo+23pC4=;
 b=ZNOyyk2vnAZvuAOJh0HxuqmsfCsKsyQAu1B6a3r88PQaMhm1j4dTDcez2EOM4xgiBb
 SqiKSwHV9RZiQtLKTCbwjuSaAOiCHt7nGkIsyZ1G1N6sloyTgv2nwDy/rgUo6SSu25Vd
 oGrpzUyyVVZ/Z6Z01E5Stk+58wYAoVU0uFg7sqTjXXJIXn23SvcguHfHNafU8+D94v4t
 W2NIGoRfLRAYhmQQDoMIhtX/ngoWg/703fJHQTEzp4W1cqJ15rHp7e3JKd0Js+GMgpdc
 2X1+YJdbVGDPF1aDO0Yqcna7LCKHX+UPmmgvYYPAM3UaO/1HmPjq26I1GTigrkrXsPmm
 rduQ==
X-Gm-Message-State: AFqh2ko3J15itPOvw0haimFWFHa6GOd0VAGVwFSFuLMXQgN1hZAZ9sZ/
 jfLnZXXhfREWSHddm2cO2Vpq6A==
X-Google-Smtp-Source: AMrXdXugH8HekBDwRGJTP0r5Hoeq3zEmg+VtoW8CjNfOTMoF5Ade7dn7fvFexOhBGroV88mw0/RNlQ==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id
 20-20020a05600c22d400b003cf82b92fe6mr61788641wmg.8.1673431382711; 
 Wed, 11 Jan 2023 02:03:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003cf5ec79bf9sm19624743wmo.40.2023.01.11.02.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:03:02 -0800 (PST)
Message-ID: <f32b738e-ebef-da0c-b7b2-0c16e7dbf13f@linaro.org>
Date: Wed, 11 Jan 2023 11:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 06/29] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20230110160233.339771-1-pbonzini@redhat.com>
 <20230110160233.339771-7-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230110160233.339771-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/1/23 17:02, Paolo Bonzini wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> To avoid compilation errors when -Werror=maybe-uninitialized is used,
> replace 'case 3' by 'default'.
> 
> Otherwise we get:
> 
> ../target/i386/ops_sse.h: In function â€˜helper_vpermdq_ymmâ€™:
> ../target/i386/ops_sse.h:2495:13: error: â€˜r3â€™ may be used

Thanksfully these odd chars                ^^^^^^^^ ...

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
> Message-Id: <20221221163652.1239362-1-eric.auger@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

... aren't included in your staged commits in
https://gitlab.com/bonzini/qemu.git tags/for-upstream:

commit c0a6665c3c4d63b113ab31c624c53d4a32de2926
Author: Eric Auger <eric.auger@redhat.com>
Date:   Thu Dec 22 15:01:58 2022 +0100

     ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
     ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
     uninitialized in this function [-Werror=maybe-uninitialized]
          2495 |     d->Q(3) = r3;
               |     ~~~~~~~~^~~~

So not a blocker.

Maybe a git-send-email issue?

