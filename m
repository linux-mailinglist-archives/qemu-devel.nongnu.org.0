Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419C640D2DE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 07:29:11 +0200 (CEST)
Received: from localhost ([::1]:44198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQjxO-0001xg-1w
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 01:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQjwG-0001G2-1m
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:28:00 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQjwE-0007In-Eb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:27:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so5069109wme.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 22:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=srxRlmVjG9YTEdaRhSm2VPpYbIQADhIluTU7iuyjV9I=;
 b=HcBKmfkCuayR7JC1YsBWZpkbd1x/1yupJhKppQwHLqK07taTTetE0ZSdQMIidMG+bE
 AhUzDMWLskEBYvyenWH6OrgTu8D//qHUir611xTAYvlBcXXmHecU6UyPbA/YbhCAhIlw
 rJyRDDUpL4YCTmRK4po++5PVTBAU65rC9eRuaFTtA9UfqLMag3Og1CVcSAGTWaGQIntt
 FxJlpJyBGFQ2CrhDe/x4KR68CcANIkamuJIy4hPspAQdsX6koaMA8xn4LcZl9Xr/CXTw
 9uMXKdOI8fIwJSn+SxnUn1Xiaa6JNumLv8HbWZ3P5AMiHsM1UAvFeWTiLKL8H3m+JWxI
 isQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=srxRlmVjG9YTEdaRhSm2VPpYbIQADhIluTU7iuyjV9I=;
 b=z1Rq0rH5bx1K0JctJ1VnXBWucpOzh2zvS2JP1YGnk/I1xrQ4XgUSvl2HMR2RtGTTFD
 2mW+a/V5/EPpQPmenzqMwrXncvbGtku3IANTm27jShPWAEI6GoWGaXMoWkFd68EvEAig
 2GyjQ6db7WwinYz5bz9sLNNiTi9+s/NCDIdwVLPt8RX05nYESlRliHcRrTUH7f01OhNJ
 eIEgwMV2qzaynSNWfuITg5d+ZAOrNC/CVNRxwrx9+lPvNNgauM+Gs8IkFXVJRB2jMbgm
 ZAaXHgGqTqoYLK0VNwuPvzIgGJtHmjd7l8fPuQZt68AhmKZuFi4FjNt7o7VXrhqMgCCq
 LONw==
X-Gm-Message-State: AOAM530LEkHjnQuk6XeD+9YgNy7nzF2g5Ld+mUtV5iLxYq/Vz02KN1yg
 QRSH3iyRDek5lcrmZdtEVGs=
X-Google-Smtp-Source: ABdhPJxbbVw9bqGiicDXbz4dCEG/qLPjNjo10vciG8QaeomOSkgqeN74CEsaP9jQTcU0/z0UJKvpgA==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr3147209wms.119.1631770076611; 
 Wed, 15 Sep 2021 22:27:56 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id d5sm2152558wra.38.2021.09.15.22.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 22:27:55 -0700 (PDT)
Subject: Re: [PATCH v5 02/16] tcg/s390x: Rename from tcg/s390
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
 <20210915213114.1923776-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f230d919-06ce-4d96-a1a7-32d201311ade@amsat.org>
Date: Thu, 16 Sep 2021 07:27:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915213114.1923776-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 11:31 PM, Richard Henderson wrote:
> This emphasizes that we don't support s390, only 64-bit s390x hosts.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                              | 2 --
>  tcg/{s390 => s390x}/tcg-target-con-set.h | 0
>  tcg/{s390 => s390x}/tcg-target-con-str.h | 0
>  tcg/{s390 => s390x}/tcg-target.h         | 0
>  tcg/{s390 => s390x}/tcg-target.c.inc     | 0
>  5 files changed, 2 deletions(-)
>  rename tcg/{s390 => s390x}/tcg-target-con-set.h (100%)
>  rename tcg/{s390 => s390x}/tcg-target-con-str.h (100%)
>  rename tcg/{s390 => s390x}/tcg-target.h (100%)
>  rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

