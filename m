Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1954A1C1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:49:46 +0200 (CEST)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0rwP-0007Pd-2K
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0rtn-0005Sf-7o
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:47:03 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0rtl-0004Jq-9e
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:47:02 -0400
Received: by mail-pg1-x535.google.com with SMTP id 31so5094595pgv.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G1KZ0JEdaXFgl8XGHFw55D6LofRxuNcGCy+bynPrcxw=;
 b=BJTU/VBOTqu9YYAljwOFCtTMj4r5FraPlON8JOrxsIjkMs638Qk9s+5JuZqU6rytgi
 xxFWBzjC7z8K/UrFr7QvQywBUx4UUGD+nvwLYsPDkjpKZeSAUXJU+xfZml6mhGBRsDIV
 4EI5V3LR4EsYTP8MHgntjoCbb/d5xH3fH+dK694vwg5ZNlpLTV8czRRYMmyGfwSjctc/
 ct8sfXfkCpBWSAROCRdPp8HTNKpuLmtwZokYRweYae+QkH9XNWM+bPpH8EjD0/Qpyw4p
 E87rBGhoNzy+l5XfNaJE/SvC3ed1VcbVwYBOZfBpbh7Df7cT3iehBJy3NvqY5ba0O/2/
 Hw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G1KZ0JEdaXFgl8XGHFw55D6LofRxuNcGCy+bynPrcxw=;
 b=ODWfeYc05rud+QWPUB43mW2ZUFg6I/uPwV89G3UJ1I22zF+aA4xFPEGyH71wFKcxTw
 wmHhSs647ppF3ImiwTfABFn0634o/SMLr1qGBZwvQpE3sAlW55t0Mp0FOthAscfUFrN0
 tPpVRtjbzcICtG/YMu4nfP15lqpxEzucWJdq4XsfK+b+nIHXhgDq7nnf+bSXCNn1YL8V
 8qARj7p7fBb+HCJ0zdFVpmRgCV4mZ6GN6WzrvgIkSgl/ILPi5oaDfRYVrF/hTmdDHXTM
 Z3pqKQZ8vlaSS+iOwaVtxYHtTTjHoB/xRxAwg8Y4MJbTUMeT+7BHSV3QhGdRa7HbOeYz
 U4uQ==
X-Gm-Message-State: AOAM53046icJhLcfn5JZNKgLW1kEepgIIfbbVN81dofQ2aEmEoSjncFw
 vCy7QniL5ghymOR7XD/tI0Eq9A==
X-Google-Smtp-Source: ABdhPJyu8nMKMCmNz5zJMabL1VnhB6xJUkrHv6XkGCmFcJzIEnuqbUPDT/IQqWzKatpeB7VVc9oqtg==
X-Received: by 2002:a63:e0e:0:b0:402:8549:78fc with SMTP id
 d14-20020a630e0e000000b00402854978fcmr1532820pgl.110.1655156819547; 
 Mon, 13 Jun 2022 14:46:59 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 x14-20020aa7918e000000b0051c0fe8fb8csm6058991pfa.95.2022.06.13.14.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 14:46:59 -0700 (PDT)
Message-ID: <39615b6d-6454-2a4f-013e-478766e0c3f8@linaro.org>
Date: Mon, 13 Jun 2022 14:46:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 3/7] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220613171258.1905715-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/22 10:12, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The job definitions recently got a second "variables:" section by
> accident and thus are failing now if one tries to run them. Merge
> the two sections into one again to fix the issue.
> 
> And while we're at it, bump the timeout here (70 minutes are currently
> not enough for the aarch64 job). The jobs are marked as manual anyway,
> so if the user starts them, they want to see their result for sure and
> then it's annoying if the job timeouts too early.
> 
> Fixes: e312d1fdbb ("gitlab: convert build/container jobs to .base_job_template")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220603124809.70794-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 544385f5be..cb7cad44b5 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -357,16 +357,15 @@ build-cfi-aarch64:
>         --enable-safe-stack --enable-slirp=git
>       TARGETS: aarch64-softmmu
>       MAKE_CHECK_ARGS: check-build
> -  timeout: 70m
> -  artifacts:
> -    expire_in: 2 days
> -    paths:
> -      - build
> -  variables:
>       # FIXME: This job is often failing, likely due to out-of-memory problems in
>       # the constrained containers of the shared runners. Thus this is marked as
>       # skipped until the situation has been solved.
>       QEMU_JOB_SKIPPED: 1
> +  timeout: 90m
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build

FWIW, 90 minutes was close, but insufficient:

https://gitlab.com/qemu-project/qemu/-/jobs/2584472225

But certainly, let us fix the job definition:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

