Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F159B392865
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:21:09 +0200 (CEST)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAKL-0003HX-2w
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmAFg-0005EZ-AJ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:16:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmAFe-0006ng-Ol
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:16:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so1939853wmq.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xWxySbTn0zYlY+1w0sZtrFbF4JqhnTXRZFmHIQAJlrA=;
 b=K4yPXqJRu+IG87MYz4YsxdRHrcl/WwOlLpS0D5WXprwx+EXnVkzEJoqcWE5YvjkBMj
 s7Cdu4IwPFMAMiTLdt2pUYZacL4yIOHNS3pQ/3/pLRbCuLbpwEWchZ/jn9cbZ9CsAvDx
 OHHBz26EPxzcOACLmWRwjmIDH5FjpRrkhzO+VrhmxrpdT2iEahKXjwGXP+adY0dwoNg9
 Bf9RDRKtkzUdOiugXnraLOLTc2rkfwswAsA0eOwEqCqxnRVHYjXdgO49ZiDW8StvoCFz
 dSmkb0uBaAaTxAf0TGkgjLlxhXug02P9MuyQ6KlxoNIatN7E64tJADLkmnIrREnNwv4U
 6ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xWxySbTn0zYlY+1w0sZtrFbF4JqhnTXRZFmHIQAJlrA=;
 b=ZSQqMGxEisExdyl7lW2qf2DepPSNwwI6Yob+Jsba8+jh310+OEjXHGe/P+/z5xyHSa
 5oLsM7RC8iqvWU8IoeO1+6dwvm3ccCyC/Hh7l3ELPru4if99jqehiL8j3A+KiElTaEBk
 wrz1x2c9/XiZuf4iFqWJ80VfBLhv5QGUZk4W5YdBnD6bwxVrOr6r6kh6wDrQe3mzawGX
 wUfylWhZtpY9I7kKkFIDtp6OJfY1xzFEPYSxZEIsPf3dFYX37qihnJLx5a2RIsMzrvBe
 jQGn3W9wyGr1iTmFYf3WyEZoYherjuNDUuelsT9/PmeJt7IU4Upm0cTvLa2A9jAC8LRG
 TGhQ==
X-Gm-Message-State: AOAM532jrW8sEubzpBI7Y/5iUOFfr6+6YFnrO5VyHbMElQqCH14CcrIg
 L047To9WCvLXO31h7+/4UCQ=
X-Google-Smtp-Source: ABdhPJwIdL/VGcPifLjJL0dkR9X2TyKYc4dw5yYE4k51qa8kDrDLlsNbVqT+SVYKEu7UfT+W3NEo7Q==
X-Received: by 2002:a05:600c:3043:: with SMTP id
 n3mr1944218wmh.98.1622099776918; 
 Thu, 27 May 2021 00:16:16 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id f20sm1991415wmh.41.2021.05.27.00.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 00:16:16 -0700 (PDT)
Subject: Re: [PULL 19/19] gitlab: Split gprof-gcov job
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20210526211838.421716-1-f4bug@amsat.org>
 <20210526211838.421716-20-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2e98dd32-166a-9a22-9c64-2970def4dbb8@amsat.org>
Date: Thu, 27 May 2021 09:16:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526211838.421716-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 11:18 PM, Philippe Mathieu-Daudé wrote:
> This job is hitting the 70min limit, so split it in 2 tasks.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Message-Id: <20210525082556.4011380-7-f4bug@amsat.org>
> ---
>  .gitlab-ci.d/buildtest.yml | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 807040c1c71..7bfbfab8f20 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -558,16 +558,27 @@ check-deprecated:
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
>  
> 

This patch was not supposed to be in this pull request. Since
the request hasn't been processed, I pushed an updated tag with
this patch removed.

