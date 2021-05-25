Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9938FEFA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:23:32 +0200 (CEST)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUDj-0000Q2-Sc
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llUCB-0007vA-JO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:21:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llUCA-0006Oe-0X
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:21:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so12510631wmh.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lns1dTanZjw7zjwcosrUb88/ZfH1Yf++pI6xK2cJYWw=;
 b=gpv1UmRGWna5d83wtOarMcD9/cJwa6AOq4vNu+jb2yIpnU4lCx1V2QUmSZhXRpWasx
 kRVY5yTPpazxby2xKe27Z4fKww3V+nGjodv1os9vf+XrC2bRgm3s103K2+M9bBDU39IP
 KGxQ1sfnwiocsGEWUSgRKqL2qcu3pvB/f3m1I/hGDbinp1rlmz4jUa887+YF/b4WDiwS
 Zjin+RTJAkOahDa4FDMPaAQfre36RvShqa7eaN/9CVyGMDf8VZONynJQW2B3cnSf226a
 7N6ofnLFvdU5ejaDto9XXZBsQ58lgFIsDDfbueV1K8m7w0NV1xjr4EmCoVOhTRN72+M9
 gdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lns1dTanZjw7zjwcosrUb88/ZfH1Yf++pI6xK2cJYWw=;
 b=mjLpz43wswFsNM8WKwxk1bQR7rptKSUlL90603Cp14AlVwulpIkkS0tpX312Uts/MR
 7fQ1z5ANlsKmvaHBd6YfUTX8O6li5k/djS7WqiFiJu6zpMtGiyM01g6cxEeziB1lGp3b
 h0XMvkumJYEDqIVNtF00QWhl3xkza7AEpCxuN1rwVA3F66bK3ygNxoPyH/aRxGg2WkDH
 +n5Rvp/nbMEV1AIvK1jH3oZqY3jSY/B1NFVP9KNQlXm3uYVO+btubFD/4GU5tYRa6Wf8
 BGtr9UOMDtdzou2uzgc/Q5ammWhNSMxj0wgNvlL77331ZA63QhKHSKYKIADixGnvFKLm
 sdZA==
X-Gm-Message-State: AOAM532hYu30ugNo7VFMDsOeW8mgcoK7XU6ryKZZQ/nbPg+HIrl56X10
 6ksoGfTJfC+6nfeMYFOnj64=
X-Google-Smtp-Source: ABdhPJyna6lOXI6iDioJCcibRkIi0Z6127499ZFUrVcTXrLZmxUiMhAKEmsIfSZuNQ21X/vsMTdzWQ==
X-Received: by 2002:a1c:1f84:: with SMTP id
 f126mr22990260wmf.140.1621938112570; 
 Tue, 25 May 2021 03:21:52 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k11sm2221199wmj.1.2021.05.25.03.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 03:21:52 -0700 (PDT)
Subject: Re: [PATCH 6/9] gitlab-ci: Split gprof-gcov job
To: qemu-devel@nongnu.org
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-7-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8c74e90e-ed4c-9e96-cf87-c0c413e48eaa@amsat.org>
Date: Tue, 25 May 2021 12:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525082556.4011380-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 10:25 AM, Philippe Mathieu-Daudé wrote:
> This job is hitting the 70min limit, so split it in 2 tasks.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index f903fdea3f4..894732e203d 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -564,16 +564,27 @@ check-deprecated:
>    allow_failure: true
>  
>  # gprof/gcov are GCC features
> -gprof-gcov:
> +build-gprof-gcov:
>    extends: .native_build_job_template
>    needs:
>      job: amd64-ubuntu2004-container
>    variables:
>      IMAGE: ubuntu2004
>      CONFIGURE_ARGS: --enable-gprof --enable-gcov
> -    MAKE_CHECK_ARGS: check
>      TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
> -  timeout: 70m
> +  artifacts:
> +    expire_in: 1 days
> +    paths:
> +      - build

FYI this job takes 28min:
https://gitlab.com/philmd/qemu/-/jobs/1290778672

> +
> +check-gprof-gcov:
> +  extends: .native_test_job_template
> +  needs:
> +    - job: build-gprof-gcov
> +      artifacts: true
> +  variables:
> +    IMAGE: ubuntu2004
> +    MAKE_CHECK_ARGS: check
>    after_script:
>      - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh

and this one 23min:
https://gitlab.com/philmd/qemu/-/jobs/1290778751

