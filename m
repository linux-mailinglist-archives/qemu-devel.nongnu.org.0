Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7008E67B2C3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 13:52:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKeeq-00038k-Ct; Wed, 25 Jan 2023 07:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKeel-00038F-W9
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:13:36 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKeek-0007ts-Cv
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:13:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id q8so13583553wmo.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 04:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sShDAfh4wCk++nUzxpx2MlGatfM5sHj3Ubi3Xsma1Vw=;
 b=XtpHSS79z27Y3+hBIyUrX9JQjbp6BtvJXF7sD+bbgzHrO8czO4BHpbbkqQiZUIkua0
 fJR22bPZlA3v8u534DCN/9ZRY6aBJXgfWryU6ygghfET3OYR3yadR9tFldL4EGQVH/fH
 thDX4oR38Wm3S+BCd9CaoM5riTOmj/rSjIntTVjICNGQ7H9oAXiMtoEwX/2X5j9eDxaZ
 Pq5Iq9U3uAyBO4tobFPOYSlobkNzqZrZo0KTwUZSZMTHONtPmLpnqmVIIp38R6HhUWDo
 mLgP2RZth1JNeLHdJch1gmSC7qJaE+GhbKYnFw7uIrr0VXunwpYrM19M2438diKsK2+k
 VdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sShDAfh4wCk++nUzxpx2MlGatfM5sHj3Ubi3Xsma1Vw=;
 b=lFhy3BpchMLbExCb6Agi+L27JJAS2k++l9UtYv/C84SjIl+e5JgoQ9h2gyxguSEni1
 59qSA39Oi4zbjB2QLhq4z/AYefnsDsJlVrYGhcoQYg1yH/rWZh8bLrHBNbMzkbxqXqu2
 AYDRQQFGQt4Pm2iP2r5zXVwwGWXp2gd/kUDSIMbwOUsIRCoPVs38Xk9liLNBtDrCR1tf
 501/5VdmV/c/VmiuLP0ACUz4ZEUAwT4GqpZYCfCOxBDDFIAWk7a7thzZ0VdDw6miwCpW
 vaKCNwQh5D0aPRJwzaTEdIPs0CmloI1yrj0lMcDmbtMNKYXgpkBRhZDxMn5Uw3Fj4R3Q
 xt0Q==
X-Gm-Message-State: AFqh2krtNkHTlykD20hzzgX5Xiiud7ssbsnjJ3t49s+ojZRAKFwoaSoW
 u/bcupgEo94tv1dgwT1LKW8Agg==
X-Google-Smtp-Source: AMrXdXtq+OysoLRemTlkKJvxDO7oSbjpYDp31s8jXUKLHHXw/pVvrHi4L9YtJo9WyhtBPJQsS2HZyg==
X-Received: by 2002:a1c:cc11:0:b0:3da:1d52:26b5 with SMTP id
 h17-20020a1ccc11000000b003da1d5226b5mr39203445wmb.14.1674648812677; 
 Wed, 25 Jan 2023 04:13:32 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 bi24-20020a05600c3d9800b003d1d5a83b2esm1638781wmb.35.2023.01.25.04.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:13:32 -0800 (PST)
Message-ID: <ff816fa5-3f81-f1c7-7712-8d35c82c8b9b@linaro.org>
Date: Wed, 25 Jan 2023 13:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/35] gitlab: add lsan suppression file to workaround
 tcmalloc issues
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/1/23 19:01, Alex Bennée wrote:
> The up-coming upgrade to Fedora 37 will bring in libtcmalloc as a
> dependency of libglusterfs which confuses our fuzz run. Rather than
> disable the build lets use LSAN's suppression mechanism to prevent the
> job from failing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml             | 1 +
>   scripts/oss-fuzz/lsan_suppressions.txt | 2 ++
>   2 files changed, 3 insertions(+)
>   create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index f09a898c3e..9a6ba1fe3b 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -511,6 +511,7 @@ build-oss-fuzz:
>       IMAGE: fedora
>     script:
>       - mkdir build-oss-fuzz
> +    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
>       - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
>         ./scripts/oss-fuzz/build.sh
>       - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
> diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
> new file mode 100644
> index 0000000000..02ec0a6ed5
> --- /dev/null
> +++ b/scripts/oss-fuzz/lsan_suppressions.txt
> @@ -0,0 +1,2 @@
> +# The tcmalloc on Fedora37 confuses things
> +leak:/lib64/libtcmalloc_minimal.so.4

Maybe add a comment around Fedora37 in tests/lcitool/libvirt-ci
in the next patch "see workaround in scripts/oss-fuzz/lsan_suppressions.txt"
so we remember to remove it when updating again?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


