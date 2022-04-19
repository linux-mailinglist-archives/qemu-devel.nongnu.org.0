Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2F5079CF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:08:02 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtCi-0001gZ-VR
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngt9R-000095-9b
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:04:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngt9P-0005cH-JD
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:04:36 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso2796337pjv.0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6MsFqzV/47KUGQn2pX5nypWzhNzyzK05R37wt2Po+9k=;
 b=iUkoVqLbmzzZ18YG6vRP5jvycjDXDShdctiLdd/OX0rBTmA8fzhvPB8tz84Jp1muab
 rZIZSyj978rJ34ger4g/RFLBLJ08kXYGXFLGmiVpM7U4+xEEg2//JZa9nA3N3cem9oIw
 omQHVEqVDDp3okRZWUtn5SYd/IyNIFT3GTGTqEX5OR9N6XGJ5Vky2HsD3PBWnxEAVcDa
 u7PZoyjQziN+BZEUoW05q0WsmD+6Rd9dCzUxNtrGgXEHjxoTImJZy3NPWfbgsW/mp+w7
 Bp8dTR6udKl9rcNztw3+9MGQnwBtSoFdvIdAlcq4vN+jJ7igc5Pq9EcjpyU+t36igUzZ
 NXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6MsFqzV/47KUGQn2pX5nypWzhNzyzK05R37wt2Po+9k=;
 b=tvU7dHIsk1yLmpK75r2CwrQXJVPKLBgv0TzrsSult2/gKbGbclwaDeyU+ock3xxQcT
 lwJjtxqWEdYXaYbXmmZr0OBzOkYslM2w4vMNsFPf5vUtluDFJuSelZxqiD9k/BVgAbUu
 QoIUh1rGUa9iedvDvYyrqf221VxuY8agXU7by7qJQEPOp/qoyjx1yaiNwxg7pOcVoeZ5
 6sBDtZnBe1Z8NWsf8inIQJWRX0NSMmK29X7nKOtrfIddUt2ZAyf9U8Sfr7DC2fMAm976
 XUW1mf97AYqaD0KVHPZdkT7NGFEv87UttyUQ4sxJ4YZBvVTvk9HbZe+0PPcbnp8Canh+
 saww==
X-Gm-Message-State: AOAM5331IxMM3RcQJbNuLg82estRqJZbbCFgnaksH1s/LIeushRAdWci
 Z5w22QPwlXNaVt5BQbuDAY/CPw==
X-Google-Smtp-Source: ABdhPJyd5Ns4vu5ANySCMfNYnm4pL7SOoNJnLYK66L6ZQcVrgjhGuf8Iv8O32UcarsntHdOfgOIeSA==
X-Received: by 2002:a17:902:e841:b0:158:f139:29df with SMTP id
 t1-20020a170902e84100b00158f13929dfmr15329474plg.82.1650395073553; 
 Tue, 19 Apr 2022 12:04:33 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a637e10000000b00382b21c6b0bsm17489018pgc.51.2022.04.19.12.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:04:32 -0700 (PDT)
Message-ID: <a11e40d8-4a10-509b-89c9-c9851e74df7f@linaro.org>
Date: Tue, 19 Apr 2022 12:04:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 17/25] tests/tcg: invoke Makefile.target directly from
 QEMU's makefile
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Build the "docker.py cc" invocation directly in tests/tcg/configure.sh, and
> remove the Makefile.qemu wrapper around Makefile.target.  The config-*.mak
> files now include the actual variables used when building the tests, rather
> than the CROSS_* variables that Makefile.qemu used to "translate".
> 
> This is a first step towards generalizing the cross-compilation infrastructure
> so that it can be used for firmware as well.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-15-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/Makefile.include    |  40 +++++++-------
>   tests/tcg/Makefile.qemu   | 110 --------------------------------------
>   tests/tcg/Makefile.target |   3 +-
>   tests/tcg/configure.sh    |  28 +++++-----
>   4 files changed, 35 insertions(+), 146 deletions(-)
>   delete mode 100644 tests/tcg/Makefile.qemu

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

