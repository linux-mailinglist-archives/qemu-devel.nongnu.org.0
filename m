Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F3839CB71
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:21:13 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpefI-0004CA-Bz
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeeE-0003LP-HV
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:20:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeeB-0001it-L6
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:20:06 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so697748pjb.1
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pdXjljtdkByoyL+Llw8CXo3LgFSrDw9P4B0jFH0zp8s=;
 b=Sf2qI/C+z1qrrcIFb7yO5N5TtWGCCzGAz0qZWjzVxDNCW3j/qZekaLhmowMrTVgQnA
 hO/Kgj3Zb9LYNSWUMDq5aMfpf/dZgrAlKal3H4j46WttUdh8yIZ0sIy7/u4kz7hQ1J1p
 54B0HS17ZetxqArq3YOkeDpZue+KP7WSOvwxGOnrcuFglMudpFCpmZyUiOg/5F+aT8Kx
 qeVT/jrGRDmAB3RDlxBq84mpVlYS46qIN3prgsPQHrchRb7Dz1o+x2ClPX+S4ImhqnSB
 YlZiwpzLzUGHDWvDp5TqLeUsye8hgugk2mUcR0i5r9osseIPeNtQSHJSnFiTLBhfb6JK
 npAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pdXjljtdkByoyL+Llw8CXo3LgFSrDw9P4B0jFH0zp8s=;
 b=Yk9hp9rDRsw2aJH3+o62yCVxAKFuRFFqLa9jFG1Tvno/xA1FC+KGIhCIaYlsI+WZKN
 N3qdChowA/3hPcdqLe26+aX39YRr0eQjQ802Skw0IUlTAqoA+rVW3EcO1P/iEeqFPk4J
 MNnDt5nhfVS8GOP3IgfRVyLnqodRs91J3IQeRRno9jRFUcRWgRV4nfJFdNnXblFq8c5m
 3ay+Xe1YuppP3hP/pJFSXQDGlVZj1ut42hjzIO7FYzyNhIQpKaxwueAq+/BOSpjRBd2Q
 PQe657Ff3JLfZmlfs8s8cDDChMZieguT+zkHSvpDjmYGaOXaNT73wCVX3nLegPeZrXSx
 z+kw==
X-Gm-Message-State: AOAM531urLUwfChM7MyD1nTGwdr/Uzz48/X2sE0WvZ4C+kUFPaU8nmc9
 7hfXRiGc48WVs5BIPPoDyE24/g==
X-Google-Smtp-Source: ABdhPJwtTg6+lMWYOK+lwK0BLWdu1W8cyi2DFrsNMMiJjCCWSyw6lb/v8DAUrlwPtASn8Ec8tcjMWg==
X-Received: by 2002:a17:90a:1b64:: with SMTP id
 q91mr11951058pjq.184.1622931601967; 
 Sat, 05 Jun 2021 15:20:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 fu21sm7832703pjb.38.2021.06.05.15.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:20:01 -0700 (PDT)
Subject: Re: [PATCH v16 89/99] target/arm: cpu64: some final cleanup on
 aarch64_cpu_finalize_features
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-90-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e628d4a1-9870-bf52-9ae4-c526d31cea80@linaro.org>
Date: Sat, 5 Jun 2021 15:20:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-90-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> bail out immediately if ARM_FEATURE_AARCH64 is not set,
> and add an else statement when checking for accelerators.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu64.c | 33 ++++++++++++++++-----------------
>   1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 3058e2c273..ecce8c4308 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -473,26 +473,25 @@ void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>   {
>       Error *local_err = NULL;
>   
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        if (!cpu_sve_finalize_features(cpu, &local_err)) {
> +    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        return;
> +    }

I'm not sure this is correct, either before or after.
What about nonsensical combinations such as

   -cpu max,aarch64=off,sve-vq-max=4

Don't we want cpu_sve_finalize_features and friends to produce an error about 
enabling sve without aarch64.

r~

