Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342B39CB9C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 01:05:12 +0200 (CEST)
Received: from localhost ([::1]:44574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpfLr-0001ta-GG
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 19:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfKo-0000x0-8C
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:04:06 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfKk-0004kE-DS
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:04:05 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i5so10894431pgm.0
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 16:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yJyFbyBuFIKXpYw87hfnixnmy7+R6XNlootTr69lAME=;
 b=dh00gPK7rTIr30jv/mN+Q3np2e8cYbQMqLepkqlqgP7Rf2dmrP0MCxmb+Ja+/MHXbl
 ryCKU1KyFXscJYv+QEYsrZmiHIX8SB1oSKzCgKf1CUrKH4frImdxN8VDCzLJgiblemAv
 2YM2+DnBEmrIx/GWmD5I8vDVUYFcr/F3sVuXyU0DMWLaNB35BEpzKuG/Ns/lRKe4c90D
 iN9DnYCqCoWlti/4ARvoDi/qnpUEC2hf3rlgBPmXfinr7qS6FEEmtjR2viQWKwXDujLE
 AMzWYpK1NgEB6RbLq+chXJryl5fO5z1IkWtYiwyGictab3c6FLNHlg8XnI6M/SynXivY
 S5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJyFbyBuFIKXpYw87hfnixnmy7+R6XNlootTr69lAME=;
 b=P/B7eTjd4wZWEtKXE85lRkgpNm2PW1mDdqhqRqBd/Dae5skwfz6JgUSQUknX8a/lMw
 W8/fBHCY0/enTKlUhKHPVWE9h7LngyXlyt8YXoUjwu4NUAZV0pNEgGjUNpe1vwsbiKKL
 /KyhvUV2i8JOPdyrT+ueeqz6Zd9UviU2OlpbeEr4WQftFGlYXHNUn54tlJ24aNDI+zUA
 hMHT41FpReEBfMVIX3LBT8UVn7kryff8ZdeUBdZVREN9TLKWdmRiLgLkKN54yS7CianI
 MEIgu0StfFqDShOSDm1yWUcgjjQIO0pcrId97PIVY3nX25OGrb9NclfKnTE+dDtbC2CO
 ezVw==
X-Gm-Message-State: AOAM532ExFukAE8mBR9ahGiVGVk22nsW7z7Eq0juhaD5CcERTQ3AOfsb
 IbmCIfSwqWc+M4Ikl+75SUlk+A==
X-Google-Smtp-Source: ABdhPJwt5xj5F2KmodsKcbQGIW87MWHIYZ7E7UbqLo2SkIvlG0DaPY2MVN57WjzODjthgDZFzHyE4g==
X-Received: by 2002:a65:6884:: with SMTP id e4mr11364060pgt.71.1622934240838; 
 Sat, 05 Jun 2021 16:04:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s21sm4620501pfw.57.2021.06.05.16.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 16:04:00 -0700 (PDT)
Subject: Re: [PATCH v16 99/99] gitlab: defend the new stripped down arm64
 configs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-100-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <823cd2c0-6412-4a76-588e-720be9a24bd7@linaro.org>
Date: Sat, 5 Jun 2021 16:03:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-100-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> We can now build a KVM only aarch64-softmmu image which we need to
> cross build. We can also build a version that only supports a limited
> set of 64 bit images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml   | 10 ++++++++++
>   .gitlab-ci.d/crossbuilds.yml |  9 +++++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index b72c57e4df..a48e723efe 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -645,6 +645,16 @@ build-without-default-features:
>           --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
>       MAKE_CHECK_ARGS: check-unit
>   
> +build-64bit-only-aarch64-softmmu:
> +  extends: .native_build_job_template
> +  needs:
> +    job: amd64-debian-container
> +  variables:
> +    IMAGE: debian-amd64
> +    TARGETS: aarch64-softmmu
> +    CONFIGURE_ARGS: --with-devices-aarch64=../configs/aarch64-softmmu/64bit-only.mak
> +    MAKE_CHECK_ARGS: check
> +
>   build-libvhost-user:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 6b3865c9e8..a118aa3052 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -36,6 +36,15 @@ cross-arm64-system:
>     variables:
>       IMAGE: debian-arm64-cross
>   
> +cross-arm64-kvm-only-system:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: arm64-debian-cross-container
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    ACCEL: kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg
> +

Any reason not to merge these two?  And use virt-only, which as I mentioned is 
a useful kvm-only configuration.


r~

