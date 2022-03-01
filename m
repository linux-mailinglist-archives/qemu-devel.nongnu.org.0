Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ECD4C92ED
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:21:51 +0100 (CET)
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP78A-0003qL-P3
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:21:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP75x-0002zx-MX
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:19:36 -0500
Received: from [2607:f8b0:4864:20::62e] (port=39676
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP75v-0003IJ-Qm
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:19:32 -0500
Received: by mail-pl1-x62e.google.com with SMTP id l9so13685535pls.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BAazOSlHODn/RLqyRZFDRSz7qBNym5lMq4crWCGPcmA=;
 b=ueEWTnl74WWdcxoBlA+irbcWRsJMyqL1l6PYs/FQfa/Br7QWM+z8q00qWEi2qm9e9+
 QtUBWjbelTsXF9UzEUczSR5pczWrzeUp68TlfbPiAXcgaKTqh5lmZW/Wj2CZfxTYugwD
 nkvcekMETgwhY75+qzBsr/8cUZVoFX5aMOmXsm5HApBnoKti6pUrhKBWsxWzsqWZWSeZ
 jzIjpO8tE7hv3SquCZnVhnd9yeG2seCK3hoWzqE07jIb5b1g1R8O1MSc2rRbQDPUTTjx
 LNMSSVwdm2Wa7uRDE6OpEY7FXS5cn0Y7VnrE7K6d5EoPH5trFNAavYXV88KuACEN/hDu
 Xxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BAazOSlHODn/RLqyRZFDRSz7qBNym5lMq4crWCGPcmA=;
 b=Qi6Gq7MKTzLlejdAyAxN4kxG9WI9+0Ai16VhJpJb+EZTM9dQGV/Fm1bVKXDCooJqoA
 zfLL8PXrCcEGG0DQpF6S3/U9bp+u7lFaX3JSuCxZ5jdxby98Kdnwb8JMrymonGnPLZf5
 Ggf+qjQ9DdVnW5fcABmuRVeJIxI6MtAFlvGZELLjthUK6wEbDOqZJibA4OLH6Df1Pc5B
 3FiSjQKm6v5lTcScBTGNiJtvgBlwGRdhZQImn18QRc5DDnuAaTPk9BbFA6bM9t9E8Iam
 81ZlQKrv69Bhv8hVCCIFElRgDFMjqXzfdkveQzQ+K51siouLa60PSkWhvsF/FWPsLpDb
 FJXg==
X-Gm-Message-State: AOAM532ccxnyoNEaPxiGrAlA7Kdkb9z+eOgugTVWRA1supOgRIoA8846
 MCvLDT2zuK+69rd1Ue9Ri93FqQ==
X-Google-Smtp-Source: ABdhPJwnNM4TO5M4jWkP0ixkVTdSshTaeA6l9DACLHZadKuQTze2Iqgn6jiM0BHhCl60BrVQnONnEg==
X-Received: by 2002:a17:902:d2d1:b0:14f:cd2d:743d with SMTP id
 n17-20020a170902d2d100b0014fcd2d743dmr26655840plc.73.1646158770360; 
 Tue, 01 Mar 2022 10:19:30 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q194-20020a6275cb000000b004f396541cecsm16882322pfc.155.2022.03.01.10.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 10:19:29 -0800 (PST)
Message-ID: <ff3811be-4be7-e4e0-d269-ee5a7db0e997@linaro.org>
Date: Tue, 1 Mar 2022 08:19:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/tcg/s390x: Fix the exrl-trt* tests with Clang
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
References: <20220301092431.1448419-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301092431.1448419-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 23:24, Thomas Huth wrote:
> The exrl-trt* tests use two pre-initialized variables for the
> results of the assembly code:
> 
>      uint64_t r1 = 0xffffffffffffffffull;
>      uint64_t r2 = 0xffffffffffffffffull;
> 
> But then the assembly code copies over the full contents
> of the register into the output variable, without taking
> care of this pre-initialized values:
> 
>          "    lgr %[r1],%%r1\n"
>          "    lgr %[r2],%%r2\n"
> 
> The code then finally compares the register contents to
> a value that apparently depends on the pre-initialized values:
> 
>      if (r2 != 0xffffffffffffffaaull) {
>          write(1, "bad r2\n", 7);
>          return 1;
>      }
> 
> This all works with GCC, since the 0xffffffffffffffff got into
> the r2 register there by accident, but it fails completely with
> Clang.
> 
> Let's fix this by declaring the r1 and r2 variables as proper
> register variables instead, so the pre-initialized values get
> correctly passed into the inline assembly code.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   tests/tcg/s390x/exrl-trt.c  | 8 +++-----
>   tests/tcg/s390x/exrl-trtr.c | 8 +++-----
>   2 files changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

