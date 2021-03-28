Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF934BDCE
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:54:20 +0200 (CEST)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZcB-0004tf-D2
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZZu-0003o0-3j
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:51:58 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZZr-0002qB-L8
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:51:57 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso10094255ott.13
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NLXmoL+KvekOqVhlEvGgQ20XDsljVzhkSV5v7dy9Hk8=;
 b=D7wlT4hsNuT9058K8rszT/TfORs9i3jEuGMrWBMzZ7giPXrHrbHqkK4kQR1YGHGskg
 W2dfmX1UTE/slCZwMVWYfKd9XykcIpJHnL9SY7mcbHMcSXRG6oNuvCO89BZPhP66v6oz
 EGEI/ydZMe970pTDeM/Z1+EDI1/Ey8VjlhqEkF5pZoFg3bYMuysz5YeyUV/qH7JSum07
 k77ZVlRAiRWMJi8SMqnCNX0IAEo6k4pQ1sTmXpuCycOYw01UCNH0qHsLD8aNtJQhf7cD
 CorQzvRMGOJXqItsAaw+y8xyJUaog0cFRnnSk0Cp6fmbIqh1PNTs9J2UWbDFWfqtI1aL
 8xYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NLXmoL+KvekOqVhlEvGgQ20XDsljVzhkSV5v7dy9Hk8=;
 b=RPHUt7xbmN7hQ11uE+uD4OJ2J9uCxy/pDsIZcyya4x564v3iK8ih17/JSkvUAMmmDZ
 o8nLsm4ULpIcW18mwpUVQrHckNIOvmAGGvzles7dYY2xVk4YZbdolpyYSoTc+Dhs9NL0
 ZaUOizJGH4oe7+ib0sOdvh0fc9TRVCv4mIWO+RGQGYJzgTUsOLy+t06Geh4pZRMj4Pr7
 LbTbXYSBcVBk2ueHkScIE0cBY9AVk4LXNW8nK042uycjoY5H5i6H+AYvfYttxRzn8XQ3
 XzatFrCGVmhnpto4RAXnABzahlB0RJKJBOjTNwiiHyIkf1wNfDkrDOdUo/JLL6UWuTU/
 TaMQ==
X-Gm-Message-State: AOAM532LT7e5jljOi57w2SCI+5FayD2zTr+QJJSRz66HU4g2IaPCyRBe
 kOYOgUom1+RYP61rnvfBQf+rtQ==
X-Google-Smtp-Source: ABdhPJzcxuSz9q6Ksv25bQl5SYTAGF7w55fZIZi6q/0wkFGqRyRu1eMYeAnMMn4urb35k2M+Aw/Dxg==
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr19516584otk.279.1616953914416; 
 Sun, 28 Mar 2021 10:51:54 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id f29sm3870292ots.22.2021.03.28.10.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:51:54 -0700 (PDT)
Subject: Re: [RFC v12 48/65] target/arm: add tcg cpu accel class
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-49-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c32491f-a8ca-08d0-2ad6-b1f0b85ee4bb@linaro.org>
Date: Sun, 28 Mar 2021 11:51:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-49-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> move init, realizefn and reset code into it.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/arm/tcg/tcg-cpu.h        |  4 ++-
>   target/arm/cpu.c                | 44 ++------------------------
>   target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
>   target/arm/tcg/tcg-cpu-models.c | 10 +++---
>   target/arm/tcg/tcg-cpu.c        | 55 +++++++++++++++++++++++++++++++--
>   5 files changed, 92 insertions(+), 48 deletions(-)

I think this patch is confused, and confusing, because of the tcg-cpu-models.c 
/ tcg-cpu.c split I mentioned earlier.


r~

